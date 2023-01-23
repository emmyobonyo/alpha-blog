# require 'test_helpler'

class CategoryTest < ActiveSupport::TestCase
    
    # This function will run before every command
    def setup
        @category = Category.new(name: "Sports")
    end

    test "category should be valid" do 
        # @category = Category.new(name: "Sports")
        # Ensure that test is true
        assert @category.valid?
    end

    test 'Name should be present' do
        # @category = Category.new(name: " ")
        @category.name = " "
        assert_not @category.valid?
    end

    test 'Name should be unique' do
        # Frst save a category to the database
        @category.save
        @category2 = Category.new(name: 'Sports')
        assert_not @category2.valid?
    end

    test 'Name should not be too long' do
        @category.name = 'a' * 26
        assert_not @category.valid?
    end

    test 'Name should not be too short' do
        @category.name = 'aa'
        assert_not @category.valid?
    end

end