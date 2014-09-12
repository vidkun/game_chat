class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.order(rank: :desc)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.create(comment_params)
    redirect_to game_path(@game)
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rank_up
    @game = Game.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @comment[:rank] += 1
    respond_to do |format|
      if @comment.update_attributes(rank: @comment[:rank])
        format.html { redirect_to game_path(@game), notice: 'Comment rank was successfully updated.' }
      end
    end
  end

  def rank_down
    @game = Game.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @comment[:rank] -= 1
    respond_to do |format|
      if @comment.update_attributes(rank: @comment[:rank])
        format.html { redirect_to game_path(@game), notice: 'Comment rank was successfully updated.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :body, :game_id, :comment_time, :rank, :team)
    end
end
