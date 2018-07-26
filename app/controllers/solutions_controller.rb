class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]

  # GET /solutions
  # GET /solutions.json
  def index
    @settings = Setting.where(setting_name: "section")
    @latest = Solution.order(created_at: :desc).last(10)
    @solutions = if params[:term]
        Solution.where('title LIKE ? OR body LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%")
      else
        Solution.all
      end
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @settings = Setting.where(setting_name: "section")
  end

  # GET /solutions/new
  def new
    @solution = Solution.new
    @settings = Setting.where(setting_name: "section")
  end

  # GET /solutions/1/edit
  def edit
    @settings = Setting.where(setting_name: "section")
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = current_user.solutions.new(solution_params)

    respond_to do |format|
      if @solution.save
        format.html { redirect_to "/solutions", notice: 'Пост добавлен' }
        format.json { render :show, status: :created, location: @solution }
      else
        format.html { render :new }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to request.referrer, notice: 'Пост обновлен' }
        format.json { render :show, status: :ok, location: @solution }
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Пост удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:section, :title, :body, :tags, :term)
    end
end
