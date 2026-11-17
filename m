Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905604;
	b=TnJUBEWnamKWjWM7+feZdVXKrJEeo2JeIZZJMg2yJKRwpnfWc2g9+H1rx/nyYll0QZst
	 3AAz4j+CdBARy85wRdYue+FnyDiIRBt//Wie57rqJeAuHihyoVATOh9ZYne6tS1FIyre/
	 qb8Y3yRWB8N4rYvxia/91QKphe4S/1kvsBIden0bEZEzeK9B5SpbzjezwJh5NK8LFZ3m+
	 W6pnb/Dg16/B3M+sYV6U/fB1akfpduSD+UqDni9T93mIc5xsQqbqi5pAwwbmNnTIdH3ir
	 jc7KW/rX2e73z3ClmaFiupAqz1/v7Kt2kA3mWlWhcWkO71X8xhyaOKuYk5vbeKkkv4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905604;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Y2ePCxyA9GRcbEb0ADHbQ9VsrTARJtytJnenLlWNQak=;
	b=gA8VA/mV1MiUqo0vqtTn0tg5IpdDj9aIB9lFQ7CiEM9fkdeDuljlJFFyAccStR+ZUF2V
	 kvDA+5qfb8C9s0K7ZQUWzegcsn/SlX93hg4TF+X7QFHG4yBIt6XXhfxrQkBRj/5Ff46vg
	 qKGmAL55FrwYJZyYB+OA9y3gHRPd7KFDEz2pYjXkJ91Efx+tMW0HmVYFqIdBn7QhFYC4T
	 pYa/l8QTbBUT1NP1bJ7i/h5oMKb38UI6Tpl9vjsQbDhM4fZ8ToiUSURSOduty6bvG2WMg
	 32lPvBtxbL2azrUEJxHTRplB/qegjdVt9ZallHt84ER/lsXfZGKOBERHtic/GjRmjKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=LUzSQapK;
	arc=none smtp.remote-ip=66.163.187.148
