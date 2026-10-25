Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792954037;
	b=Zr93eNtXgRA67zQ3ts6BCcbtq8/+eGyQpb37IdgJ38xJxBmU94KFe+ZP572NOCAjhmCH
	 eY1NwazhQ8z5Y4Nh/nS8H/rAVZiyXR/k59uDg8n4MEkPq5zfDn+JFNNq4xAy9M5eIZENm
	 2JWQxGtlr4NiRvR7jqMduQH+LtpTzVRdaDXTCGnrMRBDmVnt1kU0n2O6V8QyBZbqjzO6V
	 QoAYatzUqZYHLpJMGlBV5njGCn/eqvKvoo+IvJpJ4Q4rOdj+nLUcumlVDGAvnqL3v5ILR
	 WvqvDfVUV6hmi9aqZDN6eX2ZaHZB9TYKNiMo40pzEnS2IKC1PwRJf3c2Xpc4cfS7FQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
	b=2mZ/7XdDKJ0thg5XxZIY6dzOtldVpaE7FWne7w3bHU/JvgwHGca+bRZUseUCnmrfFuIT
	 yTITZb8NwFLPlOqyECbJGDrVXPiwNCG/FOfX1uFE8Nkikdwib/Y27M0W13/+QO8b0BWMt
	 rHAYOcNrr+Rva4SXxhpg0V+ToxNEE4IDZzYbZtyEcXqrCq0UlgFoIYY369s+VoqpaVclb
	 DcIzgcDdwpuyD3K+ijwB6i3rFm+d3FRB4bvgsqGzdK/sZqPNT2AeUHNlvKPtPOOigNy8n
	 aboxHc2yXNU9WZJvhdlfBpoDMUVJWLNmG+bjKz60IefV73YKP1fvXFsFuZ5TAokexZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pFZ5a2iX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC22E606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC22E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pFZ5a2iX
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so3159109e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792954036; cv=none;
        d=google.com; s=arc-20260327;
        b=r2F+Sz+r5/sOKesLu6RKMYNOq/LXwNu+kJK+9FigG9tZft9JoHzfzx/L33M/I/Jf8h
         lcKOcptKZIShgZi2SCelcGm4vmUdNAd/e1MmN1ya31O5sQKojF0T3YdrkCd0MIZCkdEB
         atEB6gF/d9kQGIudBuKg3ILEleJCop60YJWrcFEoINkYmnXffjbKkaE+fjW6DxbpfEgS
         m5vXk/bXi3psXO9NZ5W7PV+N5+LpkmReisOsV3a6EXlrMk5xw5umLwT1NpgC0WXfO4Jk
         GUE2A9asSir9nAtuth1bzZuMhBDFYj4wTE85bc4C+cC/+bN4GXUlRfB5o1kkoyS4cLRH
         uc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        fh=XhQXveBB9zwSZNziIqr3ZODFZewSzFVWEF8Hj3xByaY=;
        b=Auf69iY8w1Y+K8tV7IkfxBfm31IBldSxfAvqLB3eMVrmFAaySUoOmBnNSROOecN+Tk
         DjzL4tOxDLw72axKWIJFlKREQatMCZGrs7Q5/1NUD83OxEoAvMOje0J/+BCjmXtLOpRk
         KScxqMXA6WwqqLup0nyjF8TbyF82T0q+Ev7DSPteXkaK9D+GTxh10CVQBze5C3m5prb5
         pi7LnPXQJTCrBp86sIBD72ov+tw4I+5lNKRcQBIjrFbWn1z5AUWlpAqgMefzIaXWDSYh
         CxUvI/MCQfepOqjq9JrOrGiF2MXCcQm6n2iMTtDzY5VAdsFxUhIavRzU2PFJt2FQtw6a
         BNAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792954036; x=1793558836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        b=pFZ5a2iX/z+pKe+hYLL1GQnSOuYDBsz3Ynetp+1FWxgyGkX28iH2CSl267qWQgDyM+
         RGRJPcOXNuTcRjE8ZLrMLmU7T+dN7BWz82eGoPJdVXP2Mvp9vwELoUeGlVLP1nOK9Xcf
         7i722QRvAnnSymbAbqjIULgrN8IXRBrkDHcsBVG8B/xiMPMkam2S62O+X8e0DtCoP6Th
         nl3gIW+nmYYec9t9wbAvuRGY6nPN108gaPfaCKBhFCew4Dad7WB+wwngNqiwEKYtP4uS
         aH6gkvQr1EnE0CNMNrA2l5zFCFFOXGACQi4eaWzXmMZC3vm/YEiF0haCDgZ+hu/V61Cy
         VLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792954036; x=1793558836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        b=inkj/kQjpW5D5ozgTYNNvMRilyF1zi6YoYgVyDLr+IKZGReInp7R4iF8XsYcpooJP/
         YkL9r6WWhciEX0D9li7S0ItP5EzOEf+q9/QA83Jqqi+8PpkMmofkqZm1yv+GahAYMkKe
         GGKbYh9vAt8ShZkbT9oT6D8BIVGumKtLfHFbgaNNoxmn79zJ7pAwdcDv7J3KnWHviUAH
         u3Uw/IVIjXQ+SHS6144dTjEG5pza4PEWTkuBpaRqz1A3yijPyclnLZfTjExV9dSIQq2C
         PpHGoId1Zj0a7j426syF72D3fnl4OuK7gSS0nMuOomg8Js5XrBqRK6Qpj6rQbZqNHFMV
         7jAA==
