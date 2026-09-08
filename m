Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E751D52F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860456; cv=none; b=Qoli98nGkgbh3P1COJv92lWOb2UPa7QLMcw6o3zaEl9qJGVPLqyQ4je6zJC1QzKIfRpOojXA5DvxV4kbcJhK6hnWdpH7BjkxV4egw+uzxj3XMBflG5QP4jiJrwpbr8mWuQ61ysfIJ5hdaiszbCJIs1weO0l6in70ZYKXV0PaqIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860456; c=relaxed/simple;
	bh=NAEH1LGodnG1P0/a4VARquMQLIVHTsxhk69mCU/AOnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqNcR0y1MhM3LzWg3NFlrgE/mt6bLME8BxW5mSjdavc/b6WIQz9VZVoBCKk/GK4rbqvHa7714XRjPMCn9tcI/VmYV1s9nz0SqGjspK1uxHHQlfL3f4/yXHhRYY8HtUZp0T+qtGDUt4jOX+7dVAUsPAj+6zb/2rorNIFHSx9h5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c652293bcdso4874390e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860453; x=1789465253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PIOsCtPZXn0hdSTkUCaDFtOzu6+1hWf4W/ZSKS9qN6s=;
        b=QtJE5QrwJaEpvMdyMWpzgB9JUy86l7XApOKJ4DdRwndyXcrEDAVZMfU4uAO0dWjrv5
         yFV+VeuTVJZqIp8uqLbnfIKlZYU+4S/TSsyCA6PiDiYxeuws6H3PF1Dz2z2f8SzENgh9
         TRZBSXb2X6W3lJ6vkeO344sX26I5xe9HAvG1FnFmo3nnZzJlTLIXqUcqdTHwmuloCeZ2
         zjWf5xqoeGWxYOjBU6qTqEbt4of1DDwhHZY3MzEogyoN6ICBLFovXHLvJEFlBTqfFTIB
         60wL8B7Gc2b7dYhvLKe5fMcmCeJSlsc4KVCfHOPVS5dbf9zDMYZ/uifVlsMpK9pNOzBp
         HjZA==
X-Forwarded-Encrypted: i=1; AKwUvBzsFQwamRwYn5g4ofWGSM1dxI2LAC6fJyWZxp5S7HW6aPE5ueccZDt+x1DyEZqZhc+qPYkUQTjxr2pWUQk=@vger.kernel.org
X-Gm-Message-State: AFuF++locBMjidXKcG7xoHJZxKXuBH47iy9uKYftgp5ioHujNbKZll5m
	+6yTMONhAteJuiJpr6FhcEFQ9yc/6dAtAO5UU585yOz9aXGtjNKxoeYMTq8NYMG5
X-Gm-Gg: AYBFou2K6pSooTIUF3eqR9hKASlDmgZIGDhGztNiNXN4BI+5JZA3MU3WVmyf4yQi8YQ
	gsnXFPVTnC2z+G7vc8RrOAT8KkQOglwa7wbAS48Ar/SJ80kAPWHshGSoHy4dzaKmDmk9Fkrz0P6
	tux1BZ8mwHla0KUDxvGv1i8FA0hnqSPRUFpKYoUPipLAjjmXq9qOqKXDkRZcaOOoqvHNqf3CF6d
	nmohmdp5Oa0p+VO8samQ1agq/+6BxzlQnwn3HoB2JkdjxsBucZZA45hRF/3+AhgkneEf1jmold8
	IlkQf3z20XEZthzHnu1lDqfo3zyzQBBCb/+4WSwO6C+KCtHqCEShWKUxPlldaUHpax72RbtvzGA
	P6ST8fCcB1lKUYjVNoYq1t9pUSCSPm0Y3JFVkIo5xF+ZaENSRPPqsLYIj1azHuKqdQHiCtxxi77
	dI512EKD6a6lQiFQCA1blBOhyHR8zSDIGDfP6XauXnlMQZ48NnvhrcK9EiC+Vgg4gOpphl8JPyU
	tipMq1vqvG9ZQvNDrbU2REP1r4ZyA==
X-Received: by 2002:a05:6122:d85:b0:5c8:c5f:e8fa with SMTP id 71dfb90a1353d-5c80c5fea36mr6228582e0c.4.1788860452922;
        Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef771sm9366673e0c.3.2026.09.08.02.40.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c652293bcdso4874376e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByA0RMGs/iH5/nXhd7mpHQBS6m/DU7VzqJCpzylLC2LJt+PRlNJ+OBJcYmsmD+gLB1GAmZ1rXhSOAzMGFM=@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:785:a48a:e3b9 with SMTP id
 ada2fe7eead31-78a4a6a93d8mr11547770137.4.1788860452072; Tue, 08 Sep 2026
 02:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:40:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
X-Gm-Features: AcwNN1VVehwPBkszYyC_fDFyLf1R3qYKa3cv4jfVhnkMYrB4AMGqyjOV460-Z5U
Message-ID: <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> When exporting a GPIO using the deprecated sysfs GPIO API,
> gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> IRQ-capable, which ends up using
> struct gpio_irq_chip::child_to_parent_hwirq().
>
> When using the GPIO character device, it is possible to request a line
> and to dynamically switch between using it as an IRQ or as a GPIO, by
> updating the edge detector.
>
> The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
> makes the assumption that it will only be called with the intention of
> setting up the IRQ permanently, and that it will only be released when
> the IRQ domain is freed.
>
> Since we now know that this is not the case, take the following steps in
> order to properly handle that case.
>
> Implement struct irq_chip::irq_{request,release}_resources() based on
> the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
>
> Move the IRQ setup and release logic inside them.
>
> Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> provide a proper HW IRQ number, but do not actually setup the IRQ.
>
> Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
> the acquired IRQs.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -1062,18 +1047,21 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>
>         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
>
> -       *parent = parent_irq;
> -       *parent_type = child_type;
> +       ret = gpiochip_lock_as_irq(gc, hwirq);
> +       if (ret) {
> +               clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->used_irqs);

irq_idx

> +               rzt2h_pin_write_pm(pctrl, port, pin, pctrl->saved_pm[irq_idx]);
> +               rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> +               return ret;
> +       }
>
>         return 0;
>  }
>
> -static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
> -                                      unsigned int nr_irqs)
> +static void rzt2h_gpio_irq_release_resources(struct irq_data *d)
>  {
> -       struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -       struct rzt2h_pinctrl *pctrl = container_of(gc, struct rzt2h_pinctrl, gpio_chip);
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>         irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
>         u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
> @@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
>                 rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
>         }
>
> -       irq_domain_free_irqs_common(domain, virq, nr_irqs);

Why is this no longer needed?

> +       gpiochip_unlock_as_irq(gc, hwirq);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
