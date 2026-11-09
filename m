Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189375;
	b=qYU6wAhCuZYgja7Cxo01TPzXWIzghWIi1Tou7E2rT+pNNXLQj5YJkc9Zgq52EunK35Lu
	 p/e3xoLRG/FKpzLOQw7YFjGnxFMhl4qjBWOsnx81rr5MzX6+iHobPlfExFtptkaQxzx4/
	 w2NGvisRViB/kd/u4PzGrGH1BlCepg2sGwViYm3mMoricSat91YQJBsLLbZvY0nRcLKIF
	 VTm3tOP1zs8IxSssY/pkujvTl06PhrG1Ej33uCMIKkt573anDLn309lkrj6ASOfbaHugE
	 hYhRzGipNq1soP3f15FfjF5MSjeH4+xB6m7OOiNzqRA1hXgdFWCEuzD6yQ7s+o/6Gug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189375;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zlooKifXIEnpOdDholaV6IGpZp6Z7HTveBBzmNQgTqE=;
	b=MkhnET0tAxn3vrRsqCxVq5tq39gslcDKHE30Dhqy0PSqh6DkT/q+bussNCQqrTF88i5z
	 7F4aRnKAOcdS/MgIUaMlVsPXY+emdTzBDVoJkmPwh1slKaUME6QSMMjqkKHa/Cx6i3jC1
	 j7J/VxV4C45wPX3czYJnCqlRM++cYUBm1SloZYAaqgRV+Jm3GQQyqdoskEUCOGLKtORJK
	 dUcD8EnOrb7LFZ69Ef9tm36X2Opk3KeOnmzegrrCjv70dR423KeGFDiDFyCIa7DpoDT7I
	 wDFyy5olbe2fOTZZWJHU6i2PizlzvfrbdiBYXBWCJTvtiRqL77zAw+fvW8vi9volOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="P/popzep";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB9606A336;
	Mon,  9 Nov 2026 01:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FB9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=P/popzep
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A91u9SS13887152, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794189370; bh=zlooKifXIEnpOdDholaV6IGpZp6Z7HTveBBzmNQgTqE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=P/popzepLhymPDoRKxtueHD6UOyo/uAJyenv39IrWgsnsNblOCr5o8Y6vKZuyNdKX
	 w1zMOxSRRclGAptyJkv3gCGspQBltGG5IQHmfomS4PFJcomgDmm8BxOYiXNyp/oeUg
	 wQgHl2V8uXZLIcuJP3ActpGtbqjtTbT6RYqckjz7IsCAAEx8lYhLpFgnnN5g0GppQ/
	 USB4fku2Sq6/l2Eec4xtHzpFT72E/4Yft7iqHKK537BtuYXWmbf6+09oLYO+hAU+w4
	 sEsqyZRst8JCXit+STU9vwc21v94BQykvOUNF47hdVk/ygltioBv4RdyHaHpjivq3b
	 bfJ6QIfwghpXQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A91u9SS13887152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 09:56:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:56:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 09:56:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware
 use all rates
Thread-Topic: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware
 use all rates
Thread-Index: AQHda3lMjeHUYZEd20CIBb6M95IYCLclAbug
Date: Mon, 9 Nov 2026 01:56:09 +0000
Message-ID: <8fbf3fbba7d94b55b7510a57ff376e8d@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-6-hjf3108@gmail.com>
In-Reply-To: <20261103095256.949327-6-hjf3108@gmail.com>
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

Ho Jie Feng <hjf3108@gmail.com> wrote:
> The rate mask is chosen based on rssi_level, however rssi_level
> is always 0,=20

Should we fix it ?

> since:
> - for rtl8192de, call to rtl92d_dm_refresh_rate_adaptive_mask is
>   commented out and function is not implemented
> - for rtl8192du, it is also not called.
>=20
> This makes the branch always choose less than optimal allowed MCS rates.
> Enable all the rates.
>=20
> Test results (2.4 GHz):
>    before after
> TX 6.4    12.6

How about the rate before/after? I think the highest rate will be similar
or the same?

> RX 32.0   39.1

You change many rate masks for different wireless modes, so please provide
more experiments. Especially you need tests for a clean & noisy environment=
s.=20

>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  .../wireless/realtek/rtlwifi/rtl8192d/hw_common.c    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> index cfefbe86380fbc..0c921c049b5178 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> @@ -903,7 +903,7 @@ static void rtl92d_update_hal_rate_mask(struct ieee80=
211_hw *hw,
>                 else if (rssi_level =3D=3D 2)
>                         ratr_bitmap &=3D 0x00000ff0;
>                 else
> -                       ratr_bitmap &=3D 0x00000ff5;
> +                       ratr_bitmap &=3D 0x00000fff;

This mask means all 12 OFDM rates. I guess original design wants to select
higher rate quickly.

>                 break;
>         case WIRELESS_MODE_A:
>                 ratr_index =3D RATR_INX_WIRELESS_G;
> @@ -922,7 +922,7 @@ static void rtl92d_update_hal_rate_mask(struct ieee80=
211_hw *hw,
>                         else if (rssi_level =3D=3D 2)
>                                 ratr_bitmap &=3D 0x0007f000;
>                         else
> -                               ratr_bitmap &=3D 0x0007f005;
> +                               ratr_bitmap &=3D 0x000fffff;

For N mode, it wants to jump to MCS rate quickly I guess.

>                 } else {
>                         if (rtlphy->rf_type =3D=3D RF_1T2R ||
>                             rtlphy->rf_type =3D=3D RF_1T1R) {

[...]


