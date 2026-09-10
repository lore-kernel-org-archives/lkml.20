Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D6425CEE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074902; cv=none; b=kI+N6725ayEWcIDkZFgYCGtRvNWZhCjcPjVcTJV1qk5rISAYKqjVfmKfcbP4Gm0Eb83FyPdm9lHDQG0y/FWGhLI3cTnZhNa0sxsC/9qVfDUAkq4u6xwEf1dFhQJvSqmvFnHKWqVFmpCc8kj/DYGy8HhsSWlo/U/7o+oZHVIzHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074902; c=relaxed/simple;
	bh=MH2yDJ/tFnb+zFtp0k+CRfg+1XKdo8LeVSAM8XFURV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGSX+Ph6VFmrEf+mdZSnze85VdxTWyibj6AMhU0Y3YvI4vcniXXoARiAvysigThPNL1HXapEMSG7tv+KDTqonKOTglvAu+p8QjCZI1VU51R3M/9k+clccGPap2qz0Ir06fpD6nL/w4TChHGpkNg7nPfdZwpntyy1EGqmfHLIW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7zXX9+4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7zXX9+4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so246360a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789074883; x=1789679683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fw41YnGlMHWt+H96gIB8JgQsPZ3KBZUxezlstkenKvw=;
        b=R7zXX9+4wrlJasf7HV7EQoGKl8s/C154vY76IHyvxJQvrb/f9bqwRiyo/kgL3Z/NyV
         cQvov0vA4SNFK4ZunMRO5uHX2mcyEIqxX7uOiu7sD4LYQvR3QT3AddTAD0xyx2OQiYwd
         LTm+U9dWAMtX1KSRpdeoaReoJgiO/OQFlhOs9YJkIqfdTntuEZKfCI3KNMeTGGBhdDqZ
         r7IfcnijMRlv+ok7FKyF5hCoUp2NNz+E3/7PP7cweHIUJZXEeF363IMUvPieruvdmuAe
         RoDVmFqTQEpaZgdyCvPTs6NbJ3fADsG8++rTwxXoHhLI8A3WgIiX4NILujUwL5NUZRBb
         KZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074883; x=1789679683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fw41YnGlMHWt+H96gIB8JgQsPZ3KBZUxezlstkenKvw=;
        b=JHmCdJ4LN+pwUD4gdp2oES6CsHZKDzKiGMzh8kE1E91GLt27cR9+UnC7dnq2XNoNUU
         mhl1vqXQ7Us1iY7X89h6b6IW0r0bhwIn1VZKoxNBPmYQD1MO4NbKiokgomZ5WHxv+yg1
         LHOcbk4tkjiMBqyKGy0S3/Q0zNQUauOb9SFYDUeCcoWggH11mah8s3doeKXdEnVv3G4A
         g1BycARggLSUE7MXo0ia9kbmx/ZS2OJsh76DyTRwFOZ/UYo8IsdoPOMeL05eOJhulLS5
         AZd/migtSGYTLh/2THBrb33szUHad/wB8+NiqlUQvKKVIPeg6WVkfbfLt5CqMhP0aUK4
         WeEA==
X-Forwarded-Encrypted: i=1; AKwUvBzle2bBdZ4a6cEroFcRdr+a13yybjw14+hyFSBQMJCVhPSWiSIbHB4YMN/gszfnCuJUI1GrMlsiOv0htRg=@vger.kernel.org
X-Gm-Message-State: AFuF++kmwJCw9W6CIErBg5ipIq13PEW4IPgkjcp/zpoPjxwLSA/hOxhA
	WtW8kvFAnx+ITW+OvIJlrsodcqTPVali8nbCfMiKZ776/1U4jg24yz3/
X-Gm-Gg: AYBFou1eABNHcaj6o3mjLIaKKnh7dSK9hfJW5M/5eDkZBTRfn8bh4UVBWDRwHpUlmeK
	qAsxSe8pAlM6I/MrTm9FKfnihn9nEcs5Jl/IGZKFhldghH7bTULlTeECI6AEaQ1YUXEaLtpfm/z
	xm4BvlPVMPi6GdURFYvx5mbw3YZooov7DlzjHk3r03zMa1tDWeKDifQEWxDGUrpHJoZK5oAWnGu
	5oB1zmh0uJ+uEIsEB9Oa54oSdjimbNkYiisIs2yfo8Z7HjGNTKf0ZL4Ku2k1104IVvMIE7Api/K
	qet4cAX0scaHi5FZ3p7xJrb2LuMDIIVSn1DfigaahUOXKbbMCWHUdFgtWT3gbgLKW6KgSQnmSTR
	ZwBlLZGEJF49eGubNB0J/Gm0Wqm6bweRjpGIRJWFlmZgSgdQ6sWilDZjM2SLoMRf40pYRFvNz0P
	XMucy/51qI5qr2CKDVzjjjxkPVU+gP4CULXyvPnFty+YdDKgRqsmWoNi9PWVUAQ93aX9mBqHDeE
	ZSU4HL6JcW1sUCFlJrx9UtqzVvTEirb0Js0Kfa+VNuz5TUSFKF4VnywUPmrVK/RyrbFsSaVFgnJ
	/pPSZckgYpblKRs9ABw5FfHaVxjmsypFZ61y+Hf1POI1SjvA
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39d9c223eb3mr998245a91.21.1789074882649;
        Thu, 10 Sep 2026 14:14:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm1359226a91.3.2026.09.10.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:14:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Yuri Tikhonov <yur@emcraft.com>,
	Anatolij Gustschin <agust@denx.de>,
	Dan Williams <djbw@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: fix format specifiers for size_t arguments
Date: Thu, 10 Sep 2026 14:14:40 -0700
Message-ID: <20260910211440.65618-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
format specifiers for size_t arguments (len, pool_size).  Fix them
to use %zu to avoid warnings on 64-bit builds.

Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma driver")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..bcc54d584e2b 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, int src_cnt,
 	if (likely(len <= PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
 		return slot_cnt;
 
-	printk(KERN_ERR "%s: len %d > max %d !!\n",
+	printk(KERN_ERR "%s: len %zu > max %d !!\n",
 		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 	BUG();
 	return slot_cnt;
@@ -1989,7 +1989,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_memcpy(
 	spin_lock_bh(&ppc440spe_chan->lock);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s len: %u int_en %d\n",
+		"ppc440spe adma%d: %s len: %zu int_en %d\n",
 		ppc440spe_chan->device->id, __func__, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 	slot_cnt = slots_per_op = 1;
@@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor(
 	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -2279,7 +2279,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_pq(
 	unsigned long op = 0;
 	unsigned char mult = 1;
 
-	pr_debug("%s: dst_cnt %d, src_cnt %d, len %d\n",
+	pr_debug("%s: dst_cnt %d, src_cnt %d, len %zu\n",
 		 __func__, dst_cnt, src_cnt, len);
 	/*  select operations WXOR/RXOR depending on the
 	 * source addresses of operators and the number
@@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_pq(
 	BUG_ON(!dst_cnt);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -4077,7 +4077,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 					adev->pool_size, &adev->dma_desc_pool,
 					GFP_KERNEL);
 	if (adev->dma_desc_pool_virt == NULL) {
-		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
+		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
 			"memory for hardware descriptors\n",
 			adev->pool_size);
 		initcode = PPC_ADMA_INIT_COHERENT;
-- 
2.55.0

