def load_resources_for_namespaces
  admin = ActiveAdmin.application.namespace(:admin)

  resources = [ Admin::ArticlesResource.lazy_resource ]

  # Following inspired by ActiveAdmin::Namespace.register(resource_class, options = {}, &block)
  resources.each do |r|
    admin.resources.add r
      # TODO: announce we did a thing?
    # ActiveSupport::Notifications.publish ActiveAdmin::Resource::RegisterEvent, config
  end
  admin.reset_menu!
end

load_resources_for_namespaces