Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617421;
	b=K91kXyg6DrXXgA8cQzklMXwjPJLJq8hnbgAbgk/MI+HN1NVd8CXA7e8LPZljRUThCcej
	 6Qc0rxWTXtXH8NoPUkxdPIOfYQfDTJQQbl39l6N5MnPoQmQV4tkWlgnqxNrn6kIdkzJff
	 VJLbTs7LDd55qqcj81FRNHqgVHomVcj0j9eA0EzosFQOxV/GPw5CCJ7F0LtnCM/mSyWnl
	 FwdfeyeNgKlcUCxxEujOcA3ouvGNQ4B2czBG5s3ZjOevOewhvqqe12Qw2AmpLbNDkf6vf
	 aGNndfmbGUlAYQi2Ph7DtTG7mTl4DPgz1/3pO1kKs4VcXc8sCbmWsK8tJiUWOvZz/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=puzArg+CDDbbfh3nj6zcBDGkElaBfuayiOEKEQ7tKC0=;
	b=vOFkeGZjW8CJzZjvpi/8ArHHF0NRJE6NvnJ2bYHRd5Uv+pf1IJMc1xnRt+09//KosA7x
	 JQppgHAw7ltpOxp4l1LYthXL9zHjQtikPp1t9kUFcUonaUDBQihx8qT9RTmt1+rUr0mGx
	 zT5W3d0U/Zsa/Ck/ymf+S6FgYErXWREsZva77ldgZzrWWBSX/cdu6Tb50maq6mqQ/hfjr
	 ha5vWe3NH/Epql+tXkoOhmqiQTiQKIHCmaNFxcc4RUCQUvFL+I7XPWuL5rXtBWGoHEEfX
	 F0v40uawiuCzfBRTLPX9ppe7nCpHgDWfrrNGHytdZJdRjPOc8f6uAIeAZUzfnL1FiEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eop4ELra;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A5E606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A5E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eop4ELra
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso757251eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617420; x=1793222220; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=puzArg+CDDbbfh3nj6zcBDGkElaBfuayiOEKEQ7tKC0=;
        b=eop4ELraVPID1cg7w/IMZD0DMGARzKwhewTNM1nO4tlcpjJSiNtmzwTfuCwz/jkYmf
         gx92O90hSs7g/8HhdV7NGMMR5wyXAumAgg6BlsFrCguSOK6NtKJd6AcVanez0pO+15T4
         RcCRRHgm0gMtrtM1F0X+8HxAnm1KNJan9fKjbBcmYEMPtapuhUFvxzK8J+d0CyoygVEg
         MQnlF9oDmNOm5B70fQU7fpRZX/ywp9jpEPH4L74fCHQZIVsDX5syuLXj1yQMUji0X5Nn
         JdPy5kti+9qQ/Xx5E9Pg10wKY4RAbZnZ8CllMrfnvRLLXtcN/edVFuSKBQjSMLR2nmYD
         c+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617420; x=1793222220;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=puzArg+CDDbbfh3nj6zcBDGkElaBfuayiOEKEQ7tKC0=;
        b=btLYL8S/P9Dq1gJO2q3p4MTDZwaGhzyKuZx4oJeFL/8QJCU1isw14xSeD3d42Kkudx
         A5Gyx4/dBf8ibNIeF9VKqdP1x0saa+ATOwDzFbynkJJI6FIkgI7cuEK5mO9SfZKD7IfF
         5OClPWOZG+7Jbf4DmSOD9oY1TNql44V+oO0tSI52DPmGvByQRp2QIVrZeuLeomIYXjcp
         2j0Ug3FYIPaaD/jwrImK1BofaQPpI9ByGaaurFPQf8k2I2zcD0dsQdLIAxnmtGaOFq/y
         51IY60SOyYS7Kj95zGRE7K9yNZ2tEALbMCfQRCN2tFXfJgaLiAkhsgVzrBAeHYs7KGJQ
         vLQg==
X-Gm-Message-State: AFq9FYLFh4XjuN1ph9QrBjCN4SSBPeGU7NcHLQdTw6pFGhKhxc+fEtcr
	KbuSMOOl5YFR/oVxeMDSs3WIWisMNiPpPrMFDhPsZDw/tEDz7iOJV3NA
