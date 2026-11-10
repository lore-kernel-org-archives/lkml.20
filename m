Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283247;
	b=Vh1qtVwHRxxlipQeJnQocYLUkIpQO5D3/alXLZ92tOduUiass893I17u6zy69z1hFYGp
	 m052UrT+zgGF8y+f7n774cPmkt99rfHFzAbNkqFMt6o195a0TsE4+d0NzfCRaNnekj32T
	 fdrrtVm43m9fvE0SoqRiPJpLtRNLSorlMJvvxUiVNojWsvzoGX3PLn6PcTpvR8VviNh34
	 Wdgia//IAEqUYqKOEbWkErhfxMwlXW3Ehj4u9whdLBk8MpeD7dq0ts+1IgsoHHO8my5fJ
	 hLjT6stss3bU31IdXuqm2kcaz0C94ojGK1YmBoPIr0qTut9tQGh+SutAR6muT2tD46Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
	b=n6Mm4JdvaXTle59Alqq/VIZzn+QTeyX54cCAmsBPC4+9lu2sZfyp+hVk4QWLYt/vqEC0
	 X0TlcIdjksvYjcPIRGcz5DaykvTVNmH03CPNfBJelOKyyhwwWxUACCKvuYbtWsLNtYPYw
	 ZFGKCC4JHN4+GF4erJ1p9lL8hVpJ6MAh2aqh0eRMhb6/cdDDg135XeHv5AFj9cQak14nV
	 gZwepkgVcFX/unnaZtHFjlqyP+7W/yI7ruRvlpZsSKyy9I51dO+g7YFeBA9rjYQhic4Ao
	 Hvqpn2sej4vnU7sY5mtveT4HIlFh7mPuygk2g/tjvx5abSXK9WOPthmGJ4H9MyNw01w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwzLTbqV;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6460A3824
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F6460A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwzLTbqV
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8479f46ecd8so803360a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283246; x=1794888046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=lwzLTbqV3Ek4HbFvxkQUBnQH+ABXrtHYDABYJ854e2zPvrNXi80ryjShhzvLF+lJsc
         Qu6CUTLeEKs3E/Td0KVKtpPV+bRRbz3QT8qSk2tclf1uWA68h3Up4SHRUkR5zgPlh0x3
         XxmoBHwp7Bv1Js8XStFlG1j/57cUY4EP1+VIpa94xPTSOfY2P8R8r5WW3V1maAMNzypS
         rkMoBL6nsTMSf9Yu/tdlCj3tdUp/uV2lLv1ABhLn3uCBAfkadh9rjV/Dswk+SQT5S74R
         cBSCULD+8Wsg2zygA6flKQT3n3RYgl8rmxX1UriU52RQsrrJLZ0sIoC+75b/WB+PtaWd
         pWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283246; x=1794888046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=oWD+Zx4xOs1fcpIfhIsnqQHnxzhalBssENW2gBi23iEslioQER4EBtcp7AitxUdZtG
         SZO2OvfndBtHKcgRcROSVxKmpCSdTX43LrbcLkZqNNvjwT2PsihOyu+QD1DxNBs9GwjO
         zsQJ+pzDr4k7xv547DeHNJqMR5ghw8oezAsE/KI3LXCvb+uUzjh/O2EXnC+6zXrOTpwi
         IdqzX5ZRKYMhvK5x4aQCDrgqmHNt9DKBPs99zLBEAqjjgPi98YKJWpH9cI7EdqcHR7gG
         CBkoEPwew0a0WhJKhs0DK0ayhnmyuxbFqZTYCxsZWlyHEAZ/zNMB7Ae+QgLRRIJh19K1
         F+Tw==
X-Gm-Message-State: APuU4Z/+iWDFCzQUPmBro5LSfUxOR0nhbn0NnldpoLeASwikDiBHpcfh
	doEQmc0dkfgudR8BH4itAGIjjsjPIbxHdDWY5RPMwTZyRjpRIfWoQdqC
