Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729157;
	b=OQAok4mrPPfkC4tuIrN+NiTi1riGNVkMwN+KHn4RJr71h07l5GDmkrMexaKsd9bUa+m7
	 36BK0C85Xm9wgb3Cm46OZkFSqTRCZNT4jbTrh+TVQxY0Bf8UJzuS8Zgm5u0fxKLHLvtxW
	 LTPCzn2h7h2i4aXMfS8Jvv1AZkkY00SAZFvEHZaXVES9HNCuRCcNMG/RsKnvO3WICt8Sd
	 3/HDkpj7S/rTZ/RT/5FmXLkIPJEaYYPEVcWvZpHeJjq5Cu9P7PJywM6BB1865gb7IEcRZ
	 +SRXfPVMvjqITliZZC0HEgCqdD5rX6oz8F7H4Oszd9yhl14dnU65d+H4qGI98Ms9g4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
	b=VT9JF1/dQ1hTNNiq1dZQVE7EW7d9WYtie2Y+V03OwBVc7IoLB1xWWs04Y37LdIhxkZRD
	 h7k9OelJFgJU9F4/a21SzkBqKFotPpIX9crhdf26uKbi5Iqpr8Z2GmXO7P7b835zqtdc4
	 SKxm0v5ZiSu5cMUj631hqXmKRdIv91NXtTietvtaI6a9NNJXftomu6b9KAijlUMNPTv3/
	 Z/HdiW2Aqtjbr/lHSeg5JcqBA8blj31Y8lm4qnwQf0xqGiMwPmXPS8PnDrEdo/JDIquMP
	 gt9vwCAkDh9yt+LFH+Ecv+kgI8p20Y/yMDGNoNPtR3F0NeIxfaEpdD+qwiyIMRGJDfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBXg5HLV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AB606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBXg5HLV
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c03744ef27so1473190137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729156; cv=none;
        d=google.com; s=arc-20260327;
        b=GETiAaAtScBLGcpfiUY+kDHQKPNSXZuYsKSmxFxccKQ8Ef+rNwj6ZUaSSKcb5BlXZ+
         w/KQ6KBLk7ElElIhOIw6PvX1gWodwe+IjPRIvT7HTglBUM0r7BwJV2vXHhsOkECR7cr4
         0IpHWVV483OKEFvRF6Rjosku4diIupRYmd+Lb7IXzDx3+1LY6MAaqnTCJKUAKthEQl/8
         ykiio7YyTbLZzPhBRByjiIDUfR6wJgpjnxLyJDJSHk1+Ulir8VNHG4stSjEQHB/S3/tr
         4R5IqD7GQ3Kqg+3waZixURF4Lg03nHR71DSA8ZXy/lhMPMJnrUnff/E6AbA2NSXFPMJn
         B+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        fh=tbHGXRCMNLySTun6hQih4YL0QxODQRI9GYv2MQZD5xc=;
        b=Bkw60vmNy6QPjUX4iQ0D+bCSbrflG3Hi4GZtuysJ90EBTZ0Itx/4zJkkfbkXevZg2+
         CBtsBkpjKjme6KshJHsKwjNtb2sITowNpoLebr3kNi8zbgfslOc+/9dxG0l88WcjE7d7
         7jfHv3aVMmOpbBxLbxDTOfFzBV1OxwXbsex5wyWL+ASbq3keHsdEDukqWQ4WFzkwJhS5
         ELNtIjP7mb5dxTJzG6Pu02hG4Z19O2ZIDNmNrUK+biIfheV/x9sXgK2U3w/oa1oJiarZ
         rDd/E4i5ryp87WmOC2p4sPXsU65DDRQvYQ/G6wze1d1Nl19S1lAEixjqedBgzdC0OhKW
         px1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729156; x=1794333956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        b=eBXg5HLVs3+DnyK0HOE1HArp8LeVs07vZX8/90QXs4aNyYpremL/O+2hqZPtnY/Pxt
         afntlOfHYW5A3PQNeX1Nn0nICWejEG5J/bf59loCPDYM2t9QmhPpo9VG8TbqDjhQ9A/H
         GRmNSCNJ+hwceiMQg99yXPTWIjbZq5eUSafvD0KyaU+0YsXpil/GuuHhlZydBvt1ECH/
         VrPgrNzoAZ9iPS+z13CW2aJJs2oDtansUJq3cgqJbiI5m6dxM7QIzdbBCZN8NaZPNjR7
         5JSEawDva8Iyute9qb+55E8YDfEeKUMnmfcmiBCKrdpOjMv5Y76Zmprh3TZc9buitoW5
         brYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729156; x=1794333956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        b=igpKYA2qQ1ey7umD/1Q85tQ+RC726VsAfOflGI7/0f+2Yi3EsVQqdgDk3jZr71Xr9y
         DqKz++6y2/rxH0xMDK3TPo2lBe8pURy2/Rds0Qukywf4Jdy0ORlh3PPNdZc6dXgiISeP
         srZws9seZtnhFKsgCuzKo7WZQHRLxg/WcowXlX7vigOAaJo+sRhlrnQiqWWnLw1LiMDq
         kv713AT7nj5N2z688r9ifiSZVttyj7bztO0z73h0oL4nLGbdreoMHRcfGQ5r28+Y1PUC
         UzCBKkHqWGLMUDmKmp1IpFihtJX9V++Qw5kt8RKBsyIPz5qWgKN+1ClpW4lxec8oTTs7
         WLYw==
