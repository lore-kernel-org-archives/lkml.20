Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259474;
	b=Ia+vflxsZjL9SN3z1aq7X3qiB1exqNp+gfZDib1jC4qJ2Yy5aBKa8zHpFhYLc7zYUGTM
	 fTe2iFOUOtiXFgwRS53hxnuR4rQXj1qTdoFAEMshryBp7kAJlSR2eyMEbzGgO+5KSd5VB
	 vsxOZLdMDmQzA4/hVxFPhLkRzWaiRSU6zvqBXTgC0L/S8f9SewRcvPwX2zxaoK2QEITOs
	 c0ySW6YCq7NdpKp7NiELk/tsNodueGe4M9WzQePBqXhNWx8KojTYfavLYjdRjU6Ys/q7g
	 LJSXL7ielZGGfdpQ40fdSSjY46XuMvtzNqAf4OpVQRkVo87kWYM+hvaXsMcVg8I+OBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
	b=YQGoKEoxV7XPhsDrkkShx25xetYtE1vdYD0KFr4gZiEoE20Ughr1WGEWtR7j8dHDEbEP
	 1Hs1Rv2Pz6ZYJe9q8zmw7dI7v19ci98uCJoNKz4q8dUpQSDbiHshSGRCFxLNQc7y93BFG
	 ZpxSpqRpnfm1RYBwbaQt4hmvPnYSWRQocdj4yntUbRkOhipPK34OOC554LD4ExcEH6Bm9
	 DPcyPdZ3AN2gXdthu0CGfFbaQOvT3cW43+vdLQuMagQbbWt+HXg3qUJP/DAMZE9rgzdqv
	 kk+00T1ue1BbwEehosg8eJi9sYBbR9FvYQaRuGsT6a6PGUGgPrh8aELOCALOxfXkdMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+xbkHGn;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63102606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63102606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+xbkHGn
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8451a619da7so1252601a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259473; x=1793864273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
        b=X+xbkHGnfk5KfX4IciAWRyHi56wiEIPgpwn5Y9M+oVcQaXBVOIgYsbOQDLoG2xJKCE
         tqsyGEzMihaqO8Th8suulpD8d4t5pURsyMXKfC3rjlFB61G1cDwghX2K4kG2ci19EZHK
         FJ+JjqxkSKlK+bdr0bb40ArFXmYnrnYrqdeoqlN33IHLTM6UgCBSe5qWnLOWvDeKJoGQ
         c/Z1JQ9lU7dMMmQdA5ABVjgbeN2aVjA3/exQCfeH03dOpS3QDzXaLieppsvpbbra+up/
         l3HsJlQuDQbr9Gva40IfHTVOfcoeG6m7118BquwZFRwC3OD48CT3VXyIshJPuLu53v8V
         jURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259473; x=1793864273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
        b=c5CIGS/hQihQ7dMKItEjkZZuLWCbdEBFT1R4H/2SV96I0wcJuZL7RcXtjRzvIhZvXG
         kpJZjK5RoZ2Smz9OMYuWNGhpShAiHCfhOrjBxwZGCDro0OeM0V7lQpuXFWQddE7/Zobb
         /cbPWGqCDbXTNawSDg9iSYn2fTJgstlnYtSbKVKKYeCeAUZUMiWUfIPo0uWN+kmMEXcC
         mMbJRL4QnTKrJl2M7KRemFnF1zZ+gOEp3hbdIoh2SSr2RyH2Jp3bXmFWCpAWpKgLayex
         oZxHFZqzddGBAPIlsagT9O2Q8fmUzYcl/A5nyypsRjwLqi0IoJ2dynwntidmTiL0MMOA
         /uEQ==
X-Gm-Message-State: AFq9FYJ7igmD+/qpoNNeT8jcvHfkORMevToOpsOBfkVJZI/1bgImN6fu
	JAKwjOwclXGvX2G9tXLuH4U//UY+vX8dEptFdPFxfAMjrUgqRg2AaylH
X-Gm-Gg: AYBFou1gOkWOthuAb+KZSFntD4ZGTC4hHF1+CvTyMIR2SodvuTKsyjTsnTXgvuR1DNd
	rxBZWEn5r+OIq/yUknX5aD52eh1+5SK9LGWuGMP1t7F/V/gyWPfBWmPny3nrxLS9dXNiulXtQJy
	IpMIocRdYXlR+oy2g29Vhc3uT38cVM7LQIXHA0CX61kIw8XRQnPKJxGg5nMet1jvm6yOxls0MQf
	v96Y1VcBxbOSb9xXDIMzuAGEYpPP2kOQJaakxU6NF+4oLupd5O4Me6nB/OzvmjxGU7ffpaDFEed
	nEPRrjF0tJ0tDdKMo7oCk5Az1aCfn9/3HWvCwzssjOsxxLC+FSTv9ZrgtL1NfgYnI5Hdm1L+4TE
	UnnXu4DLQMOnltwIH2A+3edwlV2op6nk0yHEWXw+VsUS+egTehUBerqYL0WGfFR2/KkYnGLvVBt
	EJtvxv7CoE3xXy9Sqo6uf/Kp+kIHciWsQlpEDf7PmYzsCiVR8MThgbcT7pCxlivxxF2o6y1Es0W
	H56shz9xFRWBrIXKpDnP4KmOgKTokreKd5E14ZwjUC0fb8JRswWwVNuRxHiyWoVokQ6q6t1p3+M
	B1fj5kbbdrqof67jofduPC7QxqWR6jovU3ifMvNO3jVdz5RuZhwtazqNRzlGa3q9HKsEd6dIaZi
	IlDy2dXw8f9unzcx3Te7rGjxjgFLvImrCvBh3RbBvapAmdJvX5o21q27haeTJxLYsXzFQ2Gd4It
	e9C6Yc9zJKLiQkH4Ovf3sYoxVstps5vslTvcsdLYC5WohKZPB9s1HV1XG0yE7C227cQ9CbqdSHg
	g==
X-Received: by 2002:a05:6808:11c8:b0:4d6:2545:b12a with SMTP id 5614622812f47-56382682108mr3199317b6e.26.1793259473449;
        Thu, 29 Oct 2026 00:37:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:37:02 -0600
Subject: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination
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
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
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

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index f980b4faf6a3..ff7574b1be40 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -505,6 +505,32 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		dev_err_ratelimited(p->port.dev,
+				    "DMA termination failed: RX %d, TX %d; retrying\n",
+				    rx_ret, tx_ret);
+		msleep(100);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+	}
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -514,9 +540,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -528,7 +554,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

