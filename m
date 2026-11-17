Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889706;
	b=Ie3N1d7fCFRQhh8OVLXK4bf7PP/0PVtQJJtXjLDNjvqa+a+PUnTCSCaCcb9VCMM+Q41I
	 fdDRUHfgkWhGnQiNX29EQeTYr8hPjz4aDJX7uwKNjwgpcmnccImNJsuqero4oTA+Rbu32
	 jV1W2XypIsix5RZ/yPzdIYYWvpgIUxj+xGq9aAr6CkARVo4JCTiKwWhkQFydOIdxPcwes
	 XmMb/5tml+6Il4bxjDizTqzhlRsu8blPzn4pKfISzf5CF+NbFw6of3dh4MndV68N6IImb
	 vIUMyE1EK3AtIwOha7UGRxzLuule+p0RMZBBBHDAGZNT3Lh8hdJzkNseLEDGYEciekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889706;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=8z5exWLOsArB3n8YhVSSxwP7PGSyUO5muX6NLLxT+tM=;
	b=Ikj+kIvELMN7MeC+EL3JZNxf2kSESAbkHdslYAR0KkNd/GyygRRIY8E9nBTtm87naK5s
	 btxPVPhXXshgEAX6J6xieiptgB5qwSxpGS5sGlzHRFDqRuvvAOj8d1ykurcwaFwf1aqt5
	 /crlLwbjPjonz454DDvKDMkU3SVQgKQQviKCMmYevbrC+rV0AVm9uE4mIfPT5HgacZ3gG
	 LYR44d/nErXG+Bb/N6VzFrgFYKjHNmYJe456eDpA/oDv9reXLznGvHjhk+qi7urOwoX6T
	 TtMlE8ysTWlrYKJp07+/30wOx2P8Qlm/9ScxZfa8JsuH1ZskDV5uJZm6b3lUvOiQIeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=YrTcGqLX;
	arc=none smtp.remote-ip=160.236.52.120
Received: from mail-m16023652120.xmail.ntesmail.com (mail-m16023652120.xmail.ntesmail.com [160.236.52.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB2F606A32A;
	Tue, 17 Nov 2026 04:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB2F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=YrTcGqLX
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54ef0f5d3;
	Tue, 17 Nov 2026 12:28:11 +0800 (GMT+08:00)
From: David Wu <david.wu@rock-chips.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	Jose.Abreu@synopsys.com,
	davem@davemloft.net,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	lorenzo.bianconi@oss.qualcomm.com,
	luis.la@mail.de,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	David Wu <david.wu@rock-chips.com>
Subject: [PATCH net-next] net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable
Date: Tue, 17 Nov 2026 12:27:54 +0800
Message-Id: <20261117042754.96177-1-david.wu@rock-chips.com>
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
X-HM-Tid: 0aa1e7c331f709cckunm33dd12d8265067
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR8aVkNOQ0gfQ00eTB1DSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=YrTcGqLXRx7m55KeVzUU/L6fM3vKFbPcByx7YNFZ/OrV7m5qtwL+Yw08EZ6TaCGyN1vAoytfWiSs21Nbr3ADV9HHcZvS17Hph9Ak+3M7OXwQd7JwrNGOUxfeKkkt9UMO0V5xHs1czXCmt7xC04Oej6/eur8NJd205yvC+TTuTaY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
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

