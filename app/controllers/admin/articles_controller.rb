class ::Admin::ArticlesController < ActiveAdmin::ResourceController; end

# Insert existing ActiveAdmin::Resource into the the controller here
ns = ActiveAdmin.application.namespace(:admin)
resource = ActiveAdmin::Resource.new(ns, Article, {})
resource.dsl = ActiveAdmin::ResourceDSL.new(resource)
block = Proc.new do
  # Imperative definition of resource here
end
resource.dsl.run_registration_block(&block)

Admin::ArticlesController.active_admin_config = resource
