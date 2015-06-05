console.log "Card state"

card_states_arr = ['new', 'pending', 'notice', 'success', 'done', 'error', 'failed']

$('[data-tools*="card-state"]').click (e)->
	card = $(@)
	card.find('select').on 'change', (e)->
		state = $(@).val()
		for card_state in card_states_arr
			card.removeClass "card-#{card_state}" if card.hasClass "card-#{card_state}"
			break
		card.addClass "card-#{state}"