X-Gm-Gg: AYBFou3RSeY/I5wTYvZzOKER0DZ0GaSpikD8YUwkU81zHReKdh+jeT2w8ufyWib/Dpe
	7yydsg2RH4VZvy8UzQavYBwM44tURWXHK8p1ClrWWVZPnY1dx3WV5KQQ4C3DNQY1Uae9NHtePJT
	NmDm9m7pZycfMHembIrFBJyZgW3dNhl9NWSiu+i1Yp6FAmB3Gt4vYVPu/n9qOawDCWsJukoJOuR
	IsnnUM9G15UJ3Gz0aIWpX/RfKZSAVNLfH7HVNCU9lMeeTMXAmEcz5GF+ZhGEELEyicuhHy0Pr7l
	HIQ5uoefMcRX65nhuUZq+UfXL/B3oeSG3AD+Pgo209kMAbN9UEQrRbQy9I8Ru+MZ0H2rJHw1/QY
	GhBvnE66Rn9Mft4t7Y2JxSkYoicy5XlpzDvLMaHlNPbZAPjG0zUXoZYjOCc3AUoWfHnKUH4JZR5
	LSs3fr7O7krF36xKgiRgQEzT5ecS4jxOODDMGPQcXGeW8/6Thg4/XyshpUsB/AjL/NEybezwNQF
	csH7WpkmcYSRU52IGodqZAFgWUVWncuQgnMgXgPoPpBRd94hgDwVgCkUSXAH6rb6BJzRvg1da3G
	dKuo4vMxHYzpku1xOdXtGQhGNr0DLgwoQYg4YX+8cbDRc5wN9aPorm+7C3yjC7mNKzvOMDO7SX6
	cWnF2OZ75EcHqENHKQudeF0LV/Sqy4p84lZ5JQKUWIP+d41DHGfv83Stp7U7ZX8g3o5tIDBmOA6
	ouujutvB4ZrpRGlgIBkFNoSt0JNnnGSolOo8BQhT/RorMVyg2dvj6CNjRXDiUe52PUrUDywcLB
X-Received: by 2002:a05:6830:4aca:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-860dc8464a2mr1224823a34.25.1794283245936;
        Mon, 09 Nov 2026 20:00:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:23 -0700
Subject: [PATCH v11 8/8] serial: 8250: retain DMA resources when
 termination fails
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-8-6364edca63d6@gmail.com>
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

serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
the channels. If the provider fails to stop a channel, the DMAengine
wrapper returns the error without synchronizing its callbacks. Hardware
or a detached callback can then access the released storage and state.

Checking the error and returning early would not preserve their lifetime:
serial core frees the TX FIFO after the driver's shutdown callback returns,
and port removal can then release the callback context as well.

Require successful synchronous termination of both channels before
releasing any DMA resources. Retry failed channels after a sleep outside
the port lock, leaving channels that have already stopped and drained
alone. Keep the shutdown gate and storage reservation in place throughout
the retries.

Start retries with a 1 ms sleep and double it up to one second. This
makes short-lived failures responsive while bounding sustained retry
activity; neither delay is a hardware timeout. Report the initial failure
and ongoing failures with the elapsed time and current RX/TX error codes.
Track the five-second progress-report interval separately for each
teardown, so failures on different ports are reported independently.
Report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index b1f2998e7735..6efeb16fd994 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -565,6 +565,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start, last_report;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	last_report = start;
+	dev_err(p->port.dev,
+		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+		rx_ret, tx_ret);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		fsleep(delay_us);
+		/* Retry promptly at first, then limit sustained retry activity. */
+		delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (ktime_ms_delta(now, last_report) < 5 * MSEC_PER_SEC)
+				continue;
+			dev_err(p->port.dev,
+				"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+				ktime_ms_delta(now, start), rx_ret, tx_ret);
+			last_report = now;
+		}
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -574,9 +621,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -588,7 +635,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

