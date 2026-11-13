Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563613;
	b=WWJletKuZxRCPbcsYu9Zn8wMjoZ9SeDwMuQOousUYNwLoKY5581mzn/98IC/pGlyuGAp
	 3QXaOwuaN1Sfi+sRVbCsAmrjB/eqOExLPqzVDgPbt289QrrKGc1VL0fHbdLBKqpWcHZ0p
	 H+RgQpNmSapvYWGio1iXBOkxa74j8cJYHMGqXw02qWzV/89hEue150YwOmgQR1adq/x5m
	 rLFNbiJhSU1aHmUy/tnYgt1qgdGPoOQKMQ5ozc3znzmoMid0+3jlOPgc27zsg/x42sGau
	 dP72CPImniGfC4WsFFKTbIQTxBEdaIKYQwSc8LcInwad2a/TXE12gXlSIvktf94yrvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qxExsziECt8ywgLvcFhWH0Nwghoes8sZzrxEB40dmsQ=;
	b=RXISU/QJOq/dRdquB9BFBgG1cp2//nMZ8jxswGuX7eKPYfX5hCpzzYrF29pOYQ4sm9rx
	 SYpvQWHS1sdW8aAE1fOk0j9LCgE3WTO0hSzfTe33oGxKFb1urHxrDjncz1KxQOk9BCM+k
	 Wx2+oEfaA4TFyQn+nhXAA1IgdcM7nOO8uV3v3wt3wI5CV9woWFytF/GSXVwv9D9ea5I3k
	 /33mdL5PGNdwRrYA85Ybsq8K+QjlSpIjnIl9VLUdeBM7i58n6nRvosEECHqYLzV6JzNGf
	 u2//GfLxcsUSH6coGmNuPbnuHR/b0g3udAosiRfIHlea0ZowCoGhu/Qo1WPPP9jP1cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05jUn3VA;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E360A2606
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329E360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05jUn3VA
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a451915d8aso1141926b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563612; x=1795168412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxExsziECt8ywgLvcFhWH0Nwghoes8sZzrxEB40dmsQ=;
        b=05jUn3VAd2amZpNxI9ovaKcZd/edvDv/ECeOSMHBqG0sH/LAKPbAWUkYraFr/g52C9
         Y51LYfUmIjcK5JYTvA0cRgQ/RINM7ItGL/an6n/vifE0ITlSXXb8qiHGXQ2Urpk1Dsz2
         3fP6j9NZZQ3B8RJuhtxWlz7icBO1OVwTHJ9Yh82NWlC0nfwEICrX+mHG9wj+xsYimioX
         mpaM+1NZtVgdZCd47nO52QG/ccwrsfp2dwYFCRzOaI/k6mUj6BlZIRMeEKkJwuTT2uX3
         fwWfLP6l+goIcPYmDQnoRvfxNqkoizPoDGI5i2gDRVh98WVJ5GITOY6P6SAcXqO8UyOX
         zSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563612; x=1795168412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxExsziECt8ywgLvcFhWH0Nwghoes8sZzrxEB40dmsQ=;
        b=OC28x9fbFcTA/o6IDpHajj1js15x7wAIj7veDhChNYQG32KWo8Ki6OsLX0CUVtH89y
         M/vYgrljYSA4bEggZic99EhHqT7yKdkI+Um+XShFgaAO/Kd1sypr/iUj167Bb2ABdFLZ
         ZXwEhfR4hzG+i1Zc43LEM7NDB2wCiF5U21t8c7U01mAK63zDLTvv7y2LhVrNn9zU1wws
         YH3mGYJH56fem2NeZNXjqS7srSvUMQ0/oj58QJuHnXTnxgILvkQ/rDq/QfXKB3LI9Lbr
         d3GNiVa8JFPD1Ni1M+D1tOwOZ1jFiCvU89d2Gn75ZFZ/F7C1u6NF98M4siLAM7/cK8KQ
         s/BA==
X-Gm-Message-State: APuU4Z9Lh4ZKjVF0R0Oj3QGLaMsQQHmOB8AO/8l7Qx5z2hJSCuhTjIaa
	0HK57do4h8H1nlOeylvHYhjja6NXgCj9JbtbMbfhVrcWTROTFwi0oysM
