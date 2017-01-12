require 'httparty'

class ApiProspectsController < ApplicationController
  before_action :authenticate!
  
  def index
    @prospects = get_response('http://tuskermarvel.com/prospects.json')
    render json: @prospects
  end

  def packages
    @packages = get_response('http://tuskermarvel.com/packages.json')
    render json: @packages
  end

  def packagesCity
    @prospects = get_response('http://tuskermarvel.com/prospects.json')
    @packages = get_response('http://tuskermarvel.com/packages.json')
    @contents = []

    @prospects.each do |prospects|
      if prospects["delivery_city"] == params[:city]
        prospects["received"].each do |received|
          r = received
          @packages.each do |packages|
            packages["contents"].each do |content|
              if r == content
                @contents.push(packages["code"])
              end
            end
          end
        end
      end
    end
    render json: @contents
  end

  private

  def get_response(url)
    response = HTTParty.get(url)
    @output = JSON.parse(response.body)
  end
end