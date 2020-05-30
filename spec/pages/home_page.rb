require_relative './banner_popup'

class HomePage < SitePrism::Page
  set_url 'https://www.williams-sonoma.com/'

  elements :menu, '#nav-container li.dropDown > a'

  section :banner_popup, BannerPopup
  section :search_box, '#nav-search-box' do
    element :input, '#search-field'
    element :submit, '#btnSearch'
  end

  def find_menu_element_by_name(name)
    menu.find { |m| m.text == name }
  end

  def wait_and_close_banner
    wait_until_banner_popup_visible(wait: 10)
    banner_popup.close
    wait_until_banner_popup_invisible
  end
end
