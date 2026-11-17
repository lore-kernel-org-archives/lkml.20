Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887025;
	b=bZI6S0r5vTrD7EdcLsYCdbaR+hmsGFCKmf6/9B3PQQwGCf7dTkwG404yu69G/cM9cW2H
	 krU0pMXDF9cYb6dsRx08U+xG4Bl6OWSS5lTFZtpRqlLORcJshfAgRGydIGlwmTdZXuDpZ
	 OkAZszg8R9czKXaN8XmpI8LxclFkW1cpK4DS/6I7waES4H8y/BkqpM9TNF3eeFrIUih76
	 4NY8nnGjAJ1X0utE1fBEKJbfESKfs50Veu2kKRk0/m9nl+uKdPTGSy0gd5eODJVzXhVlS
	 gN/Q6qOtryPWqXHg/V1usp4O10Nn3aLOedbrJZIaT0k6wAe8iESuYXx8nXzT9hvM4dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887025;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=8z5exWLOsArB3n8YhVSSxwP7PGSyUO5muX6NLLxT+tM=;
	b=ozWaLtAiUEjKrD8KPxobnLGbvsaV5Dl+4XSCGn/BoO41e4eBtf/izHIi0hgTbb8uceLY
	 7OkosgiEGy+cg4fSd86anHTq1zgyxlebz4Vv/XvFhj6DSqvYMD3ORD2xfqiddbBO1WG/c
	 khlOoTSKrxDoicawZFZzXi0AHZKng/JmsvEQiNPO0LYOAaERdfV8OrV254WV0ME6xe1T7
	 U0cM7er8Ad75NR8n0snH4H6hjYUp7d/w3akxTrEsccvvpnp+aHakz6bWPkGTGSsAAq1Td
	 HGcb6jX+PbFXz5pr8sLBWOrlcDKRmpdKGCiTtsKWg5w+YVRkD3PuKrWineMT1yKWpzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FOdr7igg;
	arc=none smtp.remote-ip=103.209.128.47
Received: from mail-m12847.netease.com (mail-m12847.netease.com [103.209.128.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CA606A31C;
	Tue, 17 Nov 2026 03:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FOdr7igg
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54eddf876;
	Tue, 17 Nov 2026 11:43:32 +0800 (GMT+08:00)
From: David Wu <david.wu@rock-chips.com>
To: david.wu@rock-chips.com
Cc: rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	lorenzo.bianconi@oss.qualcomm.com,
	luis.la@mail.de,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable
Date: Tue, 17 Nov 2026 11:43:32 +0800
Message-Id: <20261117034332.88443-1-david.wu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
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
X-HM-Tid: 0aa1e79a4feb09cckunm6f20b5ba25f9a0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSENCVhhNGEIfTh9CHUpCHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FOdr7iggoJFupP9V0ZsdiSwag9vjLW4IEkRAB9z+H+WN4TcR3UfAx5Fo25vciX4J0eXH8d+EAkzXH9KstFUhMyu6iPm61CQG0ESqPRux48rwEtKH5BTSGWjc4qmCJT/AThr9Xvzim6sbdxxcGGMlKPqSR9mmKkSFV/XZtB13uqY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=8z5exWLOsArB3n8YhVSSxwP7PGSyUO5muX6NLLxT+tM=;
	h=date:mime-version:subject:message-id:from;

Once the RX ring is exhausted, the RX DMA enters the suspend state and
no more Receive Interrupts can be generated: incoming frames are kept
in the MTL RX FIFO and are dropped once it overflows. The RX DMA only
resumes after software refills the ring and updates the RX tail
pointer, which is done by the RX NAPI poll (stmmac_rx_refill()).

Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
enabled the RBU interrupt for dwmac4, but the interrupt handler only
updates the statistics counter without scheduling the RX NAPI. The RX
NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
the RX path hangs forever once the ring has been exhausted.

Schedule the RX NAPI when the RBU interrupt is received, aligning the
dwmac4 behaviour with XGMAC (commit 6338488356d2 ("net: stmmac: xgmac:
Add RBU handling in DMA interrupt")).

This can be observed on a GMAC4 based platform with Split Header (SPH)
enabled under high TCP RX pressure, where the slower RX refill path
lets the RX ring run dry.

Tested with Split Header (SPH) enabled, running a large file download
over TCP:

- Without this change, the RX path hangs permanently once the RX ring
  is exhausted: the RX tail pointer is never updated again and the
  DMA channel status register latches the RBU bit, while the TX path
  keeps running.

- With this change, each RBU interrupt is handled and the RX path
  recovers by itself. e.g. 3 RBU events within 6 ms during a download
  peak, each one self-recovered (the RX tail pointer resumes advancing
  right after), with no further RBU events afterwards.

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index a0249715fafa..929aa77ce247 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -153,8 +153,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 
 	/* ABNORMAL interrupts */
 	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
-		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
+		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU)) {
 			x->rx_buf_unav_irq++;
+			ret |= handle_rx;
+		}
 		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
 			x->rx_process_stopped_irq++;
 		if (unlikely(intr_status & DMA_CHAN_STATUS_ETI))
-- 
2.25.1

