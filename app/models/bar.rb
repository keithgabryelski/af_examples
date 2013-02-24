class Bar < ActiveRecord::Base
  set_table_name :foos
  include PgAdvisoryLocker
end
