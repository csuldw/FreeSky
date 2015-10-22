{% macro render(post, is_index, post_extra_class) %}

  {% set headlessPost = Array.prototype.indexOf.call(['quote', 'picture'], post.type) > -1 %}
  {% set navlessPost = headlessPost %}

  <article class="post post-type-{{ post.type | default('normal') }} {{ post_extra_class | default('') }}" itemscope itemtype="http://schema.org/Article">

    <div class="post-body">

      {# Gallery support #}
      {% if post.photos and post.photos.length %}
        <div class="post-gallery" itemscope itemtype="http://schema.org/ImageGallery">
          {% set COLUMN_NUMBER = 3 %}
          {% for photo in post.photos %}
            {% if loop.index0 % COLUMN_NUMBER === 0 %}<div class="post-gallery-row">{% endif %}
              <a class="post-gallery-img fancybox"
                 href="{{ url_for(photo) }}" rel="gallery_{{ post._id }}"
                 itemscope itemtype="http://schema.org/ImageObject" itemprop="url">
                <img src="{{ url_for(photo) }}" itemprop="contentUrl"/>
              </a>
            {% if loop.index0 % COLUMN_NUMBER === 2 %}</div>{% endif %}
          {% endfor %}

          {# Append end tag for `post-gallery-row` when (photos size mod COLUMN_NUMBER) is less than COLUMN_NUMBER #}
          {% if post.photos.length % COLUMN_NUMBER > 0 %}</div>{% endif %}
        </div>
      {% endif %}

      {% if is_index %}
        {% if post.description %}
          <span itemprop="description">{{ post.description }}</span>
          <div class="post-more-link text-center">
            <a class="btn" href="{{ url_for(post.path) }}">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
        {% elif post.excerpt  %}
          {{ post.excerpt }}
          <div class="post-more-link text-center">
            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#more{% endif %}" rel="contents">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
        {% elif theme.auto_excerpt.enable %}
          <span itemprop="articleBody">
            {% set content = post.content | striptags %}
            {{ content.substring(0, theme.auto_excerpt.length) }}
            {% if content.length > theme.auto_excerpt.length %}...{% endif %}
          </span>
          <div class="post-more-link text-center">
            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#more{% endif %}" rel="contents">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
        {% else %}
          <span itemprop="articleBody">
            {% if post.type === 'picture' %}
              <a href="{{ url_for(post.path) }}">{{ post.content }}</a>
            {% else %}
              {{ post.content }}
            {% endif %}
          </span>
        {% endif %}
      {% else %}
        <span itemprop="articleBody">{{ post.content }}</span>
      {% endif  %}
    </div>

    <footer class="post-footer">
      {% if post.tags and post.tags.length and not is_index %}
        <div class="post-tags">
          {% for tag in post.tags %}
            <a href="{{ url_for(tag.path) }}" rel="tag">#{{ tag.name }}</a>
          {% endfor %}
        </div>
      {% endif %}

      {% if not is_index and (post.prev or post.next) and not navlessPost %}
        <div class="post-nav">
          <div class="post-nav-prev post-nav-item">
            {% if post.prev %}
              <a href="{{ url_for(post.prev.path) }}" rel="prev">
                <i class="fa fa-chevron-left"></i> {{post.prev.title}}
              </a>
            {% endif %}
          </div>

          <div class="post-nav-next post-nav-item">
            {% if post.next %}
              <a href="{{ url_for(post.next.path) }}" rel="next">
                {{post.next.title}} <i class="fa fa-chevron-right"></i>
              </a>
            {% endif %}
          </div>
        </div>
      {% endif %}

      {% set isLast = loop.index % page.per_page === 0 %}
      {% if is_index and not isLast %}
        <div class="post-eof"></div>
      {% endif %}
    </footer>
  </article>

{% endmacro %}
