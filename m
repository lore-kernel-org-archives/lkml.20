Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843085335B8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175538; cv=none; b=nzZYdIhm1RWRyfu81UdyKg7LzmT5BPikgDDu0F7oeFl+k0i/M4sFvxtuRVvpZ5AwPuyb1l+MpUFileKpfeNzIDvzzLjnQR0P5ZrOBj2R/vVZ8il5PpolrFtPjbvlAlSa7hb1T6+B3apIYZm3QA003tYcZdrH9qELvSrjN47V68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175538; c=relaxed/simple;
	bh=AfFgK5O94TRbSz0v+n2agZrfGhkoCKVuFplQhBhnZO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cz0RtOHQNGtBQ+vF0L19/x//Hibrz9m+uaErNcTyuwASUiZHA1VFOX+vxyO8X+jL1xUHLXYkkVdLIdg8TVv8ZUUbp+nDfNQkmNsnhXyQhCnCDXwipSUh/5KBg9xvDUykhm8iUeB0YDh8uoBX40wDBAbpA3U3/HFUWDF/1MV22rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso1292088d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175533; x=1790780333;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTVINLgc5+4Z1oNwbQRG/rtTEB6pkVDW8ACRGjhrMlE=;
        b=hP/BxJ45TdowLH2RUH60gvPVisCx8Iw7YPM/7F0Vr0iBCF6TpltkqgLjR3eaxl04LY
         2pPqaILe/RtNwvOTQH3BYIGrO0vEgPMKiyXXvMTgqYR380Avprginb1d+wNUAnCmQycB
         gq3eJ5kNN+oniDIdrxWSHSkcCOZxotImuYXsfahGnPpXGFGOzh1Gpu0gtqK1Qv6Xp/HV
         2lhbe0Cz2hJJl5bd5XYda9mQ1OSMqb16qDuF9dFgIvuGZVlN+6j4NYKJLu7TJpZqZVRz
         1ZT7jm26fLZ54N7yZyZhgNF09wX1m8fm7uaGmkMpr4921zTm7H3j0tGOxT5JCd92ElSG
         J9Xg==
X-Forwarded-Encrypted: i=1; AKwUvBw/htj9a+CuJGhBago1Ec9ohZ3zHT7AOrE8U4kGO3fCTZu71PGuMaacyBjKJ7KTVF0SlrtO8elseYpGiNk=@vger.kernel.org
X-Gm-Message-State: AFuF++n+WgrXn8GMAQZ7dsb1dXqte7hJUOYlglS4nu2/9CtIEW6d6FoG
	3V3AjIPTsGxltHmhQPh+I7JnH3p9JceLx6FZ2b39BLfYSP6PkokIG1ProwGMGopu4hY=
X-Gm-Gg: AYBFou0HiRRmQTMSMyXmeFOpFgkvlib3CG4YRUCQX9TdI82C66HnMizadiCGyFGvbrE
	aUrq+JBvPfsplYTylw5Lnx3i7WaRuYUqhB3+qO6Yr7emedocZ3Ik0E/WIDPxs3Kbxfa2bewLvvL
	9pNB/8nMFjhWq1a47tRCBiqUXhNUGUxNRNnDi2NJK1FKBhAGH7WJ4u4LlEckgW2L0SpCfGnCQKZ
	mlFazLASOnzxGcxuz9XXpyXgbgWE8DwMuKFMaGfwzMHQAbBWlm0PGjWgs7w7Q8Bo6EOQsnowvSg
	Sg0jvwtIgJFZiMpKkBn0JFBSujjHaQKzuMM+yX+JwMZ2BDbHAldU+oZxeNauyVDFVJSkuV6Shit
	ibjxWsZV0PAUgIC1B+kHSgGuFQJEKOoujsUiZRKneNBMMfR0g1Yx9sDd6GaexsanHJweR1AoDSZ
	XL/o1W6xe1zOrQOcnTQgdmwMy07v4UvTvRTBWLpYP4dcWBCQUQnkPBPdNJhtMPaPRxft7jgc/X9
	xoSzioZmQYTgPDVrlIpat3NGkwj62PdVZhdGg==
X-Received: by 2002:a05:690e:1443:b0:66f:c1bc:4083 with SMTP id 956f58d0204a3-672d58aa47amr1414129d50.70.1790175532648;
        Wed, 23 Sep 2026 07:58:52 -0700 (PDT)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com. [74.125.224.140])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d8096559sm1048310d50.7.2026.09.23.07.58.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:58:52 -0700 (PDT)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20a33so1229745d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzo0VuE+7cHZfU0V9UqI2+xaog0udUod/W6NC6u/pXgVaYFJj61LFXDk9f7TwcBYhcfhV0ShyVIIwl+g8g=@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7ac1db33f0dmr2430482137.19.1790175126732; Wed, 23 Sep 2026
 07:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
X-Gm-Features: AclHuK-gsUhfafKUl3WYFPzbbNPmdS5PRweR7PwdMXMcSw8FWUkpxbAv7z94Jqg
Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 1x 100Mbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
>
> The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
> slightly reduced feature set.
>
> Descriptions for eMMC, microSD, and RS485 are shared with G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts

> +&eth0 {
> +       phy-handle = <&phy0>;
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       /*
> +        * ravb driver does not configure mac internal delays for RZ/G2L(C),
> +        * instead delays are added by the ADIN1200 phy driver.
> +        */
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;
> +               /* Level interrupts are typical for phy but not supported on rz/g2l gpios. */

Nit: "RZ/G2L" (in all patches)

> +               interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
