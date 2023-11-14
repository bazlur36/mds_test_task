# app/models/user.rb

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_id, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def self.import(file)
    spreadsheet = Roo::Excelx.new(file.path)
    successful_imports = 0
    unsuccessful_imports = 0

    spreadsheet.sheets.each do |sheet_name|
      header = spreadsheet.sheet(sheet_name).row(1).map { |h| h.downcase }

      (2..spreadsheet.sheet(sheet_name).last_row).each do |i|
        row = Hash[[header, spreadsheet.sheet(sheet_name).row(i)].transpose]
        user = find_by(email_id: row['email_id']) || new
        user.attributes = row.transform_keys(&:underscore)

        if user.valid?
          successful_imports += 1
          user.import_failure_message = nil
          user.save
        else
          unsuccessful_imports += 1
          user.import_failure_message = user.errors.full_messages.join(', ')
          user.save(validate: false)
        end
      end
    end

    return {successful_imports: successful_imports, unsuccessful_imports: unsuccessful_imports}
  end
end
