Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E553A8AA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869791; cv=none; b=MDDj3Y/VEDxCQcMppf7cDCWK/65+84eoCsVoBc78TdOqbRxnHkZ4am/FKlIlN3aCj32kRozCH6Jwez7w9TJaguEBns1nd06SvLRYN0h+LONMLJqdZ1gJ2+9q6CnxTXGMKhoLWdoixlRPwo8pD/cd5K0w+taSpOvnKbA0COAvFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869791; c=relaxed/simple;
	bh=GkAEwkhAh2GYIkLx6cCmw7o1fsF123JG5M31hDK1crM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBE8vUvO1Gwca17YxCmyNX4PU5TzrHqI194JTgY6aVGvfpAcuTGNeGr5afBwnzMreXoCo7bahCAgkSd/j5v+H+2/k8FinqVJRNNXEEj1Nlsv3/Ebn3InGwDM9nTks9noYDb0gQWbrGY9b70mJD2RiwlyrAEqfGk+vktJ3kSrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so3465506e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869777; x=1789474577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3ivAQedapV9TM2nRTd5rbGn+RixfFjk0mtfmMN+Qx8=;
        b=ZgaEZk13L/59z0a9rPDm4/6Tlu4OoR9Enz3xo6exOQ+mvjooGrbfGbtmnt4L24Croj
         PW9ERcPfYAafzTd8lhQCHZ6q8eb3eS2RdKkKn3xZsXJfDHo0GkjapRpIPGM6Nn+2c+lk
         eDSdLFXcW7rU2v1bhT2coErJB8ThszlQs0vq23Qx/f1WKJIyVLUOcdOXxzcfV7n+U40F
         lqi7u+kuXLfG5/8iuXkx7DOk1gNgevQjXdr4B7eJ91sVXTVjpEKB6UhJA9HPIKozZwxR
         AVNPQGhiWFWL1tSA9fi6/qU95gV7bUFYUnYjAIAryJ1C3DV4hKnCT54n9vW4g78Jyh6f
         vjRw==
X-Forwarded-Encrypted: i=1; AKwUvBxKG4p7E6sclzFNnrUvaRWUf93IIgKWPYgdbyVFS/7+Cee36R9EpNpaipN9qh0brVfn+iFzChZbS8TYfFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kBAMSd/1QgZupQkPXo+1yTxSgKZuY/26KnVd9zJf3v03T+vnVb
	Qu24TqlJiKtkCTrEuydbrRvktGYQbX7GWPxeyM9XIhZk/O5BUDHBxpQicy+znPaG
X-Gm-Gg: AYBFou12fqZr+oDrK70jRpwU/9sYhHqMXzpRwicPbXGPKbG5drkDecBTD74WyqkOHe7
	uC2uE9t9mHR6HA3kZS92EkAXlQ3TCaRv8gxIX4GRbhzJPkqoSQBYGioaBv7l3dIg2yYZbPBd4LB
	ElP3gggS6SyxJlhsKB89Biw9kzA/XgIt2OrE/qFW5tYgaw/+/28OggNW2nFFaP1p5fFKV4fYvom
	9MRBplvqHMtrJWWEXdoFihteatR6efHBZMN98+lLZq0n91iBoHspgnyh/oRcrZXQB0uF0niMS4T
	R5LoWOU7bWXErlhKIKUrChbs384OWMuUxfIaLCqvyl2aJamayEGUDs+v7rx2uYHN07tGA0nowIf
	g5Vt49OoW/RWJXhJRFIu1piJ1ubjBYVJp6UkhTwyRus38s1xcPS5x4xunB3aO0M52wRyoWMCKsQ
	EdYOD+qgUyXW/dLJ6T60rjeovW6Rtr5Rm1IpOSdrzJWeeW+O5NgNgrbs2xRMz8S2/uMd4D78XRC
	f2OwuDV0vavrveNh2GICWc0FQ==
