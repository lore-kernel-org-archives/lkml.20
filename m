Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312864;
	b=5DRUM791Yc0i54Oge9L7+QsbjAJkhDMLn8MMKivumHo4OQf0TX7iTB1wRteu4D7R4eti
	 fSohIEtqRrZbwhxER8s1GMTQ+4A0AoKS7VKxNc+9Lgu+mrcqUDWchxDcmDznUdzdY7/90
	 0PO1X5venC/+JJmpcnw+T0JoAAiF+y4POTHtdHyhDHAAYtAmAnUnyA9c8JP7Ny5wSId5S
	 6piBhpyhiOJ2UOAEKV7XADV31Ow8a+g1JTFprSjwKc1O6U06hduo8FU6TkphWAjmNigjL
	 DuCnUuuulhZUAqrKffFmADZjFJs9h6Kwone6JtZkWMzuVmO/AvQP5bCBsvA55ZwcVQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
	b=IJPyHmhzV+/aLtSFhe+NVsr49/gIeTjgOmM/tQQn7Tw/5R2MRnXafARR0o7oARVOc9/0
	 mfLNMWIg0sUpUiGgpKK6ke3y1Byy3M6rMWyMkO7WCvKfKBpfSdr9CkFR2dzryKnoOtljk
	 3CcryDPH5tpo4YHe6s/W/JEGZcxlqaDVeirFIEvxsPmgDaRt2AM+5ow7I9fmaYKSO58rl
	 3j+khmIPUZ/6y9MfgRt2czJDUYVtft3zzru0mokDRHvAIE5DAaqNVTsLJxAdiW7I8f5Pz
	 jPSZZJNwQM1XKAGuHr1UGkyn4oyisyqutGHbGNAgkZd/XCYmLHohmxJTY94Tt24y/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LgbIvAP6;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A0606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505A0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LgbIvAP6
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-844a8bf7e25so108515a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793312863; x=1793917663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
        b=LgbIvAP6Xc+OIRRd087wBSrpkSpFf5dO+GjsHu/al6RAz98XL7Uy6xc+47Xjk0sgw7
         19tUaKX0LpqbEddYjEgqYwjLX/uAMwPqCJ1FekM38Mrg3PNoTnxo1j11ktpKfsjW0iRJ
         pe+lAAr0XU8xkbm6SoBK6bfsX+zlXINoj1vpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312863; x=1793917663;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
        b=P/rMRS7rQFzLpk9Ox3e2lVRHEpK9kpYNw7SBi5hm806bV+g1CWx5sYuHQ72UioTxYi
         0SiHJBWHvMplytTNlfbjtVuqGRV9Af9FZ6trKGp2gCphlBF2eJBg5RCSZPPmz/qb+x7O
         5Fn8LbaQGa4emSQd0xgzQY6YHrQtFeDUpFj61EMlYG5KdswrRdpuw7pd8/lnYeeJlnIZ
         +wDXC0wAZp2ngwLG4K3ngnZT/H9t/+DZrzUgY4DIS5e8nu12VMHwEL0ohyRbn81CUegJ
         nJDMDtItCnD+FFp6LRL+S1PadyunehBHOwe9Ap+P6qrAIdVgM1vjAZy3BuaRgo//lpgg
         GyRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/PhGNnWrn8zmQCTBIqhQdy6eDzqF2OPHAsz8ZNQkYyujG6jOQzXKwqnCjseEGyik79Bd4uweLJnAshLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc2wTo013T18AyUG9rqSb3d6mFw9YIrkrVtLE1TaErdR7h9U2h
	W0xu+x9T5LH6vGyVIoWmxwo3Fi5xHh4RZmd0b/i7/9bIUEEiEl2KOzm8vTLHNwRUSQ==
X-Gm-Gg: AYBFou2YkiMxPxWzFkzueHBtYbzqtXiDQt+P9RtQ8fJ5gDvGcKkp+rRb3Pv52pzQuGl
	3cE0Z5Mfqzxpbyl02QJjdPdDqtHeRBD6nId3dnoA14BElVmqGewMphJ7DjX1cCbrbIUUZNZHaR2
	PeMv0mNWLgyDdLCHzTxcURoKx4ggGQy6k6Ru+88NfW/oDX4AbkjO5AVaQkCFWg6vTrOeHpvBWMa
	w+9SplHlpm/BkKArC7XF07OzsXUPd8M6y2D+qbabW+b8s5F36Wibv2ErFtTOsuR8VvG4j84dH1L
	gxKqs+mBq5OniG1qEmmEThVO2RiXoSV+bPJTUQLXWSSS09LX6FqfBIiJJcxouNSzpCZj7dbtsp4
	B4lDjBtGWyXOYrt2sMRvndG1+zL7StbNaAqxEIHrGLKjV7PHipElupcoUa4e6LGw090tot61ibr
	Z2XPdfC1R6NmWZrxvtNRLN7aH5Ipbw2cSBYAY08JNuYuGTUMBAhyt6xvopJ05P4wKVDh5x35B0b
	/wAm28dcbE0H00kNORFiiZoDgPjF+940toxiXsTV01hEdDwr9BFUlkxBK/Hz9io8yeyNTfp+Z1t
	pESiWzLCAge0ZJgrJ8z80hbzga8u01ZF2F6ICtyw31quN6e1VdRcvzWEAqYonbbT584okDEOAnG
	Sh8md+LJSqnhndEM=
