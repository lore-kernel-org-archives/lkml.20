Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435399;
	b=E4VsqB3WLho5mdpkGL9s1K/KMrRBi2qXKJOkfq7o/mFVZKlKxArTBy0l8OCbXEcZif2C
	 M9WDtcfmqfZtlrxHKMVwaAEWQSqiiB+mcnJhULPNriAi0S0vAj68kDSg2Rd+t4eWfvFCu
	 uNXvOLXj7eUEbfYpjdEnB3vSNWqv4ANqOlybGkn7HFERtAOk45Szj/+IyMUGFp1lQ5+G8
	 OvW3YP3npzGtzWDL+9X9K2rc8EGz99Fo0a0mnw75Xg6rxZsubESNf0LU2O/74/ZEwvYN9
	 Hr7zEm1SGh9w/pHHaf8i9lSXcUIn7xo+nov3HI/0daAQp4ke7IVTmrJIMd7EosqOAnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=3aKLgJKo8SE5VFbCadLQwAFxdsVBoxhgAZQbfjkdmLGaPSgnXzDXbF83pNEjXonoYXXM
	 f/t9dOUe7KlAGUGWkl0PmMQz4zkHPUGgDMCYuzWCIs/H30q+ZyDdzxtlx2/+UeNmTVvNl
	 HUXpNeT1WhQxz5V/Cnq2OOJW2Pl/ij4/+Xnr3z8KQIXl5KjZHEFbm+rlSaa11rfNX7k+G
	 OAiSizbKaF3Q1iNRtjq7Butq6cVuFa6j9maMVEBdkZhiIbuV/9d/2q6t9i4T5UogG+WAU
	 QRlw/5VpQkhhx6l+cMmUbRQyOq/0OUbYmR6vllX+gyPs62PpINSw2FWTR7H9URBvV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Kzn/9CAi";
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13E606A895
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B13E606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kzn/9CAi
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-567cb8f983bso1782977b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435398; x=1795040198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=Kzn/9CAisPVWcpWdEKMAUCom/auubQjRXYiZhTs5TM7aCO2F52Co8TsDyLQnkT49An
         gCg3o6aXAR04mcNWGtb8H+cc49tj27S6arOswstkbUFZsPvS3aTwVXFtBzCljRWwlzec
         WTl195YjVB018BH9UWdDg7rMZ1bDzfBC1Siak9H5TadTXAPibqrkUBwfqIRmoua8s2/I
         +ejBSyYCGv3xrRvJ9MrHY0DCuv/eY3WiaO0t+devkD6WE0UPsrFsUCpTXs1C4kPb6kTJ
         Lacyi3ltJLa+Vfcz0l1z91cXO2bfVhs2ySJZBKmr9qbSqPhew1sfspqqs2qnlCOi+nNI
         TRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435398; x=1795040198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=BLoql9KMQISW8kdhmqqqfxI9WJ9e0dNEWlpvNduxz8z/60PiEB6fODO5o5aoWIWqEE
         SYo9lZmCtEiTQzPvqnYnViEeGIbramvPdC3lIOJ75rH1Ii7QmxpeaUa9bmxYp+UjR+iM
         x2gSkW28aadpvMVpvEY6hf0v/T/qQqrrmK/ZrEZ2sUlnUr7s3pCCRQ3AUwj2FZ7Etyyg
         bxkMJE0OW9KqfooQ0dX0HYfBMq3WhcPjBtP1lS0o+4CncL4OAH8PwM/mG2ZHoFiCHd4c
         eaGpbCgj/+hIC9aq+v2T0rLXnbDZMvWbszPM8z1RIeHyAob+yIBuxMEk1VoBXTlS0dgc
         xy+g==
X-Gm-Message-State: APuU4Z/DJfdtglljpR7CVf8W6bBZvGXpfNOWdUz+I1dgr4jT10UCK/T2
	3RyaVWLEkB7KPtoSKtItEwcXbDD1Cf8MPXN7c1oiJMwuV2WV5aRJ7W85
X-Gm-Gg: AYBFou0nMf8RWuQwygLd/Q8Ce8p5sNVaRlSBqDHyF3gTpnIoXeRhUvBF623D4vRtO6Y
	NHwoT62sHQqxHokv/DKL208rPHcE1zrZSkLdaBaKhLNF6BB2V273NgjrF6RHSEZ/lE4Xp+hlTDl
	B97cpuIpx7Y//LjF5Hv32oQeh9lzxykpVnDpOtg2ex8ebetLV59GXDVIiE/c33kvQKVZUXURqZm
	ADo51G1Tl6b3ZgbJ3AMyiy9PDboVZaheahAC6kGrvjbWIMhLnQfu4qg4zf9J2RWTKn6g4BY6iJC
	DY9ihAK7H3xBCay9aa3QtJX431ICQ3+LMdEhbtI0v8L8rfNWdLyH+8ZDigZ8yVzEqbi9I6oCNlK
	vrFP5Ge3AbLU3DWPS9Mc+/N4m1cPBRqGOPghja5tYZAKj3R/pY/Bqvxe4FX6XOynoqMbgozyEzt
	yfF0YYhkkpmEywfTypXnB7GrSDe5AKVxHuLWL6s4HZqOezYFVc49Nu9M+cciEY953hM9T6ql/Di
	2dm8ZM8AVg1OcFMoSZ+wV2/flgsQs+cOUVlG+dJ2ft6tRRDq2yB3Qi3+yBhEbejjE5mOlHYAvq0
	kezdKFlbqpkU0LFkVLEgx/4KwI+6BJ4WKtM4XMorUF7HwTfTd9HV703xwixqK3olunGHFJEJcRd
	l4WBK+JxvZRkQPeliiCv2/ljUTOBbVMIjy8za9QXdQIS2+RBkOlYJbx2lwDeMemRqh+PWsoT5ku
	rKpalifhWEqTbaiExOg+7GkUIkQA6543LqmHaHKKmzE9ZsOhsvdqo=
X-Received: by 2002:a05:6808:1a01:b0:4d6:92d4:c806 with SMTP id 5614622812f47-56b987289b0mr3147119b6e.62.1794435397786;
        Wed, 11 Nov 2026 14:16:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:28 -0700
Subject: [PATCH v12 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-3-9e3456bc2555@gmail.com>
References: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
In-Reply-To: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
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

