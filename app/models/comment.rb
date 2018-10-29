class Comment < ApplicationRecord
  belongs_to :user #一つのコメントからみてユーザーは一人
  belongs_to :topic #一つのコメントからみてトピックは一つ
end
