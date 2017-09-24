module FavoritesHelper
    def user_has_favorites?
        current_user.favorites.count > 0
    end
end
