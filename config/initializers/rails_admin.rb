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
  config.included_models = ['Blog']

  config.model 'Blog' do
    list do
      field :heading
      field :title
      field :author
      field :is_published
      field :user_id
    end
  end
  config.model 'Blog' do
    edit do
      field :heading
      field :banner_image
      field :title
      field :content, :ck_editor
      field :is_published, :enum do
        enum do
          [['Published', true], ['Not Published', false]]
        end
      end
      field :author
      field :language, :enum do
        enum do
          [['English'], ['French']]
        end
      end
      field :user_id, :enum do
        enum do
          User.all.map { |user| [user.email, user.id] }
        end
      end
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
