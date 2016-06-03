require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'

@browser = Watir::Browser.new :firefox

include AdoptionHelper

goto_puppy_adoption_site
adopt_puppy_number 1
continue_adopting_puppies
adopt_puppy_number 2
proceed_checkout('Irine', 'Hai ba trung', 'maddy@mail.ru', 'Credit card')
confirm_successful_adoption ('Thank you for adopting a puppy!')
close_browser
