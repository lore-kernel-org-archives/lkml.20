Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795274;
	b=XL6GWBc5j4JpvNQTFQ1snckqicgM+UoUf0kFKIYzmyLIPYTS9bppW4PeNlL8BS20shNH
	 eaYHcKABrPpBqfX15I6AaFyfT/nQtOqmegoFvKhmOxqlZGHF8J51cJ8pqjDgGm0CSCnjg
	 2w9d7L53pGbl4957oe3LhC0ExYIOxMcOUYw968S4iIhaCyOloYinqMMpV9MRwKPpCEZMO
	 PUjCxShubxmML1dnilnAPR/R5oUNlHEGclPXGnIBtvFM+G2dm5LtkvKzuLxbYNGaN92rS
	 LnRzrAo+9lCZZ0nMsQYCiekmZqn3SJ1w71X5pFDN2sHkShr+vOOd3chfaDJvm4sGxbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=tN5ebE2FlZFe17GIwyAdLDgu6OIuiG0D4oHrPQg10QM=;
	b=plKV5BCl5hTw2XW5sXF0+EDHjKGHryQUo6XMSzDb36ZwEItE8eixTRnKUENt72VzWp+b
	 vb+m47Ga0kmgfHAEFnLeTGoAy3jPPzWHoWpAdlk2JsdNhbF///fBPd63GAdddZTfLpuNI
	 nsbpxo8gSgDc4GqUr1vsvp70NHCsdmP+ocvHeGByY0w/tco44WkpnWbxJhJhIgO+//AYh
	 Owrz5ZPBdIjStn6lRQwghVYCeoUdtWME4pwZ85bcYYI/8t6EzC6NApBm0uPmEUY4eCysZ
	 XpKls0zZaRXx9bx8oLrJlndD+g1U/x52R4g7tZUoROMhgbBfTVtJ497ofWzF1edanKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gy9QGXYt;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4313606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4313606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gy9QGXYt
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4a71d0c4233so589040fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792795273; x=1793400073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN5ebE2FlZFe17GIwyAdLDgu6OIuiG0D4oHrPQg10QM=;
        b=gy9QGXYtOHZRDsqtfGdp6yPdmIqklIiWLCntFRbRNs9NrYU1uaCESTHajJFei2Ptrz
         LX/wqNIHMeikNq77TU99ymM8z3EfkH40EDWHQCcaG2qIMgAnerIQQJyp7FFha705Qpqi
         SJlfUVeSbwAFEUEa6oYDVYKrUe4n4u8PgR/ohjY0G2MomNi1NVLGC3TrnSyKXTpLts1L
         pOjALbe29V48QgQtwnRQSA47LQKxZjzg684e/Ow1Tmvu9rY1Mbg/Fs6HduAZuiAfXdIa
         dV6+GXHg9NZ69Cp+R3QBTBZh78bASTX2jGxd/RxM6W74lyK427Z6KrEMOMtPYPp3cFH4
         iCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795273; x=1793400073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN5ebE2FlZFe17GIwyAdLDgu6OIuiG0D4oHrPQg10QM=;
        b=N22Zg/s5aG/YmjSThnDXoGCYu2XeGnjam6eonzDnEkf4ebiR9q9x4JD+EQmzMiHfg3
         ey3rXlIpckXxF1bTsvAe+w3YDO5vK3h9J8V4ueaQVXML1/t+Z9VhsMbIAnk/Xnn997EL
         335c/pzgjSY1kW3FKs4ckQ2yRJimd2D9vaBjzTBQbJnGh1DH1FESnSUukX+gh1kBaqOP
         6yRoBPdhfldU82ylynTImo10Y4zBOUgYGyq5mydICP3Nr2g1f2b8FF6APPb9LM5TOP+S
         rlyrBQOPoeQ6BPrcmPqFmkZrC7wA0ak+0Mqfliy58MYIMHldNzLU3suw4E7HyMwtz/di
         2jyg==
