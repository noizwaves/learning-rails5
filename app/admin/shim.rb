# def load_resources_for_namespaces
#   admin = ActiveAdmin.application.namespace(:admin)
#
#   resources = [ Admin::ArticlesResource.lazy_resource ]
#
#   # Following inspired by ActiveAdmin::Namespace.register(resource_class, options = {}, &block)
#   resources.each do |r|
#     admin.resources.add r
#       # TODO: announce we did a thing?
#     # ActiveSupport::Notifications.publish ActiveAdmin::Resource::RegisterEvent, config
#   end
#   admin.reset_menu!
# end

# load_resources_for_namespaces

class MenuItem
  def initialize(id, label, url)
    @id = id
    @label = label
    @url = url
  end

  def options(overrides)
    defaults.merge(overrides)
  end

  private
  def defaults
    {
        id: @id, # TODO: get id from model symbol magic
        label: @label,
        url: @url, # TODO: Lookup magic path from model symbol here
        if: proc { true }, # TODO: hook into cancan
    }
  end
end

admin = ActiveAdmin.application.namespace(:admin)
admin.menus.on_build do
  menus = admin.menus

  menus.add :default, MenuItem.new('articles', 'Articles', '/admin/articles').options({ label: 'My Articles', priority: 1 })
end
