Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCED517BD4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859542; cv=none; b=tbb6eskyq6W3GMhjhXTBXegrowCEdhtTK9h9CP30zf7QC8kNhJYsBvkDz2UBORmnvarH3ofAvo5Cm9upRO5yk3w9SztPYyVcIb1L/8OJVZw10o9h4lR1+A79CPBloYZeQxv/NAPCliMqK++ySrDqc7Re3AUYI5t9AJcqbttg8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859542; c=relaxed/simple;
	bh=dElApXNmnOgx2LivlVvzaqjoFojUK7t4I4aO8fOopz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvu7ikSZJw9ozgY+hPL+lGDZWotgkLQuPtSJ4Dj07SXgjYHeMZT1owx94k/kM1VEOge9BNzfs8VRbRCuOQBu8kSQNjXBfJ8ALxMcLj8Tc+9QH8aMDxmt2EST8SyP1FjnEtZ0zeprl2fqsDjKKMMhygzzkj8Uy4drIsV+WU+nwUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-783d429d0cfso3129910137.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859540; x=1789464340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uNDZ4Z9RQ9wXrVcNuo/xPMTuBK+T4DwJPmnnzMm2S6s=;
        b=sT65OWC/jEMLZires1lvhpmWNFFPgPZCiKu5+He2euCLjntpYL3lburAJRDPqdXA1c
         S/8XWmM2QO6K5q5OKXbU1PHcqYI1uwrVpNHVGQkFdouNfmPlGVGOZxUKt2XtIrZ5tEOP
         W7lu+bXSM2KZK4ib9xALmbFKQiYEyzOKGPW+ZHhMS/QrW8Mzc5RGwODAHHZKpM2Pzfc7
         3xbNXB7EI3LNpw8JrKSueb5/5MsqNqhD/3ACAVmEygLKJ6D28tic+Sqc/19CvWmczdqD
         scC0Ac+xE1fd2Aw/wG+ZYhqzeDdIguogOhkpuccRjEKLadyx5ion8Ze9/+sRKZ6pJPOU
         lzoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXyPrrXJoFmEW45KHUmiTd7RMwZGogi5ba7ZAfogi50cj1M6ReCHaW4NlRnLLuWa+umVVu03nVl1lq3EA=@vger.kernel.org
X-Gm-Message-State: AFuF++noWOICQIH2ZCUgAe1mn1XSQKc2KHDeLcP/WjFyW28wR8Yru9+L
	ZXFXmJXBz2f1AU2eSX6qzKjxErELFmo9oMbjNhZ2W56YJCv0fQBwsWk7aOUTFnPH
X-Gm-Gg: AYBFou0tRTfZybbR9FB0Cd++MYf233LuzWCBq/IVdco0uEvQcs1lsac0rBAAXseX0KZ
	WMW7oRxxa2li74IRYf9kM1vK6TFGCA6qivYUS92P7OPLcEyr59cgvC0QTUzkv4LA8Qvs/nb9HSz
	Pjl0HAfR90ba4FExiUXhrGY4NtQdS6k4Gvn70gZnbBzuT1PPbCQOCyh+aoQC9d6q5XX2y+iLbcD
	iFFyuddqD4bqJkBIR60QBVzD9+Bqm7e5O6e9k8GfoAlXByg720oXDQL35+iGhsKb7n9T8ywcoq9
	tRN/0SRw0Ypxejf/KBliHBPr6dwU1+ctpbYucidl2jl5ChryIUvSSF4TOgbd/xU7IU8Fx/JigUg
	o/NtyWs4ku1B/BZR8ePIRti12XKTVp+/CDL9OiHsJtVDhHkvk1aIg2Hnf9TfRfjaqES5PWTyw37
	elN3cbIadBQedg8Jnn7ScUEldDdLvprsfHV8pCGxy738jlMpaXNyajg0NXzuI5p61tww2Jlvr9F
	hgH4aCKI5bMUyqTvOo5adLOlw==
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id ada2fe7eead31-78a4a918bdfmr11549974137.3.1788859540350;
        Tue, 08 Sep 2026 02:25:40 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm8980955241.13.2026.09.08.02.25.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-783d429d0cfso3129895137.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxC+1zKp5aBWSV+3E4sjVD/LxOWfWQ++BsY7Ol9eVw64oBrlFuDKXcp48Hff4x2U6wH9GPicxywOBsbQ5c=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id
 ada2fe7eead31-78a4a90fdd3mr12719938137.2.1788859539059; Tue, 08 Sep 2026
 02:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:25:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
X-Gm-Features: AcwNN1USGKMY7TKVnAkjjakrGwhuoyRY6EMfvN47yRnI9dkrkdtdSzBeKR52XOc
Message-ID: <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

Thanks for your patch!

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> false leaving the pin in interrupt function instead of returning it to
> GPIO mode.

OK....

> Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> interrupt function after we're done using it as an IRQ.
>
> rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> previous PM value.
>
> Save the PM value before switching to Hi-Z, and restore it after the
> IRQ is freed.

Why is it a problem if the pin is in Hi-Z after the interrupt has been freed?
Isn't that the right state for an unused pin?

>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
>         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
>  }
>
> +static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +       u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +
> +       return field_get(PM_PIN_MASK(pin), reg);
> +}
> +
> +static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
> +{
> +       u16 reg;
> +
> +       guard(raw_spinlock_irqsave)(&pctrl->lock);
> +
> +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg &= ~PM_PIN_MASK(pin);
> +       reg |= (u16)pm << (pin * 2);

General remark: the need for this cast is one reason why function
parameters should use "unsigned int" instead of u8.  The other reason is
that the compiler may add code to mask the parameters to 8 bits,
depending on the CPU architecture.

> +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> +}
> +
>  static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
>                                       u8 port, u8 pin, bool en)
>  {
> @@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>         struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>         u8 port = RZT2H_PIN_ID_TO_PORT(child);
>         u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> -       u8 parent_irq;
> +       u8 parent_irq, irq_idx;
>
>         parent_irq = rzt2h_gpio_irq_map[child];
>         if (parent_irq < RZT2H_INTERRUPTS_START)
>                 return -EINVAL;
>
> -       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> -                            pctrl->used_irqs))
> +       irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
> +       if (test_and_set_bit(irq_idx, pctrl->used_irqs))
>                 return -EBUSY;
>
> +       /*
> +        * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
> +        * interrupt function, losing the previous PM value.
> +        * Save it so it can be restored when the IRQ is freed.
> +        */
> +       pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
> +
>         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);

If rzt2h_pinctrl_set_pfc_mode() would return the old PM value, you
could drop rzt2h_pin_read_pm(), and write:

    pctrl->saved_pm[irq_idx] = rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin,
                                                     PFC_FUNC_INTERRUPT);

>
>         *parent = parent_irq;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
