Feature: Item

  Background:
    Given There are some category in the system
    And I am user
    And I'm signed in


  Scenario: Create NonBidItem
    Given I have a non bid item
    When I click on the link "Post Your new Item"
    Then I should see the form for the item
    When I filled up the form to post the item and submit
    Then I should see "Today's Items"
    And  I should see my item on the same list type

  Scenario: Create BidItem
    Given I have a bid item
    When I click on the link "Post Your new Item"
    Then I should see the form for the item
    When I filled up the form to post the item and submit
    Then I should see "Today's Items"
    And  I should see my item on the same list type

