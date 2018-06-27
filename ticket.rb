
class Ticket

	attr_accessor :parcel_code, :weight, :slot_number

	def initialize(parcel_code, weight, slot_number)
	    @parcel_code = parcel_code
	    @weight = weight
	    @slot_number = slot_number
	end

end