Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728490;
	b=CGfvIdQardfdmm5zHB0ay+FTPxBtpFCwHLBJKmJKXqJ4aiasSzn4569jqIpXr/QpPZh9
	 wNKGpFgJtlyxmPh/Vfqih2XClACPFiuVjZHPC5qZ4URqAT7JqvANy0gCcLQTzCdPTIUCX
	 Lg7Ol4yXpQJQloAzFfH4vF6a2mv4kgEY7cg232bMsBb3M1gHbE6shc3xuetVPEsYHJtHG
	 7DELNlzyT33gR0co1QnnbHAO+9YsW+s03e7h0Da5F2gcax1TnRu8ZbVMm/WIPUP7rybil
	 9jjaSGLN4nOBoUS6do69wATwoZq0vL5cwvOsd9MC2/hNoI5QHaAmxAyIbo9AiSm7Bfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
	b=t7juUUdh11HsyC8HZrC2GSlQqCUHjSDrm6+6IpNKzKFRt0gsFO6YudCTP7LVNVyBI1Wa
	 45QGjfK9mF49NEnjSdUS4wTNqfMb0AwHDexRnqZn5w7syCcLb1QGyQ7dJGHuLDUjekafJ
	 ciaTnyeRzIXhw4Y6tnBvv8RcXpF0zfYZi4FySu8Hf2HaI/C4AAlXR+Kjhrw8jz+XT8ewP
	 3I8eVWRIv6mjviKoAEm7BiPVQs3jPsliyZkdVO2IIPrfsoG+RIEQO5E7fb4T7cGSTC7uB
	 0C/QHNkY8PsJQnrdi3+o2HecrxL4aoulsn0B6cXaZtynRiRVs0r9Q1QpVvpHDPyTE9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rm8Q1R2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861B606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5861B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rm8Q1R2K
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac4855401so1774552e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728489; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKgDQzfZ3tVOdKKN1sRR3LRl17+UsZDw5hLFCxuAm3lzrhQoTizEdL44Ts3FXENFpp
         WpPhhnIT79Z5o3wm0hfJVz03yZW9qZ6/MzLPCoKuhDD72bvgBk1/DXx8rpixaE5Gs5kf
         Z1Uw91oJEOAPjvYbIcV5gsj2b67Y0qDaD7nnE3jSoTy/S90upCq15iC+aT93CjO6O/so
         oOMvyeeBwaAC/FqPFZ7sCeBaK3wZ3iIjRzc2nObPhAwf/EL2sNLIn6hglvvfynxnVmBS
         WNcqRUqKNlEoQXG8BqpETaCk+K8wEHH6COKFCyYsjOegxifJmnbUqHJTyi5xfbJPxFOn
         GvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        fh=XtJsbsS6C97WG10RnH8CNgm1XHSVEtZN/YAqqiiw+wA=;
        b=CEjoEDTmnmfZqTzfmIfgaRzT/0QWZlY/T1M+17iuQeC/qzk/glsMPT9BRErifeq+UH
         Px19h3Yjv1cQ85f6cO80kfuLR2fjxPhqU17ZTB6SwEDyZ1ZwbNBqFmTzNnk1036PsO9V
         WSNh6oU8P/L/W9SNldhkuqC/C8vpdJCNkq34mZ1ZBI2F6xkgWPQWra0zVSg5PYjbozYd
         ycWJTlc3Kjs1iareuZBppHIym4SL8qaLFZNUlr/dty5ioiS6w9fcuuVhP9gouwgm0CAt
         stpmzsFVPS2cBXTbtCdf+BFVBnOhDPUO37fdCB64j02sRlXgBkswKDjReBkxSWMkGWjS
         hN9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728489; x=1794333289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        b=Rm8Q1R2KU2FCt8pQT5nHvLIBKRrY8F2T4QDWXyM7jymrUkgNV4QXLM7e8LcT5afTZy
         bqJfBl8hvZAZe/2p31GJMjcSEETfT46LljYiwnOezN8CxWUHK2slrUC3mkPcT6LRSsKR
         2y/2itzKpPw2dh8H3iysk7uvVeS7sm3NLh8gtidKAvA6elTS/pbMc88dnClaQidD+Tp2
         4YIGrtjaubkI0yVD+z80rUmXh0gqsO/cxis3dxjS8cDchBafkdxI4S6VrzueFy1gXmH7
         MuRvmiknLBvJEB2q7+atGp8eT43r6lSr+y0FzUjIyuusjTKWgwF3xJOIrAie/pJSOcWL
         UZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728489; x=1794333289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        b=bHzdWhRBflEkifIbpNZ/pFSdlSm6D/J+kaGrjUebIn8PfmcGnTQGKa8/oZjxK+MEIZ
         T1OPrfZWc8OyuAAcn34V4z0K8hjUO0CLLKbjLs1F9Ebz02peVTjZKaP0nfNxgbJjevJ1
         2Y11YtUqGGZmvJJfkN9mFZ0QeH3zheK5m79NjRbd3Rbehk9lFykGfRtdI18oo245l6Pm
         j0TRjGoZjCHX7tMVFGmy+FTCebGLJ27w/ZRi3v756QgyNkGEDhSCW6+/bcreRZj6bxXc
         9fOQR8JxIjr5eBnocko7jcuRV+RBVYGT5Dhx9Ys5y0yIYkcBAK9cj+oiMRh/K2x57xSl
         JkPw==
