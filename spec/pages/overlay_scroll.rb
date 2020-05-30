class OverlayScroll < SitePrism::Section
  set_default_search_arguments '.overlayScroll'

  section :confirmation, '#racOverlay' do
    element :checkout_button, '#btn-checkout > a'
  end

  section :quicklook, '#quicklookOverlay' do
    element :title, '#overlay-content .pip-summary > h1'

    section :itemselection, '#overlay-content #itemselection' do
      element :price, '.product-price .price-special .price-amount'
    end
  end
end
