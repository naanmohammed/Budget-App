require 'expense'

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.id.present?

    can :manage, Category, author_id: user.id
    can :manage, Expense, author_id: user.id
  end
end
