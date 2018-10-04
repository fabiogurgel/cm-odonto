class Ability
  include CanCan::Ability

  def initialize(user)
      # user ||= User.new # guest user (not logged in)
      case user.profile
      when 'admin'
        can :manage, :all
      when 'writer'
        # can :access, :rails_admin
        # can :dashboard
        # can :read, :all
        can :dashboard
        can :access, :rails_admin
        can [:read, :create, :destroy, :edit], Agenda
        can [:read, :create, :destroy, :edit], Cliente
        can [:read, :create, :destroy, :edit], Procedimento
        can [:read, :create, :destroy, :edit], TipoProcedimento
        can [:read, :create, :destroy, :edit], Consultorio
      else
        can :dashboard
        can :read, :all
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
