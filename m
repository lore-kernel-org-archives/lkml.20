Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450379;
	b=qYkb0M0Y4AYyeAke+iOWcMOZJ4ALyeyduOeCaI9M9UKQH+aAPmFc3qg45a8GqL77V3kR
	 gHgqo20zynuM/pfhut1WkaNxBjKDhxLjDmPL5dOorBFkyGGSJJCwMnV7xjulwjDnXVDSD
	 DmwcZxKQn/EBhAiP1fdJiuk7bCxG4Z0XmhWATf9kWpNwXW2j0WYlVfSNDAKZtNjOgzdu/
	 lrRULXPzqRy6970NbR8d9bELHUZF5ZiL7cB3rRX7tFk2w+OU9HLRX3gAHuFfi9UsArYeU
	 y2egQ84pgE6mqrto0SAhR8f+KGNE5EeDeXK9OLruhWZ56aqXCV2NLLCiKwNAZzOKdjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
	b=Qj/B3JGUglgWQJ6KluPwy5FXsWpXvZA/QiALzqwftzMEcf1K8zwohHb3+cEF5p07FI+4
	 4TejsFtQqVk/OW7WWtaCBpgdvQqC4pOVY/yu3jfsdH4TU8J88jTjQ2WLnFR31vHZdTTFs
	 dvYX+XjQOt2WVgzcRj6NAsrGJzRDBJhNKufi4i2PfQlD7zyGSZgLN9pi+RIkgejPhHHxm
	 OT/JWhDRipNCgmBAaV456CY18XDOqbRysmUXVfalcBbdsgDdnagMoJUQmXiU4G1tDLOqf
	 J+G4E7tjLRJ2hldBBNN4pkZiwCY66I75RjofP0tJ4talvGH7MwSssU7J1nge112usIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="noT1P/WW";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229C606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0229C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noT1P/WW
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3419678eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450378; x=1794055178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
        b=noT1P/WWygxujj5N7CXMhW9KUUVBrILgHD3cyISauVEk/333TsPoEAmqe+vPvqtcRg
         vjg3LueDnm5cH58bO/1RkjL3Zyyhyet/YpGCw85fQZ6clqc8g5c2VvITHO7H4/IZHghP
         i3ItIumFpvLEMSn4TI/dPT0noFcxzmIels6683DS2IBe5sMFlIEcJ42hA8J58SCDMMXN
         oj8Hzu6Lei9XwPEZ1sIQjePY5nh4oDk7mBgwrJAybwT8ux/aOkmsmwM6NttyskzXEH/9
         b3V0q5e0X3miPnQ6m9M4hqBfxNIorRAN2b+on7ZzhuGhOBDcR88eVf6j4nCw6rBNPPVt
         likQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450378; x=1794055178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
        b=pdwq9PhNcxlfG0ebNz4ml3JQ2/FjSpooeCawcLD4fzAj7B6kC/ywJe4s6h3yuwMq4C
         S/W7iGJDWmLGI4Jm+60tOn6kXDlZwaTaRMyZVmJulXObXwr6UA9HPTb1rWS6noVWFSr4
         UXTfOwks8RvZ239qDMS6/BA7vcWhyPIlSN/kGp/MEy1NZHILWgyBMjEyVu5Epd3Jz9Yt
         B+86OD44JHOC+WduJJS9bBJUrLRf4NzNRrlYwZLa9/c5W1oneaInp9EIOXfJ3RVlSde8
         HMEeeQc/HiQjcZvbngPbrnQM9bSPfLSHLE6L44uQUOwGGxtApjDwuuPg0eRt5Zx5eU4F
         U0dg==
X-Forwarded-Encrypted: i=1; AKwUvBxLSNZcOEEy2RhbmeWANUgH5wiJHpJYUZ4ddu4bjp3fVUxhfeuJAe322z+UdWcv87Dd6WeIDZPufCzttv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4JtdVnU33smv4egZiEqQ97YgeX7UNZaj4eC8VT75AbsRN8ze5
	sGcPBi0cbCvTTDNa3X2UOV09d2GQkLpnwg+JqUMlu8wK0XHztto52ys3
