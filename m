Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800716;
	b=gkd+YWmbF367qHE2hSoLFhrdW5MGcWrwCH54UPt/e2Wi6OR3ghMi19G7WDjwCFg3pq2D
	 rD9fhnDN4dantemMGIKSunvMCJimCaPLcXeaUGrfIDRzO+8XRjIIOKpeEiqfG9Drmi6mR
	 hdJq2A1snLanmgLSRIBYX7iaDZJABHcUrYfDRN2cCBK41pBUpOMJqu/QzpsiZ3SW21xrc
	 SrT0AjBqstQ/xsAwiwJcsNM0LZPD4kLBkN98e15ypukR6rn69+q7+OwivOsDvw9AMbW0N
	 TnRcLIS6WTjehQyKLSGZr3UXWHhpKcRzlHOFxEFX146vq2CohXGoKpl1+zgeCffHtZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800716;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wpl+S+iJCeStkF4eCrEXYSjgIUWJWc9vv+PMak9Q1QI=;
	b=ijTNKMAwJH3NvcsNdvy2rP+rxtNeeDPGCydZcflyQIYpK12NrxIaaX8CjVimAsHO6ZjH
	 ZJoPYm2Iobitn4P0PrjFMBjSQPLca1c0li7q9HDB0pv4aZolWY0Hxa5GUIS6AS/7loEP2
	 0L3LjSdK52b+xgCg6DjDxcIdPjNkgq0Ub5LOmhOltrx9DqG04ENB9+ZFhPFQNXtXMwwof
	 Jv8teZm3IIx//L7cE39ESoMdX+z1INSaE2lJvcIRvUV3jDuvKZQCgTufQ3S3ZErlKWXX6
	 205kLE3KIuX27LV/Cej2g0rgx7C37Pw2i9ZqC60zRj3qMCBD2Nu6ieEimhuGcwqG/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="ERUE8cW/";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51029606A31C;
	Mon, 16 Nov 2026 03:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51029606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ERUE8cW/
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG3j7C413037339, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794800707; bh=wpl+S+iJCeStkF4eCrEXYSjgIUWJWc9vv+PMak9Q1QI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ERUE8cW/gEGTZpiV9G3Key/4tNTmQY7JiX2pUCjdqZob0bRBShgJhQHKnCuK7H5yT
	 jfd6Og1RKnfFovny/6sHTu4SnQIzCOC8tf8r1Y72CkPGwLr4NRZX0ufS1owdsOdXWy
	 oqfR4Wf3hqnTWY/rgl+TScam5QUrULFO3JLZuZ6ca2rjGNyUFCTzgLBsV1kgF4X9zZ
	 /sl2ay6WuEaDxGGzrKDyfDt6F57MVPEvBGK63ksinN+fwWfe1ucTQbEZGStRHAY/ct
	 Qfeei3LkGPEgm3Xwv9kh6l8/JhyfE0mZFzN7FuQFBWGr/xWvxRlMHo3FTUZMwf5GDz
	 ds+PBHEXdVC/Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG3j7C413037339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 11:45:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 11:45:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 11:45:04 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Topic: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Index: AQHdc9EJw4nEcxWhMkqG8ygFaOrxf7cwB0Ug
Date: Mon, 16 Nov 2026 03:45:04 +0000
Message-ID: <ef6d8d689d88443e993d667e7a75d538@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-11-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-11-owner@ph4ntom-rev.uz>
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
> rtw89_alloc_ieee80211_hw() disables native chanctx callbacks
> (ops->assign_vif_chanctx =3D NULL) and relies on mac80211 chanctx
> emulation via hw->conf.chandef and rtw89_ops_config() whenever
> chip->support_chanctx_num =3D=3D 0 or the loaded firmware lacks
> SCAN_OFFLOAD or BEACON_FILTER (for example on RTL8852AE with firmware
> 0.13.36.2, where support_chanctx_num =3D=3D 1 but BEACON_FILTER is absent=
).
>=20
> When the last monitor interface is brought down or deleted (or all
> interfaces become idle), rtw89_ops_stop() / rtw89_enter_ips() powers
> down the MAC/BB/RF and clears the RTW89_PHY_0 entity state while
> mac80211 retains local->hw.conf.chandef.=20

> When a monitor interface
> (including a concurrent MONITOR_FLAG_ACTIVE interface alongside an
> unassociated STA, where __ieee80211_recalc_idle() clears
> IEEE80211_CONF_IDLE without setting IEEE80211_CONF_MONITOR) is brought
> up on the same channel, rtw89_ops_start() sets RTW89_FLAG_POWERON
> without programming the channel (so rtw89_leave_ips() returns early),
> and ieee80211_hw_conf_chan() omits IEEE80211_CONF_CHANGE_CHANNEL
> because chandef is unchanged, leaving RX/TX silent until a manual
> channel change.

This should be the first paragraph to explain why you need this patch.

The commit message may just say that fix the channel in monitor doesn't
restore after monitor interface down/up.

The detail trace can be second paragraph or not necessary.=20
The LLM provide the trace is good to understand what/how it does, but
not suitable for commit message always.

Please rephrase commit message.

>=20
> In rtw89_ops_config(), when IEEE80211_CONF_CHANGE_IDLE or
> IEEE80211_CONF_CHANGE_MONITOR leaves the device non-idle on hardware
> without assign_vif_chanctx and RTW89_PHY_0 is not yet active, apply
> hw->conf.chandef and call rtw89_set_channel(). When
> IEEE80211_CONF_CHANGE_CHANNEL has already configured RTW89_PHY_0, the
> entity state check avoids redundant RF calibration.
>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/mac80211.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c
> b/drivers/net/wireless/realtek/rtw89/mac80211.c
> index c8a6003..3649a7a 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
> @@ -152,6 +152,17 @@ static int rtw89_ops_config(struct ieee80211_hw *hw,=
 int radio_idx, u32 changed)
>         if (changed & IEEE80211_CONF_CHANGE_MONITOR)
>                 rtw89_physts_parsing_init(rtwdev);
>=20
> +       if ((changed & (IEEE80211_CONF_CHANGE_IDLE |
> +                       IEEE80211_CONF_CHANGE_MONITOR)) &&
> +           !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
> +           !rtwdev->ops->assign_vif_chanctx &&

This might be the first condition 'no_chanctx'.

Declare a local variable 'no_chanctx =3D !rtwdev->ops->assign_vif_chanctx';
Move this upward after rtw89_leave_ps_mode(), and update the 'changed'

   changed |=3D IEEE80211_CONF_CHANGE_CHANNEL;

to share existing code.

	bool no_chanctx =3D !rtwdev->ops->assign_vif_chanctx;

	if (no_chanctx &&
		(changed & (IEEE80211_CONF_CHANGE_IDLE | IEEE80211_CONF_CHANGE_MONITOR) =
=3D=3D
	               (IEEE80211_CONF_CHANGE_IDLE | IEEE80211_CONF_CHANGE_MONITOR=
)) {
		if (!(hw->conf.flags & IEEE80211_CONF_IDLE))
			changed |=3D IEEE80211_CONF_CHANGE_CHANNEL;
	}

> +           !rtw89_get_entity_state(rtwdev, RTW89_PHY_0) &&
> +           cfg80211_chandef_valid(&hw->conf.chandef)) {
> +               rtw89_config_entity_chandef(rtwdev, RTW89_CHANCTX_0,
> +                                           &hw->conf.chandef);
> +               rtw89_set_channel(rtwdev);
> +       }
> +
>         return 0;
>  }
>=20
> --
> 2.56.0.windows.4

