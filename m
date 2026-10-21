Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622270;
	b=lAPddb4+H6Vl+5xlPkpNJxjxJSyg1nAcH9CTQOEA4FrMqXeWGJ8zfcPL7rF/9UgakbNq
	 OeE803nFCK0TDdqTybY1Oca/EdMlWbAMqN3R2ctIKkIr75DUauIvVnGhgT8Ji9KZ5fK6R
	 Kagu8H/0gXflngKDa4NV6Qpsq7NIUAGkS1B6V1Lsf6mSbrWt5r4zqzgkT98harrV8mZhJ
	 zWt/aY8M/5bmO9r+JPXInvRutF59fg5vnocNaquXMmZJSNKUUUH1mu3XjHD3FWG6dKbm1
	 hnpWkuWLr3asj4sLwXP9qQVpA5CMSu7mxPsS8VgJVR2t9lRo1UBZKZm8T1DVKatx72g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=211UKmjGr9+b6wFRS8FwcfVNHhn0kS0xBLrWw522cC0=;
	b=PWf36yDOdPNHHRyIA/aYRnGkdmXGk5XZCzYIgFXjkiNXZCJ7BjzstyBwwpUztRrmHQ/J
	 bh2EL+O7J775h0ZeDLy5zHrCrDRpi2eKHgYSgJr0RXOnlUSHsiXZ7s9TGNrAq4XJesKCC
	 gBVZW01XS8jb1IYq1RiMzLR7aBrReJLeO5k+qFkD0RpJL0N4slPtkB8yCy4/xst8MOkgq
	 GrhSDU/ld41wxS/xyWUoU1C2txU3jC9gbPKa5+6VC1RzQkAibt3p5dvh10XC7jW44CBOT
	 Sr6sgkWiwvYOsYP3XqJtb0rmk9ehqKevPeLmjWJEScsoENOlI4X9WI0pjVezTf16xvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lXQxgQpO;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D41F606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D41F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lXQxgQpO
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84621d8c7aaso668081a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792622269; x=1793227069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=211UKmjGr9+b6wFRS8FwcfVNHhn0kS0xBLrWw522cC0=;
        b=lXQxgQpOYEGQWl8z8lPr4Isl4vWc2Xc7OONLCHADZeVJ+/XBO+cnKy1VVawP3AWiPH
         2c6+d21BAdZnoABW6j6s9vw8wyYODtOgHSQ8dbIgx4mbeZ9TmNfcNr2d8H4KAKB8W6Os
         z0T5b0dB1FK/XCxbCbAHqjrSIdaJceC8nLIb21nNYSvliszzuxD/P7uu4WPL88Jbquev
         M25sb9HRbUfPdd6TsAMbf6hooBjSXnEjJt50KGehbODe3qsjAgITPYu7r3s7ehi7v0y5
         5SnLRGIGeIHqkl3HYRN514pbYemfLMzrb6AarMWXMGsHZHlOf10dU2fwsL87X2TPTUAI
         xlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622269; x=1793227069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=211UKmjGr9+b6wFRS8FwcfVNHhn0kS0xBLrWw522cC0=;
        b=1WTNioXKzkSRJSZWjeaZfLSveg8nmbLOYhS2fj0t8X/LNzuYIH5u8In/ekLVIQtfWN
         vAe4c3Ms+lTHAQYvzumZb9hOkl9t8sPnd1euYfJQh5yJk++2AQEIaVZm4WSPRicBPxo5
         I2ANXrYLCHQdQ0zL5YdghdYfTgUoXAATsujpc7oO0CGMJgzyZJAVI7xcTBrA7HBLh+qI
         PSVwarxrBATJX8L1jKqZpFwO1OCGWotNGvWhGJFJj1Ka+gzRcZTKrDAKD49MmzCoiAvd
         yTuCv2n+MCz3sr4b4w+nzOrWv4TZdK0mFwPUINFLEYf4urAoq+oWZzrP/INU5+lYrMVc
         igZA==
X-Gm-Message-State: AFq9FYI6pPxb4EDwlLA8e+fn4qBEhhmPaNTRxSPx87BxNVaOVHXRKGdB
	nOjodsHONdn4emtA4WYbD+aUOvp4dFyDI6/9z5IBv+ACdLRLKVdTGDA5
