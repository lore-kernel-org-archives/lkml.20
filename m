Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881917;
	b=sqF3ocX4JIS0BPxC5ut/tQgv5vJTrc5r4VnFBsq6ACUDktXGcgZXEPquLNtPzLLZyAJt
	 p+4wsC9pDgdjaeAANftxHRRyvTqGLVr7Tl3mE/VdHDFMwCkkuT7chBfHXg2azOwEM+27j
	 5AHvybyxBIew9hPegr0GA3V+CfeTjRL2cNkMmyRK4VJGc5krCR/vg0f20YsFzN0uIC+uQ
	 3eoQHKGN89jArRmLIN8B9JQiQQMJ2ambUWAJ5e7KPHDqEfkIZY6MrBv6dqvi72o5WSeRb
	 GKLnT8mErcbjxOIEhC7LpO0QjLzTNEeOnGSMaCxL8A/u3rdgVQQr+FtbEE69+S0e6uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881917;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=brRjyc0BlmbhB1cjdM0v5JQa0YEQ/gMA0rYJIW6GsKY=;
	b=BUOaiRN5Gjrt9L40KddRgj9/oS2jSmZBArSG6LBO1u2SBM2tcu6gTpy5teHX2d5rBLEl
	 XvIOrfTxkBAdbwVilwkc+pGO0RpKlaqQ/ciGKicaLKQ46D2HeBS1jeLCFP3kwwiOFUHK6
	 MNKmqiveCqlO7Df334vWEQj841OJBCIw0/FlfBGr4eo5VN3Iicb6lJLspsldcYcD7fMS5
	 hkTM86jlddXOiDnqCrrRI79GOvr1lX1Izd49jiSo0GDgkDF5jXIfjPTz3Ito5yL9lw8mv
	 TjX8PzhppSnChpt2w57eGfqSZKL21ESnAXwfhd0UBM7WeBGmzSHR1oO+SZ+g+AwUKzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="SweWRh/t";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0D606A333;
	Tue, 17 Nov 2026 02:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D0D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SweWRh/t
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH2IWd043978426, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794881912; bh=brRjyc0BlmbhB1cjdM0v5JQa0YEQ/gMA0rYJIW6GsKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SweWRh/t3GLV9cIIwzWHriEXb0oQ6eqq5rzT1WDSdH06SLpgVfCs4qtwidWrQGHhk
	 QXiv43VXisyBZNeISz5lECP9761NJcVPz6bqEjdG2xRrn8Sq2fA+nVO0nHDOpsTwUX
	 TFtVsxVIIl2wIje+M5ikjK3dMIaP7clqcLtWErut7wFlZFAptzbvGIQXLpzEZWCzbd
	 DUO3Ko3xDMvt5mctmihFW+gBLRavnRAgNI7C46bJDOo7hmLQkhgF4HWjSLSvl32LOx
	 ocLRlmynaIAQyn6OZuDTOjByH/sBD8F5bUYfdWFGToDNA8ITUVfI3rRaDs8zL1lho4
	 T6+h2XEHDNHhw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH2IWd043978426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 10:18:32 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:18:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:18:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 10:18:32 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rishik Yechuri <epicrishik@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rishik Yechuri
	<rishik.yechuri.code@gmail.com>
Subject: RE: [PATCH rtw-next 1/6] wifi: rtlwifi: use struct ieee80211_pspoll
 for the PS Poll reserved page
Thread-Topic: [PATCH rtw-next 1/6] wifi: rtlwifi: use struct ieee80211_pspoll
 for the PS Poll reserved page
Thread-Index: AQHdcUN9DKXFcrqvX023bsfqE+nL2rcxi3GQ
Date: Tue, 17 Nov 2026 02:18:32 +0000
Message-ID: <77b9ec4651f54eb2a3199900df69d316@realtek.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
 <20261110184409.42205-2-rishik.yechuri.code@gmail.com>
In-Reply-To: <20261110184409.42205-2-rishik.yechuri.code@gmail.com>
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

Rishik Yechuri <epicrishik@gmail.com> wrote:
> The reserved page builders fill in the PS Poll template with the
> SET_80211_PS_POLL_* macros from base.h, which write at fixed byte
> offsets into a u8 buffer. The AID macro stores a host order u16, so
> the frame is only correct on a little endian machine.
>=20
> Point at the template with struct ieee80211_pspoll from
> <linux/ieee80211.h> instead.=20

No need this sentence. It is obvious.

> Its aid member is __le16, so the AID goes
> through cpu_to_le16() and sparse can check it. The two addresses are
> copied with ether_addr_copy() on the struct members. Remove the three
> macros.
>=20
> On little endian systems the bytes written are the same as before.
>=20
> Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>

Not match the From: field

> Assisted-by: Claude:claude-fable-5-1

No need Assisted-by.

Please check the result of patchwork:

https://patchwork.kernel.org/project/linux-wireless/list/?series=3D1207558

[...]

> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> index 9a9f9e14f472..cda9388388ab 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> @@ -545,7 +545,7 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *h=
w, bool b_dl_finished)
>         u8 u1rsvdpageloc[5] =3D { 0 };
>         bool b_dlok =3D false;
>         u8 *beacon;
> -       u8 *p_pspoll;
> +       struct ieee80211_pspoll *p_pspoll;

reverse x'mas tree (apply to whole patch)

>         u8 *nullfunc;
>         u8 *p_probersp;
>=20



