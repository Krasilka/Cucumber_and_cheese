Feature: Administration

  Background:
    Given I am on the puppy administration site

  Scenario: Processing adoption
    When I login as an admin user
    And I process puppy adoption
    Then I should see Successful Adoption message







