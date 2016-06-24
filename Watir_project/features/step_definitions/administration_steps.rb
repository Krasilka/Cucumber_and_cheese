Given /^I am on the puppy administration site$/ do
  visit(LoginPage)
end

Given /^I have a pending adoption for "([^"]*)"$/ do |name|
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => name)
end

When /^I process that adoption$/ do
  visit(LandingPage)
  on(LoginPage).login_to_system
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end

When /^I login as an (.+) user$/ do |user|
  on(LoginPage).login_with(user)
  on(LoginPage).text.should include ("Welcome")
end

When /^I process puppy adoption$/ do
  on(LoginPage).adoptions
  on(ProcessPuppyPage).process_adoption
end

Then /^I should see Successful Adoption message$/ do
  on(ProcessPuppyPage).thank_msg.should include $adopter_name
end
