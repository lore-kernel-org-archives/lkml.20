Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460435;
	b=37C4Gaes/eROFCuvpedZKjwOvg34eHBxphRUlr2+/y5Mn480KNGVPU7bzsoYs/G1pJg+
	 gNQmrtJmxVMlGTApUZo1GXqYcwubHg0TqeB35tVT87L4dlLRKAn2WLuLoOA3aaRrBPwDY
	 Yurm1HFC2OtVS8BqktN/pCd3++6NJewLRBGq4VnFnEjZRTWCJm5gR4zRsyv+vLwwhmkSw
	 CcaiCvSzZBh6NyfcPV9UJBqi8m+4QpcP3Y+il0NfNqY/EbJUPSHZh5kqCyBMIKJ8jbqhp
	 UcXInxI0ZeBuv2CXk7C9bN2SvaBOw+ORbpWQM5NSGwzRAaZ9C7swNRFhI8LFOo66rog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
	b=LjZ8K+C3uGdzIBlEIb/lOUWNLCtBuGi8Si5n8nHtvCRsiJuiT6mM6rHX1JijsTKMKG9V
	 ul1YJVF/0Hk4jJ/x7kjLdV8V64VL1CEcCNObbbvgi9XmbmvqoW9lGRVqSA9RZ/o8d2pqf
	 cCa41KRKnd0Ta+9GdWM//2dJXV0oanC6MBYwOU2q9WRkQHmvVZ50ML6yQ/gYtoR8vv/5E
	 IAEIgnc3SWh/+gnD1iDsdvoO7ZOJmPce54BIL39h4hfxpM+lxblyUscnn+63o17GyrC+N
	 +Mx5nGVbVE1yZoFLkSIJAa8KISIb7PzS5UQY0DDOQiO4jNxF0yhKHVMdCKuhMBkp0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxKt9e0N;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE760606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE760606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxKt9e0N
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso892108a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460434; x=1794065234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
        b=xxKt9e0NpDf3tVGVMS6wABgShbLvUu1jspoSSPdQR+jrZURTsAUlFjFIUbaa+zldue
         BH9Q2YVj/MhQi17vot9q4bxY+OgPjR93EO4U/n2JdlDzmd3jONUECn7mMK4+NWPOJKOn
         CZ8OwCL1ud1Ux8ShHqn1BWX9Kct1BdM5w1EHu0/NuVMZGDeco7HRAjwnrvuugCPwdkE5
         pC1dHjy68JWDh21fbmodKPKtC9Ll9YrERB/aYMaK6ZLn5+eTmvLscCsZLsAkpTivuWve
         OF/OmyNhWECuTIhr0RePHZiKrER11pXgxqnJkKFItyYqiktMFEKB6P5GQzeInHxmkwCS
         ttqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460434; x=1794065234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
        b=n7Qc0d6bLxv5nK50IkxI3bG9tYxTMLgW7Z4/KXvuZnTLpN7gU6WGbww2elADL/JlcY
         KExijeVvvGU/vwnYFMTVuTc4FInxivzEQg/fWy3u9NK46BGlbxqJBveumUP4v3WABGo6
         HEmH46KP5OrNi/9ktwaqMFN9riFLoPZJfQzdwsXya7Fd0Kc7aED3yMr6E84DIrleObJQ
         HH5OzvkgvEcjDJVwIqSfVxQdg6/FzOeS9A08NiuI8j4ksHLyimpNCox8VAaeykmWAS8k
         ZWxqOI7ZxS0una2Hp1YfiwvPAETVLBLuCeClyEWaxguXDp5OwUiIpujbr488c625h8UB
         8Qsg==
X-Forwarded-Encrypted: i=1; AKwUvByWH3VaioVPUv2v+Z0sPnH9fxVECvXtXC1MNaGZ4jDz+FBxXqJ0GN3LxrN/62hd55iKLqA1IUmb99XlCJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6udqyJ3Xs8QQfJ10LYClV7KJUpx8ey6U7q/E48XENQ6Y1J+hj
	1ZAJlG1g/ZIJULl+BQJkA9c4MbJ3apJYfUnB7lf87eowgO+EiLu+hI6U
X-Gm-Gg: AYBFou2NmrTqcrInstekV85hXf0LzPHub4kIQVdOp4OqFewnHPxec7KIXdGS1AV13QG
	NqJLtneF7ZwKMbQIdSA5L0FnPzz02Wro4dpTiWhmilMA4spOx9dJwVCcaz0bdoDlGPJbAionl19
	h2CQfgkxOeBGl23V+GwgOd6Dm3d5pplRiySRNMuIZZf3+Saz0/76TUo1rCF4C3So/fr9NXqsrPM
	sJumDAoP754SZ4WYzdxk3oTpL4i65mAH6xqpS6t+NwXi+pG3rO43alAvETn9gJwmx3bJt/rAwO+
	/0WDygn9P99ubysNP1DwDyxFh7Fv6zBrzjDmacCpkEfTlGOuivUdfuTpxv2LmEVj64FJCb2ibrx
	mvXmZ81elYqiOULBB/+fWSZLlBLEyMks+UNIzKP38n2nmhA8RcN5q4ezlyV4W+LW+UsOWLL271Z
	6SW88bJxPLUtLpTS2O1NSWa6kvpNLMJFzc2+jXrD/GV+DoGHdNPdz01ikuUZLNgbEmB4l8S+teq
	rQK60yFzEMRXpwh8a0RkfKlj4pzPfMjN6eRlH9Q0Us6it82hgTe8DGT39auhC0rkDx7Ta0WOq5v
	aQIeFn1ucApXnR2/2FgesHWEHcXl4tY=
