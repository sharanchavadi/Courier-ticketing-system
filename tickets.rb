require './ticket'

class Tickets

    def initialize()
        @tickets = []
    end

    def create_ticket(parcel_code, weight, slot_number)
        ticket = Ticket.new(parcel_code, weight, slot_number)
        @tickets << ticket
    end

    def delete_ticket(slot_number)
        ticket = @tickets.find{|ticket| ticket.slot_number == slot_number}
        @tickets.delete(ticket)
    end

    def status
        puts "Slot_No\tReg_No\tWeight"
        @tickets.each do |ticket|
            puts "#{ticket.slot_number}\t#{ticket.parcel_code}\t#{ticket.weight}"
        end
    end

    def parcel_code_for_parcels_with_weight(weight)
        @tickets.collect{|ticket| ticket.parcel_code if ticket.weight === weight}.compact
    end

    def slot_number_for_registration_number(parcel_code)
        @tickets.find{|ticket| ticket.parcel_code === parcel_code}&.slot_number
    end

    def slot_numbers_for_parcels_with_weight(weight)
        @tickets.collect{|ticket| ticket.slot_number if ticket.weight === weight}.compact
    end

end