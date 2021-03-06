class TitlesController < ApplicationController
	# GET /titles
  	# GET /titles.xml
  	def index
    	@titles = Title.all

    	respond_to do |format|
      	format.html # index.html.erb
      	format.xml  { render :xml => @titles }
    	end
  	end

  	# GET /titles/1
    # GET /titles/1.xml
    def show
      @title = Title.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @title }
      end
    end
    
    # GET /titles/new
    # GET /titles/new.xml
    def new
      @title = Title.new
     
      if (params.has_key?(:platform))
        @platform = Platform.find(params[:platform])
        @game = Game.new
      end
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @title }
      end
    end
    
    # GET /titles/1/edit
    def edit
      @title = Title.find(params[:id])
    end

    # Title /title
    # Title /titles.xml
    def create
      @title = Title.new(params[:title])
      @platform = Platform.find(params[:platform])
      puts(@platform)
      @game = @title.games.build(:platform => @platform)

      respond_to do |format|
        if @title.save
          format.html { redirect_to(@title, :notice => 'Title was successfully created.') }
          format.xml  { render :xml => @game, :status => :created, :location => @title }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @title.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    
    # PUT /titles/1
    # PUT /titles/1.xml
    def update
      @title = Title.find(params[:id])

      respond_to do |format|
        if @title.update_attributes(params[:title])
          format.html { redirect_to(@title, :notice => 'Title was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @title.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    # DELETE /titles/1
    # DELETE /titles/1.xml
    def destroy
      @title = Title.find(params[:id])
      @title.destroy

      respond_to do |format|
        format.html { redirect_to(titles_url) }
        format.xml  { head :ok }
      end
    end
end