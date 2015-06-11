console.log "Collapsed panel"

expande = ()->
	$('[data-tools*="collapsed-ctrl"]').unbind('click').click (e)->
		$(@).addClass 'active'

		regexp = /\(([\w+])\)/
		str = $(@).data('tools')
		matched = str.match regexp
		$("[data-tools*='collapsed-panel(#{matched[1]})']").removeClass 'collapsed'

		$(@).unbind('click').click (e)->
			$(@).removeClass 'active'
			$("[data-tools*='collapsed-panel(#{matched[1]})']").addClass 'collapsed'
			expande()

expande()
