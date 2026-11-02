Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646120;
	b=PHIXi160kzE5uBOdhw6J5TojI/NSF39nNuD8sIBQCFYDQpnqrBbBhLJ/mN5hj2xb0vnE
	 j+hjiyoJtSb9emGazsoDGYsBUJLuPYpZabTJap4CvsnrE9A04/oZ06sqcv+LSqRALeUbO
	 1s3twaK+5n0mwxoOPaCm4Sh/kMm4CveW1v+Xhhe87Gmjn9gh6VV8tmgSQXKncaW6hPdfO
	 gANtsC4F9XFVh/QmnYXYaRWBz+jy4Me8KVv4D83pJnEcZyKPpfxdyAEAKgjIoka3YsRDC
	 cSy5vn02kCRR7kU1GeQUKu8Z9RB7dGkDZbyQEh6oIKJTC9kMslkxVH+0kQcT9lL1ngw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
	b=vqXnOR1N2q2surQFNWhEUwD2nSrzkg5Z3SDu3WUWnHTDo9e+GX5C5sk9xksrKtff05AG
	 /rZOLqCa0Mzn9pH/VzX7MM7UboyFbikAWqzYzYHPrQEEMW/IHEcvOVt8Pvq7TnsZOet0W
	 h8Nj8dVg4gvkaRxSah5Rms/DtMFU3SR2b3yNk7zTGUM8QDW48cqMT1EJNlZCbpvcXmaeG
	 LBF+CQnTe7vxV4t5680CyA1wsG0mZPbRSaqy+soowYI/LZ7wx/pAka5XQjxTcg7G9JyWm
	 Z65QZA1TZY0Bddz81kodZBrkGaQahUKBNdAQJh8ZJHVokNCqj613McNyeSjheNclnUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW5+p7Fa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B3606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3B3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW5+p7Fa
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9908c849564so587324241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793646119; cv=none;
        d=google.com; s=arc-20260327;
        b=Z30qvq5KzZ8AbyinsNuj9Cw5SbqjtnfZmyqorvAfsOJL3VizKx1gxwK9/YQNYavlMd
         7PYxNLEeIJz+82t+nRnbVpXsLZJG8ulYMSCwKW+szIPpTHQojyPeAd2SSIF/egv42wTJ
         nWuHvWt7Bdgn79r2oWq2Jz1/MU2Pc65NBoXVxAYFJ71TtE3+u2e8SOw90RlBWIzGa7I7
         lVetuZ+hN5OS1pcWrZtULp6KZ/X+9sSQgQyrQ2zIEIyIji1M54ET4Rvu3mJWMK7xKj10
         kQN+Ut3s+XQK9j00Oapr7cEUxShIxpRUCTXj8x2M3AIPyWDhg/y+FeEVU1h4VmMijBQ6
         VkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        fh=6eMFdYBDP/FgAJiBJzzLA0Bgu88pKwkjkWhUjy2VMbc=;
        b=Xe3sjnCM5WDLPfhxwPdPamUeZSHJw80rIAqn5qy1EKtqmNiKpX/hy5XEcdzRi9+wiY
         MRadfrn3oOdgXrOH2cYBbM1liy2xWhoiga5N32mv95erRNVdC+MwnI+OM9el1v5gSUyP
         mEzjQWc7gzMGFJn2+LCyk3GVfNMvQoEXRb0HyyCJ5oamcQB7NOXTKV4C4DSb20Moq4S8
         367u1IDUp1waru4ZzHJRBSHEkGpucbMOiMCjSuUYR0HjZ0PCxkO+8R6OgjeGuGdYIxIc
         vuELbdsGLO4qL/MN78OcLi7726SLykE87Q5JSji+nQhYEhMtuNFCJpQJgS52NMMTGyvg
         fFNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646118; x=1794250918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        b=IW5+p7FaTuQIQM9be1t94KR4sm4ONHEdDbfugYIUo+Ow9/4JEpewLFNnChwWJVGidR
         x7OLyeV4RUsH7kyOXQgNRAR+WW9p44x00GRPTDDVgkrTCmZtPjYwPSdbPsP4Lh49Fx43
         f85JOmKh4666QwwTdhTziWpbNBRSdNQbZxn+vbJhDLQF2UWksc2/8vSgAb3D4VQyQl3d
         usPsQyXk4AbjqG3kRRnaiFFXA5TstqgQsKgHJPvkFiDkDdjXxa4Xh8IIK6QLFPEgbDkj
         gmzdT3+9flCyMQRGbwW1Y16iKQmclAQBGGYJFiILbanQUiJapl6mtflnTo88A7J+soG3
         3j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646118; x=1794250918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        b=AcQn3HOr4ubL8nUW0489TkbC5I5sGk6Dol0vdAQ+NwbXqFpddaBHHBoaA+NXeHYJoR
         OvE7QQxGm34Up4kazK9MUPoklkruX1rNQflTKA0ZDwGAikns+7DUFJhGPLV8uX1ySaYO
         h8mXIuSVdHflqPof7vZzBxbVTog/WOrBCsYwQM7a/HdQuFPpdDmtVjRd2snEKdu1IJJW
         lcH5QKqcpcnRjwQFgZ8IHtgOAddEfvPUcHBvlQlCiwcZQ4dF+IoRbaYUq9e60yQaBVH0
         uWQPYS7TDysdRz8YPVaBFbHz3tKBxOYGAYBLsKdUQ8l33so8X6zJdADxtm4jphn+JZEH
         V1Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzBVFGr5D4/OLpYm6xbF40xqQdilzJCyK0NJ4R9N3ua+Tyoz9QKWhEew+vBXlcsU4Dk0v8E2UmyCbn+DyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YesbNt6AEuDuTUtHvSrM9RkzsvyWefwP15TXHOVtaHQ73WwXX
	IuXfQEjaUwf2d/DvPRSLAR/H0pOx5PB7XpKVcG5HZXBaTrzHX8HqJhHBcrEp4g3et9q9Bhzki8j
	KCwmivMOCD7Uwpt6/6h0I5GTe+hOt7z4=
