Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715664;
	b=fwIk5eU0AGEPTwEfelNDbeKSD9zG1XdhsNikaM3oYHITXwWRATwM8he+S/xqcqTJLkSZ
	 3FlNx12j+pNEWc5Rqc2kj8N7PuJ0JYz5vo7ImOZ9IYFqt7ZoMSBJGFrgqcr04lYO/U1gY
	 HWq/f6u1jsdS6yx75l0CEbsF8rRXwcrnbI/E5uTUM76G/aX/y3SP0OiCydZUKdNB5IBXp
	 CeFbUgp75qTcaBGSdTPAk7ME9iLOUum6TQCQ8Qp9pUK18+Dwb3LO1rhO1GE4771yh8bGT
	 dCayquop1Lj3uk82SwTmxXJ53OAVoq1p9wlCJEQPCGUwqE3QsrK1suq3rEvf0iMIEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xCNmnAMxphqz2uG35/ba+omaEbEimRYviBo2UjFGZcQ=;
	b=DW6BSkAlUcNtClYTNLxEla2LQLV4TIi0//eOAoPaIAbXz0QZu4m1rwxIpdtagvjo5RKI
	 eoBsh2HJkW0B5vzvO51CLICMt5fVG6oUCoxqEM2XCj0AHkcQlxkbJoVg3PwFIwtdWYto9
	 80O/7LZLXH/XcylsmlpHwcLgilBRnA8LVx5iql6enIJQ2VVwB5ql/F3hYlV72y2x29PsX
	 Jy+wim2fqvULe0N/KkMPWT8ebfVtPIyteBPyLrqKfzmBwVSEJF0iA5/SEp2LUhXNLHySV
	 gGRkVXjCxHSYP9UmAFE+P75DSoqfmrZ1unq7YpEYPTzk8afNqOX/8VyP0/N/8020c6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y1pltY9J;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB6606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFB6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y1pltY9J
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-483a66818edso214102fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715663; x=1793320463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCNmnAMxphqz2uG35/ba+omaEbEimRYviBo2UjFGZcQ=;
        b=Y1pltY9JN9is/Ix+QWIDFlXbIS9eby0RgU4m7i3Fjs8M/G9sFBQ/6rPLYSq0lPsBWU
         OFmdiU7G+Do04R6O2kEzpZ6+8/lXiE3TI1fo8WMTwqKlfmL+w9Oir18EbCujM35qy6Mc
         hgnOIRGxmJzF7d8qjdbptDHZRNcZ3gQigzqEWl+Pyztc6y2CmycqupldCwYd9WVyUvP6
         YwUlfmgdvQLD/3ouyrBL5Ca1O+GYm0f7hMwz0wkvhP4NyYi//nNXlowGa17MM0YwW7RV
         zucQrh2xndMg4dIUKm1zX9Tt1551B/l9sgvZG0/t+CG96tMr6WXC94UckmvxCaY80rOA
         lLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715663; x=1793320463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCNmnAMxphqz2uG35/ba+omaEbEimRYviBo2UjFGZcQ=;
        b=ORqhAaUR55/m6dYFqseCyF9W5CtYiUo954X2jf4QbD9skhMVaNNre9Oe06pf8olGRG
         HEBFhWOONjQLCtJ2jXoqnTSOVByFwonYL7prTij0XI2cIJU5nd4kOaEw2qIkZ87KgB6I
         EMFiROnTNVyrxNoSStKEg8QJHYp7m2Hy7LrRuTIZ8HqbHWrB2vVb9Kv08hpQW3NfBqT5
         KNXVWxTvfe2FwD2Uf5FSf86mP5CTBWf3cBn9NvajafqeEC6ZOifq++dcC3a8lS2RYKla
         RWW+taPZyZy/v2RoO9XXGg0bMesHYqtIf8asSRo93IbIxXFXN+ihAcASq/PUQHbRzKPg
         LApQ==
X-Gm-Message-State: AFq9FYLoDl97fD+EhcKrGPI1wFsKjqz4REo8dwPoHWm3/St+jU+BNAYB
	dkfY8FIpk9VgE+xx43Oq18mO7lDn5q2aYWRUWLgl6+qxm6RYZG8PyNF6
