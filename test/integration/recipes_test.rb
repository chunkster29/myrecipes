require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  
  def setup 
    @chef = Chef.create!(chefname: "Jason", email: "jason@example.com")
    @recipe = Recipe.create(name: "Buy Pizza", description: "Buy pizza from pejis 3", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Chips and Pizza", description: "Cook chips and microwave pizza for 3 minutes")
    @recipe2.save
  end 
    test "should get recipes index" do
    get recipes_url
    assert_response :success
    end
    
    test "should get recipes listing" do
      get recipes_path
      assert_template 'recipes/index'
      assert_match @recipe.name, response.body
      assert_match @recipe2.name, response.body
    end
    
end
