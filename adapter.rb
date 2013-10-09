class FacebookApi
  def get_email_from_user()
    "tony.cho+facebook@gmail.com"
  end
end

class TwitterApi
  def get_user_email()
    "tony.cho+twitter@gmail.com"
  end
end

class AdapterApi
  def initialize api
    @api = api
  end

  def get_email

  end
end

class FacebookApiAdapter < AdapterApi
  def initialize
    super FacebookApi.new
  end

  def get_email
    @api.get_email_from_user()
  end
end

class TwitterApiAdapter < AdapterApi
  def initialize
    super TwitterApi.new
  end

  def get_email
    @api.get_user_email()
  end
end

class User
  attr_accessor :emails
  def get_emails
    @emails = []

    adapter_classes = ["FacebookApiAdapter", "TwitterApiAdapter"]
    adapter_classes.each do |adapter_class|
      api = Object.const_get(adapter_class).new
      @emails << api.get_email
    end
  end
end

u = User.new
u.get_emails

p u.emails.inspect
