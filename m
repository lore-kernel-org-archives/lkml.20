Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283239;
	b=CWfTUZBWz3ymfAu9d5T5M5DOoBe7rkb5FUwQbedKXo/iA2cYHgFsIHYLYHGSAldtZC6j
	 s6EeUYUvnCHYHdL5uHkl4zHbtLjmhqdxnN/Q1W89qPr2OmZV+ljo0Fn3xmf2eAGk4WHZT
	 X/VrIxIk1rWajz6WReUkUJIj3+KNlAwaZaCBtm0qjdhJgxJGC8Z3x+L5lHw+FOXz/sW3M
	 RD6sARz/oMtZ/irJvR6q/BtTnWMHI0JV6mD6tpIE7F8/ymrM+acQPzEDI9qu6mdstxvIV
	 HY239X/jr56QtQVzblG87THPpM+iPSex/ok5HKRsio7FfZHG7Hj39IRrT5FIs88McXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=zRm8Q+dL4nR/+nQ5YgBUtPnxqELNfbu56k/pNyGX3/H+1JLf/ClOfxrZ30v6jdcQd7wi
	 jO/nVgO1LQBvFgW0B+clYkrTZ5ebGQ9Vv0wMR8ZaZJ+BEOLVf/8DvPgnWiyGY9+zVbn6Z
	 uZIvedV/kBobqiS3x0xhAAvZVxaQBUkO0D1yH2W+CMo+/qZjyk+q71nMF35NRA7XRcY7k
	 EfCqXF1HmOj7hpSGcJYNKM24CYJpMtiA04KQXRxsR/PY18qCsnJ10ZdW1z5c+0Q6hTdop
	 WlHAQWobnpFdneapy2cW0Xt7v7tqXlAFQgOVGtmOs3gFXUfp8GbwHbxoXjCeyyrQNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TU5WtYqu;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03E60A260D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D03E60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TU5WtYqu
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8451a619da7so994318a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283238; x=1794888038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=TU5WtYquFyWvFTRZA842ChZD64LZfAdBeSrRmVmD4nOaZvxlAIrFLWQNxTouj2aCzF
         HI6wIuBorwNHV1NtJ4LRy3qonEtpkhJAiBaLdzUlyLtOZLWoeglglbT/rdJnrCaXREr7
         /whdvTkGCjz9ApySXKJgfStj1Q+5fq3oMqLYNLmX0/e6ZkuoUAElzMWRPbUK3K+QHfOg
         2X2Y+Ysnaii5zPtXOOovfjX/zLAsUo9HByynEZ6L6x7ViGWY5CHdnkpDBaL3cfI7aSqB
         HRPPLzuA6ZD3gAHZHyhXjOb7pY9rsEX+2/rAHP/Uu900IG2GWrmKAGw7mhxWg9j/pYDC
         56RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283238; x=1794888038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=0jJf+Aq4RqeZIOThLf4eHBorXvbicVWJD+I3YbNOTzQYqqzlh7nm6smXRg/q2hq0xR
         SjT73P4Jx/ZTL2nwFgUlPazJTc0qn8aAkF18Xf25E7ZuLOX4VzhJsS2Nq2qfAV5RFX9f
         xA1rf/lER7BQ9hUuPtRB2IKyeJlovGjTyR7NEBks73mYRqfaYDQrKdUdeFrBiz6lBBjR
         WzWQ5TyFIQ7lNVOEAtYSKgyHzgcHkzUsBpcEnIkLwY0hikrvyG96pLTiTi8eFIrzua94
         XfrDsIJlcqs5Gin9MnQgxjcM30MKz23iAI45Tx3pgyN82OogDlZVo6Va+2y49ICsp/dw
         +hDQ==
X-Gm-Message-State: APuU4Z8Jf8WlYXFb2N9KPHBP8oSiaczZlsjKrmbnl2kE6WKe4M7wsmGV
	DuseLNGDZiDeaFp+xvIAMGSxVzIKNdVbwnpjcSywKbIHBWzaGzeHYwrE
