Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435396;
	b=RjJYKy2ysgVzRoSsR3Yh7pYnkHANpvkmCCvDowBOQ6Lr0E7inKLfPBMhBtKJ7YnVyJo3
	 9Hu4qa7plYLWFZXlk0oM7qTBuoNAPDuHVWwkAt1EHK9fIvvE6eF2XCiUA/QlTBJljNCOm
	 ToxS5YRWOVxXNOzS6aPvUuETIKe/HvltTSaVm6JIaL8nbG/ZCt/68PXrx7R6vqX0Vp21x
	 Qe7d7gQmldiL/Rd1V37gnkbUvupMLmIOimRrBu7yleo4fSUOTeqjBob23EPHKSdfQh6Bl
	 HUX4W6ko48ykU7q/7Jq3RpkAnw0zwX4sN3iyQQHdAyBvTCFvWn6Or7s6+lxE9j1q++A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=mnalMPszX0huu0qcmFxOsvO/XPLVrl9GkQYPK12HXjlFxba+UcyEYpF6ym6+n6VAXA6a
	 ByhzbddzLLcNLEzHm6go45Kr1sLAlCtmj2ZwGc1dCbdciQ9fD+k2/FgzQIMvf+VBSIyqx
	 oZaqAxF1t5n8btYwQX93lfy3fNbCY6sJMegMcfJY89vW2JKvN1MT3uEX3i6yU7aD6Wzwn
	 3V1+QY5HO1xHyoZVFMc29Qzl9i6q+RKGtlpArh2b4m6RY6Ve93sfQWj4L0iUvtY0KnlgW
	 kaQsfr9Hzro3PQvLMBuRkL4Rkjz1u5bystm6ytbaH2LynuT78V6yKaaU1L50cLAhDXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3RUoUnm;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE2606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAE2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3RUoUnm
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-843cf077f10so4490046a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435395; x=1795040195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=q3RUoUnmUrOcrmBlLrewDC4eNtcCHLFQeOdF1PXkvbqR6RDdauMUAcWfloph6cSa/7
         W3Ug/pUsGedMZk9sDD6ThjqVwaVSsLqKiN8WojUj5gpIq62LdBxD76tMyZkDi0B24NjH
         0tA+vrPNs/i7rlP5B1irl/hXMUOj9r5LPFFLPWDdsm1SRgWbI70GkPED4BPkRI9pDLt5
         QlO7lBAOCK1r/p1G82S5aon771wcaJOTBK/GOZsffLpA2zzLZzXE0pYIxbfNeYWoJ2ad
         hBVMITvTi5eGjYruugMGIUmQNWkZNIvZl+nxuxE4UNkZ/Mk4MHN1rIsmDcKZWoFkhD0w
         adjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435395; x=1795040195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=0nERmijb2BUWjb07RcY5+BVf8hvd+XBGr0FL6YXNYVH9OJzWKZ7gUZ042vYCRl3oCd
         qz9Qhr8qC+7kevV06EUpdSfwugAcQKc8SmDahtA/LjfvJx5h8i9dVkuDemACInJas88u
         0yZvaMduOyh44gEAD3JwmHEDGltzPKTvcH+0Wek0KMxV+J3Eqmx69wF7WRB5Zi3Pns54
         G5nv9Om3CveMa6jWM7VkFG+FUZ/LFDy+1o+SbiAaaSzVL0+LmvTKFmwrhuCytaIB0Jw5
         61mY3aITnS0L9ifEJiyH+PjQJZAbTkVaqpFOLTe5ZOmvTd15I2FVZ0U1I8vPKcjenEqy
         kqoA==
X-Gm-Message-State: APuU4Z8Pzjyo2s/MwEAkTqhGyOQtRzf9NjAi0wzcN//8JHeh0O7xAl97
	rDtyiGtfWNs+B4n91LMggsNNERFBZNgRqicgbIQyJqz9/STVzJZV1h22
X-Gm-Gg: AYBFou2bOj53e7Rj/YA7LzB5oZr5NfmEbhjzt7wT6iG2RDKKeTcTPdowjSJYFoRhIsB
	tcRZJ2l07kzFgmzv5uYGmfsPyJWxRhMghsYcoQC2UQG1pyfdBF+aBrscIghfYKlWy38tdrdRCr4
	bz6r0ajad/Qa3CSrjZH/793DHXOS0Yoi9OtZvmwPmriNeTceO/Vnj7UpNvdI5XyvqdtWmUVVEq/
	cHg0dJrYg82i3EaHRReURiG42a8ZucXGz7/6DBASH7ZiygX7lhWJUH3/r3o3hEpnr4TU9Ody/tT
	Ly0eBcxMw9mpFas/10KdzxEJNCPPF8XtHr8GGAfp7mKbEAJm4FYgoxUx7pSJAIL9umuiK+6lI4M
	5HU2ODF8PnMc38Pe60epIQywgvwXmKsUpSR1ip94r7R36Qzq3qepUeubHwnIkrfT12occYOiHzd
	iTlZeseqDFu8O9LEBPF+pUZy2/Q1PU8N0SiMRQAA34nrrN9EinYWiZdUwe73133qefoaYxBwWb2
	Vu0tpQMA+8RjzfxwGtR2xTmA7lBCEe/zIOqzlLlkrwyUoGBmiT8yEhnpurhyQEtBy6TgxGRpEHc
	5rZo9R5y39Bu8OOZJcru3d4ZJnmA7b5T25Vj0EsCwlZS+tnFufoqHdeAe1Ai4f7ZSeE3yzwgrFU
	B5N8+aQzfFDKHQ22MzjqDSP2zqgcgymKLv/YVBKT/k5xDUAfZWOZgbOJphJ5hSauSXLyL7g8Asi
	AnmM18AnkODUcht4GqZTqxkJQwyAo7pti8mHdFVa2cAxrn2S7tNS4hDMPgzdZ7QXTQOzprcp2K
X-Received: by 2002:a05:6808:e8d:b0:4f1:7c39:8a7c with SMTP id 5614622812f47-56b982286b5mr3254065b6e.62.1794435394806;
        Wed, 11 Nov 2026 14:16:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:26 -0700
Subject: [PATCH v12 1/8] serial: 8250_omap: separate locked TX DMA
 completion processing
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-1-9e3456bc2555@gmail.com>
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

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..b6f108d34854 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1080,18 +1080,13 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 static int omap_8250_tx_dma(struct uart_8250_port *p);
 
-static void omap_8250_dma_tx_complete(void *param)
+static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
-	guard(uart_port_lock_irqsave)(&p->port);
-	if (dma->shutting_down)
-		return;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
@@ -1123,6 +1118,18 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (dma->shutting_down)
+		return;
+	omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0

