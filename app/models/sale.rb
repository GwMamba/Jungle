class Sale < ApplicationRecord

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
