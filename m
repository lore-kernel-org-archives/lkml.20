Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03674EA365
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861386; cv=none; b=UZZ3im8y+W6N+tEJOZd4duQo/11U9r6kBs8CnQrw/VRQ2o+0s6dIWgOXGJY9k924U7SMeELM3Cp7jFp7WZmrXDjRfEeVl/+I+dgzCoawgQM++OUokjJHY92AbCbnFyvvcuw1w1XKwFH3yAk0XtboGcAcb96fHgONALudbtaL6tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861386; c=relaxed/simple;
	bh=NXZNmgvu0XequOW0h/JSVE4Z5uMg/YTzszCCImTyPlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ko7QcKUetIGBFq4l99D7p0k/O2U0TFLlG+E41pqXDhGT7HVWEt4dWRyCqqzeWKzmFnUASe/fxLuBGh5i5i++giP+VwgTpAkVVD/P5wxYB+hBE1mTA8Ncz4uOxD7YZsCzcWeYjys3Gv/xhHeSc9puvYjIRwbWklR+zE6D3ZcrVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-782df51b4c1so3266259137.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861384; x=1789466184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Frf4CDKY0g6g3QawhbxdAbsjmWIQZS7SHxphY7Ve0uc=;
        b=iq9N7K6YvWfs1FER4roKTwCzVDm9m5KLCIpTGaC+2/YQxz5kXiKP2LVHNz9bp7Bmha
         a1in6jBtL7mADSpDW0PkGIVPF4g42Kw5jdNDYi+/U9JwnRKpT75zBeLnGm+F3LQZkFoO
         /gToxyrJeEgmjMM+NhFeQuGZkZsyXzvKDVnFVwFFtJD7V/+r+f6R8lWoXTaKYxs2ZkoY
         x+ZDl/f9yGps60UWYxZdm2P+RwiirrzbGYY2eulGhxtOYPN2foz2NYsF3PrbJk51qW/z
         qVrfBdlitKGYnn/31gWV7R84Dd14u9WwneDDZ1XQBWq3YMhXeFHW5O+P4+v/MdaJk+yQ
         zoOg==
X-Forwarded-Encrypted: i=1; AKwUvByr9V4Q8LdbPqcdHduBKZNRhZmp7FeJXwLUMPwE121YctAONEkcRa6T5WI6tyviPrem6sW2PKNfKakn28I=@vger.kernel.org
X-Gm-Message-State: AFuF++kBKG/2I5bLbMF9Bb40IM21umRliTtU5/uvO9jgUfpsFw4i8yaQ
	ahJTQFcOJ0JetK1XWuNxmldPkvIgdIBjysC1Q2Vntw4i1NsNKtlneSZPRO9DqrUI
X-Gm-Gg: AYBFou0BoZDkwcc9H5YTQP199T1P+6D9XvYioQp9YRtEdNCCJtk5H527PeeJPGPFYY4
	rtin/pgVUf18o3oefT5u1yQS5O9OYwX7CgeytTxZcCbE3I8vWmi4QT1ZH5qv8nnT/P7sKimgDuc
	FihdgDkjC0aoczlReDCXEEWyZIY23O3VYxQm57kgbmmnXS1612EoLPhLf6kp8hDkUs1EpPyC/FT
	PV3Beh4wrCObBWEhMx3BC06Vs5FsNjQwtYjQBvXvaRON8oK/TvzCoIgars+xFpcg7MWmkbruWW2
	KKVtlbSfnHKph2pxh2H8j5NzpnsOIBEad/HmEuue/oM9x/CH/qCjcaQNEwuHwhKcnERKaRKwh9J
	yWfM4PraESAfxKemY+ppm5nXpNlD6T/s711HMKEkkxO0MxuF5w1i+ildUuajKa4+kCUZO7lcpVZ
	hECEVei9RzxfBk5qREznJ5z7RNoMwUOZdC9RztiOvOz6b1s1q16zjmhhLCxBAD3qs4v3sK0zi0a
	Z4jQGCC+D5nMHXUw1OjSe3yXiGzhRv9K5dc
X-Received: by 2002:a05:6102:a4f:b0:789:3bbf:2dd7 with SMTP id ada2fe7eead31-78a4a4d00a7mr12648322137.0.1788861383771;
        Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98280a3aeb3sm1008978241.12.2026.09.08.02.56.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-746d77537f8so2623143137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwkLvc0K+6djAD1KMrxEN1gLl49mJkjcFZxEZ63OnUsd9+cmmCshXoYh2LKOO5TQOI+iPfyU7sJSotjbnk=@vger.kernel.org
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id
 ada2fe7eead31-78a4a72eac3mr12923163137.3.1788861383206; Tue, 08 Sep 2026
 02:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:56:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
X-Gm-Features: AcwNN1V3nOK0dJ3UvwLd7mgfKmiEg244M-OC0mkyJDzXDnUsNESnG0OLJvnPvSU
Message-ID: <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
>
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
>
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
>
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
>
> Report the input level even when the pin is used as an IRQ.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -171,6 +171,23 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
>         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
>  }
>
> +static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
> +{
> +       return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
> +}
> +
> +static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +       u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +
> +       return field_get(PFC_PIN_MASK(pin), reg64);
> +}
> +
> +static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
> +{
> +       return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
> +}
> +
>  static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
>  {
>         u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> @@ -847,6 +864,13 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
>         u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
>         u16 reg;
>
> +       if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
> +               if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)

Section 17.4.5 ("PINm : Port m Input Register (m = 00 to 35)") states:

   "The PINm register is valid not only for general I/O mode (PMCn = 0b)
    but also when peripheral function is selected (PMCn = 1b) and it works
    as input."

this is not limited to PFC_FUNC_INTERRUPT, so I think you can drop
this check?

> +                       return rzt2h_pin_read_input(pctrl, port, bit);
> +
> +               return -EINVAL;
> +       }
> +
>         reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
>         reg = (reg >> (bit * 2)) & PM_MASK;
>         if (reg & PM_INPUT)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
