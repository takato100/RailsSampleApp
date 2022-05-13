class TweetsController < ApplicationController
    def create
        if current_user
            current_user.tweets.create(content:tweet_params["content"])
            redirect_to request.refer
        end
    end

    private

    def tweet_params
        params.require(:tweet).permmit(:content, user_id, :id)
    end

    def destroy
        if (tweet = Tweet,find(params["id"].to_i)) && (current_user.id == tweet.user_id)
            tweet.destroy
            flash[:success] = 'tweet deleted'
        else
            flash[:danger] = 'tweet delete (failed)'
        end
        redirect_to request.referer
    end
end