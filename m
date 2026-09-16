Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF39F4C9E05
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583073; cv=none; b=PGJvw+jKJU0KjE9sB7aPdp+WfnfWxUZzC+fQLwhnlI9lFlnQdCdFxSMtxFZ0KKwBMGwaTku+8Oy/9U2lwqkmkyhf9y74M9vxDd3axZ9C4HjISvsHWeBzyuoEvVV0ws0FgjLmOyDyXORPZWI64RzFSr/p8xWSK1x731RQwpx7CbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583073; c=relaxed/simple;
	bh=8HtTJeU88HThKsi1C7V+j5o933cAt01T3GynIseGe58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjjcdwfgfYejWvEyiGdSdTTLNpqCKrdIZa6L1v92iEzKdMZC85qcfHKGYcVgFqgmnrfsxprHdgOeCst9kFUhR1foXbQTMbsgy1/E3lWfzi0lfKi5AnCvLtTZix2yf30Wiank1ynFh9I7AEpt13BsiBYDhI8MXs8YuWKXWkc/v04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8wjm85R; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8wjm85R"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so778118a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789583048; x=1790187848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmO3+nodqgtKsEQYssHFME7NIr2jEmv+K74o2X5CQHc=;
        b=Z8wjm85R5bjElUyD7Ym2g5pph1juZIa3AQFRhev3WbgSofD5DY/zAz8PsvVaFQnI85
         +p0ctVEmErpc3E2446iuYgs6fkCB7zaZJe1QbiJqi7jphCUib/Cp//cSbml14VWbjSAP
         KiJ+Xx9KSpneeTGJsaUri0apLXqLw4ibnWydEl4Dk0rAmZTUHd/EkjeVLibtAeE7Stfn
         TuHmcUJzBiBY5D4/8+713ByJRuNeH3ddGRa1TEU8dFWY1W17mfN6UwtR9noIc1oV8f3O
         rXtpYHrDihs2vY+9MUsUTAjE+BI+48kgXEMn4YmSQxC44IERXT0GS9TomCGzrTJKFjIV
         Ykog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583048; x=1790187848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmO3+nodqgtKsEQYssHFME7NIr2jEmv+K74o2X5CQHc=;
        b=Q8zjDHoW1pb1lr7gd2G1DrZRzjchRJN6EYrcMEx64JB6HL7F2X6FLgMLBVWWpt0jTf
         aiLLpf6PpnZnPFokk65lnRg5SgwHTW8v9XzI2F+cTQSc8aatYAWdotgGhVtcrl9AI9j3
         Gj8CvW5NMDnEIxcbtnwPJwmb0+66cQLmcOhxzzcp/w0fd9XByLfQq4eQVLX6H/RSDhqE
         m4vR0z3WS6VXW0SEF4kNX1FBCM+z7Uwbna9CeYwPj/KhAnvG1D1EPDrR/fQQdL2j1xvU
         xmBPn3+9DLFKklEgqAVcgYaWHALCr0bo+vsRQ/7g2NPKLdiRnKZ6bUNuw4sFu82FeWJk
         F+yw==
X-Forwarded-Encrypted: i=1; AKwUvByrd35z46A4XIHXb2VtON7aHJHiCqxp2V6E1eotsLwMsSmrRhmmSD9IaohktMtqdVEeee9m3E2/oKd1fZs=@vger.kernel.org
X-Gm-Message-State: AFuF++nrYShLM3paRiqlmzXu2lA60rOc/OmeagK8SJG6c8YDoQtajHjS
	r1M0OMtzzoJHHxRbO7eKCBXyS7R3BqH4o4Rr6LcuDpTj9yEbvHu+KPq9
X-Gm-Gg: AYBFou0HEBfS2t9OlcfE355zw53XDQD6nVtbrJz/BsZfol4ulohNIz/6AUURq+cHbPF
	BuH5xO5+MgiPgro0zMhB0pUJHNXeb98sVdgts9xy5slP2mpblf6QyJJdO067Rq6QiZwe9ykmFbB
	W5L866Y9uegHiiH/1FSsPz0TTPWPC1Q6zlRRodwjfB3N1Y7TA6RQ9XSjLWLHZOckVbXx3rd2VKL
	eJ5GoQrX1MCj3chZtsS5GkncAlHaf9oDOHTHkA9OjGizo8aijPFtSgHyVQdbhwu49SqGUp8dnNv
	4V0q2tLJQ88Ks2Ko/OEi6Sk2kxo+4s/Gf/xZHVHBnCihM9iYMoaW2jGQKNMHVyaMtTI6HANm6cy
	63X15oGNd5MLQD3lceDYoXWNVyADSWbRs2tGWiFZf6xHXalM7T8A/kFbbTs8ApX7Qy/ebh9h53t
	r6+ao+S14MTwX2wK6Pt6J+++dDjwHeRpGaKQaix0gUK1ii1om23SGSzU5Wh70pNm0DC5y9KuMSb
	5sIfZFHfglmKzbHMW9md0E7TgmvoauvVejf28xWOrsr9tSJ/U+LFkdn63hDHjwd/laM3Z3C+GZw
	6l2f78yrSaCyCk3m/dDVlY0EsKktaFMs6KV4roywKfb6pmUJ
X-Received: by 2002:a17:90b:2252:b0:39d:ec42:df69 with SMTP id 98e67ed59e1d1-39e1e4d3ff4mr7967613a91.20.1789583047620;
        Wed, 16 Sep 2026 11:24:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df6112sm641299a91.7.2026.09.16.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:24:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Nicolas Pitre <nico@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed variant
Date: Wed, 16 Sep 2026 11:24:05 -0700
Message-ID: <20260916182405.12985-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the ordering guarantees between descriptor memory writes and the
MMIO accesses that expose them to the engine. The descriptor pool is
allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
and must be drained before the engine is allowed to read them.

Program the next-descriptor pointer with writel() instead of
writel_relaxed(); the full accessor drains prior memory writes before
the MMIO write.

In mv_xor_tx_submit() the appended chain link must be visible before the
busy-status register is read. Use a full mb() so the engine cannot fetch a
stale chain link and stall the channel after the CPU decides it is still
busy.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..0de2b1ad5c30 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_chan *chan)
 static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
 					u32 next_desc_addr)
 {
-	writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
+	/* writel drains descriptor writes to DRAM before the engine
+	 * is pointed at them
+	 */
+	writel(next_desc_addr, XOR_NEXT_DESC(chan));
 }
 
 static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
@@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
 		/* fix up the hardware chain */
 		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
 
+		/* make the new link visible to the engine before we read
+		 * the channel state, the device may fetch it at any point
+		 */
+		mb();
+
 		/* if the channel is not busy */
 		if (!mv_chan_is_busy(mv_chan)) {
 			u32 current_desc = mv_chan_get_current_desc(mv_chan);
-- 
2.55.0

