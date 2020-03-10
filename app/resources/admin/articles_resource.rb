class ::Admin::ArticlesResource
  @@resource = nil
  def self.resource
    if @@resource == nil
      ns = ActiveAdmin.application.namespace(:admin)

      @@resource = ActiveAdmin::Resource.new(ns, Article, {})

      @@resource.dsl = ActiveAdmin::ResourceDSL.new(@@resource)
      block = Proc.new do
        menu label: 'My Articles', priority: 1
      end
      @@resource.dsl.run_registration_block(&block)
    end
    @@resource
  end
end