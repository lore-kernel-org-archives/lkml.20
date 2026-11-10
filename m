Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283236;
	b=dXrGKOJw81GhNudo1GfJ/al/iLbTRDjuvSHuaDOtZLsKULZOdlLzKOvkK5pyplrRiJI3
	 1+YS51lUzxDhaRIJvnORe0VrpQFHBBXh4MCsjl9Ig1ICZeY+aCC+0zvUS7qUtdGKlbhYt
	 jbq+faZDXh+yXwVYONbhOEZMfmDdRKVgs5GdtGbrjAk259HsBdBPWqKj8Y9blJO678f0S
	 HvwAxp2Lt293r6/iFTRQJkfq+1BQt6/1Gk1jHjox+09kXcCJU7MeQSH8EQfUKmY1QVPHF
	 3Fz94X9mVDuXEABuSx4K5zJPCSlMQHXEoIY4ECdC79EMZRTfxPjEib0ModalctEa10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=aN0W9xSS5zI13sJ3gJERyX3xPB7D7s5nQkAB1MKdXdE4uRmd/uFJUbJ6r+8DRB3PlqCJ
	 h+Uw5Vhrk0lKxLRoi681/pm8Y1w1TWYoumA+iLRtQuLEZEHKZCZLfDZ27GJl/A3yhG4Ed
	 K68DkVCwueNEFPidGXI048zgBSCicIHRboOc+BvK7Pd8yEqeGvrcA0hkfk4VdcMi4u4lO
	 rRY5FvAn3Weymg81+TvrXlpQy2ZYlmVcda6Vhl+PjF7Hl52Js1xgAwJLOREueafeYYAbY
	 4sNha8IZTgm9UA0MevD7KpB/sQvF5frJIKcTZHkEXrvDhISEcEr3bezgSOvZOjdKGZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXeMNZnr;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63852606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63852606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXeMNZnr
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-82109f51565so647812a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283235; x=1794888035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=DXeMNZnrr8VqdcBbA0ovlvTA/oo087KjtFXzzsfOZS1Fo72TnIEVZgJkvAH6uzbs0V
         Y+WXNrf8IlbxwwDimNycJg5PyqZZ1GanJRpqSpVTI0ts42GazxswJk2LNu/rMZbpE7Zb
         8y2XNAxb3EPyrdSJnvnPi8nGozKHyrNjiuTXYHWTNnLAgdynK/2gYKqTDKcZdchsXmSl
         m31x5w0l+cA+LsPTJ7ocbgaqyYmgzvuq+YK8U9VhFdY4o3qUf9aL4S8sVOytGgM8roTn
         wd458Aa+Cw+GO/YlLOV9QPFCvFv626WhJdrvv1Jf6dm0VB+7Y2zjD7tOZN7vnRHtpmcw
         QJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283235; x=1794888035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=tNj106KpeS8PELElqmoAyeKz9H3VEeaMmFnD5FsOqMcFfgSjUW+FmTMlGyWEc9kuB9
         FixnefdHYqKa/Ab+ccLlJUZ7oWYVcU7bxj3cOXjugvubUbFiPsVd3HLX9/Kmg27oehn6
         6ValN+l0VbvZoU46HkMaTb/2kyNhdWnzkzLpqt5CF1JlQileJa0heFm1QNTLJAfafibv
         agvC1dEVsZlweEcozsRKOpJSL7jkrRH4Y2pYe0Yc4FNx5Ey6Fottynofk9lWtC0ZjdBY
         d3oRodTwFahdNzrkSeVFyH06//DvVKRhI1jACKsY85LcsLVWnkheo0C9d0TNQQ4WbV9N
         reCg==
X-Gm-Message-State: APuU4Z/FhtbXtFntx99TV6+veA6S0YQRxKOhyEIvpt0qHl+AYJINqf6/
	6LucqkdnfWIM1szXPuI8heTFdeIDhpQupBOf5PV9anQ51OP6hgR5HNxuKzTVjTkj
X-Gm-Gg: AYBFou1SblZUS1JilIIz7/kZYeN63Nu1IlJNjwp1fH7sA2stHddYt/amWgzxSCZwqcx
	JAGe/lcIjr2tvnXccduoiASbe1hwTKHTfcak6E/cw0zco7RW41Wz67OWi8iPEWk8lBNfmT9ijC4
	O0UK3/E0PZ+Kp6H3/v9ssWfNegYe52GQGA3zEgBqomf14PzYpk2P64mrJuEzHw/NvjYFTf6vLju
	sKEDhyrboWFO1R2pVzX2icV+hCv3y5B+D55lEVcLN2+hoV9C5GNfXSjgIacpyPxWW8H3KsJPkKA
	qSVfi7Q39KtWovX+ALA7OJzf6izqr8SA3DbIFbDIBLH6JIQcMN1B+n6OddUJ+WiIHmq6UVfAACZ
	X++MN1K76nfngOxZhjNCN1CR9IvRL6cM0AI0sA2sNO2DofzwbiozzhNA7HUAxltBzh/y97EPUJn
	gcsHzcsW1otaymvrZv5YSJZS+Nhp6Ibr1VjHVKm6XKNmysAJUwzuZDgC2p9kvzFBSlLFUPLs0m7
	v4wl/SaobAzFccczC7d2Dh6yWC3upJLdFzyQgZ0l2uAMd/5gj9KelJ36lqms02V04aM9Y2SNh1a
	gwvrm+bR7214ZKcefGq1WGRJxDS9+1OaQMQPJ+6XpKo9VuvVczxd1HEUMsFyBfdJ6DR1lCIfqhQ
	8fgv/7yP9KeM2yQnBFKC7QsPAgWx+dlDDnSzfuUA8MZJW7h4qsVggpoPLN1mXOE/iuqM18p5dkW
	+Kml8J+QjJ+ylxQp35RlNUO828hGQa8khzUq9/XSCoyxUuLEmoWRL97FdYIfT87FX5Pti7rxGx
X-Received: by 2002:a05:6830:906:b0:844:4959:e856 with SMTP id 46e09a7af769-860dc7c3282mr1426887a34.11.1794283235287;
        Mon, 09 Nov 2026 20:00:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:16 -0700
Subject: [PATCH v11 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-1-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
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

