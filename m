Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496162;
	b=SNSWwOnKF2XwgcqpFJ8zzSurndAkMpofJWFpvKNaB3elcQ2lLLvFYIkJyPCJlTfWFxGy
	 yZDAmt/MAddqRO2r7h7O9ey6tBesNEqNUGxLwaSs5Yi2iwp/0McujIvngZJZFEDqT/Q4m
	 bzjxwcGfmlK4epYQ+xcrmpERjgOCoE0Yg+qXd+fmc9vGjnPDKuq4ZrlA/gg4UNqPvR5pD
	 sxFfPiC/Nf2lv+578rPdxWYGP1z2/7C7YrcDtfKaKjf5+/ayQYUmGhesz6ZYTlhzsVk+H
	 mgKBOhgN7xfzaCUM4ic0Hjl5YpcEHWdnxO6g2uzmWmSvw/OvLBDDKUcpwANolKbDeCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496162;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
	b=aeHjBe6D/OH6I0QBbVx8AykGvLOTdvHLvWAKlExMn8d0W/Te/WAcxCo/dAbAqm8Dt/7z
	 NSBpSHYjCBgsZijpGSeExugkhBl9DMbc1OvACJAQ2HqofUEcQVsHCzbs7QrQ0rxbYbmQl
	 oDeIWLpJD0rDPrDDmeZlxwg3mki3BOtG2iov+uqtCMkaErk6uvITXVFzQHYnxXkXci7qS
	 Uc4sbaWs2a8h21kWYYSaPWpM/tz0dojg/t6jaBUWngvmsnaYac3681piHe3yd0xn6ixnZ
	 ixsnql9YuBXN8LWpVJrRLZO0FptdVIjanDuGnV9u0omOeWoU9OsKlfYwehj9Mvl3mFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF79606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF79606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ed2f163a2fso1333357e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496161; x=1795100961;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
        b=s9A+FU5Z/ARyoiHRpyWjnb7B4IJarISzcMB/QF4hK7UceUyIpdDdjNWdQPeanjYr2U
         ipLTHyjxVRnSzkw9GVZzYer/FfG6C91RDJcC6RplN+BUd3C7yZHfQdSWf+XcJPIWZgYd
         kjVtWyxroKCRmy77tj2ATZk1+6jF0ca51r2FFYZFgaideTMVrUoiM+h/h5OiTcYjLDZ7
         HDSo3u4lGcg4LCxO+GqsOejsQA7uCN149+FPbD+Y3Uu9q8oBKO/8kfIWmghpi4bALBpq
         wuLF+InoVhBUaRkoCvjDbR9KMW8IIUgKbPzw6x2itcW6btB0WnyB+KXMXS1vc0NedsgB
         8hxw==
X-Forwarded-Encrypted: i=1; AL+hErF0sPiLMI2ntxs+TXMQBzTC7dZ4ISO1HqeVuIkxdmYwHhEJWARR8GCZs67zFD2gnywZ6xyJ13XB9WXiyKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fMSVFpecW9manESn0QE6tWsqoC9DlHsBpLBBHIb7uKNTi4NLh
	gHa8K2B+hUTpIk0W0Q0m1NGSQMBcr6+0S+BkNdvI7zIPK36hKJOQMXVxyT77B/drHNc=
X-Gm-Gg: AYBFou2s3PpAnHHJaXNA21Cvqv6znwgXGAS9SjzUtzJk9sUayleegH1hE3zKZ39fW4+
	C9JnVcLKX/oFPXZSH9LU0QPViWGK4fWl5/71wVRU/g5Sa4h+ooH/7BJZEe9GOjIvyPgm+RTHph2
	FUDtwYLR+A0X+3EenDrZf98/Ky3s2xP+7uPIm1xFH3wlsuPfu4c5NpMAblP2mIZl3lHjxC1C57a
	C5rHDdFSJQldUcIAcA+aSLx47w31r2twCwbRPDe1EuG0K+6O73ACnmhUYMjcx+94cOJZBJ4ZOlS
	yW8BNI6qka1C2UUdBvmu7ErhA7wA1DaVW8SLLxCTm51usijI99pxZpfsxsXjXMVFXj8WIjL+hFT
	iNl5D7w/ZIBQHIoG7mEH7HOBDKxycFvfziT/NDN2wVfGhOjstX8Q2gv4+2p1Cngmz+vwbGTaxxG
	SG+2RgpfpncsdxTbYf9tr9yjceSiytNUo4pXyG6ZUh9c9AeK4vHwy7EO71o4hXsLGZczZTEH+dd
	yYiTF3WrdpA0ctIxy9RQTuHNrApONwxQypNpqz8b7W7NkIrpBEMQN1rqxEYkkkQQrXhv0nph175
	sVtcUyFk3tZuSKD9cxSaqBhrH/KS2vGivjTU/YMAIoo86r0HuV3EXPHNYJEElOKqEA0=
X-Received: by 2002:a05:6122:134e:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5ee1c499a64mr2424902e0c.22.1794496161361;
        Thu, 12 Nov 2026 07:09:21 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3224ec93sm182453e0c.0.2026.11.12.07.09.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:09:20 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso1055001241.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:09:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlUQzlmvOgizc0aKWviKgghU2HsCJWjrMcJ8iX87jqUX5tJdEdRNBOUBO5BSlWxA9lwfQ+8Kc4JDblg4E=@vger.kernel.org
X-Received: by 2002:a05:6122:54b:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee1c298abdmr2507584e0c.2.1794496158519; Thu, 12 Nov 2026
 07:09:18 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 16:09:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
X-Gm-Features: AclHuK9Zmur2PVIdNvv46swJ-VbufJjxD1dvyJf5R-d3EopJYyWzLSJYUjPuDQE
Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] dt-bindings: Increase Renesas X5H MDLC PD
 specifier bit width
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> In the Renesas R-Car X5H, the module controller's power domain specifier
> cell's bit width has been increased. Update the bindings documentation
> to reflect this.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> I'm guessing that the maximum number is now 512 but I can't find
> definite proof of this.

As the Module System Reset Registers are at offset 0x900 + l * 4,
and the Module System Reset Status Registers at offset 0x960 + l * 4,
there is room for 24 registers holding bitfields for 16 modules each,
thus maximum 384 modules.

> --- a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description:
>    Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
>    Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
> -  to 256 modules in the Power Domain of each Module hierarchy.
> +  to 256 modules in the Power Domain of each Module hierarchy. Recent hardware
> +  versions have increased the number of supported modules.

Just change 256 to 384?

>
>  properties:
>    compatible:
> @@ -32,14 +33,14 @@ properties:
>          are always on, and for which there are no MPDG bits to control them.
>
>        - The second power domain specifier cell is the module standby part, and
> -        must be the module number (0x00-0xff), composed of the Module System
> +        must be the module number (0x00-0x1ff), composed of the Module System

0x17f

>          Reset (MSRES) register index in the high nibble, and the Module Reset
>          Destination bitfield index in the low nibble.
>      const: 2
>
>    '#reset-cells':
>      description:
> -      The single reset specifier cell must be the module number (0x00-0xff),
> +      The single reset specifier cell must be the module number (0x00-0x1ff),

0x17f

>        and thus identical to the second power domain specifier cell.
>      const: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
