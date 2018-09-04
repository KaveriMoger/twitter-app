class TweetsController < ApplicationController
   skip_before_action :verify_authenticity_token  

  def index
    @tweets = Tweet.all
  
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    user_id= params[:tweet][:user_id]
    if tweet.save
      tweet.update_attribute(:user_id, user_id)
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
    Relationship.save_follow(params[:id])
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