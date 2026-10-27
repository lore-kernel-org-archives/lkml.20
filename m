Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144395;
	b=Wvff/hw30tjuyfgLM00sW3Ae6Xx/RV03s/IrXx9H+iJo7nyGuf/yIr+YyK4MZTfmcMsM
	 xNasdWqyRe218uUDIcH7ljKmW2eSK3W4ibIdatddxJAFKACOvBciqGXEn6SIK/1aMX8hq
	 J0viglW0ofjGMGY/iLZP0mCYZUDhX5npKRvUTGBtZamOloh0Xyzp0Va+K07VpWDXIwBI4
	 09MbGFTP3sKFqKO3Tss/pYQ2P2L0ZTKpFnm/GMDVX4nMekNNBYHdTm7BlQ8RHjx7IUtsF
	 jJFE2scruDeTneFG7XM9neFaUXiUBWBPnTF7JrszwQY3pZs2WqkB1kp0WfeJ8Fc/r6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=qx7yfIs84APNv/oEcLFCXmOZ0hR/9roFYWmXAnd1oOP5Gq5gIlbdtAJQSYnY4aP/y4tw
	 g7gFZMzp32IVnp2V/qZCJkKyq6ulCLb5Ta0FRYDJhj+z0KlhwHedJlU/e2JmyIxls5VDP
	 MoBQn+rnuvhRp3Rq3u/u3ZVjp5WZHZWpow2iROPm6Bu/qGWEo4bpcMO19rbeLGTuNceuP
	 VzXk8ofd6aO+D2LBw+yFPGCVpy+4zCv3E5C7fGHV7KQ4LKDclihPdZRFo494lRVbQ9uxV
	 Lsg7RZW69KF3ddbX6WxyqO3wXYh3VfLNOvyvVKAL5PGfYL9SqIME5Xwif1d02vLjo/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qdYhQ3R/";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D12D606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D12D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qdYhQ3R/
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84a2bea315dso282647a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144393; x=1793749193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=qdYhQ3R/n3DzcCumCOhrFW/n5TjZH5P+HncGKay9qiDO9UZmBQm/zQ2sj+2AtlY2w6
         2sEnmq38N8d/1+S06QpS157WBQaVslaN6l8YTy5W/VWOdQHilbBouyB8C/PYFA7b8WSJ
         pdNhG2tgjbaX3QRO2ppdrv9SH9ifa8oosnT7pJXGStEl5jVKYGlFghJrdiCf86Hk1Pet
         eKI/ClAzQ/8aj018Gk26LNs/DgsE5Dd0YRRGSJ1CfPD1jUpQi2DOPPtgmO8Gdy8y5gbb
         p5+QFqjhWlz/HrqDK0OpUCa0m25RQhw+rRNuPQiU+OrsVMuvxZJYVXxbrttMU6znYLN8
         318Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144393; x=1793749193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=FjyC0WORps79+juc7o0X2IRg8xWrNFQPyLKJUGxptjhxrym//eQ68GXsa7OI390Mzg
         xJR+ACvhvXR/Hac2U6aoE1TBZ0lESJ4a4xABeu7J1ky6uWOKheDFk3HTJ8nwKhX7Sq6B
         8irtl/6sK5XwCgOaQnQ9fHMRhm27EzDI/M8oUgqBm39chyU+2LEuU7HH7NSIamdJ79Ez
         oPu/JvMLzmD2n6JnF6C0jYGKfzjTEbQSkRtaYBdwmKvbz6D3WaPnXAsmhz6q0E1whN5p
         SUyo9f2Mv0x+nbanJIKXNqLwu3MWM9uRD/iyOhdi3zJdT1XoVuGRd1A08rQHwzuwJ8kf
         LT/Q==
X-Gm-Message-State: AFq9FYJ3Mpmf52yjOb7v9+Nsu81IN67W1F87MZ02AdEFkFgV48MUAc3N
	zUx6iHtLuuQJhDZQdEAAm6O4AIJvn0Xs6SRWmAEj2jLFleX08u0r1Ec1
X-Gm-Gg: AYBFou3V5mHpoGjVAO0niyAnRPfSvJP9w2xjny1lvuTzF1ffTsauPMtMgbJjz4pBJu5
	FTxpogwnqLJut6efWuFjjICZkQpHCJSDfU87hsRgN4tobffSZ/sA58t8QDF3weX2k51GeAFJb5L
	N3mXRxn58bNv9ICC6U52S8li+8bPULLwK6fVBjYeMhYwYLcEs3CXSfiAhTDYIXo9NoalBdnr6Mc
	jiJqnmc0uxCYk0dyZF81qZDgTadum8j02cMIqfRE63mPfiO5UKkVzdCm30s2EQBb0qXfrCG5+DX
	pjyz6P6FZL2bpyESTssfrMyBxhPzW6r0MK1ydyE6BPNju8Ois4QMaOywyUD3cBBZmnkDGqVjSFu
	cW0fGSJ7uiR/54RIMYNBOqMj2DksJxDtIMCy5VNF+V/G5zhKlwqN4sVnLDEJ4H27MjLFTMZ01dO
	b2Hvvj8BQLWWX3pRhR8Y2gg9WNZlZ4h9gBbhqhATrXsWkHPCwYprtmfYELOhvfPQZDI3xJC1mHr
	Fe8uu1BPDXZShb+IRYxFMtgTYUmF/K8vvapMqxJNzqssl0VZsuAypwXadhLagcrnHi6wjQ1ORA1
	xxubo9TsJQzOcKQCvq7M2D3zlwZcc+rAai5xf/+xiaFqEsz6wB3SRuSoy1PZ1s4ePFQxJgbMcGx
	SS9eLGalOr1FqfKhXEQt/4XOAvreT5MzbxAdeKkhnlRgdmlJ7sSXqLh8fHRv5DJhEdEtHEld2dL
	dYZiQ=
X-Received: by 2002:a05:6830:25d1:b0:82f:5471:4dd7 with SMTP id 46e09a7af769-85ac11bfa1cmr895947a34.30.1793144393599;
        Tue, 27 Oct 2026 16:39:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1fd31a6fsm62836a34.18.2026.10.27.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:39:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:39:46 -0600
Subject: [PATCH v7 1/5] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261027-submit-serial-8250-dma-cancel-v1-v7-1-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
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

