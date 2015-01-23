Feature: I would like to edit pokoj

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Login"
    And I go to "/admin/pokoj"
    Then I should not see "<name>"
    And I follow "Create a new entry"
    Then I should see "Pokoj creation"
    When I fill in "Name" with "<name>"
    And I press "Create"
    Then I should see "<name>"

  Examples:
    | name                         |
    | POKOJ RECORD 211           |
    | POKOJ RECORD 145           |
    | POKOJ RECORD 597           |


  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Login"
    And I go to "/admin/pokoj"
    Then I should not see "<name>"
    When I follow "<old-name>"
    Then I should see "<old-name>"
    When I follow "Edit"
    And I fill in "Name" with "<new-name>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-name>"
    And I should not see "<old-name>"

  Examples:
    | old-name          | new-name               |
    | POKOJ RECORD 211  | NEW POKOJ RECORD 23    |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Login"
    And I go to "/admin/pokoj"
    Then I should see "<name>"
    When I follow "<name>"
    Then I should see "<name>"
    When I press "Delete"
    Then I should not see "<name>"

  Examples:
    |  name               |
    | POKOJ RECORD 145    |
    | POKOJ RECORD 597    |
    | NEW POKOJ RECORD 23 |