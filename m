Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661283;
	b=Z4ViJSMFRlZytDom6T3OCRH4IMjHyukqdU77bVqL3Hz5rtU81BcW8QKaY8ke7nQdHYx5
	 uXCzcmv7qW2gijCbjxp+lpLRZT4mcszZdejh7u2miqyuFKS26ABXBtVjHUqWYXsB089Vm
	 Q7afDd2o9HLX0w3ZXeO59czMWmCJQWc+nWAhu4ESsvcElOZ1OGT5mISYPp4cypvx41pwH
	 ZxwFfY1lYeUeO+/ac7u6BoT4Ldw4H9OdsnVq+xcx6fBOmOy0SvRpXjHvG6ZFaOKpAjhY8
	 hB68gzDf3cqCafcNwl/8cspcfdpnfpfL2BGorSFNl27dulj9dXEERdMRUhXWysX6Cgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
	b=HRH1WHBzDvmmraq+zl4lhINS6H/yZj5MxWs4coXyVFtGlMAWD6O4iMoMQAvmwgDz3Mr0
	 b3OMTovypYvU+ZMsHTd/y3pKy2qSWPPXfWSRge/2SerRDxDJuWUTVUtISu6l/hKy3jXXZ
	 /kYtTbwW22npHF9rgQgl5y793WxUCYV6nVWxxBoFKo8t+j9B/Bfsy3DIYnOD0slWhpLjk
	 EnvxpGFM/u8QcCQA/p9+u2kWpEbqi6Rp3dbAsBci2ZILaQ8rdURaudHJNB8GX5JYDy0re
	 8D+NLXrnRdfurIYqiadw0XTo1CvMtFrqHgMll0jx0IsicfyGdaehOdPrcL37oWYfeJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HLRows/3";
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55E606D804
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA55E606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLRows/3
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6deb848ddd7so2740415eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661282; x=1794266082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
        b=HLRows/3UIceZHgKjgYdtz3irbkskP/VCUGwmx8hEpa4/da+am5zryNdOMogFIVTtd
         0TtD4Xb2VEtIqQtxFB9t47SbXA8bR9eBWp+DvUoanMOkXVrsH6cpLcWXMa2Pe3ELJ84d
         b3BfbO7X7oi8r7jWc6AQWyL0rCXKLsRa2WdMUK00kf4FxrPY+pD7uMaEjnu1W1mNEG1x
         QmEUIowxwGBZRAG2CDwY2DXl2JDn6AG3liHgMy4Rify+3lskyN+HWvGlQyd6W9U9Vn3Y
         Vth03acQ/zdYBsmHijOtCnaUNOFzAPHyRdGuzpmHtZ/eTxCTVjT58UGgjLvgVl3hR0LG
         ctAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661282; x=1794266082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
        b=ochQFJUMGnTS3UBFYfWoh9iUfd9G15hxWdrbBMrKj2XfSh8af5Txzq15SuKfd4kkmx
         3c3I/UijujteHHpynXvu/NH731/4Es7ujsRrJADy00wn0nzUuKVva741nRTEFdY6DUPl
         3NqAxdJOL/7sx//so96Jbj7xLd/Groz9rey5OOtQl2h7BU9a0RMR+XVxnG4ZRvU6JZiM
         6ICV6mHAVoanB61tkJxtipDJthIwe6pbNf12yWacnEX2JKciWwPyoJ/z9ZEK+akgX1FB
         rHQADkQtkHPCmXBAVXPaaXrJIfylV4P4G6XA/STkW1AlBEy2sI1Pu3lPxtBvDmu+6aQf
         u3LQ==
X-Gm-Message-State: AFq9FYIpL8394g2Oqq42dZiBQ6Mxd7vpPVWv69SPTwD5ZvfRIwJ9Vl4a
	yddOg5Hp3Bps2fynUjZ7T6zk1aU0E3MGKTSrycqkFDZC5xocdKpYRnXW
X-Gm-Gg: AYBFou3svSDXKlF0uxCDDuWLPTRRIVEczJNRibfOyWZYAdA+CLXVWDz0MptCJ3UTWgL
	Pr5TFU7a5UH1TfNvwDrSY07ZvD18/JXD5OQEz0xtIdRjs/CmQTJYh//4fngUpAnEJ8TD+N/fAFV
	+ZSbfqSEHfxVf7i6BRdHTnZI23AezBddP30VtSB6a4OCVEvQRek54rhyH+AfmMjWtyzVneg9J2g
	UuU9qOqJUQwJ2JDakr2SpcnEUd0WQKddS/ZV17jCZFlToWoMtgN5nvZWN4anyqbevcx7sUN+qqo
	CB+ZvruSolUPsJpFo26+TyXnlRTcENblPlJs/wUznE130UYEV8Czd5GgSGPSN37Q47QqRWSGCx7
	62m7QJ+XtU4hyyi6vvzhvvXl1fT64Kq4jhnZo+JtaX19evJhBvXGgH2gUvEEVJP0tZRnYHjesdJ
	+F5KlKbj1y5DGN8CNKz9I/kYycqXNoFB/AlOBKBCWZr5L/GtnIweCs9Tg08DPCkeElEnDYQA6md
	mqyxy2r9YlFgF1r1RmTr/rSh6G7EtC8nqrTxiCPB8aH/B76CHupo5yRde/jnnMt5YKwsjDrLJIW
	qCxfcATJSoNYN+1dO/MReCxbGGo2g8+8FmHD1z8uOANA3UigINFBGDvU6yyQzrfoaQMBJ/2fxN9
	+CjVtv/PsY4k61WwDgCRCQZW6XY/belAcp9bxfCtLs1yOJxkjMNm3HsCCWjjbaMChFz0Qj7Zxba
	iWrkmAFtoiVq3RBxAb9ZuyqPGbhkA03jzWrKGI2MrrzaVhnaBFYQE=
X-Received: by 2002:a05:6820:5717:20b0:6d8:57bf:57bf with SMTP id 006d021491bc7-714f2381e69mr4446915eaf.21.1793661281665;
        Mon, 02 Nov 2026 15:14:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:30 -0700
Subject: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index b6f108d34854..322403cec2de 100644
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
+/* Must be called with the port lock and priv->rx_dma_lock held. */
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

