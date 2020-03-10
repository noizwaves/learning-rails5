class ::Admin::ArticlesResource
  @@resource = nil
  @@lazy_resource = nil

  def self.resource
    if @@resource == nil
      @@resource = self.lazy_resource

      @@resource.dsl = ActiveAdmin::ResourceDSL.new(@@resource)
      block = Proc.new do
        # Imperative definition of resource here
      end
      @@resource.dsl.run_registration_block(&block)
    end
    @@resource
  end

  def self.lazy_resource
    if @@lazy_resource == nil
      ns = ActiveAdmin.application.namespace(:admin)

      @@lazy_resource = ActiveAdmin::Resource.new(ns, Article, {})

      # Declarative definition of resource here
      @@lazy_resource.menu_item_options = { label: 'My Articles', priority: 1 }
    end
    @@lazy_resource
  end
end