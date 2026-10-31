Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450391;
	b=5qVA+JF8SCrd1xxdUwkyULcVKqfJ81dyNtMZgZA1c0ZZmWN1rqR/XU5hv/WLtw/21XaG
	 321rpNm+Ia63ixLrUsIt9xWMMWsfzwQiRhC2pG++cE50YzWoWyR5qc9Y/DfvtX61BFJtn
	 /qN381I6NKHTZedHgw+R9zVnRmGPMMEHp0kzURpeUCe16mEP8BXPMsvNmzcK/qhhPWmEC
	 mlCI9oNlxAGJ8iW7TO99DmcdL+amHqCDuEzFiF4mG9tkueuTqoHuyvJKIESaddNNdU5xB
	 Op720r9Cq7+DNBeVVgfFdNYVvP4mQzGBr8H34usmP+bwTVQlBbI+hTKTJPEi9GDwlSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
	b=jRtDF0PdeoRMxrou8SMBvd/quKcV1Hkn0QlM+SXmWoronlhhksbNacjhNajv2dot9eJH
	 akNWztnO8EBc/tRI0QQAcmehjJk45iwGztgoObWAW7bUT4AFuJFwmSWpveF4x4UjQeogH
	 hF/B06n6d9zO6m21k4LxuPEZhhp+zaRbHeXxFoL36MIFtwUXLuVUNlbvHUaiaaXik2r65
	 0z0z+I1U7HPLhxWrGqWU/HUuqj845xCVktsNGvzhpt4+JLFZ9urm9hcN/CdBR+zbm0A7S
	 PuDbUCMYTazJy7f0SSW3Igs+jSJIZsJSXQai2m3mmxObJ1SbX2BxW95+FUc0D19Okxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTVaLVj4;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A80606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A80606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTVaLVj4
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso1363320c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450390; x=1794055190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=nTVaLVj44Ub7z74cDC1wz876qdD4BKmWpGUd3aathGvyrzUmTNX/U3B41UPTFFFqjN
         x70xLLXEJR0xkZSG2Hv65YNG7+qMPGDvnGGH1Y6MJSXnCL/rRVHa8/tVJW9LJIoYlEA9
         6dXLZ30iqlNeaVxJlOXtpdzaym+La7NnDByhobhHux8WMrYR54d3/v/kt7kyefLtQDqx
         7q8SH8uUvxxsRgNDzao73J8zRBih/KHAA83YUuTGm+5mpJ+STug39hfBE/4SVHn+J1Sg
         qqxqi+l2Ygzq1WqLILBFDDg1fsnLdB/XIFsKTiXNxR9GrGrVJ5brPoJwKKqkfi/pVEPN
         p8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450390; x=1794055190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=sLvbx0HggQ06rXHQ+EQnOqYO6j1P7tMeTPdVlpGa6/cJlnPh6NycP8+IrNrnGZcV5R
         d8pgM7ipw4lLTwPPk5BhVzhZntHgMjL6RmvnyE/0Qp9WlFQ8fTF9vdHee3Wg1H7gw/dC
         EaKzAbNoabqb0qIdEgabBqN0sm2YoMnaU/stLahiSxLrFvNvfEbpFAsp9rhgZT5GDbaT
         +nDi37ZjN1w3U1exqgCd+d07pePTfE6QoLlsma3L8GQGi5sN3V501bmlaKCGzJLn8tZF
         +kuoFZCQaio0YxU5U8ngZHpbycmJT+hGPdG8PWDeQJzZI+ZwNxkw0s6GdaEbPMhSkxIM
         Fp2Q==
X-Forwarded-Encrypted: i=1; AKwUvBytV7KaPWsz3FZ8mtb3jtu9vWvv8uaK9owLzBDRbvJ6eTUZrIkEprWMJzuy3O1h2k2eYgpyEYFJR6XFCl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0GMjQTiIKSTRz5yzg/Yk42DuQWgZwVLSrFAUiEJEBv1V8pG5
	3Mj3JHNlBvJM5yYMvFaMCNccSNfHdUb1rxfw8PxgPdZY+Qm1N6VJPpr+