X-Gm-Gg: AYBFou3BggxIy2dZEaUFlRatBV0spsLu0Dc6Ag7iyhrmXqwnbZ134P7UTxzPsm0ZO0K
	8kSIjRWpElr2iPYPeKERJRAw8VnuLLnHxwwrSMj5TFC59zN8uHUTVwDmxhnwrqOpIBI/36+NK3t
	zGBsu3ml4eiI1iz7KvkuKsN9FgXuoZQvF/SIlDxZmQ6MiAyS6pdtj/bFJKoRdnAbAFYVovHeFac
	uk409FapNHd7JsO6pqZutRxP5ZFdsGZ31PvXcc0k2lGV5iPq/cLeFc9yFsGIorpw4RIjWPeEzV0
	t/pgj9XQ0h6PX+hmKYivMZMj2YYuHnE84RrKw4wU4pwZv5wHc9lGRAKSTubutpBFXfoTa5JkiaH
	8cbVfGMyp3jVr2vlLkalbuNgoLYmXqZ4W19zJyhZiQrVK8sUi+tqJMFezGt2TDPYbq5yRfVrSQ9
	wUKrTRlYNIse5cZLG6nTYTaYBPvDPGMLZwiQEnuxcsP1doNs9XysLCdhLLEhR+2G32ooHhCK0EW
	iseasqKmKR96E0M+Ds2qNM552e3CeKZKtjmUxqLMBwwjBegHnIryp117T6djKH3w/crKQHBU/Mc
	X3Up+oyIkMzJzMIf588GRfFO4iUhjnL6iEKhCi+HNRruwtEveaESr5D/CBqQ8al45YyA9/R1Pe6
	Bjr5hRjDqbpFmA4e/6TRcHlh3EyxdTgk1atwCwcJ51PX0qSrK/TbO56dQuoGQLismoArBPM4l2a
	ikSU014QUoJSt/sg==
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr10542506c88.24.1793450377950;
        Sat, 31 Oct 2026 05:39:37 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:37 -0700 (PDT)
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
Subject: [PATCH 3/5] serial: sprd: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:09 +0000
Message-Id: <20261031123911.3784690-4-samarth.colleges@gmail.com>
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
calling the driver's flush_buffer() hook. Since sprd_serial does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the flushed transfer's
tx_dma.trans_len. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same issue was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250:
Fix fifo underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, DMA cannot be terminated and its mapping
safely released synchronously from the hook. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Apply the same check in sprd_stop_tx_dma() if the transfer is stopped
before completion. With this approach, the data already queued for DMA
before the flush may still be transmitted.

Fixes: f4487db58eb7 ("serial: sprd: Add DMA mode support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/sprd_serial.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 3fdf5939a62c..718732b683f1 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -133,6 +133,7 @@ struct sprd_uart_port {
 	struct clk *clk;
 	struct sprd_uart_dma tx_dma;
 	struct sprd_uart_dma rx_dma;
+	bool tx_flushed;
 	dma_addr_t pos;
 	unsigned char *rx_buf_tail;
 	const struct sprd_uart_data *pdata;
@@ -236,13 +237,15 @@ static void sprd_stop_tx_dma(struct uart_port *port)
 	dmaengine_tx_status(sp->tx_dma.chn, sp->tx_dma.cookie, &state);
 	if (state.residue) {
 		trans_len = state.residue - sp->tx_dma.phys_addr;
-		uart_xmit_advance(port, trans_len);
+		if (!sp->tx_flushed)
+			uart_xmit_advance(port, trans_len);
 		dma_unmap_single(port->dev, sp->tx_dma.phys_addr,
 				 sp->tx_dma.trans_len, DMA_TO_DEVICE);
 	}
 
 	dmaengine_terminate_all(sp->tx_dma.chn);
 	sp->tx_dma.trans_len = 0;
+	sp->tx_flushed = false;
 }
 
 static int sprd_tx_buf_remap(struct uart_port *port)
@@ -273,7 +276,9 @@ static void sprd_complete_tx_dma(void *data)
 	dma_unmap_single(port->dev, sp->tx_dma.phys_addr,
 			 sp->tx_dma.trans_len, DMA_TO_DEVICE);
 
-	uart_xmit_advance(port, sp->tx_dma.trans_len);
+	if (!sp->tx_flushed)
+		uart_xmit_advance(port, sp->tx_dma.trans_len);
+	sp->tx_flushed = false;
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -555,6 +560,20 @@ static void sprd_stop_tx(struct uart_port *port)
 	serial_out(port, SPRD_ICLR, iclr);
 }
 
+static void sprd_flush_buffer(struct uart_port *port)
+{
+	struct sprd_uart_port *sp = container_of(port, struct sprd_uart_port,
+						 port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (sp->tx_dma.trans_len)
+		sp->tx_flushed = true;
+}
+
 static void sprd_start_tx(struct uart_port *port)
 {
 	struct sprd_uart_port *sp = container_of(port, struct sprd_uart_port,
@@ -946,6 +965,7 @@ static const struct uart_ops serial_sprd_ops = {
 	.get_mctrl = sprd_get_mctrl,
 	.set_mctrl = sprd_set_mctrl,
 	.stop_tx = sprd_stop_tx,
+	.flush_buffer = sprd_flush_buffer,
 	.start_tx = sprd_start_tx,
 	.stop_rx = sprd_stop_rx,
 	.break_ctl = sprd_break_ctl,
-- 
2.34.1

