
class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: %i[show edit update destroy]

  # GET /admin/posts
  def index
    @posts = Post.all
  end

  # GET /admin/posts/1
  def show
  end

  # GET /admin/posts/new
  def new
    @post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html do
          redirect_to admin_post_path(@post),
                      notice: "Post was successfully created."
        end
        format.json do
          render :show, status: :created, location: admin_post_url(@post)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to admin_post_path(@post),
                      notice: "Post was successfully updated.",
                      status: :see_other
        end
        format.json do
          render :show, status: :ok, location: admin_post_url(@post)
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /admin/posts/1
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html do
        redirect_to admin_posts_path,
                    notice: "Post was successfully deleted.",
                    status: :see_other
      end
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, tag_ids: [])
  end
end
