console.log "Extandable"

# TODO: Убрать класс deactivated

# Находит все блоки, в которых при нажатии нужно заменить текстовое окно на
# окно ввода

$('[data-tools*="extendable"]').click (e)->
	$field = $($(@).find('.input-field'))
	$text = $($(@).find('.input-text'))

	if $field.hasClass 'deactivated'
		$text.addClass 'deactivated'
		$field.removeClass 'deactivated'
		unfocused $(@), $field, $text
	else
		$text.fadeOut()
		$field.fadeIn()

unfocused = ($el_wr, $field_el, $text_el)->
	$field_el.unbind('change blur').on 'change blur', ()->
		if $field_el.is( 'input' ) || $field_el.is( 'textarea' )
			$text_el.html $field_el.val()
		else
			$text_el.html $('option:selected', $field_el).text()
		$field_el.addClass 'deactivated'
		$text_el.removeClass 'deactivated'

# deactivate = ()->
