Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898888;
	b=tjp++rhqKa6CV4abbYKKSxitM26UIjN1A+kowKWLywbmRqHuP0KKh4B7D202rMljOBeU
	 acVmA66Syqz4wEzMsvJSqKLg49TaFueUBIKLaS3pWI6ZJG9+wFpOXps4xYWM9BAc3m06Q
	 0hsldI0LCjdmmG/KAR/gdAfmo0m8HoAm7aRdMco9xBPQ/hwU59/yw5ypo3l+f9cxNP7W5
	 NsUJgTN9CUH7I1MiNkq6Rofm9oAg8jgvx1mLb7H61gD6Wdow82edFkHwnulucLwgp181J
	 Ua15IVGaAwPkOy1Q3mT4eKdSjBkhcxAi5vtfS2VAoKebfmtnVx2sqj86I2ZWr5zmGuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898888;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=SHGfrp4bopYd7kSN9zwAjUxkO+1WPrFH+JL4BlUgktw=;
	b=YVLHpFYJZGx7ZemM82PvZTpqfJqgj6BjVISSqA3KmJ06Q7zhU8cS11bHKz54nH02Bh0M
	 Fks3bLHNRHX0Z4O2KyyNUJhC/uID1nKA3bM442gZFSmqkr6TWpykrwa+K+0VVS8Ex3Hd+
	 b1UzOSyyjT2pyGYi2y/pZi/lIU8T73xE9+cfW2fWmeDOm4YySqUUqiKGFVEcDm/iTGYyG
	 qAvtVLzArtsPI+tKSoLY1XB3toLtl0GEoMZfgV4Qelk0zoFDgQVkKPrhIHH82h6SCjUyc
	 PA8Oe3yLoCSgPtDXjG4gW0aNTuocI84NLBmg2MoNlOPbfWZ8e5I6C/vqYMm0pQlLgdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=n1vslqUc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17993606A31C;
	Tue, 17 Nov 2026 07:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17993606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=n1vslqUc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH6xHXE1009131, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794898757; bh=SHGfrp4bopYd7kSN9zwAjUxkO+1WPrFH+JL4BlUgktw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=n1vslqUcXj1pLQuWKwXCdtwpkBLbkLsMIVrZaMygN7Jy03CCjFZjQs9gTqAfoJd+B
	 737HYT8fQbDi9xvPCIHAywkNejLk4S8VDHleTz17ehjuy+997z5E/L3WJ3wad+dthn
	 Qd1IIcYvMAykaGHBAOKDSRMM60KdV5TFU2d0W6mRIoZN1LQxJle9WkQBP0EJ/vNi4F
	 WxowPlyAn2xi0MmMb42VYPoZJCkhFCyZ2kmsRPcCb83SKKDh+t9O3WDrn2ltM1DiB8
	 o1RgTweYpveGFtpr9W6wyVe7wBxnvqGuxGk424lDA24qrwtPxD3+crq9jfMnreJvSs
	 vsJb8v05kZm5Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH6xHXE1009131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:59:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:59:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 14:59:17 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Leonard Lausen <leonard@lausen.nl>
CC: Luka Gejak <luka.gejak@linux.dev>, =?iso-8859-1?Q?David_H=E4rdeman?=
	<david@hardeman.nu>, Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner
	<heiko@sntech.de>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 1/2] wifi: rtw88: 8822c: filter
 hardware-handled control frames on SDIO
Thread-Topic: [PATCH rtw-next v3 1/2] wifi: rtw88: 8822c: filter
 hardware-handled control frames on SDIO
Thread-Index: AQHddg20ST1VskQ6L0e3SHfK9/KuYbcx1R5w
Date: Tue, 17 Nov 2026 06:59:17 +0000
Message-ID: <acd95beb9e704a51a00e1b3a18420c06@realtek.com>
References: <20261116205739.462458-2-leonard@lausen.nl>
 <20261116205739.462458-4-leonard@lausen.nl>
In-Reply-To: <20261116205739.462458-4-leonard@lausen.nl>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="iso-8859-1"
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

Leonard Lausen <leonard@lausen.nl> wrote:

