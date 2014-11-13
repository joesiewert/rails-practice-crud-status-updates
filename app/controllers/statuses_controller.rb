class StatusesController < ApplicationController

def index
  @statuses = Status.all
end

def new
  @status = Status.new
end

def show
  @status = Status.find(params[:id])
end

def edit
  @status = Status.find(params[:id])
end

def create
  @status = Status.new(status_params)
  if @status.save
    redirect_to status_path(@status), notice: "Status created!"
  else
    render :new
  end
end

def update
  @status = Status.find(params[:id])
  if @status.update(status_params)
    redirect_to status_path(@status), notice: "Status updated!"
  else
    render :edit
  end
end

def destroy
  @status = Status.find(params[:id])
  @status.destroy
  redirect_to statuses_path, notice: "Status deleted!"
end

private

def status_params
  params.require(:status).permit(:status, :user, :likes)
end

end
