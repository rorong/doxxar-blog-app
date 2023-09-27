RailsAdmin.config do |config|
  config.asset_source = :importmap
  require 'sanitize'

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.model 'Blog' do
    list do
      field :title
      field :content do
        formatted_value do
          sanitized_content = Sanitize.fragment(bindings[:object].content)
          sanitized_content.html_safe
        end
      end
      field :author
      field :user_id
    end
  end
  config.model 'Blog' do
    edit do
      field :title
      field :content, :ck_editor
      field :author
      field :user_id
    end
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
