Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985784;
	b=OYSxAT3KHy0jso7HDHpBDk1YLVKYxZeQcZWghE41U4R+HYSxCtSccHfkOmzoboWTO9MF
	 pMkyImIIAyBwmBkmCsEYNTBUwe8eS5cHbvvgm2TUvaV7VKof9T5V2IEKhGq3vdznNAoLr
	 jzR2CCtkUeSyKFWpNEHpWP93aJiHKpQH9gvtYMWkwPoIan48wcV49TYrUGomaPczqU3cq
	 FnEXdqjdmHqiAKje9TAYr1EaOGMGTeWWX0bXmYHK08xl4VnQYklydvxZp6uaQtDqtFPGC
	 mHn/fIHztTEq5EqB4XrY1t0mrSeUHLtqX9yuzXqY79EYaTBuxnsEVMqJb/HKQRwymbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985784;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=L7s8xik1PQ41RDVxtNruT4WlN9IQ0YAu0HnMsQo5t24=;
	b=YH8395VWBCRxQV6XKjYNjbAbkSWivGuueAoQBqq4EExoYyXfb3/QTwBg7/CIJY07rIaS
	 Io8TP1b46jpnDAO47ntNnr7RGM09w6RwNOlGcUxdgcPpL+8Pb9ulPtmdM8v+eKFG4QT/9
	 sGWNyPoSCH0CuXCEF+xmJLhit/MFBHAR7nPfIO4/vEVQ1l1VJI0+h9nOAU+JjhxgOVGKG
	 C8i4cqLa771uivOK4d+bT/xZRQFfyzv8xZ01+72k0BZzOJYhH5xsSszmG9OoPljdOodpz
	 tK06+4aTC6TeXZPvNMJAzGz0crHuZsmddXhcxsZ/RGozzaACHRyJJmW9oEzRlQeTGTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SIxP2e3P;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE3606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BE3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SIxP2e3P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cstsiDfCF4yTa/fX/KiZRHyJb1s4Y5+pEA5PYp6kUU0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793985781; v=1; x=1794590581;
 b=SIxP2e3PfZUvaYkCDQs7lqt45oYj/BsDbBgNoL0kgaymHGC/gNEb52fUnf8+Y84wn7OnGR+0
 2vgp3kxGug22ZKX2fc0cRpu0kaSdJZzeRWI4z1xHMPKT7dgmINwDCYvfZY0Q6sylI5p5L03ltMo
 PJvAm3AN+i6c3DYk5fi7wl20=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c3731615bc07cab2;
	Fri, 06 Nov 2026 17:23:00 +0000
X-Mizu-Trace-ID: c3731615bc07cab2
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:23:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <e91158cd88850a4e744e09f98fedc47e9c6daeaa@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 2/7] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-3-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-3-hjf3108@gmail.com>

Hi Jie Feng,

Thanks for the new version. A few comments below.

October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/ne=
t/wireless/realtek/rtw88/rtw8814a.c
> index 5bb55606f14a126806acb354658c150150ae0cce..2db05a83766d65123edc95f=
50a40d3f93bfb1dba 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c

[ ... ]

> +static void rtw8814a_bf_enable_bfee_su(struct rtw_dev *rtwdev,
> +                                    struct rtw_vif *vif,
> +                                    struct rtw_bfee *bfee)
> +{
> +     rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
> +
> +     rtw_write16(rtwdev, REG_SND_PTCL_CTRL + 1, 0x0202);

This is a 16 bit write to 0x719, which is not 2 byte aligned. On
RTL8814AE it goes through rtw_pci_write16(), a plain writew() on the
mapped BAR. As far as I know an unaligned access to device memory raises
an alignment fault on arm64, so an RTL8814AE there could oops when it
associates to an AP that is an SU beamformer.

The vendor phydm code does a 32 bit read modify write of 0x718 for these
two bytes:

        odm_set_mac_reg(p_dm, REG_SND_PTCL_CTRL_8814A,
                        MASKBYTE1 | MASKBYTE2, 0x0202);

so maybe the same would work here:

        rtw_write32_mask(rtwdev, REG_SND_PTCL_CTRL, MASKBYTE1 | MASKBYTE2=
,
                         0x0202);

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/ne=
t/wireless/realtek/rtw88/rtw88xxa.c
> index c298fa0fb2a6b94118527a297affa5e6e8ab633d..87253fffe78cd6f5b58a325=
eef42b58b968e2d46 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> @@ -138,6 +138,7 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *=
rtwdev)
>               efuse->hw_cap.nss =3D 1;
>       else
>               efuse->hw_cap.nss =3D 2;
> +     rtwdev->hal.bfee_sts_cap =3D 1;

The function already has a hal pointer, so hal->bfee_sts_cap would match
the rest of it.

[ ... ]

> +     addr_bfer_info =3D slot ? REG_ASSOCIATED_BFMER1_INFO :
> +                                   REG_ASSOCIATED_BFMER0_INFO;

Nit, the second line isn't aligned with REG_ASSOCIATED_BFMER1_INFO.

[ ... ]

> +     rtw_write8(rtwdev, REG_SND_PTCL_CTRL,
> +                RTW_SND_CTRL_SOUNDING_88XXA);

This fits on one line.

Best regards,
Luka Gejak
