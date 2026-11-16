Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794796117;
	b=WhxkNn8C/V/wNQHXCfPsz+FHw4eSXk5JTnwxG7E6rVl2DfJKkPEMGFBiI++e6SI/i+YV
	 umS7oM13FBvhdp7zXl9Gn3//vXb9rNgEjKeuj6dMkUiZZl1/GfKNRwVK+s68ACZouLOkc
	 8X+cq9DgD8Os2h1SmT5pVunSiuywPayJSb114aq/x+ETU5hAYpxwBttbY6tAy3Ce+16Bu
	 embCzkwK6lxzNc+KCcv9n9aXp7s/bC2npYEF99RpOMm6fEP1wp2tcNedl5UzAFxRNMJWH
	 j7yKjGsVDwWi1AxK8DTXEblRXv32+3dS+YcT5rZw8JHS6W6sOLv3omeWg7eQ56lE2JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
	b=YOlMb/Eo0KjkSXKpyARfBUm+muoJ2MvOENEXUoLC4+i1BRDpNVvTMQjporwf344RMAhd
	 OvEkZ2ou6K9Ia6AKQ1HThmxHWPV1mX9Mb9uZbsJEcWVaxjWEh4frKwGZcOYsYdgtLZwS0
	 x2scz2iHPzW9IUnmxUyUhwHJEWMv9NEmJy49ffgmoTNVV5zGeTO+sror47KhYN2Bd3jxg
	 ygDHTPfyDFjfuaee495UYQuu30cr3czd1p/m4saqjOCtF2RTfIs9eEek9Qehy6zt0GR2s
	 BEGDEVdIgW62I74iuE6a+WmOw0Vf02vHfr9Yi3Y7aGwAL3eCpSF2vj4YqUfZjI3dU8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUmDmELd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0681606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0681606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUmDmELd
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so4604767241.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794796116; cv=none;
        d=google.com; s=arc-20260327;
        b=EKoIvvbXbVV3jQVcomXZawvuxXiZKKhH1Sp0G0T0aLR8wH0KpFPIao2y6mxc4REh96
         uO74qBf+JseGc1PBQMa+vixum801PME2RyWIBE+JaASKXACkWj+p8r0P5V5ME9AxFEqX
         5GKm0iuH4+J1EZT9vo+p5xbMyirCScmOrFw8rC6niF20gwNd8ewHbkZYcY9HyzOV/NJg
         kkAovOTauNuicQXUy5CjFHo+IvE02AI1CMtvS10dHPdSsQk/hVP2H7UtntsfZqzG+2IC
         11/KeTnCNi3s7nGvz5u9QOul554zjm8Dsk8Uc5x+WHUQvSERsJkMJdOZH1WEBpByxB+7
         HNrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        fh=b+FXhE46y8jdFXC1EoumPEu6RZLzcJdp0KPCNo/mfq0=;
        b=ZcDoPYIq5X4UOaqiIRaAjbhW6Y+O3Y3fSmbdjIANSTQOBXMBGH3jJR3A2eQ93w/b/A
         iac0EE32zUwAn2ogyJTgqImK6KMiLR4kkX/chw9hypPOe1MZ1RAcKe47n16TO/hHMReH
         CWJWh08iSAD08t7+wiDNfZ9OziEHL9td8+kW1P/LuzmudgzKjavAL0mANTJo7ymu4V4h
         QchgSvfGLYZhSIhPLaUpXbQ+pwMu6CE8zbufOl8l2f1erD9OekGUdB1Cu1IysR3Ta4oh
         LDt713yDeUOsgSaN2Njc3YiUDLvoEuOXXt6mVvTQWRb7xBqZ+j3ZmwYD+BoTkmb1+eBJ
         jk3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796115; x=1795400915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=lUmDmELdQZAjfTjIbohKB2uN3vEuCte3QBVz5MYmQxTJBT8oDkRCqNaSnjzbvX5dKd
         eBtjUtFt6vJ/+FOrNT+SZaKvvxOpeVXCG0uZXPqwsFimUMIPML9N4zCmHbv2dKXczBmR
         DVsCq0J5fbYrz7PU8gCk/SmeUDsLVq2G1clHFmNPlpcj4lDIhw01hZm0pbf4SEcFUi1F
         A0wAtYY8wF+0LqMgae4iYHnldYcw0bTOtuHiFqZuZpNdy099zqyZP/u/XHaSrajEbTp2
         0k6fDaelLYToBnfRpgdys8ccfFbnot/blZuwlPnVloR6nkttp0ibGF+9WIf6sLFrgEcY
         0Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796115; x=1795400915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=lB9gxfpJtyAvuDY294JKPrSPq3Ve1JyDxkv/tT5OjcqI/tHy748qBeEjAgIO923zpt
         BTWJE7pUPdG41w5D/uGu8blIuvuxtKSdLuEUAMg3rm15chEfVCFLmAbuSvfMCEWTRObP
         7x6Vx1pzAXXdwaW30XHwbDfQVYc2dk2UeZwsqqJ7W0XQB+EDJiWhM4YzB3fTSLyRJbr+
         weHFRqM+wGAtdy2dKFRHJAcMcv4gTZ/PgyRPNGmQeujX77+92C0APYqnqaasWBw9FY3Z
         2BNSC0jwWFzbSNpVGcNDdOASpA2XadNn/GUZO6mkvkTDwjijA7ZdpN8Nx7uXyyboL6es
         biLA==
