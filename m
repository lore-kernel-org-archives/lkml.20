Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294277;
	b=if6h9WxmpLj5sOAgDK5HbEjFV97tJbmw+XLJCzeTQJycTl76CWVTS+SRm5ejzUrY/7D4
	 8IzN0Gjx6n3H/zKXiu+iccAdATA7ZniRd4smS5P+nR4k0rTArUJvTyNDeHfRvICdzibvg
	 G6jybdTiEYayMWRrzKIjA4zPXIVWuBQmAaCSF8SjhdwRnXDxD3H2PzqxadvcgOQGKHjBd
	 owg++ZQQHlHWVfI0LwYCg66jzbihCKM2UAkeEZmlrSFsHjYB/Cf13K3/sCOHAJfQOkkAr
	 0GrUCLOmLMJIN/WxVvSg8zY/MNDDC/BBkPCYmE/nH261e6ns0Ixshqx0+9/qSsG0tag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
	b=K9saNV4wV8kLA1oYxUO7sDlhgr4QOLx2BQFwFLsMg25U5nn5fuS77MAx/2XuE0gSDvPJ
	 ZKl/dmOwXIYYRNVqpSwY8SM8Vp9oa41LU8JLgSzjLxQYOE9tAhJ9qj3/Bd3F2VrFJPo5d
	 FfU8b/GHTrZ19VQb5+F2YyyIDZmqGYkPIg31SW19KaFl+sjZpyqZuiXtOsKgkLT9ampDo
	 31gKTe+aLwPmZPjQUUqc7qPbZ0SUcm2Vt5mZ8qpKxvcy9tuwxYmKGG7O5G/1XU1wOPOBt
	 wmi7RDGtbLZPRzqs9Sc/q1pe6xuOtw1hpXSZZvAlzaX6opUEk4EMRf6ky/l5QZpQ6jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U1lodXTO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA903606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA903606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U1lodXTO
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4371952a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294275; cv=none;
        d=google.com; s=arc-20260327;
        b=bLOvzabMQD92oN0aSj3PMahS6TcQds9EWySU/nWMqIIR03xKOa1vNDdUbbLlfaSWQf
         H3E31/qH7sEphkKephNvTp3GE+bm39rWKDAbiyBPSINThKZa+VkLwh2efbxxlbqdf9Ke
         1fknRIodajC0tvCK56We89gDTZ1bT2l4C5o1O7QlitDng13jmTulW1r/foPXZ6x+fpTd
         nIk6SydBgJiQpoJnSMr5dP+y6IjV4I2B2lZTKCxYI7xUD+77r+1xAdXUABNT7x1thOzJ
         4hsINy89kpzqDLLn0BK/KDehhYUcdYuk3mqhs3L7BcnkOxpnKabfa4wBuAWVmWFJrxw3
         s67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        fh=cxfjwE2FWU2vPsHSJUcyGj2LvAnnvCPVd6j1UckB/Eg=;
        b=kK1TThpX+WV0p617lq9wNbEd7MTRDCcO+fjVi09MAhO5IqMwmc0ywjAFf32Tmez0M7
         L+4AONPNZXJcSm7Lrx3iAZqq+2EY+4J5ssT/hw3ZGk/ZsVqetnZ2L7m0DSIFqEd4m+MQ
         XePEdspA78mls0vVrOyXFJHUClaCajJyDoeQn5ZktZ2iPwsTRMZJslBkjWcpSxQgT6LQ
         X5dK5CN3ycTsO6kyJxDtwmA2mFrO22mLDLemZRHTOO2drRsW3eE+B+37f+E+WZlJqj2F
         HZVwkxY4ddnmcCgHBUUCXLqudotBJph71K+HM2dhKs0ht6tgD757Y20EkmS5qSgfCqHA
         UAug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294275; x=1793899075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        b=U1lodXTOQgNfGhx5cmSNfFjyd91hY7J581AuMLFuVn7Zoki1q/ZGT3YuSQ/6YVrbCB
         JnBOa9Jf+pHpwzbx1kmYhfjTbyAAWJRl3t7wz8ysZW8Jc++T7GJ5p77Gb0CbZnM8rk/r
         EGCwmAzEW/YCJDg2OzrONhnevtqfHfdQ/uQnM3AH5XEmNBzjux4rjUkRuCUwq0t/ouuH
         Qy5DMr9Wl/UUj13JYEz+33YmIDMsNl/PywPDoM14lVitgSoWEVrxaGrmU+04FlwJtVvg
         ucB/aDfiwCAZRlgzG/Sp0eQhMAvkiRfHfBxvQI6gN/r9BCrTI3DMZrnuwxw1VHMHP/5L
         w61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294275; x=1793899075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        b=adE77+fMyQYTUXqaLKYkh5Kc2FSCjm2K0yYaizXnsK7T5XwrKr45bxcY05FY8B+9nH
         6T23nkXerbp33Eyg5yTRcYsK7MEBC9vQRGKoK7XSm+8Y57ZnLqt3iZhJYpt3zF7TzO1h
         jvJfp+0XycyePwKFwU6IbMoBrbnOO1xnWMQX5bpk/O0ixGJozGB69UTG5I6C4bEb2p5q
         mRwzLMg0085qbwP149LVmyuVBVCsS8a5Q0CYOmU3a4chlF2cGAzh/vVLojfpHc3CcGke
         Ily2bRFth9+wCPWc7En2pMSm7QHZDjINZ+cvcnxH/YlUYgifsfKkR+jxwny6AkkGhvwM
         PKug==
