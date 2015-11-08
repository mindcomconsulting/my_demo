class BasicInfosController < ApplicationController

	def index
         #debugger
		@basic_info = BasicInfo.all
	end

	def new
		@basic_info = BasicInfo.new
		#@article.build_picture
	end

	def edit		
		@basic_info = BasicInfo.find(params[:id])
    render :layout=> false
	end

	def create
   
	  @basic_info = BasicInfo.create(basic_info_params)
	    if @basic_info.save
	    #UserMailer.welcome_email(@article).deliver
      redirect_to :controller=>'basic_infos', :action=>'index'
	  else
	  	render 'new'
	  end	  
    end


  def update
    @basic_info = BasicInfo.find(params[:id]) 
    if @basic_info.update(basic_info_params)
      redirect_to :controller=>'basic_infos', :action=>'index'
    else
      render 'edit'
    end
  end

	def show
		@basic_info = BasicInfo.find(params[:id])
	end

  def destroy
    @basic_info = BasicInfo.find(params[:id])
    @basic_info.destroy
    redirect_to :controller=>'basic_infos', :action=>'index'
  end

  





	private
    def basic_info_params
    	params.require(:basic_info).permit(:title, :description)
    	#params.require(:article).permit(:name, :title, :fname, pictures_attributes: [:image])
    end


end

