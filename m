Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792955;
	b=gJrbz7L21FMerjiszQEXbJm/ufko49WI78zCEZTIsZjqFqc7VnpW2pVO1VtUYRrRMswp
	 bpKBwUtWW/hQ/EDPyCa2XTfZONgXWDcb3AaHDv6sJ5Psfjo3HxAopNxtbVN4Jf0gB8q0b
	 39Ly6zw1qNKB7x/86xAbg+Ll7SOwjELVqbLbKD8Wj0VQWUxXsVJry7VpTJi4MiE4jyVRa
	 tSAOegxI+IOuWqgX91MQUNVMc4EPBcPHO9t0PaOBJk8QsKroHh/zFOSLAB2yuhb3dEqWl
	 6Krsfp+zuT0Jh1r8OekyMl3s3BQr2iUBwntoaH+ZoxZn3C2LXQq4IwnhD/INFKq6Fjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792955;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=RG8Fz/JLLcToR2osDXzoyn+yDBbN/26az+HOM0IaA3E=;
	b=cIdrE5R6IRyPDJziw+t95R8ux2dhF99/fjILq119gbNgDu/hkaHa7Opvll88WTSZRUTk
	 J6mhmDijhmPa7s7Zmj4aKgXwX/jqGWUcxm1E2lRmvik6fPnc+xgyuUR+VM84Zj3Y04CUW
	 iHfBo7aomrJtLldm7o0+ed3IsYAnmLfg0VzWNqWbwjka3PfI05Wsttablanw7gnhbANMz
	 qB7/51xD2ePHcrCKF11FpOdd2AL/RqqrKB7NfioMxLe/gJLgLsrUT/cdkzqhs7C+JWjm1
	 A2YzbWGXr4K08Zq3i7vRH7BFd+KW4mMPcf0HLreW+cys+Hi/FI9wL2BKCfvTI+6MC4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=GJj092oL;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B64606A31C;
	Mon, 16 Nov 2026 01:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=GJj092oL
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG1ZhglE2891993, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794792943; bh=RG8Fz/JLLcToR2osDXzoyn+yDBbN/26az+HOM0IaA3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=GJj092oL9WzyERW3ohhO0QfFuhS0ZpBOLwBDqbKjpKceBiLT0kWe24U26ytoViF1y
	 5gOssBR3wlVc+5ugMVhtk1V2nIuI6w5kmrufjtzgrGR1+0s8MJSvjPildEdwmg9SAV
	 A8jBXSe3+gM2ikAyzsn/P2WyVrJXDWDz+9dWA8o4c4bQZCGGt2ICLLqO/cT+2hOwJP
	 IAYTPg81Jd5U9JbQnms4uH+froGYl4+aicaR4A3W9GH8u4wOnU3CbgSKdGzSTS7n9c
	 UOFBhZGrTpsliXK2B0+45XEb0a/Q1fVLFSF+oXLuLemdI6UuMzo03QCcbGSIXc/KSe
	 0c/CoDnBMGHIQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG1ZhglE2891993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 09:35:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 09:35:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 09:35:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 06/10] wifi: rtw89: transmit frames from
 monitor interfaces
Thread-Topic: [PATCH rtw-next v5 06/10] wifi: rtw89: transmit frames from
 monitor interfaces
Thread-Index: AQHdc8qaNvArICcBLUKRUptlS0LkMrcv4PXw
Date: Mon, 16 Nov 2026 01:35:42 +0000
Message-ID: <3017c874678a439c9009f1b3c3ad765d@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-7-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-7-owner@ph4ntom-rev.uz>
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
> Frames injected on a monitor interface reach the driver either through
> rtw89_ops_tx() (with info->control.vif =3D=3D NULL for a passive monitor,
> info->control.vif =3D=3D &sdata->vif for MONITOR_FLAG_ACTIVE, or a runnin=
g
> interface matched by addr2) or,=20

What do you want to do in this patch? Flag MONITOR_FLAG_ACTIVE, so rtw89
can handle the ACKs?

> for injected data frames whose addr2
> matches an active interface, via wake_tx_queue and
> rtw89_core_txq_push().

How can I reproduce this? I setup wlan0 + mon0 (with UP state), and
use your script to inject packet with wlan0's mac address, it still
goes via rtw89_ops_tx().

>=20
> Passing local->monitor_sdata directly is racy because
> ieee80211_del_virtual_monitor() calls drv_remove_interface() before
> clearing local->monitor_sdata, so mac80211 may still pass a tearing-down
> monitor vif to rtw89_ops_tx() after the driver has released its MAC ID
> and port.

The local->monitor_sdata is RCU data, and ieee80211_monitor_start_xmit()
holds rcu_read_lock(). Is it a problematic?=20

>=20
> In rtw89_ops_tx(), require an active PHY entity and resolve passive
> monitor TX through rtwdev->pure_monitor_mode_vif under rcu_read_lock(),
> while permitting concurrent MONITOR_FLAG_ACTIVE interfaces to transmit
> through their own driver vif while rtwvif->mon_tx_ready is set (clearing
> mon_tx_ready and coalescing synchronize_rcu() before teardown). Track
> active driver monitor vifs in rtwdev->monitor_vifs via
> rtw89_is_monitoring() so concurrent MONITOR_FLAG_ACTIVE interfaces
> reserve radiotap headroom and enable PHY status parsing (parsing scan
> channel IEs before pushing radiotap headers), and verify skb_headlen()
> in rtw89_core_tx_write_link() before reading skb->data.

I don't think rtwdev->monitor_vifs can be more than one. How could it
be?

>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c     | 22 ++++--
>  drivers/net/wireless/realtek/rtw89/core.h     | 10 ++-
>  drivers/net/wireless/realtek/rtw89/mac80211.c | 71 ++++++++++++++++---
>  drivers/net/wireless/realtek/rtw89/phy.c      |  2 +-
>  4 files changed, 88 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 9cf2b03..54605f7 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -1450,6 +1450,14 @@ static int rtw89_core_tx_write_link(struct rtw89_d=
ev *rtwdev,
>         struct rtw89_core_tx_request tx_req =3D {};
>         int ret;
>=20
> +       if (unlikely(IEEE80211_SKB_CB(skb)->flags & IEEE80211_TX_CTL_INJE=
CTED)) {
> +               struct ieee80211_hdr *hdr =3D (void *)skb->data;
> +
> +               if (skb_headlen(skb) < sizeof(struct ieee80211_cts) ||
> +                   skb_headlen(skb) < ieee80211_hdrlen(hdr->frame_contro=
l))
> +                       return -EINVAL;
> +       }
> +

If validation is necessary, should you validate more? not only CTS?

Also, create a function to do this. I feel only rtw89_ops_tx() can be entry=
 of
injection, please do validation there.

>         tx_req.skb =3D skb;
>         tx_req.vif =3D vif;
>         tx_req.sta =3D sta;

[...]

> @@ -9323,12 +9325,18 @@ static inline struct rtw89_fw_suit *rtw89_fw_suit=
_get(struct rtw89_dev *rtwdev,
>         return &fw_info->normal;
>  }
>=20
> +static inline bool rtw89_is_monitoring(struct rtw89_dev *rtwdev)
> +{
> +       return (rtwdev->hw->conf.flags & IEEE80211_CONF_MONITOR) ||
> +              READ_ONCE(rtwdev->monitor_vifs);

The monitor_vifs > 1 is not possible, why do you need this?

The flag IEEE80211_CONF_MONITOR is cleared if both wlan0 + mon0 are UP.
Do you actually need that? I have no good idea now. Can we just focus
on single monitor case? Or just avoid crash from concurrency
combination.=20