X-Gm-Gg: AYBFou33HZc2iifyrVw2qE3q9lqORXRICebqG2euqcjwi4luZbapCRPZ2+bMlobvJ01
	txvdNYvaR1exB+knon7J6xw1JHoWE0/gHBDTesxvcUXzw7g4e0Sb2M9XU5RjGNkpOwuayms/1PG
	2r0zP/xpwsCIeqSf8bklNdZuEPKVzKN2IiH2QyvwetOd6FpFwIwnT+3C/KWrfnzZwMq+Lu5zWj0
	CezWrF7+SOv3LWiodApEaeH2Kerwwl5CpDcplvO/fnrqrNhB8Wx+sjLxcdruEMT9Pt1dWRUVzN/
	HBGUB/tALeMpGTGizxjuHa4WuBvKiEsfyfFRpXftm549JmoQj50KLGuN1wz2oOCJDjmtCFRbUZQ
	EYkFD7m9WluGSIvh5DZdxNV2BYrnAJpuYQPRN9QSOpwfVkDNvvduSBwYqlPfzBgkR8xZRO1J25Q
	3w44jP2umsmC+J/MwHWrJxFEKQ6dIDW22Q8vzqx2ww8pCM3LxADJOoxoIV1AEluQfFzJazJ847e
	EsVdzXFsE28jvAC3uCoZn2Laa//+9hfIhUL6frHjSxLKBQZ7/omEI2VBZ8cIQ3sJSy8ikURYGhr
	BC8fiP2GF/jyNKu/q/LynrW5pFYNY5EaxqJ5fL/Udyc0b7TNs3VXkOmjAMxSD5kz539iAMHGFvf
	LIzE9yClO+l/Ky41bjiJ/MeApLZX9eqDdsAysC5bVblClbvBisOqE0ECY2DIdqeRiVL3ZPxonuC
	9YlozulIlZbXtRB1I=
X-Received: by 2002:a05:7022:5f0b:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1ac5cb18717mr6418421c88.40.1793450389793;
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] serial: pch_uart: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:11 +0000
Message-Id: <20261031123911.3784690-6-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
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

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() hook. Since pch_uart does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() for each entry of the flushed
transfer's scatterlist. This can advance the kfifo tail past its head,
causing kfifo_len() to wrap and the driver to transmit stale buffer
contents. The completion callback also updates the kfifo without holding
the port lock, allowing it to race with the flush itself. The same issue
was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, the driver cannot synchronously terminate
DMA and safely unmap the buffer from that context. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Take the port lock in the completion callback to synchronize access to
the flush flag and kfifo state. This prevents the underflow, although
the data already queued for DMA before the flush may still be
transmitted.

Fixes: 3c6a483275f4 ("Serial: EG20T: add PCH_UART driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/pch_uart.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 9505d255f09c..122025c4a0a6 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -230,6 +230,7 @@ struct eg20t_port {
 	struct scatterlist		*sg_tx_p;
 	int				nent;
 	int				orig_nent;
+	bool				tx_dma_flushed;
 	struct scatterlist		sg_rx;
 	int				tx_dma_use;
 	void				*rx_buf_virt;
@@ -750,18 +751,23 @@ static void pch_dma_tx_complete(void *arg)
 	struct eg20t_port *priv = arg;
 	struct uart_port *port = &priv->port;
 	struct scatterlist *sg = priv->sg_tx_p;
+	unsigned long flags;
 	int i;
 
-	for (i = 0; i < priv->nent; i++, sg++)
-		uart_xmit_advance(port, sg_dma_len(sg));
+	uart_port_lock_irqsave(port, &flags);
+	if (!priv->tx_dma_flushed)
+		for (i = 0; i < priv->nent; i++, sg++)
+			uart_xmit_advance(port, sg_dma_len(sg));
 
 	async_tx_ack(priv->desc_tx);
 	dma_unmap_sg(port->dev, priv->sg_tx_p, priv->orig_nent, DMA_TO_DEVICE);
 	priv->tx_dma_use = 0;
+	priv->tx_dma_flushed = false;
 	priv->nent = 0;
 	priv->orig_nent = 0;
 	kfree(priv->sg_tx_p);
 	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_TX_INT);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int handle_rx_to(struct eg20t_port *priv)
@@ -947,6 +953,7 @@ static unsigned int dma_handle_tx(struct eg20t_port *priv)
 	}
 	priv->orig_nent = num;
 	priv->nent = nent;
+	priv->tx_dma_flushed = false;
 
 	for (i = 0; i < nent; i++, sg++) {
 		sg->offset = tail + fifo_size * i;
@@ -1150,6 +1157,21 @@ static void pch_uart_stop_tx(struct uart_port *port)
 	priv->tx_dma_use = 0;
 }
 
+static void pch_uart_flush_buffer(struct uart_port *port)
+{
+	struct eg20t_port *priv;
+
+	priv = container_of(port, struct eg20t_port, port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (priv->nent)
+		priv->tx_dma_flushed = true;
+}
+
 static void pch_uart_start_tx(struct uart_port *port)
 {
 	struct eg20t_port *priv;
@@ -1520,6 +1542,7 @@ static const struct uart_ops pch_uart_ops = {
 	.set_mctrl = pch_uart_set_mctrl,
 	.get_mctrl = pch_uart_get_mctrl,
 	.stop_tx = pch_uart_stop_tx,
+	.flush_buffer = pch_uart_flush_buffer,
 	.start_tx = pch_uart_start_tx,
 	.stop_rx = pch_uart_stop_rx,
 	.enable_ms = pch_uart_enable_ms,
-- 
2.34.1

