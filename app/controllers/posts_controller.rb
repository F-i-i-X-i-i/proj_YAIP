class PostsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "12345", except: [:index, :show]

  def index
    @post = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def showmy
    @post = Post.all.reverse
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if (@post.update(post_params))
      flash[:success] = t("post_updated") + '!'
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    Comment.all.each do |com|
      if com.post_id == params[:id].to_i
        puts 'Удаляю комментарий ' + com.body
        com.destroy
      end
    end
    @post.destroy
    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.email
    if (@post.save)
      flash[:success] = t("post_created") + '!'
      redirect_to @post
    else
      render :new
    end
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
