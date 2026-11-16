Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815795;
	b=w+g5OJntautuNCOoz1sXUMYEg/6vci6hNnFtD8Vnpp/9lkRsZJvmD+XtjKOE2e5H86uG
	 xi5Sqx9zXqxR7ANZpTsBPh1FJM/Uzvi+sjJ+RysYuacA8gizi6bnnrzrD2AhRkj/5dOir
	 hW43n1ICPDWJB1czCRV/Rru8W7P9CVFpnToeEXjmtrGn0jmXMj07yJcoSLO0p+6b/ka8r
	 jup946rPfGYq0xtCF2PrQZZr1eXkx4kTA/2hEXi3qcCMZFBYUzJbK7UqEJVMUJ5QQIwa9
	 ScOJApVXrJe7T5wR0NvA5g3EANQU7+rq2lWkhlfohL78rFPjAQDO2htZculaX+k8mXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815795;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=i/tgvuJlgnRTCNNHNQfX7lcaPN2uENJSZ9SToXIswqY=;
	b=yeN5T3UKCWVbWQcpmOwOdFwJLCe1W3xY05D6lFo2w+MQPbn6Tpi3By4Ybub51i29vMlu
	 FtDOx1QEykeT/esQoGEgRWq+Sx4vXbmddwmxywJmyX7PcWOHngpuoPk17nxo71VN4Elb/
	 uxJ3F8DuNnyPHywK0U288yaL2Q0kO2gI3ZBF8OIZWZHmlgo0Huqr2S8uBnUdwFUO4loIU
	 E+S0CXoX670uCL8BWEETZQh7x6LHdqM6TnPhzPFbngkgg+nJ4KRumZ7S0phj4YN79wTTC
	 SoesdtPT/904EZ9lygi6iolUDo6y4d26IWJUXS54t+GnyjgspWkhIWgwjSu12lOlvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cST+q7sj;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727A606A333;
	Mon, 16 Nov 2026 07:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5727A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cST+q7sj
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG7uQTT13229810, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794815786; bh=i/tgvuJlgnRTCNNHNQfX7lcaPN2uENJSZ9SToXIswqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=cST+q7sjkGLPWL9ekJdTZBhTiBG5yRTd+afcZJ8G/mGGs+KvhDTeVyvSFVyFF0huT
	 +2I0E5jlwMBmMn1NvCVP54ndYpsuiVUIqFj4NF3ztaSSA/IBFxA3eMeh+SYn/BZdjj
	 YPltuX1/+fvpU8b6j83yXb3f1kDnCHaKgvzns5evVOYaK/5oGUaVqnhreACQdd3A3w
	 2pj1UkuwhGvbYl/Ui8fIp+rlpSZOsnbDt+tp0HiXP3NU/xEYhaPiUILpbZiI3DNpPX
	 34KC46fe2arKn4i1C+J/xR+8vle8ZVJryJPaD/IitcsPZg6aUNQMZWoTqBjW0GCvn7
	 mnbn/DmCTMOXw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG7uQTT13229810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 15:56:26 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:56:26 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:56:26 +0800
Received: from RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8]) by
 RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8%9]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 15:56:26 +0800
From: Zong-Zhe Yang <kevin_yang@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>, Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Topic: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Index: AQHdc8qsP3ErQ6YwO02QgdrypGLW6bcwURxA
Date: Mon, 16 Nov 2026 07:56:25 +0000
Message-ID: <a7c3ba85576b43ff99b7ffddfd925014@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-11-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-11-owner@ph4ntom-rev.uz>
Accept-Language: zh-TW, en-US
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
>=20
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
> mac80211 retains local->hw.conf.chandef. When a monitor interface
> (including a concurrent MONITOR_FLAG_ACTIVE interface alongside an
> unassociated STA, where __ieee80211_recalc_idle() clears
> IEEE80211_CONF_IDLE without setting IEEE80211_CONF_MONITOR) is brought
> up on the same channel, rtw89_ops_start() sets RTW89_FLAG_POWERON
> without programming the channel (so rtw89_leave_ips() returns early),
> and ieee80211_hw_conf_chan() omits IEEE80211_CONF_CHANGE_CHANNEL
> because chandef is unchanged, leaving RX/TX silent until a manual
> channel change.
>=20
> In rtw89_ops_config(), when IEEE80211_CONF_CHANGE_IDLE or
> IEEE80211_CONF_CHANGE_MONITOR leaves the device non-idle on hardware
> without assign_vif_chanctx and RTW89_PHY_0 is not yet active, apply
> hw->conf.chandef and call rtw89_set_channel(). When
> IEEE80211_CONF_CHANGE_CHANNEL has already configured RTW89_PHY_0,
> the
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
> @@ -152,6 +152,17 @@ static int rtw89_ops_config(struct ieee80211_hw *hw,
> int radio_idx, u32 changed)
>         if (changed & IEEE80211_CONF_CHANGE_MONITOR)
>                 rtw89_physts_parsing_init(rtwdev);
>=20
> +       if ((changed & (IEEE80211_CONF_CHANGE_IDLE |
> +                       IEEE80211_CONF_CHANGE_MONITOR)) &&
> +           !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
> +           !rtwdev->ops->assign_vif_chanctx &&
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

I think you can just call rtw89_set_channel() in rtw89_ops_start().
And since this is more like an improvement to UX, please place this
patch before the patches you add features.
