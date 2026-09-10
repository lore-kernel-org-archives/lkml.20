Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF72222A9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071442; cv=none; b=iZlNDe3DIG8MRajlrNSkoJYCTw8pYbi+7lP+KRJzyT33wXdLrJHd/YV66+xe+YfKOcayeMe0iSNv0GxsTC40ATn1oVAMdEuYi9SDyq/+uFRmwTwKiuSRJLIGqakLfErHHZu7jUF717wUufainFwA+k+nmAnTY2Sz95Qy6N6uQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071442; c=relaxed/simple;
	bh=G/cP6UqyeX+HmALzm0d1PxDkYH2O1I4EirGf6HRRVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XroP+P7hu+vkhJg4xG2s4qvGx3Hk5uC/KWfD14eYH04slxkqchv8qzwOQ8QIUvSUog0Y5LvgqQsHbM5AU+KGu2aq3ss9XHJM+biPy9DA1jq3MlsmJSHHKC/BMCIwh5oRQ8WufHtEor98CqQJIeKMEIkO7NtARFo0WBvo/HyxCuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+foB0yz; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+foB0yz"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so150889241.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071440; x=1789676240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwhPXIRNKGfA57MPcx1w8oLAn8z573P69PHwnx4/WWA=;
        b=U+foB0yz8j6kgQdnmcKTlL3ZHria6fQgEJOUUWxNa36CEDxiB9Gb7/Sl6pw+idS+7E
         B5r5bMIIYrxtf6665CMdQgQxgzGBQqqXv3lpijSDG3sMelHt1aJ2oCQCvENZAckXrTda
         oTS7nHxnxRTgG6ffAIB8Ntu32BDk7ZQ2L4H8K2Dz4XKgRN5T4B3kO8ztBCUHmXGrRS15
         rDt9LhnHM7lj2JZS3KMOIJd1y8xCvTwgr91l+nkCxrnCtr3MtNBIxDr52HNK4Vbpw4oy
         Sc7ab/X9ZCHR1CH7l9atIGgMCf2ERBAss47M6xopJMDXliX6N79u23N7fBQkmYl/09iY
         ki/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071440; x=1789676240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwhPXIRNKGfA57MPcx1w8oLAn8z573P69PHwnx4/WWA=;
        b=owk1LWtB5gj4QcYpBj/XguZ9z/Vs1SMkfBnT2gQoR8k9bAnJ6Y8MS6F+KVstiSGD+z
         MZ6G7cvOqKnKOvtJXEX3VOjw/Npydl08PxN5Ls28HgMmAbNhhjdzyqV8gj7o6WNk7g5m
         ER+fXZveITtCCh4kGarvzfXXcQhd3QBfRexcY9wNH84TTph84sG+TelUvp1Dljv+6sZL
         xQiRLej7KXXS4ZYzFca2W3mIDBg/3xDNY2Czy1JX90yH7B8kRQWEdSz5XYz+Z3CP2bMR
         lRJo9e7Mb8Frak5Sm2UsfQB58bdso3ho3Dd1e3GDa9iZkw6ior8WrYcQN8poCepJZO4A
         rmaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxslzTnVY2+iAmn/sicI/Y3K9pFbSSJBL1lyGSR755bVr7HYb/y/iiBG0pJJwd0IyGfK6Pmqto1KbnkVYo=@vger.kernel.org
X-Gm-Message-State: AFuF++nEiQbv/Y6sNa2EV9RQUATJgeSAjh5mFKUKx8fvoKHwJ8oOg0+R
	pWj3bstyF67JfQ3TGymAKsuEc3CrYA8f91xFx3/5Ak2TQ8JAja8iS5mpJx9CXw==
