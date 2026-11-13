Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563611;
	b=O/lfpjx0RY+JFQSVZBVo4QgYaIrdh04qSiCndoh06bh0FfhLq2vq4Q+CgYS/23t4AL6f
	 xeKV9mtnTGxRy4pkQ05fMFa22ll4PFKyb564/Kx/+ZTZOJ47cxY+POa6b8P812Iau1rnn
	 n4uaHFXnwaU7pKXnJCoqfeGQ80mTuZ9N6wQfi3uOPz7um06DJMxTpOCpOMn5axauqTrQZ
	 Sl1pZFQoCGma2pscwO0pssdHPYXei1lzyiuDj1sfNCS/nYAzxINAnBCYo0O324IpDFgjR
	 2cDueVxMPcvKey6vZuPz61xRj3r9hG6H7iALmOfF6P+A1HM8gSsZMwIWXfGugMTOCPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
	b=yvG0TbsyVmcZE1cbQOIaZLLPO5I0F5ypshcX50froWD8BhqlNHS5CkR6WgPJlJTpyXsE
	 bOAECQ3gl2zZG9/uUSQXXsfFaLgr158uXJHiPJw1naAguwEimJEnkLhymfuDiRtkaOeRj
	 J9AHbxrg7JHnYsXgLNWpOReYWfAUkDQKy8ZadsSBAhfYlFlay1aFPSqIMTsXT3skij2jW
	 0NM3BF3akWNrxVZFlaoK7q4pErpa1JDx3DMp/pNZGwjd+hPzxKnSyQtUaoer66YME1gD7
	 duUYUlGJvhJD/X14fa/2Ma70SK/AfY7ns8VZLT4HXOivkC0dSHS+dYGCQxZOXlBsGTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfnKAE2F;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4D606A8AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC4D606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfnKAE2F
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-539a57a0b1fso237651b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563610; x=1795168410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=lfnKAE2FsyT1V/4tIDeVEYgMlXDSq23WxuOShq9iFcoZzHvA2E0L2AX5Am52b8fEsj
         ux8DEypvTvA5r1Q1gp+caEIcZDf7RMyyOMKSq+8PJ1cDTadci0VSdx7HnFI3OGzh/AfT
         WnB8npZZ7Aaox3l1iWIACNxnEdp97GFbllxPYLrsgPKrM+XPnF1QROZN0VFrYL3l+fFP
         hXwUDNhRVhovh7zaJBmB5G6o7Yhpf44Wv8x+UvjOVt1ISSWl0ZpLXobCmSJ465cUN1I8
         EL4v3opO93lmt51YEU24Oc5n49nVg2Ed1jcqCNvymE9hlg1rkI3+TfKiqEECrw0OaZQi
         L3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563610; x=1795168410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=GEenqtR58pj+hwosBLxC0IbRozpyNvNBPk99ljcFOjCX9Xjb2XSxRNAuOzvaZrln3D
         ldsRnJQuOR3JYDNjucm2X13rznENt2/n1TpZrM42xa4hToV64GWSDUQjoQE2d+Os3BOx
         BUNdZlMDeegyqq+kWomGUIjQcnOxk9Xu4VABvx2Z5Bq+OdAW27W9VYKrZGtFp4hAPFg8
         gnrANmPMsDyRgh3I8mDDj7EmoTJxK+KOx3ImveErmQAP1kRhehcxgq0qrPc9ZCC6SfOT
         V12WDolfOPaaAkjOXaPI9CNmp5wmCkrLSL1n/LDseYxqfs308WbHFdeZg7m9jb/62ULJ
         glzQ==
X-Gm-Message-State: APuU4Z/8+9u2+jcOvA5z+rAGhvmMlG1NqM1cFyg2RiD9Xkqkp7ET+ouB
	6p1m3g51aC3GwXlEf3gMersxQgxLx8Jbz15cp5DHz35XB0TUYUiw0e0Q
X-Gm-Gg: AYBFou3Crq7e0gSXH3iY2HuSV5UouCfrcxar4w1SK9ZtdgcaR0DI9U/p5O7m70pp5CQ
	YZeszqr5y6ZV7t0F2j84zYmzy4I959zQl9X16oJW7tYD901JnTagpLPqz16G3syADfmpJyjcuZk
	UKzB0yWkfuA4kn9zWs29aDcD+3wLuSfhJbv1tXf3VqUEONsUHkUYE/7t3/Mc8VwVDsm79SPOpPt
	mUnKO/mtn3PIAL3RRtwuOzz3Sia0IcYnCAEAB9JoCXTmE21SSbjbVH1Fw/lymXxeUrKgXaP2+3T
	6wlc6NeonVh5HEmjb+UCvIhzq7x+jHM7HNajpbg9yFLCRrXymFeTuN2rivHx016I75tG7iiDpK1
	lG3ETzY1zExXnNc6+2WI3KxxB47sQbh/HPQWhNK8i+1f1Y4a3paFMu/cGXPzvAI/kv+ILXktoth
	t5c7EW/ZadRtaSt8oBzMElYTkL2xD9SOGdc3TRrqXgGBXTrOqyc8hAlnQy0k1SM/bi2CdJ63PJR
	bmAbRmqwRFbb8vt4dxTuCq3mLY94wd7Voq9/ebhonKpQxMYc1kf+T5VuMRSBEhfQfmnqFbChwZF
	IOTdpgUsLa3vamFfRuKnp0z8NArUGtGPH4XeNGd/jmf5T4yF0ttv5Cv1XgiSKICDTnlgqDBis23
	X3ls2vZdo7EhTbWBSf2wlH6hSuxEwLeEq7if6MQ/siQxn062RYF4wEWph7i1lizzSZmyCAchv53
	wqnMijXX8+QH9lT7QNhlnDgw+hZ0d0eAqg/WgrfVMTJXCTI6J/RqdVlhLF0zvEVGspNnOsLg29r
	A==
X-Received: by 2002:a05:6808:2207:b0:568:c71:5338 with SMTP id 5614622812f47-56e63ba982emr1490761b6e.18.1794563609933;
        Fri, 13 Nov 2026 01:53:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:17 -0700
Subject: [PATCH v13 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
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
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-4-b857f2617ece@gmail.com>
References: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
In-Reply-To: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
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

