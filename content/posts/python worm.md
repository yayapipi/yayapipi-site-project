---
title: 使用PYTHON實作抓取博客來圖書資料"
date: 2020-09-15T11:30:03+00:00
weight: 1
aliases: ["/first"]
tags: ["first"]
categories: ["new"]
author: "Me"
# author: ["Me", "You"] # multiple authors
showToc: false
TocOpen: false
draft: false
hidemeta: false
disableShare: false
cover:
    image: "https://yayapipi.com/wp-content/uploads/2019/08/getdata.png"
    alt: "<alt text>"
    caption: "<text>"
    relative: false
comments: false
---
在這個網絡世界資訊爆棚的時代，我們常常需要抓取網站上面的各種資料進行處理，因為最近在寫一個可以記錄你讀過多少本書的網站，所以今天我們就要來試試看使用Python 的Beautiful Soup來抓取博客來上面的圖書資料！

準備工具:
1. 安裝好Python的環境
2. 安裝BeautifulSoup4 
	<code>pip install beautifulsoup4</code>

我們可以看到頁面上提供了很多我們要提取的資訊，現在我們要透過CMD進行關鍵字的搜尋，然後抓取搜尋界面的資訊，我們要抓的資訊有書本的照片，標題，和對應跳轉網址，抓到網址之後，我們會進去網址裡面繼續抓更多的資訊

我們先來看看搜尋界面的代碼：
```python
import requests
import sys
from bs4 import BeautifulSoupr = requests.get(‘https://search.books.com.tw/search/query/key/’+sys.argv[1])
if r.status_code == requests.codes.ok:
# 以 BeautifulSoup 解析 HTML 程式碼
soup = BeautifulSoup(r.text, ‘html.parser’)
#print(soup.prettify()) 這是把抓取的HTML美化列印出來
# 抓出搜尋到的所有資料
stories = soup.find_all(‘a’,rel=’mid_image’)
for s in stories:

#抓出書名
print(“標題：” + s.get(‘title’))

#抓出對應的網址
href_cut_start = ‘item/’
href_cut_end = ‘/page/’
href = s.get(‘href’)
href = href[href.index(href_cut_start)+len(href_cut_start):href.index(href_cut_end)]
print(“網址：” + href)

image = soup.find_all(‘img’,class_=’itemcov’)
for i in image:
#抓取圖片的網址
image_cut_start = ‘getImage?i=’
image_cut_end = ‘&’
image_start_pos = i.get(‘data-original’).index(image_cut_start)
image_end_pos = i.get(‘data-original’).index(image_cut_end)
image = i.get(‘data-original’)[image_start_pos+len(image_cut_start):image_end_pos]
print(image)
```

現在我們來實作讀取圖書頁面的代碼：

```python
import requests
import sys
from bs4 import BeautifulSoupr = requests.get(‘https://www.books.com.tw/products/’+sys.argv[1])
if r.status_code == requests.codes.ok:
# 以 BeautifulSoup 解析 HTML 程式碼
soup = BeautifulSoup(r.text, ‘html.parser’)
description = soup.find(attrs={“name”:”description”})[‘content’]
#print(description)

image = soup.find(attrs={“property”:”og:image”})[‘content’]
#print(image)

content = soup.find(“div”, class_=’content’)
content = content.text[:40]
#print(content)

#String Process
name_cut_start = ‘書名：’
name_cut_end = ‘，’
name_start_pos = description.index(name_cut_start)
name = description[name_start_pos+len(name_cut_start):]
name_end_pos = name.index(name_cut_end)
name = name[:name_end_pos]

isbn_cut_start = ‘ISBN：’
isbn_cut_end = ‘，’
isbn_start_pos = description.index(isbn_cut_start)
isbn = description[isbn_start_pos+len(isbn_cut_start):]
isbn_end_pos = isbn.index(isbn_cut_end)
isbn = isbn[:isbn_end_pos]

page_cut_start = ‘頁數：’
page_cut_end = ‘，’
page_start_pos = description.index(page_cut_start)
page = description[page_start_pos+len(page_cut_start):]
page_end_pos = page.index(page_cut_end)
page = page[:page_end_pos]

publisher_cut_start = ‘出版社：’
publisher_cut_end = ‘，’
publisher_start_pos = description.index(publisher_cut_start)
publisher = description[publisher_start_pos+len(publisher_cut_start):]
publisher_end_pos = publisher.index(publisher_cut_end)
publisher = publisher[:publisher_end_pos]

author_cut_start = ‘作者：’
author_cut_end = ‘，’
author_start_pos = description.index(author_cut_start)
author = description[author_start_pos+len(author_cut_start):]
author_end_pos = author.index(author_cut_end)
author = author[:author_end_pos]

publish_date_cut_start = ‘出版日期：’
publish_date_cut_end = ‘，’
publish_date_start_pos = description.index(publish_date_cut_start)
publish_date = description[publish_date_start_pos+len(publish_date_cut_start):]
publish_date_end_pos = publish_date.index(publish_date_cut_end)
publish_date = publish_date[:publish_date_end_pos]

type_cut_start = ‘類別：’
type_start_pos = description.index(type_cut_start)
types = description[type_start_pos+len(type_cut_start):]

#Get Image URL
image_cut_start = ‘getImage?i=’
image_cut_end = ‘&v’
image_start_pos = image.index(image_cut_start)
image_end_pos = image.index(image_cut_end)
image = image[image_start_pos+len(image_cut_start):image_end_pos]

#Display Content
print(name)
print(isbn)
print(page)
print(publisher)
print(author)
print(types)
print(publish_date)
print(image)
print(content)
```

本篇方法應用於Booook的新增搜尋書本中