X-Gm-Gg: AYBFou0xfbbXfv8KK0+vyO43oanXNhlfP7AZ5HBTzbRQOXidYJrc4HuMV6ip28/TlcJ
	5xRU/sl/3ttsGqidQRO05fd+XaZDRZ1k7XtR+UGBzj3Y08y/6Us8Nm7WRWNH1KsgJKv4X7i68tE
	4ZDccTBopp0N/EsmSuNzk9YltT2yWnOxVlvtZJ+1DODXi4H7R9CJBrWtMUrK3ZAILPUh5y06gFa
	CQDz/t9NOv7L+y/kw18UEc7GHnTvnpMpb1jH6PssCOEuvvnJTquhXMlDF662zwaKQJGigXYIHo2
	jxlFoP+hSajVRL3A6U2WNm+8q/hF08sFy1e0eu1oc4QAihBpeKYfZgabyYSXs4zhcim7+7L0nkn
	8f3RCriVlKI/cSG30qWL0ffgzsKPBXcsTUAMBtcTKZ8nGtfSEnmAcJNPZT9oPvV8gHOvmWKnE1L
	SdkhRpnw1kQn6n8/jhbtnLrMiOi/lZ4oqN2RgmjYLxnf9ibseNJXzrkzwseGSTQ0+1jDwggZVAD
	5pxzAM1OWUrhRQRfXPBKWcPM3z9s56KcHPDoLM5+FQbbaMkA8CMVVDf826Xe616AEHI9dTQe8FB
	5lRxvBzIVTP9ofZbSldQbFlD+HSNu4M8HnI7OeJKkvmChw99882Hj37S+BFyeN0BqPXNJSSOLxR
	tC3p+td9MjF+9Re+U++jukLc1f7maSWc/8yLZrjAIhocTFNydtFQ/t2J/tltFk9dq3FwLjI4b8U
	kA8g==
X-Received: by 2002:a05:6830:6d4f:b0:829:79df:f84a with SMTP id 46e09a7af769-84d08107cdemr2585833a34.10.1792622269222;
        Wed, 21 Oct 2026 15:37:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbddc7100sm3538837a34.24.2026.10.21.15.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:37:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 16:37:44 -0600
Subject: [PATCH 2/2] serial: 8250: retire canceled RX DMA before reusing
 the receive buffer
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
Message-Id: <20261021-submit-serial-8250-dma-cancel-v1-v1-2-efe2b89f2303@gmail.com>
References: <20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com>
In-Reply-To: <20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The RX timeout path pauses a transfer, copies its data, and terminates it
asynchronously. It also clears rx_running before an old callback has
necessarily returned. The next receive can therefore reuse the same
buffer and cookie while that callback is still waiting for the port lock.
Looking up the new cookie is not sufficient: a new transfer may already
be complete or paused when the old callback obtains the lock.

Keep the receive buffer reserved after termination and drain callbacks
in a worker before allowing another descriptor to use it. The interrupt
handler can receive through PIO while the canceled transfer is retired;
data already received by DMA is delivered first. Do not perform another
termination while synchronization is pending. Shutdown drains the worker
before freeing the buffer. Both the callback and retirement worker
honor disabled receive interrupts before restarting DMA.

Check pause failures before reading the DMA buffer or handing its FIFO
back to PIO. Make the DesignWare idle path abort rather than proceed with
an unpaused receiver. Track the delivered offset so a failed termination
followed by resumed DMA cannot deliver the same prefix a second time.

Serialize the Intel MID timeout callers with the same port lock used by
the callbacks and retirement worker. Keep that lock scoped to the flush,
since serial8250_handle_irq() takes it separately for the UART interrupt.

