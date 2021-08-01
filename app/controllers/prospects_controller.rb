class ProspectsController < ApplicationController
  skip_before_action :authenticate_user!



def new
  @prospect = Prospect.new
end



def create
  @prospect = Prospect.new(prospect_params)
  if @prospect.save!
    redirect_to root_path, notice: "Thank you for signing up!"
  else
    render 'new'
  end


end




def prospect_params
  params.require(:prospect).permit(:first_name, :email, :profession)
end


end
