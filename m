Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887936212E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174711; cv=none; b=CPH6eUS/LNYrl5pH+1QWk07LDWLnmXlIO0RU8bezpwuW1R5+Z8nmt2wqrAoob1cbsPZaPwgDYfqO2WtZ/v8BPdwFUpwRB0Uu/fnMSre3AJOgJlVYRNGpZnuvQNJyFEEsszhxsvnS0lGqWn5/ZKx8rg7UsuDfjdcis+ei25iqb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174711; c=relaxed/simple;
	bh=/U1MgBD6VoBqJ/8qiTtjqod/dz4JUJFqpqKojTxWot0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyOZyPXrlFfV6PPY+eha84nDhHdIYefSM+0ixLaplog30VNEcmOoCc0GZgtm6H0GHfUVcy8HZe2rKzzwfna5ntglT54yvZFrXG7z3saUFeU09Do7Ti3AjNOXYAMMaUju+XftH1b7BPGGNdM6GcAHzvu/iT5DB/mXO3dSeADHStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d882so1182324d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174709; x=1790779509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSSwLrH/CqP5v9Ad6ht8i1AuRmzB1BOZysjgQqfiEm0=;
        b=QF6O15R1uboAOx7kyeA3dxqKw7zUYkV8eQfwWerhZoARrrQxJ+WNpQFrmWr4MJEP8X
         B+prLlEXfCTUVC9hyOBzrdavCX7BunShXrdXAI08O9kBY9lohx38wIQ/3dtK7+oYs7s8
         KhxuZiabrYwD5vuKeOcFl+LEP9TXt3x4pFaZEFVvXpNCOmv7BMR3Fw5WTvt+Pup7nxGa
         kt6OirVD4KsF9RsAUl5tvjQroxBCh6pv1d24Wu3sHGO4gYUjfzrtpmbJWd3q/xkf1nxR
         hkRM6bDzPoSTcrW1e7CPIIp/1ajGVFZFttzp7mg7Z88Q0ifxoY6HZhsRG7qszQ1Mq5Hp
         r2rw==
X-Forwarded-Encrypted: i=1; AKwUvByIHBvLs48ZKmbPkyzFdG/zD3bVJQSBRGIQIgP8iYPLA5W3LT1feB45BNlobj4XZYKlQuSFXfcalVt1POU=@vger.kernel.org
X-Gm-Message-State: AFuF++kMDzjAt6Z2hUzwagtd2oLGxBUiwN0jU9Bzq48Ws2vFg4S0OBTT
	F/ykXVYQJ5LIFah65dsv5QcRPU6RPnT1rMj81HUAcpeAuxwAHRJystDcO1vRYh7q0MU=
X-Gm-Gg: AYBFou0u9FXS4+Z7vGusHgsy4+hArtPGpNgjsoWNghI6WrGnIoODOKu4VwWE8jifwLL
	vlfL4G6u1dyVp8QerOfAGxnAJjDzWFEf9KE7XTgKaOuHETmHpdm/6Sl/iUZy38N5/b2Q+Cxdy1F
	aaFSr4/DiGb9EahwnPL/qrnfc+B6T2QdwLOyMjP3Z9G55GWDM5cWaCgTBQ41AqK4tlcBCgZFAeS
	g5+APXpsbill3mzg4lgVVDPNYY2xt/06HnXdbidv5vB10SOv8e2Q8cikS4ftHCaTdHxEVmlahg7
	Plg1AMcXUMCeL/QBGM9IDwYpLm2CB3nJ/+GSxnz+N5tmuoQhaxgfqxVHeEswD5i5Eh+Rv0Q+BH+
	NPAfcXN1Zm26aES4idRr2C2niTq41T5LMl7QxMVhHyNzviim0IKY/wgZ4eCeWXyxzE68WG1OfFB
	uWnkT4Swgu9fNn62YlbpF59I10NzcqhUhsCPsF1yq1Y28zzZ4OGpIrblvmapjCijbxeyHck7ZkX
	Ab0XU5sVuRL2iSt5xzOv5daNbksgR/1z1y9+B1aGgyohvK0ZUkGBgVGJxk=
X-Received: by 2002:a05:690e:4393:b0:672:bc9c:6e88 with SMTP id 956f58d0204a3-672d575a0f3mr1384895d50.16.1790174709165;
        Wed, 23 Sep 2026 07:45:09 -0700 (PDT)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com. [74.125.224.171])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d9089322sm979724d50.21.2026.09.23.07.45.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:45:09 -0700 (PDT)
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac608dso12723667b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUWuFZCYLjkN+ufD/zZkbI5wG9y9lJTMIyJivtqzMtg5Ug+7d9gL8D+sTeQPU/1gbY+8vWG5WwKAZgTyY=@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:7a7:198a:c2bd with SMTP id
 ada2fe7eead31-7ac1da2015fmr2739749137.37.1790174262272; Wed, 23 Sep 2026
 07:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:37:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
X-Gm-Features: AclHuK-Y4yRPc5ygPTDjA1xgXgYnA6hz3s-S6a8gc_ggzPpYCTe_qr4a-TZ4I5w
Message-ID: <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
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
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi

> +       aliases {
> +               gpio1 = &tca6408_u48;
> +               gpio2 = &tca6408_u37;
> +               gpio3 = &tca6416_u20;
> +               gpio4 = &tca6416_u21;

The TCA64xx driver does not seem to support gpio aliases, so please
drop these.

> +               i2c3 = &i2c_exp;
> +               i2c4 = &i2c_csi;
> +               i2c5 = &i2c_dsi;
> +               i2c6 = &i2c_lvds;
> +               rtc0 = &carrier_rtc;
> +               rtc1 = &pmic;
> +               serial3 = &scif3;
> +       };

> +       v_1_2: regulator-1-2 {

Preferred node name is "regulator-1v2"...

> +               compatible = "regulator-fixed";
> +               regulator-name = "1v2";
> +               regulator-max-microvolt = <1200000>;
> +               regulator-min-microvolt = <1200000>;
> +       };
> +
> +       v_3_3: regulator-3-3 {

... "regulator-3v3".

> +               compatible = "regulator-fixed";
> +               regulator-name = "3v3";
> +               regulator-max-microvolt = <3300000>;
> +               regulator-min-microvolt = <3300000>;
> +       };

> +&i2c0 {
> +       /* highest i2c clock supported by all peripherals is 400kHz */

We have a DT propery for that ;-)

    clock-frequency = <400000>;

Same for i2c1.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2L Solidrun SoM
> + *
> + * Copyright 2023 SolidRun Ltd.
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/ {
> +       aliases {
> +               ethernet0 = &eth0;
> +               ethernet1 = &eth1;
> +               gpio0 = &pinctrl;

The pin control driver does not support gpio aliases, so please
drop this.

> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c3;
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi1;
> +               rtc0 = &pmic;
> +               serial0 = &scif0;
> +               serial1 = &scif1;
> +               serial2 = &scif2;
> +       };

I didn't compare with the board schematics, but the rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
