class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create
    
    # def create
    #     athlete = Athlete.find_by(username: params[:username])
    #     if athlete&.authenticate(params[:password])
    #       session[:athlete_id] = athlete.id
    #       render json: athlete
    #     else
    #       render json: { error: "Invalid username or password" }, status: :unauthorized
    #     end
    # end

    # def destroy
    #     session.delete :athlete_id
    #     head :no_content
    # end
    
    def create
        athlete = Athlete.find_by(username: params[:username])
        if athlete
            if athlete&.authenticate(params[:password])
                session[:athlete_id] = athlete.id
                render json: athlete
            else
                render json: { error: "Invalid username or password" }, status: :unauthorized
            end
        else
            collaborator = Collaborator.find_by(username: params[:username])
            if collaborator&.authenticate(params[:password])
                session[:collaborator_id] = collaborator.id
                render json: collaborator
            else
                render json: { error: "Invalid username or password" }, status: :unauthorized
            end
        end
    end

    def destroy
        if session[:collaborator_id]
            session.delete :collaborator_id
            head :no_content
        else 
            session.delete :athlete_id
            head :no_content
        end
    end
end
