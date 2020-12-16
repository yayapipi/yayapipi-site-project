---
title: "Hugo加上不間斷的背景音樂"
date: 2020-12-16T11:10:06+08:00
draft: false
weight: 1
# aliases: ["/link"] # 頁面跳轉
tags: ["untags"]
author: "Yayapipi"
#文章類型  [game, app, web, story, art, unknown, tech, develop, share, review]
valuetype: "share" 
# author: ["Me", "You"] # multiple authors
showToc: false
TocOpen: false
hidemeta: false
disableShare: true
meta:
    show_summary: true
    show_cover: true
    show_meta: true
    summary: ""
cover:
    image: "cover_dark.png"
    alt: "<alt text>"
    caption: "<text>"
    relative: false
comments: false
---
Hugo 加上不間斷的背景音樂插件
---
想法：
點擊按鈕啓動之後，插入Iframe頁面，讓網頁跳轉的時候音樂也不會停止播放。

1. 首先在Themes/layout中新增music.html的頁面

```html
{{- define "main" }}
    <style type="text/css">
      #mainFrame {
    position: fixed;
    background: #000;
    border: none;
    top: 0; right: 0;
    bottom: 0; left: 0;
    width: 100%;
    height: 100%;
    }
      #mainClose {
    position: fixed;
    background: #000;
    border: none;
    top: 2; right: 0;
    bottom: 0; left: 0;
    width: 10%;
    height: 3%;
    }
    </style>
    <iframe src="{{.Site.BaseURL}}" id="mainFrame"></iframe>
    <iframe src="{{.Site.BaseURL}}sunnyroad.mp3" allow="autoplay" id="mainMusic"></iframe> 
    <a href="{{.Site.BaseURL}}" id="mainClose">Close Music</a>
{{- end  }}
{{/* end main */}}

```

2. 在content裏新增一個music.md，讓頁面指到剛剛寫的music.html
```md
---
title: "Music"
layout: "music"
url: "/music/"
summary: music page
---
```

3. 在header上加一個簡單的按鈕跳轉到Music

```html
 <a href="{{.Site.BaseURL}}music">Music</a>
```

這樣就好了~