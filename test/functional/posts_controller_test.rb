require File.dirname(__FILE__) + '/../test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = Post.find(:first)
  end

  context "on GET to PostsController#index" do
    setup do
      get :index
    end

    should_respond_with :success
    should_assign_to :posts
    should_render_template :index
    should_not_set_the_flash
    should_not_change "Post.count"
  end

  context "on GET to PostsController#show" do
    setup do
      get :show, :id => @post.to_param
    end

    should_assign_to :post
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
    should_not_change "Post.count"
    should "set @post to requested instance" do
      assert_equal @post, assigns(:post)
    end
  end

  context "on GET to PostsController#new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_assign_to :post
    should_not_set_the_flash
    should_render_template :new
    should_render_a_form
    should_not_change "Post.count"
  end

  context "on GET to PostsController#edit" do
    setup do
      get :edit, :id => @post.to_param
    end

    should_assign_to :post
    should_respond_with :success

    should_render_template :edit
    should_not_set_the_flash
    should_render_a_form
    should_not_change "Post.count"
    should "set @post to requested instance" do
      assert_equal @post, assigns(:post)
    end
  end

  context "on POST to PostsController#create with " do
    setup do
      post :create, :post => {  }
    end

    should_assign_to :post
    should_set_the_flash_to(/created/i)
    should_redirect_to "posts_path()"
    should "not have errors on @post" do 
      assert assigns(:post).errors.blank?
    end
    should_change "Post.count", :by => 1
  end

  context "on PUT to PostsController#update with" do
    setup do
      put :update, :id => @post.to_param
    end

    should_assign_to :post
    should_set_the_flash_to(/updated/i)
    should_redirect_to "post_path(@post)"
    should_not_change "Post.count"
    should "not have errors on @post" do
      assert assigns(:post).errors.empty?
    end
  end

  context "on DELETE to PostsController#destroy" do
    setup do
      delete :destroy, :id => @post.to_param
    end

    should_set_the_flash_to(/removed/i)
    should_redirect_to "posts_path()"
    should_change "Post.count", :by => -1
  end

  context "on GET to PostsController#index as xml" do
    setup do
      get :index, :format => "xml"
    end

    should_respond_with :success
    should_respond_with_content_type :xml #('posts') # TODO: fix this

    should_assign_to :posts
  end

  context "on GET to PostsController#show as xml" do
    setup do
      get :show, :id => @post.to_param, :format => "xml"
    end

    should_assign_to :post
    should_respond_with :success

#    should_respond_with_xml_for('post') # TODO: fix this
  end

  context "on POST to PostsController#create as xml" do
    setup do
      post :create, :post => {  }
    end

    should_assign_to :post
    should "not have errors on @post" do 
      assert assigns(:post).errors.blank?
    end
  end

  context "on PUT to PostsController#update as xml" do
    setup do
      put :update, :id => @post.to_param
    end

    should_assign_to :post
    should "not have errors on @post" do
      assert assigns(:post).errors.blank?
    end
  end

  context "on DELETE to PostsController#destroy as xml" do
    setup do
      delete :destroy, :id => @post.to_param
    end

    should_change "Post.count", :by => -1
  end
end
