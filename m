Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312991;
	b=Cw0LAV7wscCUAiAoH5Hgy90J2PSNgOKv1kNr4AODgfjcfKnzOmgZKyYZSO6xtzT5F32S
	 jBprDkvvt6IOxEqn8KZzRT3I/1Ee8A7px2md1e/nJ4ErDiwsEK56W5NtQqh3hEdX+c0Kd
	 m9kbhY01tLmQD5xANkCflLqJi5CdONrA8RrjjQIDsqoyUMkf1WYD6j4B3ONIQduF/3cZ0
	 lsH8kP06ILypqvHUtZXqcuVd3ofEpAKCc9dvSoU2oikJM/xiZhGmUCq019Z2JjZkEpxcd
	 ZAj4pMrmOy8R2nnyhmo7PG3gpyCF/IYSzHjOFtyD9Z1Gb4fViZ4w3EIfHmN+4v4d0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1RBMhPbkQG/cfbp95fXygy3gDDtR0uz5LmPXIHWuEM=;
	b=Ey3plQe9jaMOBiim4cgdddfD0bf1l0c3B7kcCxjm+SJVLh0rcGEsnm0pdHAkRd3dnplX
	 dv+qxIOoeiCimFBlyaMNs0VWKpGdKIIJ6WDasMvGAKE+x17yKpCm8R+VupNGQEj5WAT3B
	 lR0QYEIuhdUWA4+LZM4a5TzQ0OZM6agid1tvabaNkI4QPtUWrvgVVyGOlHQ/LfORVcTVx
	 R6caz3rAAKzK+kbuu6rHW4K4CDgsp/J9qXLuDdE9OGyec0pcS2Nc20+Prc+S7jN/dPUeo
	 +AfuVrJTIjHGcWnPZz8uO1W0DWo4HJF6m7RPM1+aIGwTZisqj6AmA2W2vrD1SSXwNyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3pW6rN+;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408EF606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3pW6rN+
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-54cd7de2d42so67861b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312989; x=1793917789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1RBMhPbkQG/cfbp95fXygy3gDDtR0uz5LmPXIHWuEM=;
        b=o3pW6rN+IRyI/oytvBm53MAPphqJG9oMLcKhsK7DG+Jic6zYw7yaIaEcwFyCGlY3QE
         VtgG3P8mBUebEt936PY9t0K3EMvSvaEUCH10OifCxtHQ4cnjy058eDRzLdZHoRp65QJy
         8E/bk+6qnJralV+Uc+H/JpG9KnCQ2CI85KOk+riWbKZgy7AFGqh3l56vvhotu36/HjxY
         WO+fsp4zckvUj7aHHlrbLb+19UnJvLhMTWPsGC152w9ur3SsWwjKzkrqfQapg2LC3C2b
         08d1mhmeH0QIa+h8yzCB38AWhfYfPTLP/Pp60GZcWdrNfKV0IZe0ImZmiOfx0gYvnqtR
         9WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312989; x=1793917789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1RBMhPbkQG/cfbp95fXygy3gDDtR0uz5LmPXIHWuEM=;
        b=wKJ71KYWgty4i8AhE463E11NVz80Dr+6Zp1ocSBVCwXp695+G4LcuRvcUFdbz/CXcp
         368NEUOksHuJUz1NlEhYo3jK+DvhnjNi9IeW7OBL0FIo8MDnYc6rL7NpzPikVkKLuMeP
         VMLPcQ/jCuLScmUYgpb40S7YeaVu++5y+QVBtUkcVvyOleZI8engW6z4Az0yq5OADey+
         lLBMiCq4qV/8UMGBStyttg03PEZrnzKYzUS0kpDtVvQSsFnUfNzWtw+osjLlklBHW48f
         XDROuPBppp5Nt/lfoKdd+Sl164h8tzh1Sx6/VgmYF8fKILIyG1Ep6m3c1YGNpuCbTwbr
         uHgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFRSyzaH/S2PEscHupxi6nJneXSpxHgf2EhqY1s8hkRFRPDn73/RU5gwwMHPE2r8HnXGVgr5C92bHmuGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdmDWbjRvlQdxO+QXa6YTWeP/rvmr8wVOlhvMP4SocsV7Hn3Xq
	olApNBs+6FX6Gg9xjmlTtLLX4jRPK0QIfwqoGrsNNRnOKwrAt628HzTz
X-Gm-Gg: AYBFou23C79LL95w8Sq8UoERD6/KzT93EOSEhUxopdPD9d7MbBNJsFSu3hwL6hvdVUT
	BqYThA0VLONmp5nQ0pPQr0a2UV17/1Uplbdw7J/ewSoCrFSutB1LSiQl8yvFZ853Q/0IWaYLmic
	5NOusOT/3r7IbWXVBf07CfNMUE/654txcnxeRNOK55+j4FOKu5XCwLxRvIzLKfdBw1CMXTZLHrC
	MBlFMjBvYOK+A6E+CR4NeGYGY2WUvky15THjuUDr4p8IsZoHd6zL0NIHW9/YQRkxGRDIMRaoizV
	bv8TElhJZUmLf1BkKFL6lsmClmxkO9nsAE9WbXdcCkCg6zPSibwH11mGQfRaIcCsbIMYaKotL/+
	CnvHtZtDPaxt0ctcm64cbNnWYZrH/qqszgmsGCPoPgZDFo0hTUdCIXjp3XoEu0+qkl1YH8oSOOH
	hjHrBclmMF1JwT/dic9fQbyrhfjW5rVpvD3RNO6PhtGayL4phII3ergy2y0m57RJWR3b+TBh/qm
	R5aq2+0nlUQeKvApnEo6YyXiYu6lEgp/QXU3l1dVuq3osHCWBWLCjkBmbj3WIBQjqQLHgAzRaM5
	4vCaXzJ4DQIPiyxaSwApWzpN1HKMpykZSC8Nr9tRMikr8FFWgp3qhH91hwVlkU1r/zRx3dwsQXw
	4X69lNiNWAGF+XlBCA+WC4MHS1gIBIE+gzws4QN4tIOCJKWf3zdGJHgHEhNOAKiak5oaJq4wD7L
	yA5zU/VlBBjAy2oVjVbuoMzeeoQ0LZ9EeiQMeXo8fjqr+vcPGNqY1t
X-Received: by 2002:a05:6808:23c7:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-5640decd670mr462865b6e.44.1793312989197;
        Thu, 29 Oct 2026 15:29:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:35 -0600
Subject: [PATCH v4 1/7] dmaengine: dw: Fix XFER bit set, but channel not
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-1-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dw/core.c | 70 ++++++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index dd75f97a33b3..07a5f5105787 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -141,6 +141,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -257,34 +263,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
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
-		dev_err(chan2dev(&dwc->chan),
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
@@ -302,6 +280,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	llp = channel_readl(dwc, LLP);
@@ -310,6 +289,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (status_xfer & dwc->mask) {
 		/* Everything we've submitted is done */
 		dma_writel(dw, CLEAR.XFER, dwc->mask);
+		if (list_empty(&dwc->active_list)) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return;
+		}
 
 		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
 			struct list_head *head, *active = dwc->tx_node_active;
@@ -341,9 +324,23 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(chan2dev(&dwc->chan),
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
 
@@ -389,22 +386,9 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
 
-	dev_err(chan2dev(&dwc->chan),
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