X-Forwarded-Encrypted: i=1; AL+hErE2mm6PDmcaJtj4wiiQ8UVEL41pDoKOGKfQgjJSRB2uzIAAhAZOZbdK10gCCwuKyaPfCIp7jkNUtXzz/BY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8teMpWB4wgOYEqR2N5tK0cvhn7Ht03f5L8CACSyjnaVB8xr0+m
	P5Uho3EAxmfwcSWEpIZsokVwGfPeKrNnct6skwLgMuA6+n63wV+jqp4OUoZeFoJ/pabNvwFRumL
	JSPIGRG1yl1QIwAu/FtSzv4zBKWMN3Zo=
X-Gm-Gg: AYBFou0tDQD0kLQA+NfBuf9XahqKF3DNCik0jjZB7uq0dVnWqTyuqmUmd78p6CNUpxN
	UdXI91cDOd2GIzKwOrD0Rc+0omMqxtXVFRdqedcwaSLh4ico9UL4xubc7TSoNqnxzEFHAyuKQyi
	fnu82vkgBCeaq+lvfLWeFe7cWTqQHHWJRELpZiK7BotKa5doho7eNuKq4+IpDgTwVKf1mySbTNe
	oK0WYIMz5rkMD+ciDUg+0Zv40JoZTWAFbI3jkgiqDIlBitfwXOvzqH/hgJcx85QlK2th/95SAdd
	SZCeWbx4X05G3AtKMm8DiOn0F1sTEIErI7FDe0LA6kvMWEMh0E5ll8VEQnegP3oKStdm7v37nnm
	TkHkyEGwjBescKTPb8exXHqrd8G4M4k9B92tLUhDsUWfBoGLObMLgh+JgOfLex2nOXk8XeMi7M0
	T5G94CFc+8IS3gIXrBC3EhNr2DVUbb8blEzAvPNStpvKf90h3WmOXDcWQe9yXYWZyOHw0NE8RZy
	kqpDPk3kdPzDJsizOnkHTRQ2nvkTqB06nUf+Q+BkcCtbAOjpeQ=
X-Received: by 2002:a05:6102:6a92:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7d64d6c4928mr2278451137.5.1794796115630; Sun, 15 Nov 2026
 18:28:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org> <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
In-Reply-To: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:28:24 -0700
X-Gm-Features: Aa3M54oIQfFIPxOH03SzX-2akhqZowcy4hsXJL6cGaB7t5DHcgJ3SVo0-C72FkU
Message-ID: <CADvTj4pV02w3pQeeVH11L-HOTaEbc-1jE+ErF+z4zU0QRfANUg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:19=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wro=
te:
> >
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>
> This was found while investigating RX checksum offload behavior on
> H616 and reviewing the shared setup and feature-filtering paths.
>
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by LLM and not proven at runtime). If it was triggered
> >    please include the symptoms, like the stack trace or kernel messages=
.
>
> The capability loss was reproduced in a source-extracted test using the
> actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
> relevant setup and feature-filtering logic.

I mixed up the two threads. That explanation belongs to the
separate checksum-capability fix [0].

For this sun8i patch, the issue was found and reproduced during MAC/PHY
receive testing on an Allwinner H616 board with an AC200 PHY. Even after
ethtool reported RX checksumming disabled, EMAC_RX_DO_CRC remained set
and the hardware kept dropping packets with invalid IP or transport
checksums before they reached an RX descriptor.

With the fix, disabling offload cleared that bit. In steady-state tests,
those packets then reached the host and were rejected by software
checksum validation. Valid traffic continued to work, and Ethernet FCS
rejection remained active.

[0] https://lore.kernel.org/r/20261115-submit-stmmac-rx-checksum-capability=
-v1-v1-1-ea26fa3689be@gmail.com/

>
> With the original code, disabling offload and following the reopen path
> clears plat->rx_coe. The feature filter then prevents offload from being
> enabled again. With the patch, the saved capability survives that
> sequence. A requested enable that fails hardware readback still clears
> the capability.
>
> >
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
>
> Tested on an Allwinner H616 board with an AC200 PHY.
>
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account.
> >
> > *IMPORTANT*: If you do repost (for other reasons) - please include
> > the relevant info in the cover letter or commit messages.
> > --
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.
