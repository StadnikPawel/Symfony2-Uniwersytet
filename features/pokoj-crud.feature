Feature: I would like to edit pokoj

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Login"
    And I go to "/admin/pokoj"
    Then I should not see "<number>"
    And I follow "Create a new entry"
    Then I should see "Pokoj creation"
    When I fill in "Number" with "<number>"
    And I press "Create"
    Then I should see "<number>"

  Examples:
    | number        |
    | 211           |
    | 145           |
    | 597           |


  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Login"
    And I go to "/admin/pokoj"
    Then I should not see "<number>"
    When I follow "<old-number>"
    Then I should see "<old-number>"
    When I follow "Edit"
    And I fill in "Number" with "<new-number>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-number>"
    And I should not see "<old-number>"

  Examples:
    | old-number        | new-number             |
    | 211               | 23                     |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Login"
    And I go to "/admin/pokoj"
    Then I should see "<number>"
    When I follow "<number>"
    Then I should see "<number>"
    When I press "Delete"
    Then I should not see "<number>"

  Examples:
    |  number            |
    | 145                |
    | 597                |
    | 23                 |