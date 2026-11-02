Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661279;
	b=EHMtSugoln09tVQ/mARz+xjkxqen4Q9SkrrnrHwmYwqUR62RqY3i7+k2/QPaHQk8asW3
	 wZT51YYsTEa8jA2K8i8vMYhmwg4FFj0DAhOoGZzwZ9Y+NMbppFTKFIIXvARolllFWXDUh
	 cSXX44Q2wF+k/9Ip4r/SuKhVhNTWhCz+qDVubf2uhTRHb8G3PKXPcWVP9PyvR/w+g1Hdv
	 LZt1eSlCF6L4/W+fxIQb8KTwVwOc1thlgIPbC2L/p0khvU7YsxCi6pPMkDoauastXk5Uc
	 YMxNw/fYXk8CMF1xMhZZQHoI2zCJ77nvZUIxK7vJwZUU6UvjOkt3HZBJnRmT3N2KVAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=SFr+3AkLYnGO6VL6HmEFQoeg6p6EAO8Ny6bGglvJOO9SiIkQpzzOFoOqgkiodwz/YTy4
	 fq5MDIRBXVKMubnvNT+SfCu3kSPlS3GkfhQy3BG7Phz5U4+A06PbaA1Z/Os4k6KIpdUW7
	 t7IlINiMebl5XhNj/fKmLs/BnZvMGx3etOm4RP0euQPxQLxWgaOcHMN5wVaylCNGVozaQ
	 FLjp9jX4OTqaa7FoGsEEYxUBsH7AHMe0lIA8gNplqgihZoiz9UfS9oG+0gps52Zl1HSNP
	 b4GuZ9yoLSY3RlO//xnLG29o5Pg9Sf7skkp4zkAH6dRLk87OkapB8uRRHSr39gIQYJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAbh+AKF;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597A606D82F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1597A606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAbh+AKF
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d290b10a35so1510525eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661278; x=1794266078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=zAbh+AKFnmrKyu3yPlpJFTyovgT0X36iWP1xt6340TDWsSmwQJQfezmHFkrbt1wDPC
         99siFVB0N5xKyLIlR5dsryAQuDVnIUnIajfuT5VV1tWbyu/eiGC2prSWyo/Z5UDd2p5h
         pij+0JsWXSB1Ksv/0jbZvaca/4zUCLoBvRQETgKQ0m84A4Fr/ayPsLf+tx5OKCRDuG+3
         Mic/ANVZLEOhfTtQSU1FL0vdkAV00Rj5soDPKEt4yDizTQ2MU6yL2E0ar0dCssYnlljq
         5nygHbLug0idpwvep2XFY18Kk+25Cf/rn7u9y/bDfLt/G/wGPWccQJQdhU1yNlfdDW/a
         aFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661278; x=1794266078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=NoICxqIXdLMjOAFRhIBCGJZBH4kfWvdQ49fG+Xkyd5rM22rukAD7RD8MtyHtLGoGTV
         emvHtjgGF4qcL1NLjtrIX29E1ZGSA8FeMfRRYqntfIRZx412p0wbFX3SOA2Afvzhedl2
         f113O63egQTSEYoW1sIS8d5bUNvIviviIJm26c1nFhGMtNA4dCggS3G7Ga22dq/FbjMx
         jdUsn79ki8ORUgPC5/X72qP1kO+uXtzmxSsR3xX4aO+CzKNd7I/PQ97P8m+9W34xb1qy
         TGEZhrbny1um0RHoXMLqjiNcNQZMbDhicb/cAYSB4i1V6Io089eIYtcv8dLlOuISBnxY
         WiwA==
X-Gm-Message-State: AFq9FYJyf8GHSZedpn5/sL+X1XtWxoocOcIGyylWKLh0gerpLh/hzMyp
	yZhzmWegcppL3j1Mxd4YNCy91vwvcT/Evbpl4yOD+bXKKrwWJ7Q/9x6P
X-Gm-Gg: AYBFou2YdQXsThOqKEhCPE6cNaw1zPkqQ1R1gGTtjOafy/5GAEnDVhpbWMnbyw0lsJk
	9XdYWiViSR50yMtkN14AcJKwDXmxE7PmtYD+zY8xVl2NOcp7POBgDY3DxyPuBTC/COeP0xZxfPP
	82qCBVPSc2RoHROoY/0//I2CxUUdkvUZCGMAKwmsOirm7j75aw3NN+zmLU88JsJs3elH3D5mYoo
	hRX0iBSi0KAGh/Th9mW2mMJkfjwCxYI4RWj7PB/oeirMKTg9r1GA01F/zAeOciTxSJbElBDRr5Y
	f+zgkFT0jdpD3ljjMCH7Di/RLt6YaKY5OdhwqePXbbBOP+ajdaqgVgqJQuVmNrw3Virq8mR4wVI
	M0F0lXdFefvW/gyGsGsW/tdRtRhGUPJWTVsob9nbNSV6yRJ8sxwbFedZ2+mqILWil1MhR7aF4YY
	y4DUVm3DEIkhh+mlPNRXPwGwWdjjEAvGPNi4x7JY2Bre+QOJsjY5dLmS/NRdi1J5NUUeDZxwxZf
	cMh919UDs87J6/YeWwVfArVGuK36lDqnQvvD5oRcSMfLIb5gAXJUlhvDu6DYa8oWhZ/Y47cf/Vr
	qfmnL23qA7DAVoCF3M9jZQldTP+Vo/0k4NJ9J7SIwM5PhAR+Pxy+BFZgUuJzk7brO/9ZyFe12cs
	mJ7Lb5EDTJ0E1ViqG5Oo2Bpi8563l0K8uy/andt5MzjL2cCAHQirEVYvvti+NJSxADEk4izkBTs
	lsdGqUssVevGrjGTagWap1vZonYF/EOVfn0oWGeYeUwYuhmLFi4zs=
X-Received: by 2002:a05:6820:1621:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-714f29e457fmr6317068eaf.49.1793661278004;
        Mon, 02 Nov 2026 15:14:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:28 -0700
Subject: [PATCH v9 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
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

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

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

