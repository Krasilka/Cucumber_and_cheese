require 'rubygems'
require 'watir-webdriver'
@browser = Watir::Browser.new :firefox
@browser.goto 'http://puppies.herokuapp.com'
sleep 5
@browser.button(:value => 'View Details').click
@browser.button(:value => 'Adopt Me!').click
@browser.button(:value => 'Complete the Adoption').click
@browser.text_field(:name => 'order[name]').set('Irine')
@browser.text_field(:name => 'order[address]').set('Hai Ba Trung')
@browser.text_field(:name => 'order[email]').set('some@mail.ru')
@browser.select_list(:name => 'order[pay_type]').select('Credit card')
@browser.button(:value => 'Place Order').click

fail 'The text in browser is not as expected one' unless @browser.text.include? 'Thank you for adopting a puppy!'

@browser.close
