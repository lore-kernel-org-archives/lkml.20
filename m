Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196273;
	b=FWEjQlN2m3i2d+iW70sXM1cND53D0wX0epmyXg3pUjfocNt87CkxmOyHHwfLFAjErz9E
	 xQIc2CXG6LbWUYVs+e5RYrCQCqL3cgLFRoek48yEDtRJ3KZm3OflKnvatRdEf2g302hLj
	 SUxQY4s5u2Sk1uwLDPcFeJU7bgLEAllXdWALMER+bUp3hHKl1nfyorqynoWeOczyzpxCs
	 /V78wYXHqM9GeOyK3PuPr5m2OXKi5TJJi2a9Hgk0YmQdDSMRQPry2TEZER2Q/nTZojhBT
	 WhP+mH3Ykr1IoNBxB1fluTvyLIs2FSd46iQk3KYBfHb1cR0D+/TIm0+XMGQr7fBXVQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=kqFXuijCl8D/oZ9jseiEt+g2JHFjYDgadjp0KTBAaQkut8I2FGuAEvaCS8pcZ3mrSgAD
	 R08I6/8jD8Pe8oHsvZATgctOXnzn5fbQp2W3EIfPbUN5t+CEBSTGErgJXWsF/AFPseLGp
	 fwezVB7Bt7gG9wWgVZbZvQ7st+x+RMpkug3eEvpoMasnYy6to++3Zh5LVM9RLn6ipumIs
	 epYUhycgYGQff8Zcx1lF0OlMDttPpK5VKw5UHwInFq5oizYNjoRTFjWTPQ2lF2XhDDCZh
	 aahf0bks4hcSYCF9VXSPZX6Qe4UOnhMvSU+1B+ClVQMAI8AECebhTKnvXAMkJbYf7qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpxxsSzW;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460FB606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460FB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpxxsSzW
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-845788309b4so173848a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196272; x=1794801072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=UpxxsSzWafklH/6FRqKQHO/85uVUc6r67PyXXXQDNGjxEqG+RTN2EsbHNQCkh0Wdg9
         54iNmDfOeGdEo36e2bVTDGQvsFuKGMgAug+l6qmm6f8uh9ykHaBFrTaaOf1RteMkwlEX
         8g5QqVlKUCfg/08zdcDDaylSDJxKpWWYFCSSfSOxrnAtRh39tNDVyEZA/NsWM4Z3pg3D
         O8bRtHZqINuD0+5GbeUrf5lhDXh7/gQGOiLCYbkHk+PWQFN3CpkEu44dIF+mwy6ljJR1
         ZvWsbNOySj9uibyqUFj0O+CwH6d0NrEZkSW4FyH6oULoFH1eUbNgSlr5gQjPR2DlfI57
         +aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196272; x=1794801072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=QTKWKL6Z2ylwnumN+yFFt/VSltMGnBMVFCbjX186/vuA/VU5D2QdbuxwffyJQmxcCH
         4D5VjMTCi6JuS67vbPT9ivZZgKtr6eQWSWkLIgsOl6Jl3vSZPKdmSden1R1MzmUj0dN7
         Jk2mk5NTUqPU06kKU1WezNChbmzn7KvZAFV9p2mHRhxZVJynGk//xq54RMKjc2Jze13o
         vAEKtphe3Wx0rNgyRMj4gxzeEzs+m1CHeKfMWH7SKNKMG6ve6Vr4tGCKzl96qx3j/SUy
         y0qdzvzksNnjAw0m9JfSNxcCig+9QQHokUuisyanvvnTclVxOLJQAGby40gjLnMR9X7A
         jhiQ==
X-Gm-Message-State: APuU4Z/4NQlied2TQA9ivdrsgRI5nxf6mITHXUxV3MtLEHl2k7slCTfz
	TfJMbR0SYZE6LK1rjz4jgnIAX5j73A0l9lCWY0nwa2rPw4W10LZlbCPh
X-Gm-Gg: AYBFou1M2azCIoLTTZ413+jidC2wxY5X3mAusb6k01G1WYA3/qSoau4DZDvQANc/7CZ
	Jg1vpIzLjti7C+ibvzbBbku9wUmZJhcf0RLcTU85RuQCHCZJt2Gbh0FLsU55o6TZqOnsK4ElHrY
	VfI9ZPhlQmghBjESh+nQ61GpSHUGwKKDn+MWdhWRV8g+DhBnhd1x4Z1xg5W2BAMXcE7OMO0U2fA
	vmUck1bZ8EsNwXT4G0LmO3KX5Dq84H6Jgu8LLTLmIjyYJutxH0v4e90X+gnCUubhkd9bgyibbG+
	SOrYQzeMUy+vfNbUdxG4BPVXbvjRXG4QDajkMQCZ+pB7ARy3XFQNwXts8hlHg0DQ+pVXdov/KtN
	iRabPEep7E/JSNdDJipzVsmcCJHE5rLQqkrIT2uDiSZyj9XjqYKvjHyFfQyGJKJxk72pTmYcW9/
	wwRAP98Yji6IXL2YLsSbHgRXc8e49H3zgwyMbixEot/670D1n/r10c5b0mczhi6ExKJBn/x+CAh
	nCglVPoRUyI1A97AnwwNxMrreNo5qNSW/rKX/AKLfIUDGXYvjZHL+newqz2zvrjHnLQXKCIIR5i
	RLjS/ah/4QeKXn3GFFHhO7K3TI1OpZZia3e+L0nZ1rcH6Kb4Ga4gyy01yqcg0rDeWZ1SXQNYPnJ
	5G+di9seogtdmCp/p6x9HAE/f0PEwfSqlRVpNW5JLHfDoBsJMQUjvSS8oio3zQTgMhnY7oNJzl2
	eDJsTDOTxXODCIuNrGrRU1Lp0M6iQw7pL5v6v8IuGs5+kMECbfNGZv
X-Received: by 2002:a05:6830:2b22:b0:85f:49ec:c96b with SMTP id 46e09a7af769-85f507ef5eemr2216062a34.16.1794196272163;
        Sun, 08 Nov 2026 19:51:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:10 -0700
Subject: [PATCH v10 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-1-e6227ddb95b1@gmail.com>
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

