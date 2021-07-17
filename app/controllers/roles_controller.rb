class RolesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /roles or /roles.json
  def index
    @roles = Role.all
  end

  # GET /roles/1 or /roles/1.json
  def show
    if @role.users.empty?
      @assosciated_user = 'None'
    else
      @assosciated_users = @role.users.map(&:name).join(', ')
    end
  end

  # GET /roles/new
  def new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles or /roles.json
  def create
    if @role.save
      redirect_to @role, notice: "Role was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    if @role.update(role_params)
      redirect_to @role, notice: "Role was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @role.destroy
    redirect_to roles_url
  end

  private

  
  # Only allow a list of trusted parameters through.
  def role_params
    params.require(:role).permit(:name, :description)
  end
end
