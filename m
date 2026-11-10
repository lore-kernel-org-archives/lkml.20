Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318460;
	b=UhQqiRCy6V08Dzr9ZcZ1uA3Y0kYwdBh24hEIBXB+cX3ve4y8dvyhTLCxsgWHrAIBcFx6
	 lflV3wbbSerWHOdKXciXmqm0pTKD16JB+u4Xtnj+y10SDpp/RAU2zQvQzi34wcqMlrUYD
	 h2AMVNoaHgLRrq9j9palMfObT7RwXKPqO4gBAMOhNGOvq4FxE8t/zwfw4syG34eQI4b3j
	 kF4yzjdGnHSrmxdoHWnmKh9w42767tfVzZxay/jaOcS3to+l9PYsbO2RClzvqYrNsz/2D
	 UAwR8jBKz06Xh39SCwMsaz2CJdR0NN4oYHjPWTYcptDNcOMuVIIn6wTLyADKnD8dpaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318460;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/zr6HB2j6XGAxPk3jcavQ57LeCRCQYxGbLMlTz4dBRY=;
	b=O1xzckOd3+ljWgIptwFWmG1MqUD1d1lmAZlvvG0B/YCONWd8VSdbRUcgzhfEyhmlumJO
	 yKhdVT3KBCw10mwiCS4iWnBFkLmdGrsnLLQ9plXJYp5XG1H+JUh5r1XPhVdULwfokeY6J
	 lZ8XFjlzxXhi3BsjjaOT3e26tf/aZEGYoODcqRNxGRO8pWody0YpwELvGIGcwt7YQ9pl4
	 Xp8gB1oXVAK2wIdM5SCR8AunUXKWGY8tM49aiCkYvMQnLKCspaU2NzgH57mWcRPpNYemw
	 jusE5HmP1lAZFT5+92IhuMP/QltXxtPVWs0ZOaqPjA5GA3mdC9kcUL7Oxgor1qfyVMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61478606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61478606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so1184629e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318459; x=1794923259;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zr6HB2j6XGAxPk3jcavQ57LeCRCQYxGbLMlTz4dBRY=;
        b=ochZAnZ3I8zcBK2cdiMv2BkUi256Lbc2yX9t3p+gIQPJNA6n/mKVtnfUP755tVVibR
         IehQLkAlQSEaivYaOnFAxb/ZR8Dgil734yqFVxvdcgFV9mDtI/WhfFxxGrwkhKEcr9p4
         RlcTcMGtgG24BtDJ9f3YKnAuz54rW4CjhIUS7CHEFvnh2un8BNd0r8itjxEjimmRAeNH
         syC50c3c/ZfVLoNt3w90hYsRMqCLKLUN4y45/SOl+cK70oPkS6D6JYsSnxWRGCRQvkyC
         qzjK+7rwJvM4VljHOtgR650xYuoLDOUqs/9iJO1DcUSYCl8vTFSmkUfVacb39MPG4N+M
         25/Q==
X-Forwarded-Encrypted: i=1; AL+hErHXaCAMfYdDvu9u+khMkfIM8HFZscTCCsxMimA3UB9vAit3mk3FAE/r5vDeZ+F2T2h3Rk2Q0e/qRxVHtUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CyOyhyOgF9Ieyx6wIy4yhmtiFhWKq/xcsaaDjl5pUWyBro9gE
	7ULM/uLXVcZ/Uyfw6P4GR4rAjof/smNiS9nE0XvzHpGQTnxnTlG5ifCqrhHh0SO28Ms=
X-Gm-Gg: AYBFou1Jx4Migkn/X1kHfMXPE5P4ceW4YXX9sHxI4cjFC1u0TNJQ+YJc1tRJK/Helxc
	hTWIjgx/ec+fBbdI6I9WoQgLsqDxg436CPiCLz60EvEnvGU8jhw5Tdz5H6tP//PTE45mzQEVs83
	y/cXs10T0sf6kNMf6PrqlEmBICE8irnunN8Q4Nwx/S7Nkgq87rIHuF3y5qzXTLTCRq5UYa7/L/W
	UjxoKjqGuMXTtTswhGQRn7E+1u3iIcGYPvbsPadbCc1pSXTdiAP+hAS+giHHsH7seV3HXgkz1sY
	sYum8V0E/xGde+YTd2rSw9MzMFcqbGhJhJ/Nrxc/I1RgwWV9kZYKOD80uIsm+fZcLTr0vZPcHKV
	LDVyCYFW/qRxOtrFu5tpaAaVstCmr1gj5EfaxaSIzLzAfs3XnWna0z5ZImrDxQzUjD6B83dZoaD
	nX1fr3AG+zKopP1r3aoKQrM6UKm3EjZ3sUSZSfZoUvEjFhCSX86kFQFfYihBQUYiXX2WD+f6Sps
	M1iLRAz81nxh2V1CG+GEsfOB9OtlZnTLWurRcuHye0alUTPoX5WpzofzVICDmU+SDx6KWEa1p2v
	UqbHHgnHrXdN880xFF8xp0CCJFG8Io3gekOmJL0Kncya879Sg1JKJlwb4mgtbd/Nm0w=
X-Received: by 2002:a05:6122:4211:b0:5ea:389c:51e4 with SMTP id 71dfb90a1353d-5ee0cf1899emr957804e0c.2.1794318459322;
        Tue, 10 Nov 2026 05:47:39 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5afeb2sm1766177e0c.9.2026.11.10.05.47.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:47:38 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso902399137.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHZZ+vucFoXZQCNYdPN7v9qVJjqPFssoRcrNKRdAqTchIGydkNd+D8QWEERC4cMQdi8SYQCuTogD0S8FkM=@vger.kernel.org
X-Received: by 2002:a05:6102:d90:b0:7d2:7c63:5a06 with SMTP id
 ada2fe7eead31-7d301bac8f5mr991679137.6.1794318457177; Tue, 10 Nov 2026
 05:47:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:47:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
X-Gm-Features: AclHuK914gRsTQ8u9qxzNcN_mT9zJAXVqPcP4tOWw_JxX2hXDz9ZvkW2czHkSw0
Message-ID: <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the RZN1 RTC driver as a module. It is used by the Renesas
> RZ/T2H and RZ/N2H SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=m
>  CONFIG_RTC_DRV_RENESAS_RTCA3=m
>  CONFIG_RTC_DRV_MACSMC=m
>  CONFIG_RTC_DRV_S32G=m
> +CONFIG_RTC_DRV_RZN1=m

I don't know what happened here, but this is not the right location to
add it? Moving between CONFIG_RTC_DRV_PL031=y and CONFIG_RTC_DRV_SUN6I=y
while applying.

>  CONFIG_DMADEVICES=y
>  CONFIG_APPLE_ADMAC=m
>  CONFIG_DMA_BCM2835=y

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
