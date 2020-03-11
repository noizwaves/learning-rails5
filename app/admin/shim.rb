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

  # WIP gemhack to print out all menu items
  #             overrides = @menu_item_options.except(:id, :label, :url)
  #             label =
  #                   if @menu_item_options[:label].respond_to? :call
  #                     @menu_item_options[:label].call
  #                   else
  #                     @menu_item_options[:label]
  #                   end
  #             url =
  #                 if @menu_item_options[:url].respond_to? :call
  #                   @menu_item_options[:url].call
  #                 else
  #                   @menu_item_options[:url]
  #                 end
  #             puts "menus.add :default, MenuItem.new('#{@menu_item_options[:id]}', '#{label}', '#{url}').options(#{overrides})"

  menus.add :default, MenuItem.new('articles', 'Articles', '/admin/articles').options({ label: 'My Articles', priority: 1 })
end
