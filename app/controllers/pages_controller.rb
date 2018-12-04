class PagesController < ApplicationController

  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    @header = "Welcome"
  end

  def about
    @header = "About Us"
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to "/welcome"
  end

  def kitten
  end

  def kittens
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://placekitten.com/#{requested_size}/#{requested_size}"
  end

  def secrets
    if params[:magic_word] == "tacosforever"
      render :secrets
    else
      redirect_to '/intruder'
    end
  end

  def intruder
    flash[:alert] = "Sorry, you're not authorized to see that page!"
    @header = "access denied!!!! get outta hurrrr"
  end

end
