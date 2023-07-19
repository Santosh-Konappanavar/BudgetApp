class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, Record
      can :create, Record, user_id: user.id
      can :update, Record, user_id: user.id
      can :destroy, Record, user_id: user.id
    end
  end
end