X-Forwarded-Encrypted: i=1; AKwUvBxLFj6U/L/0PwGTQacsZTnJzjk85Pk3ZFOh4aISmlnulHnIG35Vt8V/m3Q485HSFDY6XwOeC4o7560l3SE=@vger.kernel.org
X-Gm-Message-State: AFq9FYInuVkZ3WmBEw8jZb8bvPk3q++TFWx9YmoUfEBwDxBQIJXEVHie
	L+YNavk6qWCFW2wrqYsE4WCEWPBgVsDcwiiTHRdowQYpyZJxoKnKcDpLt71rl6iIDJaOqhf1ATn
	89vFU7Tv/kR56OTo68pOyEhdM70a/4HI=
X-Gm-Gg: AYBFou3p9je+uAezDyRgbUxcNqap1CFr0CgcSv39gTcT1oBEC2RW4+JyKV2NZnlJeuf
	EI91SpkP733m+/Zjkr8duo2vUJKQMdLiv9/yRp4iJol2rb1PACPbTnaiIZaW9wYkbr5ZsyYj0ob
	T3hq+Vt9ApudlT+2oruHlJ+S6T5o/1qSjjcd+dD9e65QYeBUV1bZv7DRLwG9dMSYdcGSg7j49g4
	niQvYZ7sUs5ePMSh8nG/iDGJPj5LEn0Qy0snhqIsgvxlLpUSFnMlmgrC+9ryOEEWdKKSKf9RXZt
	Q+bJQOHpnzIjvgmaR9hjZQoBD5h+3CxySnMhpoXPUZhLY69bdLqZzPc1/phXiMYslL4vl2SRgBg
	2eYFeoRQCnqzTR9UCMRLGeIl8nllCAHUuDERH1S9VpTjj3EK4sTsr9CY4pQa432f3AszYWEm2w/
	6BA89wWOqEk/fYb763clYJZIOJ2d9A0uo7falshVOgYVqF1Kru5dVlFkjGkeL6ks6w8StklV8m+
	3w4U7bnWTGaZylygHgtIo0fAmVdFA==
X-Received: by 2002:a05:6402:158f:b0:6b1:ba86:5f48 with SMTP id
 4fb4d7f45d1cf-6b49cb8e221mr4598429a12.36.1793294275082; Thu, 29 Oct 2026
 10:17:55 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <auNWl_thBnE8JqBE@ashevche-desk.local>
In-Reply-To: <auNWl_thBnE8JqBE@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:17:42 -0600
X-Gm-Features: AclHuK9p5HgzHs6EyjP74wtBvDwmav_JmQ_V3uuDUu-UaTGXVkbTzXu0Rboi3LQ
Message-ID: <CADvTj4qR0j7f-79wTUb9LmwWdGKYz32vB3Bgfr9AnEfXMnMBdw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
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

