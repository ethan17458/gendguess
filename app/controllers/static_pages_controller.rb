class StaticPagesController < ApplicationController
	def index
	end

	def get_name
	begin
		name = Gendered::Name.new(params[:name])
		logger.debug name.guess!
		@prediction = name.guess!.to_s
		@probability = name.probability.to_f
	rescue
		redirect_to root_path
		return
	end
	redirect_to root_path(prediction: @prediction, probability: @probability)
	end
end
