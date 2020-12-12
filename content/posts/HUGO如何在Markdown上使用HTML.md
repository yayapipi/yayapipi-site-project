---
title: "HUGO如何在Markdown上使用HTML"
date: 2020-12-12T16:58:46+08:00
draft: false
weight: 1
# aliases: ["/link"] # 頁面跳轉
tags: ["untags"]
author: "Yayapipi"
#文章類型  [game, app, web, story, art, unknown, tech, develop, share, review]
valuetype: "tech" 
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
HUGO如何在Markdown上使用HTML
---
很神奇的Hugo無法直接渲染Markdown上的HTML代碼，當我們需要修改字體顔色，增加一些功能美化我們的文章的時候，可以使用以下方法在Markdown上面使用HTML代碼：

## 方法1：
修改Config檔案,告訴Hugo把HTML的代碼渲染出來。
在Config檔案下新增下列參數。

config.yaml:
```yaml
markup:
  goldmark:
    renderer:
      unsafe: true
```

config.toml:
```toml
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
```

config.json:
```json
{
   "markup": {
      "goldmark": {
         "renderer": {
            "unsafe": true
         }
      }
   }
}
```

## 方法2：
使用Shortcode

在layout/shortcode/裏新增新的Shortcode.html文件，這裏取名叫做codehtml.html，在裏面輸入:
```
{{.Inner}}
```

然後就可以在Markdown中使用這個Shorcode了：

```html
{{</* codehtml >}} 
  <p style='color:red;'>
    我要使用<i>HTML</i>！
  </p>
{{< /codehtml */>}}
```

顯示效果：
{{< codehtml >}}
  <p style='color:red;'>
    我要使用<i>HTML</i>！
  </p>
{{< /codehtml >}}