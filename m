Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744778;
	b=ZXOTYYQqBa5XcsoV60spiTxbjzobtYA34nfiUMA75zJ9CGRFGjLRh2jxtdcbbu9eoUdY
	 2hFkz/5QMoz5+RSjT4P4vaDszL3k+lsoknBvN5Ukon8s3r4avFRKp+suurrDaXQX8yRUY
	 0tb6OPknEYiPJdPh4Yw7cTa9LcewbIwukARuqFrc5Mm8VYVH3e4UnH8zrzwn4wUdCYpuk
	 AvKyD1JFYyMXGl9j/73IqXqORA65qQyHMLMgvbqGHf+TaXg4T+r8TKbXN8XQJzZewiTw/
	 HdbjWGVNzItfb0Jpf3vc47jm2rfyfXCXg5THUvzxIJosbaRGJHlqtdBuiB0cMeQAXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
	b=PGrkJNsLzxMAB6WoEAEUagajCXxkwh0qbhJAxIUqQ7sG7acSIwVEAaQ3PLQduS7ksqHk
	 h9XRBwKn788IOvSq131ltAnEich5xQFLjGo+QQeKrzxGh1Etr2nqoiZnE8kTV9UNfJ1bT
	 PewLlVQVJKFMaEG9inyMBD9mOloL/amPKMFkIohXZSjedRiAB1Wh9jFWg9Sylkl+3/0ns
	 R/tLbUQ1X3CoRyglBlkZ5ZZpeU3TcLi7XANsgyRDXxoAPasHOaa/hM6g2xUiKTeJveIqk
	 TK75IBgLDEMyLG7NVMu8+O46cUKja3VYxPDif67yurWoCTZ808jBXBDGacjp/1iVz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwbQUKik;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4392F606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4392F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwbQUKik
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843ea301d60so62963a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744777; x=1794349577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=WwbQUKik78jDIWjrBN+nnQlQ8h2Fmd6FieVI4srUDjQ4kET0EcWXa2CDIiGktyoEo5
         GYb6byH1esLZt50+yeCEwRxLs9rz9vNHOfZZx83+Rfj2eEmJ8oW7GvaLyCMkXg2rAv4+
         fuNmNuILlHorwi3AXxBRufDMYflIa5Qq5ErAAYZTTBeyf95knNshSI0+DBpnTl0Iu4xk
         WpoEU6XdFrUvHEW3pySwCNeAQq/I9iAbxjV6jDrt+cSaUkB6xoDGNI4GNjn+49jrUXbY
         zM7Y3m42mJEp1M0aa7CRZ1I39WLAzRG3Ov9st09yaJoUSUaXv6o8vCCA7cWaDO8ylIlB
         jDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744777; x=1794349577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=KxPw/DFqAz5GyBsG0XTIRQPkpqmqdFcJ/fRN/enH/Fa8EdlRLW7Rpepsuf1yXd2OQe
         gOMP3T6GAjUmyyKhF+tqqvJqIIRmWEiCHGJOq1v45/uVOOgWMv4C47fLrjki/6s1ZmSb
         6h+MJcqxuqJOf8BF0O5ocYCUd00j4TfdUJUqJvRnxCRBreeLz2jt5J+yYOtH7SzSMf38
         Onry0b+kNAz2G7SgGVC0ejbb77SSohnkO9MGMj7c+5TWP0dOz5oK8SN45meX3e+STdlN
         QddLSEErnt6IrJlDDr6eUNUpU9kpVcWsaXzvr8Rj/dnZu9WDBqoqfVhxngZ5FQfmL0s1
         Umfw==
X-Forwarded-Encrypted: i=1; AKwUvBysoHCz+T962vcHJ1Z0ugtnPgZ0B3j/0+7ssitw4GGDaidne9o/D4fdjJ4x04Ve0siaT58BdmZplUBw/eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uS3KakVFxc+xHLe7ulAOrwpF+y56iwcbEEhUixJUsZNGlFNW3
	ABs9At+VaQsoGfBwWCBd8o3c6ytW/DiA0jOxVj22npYSm95uf9EM6bkI
X-Gm-Gg: AYBFou16pMxFN7QlikciJf2c6sIWMHgvU0+nRPE1iZx9ZgcJfKzBvr3R2HPLkuMmqxm
	ck2PZSEDKsq2vOeLyBOq2/EndZSLhwzmdBTPLvxVPBvAcCk+RlkRFXtiwh8WOEppoXmUUl8gm6r
	gUBbvrpmsXEw2fJgjjVrJcqv9vPhkM/m5iSYrxXrCF1mhGGoNaA1lFp3qAwVcR2GAUpgrarOPyv
	RtkHJle8nJpzCORaG/WyZN0yqncGoU/w1XymtbtzMFd8k/gx47g6NWoat2NuaL3hAbs97vgXh9a
	JZdwkuyRWsgReQY4JpkEk1aMdjWArmCPloaIYNN3HFgIRQsByY2JKikgO4ButG2U02xngzH/Jt8
	dUN8QtmV0hVtiehM5Ska4T6HSch+2hqQlPptZNyEdAezndFhrwsvFpDPJybzRmR9UliNrHHWHyx
	sZkeclVu8pX4q3t/G9d4+BiG6qMLVkPMHzSTPmsH+5w+2DPeeQCBVN27G+GUQ22Grf67gl9Nf1c
	f7epJMF1CbajT+kGbs4ApJaW5HBnii3Xpt4XopnGOqe3RWxLGbEPCoiya4TjP+R1iiWlCSCjkF6
	VhjS5elNyeu0gVyiTxHku0mPkH7NQJn93uLIrLfDqGKCwrhOo5eMx3Rh3tXE4uYgr5RyAGiui7U
	DaeKAtubVPXIrJhCN6dJS9hadMiiu4/Sbh790z70vbJKtBjI3U0qgSxWtxr6BaEe4iUOs8nVHg4
	8tNTG9WNgeAFKQfWOmmacBAM14XFeNyrEVfemQ/u4d1gGR9VO9NpBNux4Ljct/npeYyTMfOOf+
