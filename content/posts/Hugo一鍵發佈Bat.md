---
title: "Hugo一鍵發佈Bat"
date: 2020-12-06T00:02:58+08:00
draft: false
weight: 1
# aliases: ["/link"] # 頁面跳轉
tags: ["untags"]
categories: ["uncategories"]
author: "Yayapipi"
valuetype: "tech"
# author: ["Me", "You"] # multiple authors
showToc: false
TocOpen: false
hidemeta: false
disableShare: true
cover:
    image: "<img link>"
    alt: "<alt text>"
    caption: "<text>"
    relative: false
comments: false
---

快速生成新文章：

```bat
@echo off
set /p id="Enter Article Name: "
hugo new %id%
echo %id% is created
pause
```

一鍵部署發佈：

```bat
@echo off
set /p commit="Enter Commit Value: "
hugo
cd public
git add .
git commit -m "%commit%"
git push -u origin master
echo Commit Pushed
pause
```


一鍵發佈Root Project:
```bat
@echo off
git status
set /p commit="Enter Commit Value: "
git add .
git rm --cached public -f
git commit -m "%commit%"
git push -u origin master
echo Commit Pushed
pause
```