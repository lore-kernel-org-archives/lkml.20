Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196277;
	b=nNdYzeZX2fff6m/pLOryWJ9IVGzlEYFddWYm7ZEIhMoaW4l95aHFxNDh41l1EgXUgFNu
	 HSzWvBfHFJVO3DHLo3gCcV1nE0wTqv4dYcue4L/yy4srdES/tHX2tocQq4tYE+MiNUHtO
	 N2XN004T0PQz64XFSqia1PjA7LyDgdfZLpm/NMfYIlGYideBuG4OGwGNa3uowivSsfCyC
	 uxu11rKJRP5XJz45dhEHnr0F+twslvGYF0503oET6N4SnxcZ6iDyfcktbirU0DTokM7/F
	 PDdIH+jYvqjmZiSgxIwAjpdr5BBduu68cm7NLTxQfRWfts2CTm6Wr0gE/N8fgtwddTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=YrKuiQ9FuvVRTQz1njCEwalPRN7gtwc0Va+JeY06lHt+uEPDTtg5mWdww1IOvmjFVnfw
	 cgUVGCXIdU44XOL8UZCMGDK9t93iI4tOqzYt8o8WYpKvM0GA4zRm0UZER0dDpZD9KoKdD
	 kSJ4l0uD8w1QeRZnhI8y7JgV4VBzPO3RJoviZfruNMr48s2Wev9Wgo7lnSI5WbSDOZpuA
	 a7yXMB2IqCHNX4FcHIIR1h6zmM4aBpzBm8kuJdf1A1ylszg+dQZpLYGEoaVXh+tO+c2U4
	 XE8tcFn0SwDlj08vwlowdakWxXk4VnJ75P919ph6vG0S6IZZl5IbW2UUzziK3mhFG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iRu7/eI5";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0325606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0325606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iRu7/eI5
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-844a8bf7e25so310500a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196276; x=1794801076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=iRu7/eI5jbPQv586S/vAhjA9mCQe3E+hSVRxrGLWdzZ1Cu98h8PhkR7ync5vauEodJ
         8cZFqsEZaDudsOfOz7RI+EUCAvmciAretwgXQBpkcKuD3cFb37HLm5mzTayAeKjP1w+z
         zLxXTqedYctsoSjpHJsY+XghbosThFK8q7oRWox8t1f4c8Jw4F4aCQd9oZBjFCTOxSxA
         eOZdV2QbyyyID9OhaVEMWpQpUZfAFmtFzpNNPvU+nYI7z49wnNgBot4Lw9GkFKPCNmhI
         riNa0XS3q2Z9Of/LXhYba9Z3bDA0q87CA4ZfVXNvc3R92iECt4EC21E0FX193on+S7tj
         ayUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196276; x=1794801076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=XfSNFvu+DNselGkaDKVp2Yj90qmGkRK0918CIM9Y0DxQeMZW2Zp2Z3EEoyHckasmUZ
         d7kXM6WPl0HGbcxz4qVQdEocreAJhQ1r50guJ8RxNCATGJKHvBHVQmgSaufc3VQgME0e
         bbDFnu0GEzR7JvkRuNYiuO/rQAjHU2lsPoAzEijYH5kWeGvq0zPgUhHiiciRHnAIGW1O
         dFHi+WhXxGgYjbK/cbTy8L102s3CQPTiIWqW/oWwvQ/E1H9PRD+ZG0A4XDyZzwajjV1K
         00mjHUfkHW2+kvCDDTVUD/HtNAL2HiIwKWfcGwS3QBF0F/EKwBpB7Vaxa/9sOT4WX/Tg
         0Deg==
X-Gm-Message-State: APuU4Z/CkZmL4sRp5uVvXklnMqNBMHFKPCA/PLe20QnSHk4EJ+Gczb5p
	OUa4KwgWAzuzyQMughyBSrV5Pj09SjYaQbMcTpM9JT43/oPATUe0f3xg
X-Gm-Gg: AYBFou3fA9g+FX4ITN2UiBU7cI6sNxw35dOhU+0ObULcbijyvH/XmsNZDDZWoVH5YR1
	vl+2A+c+DL1KxoVLooC3wSb/izRIE5t5xHRVzJqrndnej6FMWt64dm8zaLF5CJ52/VKKg+5mTKs
	e6cQv2qeoLEieZ5zDzbopLcUHnIFi+lg/DZKQAthwaRqLKwTENHKW8dOl7I0vP9DLKZp/aS+5gj
	Yy1GYEEwrtdm91PSwHIsX/nHSf/5VlQyxUlc2V6L8Pk22BCyWIyQW3ZX6LdEq96mThLc2YWitks
	QJHd0m5gsToDpar40h1o+KcJyiFaoxS7aTUtoQhb5mjFj9jpTVztmXIu3DgwbG1NZi+Cy701JSV
	F3ltWRRPAUaLiBYvTkG3yCemGaymmboLxRLUmkITWURYkq/M2J/xb+97wMpEdlHc9oIBk2utT1s
	pPcZSEUB2+daahCfFYYR3/pvlQn28YYGo5XF5xZ5bbvM4PdM6VViDvUX4PjxYoUgDrdhsnPByZj
	4FdbN0lgq92C+u/hYgzxrm7y11Zn8rXwVEJeXElJTvLJTlsFQLkBex6fGBoYBed+un+mMFO1p9N
	lWvb8crk67GGuy16/yQeHN9+jv5yrhIFM/3BFV7GxZuHFQ2jDPZRx8l+LdJRZiVPPNeW93xItKO
	taIQafLSjlczk2rDTbwOe+cShtylrkB+NZeNP/dBg6nRWdLJ5v0pamu5Gxolp/sgPpSS+JfZhsi
	DBFsyOsVYYT4PZrtxlhkEOJAEo5mfS6YE84w2u+vIADbm38uinuG7r
X-Received: by 2002:a05:6830:2b2c:b0:821:c75e:5309 with SMTP id 46e09a7af769-85f506ac2damr2072062a34.7.1794196275699;
        Sun, 08 Nov 2026 19:51:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:12 -0700
Subject: [PATCH v10 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-3-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
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

