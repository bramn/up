class Folder < ApplicationRecord

  has_many :pages

  has_many :child_folders, class_name: 'Folder', foreign_key: :parent_folder_id
  belongs_to :parent_folder, class_name: 'Folder', optional: true

end
