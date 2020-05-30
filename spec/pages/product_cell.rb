class ProductCell < SitePrism::Section
  element :name_link, 'a.product-name'
  element :price_label, '.product-price .price-sale .price-sale-amount'

  def name
    name_link.text
  end

  def price
    price_label.text.split('$').last
  end

  def open_quicklook
    page.click_link 'Quicklook'
  end
end