X-Received: by 2002:a05:6808:6408:b0:4d6:9283:1df2 with SMTP id 5614622812f47-5640de79c53mr9577178b6e.61.1793744777140;
        Tue, 03 Nov 2026 14:26:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:03 -0700
Subject: [PATCH v6 01/10] dmaengine: dw: Fix XFER bit set, but channel not
 idle error
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-1-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

If a client driver gets to use the DW DMAC engine device tougher
than usual, with occasional DMA-transfers termination and restart, then
the next error can be randomly spotted in the system log:

> dma dma0chan0: BUG: XFER bit set, but channel not idle!

For instance that happens in case of the 8250 UART port driver handling
the looped back high-speed traffic (in my case > 1.5Mbaud) by means of the
DMA-engine interface.

The error happens due to the two-staged nature of the DW DMAC IRQs
handling procedure and due to the critical section break in the meantime.
In particular in case if the DMA-transfer is terminated and restarted:
1. after the IRQ-handler submitted the tasklet but before the tasklet
   started handling the DMA-descriptors in dwc_scan_descriptors();
2. after the XFER completion flag was detected in the
   dwc_scan_descriptors() method, but before the dwc_complete_all() method
   is called
the error denoted above is printed due to the overlap of the last transfer
completion and the new transfer execution stages.

Clear the channel interrupt status when stopping it, and keep the XFER
check, descriptor detachment and queued-transfer restart in one locked
section. An empty active list needs no completion processing.

When the locked XFER recheck finds no event, only update residue. A stale
tasklet snapshot may belong to a terminated transfer, and a zero residue
only means the source has been read, not that destination writes have
finished. Requiring RAW.XFER also prevents the fallback scan from freeing
a descriptor still linked on active_list.

Fixes: 69cea5a00d31 ("dmaengine/dw_dmac: Replace spin_lock* with irqsave variants and enable submission from callback")
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: require a locked XFER event and handle an empty active list]
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 70 ++++++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 575b7bb6af9a..2a9db9e39f5f 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -136,6 +136,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	channel_clear_bit(dw, CH_EN, dwc->mask);
 	while (dma_readl(dw, CH_EN) & dwc->mask)
 		cpu_relax();
+
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	dma_writel(dw, CLEAR.BLOCK, dwc->mask);
+	dma_writel(dw, CLEAR.SRC_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.DST_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.ERROR, dwc->mask);
 }
 
 /*----------------------------------------------------------------------*/
@@ -252,34 +258,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
 	dmaengine_desc_callback_invoke(&cb, NULL);
 }
 
-static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
-{
-	struct dw_desc *desc, *_desc;
-	LIST_HEAD(list);
-	unsigned long flags;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	if (dma_readl(dw, CH_EN) & dwc->mask) {
-		dev_err(dmaengine_chan_dev(&dwc->chan),
-			"BUG: XFER bit set, but channel not idle!\n");
-
-		/* Try to continue after resetting the channel... */
-		dwc_chan_disable(dw, dwc);
-	}
-
-	/*
-	 * Submit queued descriptors ASAP, i.e. before we go through
-	 * the completed ones.
-	 */
-	list_splice_init(&dwc->active_list, &list);
-	dwc_dostart_first_queued(dwc);
-
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, true);
-}
-
 /* Returns how many bytes were already received from source */
 static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 {
@@ -297,6 +275,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	llp = channel_readl(dwc, LLP);
@@ -305,6 +284,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (status_xfer & dwc->mask) {
 		/* Everything we've submitted is done */
 		dma_writel(dw, CLEAR.XFER, dwc->mask);
+		if (list_empty(&dwc->active_list)) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return;
+		}
 
 		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
 			struct list_head *head, *active = dwc->tx_node_active;
@@ -336,9 +319,23 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(dmaengine_chan_dev(&dwc->chan),
+				"BUG: XFER bit set, but channel not idle!\n");
+
+			/* Try to continue after resetting the channel... */
+			dwc_chan_disable(dw, dwc);
+		}
+
+		/* Detach the completed transfer before starting queued work. */
+		list_splice_init(&dwc->active_list, &list);
+		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
-		dwc_complete_all(dw, dwc);
+		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+			list_del_init(&desc->desc_node);
+			dwc_descriptor_complete(dwc, desc, true);
+		}
 		return;
 	}
 
@@ -384,22 +381,9 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			desc->residue -= child->len;
 		}
 
-		/*
-		 * No descriptors so far seem to be in progress, i.e.
-		 * this one must be done.
-		 */
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		dwc_descriptor_complete(dwc, desc, true);
-		spin_lock_irqsave(&dwc->lock, flags);
 	}
 
-	dev_err(dmaengine_chan_dev(&dwc->chan),
-		"BUG: All descriptors done, but channel not idle!\n");
-
-	/* Try to continue after resetting the channel... */
-	dwc_chan_disable(dw, dwc);
-
-	dwc_dostart_first_queued(dwc);
+	/* Residue describes source reads; only RAW.XFER completes a transfer. */
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 

-- 
2.53.0

