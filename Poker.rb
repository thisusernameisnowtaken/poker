#input is currently done via the hand array, at the bottom of the program.

def describe_hand(hand)
    if check_valid_hand(hand)
        puts hand_description(hand)
    else
        puts "invalid hand"
    end
end

def compare_hands(hand1, hand2)
end

def check_valid_hand(hand)
    return true
end

def hand_description(hand)
    check_for_royal_flush(hand) #A,K,Q,J,10 all from same suit
    check_for_straight_flush(hand)  #all in sequence from same suit
    check_for_four_of_a_kind(hand)   #4 cards same value
    check_for_full_house(hand)  #three of a kind with one pair
    check_for_flush(hand)   #all 5 same suite, but not in sequence
    check_for_straight(hand)    #5 cards in sequence but not same suit
    check_for_three_of_a_kind(hand) #three cards, same value
    check_for_two_pair(hand)    #2 pairs of same value
    check_for_one_pair(hand) #a pair of same value
    find_highest_card(hand) #highest value card
end

def check_for_royal_flush(hand)
    if in_sequence(hand) && same_suite(hand) && hand.include?("Kd" || "Ks" || "Kh" || "Kc" )
        return true
    end
    return false
end

def check_for_straight_flush(hand)
    if in_sequence(hand) && same_suite(hand)
        return true
    end
    return false
end

def check_for_four_of_a_kind(hand)
    valueGroup = group_values(hand).map{|key, value| key if value == 3}.compact
    if valueGroup.length != 0
        return true
    end
    return false
end

def check_for_full_house()
     valueGroup = group_values(hand).map{|key, value| key if value == 2}.compact
     suitGroup = group_suites(hand).map{|key, value| key if value == 3}.compact
    if valueGroup.length != 0 && suitGroup.Length != 0
        return true
    end
    return false
end

def check_for_flush(hand)
    suitGroup = group_suites(hand).map{|key, value| key if value == 5}.compact
    if suitGroup.length != 0
        return true
    end
    return false
end

def check_for_straight(hand)
    if in_sequence(hand)
        return true
    end
end

def check_for_three_of_a_kind()
    
end

def check_for_two_pair()
    
end

def check_for_one_pair(valueGroups)
    
end

def find_highest_card()
    
end

def in_sequence(hand)
    cardValues = get_card_values(hand)
    cardIntegerValues = convert_char_values_to_integer(cardValues)
    cardIntegerValues.sort!
    return cardIntegerValues.each_cons(2).all? {|a, b| b == a + 1 }
end

def same_suite(hand)
    cardSuites = get_card_suites(hand)
    if cardSuites.uniq!.length = 1
        return true
    else
        return false
    end
end

def group_values(hand)
    cardValues = get_card_values(hand)
    return cardValues.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
end

def group_suites(hand)
    cardSuit = get_card_suites(hand)
    return cardSuit.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
end

def convert_char_values_to_integer(cardValues)
    charIntegerEquivalent = make_char_integer_hash()
    cardIntegerValues = replace_char_vals_with_int_equivalents(charIntegerEquivalent)
    return cardIntegerValues
end

def replace_char_vals_with_int_equivalents(charIntegerEquivalent)
    return charIntegerEquivalent.map do |originalVal|
        if originalVal.is_a?(String)
            charIntegerEquivalent[originalVal]
        end
    end 
end

def make_char_integer_hash()
    return { "A" => 14, "T" => 10, "J" => 11, "Q" => 12, "K" => 13  }
end

def get_card_values(hand)
    return hand.map {|card| card[1]}
end

def get_card_suites(hand)
    return hand.map {|card| card[0]}
end

hand = ["As", "2h", "2c", "6d", "8h"]
describe_hand(hand)