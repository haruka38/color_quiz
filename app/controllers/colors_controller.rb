# app/controllers/colors_controller.rb
class ColorsController < ApplicationController
  before_action :set_quiz_session, only: [ :random, :answer, :result ]
  before_action :set_color, only: [ :show, :answer ]

  # ランダムな色を選んで show にリダイレクト
  def random
    color = Color.order("RANDOM()").first
    redirect_to color_path(color)
  end

  # 回答処理 → 正誤判定 → result へ
  def answer
    chosen = params[:choice]
    if chosen.blank?
      redirect_to color_path(@color), alert: "選択してください。"
      return
    end

    @correct = (@color.name == chosen)
    session[:score] += 1 if @correct
    session[:question_number] += 1

    # 結果画面に遷移
    redirect_to result_colors_path(id: @color.id, correct: @correct, chosen: chosen)
  end

  # 1問ごとの結果表示
  def result
    @color = Color.find(params[:id])
    @correct = params[:correct] == "true"
    @chosen = params[:chosen]
  end

  def reset
    # スコアと問題番号をリセット
    session[:score] = 0
    session[:question_number] = 0

    # ランダムな問題にリダイレクト
    redirect_to random_colors_path
  end

  private

  def set_color
    @color = Color.find(params[:id])
  end

  def set_quiz_session
    session[:score] ||= 0
    session[:question_number] ||= 0
  end
end
