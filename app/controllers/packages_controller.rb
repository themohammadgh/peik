class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    params[:package][:images].each do |image|
      mini_image = MiniMagick::Image.new(image.tempfile.path)
      mini_image.resize "200x200"
    end
    if @package.save
      flash[:notice] = "package created successfully."
      redirect_to(packages_path)
    else
      render("new")
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    if @package.update_attributes(package_params)
      flash[:notice] = "package updated successfully."
      redirect_to(packages_path)
    else
      render("edit")
    end
  end

  def delete
    @package = Package.find(params[:id])
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    flash[:notice] = "package destroyed successfully."
    redirect_to(packages_path)
  end

  private

  def package_params
    params.require(:package).permit(
      :weight,
      :size,
      :description,
      :est_value,
      :destination,
      :origin,
      :sender_id,
      :traveler_id,
      :trip_id,
      :receiver_fullname,
      :receiver_phone,
      :reveiver_extra,
      images: [],
    )
  end
end
