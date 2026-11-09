Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240054;
	b=BSH59V9mVpdWRodDUu6hvLeBNCRNhK92bCwEmxP87MoDyD+5VpO1YcgkU4GI1i5Iel1c
	 YJLEOcA9mzf2LSm8SFIZfPaiSaeQtTRhjwqkharNvWI/uE97b1q6xmuMhI3ue0wketoDf
	 XK1Ejki9uxtgMMng69idEK/7BcKyYEYv0TmaNB9ag67qOyYCKLfpw+eUuxwE14BcE8Uc/
	 dO+ekGEvmT+bk0YM/XCTOQpatppY6OmjTCWeiltXuHusvWb7OBEg4r4YsFB4/zFXO0VeZ
	 PjjzroXpaFhDQMPibVACqPNuqx6P3EEcI4g2GIlGs6azvHzFgSdso/iDhh0QUU671Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
	b=K1trWuAbFfy4nyZPMUMMxdiLxV0WM5Bdvvbo9KgiNTXKVzofUc1cg2cr7T7D+mV4Hhu4
	 n0vFN6YSbHwgZ9Aiisfl4FWWOkYzUUzU2wJwsGtnoMxLb76PGoRgZnNoII1TygEfW388m
	 yuh0gXWlGyf8Z45JgEYKc4aEmuK6NvdNxxT0GEn/L8pCUc/nMbrpCw33DUat+6AjZKEQa
	 t8eXQXCexpU8yCntKNUjnlDG2PX9Ua2rEmzfXBp/WLOTwo+XyVR225ue7qElPUAsQGuvo
	 PbEKXJ+eqAgy9HyhwM5Xtb2aTUJJ8TQEaldjYu0B2XSFITmWbILz72BppWcbnhsr72g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3954B60A262A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3954B60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1156048a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240053; cv=none;
        d=google.com; s=arc-20260327;
        b=F2wXC9LlIfR6GSQCLPPqQEH+s+FntWc8+fnjl0urmKRpM6sNJw5vtOsVaXH3pIzgIw
         Ke05lKlVQKkUHxfaU2FMido7dik6tyUQ6lfePgBm6zho0DkqYjXRqdQwPxjydnY8MU43
         NQ/lBqOefaGNta0Hpz4c+WceyM/l7+oPJ73wnlJcDZR4UTJQehAMd355ASnGYFkehO7o
         6tmbgLlOVH2t4GieC/pG94gXkpjeuoVQ+mN3hCYQ4kA6cT9eRO/8AiSM6n5S/aRbLLto
         AeYj7jqdh/86e81A7Gi+EkwUd2mv7aPYWA3w6sVZxZEhdpmotnycRRYfQZEM1opU0DYU
         r9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        fh=UoFjbX5UcUMrwWHF8r015aRWGpDIufTqH1L+6gkGI+A=;
        b=fiGBL0Xb3QP5k5gaMrxDwUJ+uy6sb7kp62YOcSeC1WPZwrmAXmtydaRbkUmn9Sqhef
         12QtVZutqiJLYGH5xYhfm9AbEDNMspOvequTw5H9V22m5M4oES/fsVcvBcIBRJ3htAda
         TySHujB29rbwtRAWN1PvSEi6yKU4p7RuP54oCJQIVxikpuwgrk5DDxKQ/uKIRMEEI9DW
         /PJLGl/3xZDiDa71ntSRaDxPyD0C6r8YjxSLEQJ0OkI3wfsJreokg+sm5dv4x3ilZLcK
         As3WlNdA1otK+UKEJ8OV6+/EEECvKtntRUTSGbuRGeXDIbzLHqJKezJ6Kx+Hsi9li44K
         Nc7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240052; x=1794844852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=XsshOqMzA4g7VkUFJSMBdIgw+TyNKoOTeZcdXvA2/JueLosVVFf1C1anFVPFqzsdm/
         +il24/vmlBaJ+7GEebvhk8L6xeucLXfjMgk4BCtasOETmK2ilY0mnGPZJiMUCECbmIOT
         qh5NN0+nRWZcTbaiPUHeRJDKjbLLCNKGkgeHK/ulASwD+SBj0PafYUVdA+gU/Zk9PmDe
         sKkXNPtxtGoHTWYE2OJRyc/+zykR19F3iaUdLi/Zy78CpfTt4Q6And+Wj4tufyBodwVc
         ctKxYkiw3BSI0Tx+qZwpeeuCXN5Fwat8kOF+OWPx7UHHKkU9mMIV0n+rYKpkal3eyCj/
         71Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240052; x=1794844852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=QkXG97CAjRE8KorfOlmVOc1iHPRlK+/7gEnl3UVlOVSlNGDQtLU5UHfVrTM8jHuqwf
         zfxH2Lj2zYfpoy9vgDOvzrs+mAxS5eW4LApZTCgVi5AbtXYy+jlRS113ZjWAeo96ZphY
         wAGNjKH5FtLVBaZB0O88t3jUt9yWms/92SE+0vKyc7ta4tZ1S+pnMn2vK/B2STZdK4IU
         qB7tOu92/mIAFzxKcsGd4Yq7NQwpCBqB9z+F545+k2oiloDscbIy1MxLkX/wzC6laF+7
         u83SRuz1ljVig6d/zYPNZ5c+5/c3dQ/J/Bsn6cLEoPshiYMxYpMgcQWVyQYlpgz9RC9z
         aTQg==
