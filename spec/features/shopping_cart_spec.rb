feature 'Shooping cart', js: true do
  let(:home_page) { HomePage.new }
  let(:products_page) { ProductListPage.new }
  let(:product_page) { ProductPage.new }
  let(:cart_page) { ShoppingCartPage.new }

  background do
    home_page.load
    home_page.wait_and_close_banner
  end

  scenario 'add product and validate it on checkout page' do
    # choose category
    home_page.find_menu_element_by_name("COOKS' TOOLS").hover
    home_page.page.click_link 'Salt & Pepper Mills'
    products_page.wait_until_displayed

    # select first product
    product = products_page.products.first
    product.name_link.click
    product_page.wait_until_displayed
    product_page.make_first_selection
    sku = product_page.info.sku.text.scan(/\d+/)[0]

    # add to cart
    product_page.info.click_button 'Add to Cart'
    product_page.wait_until_overlay_scroll_visible(wait: 10)
    product_page.overlay_scroll.confirmation.checkout_button.click

    # verify selected product
    cart_page.wait_until_displayed
    expect(cart_page.table).to have_items(count: 1)
    expect(cart_page.table.items[0]['data-sku']).to include(sku)
  end
end
