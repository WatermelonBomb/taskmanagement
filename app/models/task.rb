class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :due_date, presence: true
  validate :due_date_cannot_be_in_the_past, on: :create

  private

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.current
      errors.add(:due_date, "は今日以降の日付を選択してください")
    end
  end
end
