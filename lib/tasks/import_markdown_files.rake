# frozen_string_literal: true

desc 'Import all Markdown files in docs'
task import_markdown_files: [:environment] do

  stdout, _status = Open3.capture2('find . -name "*.md"', chdir: "#{Rails.root}/docs")

  stdout.split("\n").each do |path|
    docs_path = "#{Rails.root}/docs"
    puts path
    file = "#{docs_path}/#{path}"
    content = File.read(file)
    matches = content.match(/-{3}(?<attributes>.*?)-{3}(?<body>.*)/m)
    if matches.present?
      body = matches[:body]
      title_matches = matches[:attributes].match(/title:(?<title>.*)/)
    end

    path_matches = path.match(%r{.*/(?<title>.*)\.md})
    title = title_matches&.[](:title) || path_matches&.[](:title) || path
    page = Page.find_or_initialize_by(path: path)
    page.body = body
    page.title = title.strip

    path_name = Pathname.new(file).parent
    path = path_name.relative_path_from(docs_path).to_s
    folders = []
    while path != '.'
      folder = Folder.find_or_initialize_by(path: path)
      folder.base_name = path_name.basename
      folder.save
      folders << folder
      path_name = path_name.parent
      path = path_name.relative_path_from(docs_path).to_s
    end

    folders&.reverse[1..]&.each_with_index do |folder, index|
      folder.parent_folder = folders[index - 1]
    end

    folders.each(&:save)

    page.folder = folders[0]
    page.save
  end
end