On Thu, Oct 29, 2026 at 8:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:01AM -0600, James Hilliard wrote:
> > The generic RX timeout path pauses a transfer, copies its data and
> > terminates it asynchronously. Clearing rx_running at that point lets a
> > new receive reuse the buffer and cookie while the old callback has not
> > yet run. Inspecting the new cookie cannot distinguish that callback fro=
m
> > the completion of a new transfer.
> >
> > Reserve the receive buffer until a worker has drained the canceled
> > callbacks. Keep FIFO access separate from callback retirement: after a
> > successful pause and termination, clear rx_running while rx_terminating
> > prevents another descriptor from reusing the buffer. Deliver the paused
> > data before allowing the interrupt handler to drain the FIFO through PI=
O.
> > Normal retirement only releases ownership and leaves subsequent receive
> > handling to the UART interrupt.
> >
> > Preserve the normal completion-path LSR read and gate DMA resubmission =
on
> > the receive interrupt enable, so stop_rx() prevents another transfer wh=
ile
> > the status read retains its existing side effects.
> >
> > Reject new flush work and PIO receive handling during shutdown, includi=
ng
> > late Intel MID DMA timeouts. Stop and drain retirement work before free=
ing
> > the channels and buffer. Once RX has stopped, allow the idle flush used=
 by
> > DesignWare LCR recovery during shutdown. Clear the shutdown guard befor=
e
> > startup configures the UART and tests its interrupts.
> >
> > Check pause failures before accessing the buffer. A successful pause is
> > the quiescence guarantee, even when a provider still reports IN_PROGRES=
S.
> > Also accept DMA_COMPLETE after a failed pause: completion can stop the
> > channel before its callback acquires the port lock, leaving nothing for
> > the provider to pause. Retire that completed transfer normally.
> >
> > A failed pause with an incomplete cookie is ambiguous: hardware may hav=
e
> > finished while its completion interrupt is still pending. Canceling tha=
t
> > descriptor can discard the entire completed receive buffer and switch
> > permanently to PIO. Retain the transfer and retry pause and status in t=
he
> > worker, with receive interrupts masked to prevent a timeout interrupt
> > storm. The worker copies only after a successful pause or reported
> > completion, then terminates and drains the old callback before reuse.
> > The pending-pause guard keeps callbacks from copying or resubmitting th=
e
> > transfer concurrently. Retries sleep outside the port lock and stop whe=
n
> > shutdown takes over. A provider which never pauses or completes retains
> > RX ownership until an error or shutdown; a timeout alone cannot establi=
sh
> > that discarding the buffer is safe.
> >
> > On DMA_ERROR or termination failure, let the worker stop DMA before
> > handing the FIFO to PIO. Keep the requested enables in the existing IER
> > shadow and filter hardware writes during pause retries and recovery,
> > including termios, RS485 and overrun-backoff changes. Apply the current
> > enables after retirement so stop_rx() and shutdown remain effective.
> > Hold a runtime PM reference around worker register accesses and keep RX
> > on PIO until reopen after a confirmed error.
> >
> > Abort the DesignWare idle sequence when RX cannot be stopped. Allow
> > the empty-FIFO timeout workaround once DMA has released the FIFO, inclu=
ding
> > while callbacks retire. Exclude FIFO resets during RX DMA recovery. If =
the
> > provider still cannot terminate the channel in process context, retain
> > its buffer and leave receive interrupts masked.
> >
> > For OMAP, publish the shutdown gate under the port lock before the fina=
l
> > RX flush and interrupt masking. Take the RX DMA lock inside the port lo=
ck
> > in the completion callback, and serialize the runtime-suspend flush wit=
h
> > the same order. Drain the UART IRQ before releasing DMA state so an
> > in-flight handler cannot retain up->dma across its release.
>
> Can this patch be split to smaller logically isolated (to some extent) pi=
eces?

The OMAP shutdown and locking changes look like they can be split
out.

The generic RX changes are more tightly coupled: the retirement
state, worker, IER filtering and FIFO-access guards must agree about
whether DMA still owns the receive path. Splitting those mechanically
could leave intermediate commits allowing PIO or another descriptor
to access a buffer that has not been retired.

>
> ...
>
> > +++ b/drivers/tty/serial/8250/8250_dma.c
>
> >  #include <linux/tty_flip.h>
> >  #include <linux/serial_reg.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/delay.h>
>
> When adding a new header to an unsorted block, try to squeeze it the way =
that
> you get the longest ordered chain (yes, interleaved with some unsorted
> elements, but still).
>
> >  #include "8250.h"
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
