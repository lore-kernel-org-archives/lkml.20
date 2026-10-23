Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715666;
	b=nh0eMJ+M5T0ho1k7dKkc/pNgGoQbjGosagQ2wnRfz+sRH/1uFglbjWq/18Ae98Gws6oT
	 CN6nlhex0HmK8Ux2M3LBM2RrN+V6WdP+WhbPk4JnP/hY0nWDFTbvdRixhwMFpm/4zbwVU
	 eWfwMU/+kao0adsDOcoXQdUIQFS8jYKznqLwrnMc38s5ZKDjfzsRZZtDaJe5/eoptGDjA
	 hwsS3V2roxj1nU9dbmRfM/SUNiLr+fCM3YNZZykjAc08nGl9RJ2A7nwWJTTwYZISiGTMM
	 +Co2pNUyLE/UvviaYxyAH9Y/2W/nH8eIFtDbWh9kMZRFOPC2je6xQN/fa+xfd6OBSXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=N114Wg+f6y3cnoXmzdumx2HjwL1yfPTBv6BapW6pz3g=;
	b=jVxa/rxGzhJ32rUt2v9lLHjOaRPCBCjBOvv3RKyk3whLdG47DQPuEQQqaroStN7E3j94
	 xcXTB7PrVQ3U/okFoFb5W8smEouoEUah+t925XQlYEhFmQCiuGXMdIUmRyl0IaWud5q0l
	 EcT4Oj38JUpInMSMR+2sA9jrwVq5T7bCgO+1MjFafCCYEEI1q2txfE0Z5OuFj5uk1+Mch
	 92w1HTW80TGF9Eia06/w75meBzjaWR0JS3fsBAq5TZzubAf11s3fZ3UybYlIDpfQDNqmn
	 rK7jy5Kf/6UPdsw2qSfls/UfK70/vuCZtl3d44dhKbVlaJQL8QQHI7DUYoG8ATkvI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=chJXMPrV;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A7E606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A7E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=chJXMPrV
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702fd86d674so230445eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715664; x=1793320464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N114Wg+f6y3cnoXmzdumx2HjwL1yfPTBv6BapW6pz3g=;
        b=chJXMPrV0nuFdHTlQxZ+692XeFahev+ou+KLablmXncH959zkVPbeIbZD6Sil/BZCF
         FAvwiGLSslEv+VQ7cItoetIgJJvPWg+IPsTvxI+vYoXQUte2GoupHVCpGODkGFp/fC0p
         X99I6W3Ej+xmerYvmEZYtlPIOPL3krm0TRGIwHK4XrPFV7i8btFfurq/MIni2zq+ZI9a
         I5NgUEmkC5j2ulbAX6k6tMNImEdN2hsROaqPGn3hUAJwbxTqYECuKJl/9B3pMm41AO/W
         20KwYvm4W+ohXCLttxdDSzVzVAtfsqVX2nOKMG/mOBD9sJ9N2jraQPmvQzKcSQXsPqu4
         R3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715664; x=1793320464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N114Wg+f6y3cnoXmzdumx2HjwL1yfPTBv6BapW6pz3g=;
        b=icXTuCXnRlv59a60pcP1pb9r0iOVlpzb7/AXkXHRZ/byxeXA/Y2fG+WIb9UpUtnsdk
         fRy8gJcBU995HngIN5h9MlnOoYzQE8BmhrCZ0PY/id9a4wQayeAbMTPGYvDuxQRgv/vI
         otOYOQDPkJwZEDAIDhOVfrjJWM65SByqfDE3zUVmoG5mQIb0tzJpFeGY/QBjj/XelR/a
         ORxkvRF//uMhngmufiLPSe0cpKlcQVnCbZlCtDhyolGR/6hE/q8dfKYIvw5n/5bUG4uG
         noqkkhRWNRTnry6y+p1LGmZNiVW2DAhGDjghCG8faDCk5khZgfNKA+uBWucFYS59YNxb
         P1cA==
