class App < E
  map '/contact/send'

  @@mail_options = {
    :address        => 'smtp.mandrillapp.com',
    :port           => '587',
    :authentication => :plain,
    :enable_starttls_auto => true
  }

  def post_mail
    subject = 'From nukomeet.com website'

    name = params[:name]
    from = params[:from]
    body = params[:body]

    result = Pony.mail({
      from: "#{name} <#{from}>",
      to: 'bonjour@nukomeet.com',
      subject: subject,
      body: body,
      via: :smtp,
      via_options: @@mail_options.merge!({
        :user_name      => ENV['MANDRILL_USER'],
        :password       => ENV['MANDRILL_PASS']
      })
    })

    if result
      "Email has been sent."
    else
      "Huston! We have a problem."
    end

  end
end