Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00634CE66A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281728; cv=pass; b=FE7BAoarNNYkZD9e9Ua6taVidw/pUE7oH39JlgZ2E0yt4ONYZ5e/rWe4NyZHn6yUv5BcSV+qK4J9rfg44p6rvsanlDjgcKe8Oh3iP61SKkKpOjbyjav6r3V1VAShGqMkkA2tH7h6Yy83Lkhptw2WrRWBdlWUfshN7Pp1m/RZwcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281728; c=relaxed/simple;
	bh=UT6B7fQqEA2MSrKMZ61V+BMSHD5XKFXt3wagV488uAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSK5UDxfj8pbJkA7iT8X5zSFnExfoBUPCBNhklI9y4lpA3dr7kowVT6kxVzVAf7XiL8xl5qg/ZU6UgMrLni8BbUNCEsBAF9y/Gb/8CzVF0Gr5jgdr6AWv0okoTKs2gVEjJwXFwDVufVOaAdj7LbJYzxpX5dZSp+vfDGSZxeZsD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnSKJ9y9; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnSKJ9y9"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so105101a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281719; cv=none;
        d=google.com; s=arc-20260327;
        b=PUPt+adN25n8LyF0fMiGuVO2UNjUN7RGgseauseWLLHWB5Kh8OH4UUGiKsnPFdDDYX
         Fs2IPQ8ShyA0Mn2Nt29i8XAhmxEQQV9eaYnooTOZjtQRvetHzcdgkg5oaIuAek/u/Rfc
         rxX3Mv8q1xBD+HUik0XpAU1Laq4osUolS9UDT+mNtIwnHk5YkXOmNznn2VvfyYI0f19l
         Fap49Fl3y8VgZ5WtScT4bD1K7ikFohpkQVIZjWhXtfxfqAK3SP+quYdvyL45zt58Ew96
         peFT42N0KTasUUyf8pDoTQk5IUApc6wrYjw/f+JzRC39ZWWXzREV4SYfdByzjP2XNLkd
         rq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        fh=bOFsN5YAiyyNABt50d/HazpjNmUbGZQ98xJO7VkH094=;
        b=Vlc039PmDlhLcTaFSMEwcNX/QEpmKk5zz0fK7tUhRXFBCZ+2B/q9zi6zRoFzI7pK+z
         Wvq/DZB+yamaG5MO/ZgvFUVYAgBc1ODiF50AyD0foMqRS0ledQXPc3X4IlepgViVii13
         oP37PA5FTZ9pXwsCEI4AHHXTYK22XJ0HyABF8zbueD/dCMpwmPD8d9hoCFYrVGcz38/T
         X2bg4RjQqJIn84d8fceBuO6Se+4W0CIavibwHNFXrB3MXpBml1tW0Nov1eEBENNV0h/u
         nkpj+bTw/UgnkS5TFNkd8/2vg3jGBiV+i31pHyTeimiPQG05auA20VEEkrvjGY9qLD4m
         EEUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281719; x=1790886519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        b=NnSKJ9y9+0Q2pMKxD0CIKv1T4omTjvufGXXKGJrlojvRw/EJdi9qwL2qB5059e86zd
         CD/QHjDZmfhMwZ0dPcCwa7qoiy7uN55dsMuAYp1zQVt/w0qSP2Z6/TFiNes2P5fR5waq
         aQTgXExFsZJE9uXU8M4cmOW7Rsfn0kpSO5vWnDRAZ1auidF6n7KcmPAuiXTk6eKF5+jK
         7VQkle4BrSx/TNdL9M25yP2Ap4FZV9LHGG17LTG2tCVqqAIxEgKEqo3hVIxSS7XJWRaf
         LIggEcIBXfrbybbnWjXCRhhX8G3dZXLb15E+J0cyeZtvC5NhoT+ejIDiDozJraXtR0Nw
         eEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281719; x=1790886519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        b=NEe8eHOtYamieefFPvc3Ae3lUoAL/iPk1dD9E8OBQhvtpxN0yOfuRU6n0zrr76pWyT
         hhvcgKx0WHIAbeH8xyLwFsOHe8v7BHHqnJz3vfxjuViULb2rM5BeXpmUTROgJ5hUnCQp
         APaUIXa7Xhn+Uncp4dIt2e5nNSy0tbJ1bcNarFwHoCYohimx3jpLJ26kk92/YmQzT3QK
         tehrDVHmgQheMKxRbKT9UI8AkLo6vj17oIebsACKY0bQye9QSC4vMvxPDHs1VGwTUVKL
         Q/kNj1MJ6dcp1cesk4fHG8NLUCKC85ytzfcQW7ust4HHFKzJMIBH62Ef4STkAvq2yfnU
         1K6A==