X-Forwarded-Encrypted: i=1; AKwUvBzj1+fHBzANH7ohBNkVRCfsW/k47J4Z4nIPNQB6rJMx6Sn6bBE/yPK8LuPmE7YWl9e1owzfFY7N9ZpxKes=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/zXkepw/q/AWVtVQ0kWHQuxh0OjoAPiyj5w6lYEGIsTFQsdr0
	6oZMcnLD9q4AgvkOMsihwCGVP3q+xX/+uVrH4q7CVBbiNtLDIbR6l8B5uZ85LKDLAjRH66/YUKH
	dHqpW8LY06IZ/D65A7bfu6mNVHrvVnwo=
X-Gm-Gg: AYBFou05zN3ghYstSZjLRiH8QAve8EozndKwG9zpa9GyDBiiUdFAe4vk56O9TmjS3HY
	PPXnhGTIcgKAF6DBxKVmP089MJuCNqgWa9bvVoc1JiNfdLiT3W5Axfx0luCraU8oRS/YFz7gmyh
	qi1kCFeOCWSGnDqbG7oqzHugjL3hbZf+taNQlACCaDJhQhzhpi4DxyCyQSb5YkVvsaSx/2+pZTM
	QmMu1+6zLpnMQ+GPopemsO0VMuS0hDRW+rr5AOpRU8WFRqoRp5iVt+qFs/gH9CrDfQPHC/0mjP3
	fLsOM5jxm3958ogsjQh2DYEHvGQVD87s+OxBLH/CFeZY04NLHJbilKPt8HgKgoKrYgacQckjHP1
	v6zK1N2z9efvra6ao+5dSMz0JvcTSi+Vq0oNhuLgWrkUPgzNHarUjsne3zW3bbQtIJAR3DKlY9S
	L9WD9GM4xpGArvl6T99d0as0n3G6ARoEf4jicrWXmSBuMIw0B5pPUUEVPfImO0qrWSs1vmNKiFl
	keBt5oaSUaFoGXCr7T8Dq8U7sMjn0o=
X-Received: by 2002:a05:6122:4697:b0:5ea:fae8:e69e with SMTP id
 71dfb90a1353d-5ec688311c2mr6169989e0c.11.1793728489195; Tue, 03 Nov 2026
 09:54:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <auoa8OWBxqaQuKRq@ashevche-desk.local>