X-Gm-Gg: AYBFou31Ybn9yRMJuQOQydyGmVOjjd52JZtHFmvPzBDVZvLtU8NKC6OEvV/yI5G75Cv
	TddAmndsiKm93vjH8KZsBM27h5PdkxpqghKXNe6JiPUED2siUzi9AveyYnw1mxUvhdF6Ci9gBzY
	ossvQsfrENlnH2oHP31NsRpmXxg49IxFsOHn9hQV6MvgxtehW8/Uw2lyR07ffCgDoNG5ZVefiS4
	F6tJb4xKSTaA6vqQDGOlFXkaam7ogHxHXzFeSFBOd4GlU3jozNEBUqwjwz92RvHU+cVDmfQ7ze/
	hGvUhcOzzbvMME4Cf0fhVrK88qkmd0BTNk1CWelMmfrxjLdExf4REq/ZawqYGlutBAq3vs9xcN4
	J77fK2B4edW8SM0p07L8EdvYL566s0XTTETS1A6Ys/D//aHqWZ4W1gP6+ovwprSRzA44ER4wRHT
	8A81rahwSBDBaVcBB/668B/WNm8NQHTNoSUaDCQMvBljZaNyABizkrSqIBcbsqSeZrEZeUfp2YU
	BjgdOTWitLD/+NdJkYqA3iZSbO18uxG6GdZDcz1fG0YY0BhnUgRFR/zNo68kV27PlZ4lse+SS0o
	mUPkKTwycIHBlLcqCRlQidPnLKw5QCf+5mMpVPb3MYSCcgoNXwI8FBtUuiFmZTgk+cGIJiHVCuR
	OCiMTHH1KDz+8C7nWEEY/ibMGWxV38N9rBITL74nlwVg7zmhUryLtyuGjMEaUYuAfXnh4Ap1xyq
	3gvWgq/o+djIrVECMevesO/i81u1P/M4BpzbOiRJ1UhJf4t2EKg+0=
X-Received: by 2002:a05:6808:e85:b0:53c:156b:a16d with SMTP id 5614622812f47-56e65729768mr1399829b6e.56.1794563611923;
        Fri, 13 Nov 2026 01:53:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:18 -0700
Subject: [PATCH v13 5/8] serial: core: allow drivers to reserve flushed
 transmit storage
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-5-b857f2617ece@gmail.com>
References: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
In-Reply-To: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

uart_flush_buffer() resets the transmit FIFO before calling the driver's
flush callback. An asynchronous DMA transfer can still access that storage
after the callback returns, while a new write can immediately reuse it.

Add uart_xmit_block() and uart_xmit_unblock() so a driver can reserve the
flushed storage until its transfer and completion callbacks have retired.
Serialize the reservation with FIFO producers using the port lock.

While the storage is reserved, write_room() reports no space and write()
and put_char() accept no data. Defer write-ready notifications until the
reservation is released, preserving one-shot TTY wakeups. Keep the flush's
write-ready notification under the port lock so it cannot race another
reservation.

Wake tty->write_wait after flushing even when writes remain blocked.
tty_wait_until_sent() waits for the logical FIFO to empty, independently
of whether its storage can be reused. Notify these drain waiters without
invoking the line discipline's write_wakeup() callback, so a reservation
does not prevent a completed logical flush from waking a drain waiter or
consume a one-shot write-ready notification prematurely.

Suppress ordinary TX starts while the FIFO storage is blocked. Preserve
high-priority flow-control characters, which use separate storage.
Releasing the reservation wakes writers through the existing TTY wakeup
path. This preserves immediate logical flushing while applying write
backpressure until the storage is reusable.

Track port readiness separately from DMA ownership. Retirement releases the
reservation even during startup or shutdown, while writes and wakeups stay
gated until successful startup or resume. Reopening or restarting a port
wakes deferred writers with either a new or retained FIFO. Restart queued
output when reusing a FIFO after suspension. Keep its write-ready
notification pending until the retained output drains below the normal
wakeup threshold. Share that threshold check with generic 8250 and OMAP
TX DMA completion through uart_write_wakeup_if_needed().

Publish resume readiness under the same port lock as the TX restart,
without clearing any reservation. A concurrent flush can then reserve a
new transfer without resume releasing its storage prematurely.

Assert the port-lock requirement at uart_write_wakeup(), alongside the
reservation helpers, so callers cannot inspect readiness or release a
one-shot notification concurrently with a reservation change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c  |   4 +-
 drivers/tty/serial/8250/8250_omap.c |   3 +-
 drivers/tty/serial/serial_core.c    | 104 ++++++++++++++++++++++++++++++++----
 include/linux/serial_core.h         |  35 +++++++++++-
 4 files changed, 130 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 57fc7915adac..43c55cb991a5 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -15,7 +15,6 @@ static void __dma_tx_complete(void *param)
 {
 	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
-	struct tty_port		*tport = &p->port.state->port;
 	unsigned long	flags;
 	int		ret;
 
@@ -30,8 +29,7 @@ static void __dma_tx_complete(void *param)
 
 	uart_xmit_advance(&p->port, dma->tx_size);
 
-	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-		uart_write_wakeup(&p->port);
+	uart_write_wakeup_if_needed(&p->port);
 
 	ret = serial8250_tx_dma(p);
 	if (ret || !dma->tx_running)
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index f1980c15f85a..366fa787292c 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1107,8 +1107,7 @@ static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 		omap8250_restore_regs(p);
 	}
 
