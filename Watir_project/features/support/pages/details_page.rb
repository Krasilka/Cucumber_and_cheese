require_relative '../side_menu_panel'

class DetailsPage
  include PageObject
  include SideMenuPanel

  button(:add_to_cart, :value => 'Adopt Me!')


end