module TagsHelper
  def social_button(url, icon, opts = {})
    default_opts = {
      :btn_classes => "social-btn btn-large btn-floating waves-effect",
      :icon_classes => "social-icon fa #{icon}" 
      }
    default_opts.merge(opts);
    content_tag(:div, :class => "social-padding") do
      content_tag(:div, :class => default_opts[:btn_classes]) do
        content_tag(:a, :href => url) do
          content_tag(:i, :class => default_opts[:icon_classes]) do
          end
        end
      end
    end
  end
end