X-Forwarded-Encrypted: i=1; AKwUvBypBQ+J7AqaFrr+csY/AmyW86TbpfyH4rc772VnDAuniu8EG4AiNexOgAZ3VwvJ0YJ5aSOdQiaTRB8oajg=@vger.kernel.org
X-Gm-Message-State: AFuF++nP3XjAt0R8l3wtAYjzVHQ8WaNTHxfolr0/aks0qH24skCpi/OY
	Mb4r92ZCZCM41p7/U3HK9uFTxc/L35+VuUNDXCgyDK2bm1vQg+TUPS+fuldfVQhVMSQwxS0sbQq
	4Z6aFkbfziRGAuL/p7+ueIDFyHxs1VUU=
X-Gm-Gg: AYBFou0KaViPUVd5SDq3Rst8o5Rtt0STs0H+V5dnSANxJOrud99+meKzQHd7WlVYsJF
	5TYeRfNn/GLHqaOL+3Ovs9HFnliE/WWonIwxbwlOEXJ7aL81eBEYn0wuWNmtIRKbCjjTPgRxt5M
	9y+VUt1DgHYmAvEkHISeU6OABJtzc1kqi4WEnWBUA4m3qrw7jsICuat3J0dFPEEWL6u7LFzIr/H
	Ld/v0jUwxtBcPluXQtQ0d8Kbuw4PHmRXSfKmqCmpaGqOrbAiuzoEG5zr2AmMl9Wu8+yu82vjq0p
	e/wT8xVI06LLvtq2yZb+8hXTqc0AWAat0bqsZe0fTM8GyEgSSlC2cnhC+uBcU1EapUoEL5U=
X-Received: by 2002:a17:90b:278c:b0:39e:6c69:9b99 with SMTP id
 98e67ed59e1d1-3a09929065emr2849572a91.62.1790281718782; Thu, 24 Sep 2026
 13:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-4-pmazzini@gmail.com>
 <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
In-Reply-To: <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:28:04 +0100
X-Gm-Features: AclHuK9G_SI3GgoHa0qCbnDKntKtoSmhBOxRgleKzxhUuFOnUyM7ko1rjVVmtJc
Message-ID: <CAAxh=jtj7m=0chzXG1osVy0ftHys9mwf9S62kz1Oimgm3rsCUg@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> look at pinctrl-sun55i-a523.c for an example

Thanks for the pointer - much nicer. Converted for v2.

> Can you put it into our wiki

The page already has the table and it matches the BSP exactly.

Thanks,
Pablo

