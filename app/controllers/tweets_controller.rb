class TweetsController < ApplicationController
   skip_before_action :verify_authenticity_token  

  def index
    @tweets = Tweet.order('updated_at desc')
  
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.create(tweet_params)
    if tweet
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def follow
    byebug
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end
 
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
 
    redirect_to tweets_path
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end