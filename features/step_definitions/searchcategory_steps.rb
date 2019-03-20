Given("i should see drop down to search category") do

find('a', :text => 'Search by Category')

end

When("i Click on it") do


find('a', :text => 'Search by Category').click



end

Then("i see the categories to select") do

  find_link 'gadgets_test'

# visit '/site/show?name=gadgets'

#find(:select, from, options).find(:option, value, options).select_option
  #a=find('a', :text => 'Search by Category').all('li').collect(&:text)
  #  expect(a).to have_content ''

end

When("i click on the category {string}") do |string|
click_link 'gadgets_test'
end

Then("i see {string} posts") do |string|
  # save_and_open_page

end