X-Forwarded-Encrypted: i=1; AKwUvBz21lN71l5mH+uEmh4ZucT35+2FVvjesrGxE6Om9KetawTEkfZvvj22Jk/p8Ne2oqEJC7HV/F1vHGPlelo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzNHl5a+nP7iuuAxfSMp4Mn7xVSH1LGjYJCXucjSLG86VFmshs
	6oItkrENGuzoV3oDg3XEIs+4+6DOZoc8HvKr6u8gggzw2MpnN8ZeBMcrLDvNebGtkh8RQwQY6H7
	JvP3wXPMXKb6w7AU24Rryc7uTL0vbR2A=
X-Gm-Gg: AYBFou2oFlINMC9dnDNmWRa/bk80AfB6zZ0v0Q7pNiUw2kXK9Ft6tt4VVnrO0kf0KIV
	KcN6ybzY+4vmf0+cMMq703MESlffoWwzhQmoBBi2OsNcJmkDmo4yiW7hfmRIkMMiwY8CUNDErYL
	A7x1miZzvXN9PcHGLU2QtGkJfJQDYf5CIC2NScLDd7eYRklT2X7GTRPtfFxw4adsnz+uCKBaYDo
	MlBjrYDp4KjGw3H7ieK263cknI+KbSCuTZI3n0DK5Dxzpw5HQ1ZSVw4NcoC50Z3k/UtxO121yUC
	E7rowo6d2TK7ItOAtgZqmnJgmcx+9tqWQwZ0Ix/rTxFOT3d6PSLyuuyf7MQuGJzTVz6WIrOMqBk
	zu6cr+JGM73EsaS89wL1LauwS5WlclimmlS2vaPmgXQQSfJtO9ec3sYK4GiiXg+lgnkKxFNtFzj
	iz1PTfK1gwwOZZiz+ZKtZEIpVtuP2eRTjVC5yPqxc9IxJoVJ1+66Bhj9yXEvefl/GMluuWNfQ3x
	5DkzTEt3jyH03YJTR2FdqeRX8dgpw==
X-Received: by 2002:a05:6102:b04:b0:7b5:8fd9:27e9 with SMTP id
 ada2fe7eead31-7ce5d005cd0mr1043722137.2.1792954035832; Sun, 25 Oct 2026
 11:47:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com> <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 12:47:05 -0600
X-Gm-Features: AclHuK8RfnuoMKUL7_ChiQcwJjtxWWikUNjoVOQNx_xye2F4G1UoFeQQYjFC0tc
Message-ID: <CADvTj4ryYd91LYMCktJ6a8=ygm0BG6dd4ZyK6XByaVcWvFTvkw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 11:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
> On Sat, 24 Oct 2026, James Hilliard wrote:
>
> > uart_write_wakeup() expects the UART port lock to be held. Several work=
er,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
>
>  Fair enough, and thank you for the cleanup and spotting the issue in the
> first place, however...
>
> > diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1=
250-duart.c
> > index b4e1b90e5960..b15f76acd06b 100644
> > --- a/drivers/tty/serial/sb1250-duart.c
> > +++ b/drivers/tty/serial/sb1250-duart.c
> > @@ -454,10 +454,12 @@ static irqreturn_t sbd_interrupt(int irq, void *d=
ev_id)
> >
> >               if (intstat & M_DUART_ISR_RX)
> >                       sbd_receive_chars(sport);
> > -             if (intstat & M_DUART_ISR_IN)
> > -                     sbd_status_handle(sport);
> > -             if (intstat & M_DUART_ISR_TX)
> > -                     sbd_transmit_chars(sport);
> > +             scoped_guard(uart_port_lock_irqsave, uport) {
> > +                     if (intstat & M_DUART_ISR_IN)
> > +                             sbd_status_handle(sport);
> > +                     if (intstat & M_DUART_ISR_TX)
> > +                             sbd_transmit_chars(sport);
> > +             }
>
> ... why do you think the whole functions need to be called with the lock
> held while they may or may not call the handlers in question even?

For sbd_transmit_chars(), locking only uart_write_wakeup() would leave the
empty-FIFO decision and TX interrupt masking racing with start_tx(). A
writer could queue data and enable TX after the empty check, then the
interrupt handler disables TX interrupts and leaves that output stalled.

The same lock protects x_char handling and FIFO consumption against
concurrent updates and flushing. These races predate this series, but
wakeup-only locking would leave them unresolved. I'd keep the complete TX
operation locked; each invocation sends at most one character without a
FIFO-drain wait.

> I
> think we should avoid excessive locking where possible to avoid holding
> execution elsewhere unnecessarily, shouldn't we?

For sbd_status_handle(), I'd read and filter the change status first, take
the lock around the CTS/DSR updates, and release it before waking
modem-status waiters.

I'd also move the TX lock into sbd_transmit_chars(), so RX-only interrupts
don't acquire it. That means two acquisitions when both status and TX need
servicing, in exchange for narrower critical sections.

>
>   Maciej
>