-	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-		uart_write_wakeup(&p->port);
+	uart_write_wakeup_if_needed(&p->port);
 
 	if (!kfifo_is_empty(&tport->xmit_fifo) && !uart_tx_stopped(&p->port)) {
 		int ret;
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..0f6613814ce3 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -100,6 +100,11 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
 	return state->uart_port;
 }
 
+static bool uart_xmit_writable(const struct uart_state *state)
+{
+	return state->xmit_ready && !state->xmit_blocked;
+}
+
 /**
  * uart_write_wakeup - schedule write processing
  * @port: port to be processed
@@ -114,15 +119,77 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
 void uart_write_wakeup(struct uart_port *port)
 {
 	struct uart_state *state = port->state;
+
+	lockdep_assert_held_once(&port->lock);
+
 	/*
 	 * This means you called this function _after_ the port was
 	 * closed.  No cookie for you.
 	 */
 	BUG_ON(!state);
+	if (!uart_xmit_writable(state))
+		return;
 	tty_port_tty_wakeup(&state->port);
 }
 EXPORT_SYMBOL(uart_write_wakeup);
 
+/* Publish readiness without releasing any transfer's storage reservation. */
+static void uart_xmit_enable(struct uart_port *port)
+{
+	struct uart_state *state = port->state;
+
+	lockdep_assert_held_once(&port->lock);
+	if (state->xmit_ready)
+		return;
+	state->xmit_ready = true;
+	uart_write_wakeup_if_needed(port);
+}
+
+/**
+ * uart_xmit_block - reserve flushed transmit storage
+ * @port: port whose transmit storage is still in use
+ *
+ * A driver may call this from ->flush_buffer() if DMA still owns the old
+ * transmit data. The logical FIFO has already been emptied, but writers
+ * must not overwrite its storage until uart_xmit_unblock() is called.
+ * write_room() reports zero and write()/put_char() accept no data meanwhile.
+ * Line-discipline write wakeups are deferred until the reservation is released.
+ *
+ * The driver must unblock after retiring the transfer, including on shutdown.
+ * Serial core separately gates writes and wakeups until startup or resume
+ * has made the port ready.
+ * Repeated calls are idempotent, not nested reservations.
+ *
+ * Context: @port->lock held.
+ */
+void uart_xmit_block(struct uart_port *port)
+{
+	lockdep_assert_held_once(&port->lock);
+	port->state->xmit_blocked = true;
+}
+EXPORT_SYMBOL_GPL(uart_xmit_block);
+
+/**
+ * uart_xmit_unblock - release reserved transmit storage and wake writers
+ * @port: port whose storage is available again
+ *
+ * The old transfer must no longer access the FIFO storage, and any required
+ * DMA synchronization must have completed before this call.
+ * Retirement is recorded even while the port is inactive. Writes and wakeups
+ * remain deferred until startup or resume has made the port ready.
+ *
+ * Context: @port->lock held.
+ */
+void uart_xmit_unblock(struct uart_port *port)
+{
+	lockdep_assert_held_once(&port->lock);
+	if (!port->state->xmit_blocked)
+		return;
+	port->state->xmit_blocked = false;
+	uart_write_wakeup(port);
+}
+EXPORT_SYMBOL_GPL(uart_xmit_unblock);
+
 static void uart_stop(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
@@ -141,7 +208,10 @@ static void __uart_start(struct uart_state *state)
 	struct serial_port_device *port_dev;
 	int err;
 
-	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port))
+	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port) || !state->xmit_ready)
+		return;
+	/* High-priority flow-control characters have their own storage. */
+	if (state->xmit_blocked && !port->x_char)
 		return;
 
 	port_dev = port->port_dev;
@@ -375,6 +445,11 @@ static int uart_startup(struct tty_struct *tty, struct uart_state *state,
 		return -EIO;
 
 	serial_base_port_startup(uport);
+	scoped_guard(uart_port_lock_irq, uport) {
+		uart_xmit_enable(uport);
+		if (!kfifo_is_empty(&port->xmit_fifo) || uport->x_char)
+			__uart_start(state);
+	}
 
 	return 0;
 }
@@ -397,8 +472,11 @@ static void uart_shutdown(struct tty_struct *tty, struct uart_state *state)
 	if (tty)
 		set_bit(TTY_IO_ERROR, &tty->flags);
 
