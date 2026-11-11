Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435400;
	b=JyYI144NOwi3Mq0v6/kCBTdXLFC71bEHJ6Ff7nWfgfUh9gKVlFQ+X26K3Od+XfQEJzhn
	 9FW13AAWe/ptJJBbXxr0Iz9n5/knxdiwx0TAE2EdAYC2/vatOvh4hKKVAkfGWzCdxnre3
	 tttbYbxD/mFE+PXtc28kOtGzFKpEO8v7N+TkxdifvOCuyUiCsgyJqGGduB4ybeukojFPQ
	 7Ip6CEnS3ybZcHlVlYv4f+hVpjsIi36nvxLm5j22KwvqGWY+vULPt039ru2gUr/kjDLOW
	 80Z6N1KAmT0+gcTLjwu7ihs2RtEb0lMpEk4WWt0X9Cra/ShlUu+xUCPXK15fLJk83UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
	b=Ll5cjprocBWuG1ioUshQiv5oK7B2DzxaR7aUk24BI+1q6jNaLfOzyNz7hMU2nN+fpMdQ
	 VKIgNlFGd99FPcfFUT6ewJtBsBzqz9LRefPg+0TRZnwP6SGDjOnKEmP3UHggN7me0sRUa
	 V7O8/8RuHLcF9QS6MJksbk8F/jCYbi6wmzzj+ctYEEkh991Wt/yeRGAEvwlFYzS41GdPt
	 kFOvppeEF2fPDv507r/pBJrHLF1TpvY1VUbqDUpc2RJyqyiuL7iC0iTU1FxMNUsmxgHjc
	 g9RizWlO/DZl+9bxpDGBsVmkp7QiEeCPHsKfH70Y3Vy/hXtjIVKm+41LjJJ46ZuX+iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7fXViHX;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C85606A8AB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C85606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7fXViHX
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48eee44b908so1996854fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435399; x=1795040199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=a7fXViHXVaIcotUIgFmQgfkJQYfLB6f7s+DVUgZ5Nmr8s6czbIz8T+E5DxN+FfL2Kp
         g1gpBQPx8I90K+REwYsypQKKMViMgJpe1c7TCFH7SqKsdBjDPAlt/vkLPLvjqSB9uq8p
         kVyNMC1cWA6QKJxBYT9cElJZkb4KdhDYJeFnSoMuyfzfYkhe/AQjqliqzZJXja2c84Kd
         Fc7MotCaOgr8C9InHEIaUiecQ4sN2mPVyFSb9FCF4jCCPNzjkqA529OOWVfaej6HB02m
         E0Vrb8E6gji3CV90rWZmrIQZ95KqiGbfwkWCjrnFYwkyDeZFSZVRNso7+HQiL1+Ozpg5
         CMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435399; x=1795040199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=DcA6W/sf+cUY5sg5pUNQrWamWujRgAvXOEeghHeKvrwDPRTLxIfviA+8aegjAmhPjw
         Svqum3qrzHJXWCdv1JKxMHh/h86mevl+I/NMqET59mibql07ClESPK29m69l9gO6qPJw
         kKJLIbkHwB6TDMAxe3v7bk/ZppnHrgBfcf5U1Qi9QJGMXqYprlaE6ER7q3X0ywxRn4H8
         iASbAEFlKwhh+6qEAp+WunBfRaYm9HwROI8/JNDul4FfYa02OicjIsoO9aWo0IMt6O9v
         1iMVGmWqpmmxuxEBPuhiIow6ODP1qFm+9/+bhrIi+fMd8IRO95XVVFqK2EpA7WT0UasI
         yuCg==
X-Gm-Message-State: APuU4Z+1Fp7nVWx2ol1NXq3AYYjmKtDbnNcth3wMcF/CzMlGGGiGPOUU
	Yrh51QLEO90h5TP4fa2n4vsVywnRhFXVusSb1o62Tu2MGmkGCyKl8D11
