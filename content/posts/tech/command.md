---
title: "Hugo Command"
date: 2020-12-05T16:37:15+08:00
draft: true
tags: ["technical"]
---



---

### 建立新的網站:

```
hugo new site quickstart
```

### 新增主題：

```
cd quickstart
git init
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```
Note:記得把主題名字加入config裏面

### 新增文章：

```
hugo new posts/postnames.md
```

### 測試Server：

```
hugo server -D
```

### 發佈網站：

```
hugo -D
```
網站會發佈在 <code>./public/</code> 下
