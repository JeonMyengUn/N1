class CommentsController < ApplicationController
    before_action :set_comment, except: [:create]
    before_action :authenticate_user!
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.save
        redirect_to @comment.commentable
    end

    def destroy
        @comment.destroy
        redirect_to @comment.commentable
    end
    
    private
        def set_comment
            @comment = Comment.find params[:id]
        end
        
        def comment_params
            params.require(:comment).permit(:content, :commentable_id, :commentable_type)
        end
end
