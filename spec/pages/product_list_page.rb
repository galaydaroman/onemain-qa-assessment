require_relative './overlay_scroll'
require_relative './product_cell'

class ProductListPage < SitePrism::Page
  set_url_matcher(/www.williams-sonoma.com\/(shop\/?.*|search\/results.html)/)

  sections :products, ProductCell, '#content ul.product-list li.product-cell'
  section :overlay_scroll, OverlayScroll, '.overlayScroll'
end
