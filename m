Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792824056;
	b=e2ssOAkJq0BqQoi2u3KMBnzDqu7Pp3YF7iXCJEEW4FvKd9mfBijjhgxrPLn5hhVMJO4/
	 RylFe26Q1HEzctmHTMYdGXOvh77L2Lr4GXI6Xnp3W79uI7pU6xQTIM9TL0d0IGPaadq0M
	 hf+Ftc/g3ulpnlkMXAldvfKL3l4IRJQero37pvcA9kdNj7E0HuXnms00NidQ/YhUJ1a9z
	 vlSqeE2hL0Qhl+F9jtnWrb5aqBhBQfXikt4NEUr6kUzBnUlsJ6SDqLfBzWZKhDusznHtP
	 2siHaZL54Fk2fDCWeeIjpi6MA2Z2FGYp2IEvD/CI3eDzlXNRjX+Fu7+vTbSE7j2jAGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792824056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HghwYhffT2wkbiQA375AMS0eWRI47V+WwoxJxlqek0Q=;
	b=atZUuf5nzOuoiIGVOJVjHmoGPFyABeFv3mILBG/G+66s8qDtQ6WjlYTpTHXu7iez2KF6
	 kA0L8prgyadSM0X2p/zdKoILKkTRcavJ9Qyl7dBp4t8v4+qVWioWofwrt1RI3g5Pj39Hc
	 X3sB2PRJvW+051oF9zMk/UtGK9Rqra4HcC/VjyVtOugU+I/bOk50vjgi2nuw8XAjFNbOM
	 nh1G1ngYIjjTgGx/xop0em6uO3EZS7ygLs9dlhT0/WuebxI/K5dMdmO2W2mFEzKmYCLIX
	 xs1ElOITer5UgMRcx9I78fyCS8O3/t982WwMbR+JzcZ3MgXBlI3niOeeRyjkqftz1wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngXHdPab;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BA606A323
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngXHdPab
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823b938464fso1093977a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792824054; x=1793428854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HghwYhffT2wkbiQA375AMS0eWRI47V+WwoxJxlqek0Q=;
        b=ngXHdPabU02TcB8q1hgVVNBdMiRHZOcChA0CB0DvMSdo9Gsoto1hg+/B19VySjaMqJ
         /tZoarsFzSrrZV4EFp3Y6aSVZxG2Tly2HOgVvhvzhmj8o/A0mZOmlzROiyIw+s/V10ME
         cgE/3et03StR+XZptswENv8X8ZI4iXffEJ2eShhPtzTecbvjNOnoZURBN5xlohDRFNHj
         onpGt0XxkAUZBlODj+SxKV8X8Eva+YBHkB3+87OP9LbynFAbI0ObG5sXQ9USTnAvBipa
         /QQk1EmpQiX4lY22zB6vpv4iCpB0Q9JNyoaRzoSMdOtEfnM7tbwwEpr0V4IMYpjcjgkx
         10Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792824054; x=1793428854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HghwYhffT2wkbiQA375AMS0eWRI47V+WwoxJxlqek0Q=;
        b=S6Mq0QQM7FIke9n8coq08Irbr53Ju+ngRqcTnVZ9f2WAphqBkveYlP3WDv8ceFphJg
         u+r/spibhSi+gjPxGFscAA3JJm8p6Q0WKhczhdX3xfBj+P4LLBUbngDO1/TFTpq5JJKD
         jC7+7YeUm0R/jT99VWHLJZBdzxD1yF9Vlw2kc8/lWaGSt2hqh/GXpSuBb0DRPkkYzC7W
         7z4Bd7LAXaAxomzpnGa10Rz1T3g3A6F9a1QjbPL7D3SZQOO49fV+g6B4CS0MZiZ1BLV0
         351SpaCtH341hi7TatnMFk1VqvX9wdaf0kZlBhvgYfmuWXs1s6jjMmJmF0EwMqVgGWvc
         ugMg==
X-Gm-Message-State: AFq9FYIGkhDU0E3yToJkbqx9W82EO8LlM5bP9Mi2pLJ9wb57XFU/dfEt
	crif6hvBYmlKUwd2gdGhHo36qfwDJTtK4PLxzlCZxO9WlfMbAb7/SXnJ
X-Gm-Gg: AYBFou1c2RdDuI1jIw6mSqq+ySfH5R+7zjzxFGS8AM8y1MRqx75mLaFyXdq5CaqC7/+
	zOLYuUE+EejcCUTSatJ6CekvQH+7TYi4U6bQ8DLKm0NrijT91BPG1rI1e4iDhApWFIjt/YA60Gh
	qVdIFeHBf4Mlnj2r1+aSfbsPamz2Bkrji1i/t0H/VRKz29Q/9hUaIj64lsPmTQ6L0RwxKz7y2tf
	5Shb+vcUz3pPpDFBBL+Ai3Dy0iPtoaA0E3YGzuAEL/JiKknmgfeAiGxqD5r4Fjzg3rMtjEGTuOV
	Aht5+tJdk9dJktCj0H5qsW0WnQ/dtL8OMizHl4NoX6GK+25Dg9J+PNiic1IDrWXnT6WQDV9Ul/x
	KXw7FIMxQdkOOkJcByuip6EzhyX6qEfHZncXggsV/AaIbfNbkWT7PHmE9tdIaplkB0UQ6mQfxW/
	rJ+nn2q3AGy6BFiqs8b5WKgsyfW9Sd1wR9Mmace0X0E4uRmy4gjvBYGP3G1l67Td0iseejkuHEL
	bsRQXcNfb9yH1NjaAlsFmy2tkDuZe3uCCb3ZZB8SilKDmat1a3DuyVlEXXmSKJnUClVC/1ek5yD
	g51LIyEUiDJjm8VxowOB2qhdprRAFKev/gtFLyMLfcs3DBERt1b0rZbvRoEsCSTCL2EABWWCM6G
	BK7KX644R5tMbzYjXw2TLPTQBRG3Fke+2jpAFmx7F1/seug01mNiJssf2zduTyCWhiFm02EUtT7
	K8ErY=
