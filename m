Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661291;
	b=INijyTexAO2ZwVm7tSwTF3EXmgxdZiHKHgX2+hjaWDYytNRBpD5yO5aQsNlWpCn8LnsA
	 suA16w2k3/rJvLdTQCB5J/z7yrjV/oAguJGMj0VUyWDbIXI6tCh0rOhEVz3lGIkf1U+Mj
	 n9+S5eCEZ5UBIEBjZCvCa2zkJjkiLD+fQyT7EOHvw1QnSGcQNSdVKLB+yp9+DefMcUytB
	 8N056WeEN30xDKsqFdxeK3H+oVZkAhZdkBVDz+o2AIfRANSDYOUD2OLGUevs/Z9dJAccC
	 L4N36pucFrzRPokGKgNs22PwYLa1o4zHvEjOTCI8ZxpV4ebQrVL2KvsQ+/5SJ6cRjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
	b=AFokhM+3ccPNukuWAlSXhqhV5U8AVZfdiNdP5KQshDfiGjzu/Hfs8DV6POn0alXzd0z9
	 Tzkd74Dy60P8NzdXpGbVVKue7RxOCtDuaQ7ciyUFEL0dhLaYNCU/xhU1LVotvjNyk83oY
	 mdAaDWXV3F7xRXt5D0ZT24VJ/cBJxNOLlHNyQpfEtLgJqFDXXTLHqf3cBV9kHYAQ2G2pN
	 lqmo/yEhGOCj2MKBpEb734rfFgNoBmnMd/dbtxu3Z0S6QBibSeKfFm0l1lpG1TYZ2Bwbl
	 YhcvsHzdo5LHCKO2+TwFaVRCC97meyDaKn9HvzsRIbEIg9rS3a/UrdmUeaXsTezGnfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUUu4MGw;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089FF608362B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089FF608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUUu4MGw
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6f5a0893610so2976691eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661290; x=1794266090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
        b=oUUu4MGwHwZ8+XEdn+DK60HxzuRxzbLwaVW9KUdmOyN1/D7ylVTJoTBkJnXq0TpQMQ
         mtvxCUrMdRHxx4vLSHTeEBea96qhiZ1u4KByOUHidRgb5MKOX22EA3WQxStyB5slc0mr
         hKpYPTD92LFh3j60gcjKzHJkij3bqko04ugt0E+/T3w7NKJzGMjN0wtnWC7PU1AXjyBI
         ihyg1Ox+54MQW6sU9lMEy5UCVic+JeICboRbzhCXgtajRSypRchK3ijiRBYfSPRqOAHz
         toQrlzS3iNZ80CtcrsopzXUBIU4+9tYNpepO2dJsVhlLhsj4cuoRjLusUSP46pI4IkQe
         LYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661290; x=1794266090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
        b=T45egAk4Tk6vkYyT2su4FM67xybTpEIzFcz72dtdlvWC2CcQoqYmpJvbOJnatk/fGa
         si2fKRnhkebM4qsZrKsLR/Tt6kik6So+u/7IJEtdyXk2wU/7qrc4f931P/ZGXf32f4sJ
         JeUYEtJYoYEYNo3/l5nYXK1jkVwM1D9rxpOpSwTnlGCpHLe6pfU0xkZoMrbCy/ajkJRw
         DIQfKapdlo9D9tyhnQ2xpsqwMQJpxsG+PAuHmO8Kip9bUNzjhWF+7z7u8VXQq7y03tHX
         3sa+uyLcWnBPJdocH1CLh9lYHOyXmr8DEvYkkqeMyYN+p0C7Y1TCJ18ErR17dFZEHbla
         xymw==
X-Gm-Message-State: AFq9FYLQCeQ6LSOjFpwaTs82ejifSIlh+EX9jJ0sar6m++HJtHv9XcJn
	bb0b88wJvDQ6aobkI10fR7xf6uXJlCxtJGkxCX5t0nUBHHMA0bEBh3Ub
X-Gm-Gg: AYBFou3CWqKjRz/D0bPI44lJkiVyrkM1kT5/QOXEZ8tPWIa2+GapsdjNDhBTi0Qp0Ke
	6sC+aDch4wiyYXk+PKfpIShAIztKroFf9aRb498S+fX9vm2QXU9f3xcb/pgNnpVue8Khngw3C0s
	vNE+yfIQWOBD6tu/JNVuJFI2gZ5NgDgBy9BbJgZKJNOuFRlQrd8HJY3nHQYemORmghJKlG5hk+U
	vVZiZLqaiAqIeJHLbsPEXBMu0+yZeG18NmJrsFXZ5S9lPANhCdvIVkPp/LC1/IYCNXyPttCMOit
	vYpiOV9MciSBpXbYhhaXd0ZTP2Qy9GI/566gDTpSptMgW1ldjn7iNXjfvLr81fnDGlFWPN8yk1H
	AAnOs7cgZXGVd7+LMS6BwNFK0zCtf3dbbUdevaF/gGux0qB15tlLILldYuaxKo2Sv0FRT329jqh
	LnaLC4fxiE9gcrW2LIOh9uYWrotaR4l8fXAPhiZBnQjd6pntUoG+Mjn4pSKvLdsn/A8uRLh8EOp
	yO8CDDll56VYk+4ojnEISU1uUBvWgr8Vioep5h1Zm5bc5zGPGUiEs84Fm5HrJ7jY+vC69flTCeI
	oO1AGlizQxIo51ffgtKte/rioWsoRwsKztpG5uF2fy5jv+UQFiqhPMW6GyeQnGP09PsbB0miI2W
	uKpzvq2PSOfvv2vsZowJfbhWtuq44AhOqtp198Z0lXPwbcbTdDmnKOfYmL20nhj/qCmtSx63ETQ
	Ov7HIlrkdUIFhwEI6OnvaNPGJkG/MT7ju4uyiiOsizQvV/O2+u7twm
X-Received: by 2002:a05:6820:a508:20b0:6cd:3fec:de76 with SMTP id 006d021491bc7-714f2ab9b3bmr4460157eaf.76.1793661289912;
        Mon, 02 Nov 2026 15:14:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:35 -0700
Subject: [PATCH v9 8/8] serial: 8250: retain DMA resources when termination
 fails
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
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
activity; neither delay is a hardware timeout. Report the initial failure,
rate-limit ongoing failures with the elapsed time and current RX/TX error
codes, and report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index fd2a0ed21165..6307d0261ceb 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -530,6 +530,46 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = USEC_PER_MSEC;
+	ktime_t start;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
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
+		delay_us = min(delay_us * 2, USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret)
+			dev_err_ratelimited(p->port.dev,
+					    "DMA termination still failing after %lld ms: RX %d, TX %d\n",
+					    ktime_ms_delta(ktime_get(), start), rx_ret, tx_ret);
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -539,9 +579,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -553,7 +593,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

