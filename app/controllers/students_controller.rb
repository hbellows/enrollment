class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :show, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    @student.save

    redirect_to student_path(@student)
  end

  def edit
  end

  def update
    @student.update(student_params)

    redirect_to student_path(@student)
  end

  def destroy
    Student.destroy(params[:id])

    redirect_to students_path
  end

  private

    def student_params
      params.require(:student).permit(:name)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end
