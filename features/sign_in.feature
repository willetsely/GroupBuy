Feature: Access the Home Page
  As a visitor to GroupBuy
  so that I can view the GroupBuy index

  Background: GroupBuy has several product listings
    Given these Products:
      | name        |       description         | price  | target | pledges |          start      |          end        | user_id |
      | Wolf Cola   | Bubbly and delicious      |   0.25 |   24   |    4    | 2015-03-30 09:00:00 | 2015-05-01 12:00:00 |    1    |
      | Xbox One    | Second-rate game console  | 300.00 |  100   |   69    | 2015-04-16 10:00:00 | 2015-06-15 17:00:00 |    2    |
      | Water Bed   | More motion in the ocean  | 500.00 |  100   |   34    | 2015-03-21 08:00:00 | 2015-04-04 08:30:00 |    4    |

    Given these Users:
      | id | email                     | first_name | last_name |    password       |   
      |  1 | mgeorges@colgate.edu      | Markos     | Georges   | greekfreak        |
      |  2 | wgarcia@colgate.edu       | William    | Garcia    | chiefcia          |
      |  3 | rely@colgate.edu          | Willets    | Ely       | presidentwill     |
      |  4 | ddrucker@colgate.edu      | Daniel     | Drucker   | GOHAWKSS          |

  Scenario: Get to the Sign Up Page
    Given I am on the login page
    When I follow "Sign up"
    Then I should be on the sign up page

  Scenario: Sign Up to GroupBuy
    Given I am on the sign up page
    When I fill in the following:
      | email            | john.smith@gmail.com |
      | Password         | bigdaddyjohn         |
      | Confirm Password | bigdaddyjohn         |
    And I press "Sign up"
    Then I should be on the index page
    And I should see "Welcome! You have signed up successfully."
    And I should see "Wolf Cola"
    And I should see "Xbox One"

  Scenario: Log in to GroupBuy
    Given I am on the login page
    When I fill in the following:
      | email    | mgeorges@colgate.edu |
      | Password | greekfreak           |
    And I press "Log in"
    Then I should be on the index page
    And I should see "Signed in successfully."
    And I should see "Wolf Cola"

  Scenario: Attempt to Sign Up with an email that is already used
    Given I am on the sign up page
    When I fill in the following:
      | email            | rely@colgate.edu  |
      | password         | willets123        |
      | confirm password | willets123        |
    And I press "Sign up"
    Then I should be on the sign up page
    And I should see "Email has already been taken"
