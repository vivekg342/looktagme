module HomeHelper

	def embed_looktag_me(user)
		app_id = user.present? ? user.app_id : -1  
		a = "<script type='text/javascript'>window.$TAGGER={base_url: '#{absolute_link}', app_id: '#{app_id}'};s=document.createElement('script');s.type='text/javascript';s.src='#{absolute_link('/assets/external/inject_v1.js')}';window.onload=function(){document.body.appendChild(s);};</script>"
	end

end