X-Received: by 2002:a05:6122:792:b0:5c6:6189:c756 with SMTP id 71dfb90a1353d-5c7ed4a07b0mr13687920e0c.2.1788869777239;
        Tue, 08 Sep 2026 05:16:17 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1eeaf3sm9822530e0c.6.2026.09.08.05.16.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:16:17 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97e96666dd6so2647189241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMu3yUxn0eglNkH8/kseaDlmFET+311OaekvulAIrDF9fqbPjYlbJmWH0dBSRu5t8JEtscNlR2p01y+ZI=@vger.kernel.org
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id
 ada2fe7eead31-78a4a8436b7mr12752699137.7.1788869776751; Tue, 08 Sep 2026
 05:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com> <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
X-Gm-Features: AcwNN1UYRmPMEh1uwkSa9mR-HbOhT0h9W6j5sM8pk6E_tmyyrP47WzL_coSV8xc
Message-ID: <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 8 Sept 2026 at 13:33, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> > > false leaving the pin in interrupt function instead of returning it to
> > > GPIO mode.
> >
> > OK....
> >
> > > Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> > > interrupt function after we're done using it as an IRQ.
> > >
> > > rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> > > previous PM value.
> > >
> > > Save the PM value before switching to Hi-Z, and restore it after the
> > > IRQ is freed.
> >
> > Why is it a problem if the pin is in Hi-Z after the interrupt has been freed?
> > Isn't that the right state for an unused pin?
>
> It wouldn't be an issue if it was actually unused once the IRQ is freed,
> but that's not the case, because you can call gpiod_to_irq() on a GPIO,
> and then request_irq() on the IRQ returned by it. If you then call
> free_irq(), you only free the IRQ, not the GPIO itself. After that the
> user of these APIs should still be able to continue using the GPIO.

OK.

> If the pin is left in Hi-Z after freeing the IRQ, rzt2h_gpio_get() will
> see that the pin is not in peripheral mode anymore, it will then see
> that neither PM_INPUT nor PM_OUTPUT are set, and will return -EINVAL.

That is fixed by "[PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin
value in IRQ function" anyway, right?

> > > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> >
> > > @@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
> > >         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
> > >  }
> > >
> > > +static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> > > +{
> > > +       u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > > +
> > > +       return field_get(PM_PIN_MASK(pin), reg);
> > > +}
> > > +
> > > +static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
> > > +{
> > > +       u16 reg;
> > > +
> > > +       guard(raw_spinlock_irqsave)(&pctrl->lock);
> > > +
> > > +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > > +       reg &= ~PM_PIN_MASK(pin);
> > > +       reg |= (u16)pm << (pin * 2);
> >
> > General remark: the need for this cast is one reason why function
> > parameters should use "unsigned int" instead of u8.  The other reason is
> > that the compiler may add code to mask the parameters to 8 bits,
> > depending on the CPU architecture.
>
> Should I switch the pm parameter to unsigned int for V2 then?

Yes please.

> > > +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> > > +}
> > > +
> > >  static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
> > >                                       u8 port, u8 pin, bool en)
> > >  {
> > > @@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> > >         struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
> > >         u8 port = RZT2H_PIN_ID_TO_PORT(child);
> > >         u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> > > -       u8 parent_irq;
> > > +       u8 parent_irq, irq_idx;
> > >
> > >         parent_irq = rzt2h_gpio_irq_map[child];
> > >         if (parent_irq < RZT2H_INTERRUPTS_START)
> > >                 return -EINVAL;
> > >
> > > -       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> > > -                            pctrl->used_irqs))
> > > +       irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
> > > +       if (test_and_set_bit(irq_idx, pctrl->used_irqs))
> > >                 return -EBUSY;
> > >
> > > +       /*
> > > +        * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
> > > +        * interrupt function, losing the previous PM value.
> > > +        * Save it so it can be restored when the IRQ is freed.
> > > +        */
> > > +       pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
> > > +
> > >         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
> >
> > If rzt2h_pinctrl_set_pfc_mode() would return the old PM value, you
> > could drop rzt2h_pin_read_pm(), and write:
>
> The main function of rzt2h_pinctrl_set_pfc_mode() is to change the PFC
> mode. Returning the old PM value as a side effect would mean the
> function does two unrelated things.
>
> The extra register read this avoids only happens on IRQ request/release,
> not a hot path, so I'd rather keep the two concerns separate if that's
> okay.

Fair enough.

>
> >     pctrl->saved_pm[irq_idx] = rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin,
> >                                                      PFC_FUNC_INTERRUPT);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
