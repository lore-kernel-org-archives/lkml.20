Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563605;
	b=qlstrW2rroOUpf8pCwi43nSAjwzbZHHXz56dZsdPQCoIzcs5WHY5yOwJ9+Lnuk8Lqmaz
	 UkMODJU6qzeK1PIyL+FsAbnx7sMzYPhmASfuJC1oRlyn+/tguwjs4qum3v9+medl+0ayD
	 +sWrqxm5zQOfd1ypxu2QVdUsFtfF3P97n4WQA/wGG1ZvwzjG6nsbJbMsuSR8TAK9SY7Nd
	 HLIcsuOjx/sPwdRWjw6vFdqqG0+gAedL9gGLeB+RUQm1m+UdIwOfY3hvQ/PfpuQjqhGvQ
	 2Pa+hbIEJhMVEdxNnY72DvZepJazX9dHipFVRnzpTnXj/pdNLE87M3U+/ykNe+kOqJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=XOlnil3F3CM7gTmVGCLHUMmX/KPSkH0qanr9Dd702FkagtD/tfcaEDaaBG8LlsLI5gDo
	 OpRzs4dQ0DWz5t06JQ1AUcFB/yBIHnZqI+Vd2xO05KBry6VrscOaQGFojRclvdGzf9rhO
	 sGtWfDxbgW3J23NLB4lf/iYwqgPV7BEtO8KlECt1xvBGg1U/cYtUwK087B3qoZM5cjCCE
	 IlYPwiz3Ziw1ma/a00GyNLHZDztZ3gorXwsUxiqx4Ea0EkZHsWm/5so21rQqHcgsXce97
	 LoSUzuWsky9AwVZPmRbFTCoBiksIh6gaxY2hbpgjdPfPzO1jKobYB3uF2UhAb8TF/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8DeprFB;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6B606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B6B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8DeprFB
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-53a448f86e0so1043876b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563604; x=1795168404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=O8DeprFBEdI9bBIP6cKC89EnrWXR5oqrxsfN4CwMFW9t/NxDrSMpK1a9/xEocxH1y1
         b+RXDH9+zuv+3SAdXBFE5oXl7C7HmG+dBpMulLB3JleTH0LB9/FAo55I/160EuYSo396
         jCp9jSHXAW/tJ27Guqg7KvXaxV2AllmEVxHEcazsLc3vsOajF2rJynD1epfL9FhPZ3oB
         ugzAtUnCmUqwQVYjXagqRAtPn0WUTADLAZGxZ+n2gRQ90Xu3shz4SdBokQkErgpUlSux
         Lm6BNcW/B/IqKltOHyM0yDJ7Rmz+VcZPu13vLtpqWzxolJ/CbeY1DSd7uzCNmUJA4YSe
         cFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563604; x=1795168404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=IKHW+w7ac7uwsmw7tWuW27aDVIIGSpnJBknIf+cweDNA1+93ZeqmGFVjvQJyGUiV+S
         /wKqmA37ca5m759O5zln5etodPuOaQ0lUkWlPQUk3xKaUln+pz4dN/hTmKHQc0XW55Pd
         lxvaU4seAtvVqt0pwoZ8LWRf+qRAAY9pQi/0HAQJ61ejXgd5eS2y86XQOYdS+Nwcx4er
         Qwo3qBH+C4cn0QyOH8pPEgogpYeQLieO6mwlCZIsThuDEanCl//mitjaYVs2+Z3iIAjx
         Wod++fuoUQ/Fhuc7HrX6m/S50A4qvUW+Iufl2pL4JvpPPTz8H5C2fd9/mJ8HXxc8kOEI
         uweA==
X-Gm-Message-State: APuU4Z/kxW2LGNOdFU17aTDBNOhHKX1FCG0sFxClhKMMwwS7+7v82MoA
	2GqiaZiDnXcya+rZESfreXxQy0gW1oMKG5GlxTQSxKnfnFZN4J9WNMOP
X-Gm-Gg: AYBFou3zHMzJf+UNVMp+JDSk5+5JOIzDi2HQ4/BVwWtVAR89h1l+2OefaEQIOp+7n2B
	hj5oOUrAtkDqRLYXwcEkRH/1XaZFDmGSFIOPH1DzGLTtUR+heFxC5B9XAfTP2XN1mFlMjCs1vdz
	vCksBrGqOzcowWlEnsToytyh5GF0858WcjYshO6ox7NX5g/g9nqHFUUAmeeGHXuwRU99nT8ujaq
	yLFkE2ljua7x2hIinUAKD7mLluGIaieNiA8nfcGyCEq5wZkOlRxXJaNS93wnyTDE+EndiuZszbc
	4F5aUNNWd4wN297Zbvy47jsCgM5oK0NX6a+PXEWN1Lm5h/lK64W4mMD+2/6wYrhpuH1TDm+4b1p
	dvv50hFXpnA6Rp2nYo//d/KvZXhaRaB2p7gwM7pYun4ZiMTXGZhD1TPrEAM/D3iC6F2b7Vtf3Yp
	XO2CyDnQcDqnDlGOGp3SibpFmHAtWk1DppfF5XX5E+fxamhSsEc1VBDlPF1ePekB7s8J5nqhfYz
	XNUlGuN9abB5qI20IfWtcZzwZFjxIwoQ8FaJJHeeebwL8kxTRcyD/nbn2+0SOA8G8IZzdK8E8b9
	m+4Flp/SKOX6i5/FCEaw3M0DH2rZMVP1HA4GbSPz1sf5lJ6PusvhkS22RrcGzDyLr92+W/6aiPK
	2Vl6caBF4AGfTL9le9fbSugrJnPy6nkPbPR8ld2/3m8J9tG9bifyzRpmPekI9dKbOSEAvdmzlAY
	45vRHEIWf4kGi9GJ9D18u5dhO9BbhHHJ1/i9zs6qXMJVblG8p7hsUpCYPc8K6xfDrBLXrMWGti
X-Received: by 2002:a05:6808:c1b4:b0:4d5:27da:a492 with SMTP id 5614622812f47-56e65a26806mr1379942b6e.44.1794563604182;
        Fri, 13 Nov 2026 01:53:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:14 -0700
Subject: [PATCH v13 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-1-b857f2617ece@gmail.com>
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