Received: from sonic316-22.consmr.mail.ne1.yahoo.com (sonic316-22.consmr.mail.ne1.yahoo.com [66.163.187.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=LUzSQapK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794905603; bh=Y2ePCxyA9GRcbEb0ADHbQ9VsrTARJtytJnenLlWNQak=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=LUzSQapK8uYuZWjOS5TCfnVzBiHKpg0YAvHVr2BAdVKJ3gDXA/pgJLipKQ6kc5CmeVBbOO8vCt6fZ7nqdW6svU+DquMuBkl3qMeHzU34V5xVuDYg7sCEpu7z9YiWRSx615JVOLSFAN4SjhqSimfg+VEXbhKRjxbKqsnPue6btiYbtRJW6DHM1RL6aetP5zsOORqIF9h8eh0B0gKSOxnkVpHydj1DrWcdRMHI8H5CVO9StYQOjuMOYlwDL7JOprtMLaF2WXXy2KlNH5nTDtEa+MXQqSn/azfLM8aXN/kvWD64Brg5by1BEa6f823Rz4iE52bkATGvzC7CTbSfMpOogg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794905603; bh=ynuSPZd9gJrIiREYq/WjHnuOozhzzXILreH7QVg0nyH=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=lieIA3thXFKpSY7wL9+GqI0kt2hljEdLOb5tOL3JbNkjCrQPYKL7IVPT1VQpPtRGLqGtRj9fN/tXkHtok23VAQfNvr0DddNLza6FImlG/JOX22B+vu/fhU2KYY3ks6sGpXDcHAsIEY6x2pJNVuwvF35vDdmmlvBfbFp5ARuTRuyMs7wiEmyp2YlBNNeNiw8YfzZpxurNcOqhGB6VbmnO2jK9zkMUGBDc5m7myX26cvWTCCQg54G5ScucYoLTYK09KSNFcwXcXcdTEyiSYjsUe1JFmIf6CruFpiGIj3k6nCRtJcEkwFbBaQPq2MQWlsC/c5RAmOTRISYi5avPq5tmmQ==
X-YMail-OSG: k8PqssAVM1muWOZDOUm26lmMMDLSu8ibibtzwZSOjFlRjASUP7rPKdnZLJBMoA_
 ETqfHkcVAOYx9IP9k4mnby.Lz3.lDknt8.MqOySRF2IVtgumkSe9kLRDx7pJzt0pdnHPOtv1ElLh
 CrQMWRmhUhNjyf8__UO39l1RmNia92hMCQQIM82ZvVu_dqIPwT281_PM.Dq97.3EE2a3h_5WRlYT
 W.RSsMdw1y2OwRCFOB8wlTCG.JpaQ13ffCMGSZS46v8F7FPISnBIF5mGZwd_kjykP7Kt8flaMC.4
 sRNmXd3SYxzRqSegWfypIoXvAHrrKdbC1XA3hE1tzoRW76LrW588dTIyzy5UCCCifF0wrjqcTkaY
 5_9IBge3geO6tkyRugmYD52c6xck6slx0AeUbITOArvSabAn7HHU1CF4TpCu_tlbwchtaS94xEmb
 yL5ofYJEruGtfkWa3R6yyCS5s5TzfDlFcxGyLh59zXJ4txRWu5A6A0uT15i8l0f3R5pMENG4Easg
 5JWJCDg_P5hy.gk5uh_eQdhUyKyXQfXYhPwtdizaWCoxiuyt6GaxvfdSF7yWWY6IxSqyMgkv5SNJ
 _nPhXxC2NVlX1rAUinbRPVBjEnSdV1ggOGWfqp9UhDFxFXN6LzYZG3ckwzZIiJ0nTsWFo2Isnb9p
 XeBaQcS3w5kRAnocFxEkxYqicpAndgnlSYPunP26oiJv7koh3D32jP5woUsE1Najw0j3yU5lJ.z1
 i43lwfphtSd7cRlfoACle2Jlh3I.OccNoIiq07CfCFKOFfSggofhWDOQbDET.bLso9Irx0PTd0F2
 yA7h9T4ZpwpP7Y.AhqJwqoRkCabI3e8kBbkOo4ITnVcyPcSt7S8CNFsQC5qPGzCWG6xbqe2emOm1
 9301t5wKCTFcaiQn.p9EkZf0e5kQdlzF9_cgzdwctc86R6kUrvWp9cs9lCoV7Uveu_xDx2ys9NWc
 8S36zNgMPTzhES0cKY_prenNHOF_lYilc8aWdENjlFfsWGyeyFRM9izO0yc7voNZBQLLY09aLTYI
 rZew7xsdKX88ZtWsAw7jIyCz9rBSZcMHhVAjXL7crC6YktAVqVOX5OpoTMq_ETzkWBi2gFdzQxO7
 CZqkdEoQtaa4fRAk5__otcOjCkbRRzWnhxLeK_7HRMXyG6xmwebgL9b8WdaFZvdEWpKxht1fwnN6
 e8dAzF3uuKEVblQFClltpgPfrmfPS5OeIY3hJpKc4RJRzmpsFefv2hYXRxwd9f3AvpfwKI7JRQU4
 3TTiA5q8uPJ88aBvE0tdnZ9u.QFHn1JVUTzK9lIXnTIysjBHlZgNKNuriBDds_jIQ8zcTUTSzSop
 JV_Qq33N0bie8cYFUyFxrc62YejUnoe_QKOYoEJ9sYrpNiwPdNMJmlKdndiH3OkAe6lUpQMrinhP
 nt.Iowef0hkj7DOT9Oj1nS4oOAjmmWuSj6v98Yn0Ki6mmpjesdHeIH2cfpm0yJ7j1aYJhHE4EpFo
 n0u31qv7QdtEviCKX30XJycAQ03UDSGZngFCJsQyJQ6hteyPo1QSXWP4icrI571SG5Za.jSkMFqE
 asaeYYJbyGvwzzncJsYvDSPVVGSNHHi4DMSk4beu1ICviGtUX_.QOSWc6o0OekD48PTgphTDN5lI
 rOuOjtpMGFAZQgWMZME0J.zjhDIJnGG0BUBqaD9ar2Ei467xoLOR2Q8SWmdG.UvSjnon5VUMUWCH
 Aal0kdSRkxFJJ4UZ2KkSXvxr9OFF9o7vLxDCdLPfx6Gslm7nbO0HBfwVFGPNHGxF42qYkUieMSHc
 upzjhTXLQfFMzF2HxXfueY7P9VOeQS5EQDEZUdq_AZoXZCFBzbt_wk.2iV7FsZJsT6dZzRd_.RAl
 Sw.ffpmKff3K_JTQayhmIAj.8acfH33LTQ2zm_dzUxcm1Ohm4qG4RcR5_ej7h9OA4FiJKFY1es.F
 DsGLMjP8roxI2ZGo9B3Mk.G25b1xDayzvgHO3tjGQ5aIt4xR54ZpqzIf3MbTNgSjXmVO0a2WhWID
 Z6KQJv._J4xJ4iNjIK.eK9VXzN73tdAFo97KwImzkNKJOwNbyiKg.s.L2oKxbtvVtyv3dQpfS68_
 Z1uJNOSAG9n_UGVbdqLX4kimrBkflb0BpqvLhtMh81S9_uUAQXYqMm5PO.tDCWQXHJCzqQBWCf0X
 lQHlmKyQFXUL34o12VSNUxBKW_1OqKTq0G6SKPlwMwH6sHkQ6eVpjA3SPfoyHZ6J_y9.z3XQzrn5
 jyUm..LKPz0zqnGM4mbAqw_0R5x3JYSG1udG1PXqQYa1IgTUldgCRJKHstaLpyrhW2evakbW1b8Y
 uLSXmU8KIaAEmDFuxgtmo
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 72bf5874-dbda-4723-a944-938472364770
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 08:53:23 +0000
Received: by hermes--production-ir2-5dd9bf4598-czvl7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 50b834a695c931c4b3ed5e4c4ff25ffe;
          Tue, 17 Nov 2026 08:53:16 +0000 (UTC)
Message-ID: <d5d5e96a-d321-48b6-8c82-a1b224ab0be5@yahoo.com>
Date: Tue, 17 Nov 2026 09:53:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
To: Linus Walleij <linusw@kernel.org>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk,
 luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com,
 kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com,
 contact@c127.dev
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
 <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
 <CAD++jLkJxM2yE2QwsDijqnsP+bH=xNfcNy+yj3hbv1k+q9aJ=g@mail.gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <CAD++jLkJxM2yE2QwsDijqnsP+bH=xNfcNy+yj3hbv1k+q9aJ=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Linus,

On Tue, Nov 17, 2026 at 09:34 Linus Walleij wrote:

 > What about int rtl8366_set_pvid() which is shared in realtek.h and 
implemented in rtl8366-core.c.
 > (...)
 > If you can confirm that this is the case also for PVID I can send a 
patch to push this into the RTL8366RB driver.

Confirmed for PVID. rtl8365mb does not use rtl8366_set_pvid(), and none 
of the realtek_ops VLAN callbacks you listed (get/set_vlan_mc, 
get/set_vlan_4k, get/set_mc_index, enable_vlan, enable_vlan4k) are used 
by it. Its PVID, VLAN MC and VLAN 4k handling is private to 
rtl8365mb_vlan.c and works on its own struct rtl8365mb_vlanmc and struct 
rtl8365mb_vlan4k, not on struct rtl8366_vlan_mc / rtl8366_vlan_4k.

The family_info callbacks in this series (vlan_4k_read/write, 
vlan_port_get_pvid, vlan_pvid_port_set/clear, ...) are only an internal 
split between family C and family D inside rtl8365mb. They do not touch 
realtek_ops, realtek.h or rtl8366-core.c, so moving the shared rtl8366 
VLAN/PVID helpers into the RTL8366RB driver would not conflict with this 
series.

So please go ahead with that patch if you want to; I will rebase on top 
of it if it lands first.

Best regards,
Mieczyslaw Nalewaj
