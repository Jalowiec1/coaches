module UsersHelper
    def coach
        @user.if_coach
    end
end
