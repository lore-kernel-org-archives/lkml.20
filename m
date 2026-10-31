Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450281;
	b=dHEK/rcmcP6OfLhxZwgD1FN3cr9lYqoN7W3mp75KVBMMiuXP8THO5rNE3ahiRQHjZybF
	 HCHwYjSp4YW/0vWa/Tr4nsGK4Gj5KfAcYjFs2bVx5BY7IKB4DqYYRFt2eXKlEyPReg/gD
	 IiGgyPpRIMpX73FbBJKOHBYK7clAvEyY/7w7HIJO9NBDYvXUxfzNdiW7sUNxFJIDpOC8G
	 Q/aU3/b0Aom96sbV6t3XYYlbf4xG4/Cj4/JIceqsRn6Lds4Rn0bIj7ZD0RysBkP2RVg3V
	 rbgQB/48rXYGIxRWU9OmVS1PFeTrF2flnnTt71+kiwkOypFw+D+Ka0Md8j42coehe8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
	b=Rmc6xSfaAGpeHUcD2WBOB5qTzYfaK3HEJQyqc24jV1s4WQaI2gq1NhaAavPkXYpWEthF
	 fVeijPiXGQBV6fIZ+gru83asSzK599aEok76La3TWADMASj/z6rGmgcZf+Nv2MbADJO5p
	 tr+E2jls7EYfZcRWiErOBScKN7xbFqCNeM9+0kl03zgkdS9EIX3KRMm57UBLvYw2sgIFH
	 wc2hCqgVB5/yy9Wp7VGoNlQg6PTtH6gk5AIyVsr+8sXKcfSMkxJ6W2iDAoANbTyi+jHug
	 xi4sTbLX1nfmmTyLhY5U+OW/al06vwBfrZ+0NEeptkwrc6Cf/Wv1/J/62QEq3DYT1hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjW1FWQe;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75780606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75780606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjW1FWQe
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1846bc43c28so1845245c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450280; x=1794055080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
        b=IjW1FWQeYtHMv+2CViyfUBhgYOzKDpB94cQEoKFA11u7hz9zlnd/8gU9X+43aC0cow
         sfNjO8fuwRJNBlND6zEvqMKisVvtyFqJrVsEA3EtWct7Pp6xLt68hg2HotBdjH/hw4oJ
         KfNS/1VjEvtdZ6WyiXJVWZK6WZqCgYXMOOCm51uVr41Pcb3R8v6UeR2BnFL1ODfHQ/QZ
         SCdUaVYRdOAaC2dZ/ujvEIXDgjvJsjB40G2JhCCla1JkXGzY8fsc+bRaBn4gbaaQXZNf
         OzPCIa+4dFr9HgYoXRolCDdM8vSsC9dpiGNuYFICi+5WOrhjIAgtLqt7ssNhGDupcTgb
         Ob5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450280; x=1794055080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
        b=e3j9S8rXei/KAwZUtewphBZU20usDoEn+DXx3Abz645793uKXoiamFodPDZ66JhBFV
         ENYtGWhe0G3ywTQTCtELOBW3RMw4iUDdtTdhAK3M5VlgEoGxszo334tntSsShfPbcX0k
         h5IbttLC0viiOwkafrx46SkokCXf3FTFhHnXrA3mgTqFOpcMWa+aCoEZE2dEHLcPPUq5
         Vv0xUyMrfjPwpbwH84hMZOy7Qqnt7uZwDw6k/aPpM5gyU9HH3C+Ej82Y5BuUtqqoZ4U3
         Qw8J/+7UmeRjW7g7NlzTcu502Qk/hsRDvZxF0ffy2+GLCn8/Xw+gKrNBtLvCTNH/s3d3
         Yxcg==
X-Forwarded-Encrypted: i=1; AKwUvBzq5+VNGXXxD/4mF1TPyqTIHJSgKMzhqts4pCH+MlcFeUioPvVvktTi9lmpfEOF/Qsgu8qEotA6QeJF6yQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEppStnYN/mObcVXBvCHWyczM7rt6Zg9/FSkGXr+Id+1LO6Gyz
	ok1mp6EDFIWeHYbrJvCc1iEFGSkbaM0PUKen/4P+sk9RIIP59GQ14ewR
