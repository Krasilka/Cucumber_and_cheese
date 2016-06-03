module AdoptionHelper
  def goto_puppy_adoption_site
    @browser.goto 'http://puppies.herokuapp.com'
    sleep 5
  end

  def adopt_puppy_number(num)
    @browser.button(:value => 'View Details', :index => num - 1).click
    @browser.button(:value => 'Adopt Me!').click
  end

  def continue_adopting_puppies
    @browser.button(:value => 'Adopt Another Puppy').click
  end

  def proceed_checkout(name, address, email, payment_type)
    @browser.button(:value => 'Complete the Adoption').click
    @browser.text_field(:name => 'order[name]').set(name)
    @browser.text_field(:name => 'order[address]').set(address)
    @browser.text_field(:name => 'order[email]').set(email)
    @browser.select_list(:name => 'order[pay_type]').select(payment_type)
    @browser.button(:value => 'Place Order').click
  end

  def confirm_successful_adoption(text)
    fail 'The text in browser is not as expected one' unless @browser.text.include? text
  end

  def close_browser
    @browser.close
  end
end