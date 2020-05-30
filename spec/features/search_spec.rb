feature 'Search product', js: true do
  let(:home_page) { HomePage.new }
  let(:products_page) { ProductListPage.new }

  background do
    home_page.load
    home_page.wait_and_close_banner
  end

  scenario 'validate quicklook price and name' do
    # search for product
    home_page.search_box.input.set 'fry pan'
    home_page.search_box.submit.click
    products_page.wait_until_displayed

    # select first product
    product = products_page.products.first
    name = product.name
    price = product.price

    # click quicklook
    product.open_quicklook
    products_page.wait_until_overlay_scroll_visible(wait: 5)
    expect(products_page.overlay_scroll.quicklook.title.text).to eq(name)
    expect(products_page.overlay_scroll.quicklook.itemselection.price.text).to eq(price)
  end
end
