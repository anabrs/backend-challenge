# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  def index
    @members = current_user.members
  end

  def show
  end

  def new
    @member = Member.new()
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    @member.user = current_user

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: "Member was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: "Member was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
    end
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :website_url)
    end
end
