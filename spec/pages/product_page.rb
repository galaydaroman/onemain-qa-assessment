require_relative './overlay_scroll'

class ProductPage < SitePrism::Page
  set_url_matcher(/www.williams-sonoma.com\/products\/?.*/)

  section :overlay_scroll, OverlayScroll, '.overlayScroll'
  section :info, '.pip-info' do
    element :title, '.pip-summary > h1'
    element :sku, 'p.pip-sku'
    elements :selections, '.subsetAttributes li.attributeValue > a'
  end

  def make_first_selection
    info.selections.first.click
  end
end
