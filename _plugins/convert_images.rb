require "jekyll"

Jekyll::Hooks.register [:pages, :documents], :pre_render do |doc, payload|
    doc.content = doc.content.gsub(
        /\!\[([^\]]+)\]\(([^\)]+)\)/,
        '<figure class="image"><img src="\2" alt="\1"></figure>'
    )
end