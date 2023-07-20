class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    else
      can :read, Record, author_id: user.id
      can :create, Record, author_id: user.id
      can :update, Record, author_id: user.id
      can :destroy, Record, author_id: user.id
      can :manage, Category, user_id: user.id
    end
  end
end