X-Gm-Message-State: AFq9FYLnYy+USg/i22Uz4/wzxdt31VntKZin9vIQTC+hCN2JWYx9bScM
	7FkbfiSZRfF/0pmWbV6hbFcoeGJnl62bc4gweNr3tkpmIwgZQAV5jH88
X-Gm-Gg: AYBFou1Wp72pEDi8y9N3tJKQWLE0SgR61yWMGqmpLnN9aAe2ky0T+NR9XiUe9hf+D/6
	U9DaQIKAOFH5nrGuZH/6209vObni21J1uN5B8kkvRMYcUMXUdD6JSAVhfammSoRJMpTuEgJcjcG
	ZvdH2weCsbL514mUMmSaEL0t4zc+adl5CaqE0M632o5V0IQGr9w+UrRRAxggyBiEHkUZJv3m1Md
	cuBCRqxVNEOY3zslNDzXrDDiTlcysx55kwX8VsxP6+YHu5T86O10sGWULIBZAHFFv2cCS58V6vC
	g4A6xjGI1ZoKc+FIZPrQJhkM2oB+yRupZyDCoraiHWEKCDAJU10pdLe5sasxApLdDdKBB8Kc2Az
	5Y8PcLJc/cD/jb59IHzdgY/yIC8Rf5909JnMG3wS3u9Jeq7YCVQsvBSyuOtNiTqpWc5O/UBi9bM
	jAK5tsVQlZ+fKSp7T3nqNypeXjhGXF/nuQN49MbNhMBgiYURoXcqj8TemaA40OTxZ+hx2rWguLm
	Zifn7oRQuD4lxtoOAZAQ6TruXk2DB9nAc+48OHWpKjnALPhC+9Vv19m7yHFn8V8ZL/03yD8+XWL
	766Ccf8OZG/1Ot8yNa4XQSwb9B7ZZTOosEEmwFUIDTizbwgDX90poIr5aw2TPoQVkIIMzsrdiLI
	lcP9gdSehSituRNX6s+XZHEDFL+/yUfQI6lsdGHDNsM/oEzPM0HXLF6YbhUmau3niPEgIq2qiOs
	mtFI79EjD3KYtzhRwxmsFYbyOb
X-Received: by 2002:a05:6871:b28:b0:494:8d07:61b3 with SMTP id 586e51a60fabf-4a83f4ea4c5mr546261fac.21.1792795272747;
        Fri, 23 Oct 2026 15:41:12 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm226213fac.11.2026.10.23.15.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:41:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 16:41:07 -0600
Subject: [PATCH v4 2/4] serial: core: allow drivers to reserve flushed
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
Message-Id: <20261023-submit-serial-8250-dma-cancel-v1-v4-2-e759de1839de@gmail.com>
References: <20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com>
In-Reply-To: <20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
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

Keep the reservation while the port is uninitialized so completion cannot
wake writers into shutdown. Leave it in place when the driver releases DMA
resources. Serial core clears it when allocating the FIFO for a new open,
or after a successful resume has restored the port. Failed resume keeps
writers blocked.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/serial_core.c | 61 +++++++++++++++++++++++++++++++++++++---
 include/linux/serial_core.h      | 17 +++++++++--
 2 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..e5756934b8f4 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -119,10 +119,56 @@ void uart_write_wakeup(struct uart_port *port)
 	 * closed.  No cookie for you.
 	 */
 	BUG_ON(!state);
