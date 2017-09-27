1、修改source/js/helper.js里的displaySidebar函数，将时延改到1200s

```
function displaySidebar () {
  setTimeout(function () {
    $('.sidebar-toggle').trigger('click');
  }, 1200);
}
```

2、修改css\_commom\_section\sidebar.styl,增加下面内容

```
.sidebar-panel { display: none; }
.sidebar-panel-active { display: block; }
```

3、修改layout/_macro/sidebar.swig:设置四个display_toc

line13-add： {% set display_toc = is_post and theme.toc.enable %}
line14-update：{% if display_toc %}
line25-update：      <section class="site-overview" sidebar-panel {% if not display_toc %} sidebar-panel-active {% endif %}>
line98:      {% if display_toc %}
line:102:            {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}


4、修改_config.yml
增加内容
```
toc:
  enable: true
  # Automatically add list number to toc.
  number: true
```

5、修改motion_global.js
去掉多余的
