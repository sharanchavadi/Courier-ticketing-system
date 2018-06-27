require './tickets'
require './slot_manager'

class Executor

    def initialize
        @tickets = Tickets.new
        @commands = [
            'create_parcel_slot', 
            'park', 
            'leave', 
            'status', 
            'parcel_code_for_parcels_with_weight', 
            'slot_number_for_registration_number', 
            'slot_numbers_for_parcels_with_weight'
        ]
    end

    def create_parcel_slot(commands)
        slot_count = commands[1].to_i
        @slot_manager = SlotManager.new(slot_count)
        puts "Created a parcel slot with #{slot_count} slots"
    end

    def park(commands)
        slot_number = @slot_manager.get_slot()
        if !slot_number
           puts 'Sorry, parcel slot is full'
        else
           @tickets.create_ticket(commands[1], commands[2], slot_number)
           @slot_manager.allocate_slot(slot_number)
           puts "Allocated slot number: #{slot_number}"
        end
    end

    def parcel_code_for_parcels_with_weight(commands)
        weight = commands[1]
        parcel_codes = @tickets.parcel_code_for_parcels_with_weight(weight)
        puts parcel_codes.empty?? 'Not found': parcel_codes.join(', ')
    end

    def slot_number_for_registration_number(commands)
        parcel_code = commands[1]
        puts @tickets.slot_number_for_registration_number(parcel_code) || 'Not found'
    end

    def slot_numbers_for_parcels_with_weight(commands)
        weight = commands[1]
        slot_numbers = @tickets.slot_numbers_for_parcels_with_weight(weight)
        puts slot_numbers.empty?? 'Not found': slot_numbers.join(', ')
    end

    def status(commands)
        @tickets.status
    end

    def leave(commands)
        slot_number = commands[1].to_i
        @tickets.delete_ticket(slot_number)
        @slot_manager.free_slot(slot_number)
        puts "Slot number #{slot_number} is free"
    end

    def execute(str_command)
        commands = str_command.split(" ")
        if @commands.include?(commands[0])
           self.send(commands[0], commands) #using .send() method to eliminate checking the condition each time and calling the respective method which is entered as string command. passing method name and array as arguments.
        else
           puts 'Command not found'
        end
    end

end