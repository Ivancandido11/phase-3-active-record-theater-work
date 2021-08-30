class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.pluck(:actor)
  end

  def locations
    auditions.pluck(:location)
  end

  def lead
    hired_actor = auditions.find_by(hired: true)
    hired_actor ? hired_actor : "no actor has been hired for this role"
  end

  def understudy
    hired_actors = auditions.filter {|aud| aud.hired == true}
    hired_actors.size > 1 ? hired_actors[1] : "no actor has been hired for understudy for this role"
  end
end