X-Gm-Gg: AYBFou1e1GxFvzy1O3R87lEJBbEvreepPbdZPYIs4dYuZ9XHsnDsi4afFepQvGgkCx9
	8Ul5hNadonkF/KmMdFYVvoDrs1XmhuVgTXJsTBCId9TFeTgLqGBQjKYoKd/DBSoiITQF7B/Jtx1
	nsuReOn/J7Ezb0W2mJwGsd2UVQoCcYd+7TsYW8OwrJS9rGDaawjlzPYsHo8yTW11+QjK6h+8hqE
	J0oXahObQz9/2K3G28d6CIxeyGxLgWLca7u1a6NKnHavHh1huqVb4lOSLoHtSGwtsL1kgLFCqsZ
	HiDVnRXYMN0jRarJFo+1JiVGmzdB8AWbI4Oef5MG7LVh1jp3UQHrHDy/40s0hfqTl19gxJt6Pes
	27em4tzHxLcsay15DfKX63/x4eugMK2bvM+1pW+qKpepK/pFW2qMtMReChYUnoF7xa+eWmEW3xd
	l2SkRQZ0BpcLkCg9rDEL6hgCyN4vafIIssvJzoO2VMNa0DltrmMJgSyLKcPZQYQoUE3ByMgUzeZ
	8zACI8my3emg6Sie2iNXalGDr5X5OOtTT8EO7vubcGCMuxUlcY51lCs8UQ7bSiHWplrP6y9e7tR
	NuKqHg0Zi1u+5JLEKa6oCFSalbJj6utDJ/CnGjTNP6D/Mbi9JtEHV9m3Gm3OZOAxJJ7T9k04ZEc
	a4+0MxpN/08Fl0nwG2pKOaZY6gTsleBCCbVNMd2zS0IYxJQvEn175EGrq+Bm/CCvCoCb37cpkcV
	xaBQ==
X-Received: by 2002:a05:6870:812e:b0:491:520f:e6d0 with SMTP id 586e51a60fabf-4a821ef8dcemr318338fac.4.1792715663148;
        Thu, 22 Oct 2026 17:34:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a820a9bcf6sm459716fac.12.2026.10.22.17.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:34:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 18:34:03 -0600
Subject: [PATCH v2 2/4] serial: core: allow drivers to reserve flushed
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
Message-Id: <20261022-submit-serial-8250-dma-cancel-v1-v2-2-088ea51e3891@gmail.com>
References: <20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com>
In-Reply-To: <20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com>
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
and put_char() accept no data. Releasing the reservation wakes writers
through the existing TTY wakeup path. This preserves immediate logical
flushing while applying write backpressure until the storage is reusable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/serial_core.c | 47 +++++++++++++++++++++++++++++++++++++---
 include/linux/serial_core.h      | 16 ++++++++++++--
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..f82c812f842f 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -123,6 +123,46 @@ void uart_write_wakeup(struct uart_port *port)
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
+ *
+ * The driver must unblock after retiring the transfer, including on shutdown.
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
@@ -260,6 +300,7 @@ static int uart_alloc_xmit_buf(struct tty_port *port)
 	uport = uart_port_ref_lock(state, &flags);
 	if (!state->port.xmit_buf) {
 		state->port.xmit_buf = buf;
+		state->xmit_blocked = false;
 		kfifo_init(&state->port.xmit_fifo, state->port.xmit_buf,
 				PAGE_SIZE);
 		uart_port_unlock_deref(uport, flags);
@@ -593,7 +634,7 @@ static int uart_put_char(struct tty_struct *tty, u8 c)
 		return 0;
 	}
 
-	if (port)
+	if (port && !state->xmit_blocked)
 		ret = kfifo_put(&state->port.xmit_fifo, c);
 	uart_port_unlock_deref(port, flags);
 	return ret;
@@ -624,7 +665,7 @@ static ssize_t uart_write(struct tty_struct *tty, const u8 *buf, size_t count)
 		return 0;
 	}
 
-	if (port)
+	if (port && !state->xmit_blocked)
 		ret = kfifo_in(&state->port.xmit_fifo, buf, count);
 
 	__uart_start(state);
@@ -640,7 +681,7 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_ref_lock(state, &flags);
-	if (!state->port.xmit_buf)
+	if (!state->port.xmit_buf || state->xmit_blocked)
 		ret = 0;
 	else
 		ret = kfifo_avail(&state->port.xmit_fifo);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..92164bd598ba 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -208,8 +208,16 @@ struct gpio_desc;
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
+ *	since serial core then frees the transmit buffer.
  *
  *	Locking: @port->lock taken.
  *	Interrupts: locally disabled.
@@ -834,6 +842,8 @@ enum uart_pm_state {
  */
 struct uart_state {
 	struct tty_port		port;
+	/* Flushed TX storage is reserved; protected by the UART port lock. */
+	bool			xmit_blocked;
 
 	enum uart_pm_state	pm_state;
 
@@ -909,6 +919,8 @@ struct uart_driver {
 };
 
 void uart_write_wakeup(struct uart_port *port);
+void uart_xmit_block(struct uart_port *port);
+void uart_xmit_unblock(struct uart_port *port);
 
 /**
  * enum UART_TX_FLAGS -- flags for uart_port_tx_flags()

-- 
2.53.0

