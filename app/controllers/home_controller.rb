class HomeController < ApplicationController

  def index
    @posts = Post.by_era(@era.id).published.order(published_at: :desc)
    @meetings = Meeting.upcoming.order(start_at: :asc)
  end

end