X-Gm-Gg: AYBFou0D0R/TpdfmCWh75OANVNWR09io9KDzRNMpES6PnhgsqWV0mgD4ziH5eDp2q7c
	XO2RHSjkOV1fSBZjcHOAGsvu3gFZv2sbwP3EwuWxkrAJln7othOT1/51Os/Jc1Vm0ea29TR7u7s
	rz9FFfaHBd8b2SyD9PKf8s/NIDIxQ0XqNhMwp/QIY069btdwj7nggJADJcse3t6vsnmfv/S9TNm
	cD6kO9tZLysDxgy3NzPb7hqvVAl2z8wjF+p38JuI/ivrm/aDm1MGUmnMRJQcNYs16Sc3Jnnkstt
	KnHJILSQCOUV9BRR+SgPJy8dVUq5a88/N0OA7G2RslMI6jmMzS0wFOGH6/Wru/opGcCMkSa3Irv
	eVAMiOHxGV7GtRLrmkUfoVGcKjc+kUUp+kKwLoY6I9Ir3/KEHXbPKcfo02ejV4SDQCxjotltLqo
	GNKFQ7VL9YnTZUoLHjjWGGFFpuKX2R0It0eSjwpJM1djWaKOzpckbqXOzFOG5rBnCsL6jSy6sXZ
	fQurKZpp+z4u9x7jtk81vG2xTRZyA==
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr4192494137.13.1793646113500; Mon, 02 Nov 2026
 11:01:53 -0800 (PST)
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
 <20261029222734.3086943-2-rrangel@chromium.org> <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
 <20261030173635.2186490-2-rrangel@chromium.org>
In-Reply-To: <20261030173635.2186490-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 Nov 2026 12:01:42 -0700
X-Gm-Features: AclHuK8hePvnISH49dlVrc4mCThAhAMYZDLctOcSiiJ-Xdrwl739zXGlDWt75pI
Message-ID: <CADvTj4op-tFqWmtzOQnt=q9aZttaWngYXLjfXEkdqcLirTMoXA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Raul E Rangel <rrangel@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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