X-Gm-Gg: AYBFou3LlxzB6JErrJinGY+iZ3Sx4MnGUWg3TU34qN+RHlaADEmr2LnPwvBsNkZYdyS
	z9blLzYtkHig4Pj+iEZRFcUv1BOh5bLJMXJhSODHco8ouDvxSoOkSzt4BdsVqJ1uDaioZJ9PSAL
	KG0WH97RFeStTWy5yM18SDptW+ggBHqg5GG/VLALoV07nVVhPfkFIM3rF12mwVEd1SRB+o3LyL2
	f1MNqrcunQJDSSkoOwH4F2wAMpjSyK/OVwFXmbpbXl1bhRxqYKkgDD2a97MAkpmPwcWnRH6GFPR
	iLE5Cr1pJgemW2qPB3ph+Zp7L90ohuNSbunRN7LS9kUWV+nyVEKb+eR10QbOIJxQe10Hgg2vZdt
	BOwy2YNA7wza612QhmNGapF55szpUbe5n45gxebPw8eJPPk2Yk9nRRbaZDZ2b7OHDvQc0XJ8A7v
	gdy/KcZ2/vtYyp4ICvHDLV3Kp8pF6lcjf497YI2j4h8fFWo2LmmbgWJP+5WUIBSachU+SkTtA6M
	abGLQA6KwV6ZQipDMh1XqJdG6kw0owMxxjf2vdFqoU468I7nrF8PWpdbUUXDDfutQKdMyDiS6+m
	nr1TG5O1sM7i8GqG7fNaiF1xVGscACxCdxvv3XgHFcHWNNTIc8d7FfdZYIOYrjFWLAtiryDtkgc
	B9TWo5IdUo2BaOI7Kyj5iFaYKbnQmPKUrBCt/DNAM1FXk1QiYuLwwAnnTjBfzm0PH2PaCrqIqBm
	Tj0+t4cYLKjS5eIQ==
X-Received: by 2002:a05:7022:5f15:b0:1af:d691:1b4f with SMTP id a92af1059eb24-1afd6911cf7mr850231c88.42.1793450280250;
        Sat, 31 Oct 2026 05:38:00 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:37:59 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] serial: amba-pl011: keep the flushed TX buffer mapped until DMA stops
