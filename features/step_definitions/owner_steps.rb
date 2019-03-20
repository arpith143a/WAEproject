Given("There few posts on the main page") do
  FactoryGirl.create :dummy_category
  FactoryGirl.create :gadgets_category

  @item1 = FactoryGirl.create :nonbiditem1
  @item2 = FactoryGirl.create :biditem1


end

Given("i click on username of a post") do
  all('a', :text => 'email')[1].click



end

Then("i should see owner profile details") do

  visit '/userinfo/postuser.1'

end
