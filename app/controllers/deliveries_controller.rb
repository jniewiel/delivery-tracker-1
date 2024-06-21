class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.where({ :user_id => current_user.id })

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_deliveries = Delivery.where({ :id => the_id, :user_id => current_user.id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.status = params.fetch("query_status")
    the_delivery.user_id = current_user.id

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery created successfully." })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    matching_deliveries = Delivery.where({ :id => the_id, :user_id => current_user.id })
    the_delivery = matching_deliveries.at(0)

    the_delivery.status = params.fetch("query_status")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries/#{the_delivery.id}", { :notice => "Delivery updated successfully."})
    else
      redirect_to("/deliveries/#{the_delivery.id}", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_deliveries = Delivery.where({ :id => the_id, :user_id => current_user.id })

    the_delivery = matching_deliveries.at(0)
    
    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
