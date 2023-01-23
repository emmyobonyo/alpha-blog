class CategoriesControllerTest < ActionDispatch::IntegrationTest
    setup do 
        @category = Category.create(name: "Sports")
    end

    test "should get index" do 
        get categories_url
        assert_response :success
    end

    test "should get new" do 
        get new_category_url
        assert_response :success
    end

    test "Should show category" do
        get category_url(@category)
        assert_response :success
    end
end