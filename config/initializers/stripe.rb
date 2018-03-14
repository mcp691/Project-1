if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_0jYHO5Gy040adUZhAQ1Och4o',
    secret_key: 'sk_test_ebjz1Zxby1s4ga94pUSRua7l'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