X-Gm-Gg: AYBFou2Neo3txyMck9Hgwe8BJi2GJGyPex3ESG/lBxxDWC7TC1CTU8RC+XcpCmm+QEf
	ZN3CC0cDCaZQ2rOcAWq4aNHP2Zik0n+U2rrqI9f4HqVKA7HiW+nlKD2v7+p3ylSDqKnPIUT1mrR
	dB/J10J/Ji8bWBvQNHuAwtFWrIlWoVpX79NQH/8s4/ZFJlhG00TeS9Z/cGLM7FlZISD9TWsnpBW
	XXfFZqewCQB/1UDcdcddWbrdx2CnXWNGQYXByGn935ZP5C5jiCdZnxTcOUqKU+vce9zbYr/k3fE
	dguHZ5utLDXPmUB5RwqeFDCJomsJlZslqj/IKfvx+AxMNtfCs1SdBwSQCVo99OpZN7A1XRXMddd
	Nu158W3g9KmULtAJTcqsX5F5Y2CP+PnCLrASFNCUeJ9XKaFM/n5e6HyTZ5Fl4GuejyIlneuE6y/
	gVhOQccWU8a3sEjXKyhQFPlAwX3uVRGasLPesU3tgCST713eJap9TUBrEwLHfVrYNkEHMs4TErk
	c6TugmCgtwqjRp90Vmht0ZqZL2tKX080ZdqW+dBOfHxabGefjWblviW5w/BPjJr/BvzrJkYdyd/
	rewwjfUNwQYU49oMYLPFrqvDJFQHEaFHHKSif/pEfCt+IhavpRQ16PMWs1GYMjxmbJfn0dTDwdw
	Q7omiHeZoST6ZBRBB/uvwMxvaNV8g0VuKYRI3YrCNicP9fp9kfFnda/uqA7Gw+8nLFiODucK6Ap
	mKutABxswUB/Y/BaKomREUExV4
X-Received: by 2002:a4a:ee0b:0:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-709405e3b6dmr1907892eaf.40.1792617420203;
        Wed, 21 Oct 2026 14:17:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61d6645sm2928842fac.12.2026.10.21.14.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:16:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:16:58 -0600
Subject: [PATCH] serial: 8250: prevent DMA callbacks from restarting a
 closing port
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
Message-Id: <20261021-submit-serial-8250-dma-shutdown-v1-v1-1-3d3ce383c614@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNyw7CIBBFf6WZtRMLhcb4K6YLHlPBWGqA1pqm/
 y7oYhbn5t4zOySKnhJcmx0irT75ORRgpwaMU+FO6G1h4C3vWcsZpkVPPmOdqSdeuGzRTgqTW7K
 d3wFXhrLrtLC9GIXUUESvSKPffk9uw5+L5UEmV3NtaJUIdVTBuBrl/DmXw0BbhuP4Am3jg+elA
 AAA
X-Change-ID: 20261021-submit-serial-8250-dma-shutdown-v1-533b4d64f45b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disabling UART interrupts does not prevent a DMA completion callback from
running. A TX callback can submit more data or enable THRI after shutdown
has cleared IER. An RX callback can also submit a new receive if data is
still present. A callback already running when terminate_sync() starts
can therefore restart the channel whose buffers are about to be freed.

Mark DMA as shutting down under the port lock when disabling interrupts.
Check that state under the same lock in the completion callbacks and
submission paths, so callbacks either finish before the shutdown boundary
or leave the channel stopped. The DMA provider's synchronization still
has to drain callbacks before release_dma() frees their resources.

Apply the same boundary to OMAP, which has its own shutdown and DMA
callbacks but shares the channel-request and release helpers. Check it
in MediaTek's receive callback after taking the port lock as well: its
earlier private shutdown check cannot serialize a callback that has
already passed that check. Reset the state after requesting channels
on the next open. Leave the Broadcom integrated DMA path, which manages
its own shutdown state, unchanged.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_dma.c  | 17 ++++++++++++++---
 drivers/tty/serial/8250/8250_mtk.c  |  3 +++
 drivers/tty/serial/8250/8250_omap.c | 15 ++++++++++++---
 drivers/tty/serial/8250/8250_port.c |  2 ++
 5 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..457732e941af 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -51,6 +51,8 @@ struct uart_8250_dma {
 	unsigned char		tx_running;
 	unsigned char		tx_err;
 	unsigned char		rx_running;
+	/* Protected by the UART port lock. */
+	bool			shutting_down;
 };
 
 struct old_serial_port {
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1da605cc8601..5f52ed5c14c3 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -19,11 +19,13 @@ static void __dma_tx_complete(void *param)
 	unsigned long	flags;
 	int		ret;
 
+	uart_port_lock_irqsave(&p->port, &flags);
+	if (dma->shutting_down)
+		goto out;
+
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
-	uart_port_lock_irqsave(&p->port, &flags);
-
 	dma->tx_running = 0;
 
 	uart_xmit_advance(&p->port, dma->tx_size);
@@ -35,6 +37,7 @@ static void __dma_tx_complete(void *param)
 	if (ret || !dma->tx_running)
 		serial8250_set_THRI(p);
 
+out:
 	uart_port_unlock_irqrestore(&p->port, flags);
 }
 