Date: Sat, 31 Oct 2026 12:37:48 +0000
Message-Id: <20261031123749.3783352-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123749.3783352-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pl011_dma_flush_buffer() is called with the port lock held and currently
unmaps the TX buffer immediately after requesting termination with
dmaengine_terminate_async(). Since asynchronous termination does not
guarantee that the transfer or its completion callback has finished, the
DMA controller may continue reading from the buffer after its mapping
has been released. Commit f6a196477184 ("serial: pl011: Fix DMA
->flush_buffer()") introduced asynchronous termination under the port
lock, but did not add the required synchronization before unmapping.

On systems using an IOMMU or SWIOTLB, outstanding DMA reads may access
an IOVA or bounce buffer that has already been reused, potentially
transmitting data from another mapping. On systems without either, the
outstanding transfer may instead race with the next refill of dmatx.buf.
This can be triggered by flushing the TTY while TX DMA is active.

Since flush_buffer() cannot sleep, defer the unmap to a work item that
calls dmaengine_synchronize() before releasing the mapping. Keep
dmatx.queued set to prevent buffer reuse, disable TX DMA requests, and
let the work item restart transmission if data remains pending. The
completion callback leaves flushed transfers for deferred cleanup, while
shutdown waits for the work to finish before tearing down TX DMA.

Fixes: f6a196477184 ("serial: pl011: Fix DMA ->flush_buffer()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 54 +++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index e6f652905ca6..863a050cf654 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -41,6 +41,7 @@
 #include <linux/sizes.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/workqueue.h>
 
 #define UART_NR			14
 
@@ -302,6 +303,8 @@ struct pl011_dmatx_data {
 	size_t			len;
 	char			*buf;
 	bool			queued;
+	bool			flushing;
+	struct work_struct	flush_work;
 };
 
 enum pl011_rs485_tx_state {
@@ -609,6 +612,12 @@ static void pl011_dma_tx_callback(void *data)
 	u16 dmacr;
 
 	uart_port_lock_irqsave(&uap->port, &flags);
+	if (uap->dmatx.flushing) {
+		/* pl011_dma_tx_flush_work() retires the flushed buffer */
+		uart_port_unlock_irqrestore(&uap->port, flags);
+		return;
+	}
+
 	if (uap->dmatx.queued)
 		dma_unmap_single(dmaengine_get_dma_device(dmatx->chan), dmatx->dma,
 				 dmatx->len, DMA_TO_DEVICE);
@@ -867,13 +876,47 @@ __acquires(&uap->port.lock)
 
 	dmaengine_terminate_async(uap->dmatx.chan);
 
-	if (uap->dmatx.queued) {
-		dma_unmap_single(dmaengine_get_dma_device(uap->dmatx.chan), uap->dmatx.dma,
-				 uap->dmatx.len, DMA_TO_DEVICE);
+	/*
+	 * The terminated transfer may still be reading dmatx.buf: keep it
+	 * mapped, and queued set so that nothing refills it, until
+	 * pl011_dma_tx_flush_work() has synchronized the channel.
+	 */
+	if (uap->dmatx.queued && !uap->dmatx.flushing) {
+		uap->dmatx.flushing = true;
+		uap->dmacr &= ~UART011_TXDMAE;
+		pl011_write(uap->dmacr, uap, REG_DMACR);
+		schedule_work(&uap->dmatx.flush_work);
+	}
+}
+
+/*
+ * flush_buffer runs under the port lock and can only request termination.
+ * Unmap the flushed TX buffer here, once the terminated transfer and its
+ * completion callback are known to have finished, then restart TX.
+ */
+static void pl011_dma_tx_flush_work(struct work_struct *work)
+{
+	struct uart_amba_port *uap =
+	    container_of(work, struct uart_amba_port, dmatx.flush_work);
+	struct tty_port *tport = &uap->port.state->port;
+	unsigned long flags;
+
+	dmaengine_synchronize(uap->dmatx.chan);
+
+	uart_port_lock_irqsave(&uap->port, &flags);
+	if (uap->dmatx.flushing) {
+		dma_unmap_single(dmaengine_get_dma_device(uap->dmatx.chan),
+				 uap->dmatx.dma, uap->dmatx.len, DMA_TO_DEVICE);
+		uap->dmatx.flushing = false;
 		uap->dmatx.queued = false;
 		uap->dmacr &= ~UART011_TXDMAE;
 		pl011_write(uap->dmacr, uap, REG_DMACR);
+		if (!uart_tx_stopped(&uap->port) &&
+		    !kfifo_is_empty(&tport->xmit_fifo) &&
+		    pl011_dma_tx_refill(uap) <= 0)
+			pl011_start_tx_pio(uap);
 	}
+	uart_port_unlock_irqrestore(&uap->port, flags);
 }
 
 static void pl011_dma_rx_callback(void *data);
@@ -1177,6 +1220,8 @@ static void pl011_dma_startup(struct uart_amba_port *uap)
 
 	/* The DMA buffer is now the FIFO the TTY subsystem can use */
 	uap->port.fifosize = PL011_DMA_BUFFER_SIZE;
+	uap->dmatx.flushing = false;
+	INIT_WORK(&uap->dmatx.flush_work, pl011_dma_tx_flush_work);
 	uap->using_tx_dma = true;
 
 	if (!uap->dmarx.chan)
@@ -1236,6 +1281,9 @@ static void pl011_dma_shutdown(struct uart_amba_port *uap)
 	if (!(uap->using_tx_dma || uap->using_rx_dma))
 		return;
 
+	if (uap->using_tx_dma)
+		flush_work(&uap->dmatx.flush_work);
+
 	/* Disable RX and TX DMA */
 	while (pl011_read(uap, REG_FR) & uap->vendor->fr_busy)
 		cpu_relax();
-- 
2.34.1

