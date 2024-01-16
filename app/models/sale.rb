class Sale < ApplicationRecord

  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end


  def Ended?
    ends_on < Date.current
  end

  def Upcoming?
    sale.starts_on > Date.current
  end

  def Active?
    !Upcoming? && !Ended?
  end

end
