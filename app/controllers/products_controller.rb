class ProductsController < ApplicationController
	def index
		@products = Product.all

		respond_to do |format|
			format.html # show default view
			format.json {render :json => @products}
		end
	end

	def create
		@product = Product.new(params[:product])
			if @product.save
				respond_to do |format|
					format.html {render :action => "create"}
					format.json {render :json => @product}
				end
			else
				respond_to do |format|
					format.html {render :action => "new"}
					format.json {render :json => @product.errors, :status => :unprocessable_entity}
				end
			end

	end

	def new
		@product = Product.new(:name => 'Orange', :price => 10)
	end
end