X-Forwarded-Encrypted: i=1; AL+hErHUjx1el5+kMv+4TxI+PbRlAOaL7SG96Z/2uu5V7ijPCxHF6GyGcMAGzHDpQPWlFZXiMUIZ9u6FBqvvY1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aZg3ZbXvO6HGPo5fOURmmyS9SdTfl9/t/B+K2Jy1RhLraZfD/
	uX6WKvHUTTXapANzKjq/46/puRRpeICudxj95iqrYo8jtCh3xow/6jPaopzZvrVtuDhhDxh5BL1
	gFssav3IivUPkmWY2u8QQopD7AV7vL44=
X-Gm-Gg: AYBFou3A8mN/myKvRzhdhUzHxmSr1dR/OfGAaRblBVbczNW9RdfcHVdcQs7y2bxDvmE
	+ULOJw3NR4Gib7L5rxrrASrNNwxhbhNAVmnTHBY0xbJBdsp2tl0U2KxU5qu1Yjcf7UfCwJt71d0
	zG+su+ag/9MRqZxnGvitbmX7hg0vR54aSKSg1jUO6MCRY/Dx56B/IF2QOiT3G7w5AW2TMNddcyM
	YkrONOmBm7JRB5icWezpexVfTl1DFfHf3g1qBivtAYTXSywEL138Rf/MsLJJ9TvwiNMVgc8ocMN
	N78WAIKwUKUsmXSjNVBrg6RC/1REAsJBBVxdOFyl4WoxEghaHcvdi3ZEJIOOVahKnWI5lDYFXur
	gjk1MnOALKT3P527RsrlHVipPjrvIE9Af8McfHnm1qRhNfN6UYvaPzFgDmaB1BzoKkPz3SACwyi
	oRCBb80vY+otyfeyaEme7nl3du1kZEpUtFLuB5FGfZJyzWkyC7JACMiSB7Cg==
X-Received: by 2002:a05:6402:3908:b0:6b5:47d6:a8b0 with SMTP id
 4fb4d7f45d1cf-6b756afd795mr8207a12.37.1794240052060; Mon, 09 Nov 2026
 08:00:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com> <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
In-Reply-To: <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 16:00:25 +0000
X-Gm-Features: AclHuK9DoJ0CyffK9_ibsQ9MndPimemnqbVSvRuC8icXaKh7HkxYXoo5YAyMhM8
Message-ID: <CA+V-a8uHLK4-GFhWQO96yHBDzXYXQ+aggbWfskzXsK_17dAKCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Nov 9, 2026 at 3:28=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/9/26 04:27, Lad, Prabhakar wrote:
> > Hi all,
> >
> > On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> >>
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Hi all,
> >>
> >> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs=
 in
> >> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> >> which the CPG driver registers SYSC regmap. WDT driver now uses this
> >> syscon to access the WDTDCR register.
> >>
> >> These patches were part of two seprate series [0] and [1], out of whic=
h
> >> certain patches have been queued separately, so I have included rest o=
f
> >> the patches into this single series.
> >>
> >> Merge strategy, as the WDT driver now includes renesas.h header file,
> >> the driver patches can go via renesas-soc.
> >>
> >> Note, patches have been rebased on top of next-20260930.
> >>
> >> v7->v8:
> >> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
> >>    restart handler" addressing Sashiko's comments
> >>
> >> v6->v7:
> >> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() functi=
on
> >> - Added new patch to drop pm_runtime_resume_and_get() &
> >>    pm_runtime_put_sync() calls while accessing the WDTDCR register.
> >> - Dropped propagating WDTDCR access errors.
> >> - Dropped converting WDTDCR handling to regmap as this would require
> >>    resource address comparison to get WDT index to call
> >>    rzt2h_cpg_wdtdcr_count_start().
> >> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> >> - Added if regmap is available, use it for WDTDCR access
> >> - Updated commit message
> >>
> >> v5->v6:
> >> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> >> - rebased on top of next-20260922
> >>
> >> v4->v5:
> >> - patch #1 is new addressing Sashiko's comments to avoid potential dea=
dlock
> >> - patch #4 is new addressing Sashiko's comments
> >> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
> >>    restart path.
> >> - Handled the regmap locking in the driver and introduced nolock
> >>    version to be used in the restart path.
> >> - Added review-by tag.
> >>
> >> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.maha=
dev-lad.rj@bp.renesas.com/
> >> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mah=
adev-lad.rj@bp.renesas.com/
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (7):
> >>    clk: renesas: r9a09g077: Add helper to start WDTDCR counter
> >>    watchdog: rzv2h: Use pm_runtime_put_sync()
> >>    watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
> >>    watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
> >>    watchdog: rzv2h_wdt: Add syscon based WDTDCR access
> >>    arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>    arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>
> > Gentle ping.
> >
>
> No feedback on the first patch of the series. If you let me know which pa=
tches
> don't depend on it, I'll be happy to apply them. AFAICS that would be pat=
ches
> 2-4 ?
>
Yes, that's right. Patches 2-4 can be applied without the dependency patch =
#1.

Cheers,
Prabhakar
