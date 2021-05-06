class TicketsController < ApplicationController
  def index
    render :index, locals: { ticket: Ticket.new }
  end

  def create
    Ticket.create!(ticket_params)

    redirect_to root_path
  end

  private

  def ticket_params
    params.require(:ticket).permit!
  end
end
