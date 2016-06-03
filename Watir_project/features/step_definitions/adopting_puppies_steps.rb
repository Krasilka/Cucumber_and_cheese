Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
end

When(/^I click the first View Details button$/) do
  @browser.button(:value => "View Details", :index => 0).click
end

When(/^I click the second View Details button$/) do
  @browser.button(:value => "View Details", :index => 1).click
end

And(/^I click the Adopt Me button$/) do
  @browser.button(:value => "Adopt Me!").click
end

And(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => "Complete the Adoption").click
end

And(/^I enter "(.*?)" in the name field$/) do |arg1|
  @browser.text_field(:id => "order_name").set(arg1)
end

And(/^I enter "(.*?)" in the address field$/) do |arg1|
  @browser.text_field(:id => "order_address").set(arg1)
end

And(/^I enter "(.*?)" in the email field$/) do |arg1|
  @browser.text_field(:id => "order_email").set(arg1)
end

And(/^I select "(.*?)" from the pay with dropdown$/) do |arg1|
  @browser.select_list(:id => "order_pay_type").select(arg1)
end

And(/^I click the Place Order button$/) do
  @browser.button(:value => "Place Order").click
end

And(/^I click Adopt Another Puppy button$/) do
  @browser.button(:value => "Adopt Another Puppy").click
end

Then(/^I should see "(.*?)"$/) do |expected|
  @browser.text.should include expected
end

Then(/^I should see "(.*?)" as the name for line item (\d+)$/) do |name, line_item|
  row = (line_item.to_i-1)*6
  @browser.table(:index => 0)[row][1].text.should include name
end

And(/^I should see "(.*?)" as the subtotal for line item (\d+)$/) do |price, line_item|
  row = (line_item.to_i-1)*6
  @browser.table(:index => 0)[row][3].text.should == price
end

And(/^I should see "(.*?)" as the cart total$/) do |total_price|
  @browser.td(:class => 'total_cell').text.should == total_price
end



