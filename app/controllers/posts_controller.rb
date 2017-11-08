class PostsController < ApplicationController

  def index
    @posts = Post.published.by_era(@era.id).order(updated_at: :desc)
    # @posts += Comment.frontpage
    set_meta_tags title: 'Topics'
  end

  def show
    @post = Post.friendly.find(params[:id])
    set_meta_tags title: @post.title
  end

end