This relies on the provider honoring pause and synchronization; it does
not turn a pause-register write into a hardware-quiescence guarantee.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  7 ++-
 drivers/tty/serial/8250/8250_dma.c  | 87 +++++++++++++++++++++++++++----------
 drivers/tty/serial/8250/8250_dw.c   |  8 +++-
 drivers/tty/serial/8250/8250_mid.c  |  6 ++-
 drivers/tty/serial/8250/8250_port.c |  3 +-
 5 files changed, 80 insertions(+), 31 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 002e456fa384..c69c41c9df65 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -23,6 +23,7 @@ struct uart_8250_dma {
 	/* Completion processing with the port lock held. */
 	void (*tx_complete)(struct uart_8250_port *p);
 	struct work_struct tx_flush_work;
+	struct work_struct rx_flush_work;
 	struct uart_8250_port *port;
 
 	/* Filter function */
@@ -52,6 +53,7 @@ struct uart_8250_dma {
 	void			*tx_buf;
 
 	size_t			rx_size;
+	size_t			rx_pos;
 	size_t			tx_size;
 
 	unsigned char		tx_running;
@@ -60,6 +62,7 @@ struct uart_8250_dma {
 	/* Protected by the UART port lock. */
 	bool			shutting_down;
 	bool			tx_terminating;
+	bool			rx_terminating;
 };
 
 struct old_serial_port {
@@ -411,7 +414,7 @@ extern void serial8250_tx_dma_flush(struct uart_8250_port *);
 void serial8250_tx_dma_prepare_buffer(struct uart_8250_port *p,
 				      struct scatterlist *sgl, unsigned int nents);
 extern int serial8250_rx_dma(struct uart_8250_port *);
-extern void serial8250_rx_dma_flush(struct uart_8250_port *);
+int serial8250_rx_dma_flush(struct uart_8250_port *p);
 extern int serial8250_request_dma(struct uart_8250_port *);
 extern void serial8250_release_dma(struct uart_8250_port *);
 
@@ -467,7 +470,7 @@ static inline int serial8250_rx_dma(struct uart_8250_port *p)
 {
 	return -1;
 }
-static inline void serial8250_rx_dma_flush(struct uart_8250_port *p) { }
+static inline int serial8250_rx_dma_flush(struct uart_8250_port *p) { return 0; }
 static inline int serial8250_request_dma(struct uart_8250_port *p)
 {
 	return -1;
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index d4b1e2a059eb..821ccc7a3a54 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -77,31 +77,29 @@ void serial8250_tx_dma_prepare_buffer(struct uart_8250_port *p,
 }
 EXPORT_SYMBOL_GPL(serial8250_tx_dma_prepare_buffer);
 
-static void __dma_rx_complete(struct uart_8250_port *p)
+static enum dma_status serial8250_rx_dma_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tty_port = &p->port.state->port;
 	struct dma_tx_state	state;
 	enum dma_status		dma_status;
-	int			count;
+	size_t			count;
 
-	/*
-	 * New DMA Rx can be started during the completion handler before it
-	 * could acquire port's lock and it might still be ongoing. Don't to
-	 * anything in such case.
-	 */
+	/* Only inspect the buffer after completion or a successful pause. */
 	dma_status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
-	if (dma_status == DMA_IN_PROGRESS)
-		return;
+	if (dma_status != DMA_COMPLETE && dma_status != DMA_PAUSED)
+		return dma_status;
 
-	count = dma->rx_size - state.residue;
+	count = dma->rx_size - state.residue - dma->rx_pos;
 
-	if (tty_insert_flip_string(tty_port, dma->rx_buf, count) != count)
+	if (tty_insert_flip_string(tty_port, dma->rx_buf + dma->rx_pos,
+				   count) != count)
 		p->port.icount.buf_overrun++;
 	p->port.icount.rx += count;
-	dma->rx_running = 0;
+	dma->rx_pos += count;
 
 	tty_flip_buffer_push(tty_port);
+	return dma_status;
 }
 
 static void dma_rx_complete(void *param)
@@ -111,21 +109,37 @@ static void dma_rx_complete(void *param)
 	unsigned long flags;
 
 	uart_port_lock_irqsave(&p->port, &flags);
-	if (dma->shutting_down)
+	if (dma->shutting_down || dma->rx_terminating)
 		goto out;
-	if (dma->rx_running)
-		__dma_rx_complete(p);
+	if (dma->rx_running && serial8250_rx_dma_complete(p) == DMA_COMPLETE)
+		dma->rx_running = 0;
 
 	/*
-	 * Cannot be combined with the previous check because __dma_rx_complete()
-	 * changes dma->rx_running.
+	 * The completed transfer no longer owns the receive buffer.
 	 */
-	if (!dma->rx_running && (serial_lsr_in(p) & UART_LSR_DR))
+	if (!dma->rx_running && (p->ier & UART_IER_RDI) &&
+	    (serial_lsr_in(p) & UART_LSR_DR))
 		p->dma->rx_dma(p);
 out:
 	uart_port_unlock_irqrestore(&p->port, flags);
 }
 
+static void serial8250_rx_dma_flush_work(struct work_struct *work)
+{
+	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma,
+					       rx_flush_work);
+	struct uart_8250_port *p = dma->port;
+
+	dmaengine_synchronize(dma->rxchan);
+
+	guard(uart_port_lock_irqsave)(&p->port);
+	dma->rx_terminating = false;
+	dma->rx_running = 0;
+	if (!dma->shutting_down && (p->ier & UART_IER_RDI) &&
+	    (serial_lsr_in(p) & UART_LSR_DR))
+		dma->rx_dma(p);
+}
+
 int serial8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;
@@ -241,6 +255,7 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 		return -EBUSY;
 
 	dma->rx_running = 1;
+	dma->rx_pos = 0;
 	desc->callback = dma_rx_complete;
 	desc->callback_param = p;
 
@@ -251,16 +266,37 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 	return 0;
 }
 
