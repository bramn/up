# frozen_string_literal: true
module ApplicationHelper

  def markdown(text)
    return if text.blank?

    options = %i[hard_wrap autolink no_intra_emphasis fenced_code_blocks tables]
    Markdown.new(text, *options).to_html.html_safe
  end

end