+	if (state->xmit_blocked)
+		return;
 	tty_port_tty_wakeup(&state->port);
 }
 EXPORT_SYMBOL(uart_write_wakeup);
 
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
+ * The driver must unblock after retiring the transfer while the port is open.
+ * Shutdown must retire the transfer; serial core releases any reservation
+ * when the port is reopened or resumed.
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
+ * If shutdown has started, leave the storage blocked until reopen or resume.
+ *
+ * Context: @port->lock held.
+ */
+void uart_xmit_unblock(struct uart_port *port)
+{
+	lockdep_assert_held_once(&port->lock);
+	if (!port->state->xmit_blocked || !tty_port_initialized(&port->state->port))
+		return;
+	port->state->xmit_blocked = false;
+	uart_write_wakeup(port);
+}
+EXPORT_SYMBOL_GPL(uart_xmit_unblock);
+
 static void uart_stop(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
@@ -143,6 +189,9 @@ static void __uart_start(struct uart_state *state)
 
 	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port))
 		return;
+	/* High-priority flow-control characters have their own storage. */
+	if (state->xmit_blocked && !port->x_char)
+		return;
 
 	port_dev = port->port_dev;
 
@@ -260,6 +309,7 @@ static int uart_alloc_xmit_buf(struct tty_port *port)
 	uport = uart_port_ref_lock(state, &flags);
 	if (!state->port.xmit_buf) {
 		state->port.xmit_buf = buf;
+		state->xmit_blocked = false;
 		kfifo_init(&state->port.xmit_fifo, state->port.xmit_buf,
 				PAGE_SIZE);
 		uart_port_unlock_deref(uport, flags);
@@ -593,7 +643,7 @@ static int uart_put_char(struct tty_struct *tty, u8 c)
 		return 0;
 	}
 
-	if (port)
+	if (port && !state->xmit_blocked)
 		ret = kfifo_put(&state->port.xmit_fifo, c);
 	uart_port_unlock_deref(port, flags);
 	return ret;
@@ -624,7 +674,7 @@ static ssize_t uart_write(struct tty_struct *tty, const u8 *buf, size_t count)
 		return 0;
 	}
 
-	if (port)
+	if (port && !state->xmit_blocked)
 		ret = kfifo_in(&state->port.xmit_fifo, buf, count);
 
 	__uart_start(state);
@@ -640,7 +690,7 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_ref_lock(state, &flags);
-	if (!state->port.xmit_buf)
+	if (!state->port.xmit_buf || state->xmit_blocked)
 		ret = 0;
 	else
 		ret = kfifo_avail(&state->port.xmit_fifo);
@@ -682,8 +732,9 @@ static void uart_flush_buffer(struct tty_struct *tty)
 	kfifo_reset(&state->port.xmit_fifo);
 	if (port->ops->flush_buffer)
 		port->ops->flush_buffer(port);
+	/* Serialize the wakeup with reservation changes, including another flush. */
+	uart_write_wakeup(port);
 	uart_port_unlock_deref(port, flags);
-	tty_port_tty_wakeup(&state->port);
 }
 
 /*
@@ -2500,6 +2551,8 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 					ops->start_tx(uport);
 				}
 				tty_port_set_initialized(port, true);
+				scoped_guard(uart_port_lock_irq, uport)
+					uart_xmit_unblock(uport);
 			} else {
 				/*
 				 * Failed to resume - maybe hardware went away?
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..9b6f118d4db3 100644
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
+ *	also retire the transfer before returning, since serial core then frees
+ *	the transmit buffer. Leave the reservation in place during shutdown;
+ *	serial core releases it when the port is reopened or resumed.
  *
  *	Locking: @port->lock taken.
  *	Interrupts: locally disabled.
@@ -834,6 +843,8 @@ enum uart_pm_state {
  */
 struct uart_state {
 	struct tty_port		port;
+	/* Flushed TX storage is reserved; protected by the UART port lock. */
+	bool			xmit_blocked;
 
 	enum uart_pm_state	pm_state;
 
@@ -909,6 +920,8 @@ struct uart_driver {
 };
 
 void uart_write_wakeup(struct uart_port *port);
+void uart_xmit_block(struct uart_port *port);
+void uart_xmit_unblock(struct uart_port *port);
 
 /**
  * enum UART_TX_FLAGS -- flags for uart_port_tx_flags()

-- 
2.53.0

