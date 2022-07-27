class Schedule < ApplicationRecord
    validates :title, 
        presence: true,
        length: {maximum: 22 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: { maximum: 360 }
    validate :start_end_check

    def start_end_check
        if end_date.present? && start_date.present?
            if end_date < start_date
                errors.add(:end_date, "は開始日より前の日付を登録できません")
            end
        end
    end
end
