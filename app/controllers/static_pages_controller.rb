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
	if @prediction == "male"
		respond_to do |format|
			format.js {render "show_male"}
		end
	elsif @prediction == "female"
		respond_to do |format|
			format.js {render "show_female"}
		end
	end
	# redirect_to root_path(prediction: @prediction, probability: @probability)
	end
end
