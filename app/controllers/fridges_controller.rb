class FridgesController < ApplicationController

get '/fridges' do 
    fridges = Fridge.all

    fridges.to_json(
        include: :foods
    )
end

post '/fridges' do
    newFridge = Fridge.create(
        location: params[:location],
    )
    newFridge.to_json(
        include: :foods
    )
end

delete '/fridges/:id' do
    deletedFridge = Fridge.find(params[:id])
    deletedFridge.foods.destroy_all
    deletedFridge.destroy
    deletedFridge.to_json
  end

patch '/fridges/:id' do
editFridge = Fridge.find(params[:id])
editFridge.update(
    location: params[:location],
)
editFridge.to_json(
    include: :foods
)
end


end