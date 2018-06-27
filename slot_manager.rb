class SlotManager

    def initialize(slot_count)
        @slot_list = [*1..slot_count/2].zip([*slot_count/2+1..slot_count].reverse).flatten.compact
        @slot_hash = Hash[*@slot_list.collect{|value|[value, true]}.flatten]
    end

    def get_slot
        @slot_list.find{|slot_number| @slot_hash[slot_number] == true} || false
    end

    def allocate_slot(slot_number)
        @slot_hash[slot_number] = false
    end

    def free_slot(slot_number)
        @slot_hash[slot_number] = true
    end

end