X-Forwarded-Encrypted: i=1; AKwUvBy0epkiIhGU2/05ZLYkCnDJT/xo3U+p+0DaZ1SAYhaQkGoM5Da4W+7i6o8unKyvyji9itVJoMm3qCZmbZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kw+dDZrqyYQSC4/zsAavjk94KQ2J6FFDte1VJhXDtO/bsY2qA
	CoDZ7xseZaV55avwst1vJG2mou2MTANBKJCN7lVDgYUzrG7j6U3GYweTWtDOAtP3vNgwaJApUQR
	UvmPekUkMlvIJSOCgNpP+9dOfsGBfxaE=
X-Gm-Gg: AYBFou1aVgfr6Qu19b0fQVL5b0D9CiwGKskZVyc3UkNoVBCzGw9QtmJ/7WSP8Sencqt
	f8E+Xb2NpB2zawGLv1IQYQey3YjlPSv2OFpqqSp57tbEw27n6NQWudLYQZseEFZGxJAYePq3ZEB
	lspSynaqEaqFECX8czrigL13zVT3osOFS1krWPQ/1Etxq0ihRICC7WGsJ3heunkhuF7i1s3HEpR
	i1svu12AntBcC1WrRvRt9SoiAjPwVBYwvzeQXhkkeQEuVnQDBt2h/jSXratqatP83pltxdNkw5o
	zR767r7eVJZHmC7PX0mqbG1RDFk0rnyjdSU5tvC753qJdkLbz8TXPlCCGisH9hxycIE4M0Ka2/7
	zprCFAsk/kT+VtCRO5JLctyJCZ58COq2KxTd+Ne9BqzYt+fFx1O06el+Dm0f3hr5aKeU2epKGRn
	Vl3hS4c+vD1CIpP005E4eirBa0PdSFjotRfkCiFcSEhf6H3AaxFCBu/Q0fYs2EyO7O32m0X54EY
	DrB5WGN/NTOUKFwsrQ1uDSDnrHmfg==
X-Received: by 2002:a05:6102:5121:b0:7cc:5c9d:7e07 with SMTP id
 ada2fe7eead31-7d072635de3mr4255291137.11.1793729155740; Tue, 03 Nov 2026
 10:05:55 -0800 (PST)
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
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <20261103161104.2449407-7-rrangel@chromium.org>
In-Reply-To: <20261103161104.2449407-7-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 11:05:42 -0700
X-Gm-Features: AclHuK8ExVfXbcYLwfHHnCvMLw6HMi1Pim5AHzKRXmfuq3AFPdi8A4knMcfIqjI
Message-ID: <CADvTj4qXcOqS-wDrrN-x3sXUQr5BtFBeGzz_wqpW8WJ1DMPg+g@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Raul E Rangel <rrangel@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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

On Tue, Nov 3, 2026 at 9:11=E2=80=AFAM Raul E Rangel <rrangel@chromium.org>=
 wrote:
>
> Hi James,
>
> Thanks for v9 =E2=80=94 fixing asc_startup() locking in Patch 2/8, waking
> tty->write_wait for drain waiters in Patch 5/8, splitting OMAP RX locking
> and IRQ quiescing into Patches 3/8 and 4/8, and adding rx_pause_wait with
> immediate wakeups from dma_rx_complete() and serial8250_do_shutdown() all
> look good. Waking rx_pause_wait under port->lock cleanly avoids delaying
> normal completion or cancel_work_sync(&dma->rx_flush_work) during shutdow=
n.
>
> Two remaining comments on Patch 7/8:
>
> 1. Escalating to serial8250_rx_dma_recover() after a bounded pause-stall
>    window on partial RX transfers:
>
>    The commit message notes:
>    > A provider which never pauses or completes retains RX ownership unti=
l
>    > an error or shutdown; a timeout alone cannot establish that discardi=
ng
>    > the buffer is safe.
>
>    I completely agree that a timeout alone cannot establish that *reusing=
*
>    or *freeing* dma->rx_buf is safe while the channel is still running.
>    However, calling serial8250_rx_dma_recover(p) under p->port.lock once
>    the retry budget expires does *not* reuse or free dma->rx_buf without
>    stopping the channel:

Successful dmaengine_terminate_sync() establishes the required stop and
callback-draining guarantees. The concern is not that the buffer remains
unsafe after successful termination, but that this recovery path discards
the pending receive data and disables RX DMA until reopen.

A failed pause followed by an incomplete status can be temporary, including
when completion has not yet been published. Retrying preserves the chance
to deliver that transfer without switching to PIO. Memory safety after
termination and the decision to discard the transfer are separate issues.

