class ProjectsController < ApplicationController

  # == Begin  == 
  # Definition: "A startup can see a list of his projects" 
  # This method allows you to get a list of projects and 
  # moves with a session_id of an entity in order to 
  # list all the project's of the startup
  # that belong to a specific startup and is linked to the index HTML file
  # respond_to --> gives a direct access to the HTML/XML/PDF whatever is it
  # it's reachable and knows what's happening in the file.
  # Input: entity_id, startup_id.
  # Output: project_id "all project description in a list".
  # Author: Hana Magdy.

  def index
    session[:entity_id] = 1
    @projects = Project.listing_projects(Startup.find(session[:entity_id]))
    # @projects = Project.all
    # @startup = Startup.find(session[:entity_id])
    # @projects = @startup.project.find( :all)

    respond_to do |format|
      format.html
    end
  end


  # Definition: "As a startup, I can set a project goal, milestone,
  # requirements (roles, resources) "
  # This method shows all details of a project
  # that belong to a specific startup and is linked to the show HTML file
  # which also includes the launch and editing part
  # respond_to --> gives a direct access to the HTML/XML/PDF whatever is it
  # it's reachable and knows what's happening in the file.
  # Input: Project_id.
  # Output: Project_id "all project description".
  # Author: Hana Magdy.

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
    end
  end


  # Definition: "As a startup, I can set a project goal, milestone,
  # requirements (roles, resources)"
  # This method allows you to edit a project given its project's id.
  # Input: Project_id.
  # Output: Project_id "specifically goals, milestones and requirements".
  # Author: Hana Magdy.

  def edit
    @project = Project.find(params[:id])
  end


  # Definition: "As a startup, I can set a project goal, milestone,
  # requirements (roles, resources)"
  # Allows editing the project's details, specifically goals, milestones and requirements
  # Redirects user to project's page (show project) on success
  # Re-renders the edit project page on error and is linked to the edit HTML file
  # update_attribute --> updates the rows
  # respond_to --> gives a direct access to the HTML/XML/PDF whatever is it
  # it's reachable and knows what's happening in the file.
  # Input: project_id. "on the show page".
  # Output: project "all project description along successfully edited goals, 
  # milestones and requirements".
  # Author: Hana Magdy.

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project].permit(:goals, :milestones, :requirements))
        format.html { redirect_to @project, notice: "Successfully updated project" }
      else
        format.html { render :edit }
      end
    end

  end


  # Definition: "A project is launched after all requirements are met"
  # Changes the status of a project and redirects to the project's 
  # page (show project) on success or error
  # with the exception of displaying a success/error message
  # update_attribute --> updates the rows
  # update the status of launch project from unlaunch to launched and vice versa.
  # Input: project_id. "on the show page".
  # Output: Void "it's an action" returns the success of the
  # changeable button of launch upon of it's previous status. 
  # Author: Hana Magdy.

  def change_launch_status
    project = Project.find(params[:id])
    respond_to do |format|

      if project.update_attribute(:launch, !project.launch)
        flash.notice = "Successfully launched project"
      else
        flash.alert = "Oops, couldn't launch project"
      end

      format.html { redirect_to project }

    end
  end

  # == End  == 

  
  # =begin
  # This methods queries the table project for projects that are in the same category and location as the current project
  # Input: selected project id
  # Output: @suggested
  # Author: Yomn El-Mistikawy
  # =end

  def suggest
    @project= Project.find(1)
    @suggested= Project.where(:location => "cairo", :category => "baking").where.not(:id => "1", :startup_id => "1")
  end

  
  # =begin
  # This method shows the profile of the selected suggested project
  # Input: selected project id
  # Output: view showing the profile of the project with a merge request button
  # Author: Yomn El-Mistikawy
  # =end
  def showSuggested
    @project= Project.find(params[:project])
  end


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to @project
  end

  private
  def project_params
    params[:project].permit(:name, :category, :location, :description)
  end

end