X-Received: by 2002:a05:6830:25c6:b0:81f:827a:b1cf with SMTP id 46e09a7af769-85d3644f500mr541370a34.22.1793312863265;
        Thu, 29 Oct 2026 15:27:43 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm718163a34.6.2026.10.29.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:27:41 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination fails
Date: Thu, 29 Oct 2026 16:27:34 -0600
Message-ID: <20261029222734.3086943-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Oct 29, 2026 at 11:19 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > > +	while (rx_ret || tx_ret) {
> > > +		dev_err_ratelimited(p->port.dev,
> > > > +				    "DMA termination failed: RX %d, TX %d; retrying\n",
> > > > +				    rx_ret, tx_ret);
> > > > +		msleep(100);
> > > > +		if (rx_ret)
> > > > +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > > +		if (tx_ret)
> > > > +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > > +	}
> > >
> > > Huh?!
> > >
> > > This is unacceptable. Sleeping is okay, but value should really match the
> > > baudspeed and other parameters of the transfer.
> ...
> Regardless of the retry interval, shutdown cannot release the buffers
> until the provider establishes that DMA and its callbacks have stopped.

Agreed that if dmaengine_terminate_sync() fails, shutdown must not free
dma->rx_buf, unmap dma->tx_addr, or kfree(port->xmit_buf) while hardware
or a detached callback may still touch them.

However, because serial8250_release_dma() runs under port->mutex in
uart_shutdown(), uart_tty_port_shutdown(), and uart_suspend_port(), an
unbounded `while (rx_ret || tx_ret) { msleep(100); ... }` loop means that
if a DMA provider returns a persistent error from dmaengine_terminate_sync()
(-ENOSYS, -EINVAL, -ENODEV, -ENXIO, -ETIMEDOUT, or a wedged controller),
close(), hangup(), and system suspend will hang forever in
TASK_UNINTERRUPTIBLE while holding port->mutex (triggering hung_task_panic
after 120 seconds).

Would it make sense to satisfy both constraints (no UAF on buffers/callbacks,
and no infinite sleep in close()/suspend()) by quarantining/leaking only the
failed channel's resources instead of looping forever? Specifically:
1. Bound the retry loop in serial8250_terminate_dma() (or do not loop on
   non-transient errors, checking `if (dma->rxchan)` / `if (dma->txchan)`).
2. If rx_ret or tx_ret is still non-zero, warn once (`dev_err` / `WARN_ON_ONCE`)
   and intentionally quarantine/leak only the failed channel's resources:
   - If rx_ret != 0, leave dma->rxchan non-NULL, keep dma->shutting_down = true,
     and skip dma_free_coherent() / dma_release_channel(dma->rxchan).
   - If tx_ret != 0, leave dma->txchan non-NULL, keep dma->shutting_down = true
     and state->xmit_blocked = true, skip dma_unmap_single() /
     uart_xmit_unblock() / dma_release_channel(dma->txchan), and in
     serial_core.c:uart_free_xmit_buf(), skip `kfree(xmit_buf)` if
     `state->xmit_blocked` is still set.
3. For a subsequent port reopen after a quarantined failure:
   - Remove the redundant `up->dma->shutting_down = false;` in
     serial8250_do_startup() before serial8250_request_dma(up) (which already
     clears shutting_down under port->lock), and have serial8250_request_dma()
     return -EBUSY if `dma->rxchan || dma->txchan` is still non-NULL so
     reopen falls back cleanly to PIO (`up->dma = NULL`).
   - Guard the DMA completion callbacks (`__dma_tx_complete`, `dma_rx_complete`,
     `omap_8250_dma_tx_complete`, `__dma_rx_complete`) with `if (!dma || ...)`
     so a late callback after `up->dma = NULL` is ignored safely.

That way, neither hardware nor a detached callback can ever UAF rx_buf or
xmit_buf, while close(), system suspend, and subsequent PIO reopen all
complete cleanly without an unbounded msleep() loop.

Thanks,
Raul
