Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712991;
	b=QgIShUHI1BBjiE8RyvjHy++eP9pdeuVrlH2KSz5vQlhNFMJR4kyNHLIIa3Iu8YRtAMI2
	 ClZc3Bh8nVZXgXfWkUzzAwWw+PpGeE7nLC2+JIQ3ueepCs0sVfZInxhCTE0hxgv5oDUEa
	 1bJ12QCLtQrFnf5XuHrgZlponPBsgb+kX/5c/dlR8i2OK+qY2Sydl/mjOQ3LmEypWsGMA
	 9kPH0zASQ7pqQQS4sWJ2s7liAT8ldw0cfDg/qK8nVltvJ4f+YzWrVJvmKF4pqcLdqOw/i
	 syhy8MC/FBNQwWp0Ge4STXHJ1teBNWQlUaOrS6YGqc2ksKMnJXOWpAtDsBhoaNOnZmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712991;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AuLe4SvPpmOvc7Ef20gJacEwY2tzBKFGTQkf2B+4uAI=;
	b=uu+7GdvlhvNk50NissAn6BW0Q4QJVm4KzX+Ifv3S27zIl1kmQDs8QatiwPC78UaVVBpn
	 jRZR+DKYop5U4Avr3WRdvKwuc/mg42iSJaETyvb+Hf+gCsbWBBYwWl+M8qDyQkpflKz8w
	 Gw11c6/GUN9GrXV0dAG37s0Fxd/h20nVMbTLw9j9R4t/h0cZ4CGUkOO5QZNLUU3VlcGOa
	 q2Qf918n2YOH2cU+P7qlqagf2FXFaWtci7ZIOYdmCfAuNU4ovexdHxT59FFJ0aoPCyt0v
	 1tICrUn1HqQFAJGKkys6hXsggFN7Ohhdmt8Xbc7/SWjpp3DgGeMkfU+IhITwgBA42Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NSlSI2sk;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB0606A323;
	Sun, 15 Nov 2026 03:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BB0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NSlSI2sk
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF3N3hY42148903, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794712984; bh=AuLe4SvPpmOvc7Ef20gJacEwY2tzBKFGTQkf2B+4uAI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NSlSI2sk9kMPg46x0OTeqQwpX3QjOY2gpzEWzc8wuUXB7C+i/wkWMbCYQqKfMFLHb
	 8efH9tLXfT8+oh2RIB0VHDo8IdJjymUZfvaJ4NWPQ1OzJlN+JeKZU/MP5iYQpqS1fx
	 A9wIXBo/ONT7IiMn18UMoiJDR4O575KjVXDTA0Nsm0+cgpSYJlVRf075NI1ymGGB5o
	 GcIbFd0sZOJMx6kryaYAZlmACKGrOPFd2npSWDikXivT30Lqk3W/jOHA3gZkqA5wFv
	 dCG6B2K5RfcjeM1rXKqQ1OG7yixQOYMjmx5twnTvoqwwEKBX1ptywLNuPFBjLc/xYR
	 TBOf9Jt38uh1A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF3N3hY42148903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 11:23:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:23:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:23:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 11:23:04 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 01/10] wifi: rtw89: avoid NULL vif dereference
 in rtw89_ops_tx()
Thread-Topic: [PATCH rtw-next v5 01/10] wifi: rtw89: avoid NULL vif
 dereference in rtw89_ops_tx()
Thread-Index: AQHdc8omVyiZbNM+1UOQel0vHjr0i7cudqcA
Date: Sun, 15 Nov 2026 03:23:04 +0000
Message-ID: <c80463b1951045f39883136b130e20ef@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-2-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-2-owner@ph4ntom-rev.uz>
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
> rtw89 sets IEEE80211_HW_WANT_MONITOR_VIF but not
> IEEE80211_HW_QUEUE_CONTROL.

Will this cause vif =3D NULL? What is their relation?

> For frames transmitted on a monitor
> interface, ieee80211_tx_frags() therefore passes
> info->control.vif =3D=3D NULL to the driver whenever local->monitor_sdata
> does not exist, e.g. when a raw frame is sent on a monitor interface
> while a station interface is also up and the frame's addr2 does not
> match any running interface.
>=20
> rtw89_ops_tx() unconditionally converts the vif with vif_to_rtwvif()
> and dereferences rtwvif->offchan, so such a frame makes the kernel
> access memory at a small offset from NULL.
>=20
> Drop frames without a vif, as there is no MAC ID or port they could
> be transmitted on.
>=20
> Fixes: a0e97ae3f332 ("wifi: rtw89: add ieee80211::remain_on_channel ops")
> Cc: stable@vger.kernel.org
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/mac80211.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c
> b/drivers/net/wireless/realtek/rtw89/mac80211.c
> index 9134cdc..5a12639 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
> @@ -23,11 +23,18 @@ static void rtw89_ops_tx(struct ieee80211_hw *hw,
>         struct rtw89_dev *rtwdev =3D hw->priv;
>         struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(skb);
>         struct ieee80211_vif *vif =3D info->control.vif;
> -       struct rtw89_vif *rtwvif =3D vif_to_rtwvif(vif);

Use vif_to_rtwvif_safe().

>         struct ieee80211_sta *sta =3D control->sta;
>         u32 flags =3D IEEE80211_SKB_CB(skb)->flags;
> +       struct rtw89_vif *rtwvif;
>         int ret, qsel;
>=20
> +       if (unlikely(!vif)) {
> +               ieee80211_free_txskb(hw, skb);
> +               return;
> +       }
> +
> +       rtwvif =3D vif_to_rtwvif(vif);
> +
>         if (rtwvif->offchan && !(flags & IEEE80211_TX_CTL_TX_OFFCHAN) && =
sta) {
>                 struct rtw89_sta *rtwsta =3D sta_to_rtwsta(sta);
>=20
> --
> 2.56.0.windows.4
>=20

