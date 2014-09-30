Handlebars.registerHelper 'ifCond', (v1, operator, v2, options)->
	switch operator
		when '==', '==='
			return if v1 is v2 then options.fn @ else options.inverse @
		when '<'
			return if v1 < v2 then options.fn @ else options.inverse @
		when '<='
			return if v1 <= v2 then options.fn @ else options.inverse @
		when '>'
			return if v1 > v2 then options.fn @ else options.inverse @
		when '>='
			return if v1 >= v2 then options.fn @ else options.inverse @
		when '&&'
			return if v1 && v2 then options.fn @ else options.inverse @
		when '||'
			return if v1 || v2 then options.fn @ else options.inverse @
		else
			return options.inverse @