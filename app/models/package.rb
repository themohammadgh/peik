class Package < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  has_many_attached :images

  #validate :image_type

  private

  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/png image/jpeg'))
        errors.add(:images, "needs to be a jpeg or png")
      end
    end
  end

  #* for resizing but i think it would resize just in front end
  # def thumbnail(input)
  #   return self.images[input].variant(resize: "100x100!").processed
  # end
  #* call in front end
  # <% @packages.each do |pkg| %>
  #   <tr>
  #   <th>origin</th>
  #   <td><%=pkg.origin%></td>
  # </tr>
  # <tr>
  #   <th>images</th>
  #   <%(0...pkg.images.count).each do |i|%>
  #   <td><%=image_tag(pkg.thumbnail(i))%></td>
  #   <%end%>
  # </tr>
  # <% end %>
end
