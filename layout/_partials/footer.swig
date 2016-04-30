<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="icon-next-heart fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="#">
    FreeSky{% if theme.scheme %}.{{ theme.scheme }}{% endif %}
  </a>(Reserved)

  <!--
  <span id="busuanzi_container_site_uv">
     &nbsp; | &nbsp;  访客<span id="busuanzi_value_site_uv"></span>人
  </span>
  <span id="busuanzi_container_site_pv">
    &nbsp; | &nbsp;  总访问量<span id="busuanzi_value_site_pv"></span>次
  </span>
  -->
  
</div>

{% block footer %}{% endblock %}
<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
