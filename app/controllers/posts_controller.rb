class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :has_authority_to_edit_post?, only: [:edit]
  # GET /posts
  # GET /posts.json
  def home
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @favorite = current_user&.favorites&.find_by(post_id: @post.id)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    if params[:back] || @post.invalid?
      render :new
    else
      @post.save
      NotificationMailer.notification_mail(@post).deliver if Rails.env == "development"
      redirect_to post_path(id: @post.id)
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:sentence, :image, :image_cache, :user_id)
    end
end