X-Gm-Message-State: AFq9FYL3aIdBLZGoRLvxjvfppcJ8gRmxFkxCe6mNmH2gI9aSIjyqpSOs
	YSvqqtxak19m1cgn101TBneAMbSGOHpii6LnxTun7H/PxaVJDRH3TQFo
X-Gm-Gg: AYBFou2hiR8XaeVpVY0y3p7CkP16Wd6Ri9m5aXPxjVdNq/d5hkzx2QfFNB1+3N3yFG3
	I+T1msGOfyvfAGH9PBWoouqAlOYs7JI+wEWfm6r+9qTj9qLzwgML8W3z7NvBmejgYgekhSqj3td
	GqkrGfasEKTU0+uuFkYcpPpeLWECtnstAfSoBHk955UzSjTYMiA1CFN1/jIIPeOMtqk/eb9S+8U
	vl/YtWsAW2TQXtkXwDk5d8N02B5+a+sFqlDn11m2AFMxjNeCCkW2Tk/V2ngGzeEsq8jFuCynggx
	3yY2bYwwW7rGFkkDkSmHWLJh7SAtRc3fbkwaggALjySu9/mrcnPRZyM6ccUN+RzTgynYTCZligy
	YZe1b4nCi8UWGHd2ilCfue2J7FzMBl5ImuayHZjmxzkxQreuJpb90chEKommr3P0GrNpxwTEXxT
	m95YLk1npYxgI+YbTcqzSC/OdHrB+Ec+h0GBxWEWiVM2lNC5Jy2Vd2gkn+4az/Cj6nOXEWAkQyf
	Pf+myR9oHePKUyBQETsiJJ6hF+WbfbriuEZkZUB5OqIRw8Zd6BfSnH2G05gGUNM5cnoBGHB6pzF
	42oirnNFg/5lgrj5idaCZqR+zcBPV0N8uxR0EAYBK4XYnQF+Ng1wioPr5OlVo36JZay/yqbhhC/
	fu2Ll9UhcDxJiHYRvvUCtrtc7vx5wkZb3vH7iMUOeuNl0hhIPdqTRTwSDH+3KDpDD8uDAt+58oW
	Drnw==
X-Received: by 2002:a05:6820:60b:b0:6b7:83c5:fe01 with SMTP id 006d021491bc7-70b88b6355dmr734573eaf.66.1792715664174;
        Thu, 22 Oct 2026 17:34:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a820a9bcf6sm459716fac.12.2026.10.22.17.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:34:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 18:34:04 -0600
Subject: [PATCH v2 3/4] serial: 8250: drain canceled TX DMA before reusing
 its buffer
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
Message-Id: <20261022-submit-serial-8250-dma-cancel-v1-v2-3-088ea51e3891@gmail.com>
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

uart_flush_buffer() resets the transmit kfifo before calling the driver.
serial8250_tx_dma_flush() terminates DMA asynchronously and clears
tx_running, allowing a new write to replace tx_size while the old callback
is still waiting for the port lock. That callback can then consume bytes
from the new transmission. Reusing the reset kfifo can also overwrite the
source of a transfer that has not stopped yet.

Reserve the flushed FIFO storage through serial core before returning
from the flush callback. Keep tx_running set until a worker synchronizes
the terminated channel, suppressing old callbacks and new submissions
during that interval. Return the mapping to CPU ownership before releasing
the reservation and waking writers. Normal transfers continue to use the
FIFO directly.

Reuse the locked completion processing after retirement, including OMAP
delayed register restoration and transmitter-empty handling. Take a runtime
PM reference around worker UART accesses and drain the worker before
releasing the channels. Shutdown releases the reservation after stopping
DMA and unmapping its source.

Track a flushed FIFO separately from the transfer length. If termination
fails, retain the reservation until normal completion and account the
completed bytes without advancing the reset FIFO. After successful
cancellation, process a zero-length completion once callbacks have drained.

The race was found by inspecting cancellation and restart while preparing
H616 UART DMA support.

