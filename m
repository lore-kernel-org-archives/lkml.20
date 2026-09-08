Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A155C1B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873931; cv=none; b=BYX/tKc0yvnxGPtnghkGZKeDYT9ELAROuXC73PyMCl7n/yqyYsbMlVWmzWybTh4j32xSGl8uKHUOL3N7kdWDGW2ElTWhmq4/ezpp4tMXykizRzTMoLWW3s6Z/q9MsEM/13n9GcMItEw2ZWHh56fTaQHucO6vv3kpnWFyIsYuCsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873931; c=relaxed/simple;
	bh=f0mYgq709TFCq8csPg+JrqYq4OhaJnj3V0e2EFq9Hko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCq3ftmH0X0MLcqnL8ZXWnb4nB/2x9ZFp2yvBxcrm27JXy2vySUwLMJ2uCpxryYUKQqGJeR2UmeYB6jQbEEKNj83qXXBuj5c+OW09PiVinN/2iim4QIZmf6TvleJiQ/NGFl6jJb0lDi5PRh9PmB21Ph2Xv2cCDxDtPL9jFpeGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1533449137.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873919; x=1789478719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+pD3ZYpu7WIufaA0yFsTdMjQPCG+yEiYTTg9rhn0Xuk=;
        b=GRwZNMySezuiakAFgHxNYqJDlZGf8G80y08qhwSkL31L8Qmu0uyYaSOVgNDMN3cpRR
         O8uqozZh/ItK9XgvXhx+dbb+QdMRATvCRbQi1AXgfDc065UDUoB7mUQW3TS21LzYuQ04
         5wpdFgEp1VMQyTCcz9i28u0AwWrt8k/TBsCmz6AhABKq6ia2MsYE4h+QRmPBGmwL0Tp3
         RCYEFdwKwumzfCq+4dsUSEgqkSPSafMyamg4sGDg1Jx5Z6oWIG27lEQXmRFoJvkpIsBg
         gchQDYgb3rv0NomsNTFcunBobBPMZUrQwetXolYpTxdo/HN1Qwwi7d5iEhcifA5t6uIC
         1V/Q==
X-Forwarded-Encrypted: i=1; AKwUvByf0m38xkLXo6sNEaC575GdXoaJizIvE1mZ1YZouv4hxVvmee0NXfPMW5o0djpN3vkR8jk8uHIalws+dFs=@vger.kernel.org
X-Gm-Message-State: AFuF++lRqbS3Ku/Ndhq3W4z8hKs9PEdFuSlZ9q5CHDb4gCz/pPOotK6U
	v8r02nrZ8sDYntXPidmsWv7NREL3+q54HqukqSxZshDktEaAKVIhg0eq7gv7xhs/
X-Gm-Gg: AYBFou1+hFWwjKPbagfXWmsva066iFmMnwPic/ymgN9pvhkQcHWoi+CiTeNfz1rhqYG
	n5fHc6dzXxrydOamJAQcM9nDG29iPo7AozCCYnUs5/Jme6JYF/+symGGokQeo+Z+X0uLMn1YFz1
	vNWBIs/1G9v/1aDVD2XkCTzULZHmcgMk01CyGA36kT/FxJciSe8W0LFxFgO0RNwiNmHT12v+97d
	V850BV8Z2rLv+D91xxrcY44ERd10xhD453aeQGZSZSBb/dtsIvpCi1g6gv8wVunPoRHC05WC/Rf
	TY1UVDVYditw50mEIKjNBjpeBbuSW410yn1sTRFShlf8P5yaUrMCOW5NRotpd9nDJkA2VW+Ra9d
	PyoLWoDOnz0FCYkJeHMuYndyvxclH6e9h7Fm+PNzCQtENMJpvqD7OnsA6gd3s+75+QH/93xThgH
	DGYVbyKSkFir5Msa2P9ydx81cnqI4STeNRsYUewNX4qgKCtD2NUYjrGl5Xd3gvnfs2Gz2jQ8Iij
	HRDhCSmfQWhhY0CJg4iXVcyxQ==
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr10463705137.1.1788873918092;
        Tue, 08 Sep 2026 06:25:18 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm8723777137.1.2026.09.08.06.25.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:25:17 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-754ac74c495so1477066137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVT18qnI0C/GvTuxHrh3cN6qMKkBaLiJFNn8f2zNUQmbpUfgbK0XlXXL17upjthqfSGclPpdZ8V9kXa1Y=@vger.kernel.org
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-78a4a6d4adfmr10265477137.2.1788873917561; Tue, 08 Sep 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
X-Gm-Features: AcwNN1WhYdmJJQf86GwJ_V-yVMFnAkWuQK8aLWwP6w9JLx712fQ14_b7YbLUDoA
Message-ID: <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
> RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
> Analog Devices ADV7535 HDMI transmitter.
>
> The overlay enables the DSI controller with a 4-lane data path and the
> display unit (DU/LCDC), and configures the ADV7535 on I2C2.
>
> Update the Makefile to build the overlay as both a standalone .dtbo and
> a composite .dtb (base DTB + overlay).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0

Any chance this can be "(GPL-2.0-only OR BSD-2-Clause)", like all
already existing arch/arm64/boot/dts/renesas/r9a08g046* files
(and arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi)?


> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
> + * connected to DSI and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
> +
> +&{/} {
> +       osc1: cec-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <12000000>;
> +       };
> +
> +       dsi-to-hdmi-out {
> +               compatible = "hdmi-connector";
> +               type = "d";

No ddc-i2c-bus?

> +
> +               port {
> +                       dsi_to_hdmi_con_out: endpoint {
> +                               remote-endpoint = <&adv7535_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi {
> +       status = "okay";
> +
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@1 {
> +                       reg = <1>;
> +                       dsi_out: endpoint {
> +                               data-lanes = <1 2 3 4>;
> +                               remote-endpoint = <&adv7535_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       adv7535: hdmi@3d {
> +               compatible = "adi,adv7535";
> +               reg = <0x3d>;
> +
> +               interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
> +               clocks = <&osc1>;
> +               clock-names = "cec";
> +               avdd-supply = <&reg_1p8v>;
> +               dvdd-supply = <&reg_1p8v>;
> +               pvdd-supply = <&reg_1p8v>;
> +               a2vdd-supply = <&reg_1p8v>;
> +               v3p3-supply = <&reg_3p3v>;
> +               v1p2-supply = <&reg_1p8v>;
> +
> +               adi,dsi-lanes = <4>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               adv7535_in: endpoint {
> +                                       remote-endpoint = <&dsi_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               adv7535_out: endpoint {
> +                                       remote-endpoint = <&dsi_to_hdmi_con_out>;
> +                               };
> +                       };

No audio?

> +               };
> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