X-Received: by 2002:a05:6a21:6b8c:b0:3de:b120:bba0 with SMTP id adf61e73a8af0-3e928cd25a1mr4531768637.36.1793460433856;
        Sat, 31 Oct 2026 08:27:13 -0700 (PDT)
Received: from kei ([222.141.54.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09615125sm1731025a12.1.2026.10.31.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:27:13 -0700 (PDT)
From: tianci xie <xiex16070@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tianci xie <xiex16070@gmail.com>
Subject: [PATCH] tty: serial: samsung: fix TX fifo underflow on flush race
Date: Sat, 31 Oct 2026 23:26:56 +0800
Message-ID: <20261031152656.1422-2-xiex16070@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20261031152656.1422-1-xiex16070@gmail.com>
References: <2026103122-repurpose-cost-2da7@gregkh>
 <20261031152656.1422-1-xiex16070@gmail.com>
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

uart_flush_buffer() resets the xmit kfifo and then calls ->flush_buffer()
with the port lock held.  Neither s3c64xx_serial_ops nor
apple_s5l_serial_ops implements that callback, and
s3c24xx_serial_tx_dma_complete() computes the transferred byte count from
dma->tx_bytes_requested before it takes the port lock.

A completion that has already sampled that count can therefore run after
a TCOFLUSH has reset the kfifo, and advance the freshly reset kfifo by
the byte count of the discarded transfer.  kfifo_skip_count() does not
clamp, so ->out moves past ->in and kfifo_len() wraps to a huge value.
The driver then keeps transmitting stale buffer contents, and a later
close can wait in tty_wait_until_sent() until it times out.

Handle this the way 8250 does in 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush"):

 - add s3c24xx_serial_flush_buffer(), which clears the outstanding byte
   count and terminates the TX channel asynchronously.  The port lock is
   held here, so dmaengine_terminate_sync() cannot be used;

 - sample dma->tx_bytes_requested under the port lock, so that a
   completion racing with the flush observes the cleared value and
   advances by zero.

The callback may still run after dmaengine_terminate_async(); for the
fifo it is then a no-op, but it does clear tx_in_progress so that a new
transfer can be started.  As in 8250, this assumes that a terminated
descriptor is retired before the next one is queued.

Reported-by: Samarth Narang <samarth.colleges@gmail.com>
Link: https://lore.kernel.org/all/20261031004733.3345841-1-samarth.colleges@gmail.com/
Fixes: 29bef7990845 ("serial: samsung: add DMA support for TX")
Signed-off-by: tianci xie <xiex16070@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e..e955b7e 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -330,7 +330,6 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 	int count;
 
 	dmaengine_tx_status(dma->tx_chan, dma->tx_cookie, &state);
-	count = dma->tx_bytes_requested - state.residue;
 	async_tx_ack(dma->tx_desc);
 
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->tx_chan),
@@ -339,6 +338,17 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 
 	uart_port_lock_irqsave(port, &flags);
 
+	/*
+	 * uart_flush_buffer() resets the xmit fifo and then calls
+	 * ->flush_buffer(), which clears tx_bytes_requested.  Sample the byte
+	 * count under the port lock so that a completion which raced with a
+	 * flush cannot advance the already reset fifo past its write index.
+	 */
+	if (dma->tx_bytes_requested)
+		count = dma->tx_bytes_requested - state.residue;
+	else
+		count = 0;
+
 	uart_xmit_advance(port, count);
 	ourport->tx_in_progress = 0;
 
@@ -1162,6 +1172,32 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	}
 }
 
+/*
+ * Called from uart_flush_buffer() with the port lock held, after the xmit fifo
+ * has already been reset.  A TX DMA transfer still in flight carries data that
+ * no longer exists, so drop its byte count before terminating it: the
+ * completion callback may still run and must not advance the reset fifo.
+ */
+static void s3c24xx_serial_flush_buffer(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	struct s3c24xx_uart_dma *dma = ourport->dma;
+
+	if (!dma || !dma->tx_chan || ourport->tx_in_progress != S3C24XX_TX_DMA)
+		return;
+
+	dma->tx_bytes_requested = 0;
+
+	/*
+	 * dmaengine_terminate_sync() cannot be used here because the port
+	 * lock is held.  The callback may or may not run afterwards; either
+	 * way it is a no-op for the fifo because tx_bytes_requested is zero.
+	 */
+	dmaengine_terminate_async(dma->tx_chan);
+
+	ourport->tx_in_progress = 0;
+}
+
 static void s3c64xx_serial_shutdown(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
@@ -1684,6 +1720,7 @@ static const struct uart_ops s3c64xx_serial_ops = {
 	.stop_tx	= s3c24xx_serial_stop_tx,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.break_ctl	= s3c24xx_serial_break_ctl,
 	.startup	= s3c64xx_serial_startup,
 	.shutdown	= s3c64xx_serial_shutdown,
@@ -1705,6 +1742,7 @@ static const struct uart_ops apple_s5l_serial_ops = {
 	.stop_tx	= s3c24xx_serial_stop_tx,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.break_ctl	= s3c24xx_serial_break_ctl,
 	.startup	= apple_s5l_serial_startup,
 	.shutdown	= apple_s5l_serial_shutdown,
