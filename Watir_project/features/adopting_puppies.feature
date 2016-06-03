Feature: Adopting puppies

  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adoption site

  Scenario Outline: Adopting one puppy
    When I click the first View Details button
    When I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter "<name>" in the name field
    And I enter "<address>" in the address field
    And I enter "<email>" in the email field
    And I select "<pay_type>" from the pay with dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Examples:
    |name  |address        |email             |pay_type      |
    |Cheezy|123 Main Street|cheezy@example.com|Credit card   |
    |Joseph|555 South 32   |joe@hee.com       |Check         |
    |James |87456 skudfh   |janme@jdh.com     |Purchase order|


  Scenario: Adopting two puppies
    When I click the first View Details button
    And I click the Adopt Me button
    And I click Adopt Another Puppy button
    And I click the second View Details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main Street" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay with dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Validating cart with one puppy
    When I click the first View Details button
    When I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "$34.95" as the cart total

  @test
  Scenario: Validating cart with two puppies
    When I click the first View Details button
    When I click the Adopt Me button
    And I click Adopt Another Puppy button
    And I click the second View Details button
    And I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "Hanna" as the name for line item 2
    And I should see "$22.99" as the subtotal for line item 2
    And I should see "$57.94" as the cart total
