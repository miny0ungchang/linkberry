class ProspectsController < ApplicationController
  skip_before_action :authenticate_user!



def new
  @prospect = Prospect.new
end



def create



end


end