-void serial8250_rx_dma_flush(struct uart_8250_port *p)
+int serial8250_rx_dma_flush(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
+	enum dma_status status;
+	int ret;
 
-	if (!dma || !dma->rxchan || !dma->rx_running)
-		return;
+	lockdep_assert_held_once(&p->port.lock);
+
+	if (!dma || !dma->rxchan || !dma->rx_running || dma->rx_terminating)
+		return 0;
+
+	ret = dmaengine_pause(dma->rxchan);
+	if (ret)
+		return ret;
+
+	status = serial8250_rx_dma_complete(p);
+	if (status != DMA_PAUSED && status != DMA_COMPLETE) {
+		dmaengine_resume(dma->rxchan);
+		return -EIO;
+	}
+	dma->rx_terminating = true;
+	ret = dmaengine_terminate_async(dma->rxchan);
+	if (ret) {
+		dma->rx_terminating = false;
+		dmaengine_resume(dma->rxchan);
+		return ret;
+	}
 
-	dmaengine_pause(dma->rxchan);
-	__dma_rx_complete(p);
-	dmaengine_terminate_async(dma->rxchan);
+	/* Keep the buffer reserved until any old completion has returned. */
+	schedule_work(&dma->rx_flush_work);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(serial8250_rx_dma_flush);
 
@@ -363,7 +399,9 @@ int serial8250_request_dma(struct uart_8250_port *p)
 
 	dma->port = p;
 	INIT_WORK(&dma->tx_flush_work, serial8250_tx_dma_flush_work);
+	INIT_WORK(&dma->rx_flush_work, serial8250_rx_dma_flush_work);
 	dma->tx_terminating = false;
+	dma->rx_terminating = false;
 
 	scoped_guard(uart_port_lock_irqsave, &p->port)
 		dma->shutting_down = false;
@@ -391,6 +429,7 @@ void serial8250_release_dma(struct uart_8250_port *p)
 		return;
 
 	cancel_work_sync(&dma->tx_flush_work);
+	cancel_work_sync(&dma->rx_flush_work);
 
 	/* Release RX resources */
 	dmaengine_terminate_sync(dma->rxchan);
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..d8998b6f1d81 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -134,6 +134,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 	unsigned int usr_reg = d->pdata ? d->pdata->usr_reg : DW_UART_USR;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	int retries;
+	int ret;
 	u32 lsr;
 
 	lockdep_assert_held_once(&p->lock);
@@ -147,7 +148,12 @@ static int dw8250_idle_enter(struct uart_port *p)
 	serial_port_out(p, UART_IER, 0);
 
 	if (up->dma) {
-		serial8250_rx_dma_flush(up);
+		ret = serial8250_rx_dma_flush(up);
+		if (ret) {
+			serial_port_out(p, UART_IER, up->ier);
+			d->in_idle = 0;
+			return ret;
+		}
 		if (serial8250_tx_dma_running(up))
 			serial8250_tx_dma_pause(up);
 	}
diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
index 44b43163df51..83f928b1f643 100644
--- a/drivers/tty/serial/8250/8250_mid.c
+++ b/drivers/tty/serial/8250/8250_mid.c
@@ -94,7 +94,8 @@ static int tng_handle_irq(struct uart_port *p)
 	/* Rx DMA */
 	err = hsu_dma_get_status(chip, mid->dma_index * 2 + 1, &status);
 	if (err > 0) {
-		serial8250_rx_dma_flush(up);
+		scoped_guard(uart_port_lock_irqsave, p)
+			serial8250_rx_dma_flush(up);
 		ret |= 1;
 	} else if (err == 0)
 		ret |= hsu_dma_do_irq(chip, mid->dma_index * 2 + 1, status);
@@ -148,7 +149,8 @@ static int dnv_handle_irq(struct uart_port *p)
 	if (fisr & BIT(2)) {
 		err = hsu_dma_get_status(&mid->dma_chip, 1, &status);
 		if (err > 0) {
-			serial8250_rx_dma_flush(up);
+			scoped_guard(uart_port_lock_irqsave, p)
+				serial8250_rx_dma_flush(up);
 			ret |= 1;
 		} else if (err == 0)
 			ret |= hsu_dma_do_irq(&mid->dma_chip, 1, status);
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index d476ebc37647..b9837a3c4681 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1815,8 +1815,7 @@ static bool handle_rx_dma(struct uart_8250_port *up, unsigned int iir)
 		fallthrough;
 	case UART_IIR_RLSI:
 	case UART_IIR_RX_TIMEOUT:
-		serial8250_rx_dma_flush(up);
-		return true;
+		return !serial8250_rx_dma_flush(up);
 	}
 	return up->dma->rx_dma(up);
 }

-- 
2.53.0

