class UsersController < ApplicationController
  def index
    # @users = User.by_total_points.limit(50)
    #   byebug

      if params[:page].blank?
          @page = 1
      else
          @page = params[:page].to_i
      end

      @users = User.order(:id).page(@page)

      @paginate = PaginationHelper::Paginate.new records: @users, selected_page: @page
  end
end