> @@ -285,14 +285,11 @@ static void rtw_ops_configure_filter(struct ieee802=
11_hw *hw,
>=20
>         mutex_lock(&rtwdev->mutex);
>=20
> +       rtwdev->hal.rx_control =3D *new_flags & FIF_CONTROL;
> +
>         rtw_leave_lps_deep(rtwdev);
>=20
> -       if (changed_flags & FIF_CONTROL) {
> -               if (*new_flags & FIF_CONTROL)
> -                       rtw_write16(rtwdev, REG_RXFLTMAP1, 0xffff);
> -               else
> -                       rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rx=
fltmap1);
> -       }
> +       rtw_update_rx_filter(rtwdev);

a blank line.

>         if (changed_flags & FIF_ALLMULTI) {
>                 if (*new_flags & FIF_ALLMULTI)
>                         rtwdev->hal.rcr |=3D BIT_AM;

[...]

> diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wirel=
ess/realtek/rtw88/reg.h
> index afcdb66fdb9a1..8e220580be4f8 100644
> --- a/drivers/net/wireless/realtek/rtw88/reg.h
> +++ b/drivers/net/wireless/realtek/rtw88/reg.h
> @@ -587,6 +587,10 @@
>=20
>  #define REG_RXFLTMAP0          0x06A0
>  #define REG_RXFLTMAP1          0x06A2
> +#define BIT_RXFLTMAP1_BACK     BIT(9)
> +#define BIT_RXFLTMAP1_RTS      BIT(11)
> +#define BIT_RXFLTMAP1_CTS      BIT(12)
> +#define BIT_RXFLTMAP1_ACK      BIT(13)

In reverse order, see existing pattern.

>  #define REG_RXFLTMAP2          0x06A4
>  #define REG_RXFLTMAP4          0x068A
>  #define REG_BT_COEX_TABLE0     0x06C0

[...]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> index 09315d23e2c40..5a5215c05276c 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> @@ -2096,7 +2096,17 @@ static int rtw8822c_mac_init(struct rtw_dev *rtwde=
v)
>         rtw_write8(rtwdev, REG_WMAC_TRXPTCL_CTL_H  + 2, WLAN_BAR_ACK_TYPE=
);
>         rtw_write16(rtwdev, REG_RXFLTMAP0, WLAN_RX_FILTER0);
>         rtwdev->hal.rxfltmap1 =3D WLAN_RX_FILTER1;
> -       rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1);
> +       if (rtw_hci_type(rtwdev) =3D=3D RTW_HCI_TYPE_SDIO) {
> +               /*
> +                * Hardware handles these frames; retain BAR and PS-Poll =
for

I prefer the wording "not forward".

> +                * mac80211. The common writer preserves FIF_CONTROL requ=
ests.
> +                */
> +               rtwdev->hal.rxfltmap1 &=3D ~(BIT_RXFLTMAP1_BACK |
> +                                          BIT_RXFLTMAP1_RTS |
> +                                          BIT_RXFLTMAP1_CTS |
> +                                          BIT_RXFLTMAP1_ACK);
> +       }
> +       rtw_update_rx_filter(rtwdev);
>         rtw_write16(rtwdev, REG_RXFLTMAP2, WLAN_RX_FILTER2);
>         rtw_write32(rtwdev, REG_RCR, WLAN_RCR_CFG);
>         rtw_write8(rtwdev, REG_RX_PKT_LIMIT, WLAN_RXPKT_MAX_SZ_512);
> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> index 5ffa29d18168e..7aacdb64c6e3c 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> @@ -513,7 +513,7 @@ static void rtw88xxa_init_wmac_setting(struct rtw_dev=
 *rtwdev)
>  {
>         rtw_write16(rtwdev, REG_RXFLTMAP0, 0xffff);
>         rtwdev->hal.rxfltmap1 =3D 0x0400;
> -       rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1);
> +       rtw_update_rx_filter(rtwdev);
>         rtw_write16(rtwdev, REG_RXFLTMAP2, 0xffff);
>=20
>         rtw_write32(rtwdev, REG_MAR, 0xffffffff);