On Thu, Sep 24, 2026 at 10:17=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi,
>
> many thanks for going through the task of creating this table - though I
> think you wouldn't need to do this anymore, since we now have another
> way of describing pins, which avoids this lenghty table in the driver:
> look at pinctrl-sun55i-a523.c for an example.
>
> This would allow the "driver" to be a mere high level description, and
> leave the mux values to the DT.
>
> That being said: it's good to have that info, for the lack of a manual.
> Can you by any chance try to make a table out of it and put it into our
> wiki (https://linux-sunxi.org/B288)? That would then be the replacement
> for the manual. Maybe write a small tool to convert this data struct
> into Wiki table format.
>
> Some general things inline ...
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > 78 pins across ports B, C, D, F and G. PH0 is BSP FPGA-only and omitted=
.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   drivers/pinctrl/sunxi/Kconfig              |  10 +
> >   drivers/pinctrl/sunxi/Makefile             |   1 +
> >   drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 623 ++++++++++++++++++++=
+
> >   3 files changed, 634 insertions(+)
> >   create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> >
> > diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kcon=
fig
> > index dc62eba96348..a08186133090 100644
> > --- a/drivers/pinctrl/sunxi/Kconfig
> > +++ b/drivers/pinctrl/sunxi/Kconfig
> > @@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
> >       default MACH_SUN8I
> >       select PINCTRL_SUNXI
> >
> > +config PINCTRL_SUN8I_B288
> > +     bool "Support for the Allwinner B288 PIO"
> > +     default MACH_SUN8I
> > +     select PINCTRL_SUNXI
> > +     help
> > +       Say Y here to enable pin controller and GPIO support for the
> > +       Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
> > +       as the PocketBook Verse. This covers ports B, C, D, F and G,
> > +       including the four banks of external interrupt capable pins.
> > +
> >   config PINCTRL_SUN8I_H3
> >       bool "Support for the Allwinner H3 PIO"
> >       default MACH_SUN8I
> > diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Mak=
efile
> > index 951b3f1e4b4f..5129c0f19f3e 100644
> > --- a/drivers/pinctrl/sunxi/Makefile
> > +++ b/drivers/pinctrl/sunxi/Makefile
> > @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)   +=3D pinctrl-sun5=
0i-a100.o
> >   obj-$(CONFIG_PINCTRL_SUN50I_A100_R) +=3D pinctrl-sun50i-a100-r.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_A83T)    +=3D pinctrl-sun8i-a83t.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)  +=3D pinctrl-sun8i-a83t-r.o
> > +obj-$(CONFIG_PINCTRL_SUN8I_B288)     +=3D pinctrl-sun8i-b288.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_H3)              +=3D pinctrl-sun8i-h3.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_H3_R)    +=3D pinctrl-sun8i-h3-r.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_V3S)             +=3D pinctrl-sun8i-v3s.o
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinct=
rl/sunxi/pinctrl-sun8i-b288.c
> > new file mode 100644
> > index 000000000000..ffd7eef68d19
> > --- /dev/null
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> > @@ -0,0 +1,623 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
> > + *
> > + * Derived from Allwinner's BSP driver pinctrl-sun8iw10p1.c, which is:
> > + * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
> > + *
> > + * Based on pinctrl-sun8i-a23.c, which is:
> > + * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
> > + * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +
> > +#include "pinctrl-sunxi.h"
> > +
> > +static const struct sunxi_desc_pin sun8i_b288_pins[] =3D {
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x5, "vdevice"),
>
> What's vdevice? I don't think we used to describe those weird functions.
>
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
>
> I know Allwinner does this, but we do not describe the HighZ mux, it's
> all 1's anyway, and the same for all pins.
>
> Those comments are probably irrelevant if you go with the new pinctrl
> driver style. Most of the settings there should be straightforward to
> figure out, just remember to add an IRQ map, to account for the missing
> interrupts on PortC.
>
> Cheers,
> Andre
>
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x4, "spdif0"),
> > +               SUNXI_FUNCTION(0x5, "vdevice"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart0"),
> > +               SUNXI_FUNCTION(0x3, "pwm0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart0"),
> > +               SUNXI_FUNCTION(0x3, "pwm1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spi1"),
> > +               SUNXI_FUNCTION(0x3, "uart4"),
> > +               SUNXI_FUNCTION(0x4, "pwm2"),
> > +               SUNXI_FUNCTION(0x5, "wifi_uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spi1"),
> > +               SUNXI_FUNCTION(0x3, "uart4"),
> > +               SUNXI_FUNCTION(0x4, "pwm3"),
> > +               SUNXI_FUNCTION(0x5, "wifi_uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x4, "pwm4"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x4, "pwm5"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 15),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x3, "ac0"),
> > +               SUNXI_FUNCTION(0x4, "twi1"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 16),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x3, "ac0"),
> > +               SUNXI_FUNCTION(0x4, "twi1"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),
> > +     /*Hole*/
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 17)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 18)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 19)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 20)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 21)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 22),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 22)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 23),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 23)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 24),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 24)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 25),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 25)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 26),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 26)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 27),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 27)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 28),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 28)),
> > +
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),
> > +
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm6"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm7"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi1"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi1"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi2"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi2"),
> > +               SUNXI_FUNCTION(0x4, "ac0"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x4, "bist_result0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x4, "bist_result1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spdif0"),
> > +               SUNXI_FUNCTION(0x4, "pll_lock_dbg"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 11)),
> > +
> > +};
> > +
> > +static const struct sunxi_pinctrl_desc sun8i_b288_pinctrl_data =3D {
> > +     .pins =3D sun8i_b288_pins,
> > +     .npins =3D ARRAY_SIZE(sun8i_b288_pins),
> > +     .irq_banks =3D 4,
> > +};
> > +
> > +static int sun8i_b288_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +     return sunxi_pinctrl_init(pdev,
> > +                               &sun8i_b288_pinctrl_data);
> > +}
> > +
> > +static const struct of_device_id sun8i_b288_pinctrl_match[] =3D {
> > +     { .compatible =3D "allwinner,sun8i-b288-pinctrl", },
> > +     {}
> > +};
> > +
> > +static struct platform_driver sun8i_b288_pinctrl_driver =3D {
> > +     .probe  =3D sun8i_b288_pinctrl_probe,
> > +     .driver =3D {
> > +             .name           =3D "sun8i-b288-pinctrl",
> > +             .of_match_table =3D sun8i_b288_pinctrl_match,
> > +     },
> > +};
> > +builtin_platform_driver(sun8i_b288_pinctrl_driver);
>
