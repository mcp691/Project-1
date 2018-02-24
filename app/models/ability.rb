class Ability
  include CanCan::Ability

  def initialize(user)
    user ||- User.new # guest user (not logged in)
    can :manage, User, id: user.id

    return unless user && user.admin?
    can :delete, Comment
    can :manage, :all  
  end

end

# See the wiki for details:
# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
