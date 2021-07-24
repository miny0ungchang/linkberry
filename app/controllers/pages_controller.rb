class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home results earlybird]

  def home
  end

  def earlybird
  end

  def dashboard
    @user = current_user
  end

  def showmatch
    @matched_user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { matched_user: @matched_user } }
    end
  end

  def networks
    if current_user.nil?
      @connections = Connection.none
    else
      @connections = Connection.where(connecting_id: current_user.id) + Connection.where(connecter_id: current_user.id)
    end
  end

  def results
    @industry_to = params[:query_to] || "A Tech Role"
    @industry_from = params[:query_from] || "Your industry"
    @role_from = params[:query_role] || "Your role"

    if current_user.nil?
      @results = User.all.order(:id)
    else
      @results = User.all.where.not(id: current_user.id).order(:id)
    end

    @search_filter_to = @results.where(future_role: @industry_to)
    @search_filter_from = @search_filter_to.where("current_industry ~* ?", @industry_from)
    @search_filter_role = @search_filter_from.where(current_role: @role_from)

    # Nicole's code - re-instated 19-Jun
    if @industry_to.nil? && @industry_from.nil? && @role_from.nil?
      @shortlisted_profiles = @results
      @shortlist_msg = 'Please do not leave the search empty!'
    elsif @industry_to == "Still Exploring"
      @shortlisted_profiles = @results
      @shortlist_msg = "Here are some suggestions"
    elsif @industry_to.nil? || @industry_from.nil? || @role_from.nil?
      @shortlisted_profiles = @results.where(future_role: @industry_to) + @results.where(current_industry: @industry_from) + @results.where(current_role: @role_from)
      if @shortlisted_profiles.empty?
        @shortlisted_profiles = @results
      end
      @shortlist_msg = 'For better search result, please do not leave any field empty!'
    elsif @search_filter_to.empty?
      @shortlisted_profiles = @results
      @shortlist_msg = "Sorry there are no exact matches for your search. However, you could be the pioneer in this path and there may be people who wish to be like you in the future. Here are other profiles you may be interested in!"
    elsif @search_filter_role.empty?
      @shortlisted_profiles = @search_filter_to + @search_filter_from
      @shortlisted_profiles = @shortlisted_profiles.uniq
      @shortlist_msg = 'We could not find exact matches for your current industry but you may want to look up these....'
    else
      @shortlisted_profiles = @search_filter_role.uniq
      @shortlist_msg = 'Here are profiles that exactly match your search !'
    end
  end
end
