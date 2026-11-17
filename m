Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897520;
	b=GqAHQ/n91xsP4U34BjIIRPocaChANHAHizhcAg2vYWBxeXpaSDcrvVTO4kwl2E0Jwlw5
	 MdsN5YOXMzU5XZ5tQ+d1hdwR65Vd89AuJACd8SNgtp27rqiirkx1rbI15tVJTgESVFeSO
	 1UkjdfhTXSIqiIfg3XGi2fZp45sX9bTGzZA5pQQU7Mq5sHH5P8SvujT+IRhAE8NMtqEED
	 kf/agJdlJv+W1epcALdgpfa/wQr4yoBfJg4LJeGafdyJPKnL9684/YkdLFdbUchaGDTvm
	 WM8GDyKl+asFZHPYqCXtyPA0gUdnk0IQ1BjQa40FzUwkpZVkqHLVhmu2CLiLFmjldFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897520;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=1qAkmIJabPj7EtlLh9OSIrnuO6kDNG6JAYuAFSeLltc=;
	b=jT2imJuXogud43699l/xuVwLRWu/BJA9Wwvbqu19t9rrxnnLie8N9hKdXIqO9rTbx/Cw
	 tHYpABK7wSnCqVKJV99c8o4ePf5ZklRXJ7Bkz2yiEn5wK7UnTDT1Q9Wqv1QLxCzmuSBzP
	 /dbW+fefMfqssoiiSTymyYscRKIlRCFPM6txb9vGVFzX+qbYz3GKHiDAwTgV0N9wWFxxJ
	 U/Gd15GB2I+qkfuf02903t59+1jPD5paLrWmSO0KwG1AURx/Tji5he4v1jz0WL4EuMTuW
	 8gmIgCkN/QtRXpUAFuRv5EgLAXZs96psNb7TONgkOG1psLNhfDydTKMtZpgDQTuGZvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EiZMtP0g;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696B606A31C;
	Tue, 17 Nov 2026 06:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3696B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EiZMtP0g
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH6cLmP54188530, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794897501; bh=1qAkmIJabPj7EtlLh9OSIrnuO6kDNG6JAYuAFSeLltc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EiZMtP0gkC6gCHbKhRLGCib4Tdl5oAXmIkaOxr05R5szb+C0Rb+LBVrNxHh5hDj4Q
	 6Nfcjkmy5cicqDx7nkJI6IkXTYyniYZWjBKOpXfdOG2UGinzdF2bPQMSXxP3esCEF1
	 o2XrSFtjVxF4l4vzGUgorCrkRnNvmIaQAIImJBFx67CJhe/nmEl7SfSrVzh+/OEM02
	 Egk08kwtyoMm4ggW3I7wkIKD6PBs1YlRG4vfp9P0IAA3vu6OJNe24L7vcX5LBgwmPh
	 yF1VGFTEImfsesQf+ei6+9Ucbs1dK2V0iRWKxYDfGUX/g3Q9gipAaBBPsjcK7cCJ8k
	 nh1lGaNxpzy1Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH6cLmP54188530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:38:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:38:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 14:38:22 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luka Gejak
	<luka.gejak@linux.dev>, Kalle Valo <kvalo@kernel.org>
Subject: RE: [PATCH rtw-next v3 2/2] wifi: rtw88: 8822c: ignore nrx values
 without CCK PD registers
Thread-Topic: [PATCH rtw-next v3 2/2] wifi: rtw88: 8822c: ignore nrx values
 without CCK PD registers
Thread-Index: AQHddT6xhEieifs1MkKPJ2YdDVTuQ7cx0FCg
Date: Tue, 17 Nov 2026 06:38:21 +0000
Message-ID: <427f6f2e79474058958c3f3d0901df38@realtek.com>
References: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
 <20261115201826.181662-3-zeshanahmednobin@gmail.com>
In-Reply-To: <20261115201826.181662-3-zeshanahmednobin@gmail.com>
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

Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com> wrote:
> rtw8822c_phy_cck_pd_set() reads nrx, the number of CCK RX paths minus
> one, from a 2-bit register field. The driver only ever sets it to 0 or
> 1, for one or two RX paths (see rtw8822c_config_cck_rx_path()), and
> rtw8822c_cck_pd_reg[] only has registers for those two values; its
> entries for nrx 2 and 3 are all zero.

Just describe you validate NRX, otherwise it crashes because a device
surprisedly remove.=20

>=20
> A device that stops responding can return any value. On PCIe, register
> reads then return all ones, so nrx is 3. On USB, a failed read returns
> whatever an earlier read left in the buffer. bw comes from
> rtwdev->hal.current_band_width and stays valid.=20

No need to describe what other patch does.

> When the level then
> changes, rtw8822c_phy_cck_pd_set_reg() gets past its WARN_ON(), which
> only checks nrx against RTW_RF_PATH_MAX, and calls rtw_read32_mask()
> and rtw_write32_mask() on register 0x0 with a zero mask. Both compute
> __ffs(0), which is undefined, and the write puts back whatever was read
> from register 0x0.
>=20
> Return early when rtw8822c_cck_pd_reg[] has no registers for nrx.
>=20
> The fix and this message were drafted with an AI coding assistant
> (Claude Opus 5.5 by Anthropic), then reviewed and tested by the
> submitter.

I think no need this. Just rephrase your commit message, and keep the
key points.=20

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> index df7df76785e4..1eb1a9656886 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> @@ -4406,6 +4406,14 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev=
 *rtwdev, u8 new_lvl)
>         nrx =3D (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
>         bw =3D rtwdev->hal.current_band_width;

Since this only can happen when a device is removed suddenly, how about
reverting patch 1, and also validate bw <=3D RTW_CHANNEL_WIDTH_40 here.

>=20
> +       /*
> +        * rtw8822c_cck_pd_reg[] only has registers for one and two RX pa=
ths
> +        * (nrx 0 and 1); its entries for nrx 2 and 3 are all zero. A dev=
ice
> +        * that stops responding can still return those values.
> +        */
> +       if (!rtw8822c_cck_pd_reg[bw][nrx].mask_pd)
> +               return;
> +

As the comment says, why not just validate nrx <=3D RF_PATH_B ?
No need comment.=20


>         rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=3D%d nr=3D%d cc=
k_fa_avg=3D%d\n",
>                 dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
>                 dm_info->cck_fa_avg);
> --
> 2.43.0

