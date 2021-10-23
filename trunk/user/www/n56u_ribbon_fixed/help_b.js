var helpcontent = new Array(5);
var help_enable = '<% nvram_get_x("", "help_enable"); %>';

helpcontent[0] = new Array("",
				"Plus + 模式，过滤效果稍差,推荐全局模式</br>内网IP列表模式默认是不过滤所有IP的<br>请在内网控制选项里添加需要过滤的IP。",);
				
helpcontent[1] = new Array("",
				"1.As the upstream server of dnsmasq (the ip counted in AGH are all 127.0.0.1, the client and the corresponding adjustment settings cannot be counted)</br>2. Redirect port 53 to AdGuardHome",);

function openTooltip(obj, hint_array_id, hint_show_id)
{
	if (help_enable == "0" && hint_show_id > 0)
		return;

	if(hint_array_id >= helpcontent.length)
		return;

	if(hint_show_id >= helpcontent[hint_array_id].length)
		return;

	$j(obj).attr('data-original-title', obj.innerHTML).attr('data-content', helpcontent[hint_array_id][hint_show_id]);
	$j(obj).popover('show');
}