X-Gm-Gg: AYBFou2RjUTN1WWcUKgVX5yelf3ofc7PFWYCOVGOYsZYYF2+EhJd0Z5AXrn6UKIjzfW
	LYvaLSasQKrMmL7qZh+satjj9MsJw9erVdcyp8kDsW5hxAN4FXddUC0cmykL4+XawnXNkzqicvJ
	mgJmW37bztHdX+ciy1JlYFcp9UT4r/QkbnqM9WbXvgYQ8ItR+olJlJLo8rGhVYta/CXe/XOe91E
	HzQ973qW9qq2vdRwcNjvBkubS4sxpRIU094tkpKPLLjy0noTV9H3pE6yYRlRN+TsMYqyU6JLc1Q
	OVZtoKBxiOEZUD66Y2iLvWGH3DUTWV8gR4libhYGNBMkr4nJqiByZEwmXnP3FAGcBiE3LSSaBpf
	0wndSq17LXunj2hMjy2t8npSbbum+fd+hyzzyhTVkiHmf8dzNRVMj0lktJyf+jUvtomRRqIgRb1
	ESls7BXrO5vyzGxtUVdnBOD4uLoTfJIp1TjcytyVL0OAhJrhkcOHERP9Sdygnxs12ZRdXKTGY/7
	rN5LaNcwtNx/UDVDVgQ3Ee6cXm2w9Vba20+x7cuJzSKZF4CkMLut0NHmxLRgY0S1khIoqt9/CIZ
	dghBTtGvtTuHj8I3mOVF6J/bVOO/Qsbt1HtnaYXXOXimtm/8PdzXKt1kc+R8ZhfodvdPqstyUZb
	VqiSgOw54VNGq0tuhGsq75/o1w1s45abzmvEz1fdRARzilOYyw9aNNU7HrrDcZu3BB2tywZXL+f
	okU3Fk8RPHdjnLBB0tU0RWwkggdsLw6Szqy8ricnEyhud/ec2w19k=
X-Received: by 2002:a05:6830:2693:b0:843:cc20:9d03 with SMTP id 46e09a7af769-860dc70cd38mr1124080a34.6.1794283238334;
        Mon, 09 Nov 2026 20:00:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:18 -0700
Subject: [PATCH v11 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-3-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
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

Moving RX DMA locking out of __dma_rx_do_complete() left the DMA
completion callback calling it without rx_dma_lock. Shutdown and runtime
suspend flush RX under rx_dma_lock but without the port lock, allowing
these paths to overlap the callback's buffer accounting and flip-buffer
insertion. RX submission and UART interrupt handling also require the
port lock.

Take rx_dma_lock inside the port lock in the completion callback. Hold
the port lock around the shutdown and runtime-suspend flushes, matching
the existing interrupt-path lock order. Assert both locks in the common
completion helper and the port lock at the flush entry point.

Fixes: 789898416749 ("serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index b6f108d34854..5e114dd8f9bf 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,8 +771,10 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma)
+	if (up->dma) {
+		guard(uart_port_lock_irq)(port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -898,7 +900,7 @@ static int omap8250_rs485_config(struct uart_port *port,
 #ifdef CONFIG_SERIAL_8250_DMA
 static int omap_8250_rx_dma(struct uart_8250_port *p);
 
-/* Must be called while priv->rx_dma_lock is held */
+/* Context: port lock and priv->rx_dma_lock held. */
 static void __dma_rx_do_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma    *dma = p->dma;
@@ -911,6 +913,9 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 	int			ret;
 	u32			reg;
 
+	lockdep_assert_held_once(&p->port.lock);
+	lockdep_assert_held_once(&priv->rx_dma_lock);
+
 	if (!dma->rx_running)
 		goto out;
 
@@ -977,7 +982,8 @@ static void __dma_rx_complete(void *param)
 	if (dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state) != DMA_COMPLETE)
 		return;
 
-	__dma_rx_do_complete(p);
+	scoped_guard(spinlock, &priv->rx_dma_lock)
+		__dma_rx_do_complete(p);
 	if (priv->throttled)
 		return;
 
@@ -995,6 +1001,8 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p)
 	unsigned long		flags;
 	int ret;
 
+	lockdep_assert_held_once(&p->port.lock);
+
 	spin_lock_irqsave(&priv->rx_dma_lock, flags);
 
 	if (!dma->rx_running) {
@@ -1811,8 +1819,10 @@ static int omap8250_runtime_suspend(struct device *dev)
 		}
 	}
 
-	if (up && up->dma && up->dma->rxchan)
+	if (up && up->dma && up->dma->rxchan) {
+		guard(uart_port_lock_irqsave)(&up->port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
 	schedule_work(&priv->qos_work);

-- 
2.53.0

