Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380207;
	b=JnUp+uZi2rXWb9IX0uLI8ndlAcsjysvCWR0vOB4WK7hzo/YGKW9K+A4tEJ9MpqouLnoT
	 gE1bOFKyWGQDq6yvontcVJxh2hz6YuSCeCucpCn5eTeS5UQTYd3TWCqUEfWsCcl3zuuPq
	 Ez4yWKZsppXFasU2yP73q2iy0aqFmTR+oxbmxmZGAAgrhfYx0ZZOkcAzLJKaesMFrO/9C
	 WgS7idrv7KdvAonKX6OfbLjRt2S0PmzwoVJYsRdb3nUYf4UtlX8wneY3jiyJM3Wc2xYtS
	 Bd9BSQ0H6MUOf8WNQH+olALjj85Ag/+tLYhjQ9hPoRsBBE5kloPhqZKjOONm/6kPvwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
	b=RLHwgddF0fLrV+M6tED7t3zyoB0uTtpPqy0Fneiey4GgURaSSH52QM09F8Y99LtDkemK
	 LqFtv61F2M3KObMB/4syFw1tOXS4Zjw3BByfmfCPwxTNg36W3U2OlOEqaKK9Y6UbiTlwY
	 Ru89vHK/EpQxOtsyeQz5J+0wONTe9VoUlg5Ih9cnf7hlC+o9WYUjipTl/9MIrfwrmXliw
	 PBYUWI4hZVPxj9FaBxfZGsvDNPnwOp7v9yiaJ4VA140C0OXLMwio0PdXMX4tXFaWwjOS3
	 Fqcq6/Fyw4QSpZeyeHdg+neAlY0wVfbJ5ZteaEUKqpfAKsmyTIuHG3V/HFVKX+Jb5aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DemFTicz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8B606A331
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC8B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DemFTicz
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso640350241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793380205; cv=none;
        d=google.com; s=arc-20260327;
        b=aLAYJQPmLIQNShWWdJAtsrk7BzowwWuWtTGhkaP3mP7g11mToCvY0gQJlbZPO4/+2n
         rm8InLOlBXklesw4AWwf2XUryMEfb85SA1+ivlOdT6gDjBtIMthqWc6Lau0WMM9g6FLu
         kPtlUVJoqZ2057Q+krfAbdMJ4VaAH1iH8xvdKETzL3rnRSYfSgnk0+QA2q1qZL7mt+sN
         fxmwO1gvoV2YHNHRocmfeNevV1QUBwj4c0EgxMW6cZUfIBJOmMkH5a5tK5LxeFyQV7kb
         wGQYgQn6HVtn4S5CL3o7KYrLr7bxltRAV5I9JzoPGPFKCqbluPkrhAYNjgmbQlmMCuc6
         Rh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        fh=gxLN+5Ycx9EZ8K91EFgMBoAXZQFG5UkTd4skWqsefHM=;
        b=ZyI50Q+plha++a6b+foc+O/F+6SLncCpaqVn4mSDsafGiG5DwdOgaXCJcZCsAb8mcw
         2EIHWTooTbJBdSB/nDFIyx9WdQbVkEJU6naYsA1muyZu5m84H8a1cvoLzebkyi/Sip86
         aBb2BmJiUUxbUdQsK1QnA3EUA4tTKhSQh7Wmn4+YKx70vVhauDi5/Ldwdnl4MFqECneM
         kS5KV/8h+ZT/J1QZKpr/ozOWerI2ZKZ9K0zAazy+h5HzKCw9yxlRdXMm0xyTgUbTWfNY
         nZNV9j0QLiUX8modtexnsC9PMRbeT0Qne8Hp6rTO99+nRpNc3ddSeGBtDZJHu1vU6dLf
         F9HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380205; x=1793985005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        b=DemFTicznQxVZXTaJqrmTwFkB0xJ6lEUFxHpwmNImLDy850dl7+VXftJcJQf7Onq5O
         GroBdy3enaQIkt31MQMYL1qfTE5b23BuM1znvZPmy59K9LdETYiFoN+XCv5PnMN0E7RE
         h9F2ahqPxfFqNHuUNl2NatAYWx+XTWbkiDXNm+BszIp135BOpEflxPMGfNp0sRR24gBb
         EAp0wR1izJev1c5hlE7pFNvxzpWXs3r4oVnrDBjENpjYIskLgv5RoE1dZUDJN+odYOXt
         uNQyqmnDQ9PsTUq5Hky3JNUqmbNzfQuM3gSh6Z6s5YfJesUYUf66PkH66EryscXXrFq9
         tBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380205; x=1793985005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        b=vOkK4jm9CZcFrdadW12rqAMV9rjUOcK7vdn0imZNs+8McHjzpbUthU2qExSDVcAmtz
         KFlQ7jnChIE2qlIurNyT2GWGeIWdj5dA8cHtRDAxr4tAUTdCqwSqYHgev0leMhefFgy0
         k0KO0w6Z7HwIbzvm1bRhxUtVRVQo5P0NicmQonluSUs9cxdRH00lJBI1F/pC4y8hWJ7f
         aOftxy6dfAG9mvecpT9WyjcIlAKe4hcNLrcLbGNaXQ7Jvxgfvcik+ZFLTmtbe5sYlmCa
         eVul2ewH6pRM1Z90dMhv/hNSHBVcjaCKyAoeBr3mfLqTRO8VasV+/rBI1/SrzX4tKsSG
         ccdA==
