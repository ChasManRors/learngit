require File.dirname(__FILE__) + '/../test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @post = Post.find(:first)
    @comment = @post.comments.find(:first)
  end

  context "on GET to CommentsController#index" do
    setup do
      get :index, :post_id => @post.to_param
    end

    should_respond_with :success
    should_assign_to :comments
    should_render_template :index
    should_not_set_the_flash
    should_not_change "Comment.count"
  end

  context "on GET to CommentsController#show" do
    setup do
      get :show, :id => @comment.to_param, :post_id => @post.to_param
    end

    should_assign_to :comment
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
    should_not_change "Comment.count"
    should "set @comment to requested instance" do
      assert_equal @comment, assigns(:comment)
    end
  end

  context "on GET to CommentsController#new" do
    setup do
      get :new, :post_id => @post.to_param
    end

    should_respond_with :success
    should_assign_to :comment
    should_not_set_the_flash
    should_render_template :new
    should_render_a_form
    should_not_change "Comment.count"
  end

  context "on GET to CommentsController#edit" do
    setup do
      get :edit, :id => @comment.to_param, :post_id => @post.to_param
    end

    should_assign_to :comment
    should_respond_with :success

    should_render_template :edit
    should_not_set_the_flash
    should_render_a_form
    should_not_change "Comment.count"
    should "set @comment to requested instance" do
      assert_equal @comment, assigns(:comment)
    end
  end

  context "on POST to CommentsController#create with " do
    setup do
      post :create, :post_id => @post.to_param, :comment => {  }
    end

    should_assign_to :comment
    should_set_the_flash_to(/created/i)
    should_redirect_to "post_comments_path(@post)"
    should "not have errors on @comment" do 
      assert assigns(:comment).errors.blank?
    end
    should_change "Comment.count", :by => 1
  end

  context "on PUT to CommentsController#update with" do
    setup do
      put :update, :id => @comment.to_param, :post_id => @post.to_param
    end

    should_assign_to :comment
    should_set_the_flash_to(/updated/i)
    should_redirect_to "post_comment_path(@post, @comment)"
    should_not_change "Comment.count"
    should "not have errors on @comment" do
      assert assigns(:comment).errors.empty?
    end
  end

  context "on DELETE to CommentsController#destroy" do
    setup do
      delete :destroy, :id => @comment.to_param, :post_id => @post.to_param
    end

    should_set_the_flash_to(/removed/i)
    should_redirect_to "post_comments_path(@post)"
    should_change "Comment.count", :by => -1
  end

  context "on GET to CommentsController#index as xml" do
    setup do
      get :index, :post_id => @post.to_param, :format => "xml"
    end

    should_respond_with :success
    should_respond_with_content_type :xml #('comments') # TODO: fix this

    should_assign_to :comments
  end

  context "on GET to CommentsController#show as xml" do
    setup do
      get :show, :id => @comment.to_param, :post_id => @post.to_param, :format => "xml"
    end

    should_assign_to :comment
    should_respond_with :success

#    should_respond_with_xml_for('comment') # TODO: fix this
  end

  context "on POST to CommentsController#create as xml" do
    setup do
      post :create, :post_id => @post.to_param, :comment => {  }
    end

    should_assign_to :comment
    should "not have errors on @comment" do 
      assert assigns(:comment).errors.blank?
    end
  end

  context "on PUT to CommentsController#update as xml" do
    setup do
      put :update, :id => @comment.to_param, :post_id => @post.to_param
    end

    should_assign_to :comment
    should "not have errors on @comment" do
      assert assigns(:comment).errors.blank?
    end
  end

  context "on DELETE to CommentsController#destroy as xml" do
    setup do
      delete :destroy, :id => @comment.to_param, :post_id => @post.to_param
    end

    should_change "Comment.count", :by => -1
  end
end
