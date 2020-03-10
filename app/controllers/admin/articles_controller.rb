class ::Admin::ArticlesController < ActiveAdmin::ResourceController; end


# Inject fully loaded resource here
Admin::ArticlesController.active_admin_config = Admin::ArticlesResource.resource