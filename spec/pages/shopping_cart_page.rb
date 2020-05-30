class ShoppingCartPage < SitePrism::Page
  set_url 'https://www.williams-sonoma.com/shoppingcart/'

  section :table, '.cart-table' do
    elements :items, '.cart-table-row'
  end
end