>    - Calling serial8250_rx_dma_recover(p) under p->port.lock inside the
>      worker's retry block sets dma->rx_err =3D true and
>      dma->rx_terminating =3D true (and keeps RX masked in UART_IER), whic=
h
>      causes serial8250_rx_dma_flush_work() to exit the for (;;) loop
>      (retry =3D false, recover =3D true) and call
>      dmaengine_terminate_sync(dma->rxchan) outside p->port.lock in proces=
s
>      context (8250_dma.c:233-239).
>    - If dmaengine_terminate_sync(dma->rxchan) succeeds (ret =3D=3D 0), th=
e
>      channel is stopped and its callbacks are drained, so clearing
>      rx_pause_pending/rx_terminating and restoring p->ier safely falls ba=
ck
>      to PIO ("RX DMA failed, using PIO\n").
>    - If dmaengine_terminate_sync(dma->rxchan) also fails (ret !=3D 0),
>      lines 235-239 already retain dma->rx_buf and return early with RX
>      interrupts masked.
>
>    Why does this matter in practice?
>    Look at drivers/dma/tegra186-gpc-dma.c:
>    - Line 1521 unconditionally assigns .device_pause =3D tegra_dma_device=
_pause,
>      so dma_get_slave_caps() (drivers/dma/dmaengine.c:614) sets
>      caps.cmd_pause =3D true and serial8250_request_dma() enables RX DMA.
>    - On Tegra186, tegra186_dma_chip_data sets .hw_support_pause =3D false
>      (line 1351), so tegra_dma_device_pause() (lines 420-423) uncondition=
ally
>      returns -ENOSYS. (On Tegra194/234/264, tegra_dma_pause() at lines
>      389-414 polls TEGRA_GPCDMA_STATUS_BUSY after setting
>      TEGRA_GPCDMA_CHAN_CSRE_PAUSE for 20 us and returns -ETIMEDOUT if the
>      channel does not pause.)

The Tegra186 case is a permanent capability mismatch. dma_get_slave_caps()
derives cmd_pause from the presence of device_pause, but this provider
installs that callback even when hw_support_pause is false.

serial8250_request_dma() already rejects RX channels without cmd_pause.
Correcting the provider's capability reporting would prevent this
unsupported configuration from being enabled in the first place, rather
than discovering it after receiving data. That is different from a pause
timeout on hardware which supports the operation.

>    When an RX timeout interrupt (UART_IIR_RX_TIMEOUT) fires on a partial
>    transfer (e.g. a few bytes typed at an interactive console or a short
>    command waiting for a reply, count < 4096), hardware transfer completi=
on
>    will never occur while the remote peer is waiting for our response. Wi=
th
>    an unbounded for (;;) loop:
>    - Those partial bytes in dma->rx_buf are never delivered anyway (even =
if
>      we wait forever until the user closes the port, serial8250_release_d=
ma()
>      terminates the channel without copying dma->rx_buf).

For a provider which never pauses or completes, retries cannot restore
reception. A request/response peer can indeed leave the descriptor
incomplete indefinitely, and closing the port then loses those bytes.
Backoff and diagnostics limit the retry cost and expose the stall; they do
not solve that liveness problem.

For pause-capable hardware, a recovery timeout does not have to prove
that the failure is permanent. The concern is what happens after that
timeout: the current recovery path discards the pending transfer and
leaves RX on PIO until reopen.

Is there a recovery approach that avoids an indefinite RX stall without
turning a potentially temporary pause failure into loss of DMA for the
rest of the open session?

>    - UART RX remains permanently dead with RLSI/RDI masked and never fall=
s
>      back to PIO.
>    - serial8250_rx_dma_flush_work() holds a runtime PM reference
>      (guard(serial8250_rpm)(p)) for the lifetime of the open port.
>    - On 8250_dw, dw8250_idle_enter() (8250_dw.c:151) sees
>      serial8250_rx_dma_flush(up) =3D=3D -EAGAIN and silently aborts
>      dw8250_set_divisor() and dw8250_check_lcr(), breaking baud-rate and
>      LCR updates while rx_pause_pending is stuck.
>
>    If serial8250_rx_dma_flush_work() escalates to serial8250_rx_dma_recov=
er(p)
>    under p->port.lock once the stall threshold is reached (or immediately=
 when
>    dmaengine_pause() returns -ENOSYS / -EOPNOTSUPP), dmaengine_terminate_=
sync()
>    safely stops the channel before any buffer state is released and the U=
ART
>    recovers on PIO instead of wedging until close().
>
> 2. Minor nit in drivers/tty/serial/8250/8250_omap.c:783-784:
>    In omap_8250_shutdown():
>      WRITE_ONCE(up->dma->rx_pause_wakeup, true);
>      wake_up(&up->dma->rx_pause_wait);
>    8250_omap uses its own synchronous omap_8250_rx_dma_flush() and never
>    schedules rx_flush_work or sleeps on rx_pause_wait, so those two lines
>    in omap_8250_shutdown() can be dropped.
>
> Thanks,
> Raul