@@ -71,6 +74,8 @@ static void dma_rx_complete(void *param)
 	unsigned long flags;
 
 	uart_port_lock_irqsave(&p->port, &flags);
+	if (dma->shutting_down)
+		goto out;
 	if (dma->rx_running)
 		__dma_rx_complete(p);
 
@@ -80,6 +85,7 @@ static void dma_rx_complete(void *param)
 	 */
 	if (!dma->rx_running && (serial_lsr_in(p) & UART_LSR_DR))
 		p->dma->rx_dma(p);
+out:
 	uart_port_unlock_irqrestore(&p->port, flags);
 }
 
@@ -94,6 +100,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	int i;
 	int ret;
 
+	if (dma->shutting_down)
+		return 0;
+
 	if (dma->tx_running) {
 		if (up->x_char) {
 			dmaengine_pause(dma->txchan);
@@ -185,7 +194,7 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 	struct uart_8250_dma		*dma = p->dma;
 	struct dma_async_tx_descriptor	*desc;
 
-	if (dma->rx_running)
+	if (dma->shutting_down || dma->rx_running)
 		return 0;
 
 	serial8250_do_prepare_rx_dma(p);
@@ -308,6 +317,8 @@ int serial8250_request_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
+	scoped_guard(uart_port_lock_irqsave, &p->port)
+		dma->shutting_down = false;
 	dev_dbg_ratelimited(p->port.dev, "got both dma channels\n");
 
 	return 0;
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index d1fb917b762a..8a0ca8df46c5 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -106,6 +106,8 @@ static void mtk8250_dma_rx_complete(void *param)
 		return;
 
 	uart_port_lock_irqsave(&up->port, &flags);
+	if (dma->shutting_down)
+		goto out;
 
 	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
 	total = dma->rx_size - state.residue;
@@ -131,6 +133,7 @@ static void mtk8250_dma_rx_complete(void *param)
 
 	mtk8250_rx_dma(up);
 
+out:
 	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 29a203ed93fd..e3f3322da379 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -780,6 +780,8 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
+		if (up->dma)
+			up->dma->shutting_down = true;
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
@@ -963,6 +965,8 @@ static void __dma_rx_complete(void *param)
 
 	/* Synchronize UART_IER access against the console. */
 	guard(uart_port_lock_irqsave)(&p->port);
+	if (dma->shutting_down)
+		return;
 
 	/*
 	 * If the tx status is not DMA_COMPLETE, then this is a delayed
@@ -1019,6 +1023,9 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 	/* Port locked to synchronize UART_IER access against the console. */
 	lockdep_assert_held_once(&p->port.lock);
 
+	if (dma->shutting_down)
+		return 0;
+
 	if (priv->rx_dma_broken)
 		return -EINVAL;
 
@@ -1080,11 +1087,13 @@ static void omap_8250_dma_tx_complete(void *param)
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
+	guard(uart_port_lock_irqsave)(&p->port);
+	if (dma->shutting_down)
+		return;
+
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
-	guard(uart_port_lock_irqsave)(&p->port);
-
 	dma->tx_running = 0;
 
 	uart_xmit_advance(&p->port, dma->tx_size);
@@ -1123,7 +1132,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 	int skip_byte = -1;
 	int ret;
 
-	if (dma->tx_running)
+	if (dma->shutting_down || dma->tx_running)
 		return 0;
 	if (uart_tx_stopped(&p->port) || kfifo_is_empty(&tport->xmit_fifo)) {
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index db066a42f61d..d476ebc37647 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2446,6 +2446,8 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 * Synchronize UART_IER access against the console.
 	 */
 	scoped_guard(uart_port_lock_irqsave, port) {
+		if (up->dma)
+			up->dma->shutting_down = true;
 		up->ier = 0;
 		serial_port_out(port, UART_IER, 0);
 	}

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261021-submit-serial-8250-dma-shutdown-v1-533b4d64f45b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