X-Gm-Gg: AYBFou2iOjx0CGb7m4RsbGNnkccsnh2uT1EPjKTuAILSt7BQ3Vz2BvKWMek2dWZrTwm
	dn/7W/oG79JlxplAyfq3tlEXuyR0YLgahtFRCrcsvk6rW2ltFzs3mUzdNC2U3vHnj7hjK90ONy1
	TeabZJnc6Y73munrcTGj6NpaBh7ZY6MfOBZEsArXxAypWb2eOQrl2XCpZz7E8ocKV0bvWNPUkLy
	91Ni8YUA2kOjiNDtHeNOKCxAumRyQfA7+Ox37mMzh1Hw6UecsijrhI2SQnnkyLxgi6ReQQZEGp+
	4laMB/ZJlLh2N/ER8WvRdKW0Hb0AQNBsn8MVOgKdLp/p0F+YQpQG3MWzefHE8b6f0XOJ5k8kE/C
	8gUQN3lQn9v6VOkBKATmAswntEmHzxGx34mtttmvzvfY387ANZ7huPVVewU5434QQHevRap9DIE
	AgJ6ii+mv7q8q9hI3rXTvUMIyd4N2xi1Q6mgEfvrRRxrmVM6sK2j197nwZSXhPaggT+KrDGsxnZ
	gymqLYuspRQDdj9sjdw0+hfe66MR4mo2ED2EXawM0ytj0QUomsmRSZbURD0smeTuCk1A+Y0vyyH
	U/5DsKeaNaljD/8abrntSJp4aWia0m0o2p1/tOPvGgBV01BBEk11EqeNmuf2NXpyx4P2tctAyIz
	L+gYhXVq1bg47cUX4jmG8K++GsKYckeqMB6GNoKwlli2J+STpH3g/m9OVChAsCL555/DrQzryfH
	OOn/zrJjCyIHj7VZR8+UsLSFbqzeleGtrEEBDPjs5kATOgZ8kJpnI=
X-Received: by 2002:a05:6808:c123:b0:4f1:a873:6efc with SMTP id 5614622812f47-56b98c19490mr3627751b6e.64.1794435399114;
        Wed, 11 Nov 2026 14:16:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:29 -0700
Subject: [PATCH v12 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-4-9e3456bc2555@gmail.com>
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

disable_irq_nosync() masks the UART interrupt without waiting for a
running handler. That handler can have observed up->dma and continue
using it while shutdown releases the DMA channels and clears the pointer.
Synchronizing the IRQ later in serial core does not protect those accesses.

Publish the DMA shutdown gate under the port lock before the final RX
flush and interrupt masking. Have DMA IRQ handling check the same gate
under the lock, so a queued interrupt cannot restart receive processing
after the final flush.

Drain the UART IRQ outside the port lock before releasing DMA state.
The lock excludes competing RX processing during the flush, while
disable_irq() also waits for a handler that observed up->dma before
acquiring the lock.

Clear EFR2 after draining the IRQ so an in-flight handler cannot restore
TIMEOUT_BEHAVE after shutdown has cleared it. This also waits for the PIO
timeout workaround, which updates EFR2 outside the port lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Closes: https://lore.kernel.org/r/sashiko-outbox-206203@kernel.org/
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..f1980c15f85a 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,24 +771,24 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
-	if (priv->habit & UART_HAS_EFR2)
-		serial_out(up, UART_OMAP_EFR2, 0x0);
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			omap_8250_rx_dma_flush(up);
+		}
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
 
-	disable_irq_nosync(port->irq);
+	/* An in-flight handler may still be using up->dma. */
+	disable_irq(port->irq);
+
+	if (priv->habit & UART_HAS_EFR2)
+		serial_out(up, UART_OMAP_EFR2, 0x0);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1330,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_port_lock(port);
 
+	if (up->dma->shutting_down) {
+		uart_port_unlock(port);
+		return IRQ_HANDLED;
+	}
+
 	status = serial_port_in(port, UART_LSR);
 
 	if ((iir & 0x3f) != UART_IIR_THRI) {

-- 
2.53.0