-	if (uport)
+	if (uport) {
+		scoped_guard(uart_port_lock_irq, uport)
+			state->xmit_ready = false;
 		serial_base_port_shutdown(uport);
+	}
 
 	if (tty_port_initialized(port)) {
 		tty_port_set_initialized(port, false);
@@ -593,7 +671,7 @@ static int uart_put_char(struct tty_struct *tty, u8 c)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_put(&state->port.xmit_fifo, c);
 	uart_port_unlock_deref(port, flags);
 	return ret;
@@ -624,7 +702,7 @@ static ssize_t uart_write(struct tty_struct *tty, const u8 *buf, size_t count)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_in(&state->port.xmit_fifo, buf, count);
 
 	__uart_start(state);
@@ -640,7 +718,7 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_ref_lock(state, &flags);
-	if (!state->port.xmit_buf)
+	if (!state->port.xmit_buf || !uart_xmit_writable(state))
 		ret = 0;
 	else
 		ret = kfifo_avail(&state->port.xmit_fifo);
@@ -682,8 +760,12 @@ static void uart_flush_buffer(struct tty_struct *tty)
 	kfifo_reset(&state->port.xmit_fifo);
 	if (port->ops->flush_buffer)
 		port->ops->flush_buffer(port);
+	/* Serialize the wakeup with reservation changes, including another flush. */
+	uart_write_wakeup(port);
 	uart_port_unlock_deref(port, flags);
-	tty_port_tty_wakeup(&state->port);
+
+	/* Drain waiters observe FIFO emptiness, not write readiness. */
+	wake_up_interruptible(&tty->write_wait);
 }
 
 /*
@@ -1748,8 +1830,10 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 	if (WARN(!uport, "detached port still initialized!\n"))
 		return;
 
-	scoped_guard(uart_port_lock_irq, uport)
+	scoped_guard(uart_port_lock_irq, uport) {
+		state->xmit_ready = false;
 		uport->ops->stop_rx(uport);
+	}
 
 	serial_base_port_shutdown(uport);
 	uart_port_shutdown(port);
@@ -2391,9 +2475,10 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 		unsigned int mctrl;
 
 		tty_port_set_suspended(port, true);
-		tty_port_set_initialized(port, false);
 
 		scoped_guard(uart_port_lock_irq, uport) {
+			state->xmit_ready = false;
+			tty_port_set_initialized(port, false);
 			ops->stop_tx(uport);
 			if (!(uport->rs485.flags & SER_RS485_ENABLED))
 				ops->set_mctrl(uport, 0);
@@ -2498,8 +2583,9 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 					if (!(uport->rs485.flags & SER_RS485_ENABLED))
 						ops->set_mctrl(uport, uport->mctrl);
 					ops->start_tx(uport);
+					tty_port_set_initialized(port, true);
+					uart_xmit_enable(uport);
 				}
-				tty_port_set_initialized(port, true);
 			} else {
 				/*
 				 * Failed to resume - maybe hardware went away?
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..6610ec5ed074 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -208,8 +208,17 @@ struct gpio_desc;
  *	Flush any write buffers, reset any DMA state and stop any ongoing DMA
  *	transfers.
  *
- *	This will be called whenever the @port->state->xmit circular buffer is
- *	cleared.
+ *	This is called after the transmit FIFO has been cleared, with @port->lock
+ *	still held. A driver whose asynchronous transfer can still access the
+ *	flushed storage must call uart_xmit_block() before returning. This keeps
+ *	write_room() at zero and prevents write() and put_char() from reusing the
+ *	storage until the driver calls uart_xmit_unblock().
+ *
+ *	Release the reservation only after the transfer and its callbacks have
+ *	retired and any required DMA synchronization has completed. Shutdown must
+ *	also retire the transfer and release the reservation before returning,
+ *	since serial core then frees the transmit buffer. Serial core separately
+ *	gates writes and wakeups until startup or resume has made the port ready.
  *
  *	Locking: @port->lock taken.
  *	Interrupts: locally disabled.
@@ -834,6 +843,9 @@ enum uart_pm_state {
  */
 struct uart_state {
 	struct tty_port		port;
+	/* TX readiness and storage ownership; protected by the UART port lock. */
+	bool			xmit_ready;
+	bool			xmit_blocked;
 
 	enum uart_pm_state	pm_state;
 
@@ -910,6 +922,25 @@ struct uart_driver {
 
 void uart_write_wakeup(struct uart_port *port);
 
+/**
+ * uart_write_wakeup_if_needed - notify writers when queued output is low
+ * @port: port to be processed
+ *
+ * Keep one-shot write-wakeup notifications pending until fewer than
+ * %WAKEUP_CHARS remain in the transmit FIFO. This also applies to output
+ * retained across suspend and resume.
+ *
+ * Context: @port->lock held.
+ */
+static inline void uart_write_wakeup_if_needed(struct uart_port *port)
+{
+	if (kfifo_len(&port->state->port.xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
+}
+
+void uart_xmit_block(struct uart_port *port);
+void uart_xmit_unblock(struct uart_port *port);
+
 /**
  * enum UART_TX_FLAGS -- flags for uart_port_tx_flags()
  *

-- 
2.53.0