In-Reply-To: <auoa8OWBxqaQuKRq@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 10:54:38 -0700
X-Gm-Features: AclHuK9I_c4PO4aR4qFDRCjbioBe9CFVnX4O6YbacRovHX2KesJOnpsJ16Nbm6g
Message-ID: <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
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
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:
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
> > transfer concurrently.
> >
> > Start pause retries at 1 ms and double the delay up to one second to li=
mit
> > CPU use during persistent failure. Sleep outside the port lock on a tim=
ed
> > waitqueue, with completion and shutdown publishing a wakeup under the
> > same lock as the worker's retry check. This also catches notifications
> > arriving just before the worker sleeps, avoiding a full backoff delay
> > after completion or during shutdown. Reset the delay for each new flush=
.
> > Report a stall lasting at least one second once per flush, rate-limited
> > across repeated stalls. A provider which never pauses or completes reta=
ins
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
>
> ...
>
> > +static inline bool serial8250_rx_dma_running(struct uart_8250_port *up=
)
> > +{
> > +     return up->dma && up->dma->rx_running;
> > +}
> > +
> > +static inline bool serial8250_rx_dma_recovering(struct uart_8250_port =
*up)
> > +{
> > +     return up->dma && (up->dma->rx_pause_pending ||
> > +                        (up->dma->rx_err && up->dma->rx_terminating));
>
> Slightly better formatting is to put some line breaks.
>
>         return up->dma &&
>                (up->dma->rx_pause_pending || (up->dma->rx_err && up->dma-=
>rx_terminating));
>
> Alternatively
>
>         if (!up->dma)
>                 return false;
>
>         return up->dma->rx_pause_pending || (up->dma->rx_err && up->dma->=
rx_terminating);
>
> > +}
>
> > +/* Keep the desired enables in up->ier while RX DMA recovery masks har=
dware. */
> > +static inline void serial8250_out_IER(struct uart_8250_port *up, u8 ie=
r)
> > +{
> > +     lockdep_assert_held_once(&up->port.lock);
> > +
> > +     if (up->dma && up->dma->shutting_down)
> > +             ier =3D 0;
> > +     else if (serial8250_rx_dma_recovering(up))
> > +             ier &=3D ~(UART_IER_RDI | UART_IER_RLSI | UART_IER_RTOIE)=
;
> > +     serial_out(up, UART_IER, ier);
> > +}
>
> ...
>
> >       struct tty_port         *tty_port =3D &p->port.state->port;
> > -     struct dma_tx_state     state;
> > -     enum dma_status         dma_status;
> > -     int                     count;
> > -
> > -     /*
> > -      * New DMA Rx can be started during the completion handler before=
 it
> > -      * could acquire port's lock and it might still be ongoing. Don't=
 to
> > -      * anything in such case.
> > -      */
> > -     dma_status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &=
state);
> > -     if (dma_status =3D=3D DMA_IN_PROGRESS)
> > -             return;
> > -
> > -     count =3D dma->rx_size - state.residue;
> > +     size_t                  count =3D dma->rx_size - state->residue;
>
> No need to put too many spaces between type and variable name.
> (Yes, the first one will be left untouched.)
>
> ...
>
> > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > +{
> > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_8250=
_dma, rx_flush_work);
> > +     struct uart_8250_port *p =3D dma->port;
> > +     unsigned int delay_us =3D USEC_PER_MSEC;
> > +     ktime_t start =3D ktime_get();
> > +     bool recover, retry, restore_rx;
> > +     bool warned =3D false;
> > +     int ret;
> > +
> > +     guard(serial8250_rpm)(p);
> > +
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     /* Shutdown cancels this work and drains both DMA=
 channels. */
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     /* Serialize reset with completion and shutdown n=
otifications. */
> > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     if (retry) {
> > +                             ret =3D serial8250_rx_dma_try_flush(p);
> > +                             retry =3D dma->rx_pause_pending && !dma->=
rx_terminating;
> > +                     }
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             if (!warned && ktime_ms_delta(ktime_get(), start) >=3D MS=
EC_PER_SEC) {
> > +                     dev_warn_ratelimited(p->port.dev,
> > +                                          "RX DMA pause stalled: %d; r=
etaining transfer and retrying\n",
> > +                                          ret);
>
> _ratelimited() is a slop of AI without understanding the code. It makes n=
onsense
> in combination with warned.

The two controls have different scopes. warned is local to one invocation
of the flush worker and prevents repeated warning attempts while that
flush remains stalled. A later flush starts with warned cleared again.

The rate limit applies across worker invocations and UART ports. It limits
messages from separate stalls, rather than repeated retries of the same
stall.

>
> > +                     warned =3D true;
>
> Altogether NIH _once().

dev_warn_once() uses a static flag at the call site, shared by all ports.
After the first warning, subsequent stalls would remain silent even after
recovery or reopening the port, including stalls on another UART.

The intended behavior here is at most one warning attempt per prolonged
stall, while keeping later incidents diagnosable and limiting their
aggregate logging rate.

>
> > +             }
> > +             /* Notifications also cover completion or shutdown before=
 sleeping. */
> > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->r=
x_pause_wakeup),
> > +                                  ns_to_ktime(delay_us * NSEC_PER_USEC=
));
> > +             delay_us =3D min(delay_us * 2, USEC_PER_SEC);
> > +     }
> > +
> > +     if (recover) {
> > +             ret =3D dmaengine_terminate_sync(dma->rxchan);
> > +             if (ret) {
> > +                     /* Retain ownership and keep RX masked if DMA can=
not be stopped. */
> > +                     dev_err(p->port.dev, "failed to stop RX DMA: %d\n=
", ret);
> > +                     return;
> > +             }
> > +     } else {
> > +             dmaengine_synchronize(dma->rxchan);
> > +     }
> > +
> > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +             restore_rx =3D recover || dma->rx_pause_pending;
> > +             dma->rx_pause_pending =3D false;
> > +             dma->rx_terminating =3D false;
> > +             dma->rx_running =3D 0;
> > +             if (dma->shutting_down)
> > +                     return;
> > +
> > +             if (!restore_rx)
> > +                     return;
> > +
> > +             /* Apply the current enables, including any intervening s=
top_rx(). */
> > +             serial8250_out_IER(p, p->ier);
> > +     }
> > +     if (recover)
> > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> >  }
>
> ...
>
> > -void serial8250_rx_dma_flush(struct uart_8250_port *p)
> > +int serial8250_rx_dma_flush(struct uart_8250_port *p)
> >  {
> >       struct uart_8250_dma *dma =3D p->dma;
> > +     int ret;
> >
> > -     if (!dma || !dma->rxchan || !dma->rx_running)
> > -             return;
> > +     lockdep_assert_held_once(&p->port.lock);
> >
> > -     dmaengine_pause(dma->rxchan);
> > -     __dma_rx_complete(p);
> > -     dmaengine_terminate_async(dma->rxchan);
> > +     if (!dma || !dma->rx_running)
>
> You introduced a helper serial8250_rx_dma_running(). Use it.
>
> > +             return 0;
> > +     /* A late interrupt must not hand a still-active receiver to PIO.=
 */
> > +     if (dma->shutting_down)
> > +             return -ESHUTDOWN;
> > +     if (dma->rx_terminating)
> > +             return -EIO;
> > +     if (dma->rx_pause_pending)
> > +             return -EAGAIN;
> > +
> > +     ret =3D serial8250_rx_dma_try_flush(p);
> > +     schedule_work(&dma->rx_flush_work);
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(serial8250_rx_dma_flush);
>
> ...
>
> >       /* Manually stop the Rx DMA transfer when acting as flow controll=
er */
> > -     if (quirks & DW_UART_QUIRK_IS_DMA_FC && up->dma && up->dma->rx_ru=
nning && rx_timeout) {
> > +     if (quirks & DW_UART_QUIRK_IS_DMA_FC && rx_timeout &&
> > +         serial8250_rx_dma_running(up) && !up->dma->rx_terminating &&
> > +         !up->dma->rx_pause_pending) {
>
> Re-wrap it logically (also be consistent with parentheses
> when & versus && is used).
>
>         if ((quirks & DW_UART_QUIRK_IS_DMA_FC) && rx_timeout &&
>             serial8250_rx_dma_running(up) &&
>             !up->dma->rx_terminating && !up->dma->rx_pause_pending) {
>
> >       }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
