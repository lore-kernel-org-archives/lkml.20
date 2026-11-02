Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661284;
	b=fWq3OMEIrvuKg0lQeshM0ynJaE4h/IT6WXttYIFPGoKk1SFZqyGayZlwbk/iDFhLjQPA
	 Ke2IwixSX33lsQbIchx8hMESdlm06ouOxECw3cPQxc0LY5XBN2i2fprVIv6Uz9v+v0+yF
	 th2BptNuqbV0WL8sb2GFAAappKGVGUUPnl0qQ/7RDw3x8jRrjcst4ez4BwqQIcIRZ4P16
	 oJxc5hk5knMtMGdN92Q2/PsM8PwkCWNAB8f0n8ezSlmTw8vE2TkDDOPR3nNvWY3pPUb1t
	 PDcgKS+eCYiADsuij9NSWjF7JC6IODZRI8oZjnPT1aSQJzRbyMHososTM1u8T32NW9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
	b=pr8qVC6j6jZtmiEdC502FrfxEdRu4eJRtqNWjFg+b5B6rnvJCoGxA6WuYO/qQhV3Gv6g
	 OwAOE23DY5WuBhqaQ0ElO9q5bTplzpwownTsZ9SE8sYOVUZ+M2+6v6FpX/PKvp37WNW9g
	 91hZpsM3NnIlW5eT79yIHPcWx6SmG0QO7xPAU6eCHEpC8hPnqDPM3jTJLqLs6GswoGvxE
	 eZMg9sybN0srLUBKw3ABp70RJNhlGa7Ce2ZiVkAIUihnOr98x8FdhVSEo8K8l9GZ2UwX9
	 /lkbCxF9mp0UUzcbDV5QeZf4IKlh/+WwPExfpaRmxh9Wy2ipodfLtU8ejFmRdaINr1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dkx3oL4k;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676176082BD4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 676176082BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dkx3oL4k
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-705cb6cedd5so78308eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661283; x=1794266083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
        b=Dkx3oL4k5JnraMjI//7pIj4FRc/c/ni7jV1LCwcoRtcoT0D3CYRH3lgOrU0HZbGeSV
         TUwNV/dlx6yNCa2snGfNBIg/I6d/YrxkXPTraijQ16qDcrjsJixEVV6rvAIUz9zxX1aO
         QX6WtsbrngUCe/veWYgIJHoON/1MCv0zxYGRmzKlJExlNqqasniKQPoX/eSl1wLIX0u5
         u+Vwttc6JKv7lHzer0LOBv5sDk9H7xuA89g4EhJpEqKTzAXMCvi6PQ0M6bK7K7j/A1z/
         5VCFVJxh0ou8XS6GcIFKsqrGB3YnUd2299fZ/3oBpGwmrEHzAi0LlkwxBCkImVpmjyRD
         ntYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661283; x=1794266083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
        b=CDW1993tz+OWR0C88iy4Ao1tgiyGhGCkogpWbWpuxVpaPExeKwrw1/CiVYAxVCWHhY
         p/ISjQjbzfLaRrl5+hS7lbady96D55FOl2nH8N8o1XUXVRXC5PvvtLojgmHYAxRYD5I1
         r2B+pqxXA+Yh9Ee8cPdNTRL5MjEMfMz7gqHoESJkAMl+rztWxfoLzAvnQnZOd937rksW
         uW+sxQft8q+8KG1MFpfH1E53ov0cb+T+5IgtnrvYs1GQ46AUNFTqFjwlBpvpO4SE9imJ
         DoQhBMBzwqUlw0tKFWLKEtTSWO7W30wOgxsIuWGrHdmerf/dGSppYjF9XetlCg1+GbCO
         /hhA==
X-Gm-Message-State: AFq9FYJis2qKlGOghWpQv3sO80TaWT6G/+iEzMTl62DwZdyYRmybycuE
	cSKf3xO40lHXmPxWXqqQfdpVLbQhLLPa7kcFXzsnQjRPJ1Y+Vgbybbr+
X-Gm-Gg: AYBFou2AuF7RO5N0F6UfT6Y5DvFiC26pFCGpfEmWcJEH4eizMFJpdsl1b5N/7gVWLGH
	E0ejYu2ySuLy/Uw0nTxyjBinJRzWFeCjadz6EeSgK0y7RtcQLmnkdM2TVXZ1u7TEeL8S34Rsl18
	bWehqHOwow00MvnSQwDvPH3jzcRxcu1XNC8oJoQUFPlX/naYaXWzjPLoucQ55nrzrvx0U+Hx30h
	/VjWQLYFOt9u30roIg6HGg/DNDPLEA3I/O+ZIDByPsBqNVSureKIKZ0XawJL5Ha7tup0VmQHGfR
	Smxz0g11xZr/jwcogfpD5XSo27nsHitkOBdVDiLcuUeXZyeSB8dFRriuFTwuGz9SgI0KDnLwZqk
	cSfQFj5feJif1vZ/TBzfbmBk6lFGwd9yfEWqV3IMjJJHwGKVuCvjj1oTZOf1plDh2LDE5ubTyTI
	86cfIhypIx4ZQpyxeIjT4WbxDYGELcJseZbXo6yXDnOLfEc0YAahA7dRC92+0jMMJFfyv15CYxz
	KTeCoXhvLA/2oI8v8nSQzw0jp6LhhZTckem4sBUJEK4AmcKU+bZ9zZRDIVTpC0LJ4RBqVpXeJO+
	Gow3/1YmdlFa86LR+QUBfnYoKlrqI3dZoAMudiEvs/P/NQWqEmZ3z4aOWiy6jslj5Kk+TxTmcJx
	/qrsW27Rugv6R1D7zxxeTqgBkfiV1L6OJEufHEgY4mem5VdZT4o5lZHqqZAWb4mG5gdOdFSyupc
	ZQ9iiXk62ekg0GmhHB8I3aJxDh+30yjKwhOpystv74YpFxZDmwYizse3ymez1Uzv5ka9CYLLzG
X-Received: by 2002:a05:6820:571a:20b0:6f5:86e1:b020 with SMTP id 006d021491bc7-714f29fa61amr3266065eaf.26.1793661283331;
        Mon, 02 Nov 2026 15:14:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:31 -0700
Subject: [PATCH v9 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
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

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 322403cec2de..fc1a83d6fa7c 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,10 +771,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -782,13 +778,16 @@ static void omap_8250_shutdown(struct uart_port *port)
 
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
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1329,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
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

