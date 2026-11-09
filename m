Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233460;
	b=UmL4kyfs+b8OcwkSlHxXG2sYKpXLjbspEyeRI5L3kmus1j1EHsgZuyftp1xvNQPtNLIm
	 Rms2WUsWsk5RAT3+oRqh7ZhKLXA7z8X+OnOIi4kF3z+q6PKK1ncG5CX9w+cWVXxHrzxPB
	 TczeQ7qyX8PYDSZLF56gOB06WwohHZPeWaCNPwbeTiyqnZZXUH/p+BE+umFAzAHhVVLTu
	 Tbthpi/1caf8ehHMicUD02xj6LiDeX8t89/gc5/rHrGyJ71fQGCwOGgbbMWToldwCz7dD
	 SGlOAAFbqNv2/aSmA+At8LloXd36u0wpN9rJs745qJYTa1S4NlBgst6BJH0xLgZHHhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233460;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
	b=0YvLjoF2MnvsDV936dPX2AxRhYvOCLINW4T3GrHDpj0HaTcB7/xON2gnb3nce7kPOvho
	 MVH0rENGP66PxAb4Z0ejWTmgVeGW1jidgiFZNCsypSwwOa4NRlDoS/SdZ3NHMbB5nacm9
	 65K1j3Ae3LrnXSEPmplbQSca38ZRWx4pJt1h5PM9c7oyw0sMByt2VQV+7y/AAfhzjIq2d
	 TxX00ANIV8/bjKATJibZFDb24dDgUf9O/GXK9osxrCDRClEWox8GVRgmx5U9oOw+auiat
	 JMbs5bIKhgWOgRUyUXrr2JIDGpPQ1cEYkE/4B3qO85V6Rln+9rV7TUYbxE/y2u01DtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3366D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40f29667e6so134805766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233458; x=1794838258;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
        b=BuP/tfrKRmO28Ubf2DGABAcbPpCZXJqJfGYAdzx/yNb4e1ek3fHmjRcHsEWADg99w1
         7aprr7POAiZNvqJbxHe252i9/j5yT8BBfSJyZlfmmV8PvabRRyQtB5xFKXg/5P5oZiYd
         Ec/C6NIyGLtQJSVzVYZTZ2VFZR3Wd2l1nUYyijLoWiPmxbZmB6e6Hi6NddKDipPmOFx7
         zYORlzROB1thXRP6ejH5mJLg0D9qiefb2BZF9Yh/CEFW3lDRAUvgF079higD8dpY2Rcr
         4110vEA9riOm53EGFV8oEVduq2kGqjPv0hdpn9c/eiwnQWjqKUHbYHzxt620xuHNMWZg
         MJXQ==
X-Forwarded-Encrypted: i=1; AL+hErEiLc5snFLFui598kbNENnn86GWzBUf1JDGLJ91MLr8JZRk8H6+65P7+boXESplDyohyP0RYkyAYKtv1PQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ewxdab/UkrbjVb1pDyzZoezsqazmK6iq2TYi3mJKag5XhiRcG
	4uSsRGa4rDN3i0ZpsTRbUNdvnyhE/6swn9bivqg4HuRArZ0JMNjycd92SNir1KcrWL8=
X-Gm-Gg: AYBFou13RyHdnHcnfUT53PiMw3A32/1KVFL9ucxpXQPQHV55bRU3ycIZvPqPatNdtew
	VkNNYWbe2vy4A/cy3tSU8EHV0O09jHxF7cpBO/PrHsCcc1Pj8DTOZtlStRtYi1Vfvk+7ZfJpIJG
	bye8AUWpJpR0xNwXNo0y4si/FXNXx8SWjsQKvKhXW+oaSgpDvpM+Ts2hkXV/CBEVAYqckSyK8eW
	9IIu4Q1BW391vDUv2U72rA0GzchJ0BYEVT8wv2yT4cI5XqiXPcx+3k8z0wa/jN0Y+hnAlKImDb/
	f02jimq7FYjW4Sqjv6f0DeS5CKNi1j2a/0tqCikRGJ6kpWo8TUWzAcwMC8tnz3PvmhKS4iCc0Kv
	yOwx5ZPW+hBRS5LE0/yY3gx1XsECEowqjImsT3gzDbvjuT8RtIPDVlU2xChDDoVOkIM/UpaT4Xi
	4s+6zh7y2dkkGvc498iJMjHAYq4f6S3h4l9Y3tQjoY7fuPhMLI+37F6ftfIUyQrSv0VBMumUGu1
	2uFhw52FHr0UusHO6vEZmd4KT7mvPQpGOf3CX25ZsIzteV/SIPtwNIVfksH/KEtnUgGeIbQPDzR
	IgraZ3QLB3jX4Z5238MEUxsGRPwgiEgTaLekYvKjtpr6vlua2f6A0Vvf+rtVrFZSGw==
X-Received: by 2002:a17:907:3f8f:b0:c46:7ec3:fdfb with SMTP id a640c23a62f3a-c4d6d1af6fbmr270384166b.7.1794233458423;
        Mon, 09 Nov 2026 06:10:58 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a75sm173559266b.73.2026.11.09.06.10.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:10:55 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1541583a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHod9O7PglqvtAzN0AOFq4LBkdgIeBfsL1UH3ROYd9Sv4ZGp3KrJSPfHmsce/tjLZd+w/SCo705Gp/ppZg=@vger.kernel.org
X-Received: by 2002:a05:6402:51d0:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b722473406mr2715103a12.33.1794233454340; Mon, 09 Nov 2026
 06:10:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:10:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
X-Gm-Features: AclHuK_UOMGJNMSt7XpVPImhuSlb374iqFlByrKa5-w4LBZZoP4MvZOgp7Ag9nE
Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
Subject: Re: [PATCH DNI v4 13/13] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:36, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> ---
> Changes since v2:

You missed the changes since v3...

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -14,28 +14,80 @@

>
> -#define RCAR_FCP_REG_RST               0x0010
> -#define RCAR_FCP_REG_RST_SOFTRST       BIT(0)
> -#define RCAR_FCP_REG_STA               0x0018
> -#define RCAR_FCP_REG_STA_ACT           BIT(0)
> +#define RCAR_FCP_REG_VCR                       0x0000
> +#define RCAR_FCP_REG_VCR_CATEGORY              (1 << 8)
> +#define RCAR_FCP_REG_VCR_REVISION_H3_ES1       (1 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3W          (2 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3M          (3 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_H3           (4 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_D3           (5 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3N          (6 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3H          (7 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_E3           (8 << 0)

For R-Car V3U, the revision number is 9 (according to the documentation,
I haven't boot-verified this), which is missing.

> +#define RCAR_FCP_REG_VCR_REVISION_V4H          (10 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V4M          (11 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_X5H_V1       (12 << 0)

"git grep -l renesas,fcp -- arch/arm64/boot/dts/renesas/*dtsi"
shows a few more SoCs having FCP blocks.

Interestingly, the documentation for all of the recent RZ parts (G2UL,
G2L, V2L, G3L, G3E, V2N, V2H, T2H, N2H) claims they use 9, just like
R-Car V3U.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
