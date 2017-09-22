## FreeSky Hexo 主题

本主题源自Hexo Next主题，经过笔者长期以来的修改，源代码中很多地方都有所变动，因此决定将其重新命名为FreeSky，目前版本为[FreeSky v0.4.0](https://github.com/csuldw/FreeSky/releases/tag/v0.4.0)。对于本主题，后续会不断在此主题上增加新的样式和功能，敬请关注。

### 使用技术

- Nodejs
- Swig

### 效果展示

链接：http://www.csuldw.com

#### 主页截图

![](./source/images/freesky-index.png)

#### article列表

![](./source/images/freesky-article.png)


### 修改历史（部分）

1.修改blockquote属性，位于source/css/_common/_core目录下的base.styl文件中

```
color:$quoto-font;
font-family: $font-family-quoto;
font-size: 15px;
```

 修改source/css/_variables/base.styl文件：

- 将quoto-font值`9E9E9E`修改为`#191515`，
- 增加$font-family-quoto	  =  Lora, Georgia, "Times New Roman", Kaiti, STKaiti, serif


2.修改mathjax

位于"layout/_scripts/mathjax.swig"文件


3.修改layout/_partials/head.swig文件

增加source\vendors\fonts-useso\目录，将fonts-useso修改为本地文件

将

```
<!--<link href='//fonts.useso.com/css?family=Lato:300,400,700,400italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'> -->
```
修改为

```
<link href='{{ url_for(theme.vendors) }}/fonts-useso/fonts-useso.css' rel='stylesheet' type='text/css'>
```

进而修改为

```
<link href='{{ url_for(theme.css) }}/fonts-useso/fonts-useso.css' rel='stylesheet' type='text/css'>
```

4.菜单栏无法显示

在source目录下新建others目录，并将vendors目录下的文件全部移到others目录下，然后修改layout目录下各个文件中包括vendors的文件，将其修改为others，同时在_config.yml文件增加“others: others”.

查找包括某个字段的文件：

```
grep -rn "vendors" *
```

5.修改归档页面文章标题格式

在layout/_macro目录下，修改archive-collapse.swg文件，将`{{ date(post.date, 'MM-DD') }}`修改为`{{ date(post.date, 'YYYY-MM-DD') }}`，同时需修改post-title样式，位于`source/css/_common/_component/post-collapse.styl`文件中，修改内容如下：

```
  .post-comments-count { display: none; }

  .post-title {
    margin-left: 60px;
    font-size: 16px;
    font-weight: normal;
    font-family: $font-family-posts;
    line-height: inherit;

    &::after {
      margin-left: 3px;
      opacity: 0.6;
    }
```

修改为

```
  .post-comments-count { display: none; }

  .post-title {
    margin-left: 95px;
    font-size: 16px;
    font-weight: normal;
    font-family: $font-family-posts;
    line-height: inherit;

    &::after {
      margin-left: 3px;
      opacity: 0.6;
    }
```


6.修改category页面

修改categories.styl文件

```
.category-all-page {
  .category-all-title { text-align: center; }

  .category-all { margin-top: 20px; }

  .category-list {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .category-list-item {
    display: inline-block;
    margin-left: 40%;
    margin-top:5px;
    margin-right:40%;

  a {
    color: $black-light;
    text-decoration: none;
    border-bottom: 1px solid $black-light;
    
    &:hover {
      color: $gray-link;
      border-bottom-color: $gray-link;
    }
    }
  }

  .category-list-count {
    color: $grey;
    &:before {
      display: inline;
      content: " ("
    }
    &:after {
      display: inline;
      content: ") "
    }
  }
}
```

更改为

```
.category-all-page {
  .category-all-title { text-align: left; margin-left:5% }

  .category-all { margin-top: 10px; }

  .category-list {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .category-list-item {
    display: inline-block;
    margin-left: 8%;
    margin-top:4px;
    margin-right:43%;

  a {
    color: $black-light;
    text-decoration: none;
    border-bottom: 1px solid $black-light;
    
    &:hover {
      color: $gray-link;
      border-bottom-color: $gray-link;
    }
    }
  }

  .category-list-count {
    color: $grey;
    padding-left: 5px;
    &:before {
      display: inline;
      content: " ("
    }
    &:after {
      display: inline;
      content: ") "
    }
  }
}

7、文章日期格式修改

将`layout/_macro/post.swig`文件中的

```
<span class="post-time">
  {{ __('post.posted') }}
  <time itemprop="dateCreated" datetime="{{ moment(post.date).format() }}" content="{{ date(post.date, config.date_format) }}">
    {{ date(post.date, config.date_format) }}
  </time>
</span>
```
里面第五行内容修改为

```
{{ date(post.date, "YYYY-MM-DD HH:mm") }}
```

```