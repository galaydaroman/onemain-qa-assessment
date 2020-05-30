class BannerPopup < SitePrism::Section
  class BannerIframe < SitePrism::Page
    element :close_button, '#closeIconContainer'
  end

  set_default_search_arguments '#attentive_overlay'

  iframe :overlay, BannerIframe, '#attentive_creative'

  def close
    overlay do |frame|
      frame.close_button.click
    end
  end
end
