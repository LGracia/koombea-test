class CreditCardService
  class << self
    def call(number)
      franchise = case number
      when CreditCardRegex::AMERICAN_EXPRESS
        CreditCardTypes::AMERICAN_EXPRESS
      when CreditCardRegex::DINERS_CLUB
        CreditCardTypes::DINERS_CLUB
      when CreditCardRegex::DISCOVER
        CreditCardTypes::DISCOVER
      when CreditCardRegex::JCB
        CreditCardTypes::JCB
      when CreditCardRegex::MASTERCARD
        CreditCardTypes::MASTERCARD
      when CreditCardRegex::VISA
        CreditCardTypes::VISA
      else
        nil
      end

      franchise
    end
  end
end

module CreditCardTypes
  AMERICAN_EXPRESS = 'American Express'
  DINERS_CLUB = 'Diners Club'
  DISCOVER = 'Discover'
  JCB = 'JCB'
  MASTERCARD = 'MasterCard'
  VISA = 'Visa'
end

module CreditCardRegex
  AMERICAN_EXPRESS = /^3[47][0-9]{5,}$/
  DINERS_CLUB = /^3(?:0[0-5]|[68][0-9])[0-9]{4,}$/
  DISCOVER = /^6(?:011|5[0-9]{2})[0-9]{3,}$/
  JCB = /^(?:2131|1800|35[0-9]{3})[0-9]{3,}$/
  MASTERCARD = /^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$/
  VISA = /^4[0-9]{6,}$/
end
