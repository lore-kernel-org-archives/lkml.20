Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435406;
	b=bjk4BuxR7+cgMOEIaQxg3mgXpBBHfnWHLqlpdvMoLDrLBfrvrraT/3cIbz9AaxZ6UX03
	 2G4UzMZGBFGDuL9ZDTEuBAqzoDFEocYSWG0vCgNizxN3z/QGWcO3HE8hadWI/XTe/7nLj
	 mzYISSaQqQPTy8GdEBDNx0PKTeCm7i+dKbXVuOOfmaHNVQLviz0GzgWKH7X5+/D3KYFEU
	 Z6718q+q+EM0lLRyZLNg5+oLYtuVhCkaPTFQ6SIyVySFQLS7jSlVBOJL9xXiZbkzhq4p+
	 DxGG8I88dpfGlarrynv+9A8jDpesYxKPgbtp86WNWb8se46PqedcZ1s7uYPozdmVB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
	b=d33KGv9OcpNKoKx2XUeJ4KJEw4n9oGH2vR3sVxVJ5wGTqp3gggEvLYZHc8rbXL0VOeA4
	 7kZ91monJAp+QvTeoh9MKMGLB9IE8+27XC2onS4C8nonWdM8cPo2/Y1cFqaKJYAy0e09A
	 QwC1p1ODBbIs6WmvRB+N1fJaMHT8BY5GY2dIJR6ar0QO5KDr78Es4ygP8AZNlR+GDJRT8
	 NKUuulQvK9AbhWfj6fky55FtiLQR9wdl4A5PRqrX4RWSuHwIG2VpcFssjuWJ1jarZKBdL
	 vy6swz7YLdc3RkPY9dQaDCNbtBach81IFgRKojo5vCu7aAso+A2OucOTY69Fdm/j4Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Inw4TnAA;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EE1606A8BE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EE1606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Inw4TnAA
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f488ba6e90so1365157b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435405; x=1795040205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=Inw4TnAAUGWYGPeZymjF6AzDrvHa5kz04Ejs2ZNTW2FWKWRPNDgoa3CY7S6h1adJEW
         ZSdzhBA/njJQS4+36NSq6yWvJMgnuvOkdCL13qhF1hgZMZ48+CIckgwMxiAlDd7Dx+Jr
         yifcpm/deIHtC4LkRUxIMs7MJ8UCxMKDOCr4EfDjF+p5z6AYqYGI9wquK8UGLv7H/2Gx
         hFJa4yfUaZqafPzhaRcIEssQ5viHKM6J5Iad+udlo8gnJ3DNDc+zazMnPgoUc0mFRg1F
         uCMgAc3ptmTKE1Oqdtd/F9SbGSv/RLib5wXPLadatRjaIYzM9FydKEXG4nQO6hcAbR8c
         w6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435405; x=1795040205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=04EkFhRqsSQhD3cxug61hukxJU0ohxfdGWSjJNfxQye1QYx9beqM42ZFvADW3iym2h
         A0BzvNsBay1wn2e2maVQd1ySgjLiH3TVDXUeMJR+a/99MqKhJYj6Ct6u58mFlaUkBEMY
         N/T+Fbtn/K9vT535o7Tk1WD3LjAQvr4J9zq+pRLZ6SSZASGd1GR/iT7t6zAISfMfeYim
         MjCAR/gtg18bwsqgF3BT2S9N0v7DWBE2u4LglgDXljHdlrXAM6NwCBvFqUfWVSIhNHE3
         RsMAN/6LgXFaZQj5+lshAnrmGokPvwB1kbslgl0UU0wUnOIyjqUEQ/ek0yghcFwD/+jH
         T8Cw==
X-Gm-Message-State: APuU4Z+276ya8z/cuufQf3oyS8xoTP+BAY8AL+iH5GedjTKEGAw9El7g
	F9KFhELL8Nv2i5OGjDZkwLr3O4516b9k56dP3HX4Fs0EdOoKd5ZMbGIV
