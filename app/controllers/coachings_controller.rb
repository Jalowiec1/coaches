class CoachingsController < ApplicationController
  # GET /coachings/new
  def new
    @coaching = Coaching.new
  end
  # POST /coachings
  # POST /coachings.json
  def create
    @coaching = Coaching.new(coaching_params)
    @coaching.save
    redirect_to coaches_path
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def coaching_params
      params.require(:coaching).permit(:student_id, :coach_id)
    end
end