Fixes: a424a34b8fad ("serial: 8250: Fix TX deadlock when using DMA")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  13 +++-
 drivers/tty/serial/8250/8250_dma.c  | 123 ++++++++++++++++++++++++++----------
 drivers/tty/serial/8250/8250_omap.c |  21 ++++--
 3 files changed, 115 insertions(+), 42 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 974a47f24084..ec837c380695 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -11,6 +11,7 @@
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/dmaengine.h>
+#include <linux/workqueue.h>
 
 #include "../serial_mctrl_gpio.h"
 
@@ -19,6 +20,10 @@ struct uart_8250_dma {
 	int (*rx_dma)(struct uart_8250_port *p);
 	void (*prepare_tx_dma)(struct uart_8250_port *p);
 	void (*prepare_rx_dma)(struct uart_8250_port *p);
+	/* Completion processing with the port lock held. */
+	void (*tx_complete)(struct uart_8250_port *p);
+	struct work_struct tx_flush_work;
+	struct uart_8250_port *port;
 
 	/* Filter function */
 	dma_filter_fn		fn;
@@ -53,6 +58,8 @@ struct uart_8250_dma {
 	unsigned char		rx_running;
 	/* Protected by the UART port lock. */
 	bool			shutting_down;
+	bool			tx_terminating;
+	bool			tx_flushed;
 };
 
 struct old_serial_port {
@@ -402,6 +409,8 @@ static inline int is_omap1510_8250(struct uart_8250_port *pt)
 #ifdef CONFIG_SERIAL_8250_DMA
 extern int serial8250_tx_dma(struct uart_8250_port *);
 extern void serial8250_tx_dma_flush(struct uart_8250_port *);
+void serial8250_tx_dma_sync_buffer(struct uart_8250_port *p,
+				   struct scatterlist *sgl, unsigned int nents);
 extern int serial8250_rx_dma(struct uart_8250_port *);
 extern void serial8250_rx_dma_flush(struct uart_8250_port *);
 extern int serial8250_request_dma(struct uart_8250_port *);
@@ -434,7 +443,7 @@ static inline void serial8250_tx_dma_pause(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
 
-	if (!dma->tx_running)
+	if (!dma->tx_running || dma->tx_terminating || dma->shutting_down)
 		return;
 
 	dmaengine_pause(dma->txchan);
@@ -444,7 +453,7 @@ static inline void serial8250_tx_dma_resume(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
 
-	if (!dma->tx_running)
+	if (!dma->tx_running || dma->tx_terminating || dma->shutting_down)
 		return;
 
 	dmaengine_resume(dma->txchan);
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 57fc7915adac..bb30d3588f16 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -11,24 +11,23 @@
 
 #include "8250.h"
 
-static void __dma_tx_complete(void *param)
+static void serial8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
-	unsigned long	flags;
 	int		ret;
 
-	uart_port_lock_irqsave(&p->port, &flags);
-	if (dma->shutting_down)
-		goto out;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
 	dma->tx_running = 0;
 
-	uart_xmit_advance(&p->port, dma->tx_size);
+	if (dma->tx_flushed) {
+		p->port.icount.tx += dma->tx_size;
+		uart_xmit_unblock(&p->port);
+	} else {
+		uart_xmit_advance(&p->port, dma->tx_size);
+	}
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(&p->port);
@@ -36,11 +35,55 @@ static void __dma_tx_complete(void *param)
 	ret = serial8250_tx_dma(p);
 	if (ret || !dma->tx_running)
 		serial8250_set_THRI(p);
+}
 
-out:
-	uart_port_unlock_irqrestore(&p->port, flags);
+static void __dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (!dma->shutting_down && !dma->tx_terminating)
+		serial8250_tx_dma_complete(p);
+}
+
+static void serial8250_tx_dma_flush_work(struct work_struct *work)
+{
+	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma, tx_flush_work);
+	struct uart_8250_port *p = dma->port;
+
+	/* Neither the channel nor its buffer may be reused before this returns. */
+	dmaengine_synchronize(dma->txchan);
+
+	guard(serial8250_rpm)(p);
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	dma->tx_terminating = false;
+	dma->tx_size = 0;
+	if (!dma->shutting_down)
+		dma->tx_complete(p);
 }
 
+void serial8250_tx_dma_sync_buffer(struct uart_8250_port *p,
+				   struct scatterlist *sgl, unsigned int nents)
+{
+	struct uart_8250_dma *dma = p->dma;
+	struct device *dev = dmaengine_get_dma_device(dma->txchan);
+	struct scatterlist *sg;
+	unsigned int i;
+
+	/* DMA reads the FIFO directly; its occupied ranges remain reserved. */
+	for_each_sg(sgl, sg, nents, i) {
+		size_t offset = sg_dma_address(sg) - dma->tx_addr;
+
+		dma_sync_single_range_for_device(dev, dma->tx_addr, offset,
+						 sg_dma_len(sg), DMA_TO_DEVICE);
+	}
+}
+EXPORT_SYMBOL_GPL(serial8250_tx_dma_sync_buffer);
+
 static void __dma_rx_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma	*dma = p->dma;
@@ -103,6 +146,8 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 
 	if (dma->shutting_down)
 		return 0;
+	if (dma->tx_terminating)
+		return 0;
 
 	if (dma->tx_running) {
 		if (up->x_char) {
@@ -131,24 +176,25 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 		dma->tx_size += sg_dma_len(sg);
 
 	serial8250_do_prepare_tx_dma(p);
+	serial8250_tx_dma_sync_buffer(p, sgl, ret);
 
 	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
 				       DMA_MEM_TO_DEV,
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
+		dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
+					UART_XMIT_SIZE, DMA_TO_DEVICE);
 		ret = -EBUSY;
 		goto err;
 	}
 
 	dma->tx_running = 1;
+	dma->tx_flushed = false;
+	dma->tx_complete = serial8250_tx_dma_complete;
 	desc->callback = __dma_tx_complete;
 	desc->callback_param = p;
 
 	dma->tx_cookie = dmaengine_submit(desc);
-
-	dma_sync_single_for_device(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
-				   UART_XMIT_SIZE, DMA_TO_DEVICE);
-
 	dma_async_issue_pending(dma->txchan);
 	serial8250_clear_THRI(p);
 	dma->tx_err = 0;
@@ -162,32 +208,31 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 void serial8250_tx_dma_flush(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
+	int ret;
 
-	if (!dma->tx_running)
+	if (!dma->tx_running || dma->tx_terminating || dma->shutting_down)
 		return;
 
 	/*
 	 * kfifo_reset() has been called by the serial core, avoid
-	 * advancing and underflowing in __dma_tx_complete().
+	 * advancing the reset FIFO when the old transfer completes.
 	 */
-	dma->tx_size = 0;
+	dma->tx_flushed = true;
+	/* The core reset the FIFO indices, but DMA may still read its storage. */
+	uart_xmit_block(&p->port);
 
 	/*
 	 * We can't use `dmaengine_terminate_sync` because `uart_flush_buffer` is
 	 * holding the uart port spinlock.
 	 */
-	dmaengine_terminate_async(dma->txchan);
-
-	/*
-	 * The callback might or might not run. If it doesn't run, we need to ensure
-	 * that `tx_running` is cleared so that we can schedule new transactions.
-	 * If it does run, then the zombie callback will clear `tx_running` again
-	 * and perform a no-op since `tx_size` was cleared above.
-	 *
-	 * In either case, we ASSUME the DMA transaction will terminate before we
-	 * issue a new `serial8250_tx_dma`.
-	 */
-	dma->tx_running = 0;
+	dma->tx_terminating = true;
+	ret = dmaengine_terminate_async(dma->txchan);
+	if (ret) {
+		/* Keep the buffer owned by the transfer until its callback runs. */
+		dma->tx_terminating = false;
+		return;
+	}
+	schedule_work(&dma->tx_flush_work);
 }
 
 int serial8250_rx_dma(struct uart_8250_port *p)
@@ -312,21 +357,29 @@ int serial8250_request_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
-	/* TX buffer */
+	/* Normal TX uses serial core's FIFO; flush reserves it until retirement. */
 	dma->tx_addr = dma_map_single(tx_dev, p->port.state->port.xmit_buf,
 				      UART_XMIT_SIZE, DMA_TO_DEVICE);
 	if (dma_mapping_error(tx_dev, dma->tx_addr)) {
-		dma_free_coherent(rx_dev, dma->rx_size,
-				  dma->rx_buf, dma->rx_addr);
 		ret = -ENOMEM;
-		goto err;
+		goto free_rx;
 	}
+	dma_sync_single_for_cpu(tx_dev, dma->tx_addr,
+				UART_XMIT_SIZE, DMA_TO_DEVICE);
+
+	dma->port = p;
+	INIT_WORK(&dma->tx_flush_work, serial8250_tx_dma_flush_work);
+	dma->tx_terminating = false;
+	dma->tx_flushed = false;
 
 	scoped_guard(uart_port_lock_irqsave, &p->port)
 		dma->shutting_down = false;
 	dev_dbg_ratelimited(p->port.dev, "got both dma channels\n");
 
 	return 0;
+free_rx:
+	dma_free_coherent(rx_dev, dma->rx_size,
+			  dma->rx_buf, dma->rx_addr);
 err:
 	dma_release_channel(dma->txchan);
 release_rx:
@@ -342,6 +395,8 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	if (!dma)
 		return;
 
+	cancel_work_sync(&dma->tx_flush_work);
+
 	/* Release RX resources */
 	dmaengine_terminate_sync(dma->rxchan);
 	dma->rx_running = 0;
@@ -354,6 +409,8 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
+	scoped_guard(uart_port_lock_irqsave, &p->port)
+		uart_xmit_unblock(&p->port);
 	dma_release_channel(dma->txchan);
 	dma->txchan = NULL;
 	dma->tx_running = 0;
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 46f1fff361dd..b9b3c18fc9f4 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1092,7 +1092,12 @@ static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 
 	dma->tx_running = 0;
 
-	uart_xmit_advance(&p->port, dma->tx_size);
+	if (dma->tx_flushed) {
+		p->port.icount.tx += dma->tx_size;
+		uart_xmit_unblock(&p->port);
+	} else {
+		uart_xmit_advance(&p->port, dma->tx_size);
+	}
 
 	if (priv->delayed_restore) {
 		priv->delayed_restore = 0;
@@ -1125,7 +1130,7 @@ static void omap_8250_dma_tx_complete(void *param)
 
 	guard(uart_port_lock_irqsave)(&p->port);
 
-	if (!dma->shutting_down)
+	if (!dma->shutting_down && !dma->tx_terminating)
 		omap_8250_tx_dma_complete(p);
 }
 
@@ -1139,7 +1144,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 	int skip_byte = -1;
 	int ret;
 
-	if (dma->shutting_down || dma->tx_running)
+	if (dma->shutting_down || dma->tx_terminating || dma->tx_running)
 		return 0;
 	if (uart_tx_stopped(&p->port) || kfifo_is_empty(&tport->xmit_fifo)) {
 
@@ -1198,24 +1203,26 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
+	serial8250_tx_dma_sync_buffer(p, &sg, 1);
+
 	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
 			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
+		dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
+					UART_XMIT_SIZE, DMA_TO_DEVICE);
 		ret = -EBUSY;
 		goto err;
 	}
 
 	dma->tx_size = sg_dma_len(&sg);
 	dma->tx_running = 1;
+	dma->tx_flushed = false;
+	dma->tx_complete = omap_8250_tx_dma_complete;
 
 	desc->callback = omap_8250_dma_tx_complete;
 	desc->callback_param = p;
 
 	dma->tx_cookie = dmaengine_submit(desc);
-
-	dma_sync_single_for_device(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
-				   UART_XMIT_SIZE, DMA_TO_DEVICE);
-
 	dma_async_issue_pending(dma->txchan);
 	if (dma->tx_err)
 		dma->tx_err = 0;

-- 
2.53.0

