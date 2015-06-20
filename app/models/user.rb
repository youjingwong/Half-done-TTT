class User < ActiveRecord::Base
  def games
    Game.where("player1_id = ? OR player2_id = ?", id, id)
  end

  def self.authenticate(passed_in_email, passed_in_password)
    @user = User.where(email: passed_in_email).first
    if @user && @user.password == passed_in_password
      @user
    else
      nil
    end
  end
end
