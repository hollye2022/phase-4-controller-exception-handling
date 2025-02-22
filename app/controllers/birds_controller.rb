class BirdsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

 def index
  birds = Bird.all
  render json: birds
 end

 def create
  bird = Bird.create(bird_params)
  render json: bird, status: :created
 end

 def show
  bird = find_bird
  render json: bird
 end

 def update
  bird = find_bird
  bird.update(bird_params)
  render json: bird
 end

def increment_likes
  bird = find_bird
  bird.update(likes: bird.likes + 1 )
  render json: bird
end

def destroy
  bird = find_bird
  bird.destroy
  head :no_content
end

 private

 def bird_params
  params.permit(:name, :species, :likes)
 end

 def find_bird
  Bird.find(params[:id]) 
 end

 def render_not_found_response
  render json: {error: "Bird not found"}, status: :not_found
 end









  # # GET /birds
  # def index
  #   birds = Bird.all
  #   render json: birds
  # end

  # # POST /birds
  # def create
  #   bird = Bird.create(bird_params)
  #   render json: bird, status: :created
  # end

  # # GET /birds/:id
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   if bird
  #     render json: bird
  #   else
  #     render json: { error: "Bird not found" }, status: :not_found
  #   end
  # end

  # # PATCH /birds/:id
  # def update
  #   bird = Bird.find_by(id: params[:id])
  #   if bird
  #     bird.update(bird_params)
  #     render json: bird
  #   else
  #     render json: { error: "Bird not found" }, status: :not_found
  #   end
  # end

  # # PATCH /birds/:id/like
  # def increment_likes
  #   bird = Bird.find_by(id: params[:id])
  #   if bird
  #     bird.update(likes: bird.likes + 1)
  #     render json: bird
  #   else
  #     render json: { error: "Bird not found" }, status: :not_found
  #   end
  # end

  # # DELETE /birds/:id
  # def destroy
  #   bird = Bird.find_by(id: params[:id])
  #   if bird
  #     bird.destroy
  #     head :no_content
  #   else
  #     render json: { error: "Bird not found" }, status: :not_found
  #   end
  # end

  # private

  # def bird_params
  #   params.permit(:name, :species, :likes)
  # end

end
