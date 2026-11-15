Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715719;
	b=di3d6EfubdsRa4TFJupFtYzMxwNUCGgMIqYguLY8UXP5KCetIH/r/5F9lhricSgnsSqS
	 gsHU3e7HqIZTXtAummtrxLHgR8axXF3Rd/3T1Lbo2Lj67pNm1CzbifQCORmLl9MSoTrkT
	 WW7s5H1tf8pluEPlQDgW5zQ5a2tVlt6u5VoSIH+LW3G+Fd1hbFups4EwwkFAFAWFuLJO8
	 pZgwD8GekpqVTa/ZlmX9UVI54Aq1VT9Mv2rkXIWGj7luJMAww9Nngu2hQ9coS2A+MqXRr
	 /VMJw4BILT++7s89vQzrAPogGLmd7Hhxba26fGT0OauUP/ReVcB6+5Pr+atMedpZHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715719;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=TOgDAngET7SCptQyx7wtEEDhE65iKbzZJMncrBheFv8=;
	b=XLHf6QRK+MCqegMHKdr8N3CNG2IlAiwUyb0YMZUpHtB5pq20jf6rkkA1yCwa3K0ICtVt
	 mg478EX/kHdCdkdzAVj1B+O6sDy047D+vK16Pnde/PDnDAkEoHJ3jDzLQcTGHsQS1SWOY
	 M5roqbEVUFxFQ8kGEJxVn+VwE7FkunDKecKv4WioA6w4HJ7V4mwwAgCszw8EI08VrXgAx
	 L3XGeDkHftumMdZzouhrPOL9oYIk3nkxC9mlzM+ulAkwFjtFdzAyGgpAGoIh3sTI2pvds
	 C6bOlRTjGwgUfmOrF9gSys2Q/pHRjZkCB4xGyzP9thf1S+yIlUEEHXt5NOfUrrOyq7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KMP9lLio;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6E606A323;
	Sun, 15 Nov 2026 04:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF6E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KMP9lLio
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF48WcG42162428, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794715712; bh=TOgDAngET7SCptQyx7wtEEDhE65iKbzZJMncrBheFv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KMP9lLioGVmzdk4oync2O9IyJkneSW0RI1ZX5wcgkXQBQ7ulAl1IbQtq/oXwhD+Nu
	 HjplDvi66UbjsMdMAHyRLYiKmq3p3dhMkOJJZ2FdDqdVxXwXIlPlX5itKS67tPCX1O
	 XjwCDeicGUeZqqY/qYBROW+PKLlyYT2YXxnUPxHPZuJrkO4ITf0756f7nIIvm5DR2T
	 m3iNX7f1oqTLW0EmpXBWukJmr7cFGBx9g96B0DbzbD3v1T9mqp+21ILE+jExEtWJ9v
	 kNgOdFYep1EWlpWaojf7bMVWQoegpF4f88NoRkCeXnsyU4He45j7DcIw1F4Hc89Sbf
	 TZNCIX3/1FPqQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF48WcG42162428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 12:08:32 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 12:08:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 12:08:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 12:08:32 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for
 monitor interfaces
Thread-Topic: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for
 monitor interfaces
Thread-Index: AQHdc8qFK2Jt1QtiLUSH4J8FZa1Wk7cuhEig
Date: Sun, 15 Nov 2026 04:08:31 +0000
Message-ID: <971ff7a2aa6e4f5bb6d4e459c386d433@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-6-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-6-owner@ph4ntom-rev.uz>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> rtw89_vif_type_mapping() leaves net_type and self_role zero for
> NL80211_IFTYPE_MONITOR, i.e. RTW89_NET_TYPE_NO_LINK and
> RTW89_SELF_ROLE_CLIENT. When rtw89_mac_add_vif() initializes the
> interface, rtw89_mac_vif_init() first creates the role via H2C
> ROLE_MAINTAIN and then sends JoinInfo with disassoc set (op =3D=3D 1) and
> this client role.

Describe why you need this patch. Which problem you encountered and
wanted to fix.=20

>=20
> In firmware (verified on RTL8852AE firmware 0.13.36.2), the JoinInfo
> H2C handler treats (self_role !=3D RTW89_SELF_ROLE_AP && op =3D=3D 1) as =
a
> station disconnect request (HAL8852A_Role_Disconnect), which clears the
> newly created role's active bit in the firmware role table and skips
> initializing its CMAC control table entry (CCTL_ResetByMacid). Frames
> queued on that MAC ID are then silently dropped instead of transmitted.
>=20
> With self_role set to RTW89_SELF_ROLE_AP and net_type kept at
> RTW89_NET_TYPE_NO_LINK, the JoinInfo H2C handler initializes the
> MAC ID's CMAC control entry and connects the role without enabling
> client TBTT tracking (gated on RTW89_SELF_ROLE_CLIENT) or AP beacon
> transmission (gated on RTW89_NET_TYPE_AP_MODE). Set both fields
> explicitly for monitor interfaces.

I'll check firmware people the setting.

(I will review remaining patches tomorrow.)

>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 3447f0e..9cf2b03 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -5756,6 +5756,8 @@ void rtw89_vif_type_mapping(struct rtw89_vif_link *=
rtwvif_link, bool assoc)
>                 rtwvif_link->self_role =3D RTW89_SELF_ROLE_CLIENT;
>                 break;
>         case NL80211_IFTYPE_MONITOR:
> +               rtwvif_link->net_type =3D RTW89_NET_TYPE_NO_LINK;
> +               rtwvif_link->self_role =3D RTW89_SELF_ROLE_AP;
>                 break;
>         default:
>                 WARN_ON(1);
> --
> 2.56.0.windows.4

