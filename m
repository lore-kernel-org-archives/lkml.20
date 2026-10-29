Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259468;
	b=K1MyjvBxNK1GnOSXktc2vWoej7cYZJEnO8mcZCbSUPaSMtbFURXURNyIGph073F5nl6+
	 BpUyZek3TlqmfYzpvI3TiXBKa1IN18O2Pums28ZaKvnYogPpRnFrYPagId3xlBlufQvPH
	 cELg+iDSiVRl4FjfLaLLbTy2lvALEC/3TI0u8MBEYt6RZFf6gEPUkCZHkYPtzcDqfExOt
	 h8sgicnb4E+VKDAv9YjYvh9N+r/2Ky3DG3pIoWaoMt4R6jzg1j+ZONnXV07CiDQpE1HFG
	 0+IOqFwboTxPVSMJqRgNPyy+GhjZ0gk5xawkEo4/BMUODGctM7Mqgk05nCiuDwq7FMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=hOKU9cfAqWH45wLmbg1wrOD+TjksQF5jNEAtcqb48IlTUA1o59+MynJv918DZu8O6ptt
	 xrjfEQ9Fo5l/eUGPrsSHo06c0WIlndHcdf/w2cQRvsz6mFMLJSqaxcJlmg6GOVty5A55l
	 WCk0SxuPM5ZhvjSMncrwvnr2hJhoRzRL1+aNqQ+jder6/Hma5iFm4Yo7oewDmWf/ctiPe
	 rl+OtsXe2nf8eo6zE0CmIngFxNEeuSMcx8RxHrYcdzCbjFs9zYpZPOsHJ25L/Zqln1jEZ
	 oZRbnXpyiVEOFo8e1LWUyV354EpGs0wArbnwlumezgr4tX5/M/CCRuYKThR7kP0Pwxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pa3kufE;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2598606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2598606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pa3kufE
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85a5455bd3cso1139671a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259466; x=1793864266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=0pa3kufEA9c101+XdeoRmqgpAKBUwpsOw57aCaQTMp8NcAvRPGI7CIS4w64XMngd+d
         g/oT0g88Jwx8f4kKZ4i39rnY0OtCV5kJuIUEPDQcFJJfG/qRVKeSoEmJEbFcdMrRhiY7
         MbLQoD9bZxrMGn+QOl/jc+dGJS9JdObcoAYCAB8V1eNKCvN10wFoRtiOp7ycLm/9yT9A
         M+h7bjNeF9E2ZLhuotJ7Ufkq2404MiY/cvhIwppcM3jzi663l1tI97ZHqg+y0E5YtJAM
         1Zzh46d5u5WMjfdgDJugr+h8YaB2uT3fUMIEad2EOUjfJLTG8wymCHWpbPjPaBHOOGG6
         GuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259466; x=1793864266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=ssPp7aJpg4ZDd5QYpAQEvaaY78nGNtyg5bZUosbnLCiSgOF4sFIegaxLM4fdFT5ssz
         EksB21UIPpJsyFL6eKx3AoxYzCW5NlKHCl9Jd4gcT5HN7FAz42IEI8Qbkk7y2f8IATsD
         hUpUg94oYhr5kK/Bu6Tky6wUOUx41vECihdCKojBPBekhphcDmcUyYSvaF3wi6cBDxY1
         spVwnwa47JkrC1v3ENRfaksVbebUoz0zLHsN+ib8jrwnWRu3yTcrCEXQtM+r2FXQx7CL
         WqKGhXTbUWk5+nRRVveWAL3+Y0Up6xEqW8u7w+deTLqUWCHqLQKTNT+ah2UPzaRvMlcV
         L6jg==
X-Gm-Message-State: AFq9FYLyX8UK/mNjzXdQ93aisKVGjkykFiK7nvqob21T/W0LVPKiiHTV
	k8VoY/EbL8PRlo4vlcBoo8moRSu0E4bMr1OMcGHBnOkUsrEAl25DaZnu
X-Gm-Gg: AYBFou1eYAnFa3yTQU+a0OcwSP6iGfnRZh5KBARn7d4lAMnXbVDvh6grKdudj+2yQH2
	Sx/OW5Nju8OWhKutQvNgu96LOZ2cSRMeyLu3GOtB+YsZwNka7KqxzpPQ053izfwZwSmYhk2ZJwd
	6KfS3l/GeII9rSJmTaNiD3EoZn/PxELva8BxYqV1YUX6WLkDgLfpHnsTHK7SeVzgYrM50trhm8o
	a+06jM0XRuHrrSlUwbVLH6ah18hgo/Gbib6Ae7VQBph+xzJ7kSpfvFvh3VIdd4yI5sdTvw0RAeb
	sfv3AOkAc/YcLWie0JPLPd1YqABx26e3U4Tx9c4VbRiPfEWhhruZ7BJHWL6WpdqHPxj4YdQPeAF
	TmuF/bJ5U0+TZ7WLEqCn9uU0uFPzqcpQFcPZC0njwpmGVKCq8luyRM2yQmwOCqgm6a8dW9Q3kyp
	H7K8/H/3Xfd6h3Hhcuj/+SmLFBhDDMRSGanbFNxtRWjfA+K0MdyBc3CvBVOeBF18NdsZXj4hRTr
	LFa1/XPPWySXkZy3Q3qm1bBfRbbHB6F3g2ArmqBj7dfHV9ILnQUIkMKfi8Z2461lv3/X21en97F
	C4n8K7TdlmbiGQxh/iRG1Z3+NIiQLXt0h69/Tmq7V5AF9ZNUgi2XQtSWVZv5zCU43/Ba47W4LzK
	oi5dsyVYTyZTdn4wOv7pvDabyPHl3lfsL3P45ag/kJQVNTZ5LjUH8Ipf+YbgzpPSvEBXFtaNpxA
	2Vwn6ReK5SNK64Oxti51a/mXjh/nh/DYg0XWr+Hq+UEZ6s+NHmJaOY6FJT5+7Epp3lxa5HSheH9
	A==
X-Received: by 2002:a05:6808:508a:b0:4d5:295c:a831 with SMTP id 5614622812f47-56384191e36mr3343729b6e.62.1793259466485;
        Thu, 29 Oct 2026 00:37:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:36:57 -0600
Subject: [PATCH v8 1/6] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-1-3fd56ba352ed@gmail.com>
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

