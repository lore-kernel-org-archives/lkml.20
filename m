Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875155;
	b=mGPiTTSaIQdIBOD5Qf1POtNatOAEEl0v8KMdL8Hps+PXPs2PxucSqWPcrRGAXDLvvrUC
	 5rXR9KfjOd9/gXZIRo7I7bE7vRuTI/Jabph+bFQxRVpSpOWFbz/4YgEacjJU+05+vEaR0
	 3fEKb3vZj5hgZH3ApUuFRv2RIPGKUrm5HRuDzgKvtMjFUclt043LjYc5T8YHjAu5Tfjzu
	 FlMMglpRUkexrqrBO+fLJRuZsK3gYo53sas1bmwzcLAhIt1o5vm9Fi2PzwPdy0in+NdpR
	 jDzxwU9lMqjObB3gpUo5FYqMUblQoJYzaaP7XcD1H1J7uOdIsTfC1x8OEywV+NUDqMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=Kxfg+o84S3JMcI+nzKT6tcuWWRWJbvq2qURMrnG7iqaUOvkivmjMz+CXBDjx3ZBVAjSO
	 Kw1JjNIhyAdgj/aUl+TE37lXht1Wvsh9uPfZPFFjNKPDetQUHz2SoMqVz5iPsgWJ/eD5X
	 iY2nSU+0NjnCEmMUFB4lF+4nKFSSS5iJP4JHwHTY+3qSZwMAdUjFmjeWa4No//lWE//D9
	 rf8/FXV1PyzxhC76tzM8tXT06mafVEClq6SXKz77gV5pkTXAYl+4HJZms243vH50JZfTu
	 bcdQDhlgi9cpsD34FqzjezWViT5DraL/PuVAL+JTttNQC4Kqv6Zol5TTRwxSNjRaC2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gAq6wKcf;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4E6606A326
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gAq6wKcf
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843cf077f10so2115957a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875153; x=1793479953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=gAq6wKcf3z/+3nF9vgZuI0PqoqdEyOylIwnAX/7TL2NuIhm1dos+YsijsyGpIR+Zfl
         oaHoWyHngYRqKx8+92Y8THeHJIRF9+2/UQx52Y4xpEXwx6gUirkfWfhWf9qpkqKzvWYf
         oFIeESHM2ShL+qEx1gI0JVmqWuIC/e3g7Pffv8/mt4OvJX/kaRC2dWoNttUFpFK8lKy3
         GESnwvYZ5RYvMmlgRVv+oEt2KZ3lUEpfBUyMv7RD54C6qWTNN+3eC88TKgvPyemqM8AR
         jAHNdgHQTC5N6dI62UMPOInnvjWR2Pe2lYFm268H3J5vipy/bsQ+ph4oDHLgg5/2Q4mz
         CJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875153; x=1793479953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=CX+mE40NLTrsqTNbmTI8Tyf/qOJBpUvWaIk5BDC0HOCqEh/8RGpq0tY34VWOot1CHJ
         sMQ86yP0t582M2dj+85jtPL9RnKsZejFyoBAEZsd2ZmNJ7n5dK+m4EbDMDLgTPwtXTCa
         xwUQlE0h5hiy2xGdBwQ19a2RYlg/TGSfjtT1yjLWKoo0tLBlzux6/noI65vgkuuPzlYt
         oy9l00M+NAyxiIpztjrqpRe8AwZ6m6eHPCNLN1kO3iyNlHM9QzbMT13IP0mYGg9002mj
         9Ewl7mEyyhckYtoxXg0tZ7uUklMj3IEt0MKFleCjf/WteHnxIjNVsSjPyeuH2pL2Ozqg
         q8eA==
X-Gm-Message-State: AFq9FYLvOo2F6cJHuUwf5lraJyDG0SNUf3caEmpPZqMPQGC6j19R5D/G
	VQOhIQS3Lf4bDTC14rjKwbC6vW5sjkX1OJy0xTAS79ts6WScDyq5UdWo
X-Gm-Gg: AYBFou3bKNLl+7kZyblBglMVfOfSsZJ1ddY1UtFBdGC1RBVyx+Qe9EU6NDCzFeozP/b
	VlMKqqG8aA4GD1cgyqVQqOpUPzHMdccp+b9mSy+m6Sk96nX+ODEfnQh0on0yTf3mndVJHuHIGB2
	DeOneIb7tnZ6y/2CUGEZpubcfQ3LA2ELTbVxIfa58mDq/ktYWAsMu1hl64gi3uD1959DhAN9pC6
	5RcvlT3mVcd9rfABO/Uu5uU3UO3jp08riD81KW/yV1K0NXEX6nblSG6HboPm9f393QILaD8j443
	RyfGiK5ZO0PAnGSiNVVUgx+0F6uLN1JpiyXipixxAuy/XGJ9I1MzWHGJ5uK6nXAwc4nhYdBduW8
	6yeGXnlcJxlY8p6GtpU3FziGfCi2GnK4tPloUsO1i3Sfzv+iGk34LmM6E5jTrd5qGrPn+eo+mRy
	CC/H34qu6Ug5VwW2AuMps+11E2BJwsGuaGs1Oe+YdGuXxhnGY9x/QzYD51iEtgw4K1cknvZtusT
	VMC4AG6xQnTk93gHh9AGgigHGt9WW3TL7XTR4QHfLmMJ5fi7iRX9HiASpqZdCZoBuG/v2i2fW9J
	h2fUgCudavtjEPOANX0Mg6IKoIPZH5UHcbkWbuSpSHXkPnUo/mUGtUVmUpy4kW7HIf9v9DA+yIf
	odCxT8gwELv+iAiYPNmltLjVHK04yrqSTWovfyELr2pjxlppksgojRLHwiNq7SeRDTrCdXMHgkZ
	KL9w==
X-Received: by 2002:a05:6808:c1c8:b0:549:a550:8acf with SMTP id 5614622812f47-55c003426f1mr2007470b6e.50.1792875153162;
        Sat, 24 Oct 2026 13:52:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c932sm1986785b6e.7.2026.10.24.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:52:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:52:26 -0600
Subject: [PATCH v6 1/5] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v6-1-6f366591f566@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
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

