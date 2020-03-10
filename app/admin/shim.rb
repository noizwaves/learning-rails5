def load_resources_for_namespaces
  admin = ActiveAdmin.application.namespace(:admin)

  resources = [ Admin::ArticlesResource.lazy_resource ]

  resources.each { |r| admin.resources.add r }
end

load_resources_for_namespaces