On Fri, Oct 30, 2026 at 11:36=E2=80=AFAM Raul E Rangel <rrangel@chromium.or=
g> wrote:
>
> On Thu, Oct 29, 2026 at 6:35 PM James Hilliard <james.hilliard1@gmail.com=
> wrote:
> > That is the current behavior. Returning from shutdown allows serial
> > core to free the TX buffer and removal to release the callback
> > context. The retry loop prevents those releases, but a permanent
> > termination failure blocks teardown indefinitely
> ...
> > Retaining the buffers and channels does not preserve the complete
> > callback context.
> >
> > The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
> > embedded in devm-managed private data, which can be freed after
> > unbind. The registered 8250 port slot can also be reused. Retaining
> > the DMA channel does not prevent either operation.
> ...
> > Clearing up->dma does not stop hardware accesses. After unsuccessful
> > termination, the channel may still access the UART FIFO, so reopening
> > with PIO can introduce concurrent FIFO access.
> >
> > A hardware-specific stop/reset sequence could establish quiescence,
> > but its implementation and effects on other channels depend on the
> > controller. If the channel cannot be stopped, quarantine also needs
> > to preserve callback-context lifetimes and prevent unsafe port reuse.
> ...
> > The current callbacks fetch p->dma before acquiring the port lock.
> > A callback can therefore retain the old non-NULL pointer across the
> > assignment of NULL. Checking that cached pointer does not protect
> > its backing allocation from being freed.
> >
> > When termination returns an error, dmaengine_terminate_sync() also
> > returns without calling dmaengine_synchronize(), so callback draining
> > has not been established.
>
> Those are all good points. We added port reopen and a `NoConcurrentFifoAc=
cess`
> invariant to `Serial8250TxDmaV8.tla`
> (`Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg`), and TLC immediately
> confirmed your point on FIFO contention: clearing `up->dma =3D NULL` and
> falling back to PIO when reopening after a failed `dmaengine_terminate_sy=
nc()`
> violates `NoConcurrentFifoAccess` in 7 states because the un-terminated D=
MA
> descriptor can still access the hardware UART FIFO concurrently with PIO.
>
> We can satisfy all three constraints while still preventing normal `close=
()`,
> `hangup()`, and system `suspend()` from hanging forever in
> `TASK_UNINTERRUPTIBLE` under `port->mutex` across the three lifecycle edg=
es:

Keeping the DMA state intact and refusing PIO reuse addresses the earlier
reopen hazard. However, implementing quarantine safely requires changes
beyond retaining the buffers and rejecting startup.

For example, serial8250_do_shutdown() clears the FIFOs and reads UART_RX
after serial8250_release_dma() returns. Those operations also need to be
excluded while the retained channel may still access the UART. Close and
suspend subsequently enter power-down paths, so retaining the allocations
alone does not establish that either transition is safe.

There is also a serial-core exception to the proposed reopen contract:
startup errors permit an administrative open for CAP_SYS_ADMIN. That
allows reconfiguration paths which can release port resources. Returning
-EIO from the driver startup callback therefore does not by itself
enforce quarantine.