X-Forwarded-Encrypted: i=1; AKwUvBxiEjH262KUaL3dJiqJB47ZDOQf4nuEd+tET6AyXUnVhlJIovMHc7qxFvjk/D+9C2caPOLYOlweBEyrdW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk57qen+lwMdsR0jjExYMTfFUZ8Bq/rz0Gi5AhkrG0UXsCIE8r
	PXTjdPb3AplggfZSLnddMhlPt1KBkDtjY0YGhp3BNi1A03RREajNB9etMYqPtgaL/74YdjuV6sn
	2019aUZzy/Cv4xT7w6S1bsIwE+wTkpS4=
X-Gm-Gg: AYBFou2rNldHk51Fy/YTYD5rwluZ9p5yhtBcKd6VjjXJ84kG9SMbcIIVer4wugl78QU
	9TsIrI3i4tQjs/caASoiGoa0hA07Hm3NWAzmMn5N8RJEXckjarOgU1nmZEaKlsjZHsvaoVKJVZU
	f/W3RR39BlzOh6bmtaB5FAMNJls4UYUgnNzAbJ+q+gx2YG2x9b+kzsV62QmpYrXhHuMSbtGh+nm
	DoNnKCJ9kZNBdKTewYo59SZ8uIFCdGVphnmbgvYJC2MmsT6DzOVbDhrAKG04DuvG82pW2O/oD3W
	ywOLjP0Pa3lwkc7elm0n4XbDcWohIdl260lxScCzKbr8WU8uxPzlmgAj0Ej8khkWMEaTHIjV378
	f2FBwNMTR39IcolEctYSYFJUl6VfdWflbbQNsNopX2RuOLIWru3jHNi9n97if/cpERuIe5zpdxA
	bkuUjeKYrfyOIOkuIEeZifPJHbBzTDlV/9kqMdsqXT97nJVYztgAB8gTGrmpFiOrpGynSwl+/7r
	teiRw9yEj3gegQLqlzAmPYXhRifSTI=
X-Received: by 2002:a67:e10d:0:b0:7cc:1a41:20fe with SMTP id
 ada2fe7eead31-7d072cae2c9mr1521484137.25.1793380205451; Fri, 30 Oct 2026
 10:10:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local>
In-Reply-To: <auRl9ztbav4nHi7U@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 11:09:53 -0600
X-Gm-Features: AclHuK8FtznzJujmH4YHgrWNDCpi98ee8eK0vX_qbau-y3ULhcsZAztidkT31Us
Message-ID: <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
>
> ...
>
> > > > +     while (rx_ret || tx_ret) {
> > > > +             dev_err_ratelimited(p->port.dev,
> > > > +                                 "DMA termination failed: RX %d, T=
X %d; retrying\n",
> > > > +                                 rx_ret, tx_ret);
> > >
> > > > +             msleep(100);
> > >
> > > Huh?!
> > >
> > > > +             if (rx_ret)
> > > > +                     rx_ret =3D dmaengine_terminate_sync(dma->rxch=
an);
> > > > +             if (tx_ret)
> > > > +                     tx_ret =3D dmaengine_terminate_sync(dma->txch=
an);
> > > > +     }
> > >
> > > This is unacceptable. Sleeping is okay, but value should really match=
 the
> > > baudspeed and other parameters of the transfer.
> >
> > This sleep is backoff after dmaengine_terminate_sync() has returned
> > an error, rather than an estimate of UART transmission time. Each
> > retry asks the provider to stop the channel again; elapsed time is
> > never treated as evidence that the resources are safe to free.
> >
> > The particular 100 ms interval has no hardware-derived justification.
> > However, I don't yet see a sound way to derive the retry cadence from
> > baud rate either. RX can be waiting for input, TX can be held by flow
> > control, and callback retirement is a separate requirement from
> > moving bytes through the UART.
> >
> > Do you have a particular provider failure mode in mind where retrying
> > termination should follow the serial transfer timing? I'd like to
> > base the interval on the condition that can make termination succeed,
> > rather than substitute a wire-time estimate for an arbitrary delay.
>
> Termination of DMA sometimes require to clean up internal FIFOs and other=
 state
> machines. That's what happens on HW side. In the software waiting for too=
 much
> may lead to the very big undesired latencies. The value of 100ms sounds i=
nsane
> to me for the HSUART cases (megabaud range of speed). Also note, not ever=
y PCB
> design uses HW flow control, so this may be even worse for them.

The 100 ms interval can add unnecessary teardown latency if a failed
termination becomes retryable much sooner. There is no hardware-derived
justification for that particular value.

The FIFO/state-machine draining is part of the provider's stop sequence.
For example, DW performs its FIFO-empty polling inside
dwc_terminate_all(). If termination succeeds, this patch proceeds without
the retry sleep, regardless of baud rate. The sleep is only reached
after an error during DMA release, not during normal RX delivery.

Baud rate can influence how quickly a transmit FIFO drains, even without
flow control. However, the termination error does not tell 8250 whether
that drain is still progressing, how much remains, or whether the
controller needs a different recovery operation. That distinction matters
when choosing a retry interval: a shorter interval reduces the added
latency, but does not establish that retrying can recover the channel.

There is also a specific API detail here: dmaengine_terminate_sync()
returns immediately if device_terminate_all() fails, without reaching
dmaengine_synchronize(). Consequently, an error leaves callback draining
unconfirmed as well. The retry cadence can change, but resource release
still requires successful termination and synchronization.

>
> > Regardless of the retry interval, shutdown cannot release the buffers
> > until the provider establishes that DMA and its callbacks have stopped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
