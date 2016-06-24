require_relative '../side_menu_panel'

class LoginPage
  include PageObject
  include SideMenuPanel

  text_field(:username, :id => 'name')
  text_field(:password, :id => 'password')
  button(:login, :value => "Login")


  def login_with(user = "admin", passw = "password")
    self.username, self.password =user, passw
    login
  end


end