X-Gm-Gg: AYBFou3OazCYh3wQVofJu2Pr6Ctt5DCJ7FvopWClcaExwzyvNi3+B9nAz4ed5SPUfio
	vfcDFIIgUtY5UFsiO9hcTwWddEepN0eS6bEsqK098ueQo5mfi7wBjzyQHQa3zk2eMdQJ7CKtLps
	7bL3AZ1e1u0RuAhv7mmAt4HBdtzNMKAfBjvCOkUsnt1pxAF2sxeizvoBqJBCMjzJkzPK4VJ2gvn
	WsZvLNPHeP5f4f8t7JmtZ4x0i6FvICK3/83kGiIWuB5kGd9OwhKW/EEGv6qVoVVoQb8OPEN+1QA
	eaOliJfkTJ2KZ3T0Zk0slNF9lHoxZAPH6sxmfP1lg5zHzMso6qxw8ucKEGe6tclCSSH5hlFn88L
	btfhpsbsyDLaIGV8TOeVlrqX79hC95xsDLBegqRXw+nB7YuxJ8Tom5/lNjgOHktWrpQloGFex1t
	Iif//VSzkYHr0eFUKctg1wDzMwDIolq53uV4JYwbJEW/NlsMyUQLlkukqVBNxh7JM9L0w3/vCjo
	lI8GJBwsJRcc7ph+bu+myZON0z4SAk67ftYSi7wn5p8YPWyvlq7sFi9w9ssollJeK/uEoc74s2n
	pZw+4hAnEpICfZO+UnCfySxL+b/D+HSAQU8SPLZDYFq3PfUdHrFiLPjOrOeYSYrwParqzdauwIE
	xqVb4Xn+ltl1yFS5Fx3YvF0j2gVcOFtVNp0l3mRm50qCSPgeGW4+oKpJ8u5ENG1fahoT00FyZku
	1IVT1JG2DJEqAvdNyGUZYsikOwynXQE8/6pRz2BG44HmMxD1g3Xf1AIRvxJS0Tk4cflQEwnghU
X-Received: by 2002:a05:6808:1902:b0:4f9:6348:cd3b with SMTP id 5614622812f47-56b97101439mr3389720b6e.41.1794435404903;
        Wed, 11 Nov 2026 14:16:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:33 -0700
Subject: [PATCH v12 8/8] serial: 8250: retain DMA resources when
 termination fails
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-8-9e3456bc2555@gmail.com>
References: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
In-Reply-To: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
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

serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
the channels. If the provider fails to stop a channel, the DMAengine
wrapper returns the error without synchronizing its callbacks. Hardware
or a detached callback can then access the released storage and state.

Checking the error and returning early would not preserve their lifetime:
serial core frees the TX FIFO after the driver's shutdown callback returns,
and port removal can then release the callback context as well.

Require successful synchronous termination of both channels before
releasing any DMA resources. Retry failed channels after a sleep outside
the port lock, leaving channels that have already stopped and drained
alone. Keep the shutdown gate and storage reservation in place throughout
the retries.

Start retries with a 1 ms sleep and double it up to one second. This
makes short-lived failures responsive while bounding sustained retry
activity; neither delay is a hardware timeout. Report the initial failure
and ongoing failures with the elapsed time and current RX/TX error codes.
Track the five-second progress-report interval separately for each
teardown, so failures on different ports are reported independently.
Report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index b1f2998e7735..6efeb16fd994 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -565,6 +565,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start, last_report;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	last_report = start;
+	dev_err(p->port.dev,
+		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+		rx_ret, tx_ret);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		fsleep(delay_us);
+		/* Retry promptly at first, then limit sustained retry activity. */
+		delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (ktime_ms_delta(now, last_report) < 5 * MSEC_PER_SEC)
+				continue;
+			dev_err(p->port.dev,
+				"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+				ktime_ms_delta(now, start), rx_ret, tx_ret);
+			last_report = now;
+		}
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -574,9 +621,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -588,7 +635,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

