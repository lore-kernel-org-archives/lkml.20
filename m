Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792824052;
	b=k7vy8Qe6/HUTt8CmulvtZFBrsebtrhT3sc1JFWloDYkQKuEfdwBL0aSL2VykJjvOOcLf
	 Scw0Z6e8z2Rz1QazM/wiBA51zfae18SczLYZuPODT9ZDrv6+vAEUwVUHBqHUUMo/sRoOO
	 Nl2nuVn7swezjNUgO25fY5D5BFOLE8f+dYEWGQhsWu6EDNVGB26RF0ZP14dyBypBg+Zom
	 b30uGHyYltExglTrA1uPznBv2lmJXKAeb/Gu1IbRo7cYqfq2OKhMkDxLyxGimXFDk7ybR
	 GkOzpOH5DaPF00LilbNrpWmPNRBdbUctn4t8SV6+SANfjw4LWNeNRlMGRtUf0rnJNTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792824052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=37coIC5EuuDH0TMn57oRzTJcoGJsPF5HqoMffCvV9nWhOcc4rRe0jphXxMuws2ZdE3W0
	 mEmdG66zdxxrwOOgvA5ssXtB3u5Q1db4VsVjLa07W6OnxSuqvg4eai2FHrHlL3rGKwzt5
	 qmpQ+DmaywNrLig4xGTDvKLY4FwLW6vBvH2tR7iyPuZJAR0m1zgvW2j4KfS9yLr78gH7g
	 V49bclS2Mf096VDbUFOowfqxJh2pc6OfQZvw3fVLuHz/Dt/Vq2JpQ8ZIbDA97VU1imRoz
	 rhlSRkKJtEPXO1m+auJMZn8WFprDu6Yt2pUwlLiNdDWYTDl3n8HMCuCeuuIjFbbyjLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d30j8H1v;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D09606A327
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D09606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d30j8H1v
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-82109f51565so650939a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792824051; x=1793428851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=d30j8H1vjZ55HFIhncWSScYUvpCWn74ZPocxwU34Jc13PiIB34jmSMmDWqbru6ozSZ
         YC6cNohO9xmUQ7hkS16ubYaIXA7G0jHHeV3ucvVr5lmdQU1liDgkt6dhB+0wc4OJ/MWx
         45MphtLCnZMLwOxV68kW/t8IW8vSREabK7RayR46Ioj6owJsJdccWKf1AyX35ZbVIKHD
         VJJbV36UagDBkWtophmbj74WhX0r6gJze7wvMgA2RmUgwfbv1HkmX0MjGfc8rRJLs/ct
         DFmLzSR1U2TK3UDKKzNiaBt7DnEhVmhUYOQCM5ZHNu+Ueb55IxaUQyP3lWjDBFLyAP2E
         77Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792824051; x=1793428851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=fhR1xLF5UXjMOqjCLBMDOBqKzo23qGk3w0FSWpmiubrteDmPh0iDaq7Qs8FDv5s8Gh
         lGC2p8plqz9dnwnFRhnBPhrXqXZ8bTzaufeO5yy1dB3rA2QyNfAqrjaxt8U5KLkZpEEj
         Krj+cgGXEZrj4zDG8dKrm3a4j+cdhTpqdtPEFnczbWc0d99KcKXbTWims9P34KT4a1WX
         VSmNHKe2XCa1ZVWRpuwrQKx8qT83Ezr+4fbT1u3Xla6x27IIj1MvJWOIR7tEEuhaq2Gt
         HhH/V5e+MsHEbDrV0jkCN9nU48qz+PjRmuEKqX0g1Wai8ftxhz7lzAOcD08I1YifSmVs
         9ufg==
X-Gm-Message-State: AFq9FYLa6tIzpXcoCdz3FiDpSff+KuxcDRhwQgyoOQKhsqUv1poXDS0K
	oekvSW42bIW1S54g0MXvZ20puwZTUwqV+LR/9XMsmazs3p/gmWgN3FMt
X-Gm-Gg: AYBFou0TYJ89CIORpN398F5qlhbtZyrDuOagv6XlgwGqfFM5VXVZ/AieaTZRIg12kT4
	P3eoBBp6kjH97yionoOOvIMSjhc8PI7Tary+xiKdxlNOq70d+4o1q+wcUcOapxr5KbtUnBpY/V6
	nUrsl2M5f6hlFWbKJrfzrjfx1up4qmlAYThhL0nPbD8jufHvEFYxBb+BTA0lTSkGcCA0h/JWOqM
	7fG0bZdU606dW65kNpOEJFajj34TeLAJUhFkXy5Y5U8c+HjuDo/SouhqyhL9K6hSXrpcsrLvuDv
	jmTkQdsyIQ88Uc/bADhMsS7jeiAzRPLZOGpu03t1lslHnxqKb3rNN1zZyQ+5ezU7wIKgVsxpqcQ
	vj2GlRDViYXHcsU5FWv7VTmlFwKcXgsO56syEHZZU1Wj9hRvzwSDmNjnzek2GNbFS4cxdNuV+oH
	CYoWUGJGEOPfGTjNF40tYlieHvcQ9hRLgFyBSLpZSgaDG4k5tzA+D3K38qu3+U6p9yOrP+5p5op
	GNLkXgCafuXuIZSLzvUNixdLeIMo3zOZobXcSV19BLgmub1aHEZ6zVwMU+RmAV6uFYtZbgpuGGE
	ZA3g2YFJs93DsGrtZy2U8TYYr9h7jTiwKqN0nniv+A9lkpp1U/br1RtW2CGUALH0An4FDrnMRL7
	MQER4LaCps3lXYS74zQtitW2LQ1u2mqfKFmJPwiyBbl1xVWyhR5+5l9nqooSoEj9E81g54VuBSw
	el6qvLMsag4Ff0rEFg/wBfy10=
X-Received: by 2002:a05:6808:4fe3:b0:4f0:1f76:8ca0 with SMTP id 5614622812f47-55c003e9dbbmr788058b6e.56.1792824051160;
        Fri, 23 Oct 2026 23:40:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm864633b6e.9.2026.10.23.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:40:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 00:40:40 -0600
Subject: [PATCH v5 1/5] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v5-1-9e52968928d2@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
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

