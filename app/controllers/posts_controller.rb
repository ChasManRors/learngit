class PostsController < ApplicationController

  before_filter :find_post, :only => [:show, :destroy, :edit, :update]
  before_filter :find_posts, :only => :index
  before_filter :new_post, :only => [:new, :create]

  def setup_enclosing_resources

  end
  def find_post
    setup_enclosing_resources
    @post = Post.find(params[:id])
    @comment = @post.comments.new(params[:comment])
  end
  def find_posts
    setup_enclosing_resources
#    @posts = Post.find(:all)
    @posts = Post.paginate :page => params[:page], :per_page => 1,  :order => 'created_at ASC'
  end
  def new_post
    setup_enclosing_resources
    @post = Post.new(params[:post])
  end

  # GET /posts
  # GET /posts.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.xml
  def create
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(posts_path()) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(post_path(@post)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post.destroy

    flash[:notice] = 'Post was successfully removed.'
    respond_to do |format|
      format.html { redirect_to(posts_path()) }
      format.xml  { head :ok }
    end
  end
end