X-Received: by 2002:a05:6808:13c3:b0:533:87ee:d131 with SMTP id 5614622812f47-55c00290da3mr1015587b6e.25.1792824054546;
        Fri, 23 Oct 2026 23:40:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm864633b6e.9.2026.10.23.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:40:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 00:40:42 -0600
Subject: [PATCH v5 3/5] serial: core: allow drivers to reserve flushed
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
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v5-3-9e52968928d2@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
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
 Timur Tabi <timur@kernel.org>
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
reservation is released, preserving one-shot TTY wakeups. Keep the flush
wakeup under the port lock so it cannot race another reservation.

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
wakeup threshold.

Publish resume readiness under the same port lock as the TX restart,
without clearing any reservation. A concurrent flush can then reserve a
new transfer without resume releasing its storage prematurely.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/serial_core.c | 100 +++++++++++++++++++++++++++++++++++----
 include/linux/serial_core.h      |  18 ++++++-
 2 files changed, 107 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..30358fe8c341 100644
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
@@ -119,10 +124,71 @@ void uart_write_wakeup(struct uart_port *port)
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
+	/* Retained output must drain before consuming a write-ready notification. */
+	if (kfifo_len(&state->port.xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
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
+ * Write wakeups are deferred until the reservation is released.
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
@@ -141,7 +207,10 @@ static void __uart_start(struct uart_state *state)
 	struct serial_port_device *port_dev;
 	int err;
 
-	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port))
+	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port) || !state->xmit_ready)
+		return;
+	/* High-priority flow-control characters have their own storage. */
+	if (state->xmit_blocked && !port->x_char)
 		return;
 
 	port_dev = port->port_dev;
@@ -375,6 +444,11 @@ static int uart_startup(struct tty_struct *tty, struct uart_state *state,
 		return -EIO;
 
 	serial_base_port_startup(uport);
+	scoped_guard(uart_port_lock_irq, uport) {
+		uart_xmit_enable(uport);
+		if (!kfifo_is_empty(&port->xmit_fifo) || uport->x_char)
+			__uart_start(state);
+	}
 
 	return 0;
 }
@@ -397,8 +471,11 @@ static void uart_shutdown(struct tty_struct *tty, struct uart_state *state)
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
@@ -593,7 +670,7 @@ static int uart_put_char(struct tty_struct *tty, u8 c)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_put(&state->port.xmit_fifo, c);
 	uart_port_unlock_deref(port, flags);
 	return ret;
@@ -624,7 +701,7 @@ static ssize_t uart_write(struct tty_struct *tty, const u8 *buf, size_t count)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_in(&state->port.xmit_fifo, buf, count);
 
 	__uart_start(state);
@@ -640,7 +717,7 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_ref_lock(state, &flags);
-	if (!state->port.xmit_buf)
+	if (!state->port.xmit_buf || !uart_xmit_writable(state))
 		ret = 0;
 	else
 		ret = kfifo_avail(&state->port.xmit_fifo);
@@ -682,8 +759,9 @@ static void uart_flush_buffer(struct tty_struct *tty)
 	kfifo_reset(&state->port.xmit_fifo);
 	if (port->ops->flush_buffer)
 		port->ops->flush_buffer(port);
+	/* Serialize the wakeup with reservation changes, including another flush. */
+	uart_write_wakeup(port);
 	uart_port_unlock_deref(port, flags);
-	tty_port_tty_wakeup(&state->port);
 }
 
 /*
@@ -1748,8 +1826,10 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 	if (WARN(!uport, "detached port still initialized!\n"))
 		return;
 
-	scoped_guard(uart_port_lock_irq, uport)
+	scoped_guard(uart_port_lock_irq, uport) {
+		state->xmit_ready = false;
 		uport->ops->stop_rx(uport);
+	}
 
 	serial_base_port_shutdown(uport);
 	uart_port_shutdown(port);
@@ -2391,9 +2471,10 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 		unsigned int mctrl;
 
 		tty_port_set_suspended(port, true);
-		tty_port_set_initialized(port, false);
 
 		scoped_guard(uart_port_lock_irq, uport) {
+			state->xmit_ready = false;
+			tty_port_set_initialized(port, false);
 			ops->stop_tx(uport);
 			if (!(uport->rs485.flags & SER_RS485_ENABLED))
 				ops->set_mctrl(uport, 0);
@@ -2498,8 +2579,9 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
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
index 4eeb8253752a..41598a38a408 100644
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
 
@@ -909,6 +921,8 @@ struct uart_driver {
 };
 
 void uart_write_wakeup(struct uart_port *port);
+void uart_xmit_block(struct uart_port *port);
+void uart_xmit_unblock(struct uart_port *port);
 
 /**
  * enum UART_TX_FLAGS -- flags for uart_port_tx_flags()

-- 
2.53.0

