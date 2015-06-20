class Game < ActiveRecord::Base
  belongs_to :player1, class_name: "User", foreign_key: :player1_id
  belongs_to :player2, class_name: "User", foreign_key: :player2_id
  has_many :moves

  def users_turn
    if moves.count % 2 == 0
      player1
    else
      player2
    end
  end

  def turn
    if moves.count % 2 == 0
      1
    else
      2
    end
  end
end
