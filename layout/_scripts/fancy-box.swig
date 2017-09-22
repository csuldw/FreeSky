{% if theme.fancybox %}
  <script type="text/javascript" src="{{ url_for(theme.others) }}/fancybox/source/jquery.fancybox.pack.js"></script>
  <script type="text/javascript" src="{{ url_for(theme.js) }}/fancy-box.js?v={{ theme.version }}"></script>
{% endif %}
