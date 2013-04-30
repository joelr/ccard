class Card
  attr_accessor :card_number, :card_number_array

  def initialize(card)
    self.card_number = card.gsub(/ |-/,'')
    self.card_number_array = self.card_number.split(//).reverse.map(&:to_i)
  end

  def valid?
    /^[\d]/.match(card_number) ? valid_luhn? : false
  end

  def type
    if /^4[0-9]{12}(?:[0-9]{3})?$/.match(self.card_number)
      "VISA"
    elsif /^5[1-5][0-9]{14}$/.match(self.card_number)
      "MasterCard"
    elsif /^3[47][0-9]{13}$/.match(self.card_number)
      "AMEX"
    elsif /^6011[0-9]{12}$/.match(self.card_number)
      "Discover"
    else
      "Unknown"
    end
  end

  def output
    type + ": " + self.card_number + (valid? ? " (valid)" : " (invalid)")
  end

  private

  def valid_luhn?
    check_sum = 0
    self.card_number_array.each_with_index{ |v,i| check_sum += i.odd? ? (v * 2).to_s.split(//).map(&:to_i).inject{ |s,x| s + x } : v }
    check_sum % 10 == 0
  end

end
