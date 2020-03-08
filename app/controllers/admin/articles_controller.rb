resource = Article

# Application.render type functionality
ns = ActiveAdmin.application.namespace(:admin)

# Namespace.register (and find_or_build_resource) type functionality
config = ActiveAdmin::Resource.new(ns, resource, {})
ns.resources.add config

# Namespace.register_resource_controller type functionality
class ::Admin::ArticlesController < ActiveAdmin::ResourceController; end
Admin::ArticlesController.active_admin_config = config

# TODO: Namespace.parse_registration_block type functionality here

# TODO: Namespace.reset_menu! type functionality here