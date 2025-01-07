class CompetitionsController < ApplicationController
  def participate
    Competition.find_by_id(params[:competition_id])
               .competitions_users.create(user_id: current_user.id, role: 1)
  end
  def judge
    Competition.find_by_id(params[:competition_id])
               .competitions_users.create(user_id: current_user.id, role: 2)
  end
  def new
    @competition = Competition.new
  end

  def create
  end

  def edit
    @competition = Competition.find(params[:id])
  end

  def update
    @competition = Competition.find(params[:id])
    if @competition.update(competition_params)
      redirect_to @competition, notice: "Соревнование успешно обновлено."
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :min_athlete_weight, :max_athlete_weight, :starts_at, :ends_at)
  end
end
