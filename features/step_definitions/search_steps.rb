Given("i should see search bar") do
find_field 'search'
end

Given("i fill in with product_name") do
# FactoryGirl.create :gadgets_category
#   @item = FactoryGirl.create :nonbiditem1
# fill_in('search',:with => @item.product_name)
  FactoryGirl.create :dummy_category
  @item1 = FactoryGirl.create :nonbiditem1
  fill_in 'search', with: @item1.product_name
  # save_and_open_page

end

When("i click on search button") do
  find_field('search').click


end

Then("i should see the posts of product_name") do


  # item_type = (@item.type == 'BidItem') ? 'bidding' : 'non-bidding'
  # tb = page.find('table#' + "#{item_type}")
  #

end
