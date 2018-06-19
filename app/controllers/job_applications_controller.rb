class JobApplicationsController < ApplicationController
    def index
      @applications = JobApplication.all
    end
    def show
      @application = JobApplication.find(params[:id])
    end
    def edit
      @application = JobApplication.find(params[:id])
    end
    def update
      @application = JobApplication.find(params[:id])

      @application.full_name = params[:application][:full_name]
      @application.phone = params[:application][:phone]
      @application.hobby = params[:application][:hobby]
      @application.years_experience = params[:application][:years_experience]
      @application.available_date = params[:application][:available_date]

      if @application.save
        redirect_to application_url(@application)
      else
        redirect_to application_url(@application)
      end
    end
    def new
      @application = JobApplication.new
    end
    def create
        @application.full_name = params[:application][:full_name]
        @application.phone = params[:application][:phone]
        @application.hobby = params[:application][:hobby]
        @application.years_experience = params[:application][:years_experience]
        @application.available_date = params[:application][:available_date]

        if @application.save
          redirect_to applications_url
        else
          redirect_to new_application_path
        end
    end

    def destroy
      @application = JobApplication.find(params[:id])
      @application.destory
      redirect_to application_url
    end
    
end