X-Gm-Gg: AYBFou194XwOPZEDXOZbk2YYYi2/rKY3ElImlC0m7oZQmt1ohbnqK1QwXl4SqBL4cwc
	V570ByQ/P1+51cLeKThGTRFu0CPmTaYvtLo6MkWrBoo2tseLWi25WdFziL7VfYp4NXRH/ZVHZTy
	MBlyNU9GPQKT8QesPEoiYLCRnktrn5TQl2PdM2XXCm2PUugDtOwkw3QeHDSy0FaVVUvm2dpjBWh
	BXEJHjwwnryzWwdtzCAhyqy1q4RsTlKUonxEbNzP9xUO5rG9Oxavx+/wHApXpXnx8KYJsmYRIFA
	BjhEBazcInzAVHMJuBKB5g4w9HydtuwQTAoyRhMOw4F5cFRvHv/GGYTUOnYX/d7BYBd9TugPGtH
	mZmUAUdI+ZYUbkHOGlgbBdVv1x19f3KSKB4Fgk96eM/PY65SGmbLpK+Lb3y9oFtkY5DxTn9TTdu
	mDAXFlTBMzdLkunVmhecyN0DPd2r5F25RGsekwAQRDqh0+zL8Kht/hT+kZJ3+JHiaIzhfLJ+0Sw
	L7TENUwIkvSxn5Bfy2j/Fa4+v0egGZU1eL2RoncIpKf/nTW0ndwMtnT/2aGj9RA2wtulkM71k+N
	MIMgmU3+GsaBFOd/AVYi0E6SizfI56YiW7gK09cA6eF6vuZs
X-Received: by 2002:a05:6122:e20e:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c84606d388mr3029053e0c.1.1789071440114;
        Thu, 10 Sep 2026 13:17:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f202516sm4432646d6.3.2026.09.10.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:17:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: fix 64-bit ring base address programming
Date: Thu, 10 Sep 2026 13:17:17 -0700
Message-ID: <20260910201717.44891-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver claims a 40-bit DMA mask via dma_set_mask(40), but the
inbound/outbound ring base addresses were programmed by masking the
physical address with FSL_RE_ADDR_BIT_MASK (0xF) into the high register
and shifting it right by FSL_RE_ADDR_BIT_SHIFT (4) into the low register.

This truncates the upper address bits and, worse, places the lowest 4
bits of the address into the high register. For any ring allocated above
the 64 GB boundary the hardware reads/writes the wrong physical memory,
causing silent data corruption.

Program the registers correctly: the low register takes bits [31:0] and
the high register takes bits [39:32] of the 40-bit DMA address. Replace
the broken FSL_RE_ADDR_BIT_* macros with FSL_RE_ADDR_HIGH_MASK.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 14 +++++++++-----
 drivers/dma/fsl_raid.h |  3 +--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index befb4bb69d54..7343833b3b34 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -715,15 +715,19 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 		goto err_free_1;
 	}
 
-	/* Program the Inbound/Outbound ring base addresses and size */
+	/* Program the Inbound/Outbound ring base addresses and size.
+	 * The DMA rings are 64-bit addresses split into high/low registers.
+	 * The driver supports a 40-bit DMA mask, so the low register holds
+	 * bits [31:0] and the high register holds bits [39:32].
+	 */
 	out_be32(&chan->jrregs->inbring_base_h,
-		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
+		 upper_32_bits(chan->inb_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
 	out_be32(&chan->jrregs->oubring_base_h,
-		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
+		 upper_32_bits(chan->oub_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
 	out_be32(&chan->jrregs->inbring_base_l,
-		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
+		 lower_32_bits(chan->inb_phys_addr));
 	out_be32(&chan->jrregs->oubring_base_l,
-		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
+		 lower_32_bits(chan->oub_phys_addr));
 	out_be32(&chan->jrregs->inbring_size,
 		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
 	out_be32(&chan->jrregs->oubring_size,
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..748047996bbc 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -66,8 +66,7 @@
 #define FSL_RE_RING_SIZE		0x400
 #define FSL_RE_RING_SIZE_MASK		(FSL_RE_RING_SIZE - 1)
 #define FSL_RE_RING_SIZE_SHIFT		8
-#define FSL_RE_ADDR_BIT_SHIFT		4
-#define FSL_RE_ADDR_BIT_MASK		(BIT(FSL_RE_ADDR_BIT_SHIFT) - 1)
+#define FSL_RE_ADDR_HIGH_MASK		0xFF
 #define FSL_RE_ERROR			0x40000000
 #define FSL_RE_INTR			0x80000000
 #define FSL_RE_CLR_INTR			0x80000000
-- 
2.55.0

