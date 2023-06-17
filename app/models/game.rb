class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_many :expenses, dependent: :destroy

  def total_expense
    Expense.where(game_id: id).sum(:amount)
  end

  def all_expenses
    Expense.where(game_id: id)
  end
end