>
> 1. **On `close()` / `hangup()` / `uart_suspend_port()` (`serial8250_relea=
se_dma()` & `uart_free_xmit_buf()`)**:
>    - Bound the retry loop in `serial8250_terminate_dma()` (with a short
>      backoff rather than an unbounded `msleep(100)`, guarding
>      `if (dma->rxchan)` / `if (dma->txchan)`) and release whichever
>      channel(s) terminated cleanly (`rx_ret =3D=3D 0` or `tx_ret =3D=3D 0=
`).
>    - If `rx_ret !=3D 0` or `tx_ret !=3D 0`, **keep `up->dma` intact** (do=
 not set
>      `up->dma =3D NULL`, including in `8250_omap.c:omap_8250_shutdown()`)=
, keep
>      `dma->shutting_down =3D true`, and retain the failed channel and its
>      buffer (`dma->rxchan` / `dma->rx_buf` when `rx_ret !=3D 0`; `dma->tx=
chan`
>      and mapped `dma->tx_addr` when `tx_ret !=3D 0`).
>    - When `tx_ret !=3D 0`, explicitly call `uart_xmit_block(&p->port)` un=
der
>      `p->port.lock` (`state->xmit_blocked =3D true`, since `xmit_blocked`=
 is
>      otherwise only set when `uart_flush_buffer()` ran prior to `close()`=
),
>      and in `serial_core.c:uart_free_xmit_buf()`, return early under
>      `uport->lock` if `state->xmit_blocked` is set (without clearing
>      `port->xmit_buf =3D NULL`, resetting `port->xmit_fifo`, or calling
>      `kfree(xmit_buf)`).
>    - Because `up->dma` is not cleared and `struct uart_8250_dma` /
>      `struct uart_8250_port` remain allocated on the bound device during
>      `close()`, `hangup()`, and `suspend()`, any callback that was not
>      drained by `dmaengine_terminate_sync()` safely loads a valid `p->dma=
`,
>      observes `dma->shutting_down =3D=3D true` under `port->lock`, and re=
turns
>      without UAF=E2=80=94while `close()`, `hangup()`, and system `suspend=
()` return
>      cleanly without hanging in `D` state or triggering `hung_task_panic`=
.
>
> 2. **On subsequent `open()` (`serial8250_do_startup()` & `omap_8250_start=
up()`)**:
>    - At the very start of `serial8250_do_startup()` (`8250_port.c:2356`) =
and
>      `omap_8250_startup()` (`8250_omap.c:724`)=E2=80=94after acquiring ru=
ntime PM,
>      and **before** clearing `up->dma->shutting_down =3D false`, touching
>      `UART_FCR` / `UART_RX` / `UART_TX`, or setting up IRQs/timers=E2=80=
=94if
>      `up->dma && (up->dma->rxchan || up->dma->txchan)` is still non-NULL =
from
>      a prior failed termination, retry `serial8250_release_dma(up)` first=
:
>      - If `up->dma->rxchan || up->dma->txchan` is **still** non-NULL
>        (termination still failed), immediately return `-EIO` and **fail
>        `startup()`** (do *not* clear `up->dma =3D NULL` and do *not* fall=
 back
>        to PIO while the wedged DMA channel may still touch the UART FIFO)=
.
>      - If termination succeeded on retry (`rxchan =3D=3D NULL && txchan =
=3D=3D NULL`,
>        which also unblocked `state->xmit_blocked`), reset `xmit_fifo` and
>        proceed with normal startup and `serial8250_request_dma(up)`.
>
> 3. **On driver unbind (`serial8250_unregister_port()` / `serial_core_remo=
ve_one_port()`)**:
>    - Driver removal is the *only* point where `devm`-allocated
>      `struct uart_8250_dma` and the `serial8250_ports[]` slot are about t=
o be
>      freed/reused (note also that `serial_core_remove_one_port()` at
>      `serial_core.c:3336` only calls `uart_shutdown()` when
>      `tty_port_initialized(port)` is true, so if the port was already clo=
sed
>      with a quarantined channel, unbind must still drain/release it).
>    - Restricting blocking termination wait to driver unbind (when a chann=
el is
>      still active/quarantined) prevents `close()`, `hangup()`, and system
>      `suspend()` from ever hanging the kernel in `msleep(100)`.

This looks like a useful direction, but it introduces a broader lifecycle
contract across serial core, the individual drivers and power management.
In particular, suspend may need to fail until the hardware is quiescent,
rather than succeed with a quarantined channel.

The current retry loop still allows permanent termination failure to
block teardown; changing the backoff does not resolve that limitation.

Would it make sense to address quarantine separately, with that
limitation documented explicitly here? I would prefer not to fold this
larger redesign into the cancellation series before those paths have
been worked through.

>
> We verified this quarantine + `-EIO` reopen contract in
> `Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg` (`AllowReopen =3D TRUE`,
> `ReopenFallbackToPio =3D FALSE`), which passes all safety and liveness
> properties (`NoUsersAtFree`, `BoundedTerminateRetries`,
> `NoConcurrentFifoAccess`, `QuarantineImpliesXmitBlocked`, `ShutdownProgre=
ss`)
> with 0 errors:
> https://github.com/ismell/linux-8250-dma-tla
>
> Thanks,
> Raul
