Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD03CFF5E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457338; cv=none; b=HweNcjuNqMogY6ilRe5UIAvqj82jF9W5G6HI73seDwj85NaWyFqFoPxROXj8JoaiiyrqOYBLc2Eco5sFqoHvDR7/wBLhNMX9DwSKhazfe8aRv/VteYhqXDvUYmbxaTKcvfJ9I1Saew9e91Wy+rhXWoOelw5zE0sjhfX7S8eeWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457338; c=relaxed/simple;
	bh=ViOm2eFn9tFqvab2VfQy56Xm4twQuY65GZKmkjCItOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HErr9Z6mk29Q57Bw1C7BFGznkz5I8hkTReA4GUdBzjPWbcUyi6bxVih7EY3zUyNeUFNGTzaZnLxwfkmuu84vDMr5wgN7yJKrILuwioT2EYuL9OIQ5db3Ww9U3qyNgjxPYaWmm3EXWn9P5Tu3AIztHT2VGscba0dI+TvJpQFyj1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCSJbg5J; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCSJbg5J"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so2086015a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789457335; x=1790062135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=656cAHswMFxYIdCF5i5z+ytblIV8nbN8fBlqWqxfZU8=;
        b=oCSJbg5Jo99d4xWE5HVk4qJQFxuJPQm7NvkYvfa/e4bgtCcoOomeqF8dlsvoXz/Dmo
         2KJDRytqvpm2pCWRodV9aMpSiFa5dGCvFebT2Wfx7CVBggn6ddW2VxU1mbcDMLXXukA9
         NkIJsQjGMOkfernPOyRtXi9oM4ZbYWFjQZA2+rz0DFO1mJWayrUZHsmVGoQxOv/c7Orc
         zR/IQePyOOZtarzPIu8OwZ2zCQtOD89dRImlQv9V8sh1d5oo059jqFN8uuJMmglea1j4
         8qy/VkLq98vd/XIg4TDUNK0fRTRXmQR+rlbWdOhj4LwMGjJf/w9BUZ965XaBORI5IPL4
         /+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457335; x=1790062135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=656cAHswMFxYIdCF5i5z+ytblIV8nbN8fBlqWqxfZU8=;
        b=aMhQAuiLFsGAjAy9TQ48q380LOJ4tkPshoW/4Q3WffqZy6Ixds4W7ji/XMbwUY4Z2h
         SCzOEmZcJkr6AkxYNcNC2Wf4vgKBraT/xaxbd9OSH+OUidmlsUph9qFXCBQeX2aroDv7
         yx8ydW/vqGZvdrNgIYuhyOcVAWXouoTKof0J7Rh1prC6cUEFZ8RaXA7a7u7HucAro4iS
         JMyhTeg7LmHjJ+9+rz0bP3VDuEDnaEIN9Y73Np/xB2CtG20+xuKGO0frxLVxuStEUA7P
         C7NDMrN4Mu5Yj10vlx2MwLNYQy+XLVvy/4Zq0WdPcMYdTpS81X92KN0uuYeSo4+deHCS
         nuBw==
X-Forwarded-Encrypted: i=1; AKwUvBz5KPTyonQignI1MZombeZEfnlzBGrDLrzezCRPZFV2AZvaqdTfrkyBCHmYBEVmYB2FHVgSE2yaCyqyWhs=@vger.kernel.org
X-Gm-Message-State: AFuF++m5fGZhroQGsXJWLDHPwKe7v1T5GLIB/hYzJujkLwhq8GPh0ik8
	pSSjOZwAywF5pZ/iO07YoIlIUCPnZP8AWrOtwvcIsKseML2GZ7J0mN0+
X-Gm-Gg: AYBFou3qZT1s0FBq31H9aWQ2Eeo/OjjEe27dl4n3dkKGkO6PD77G4lorHux9gEGih30
	lYKsLbCnn4g76Ekpcz3JVClElSN2Gu+lVV2XaDhb6cNjjhlpdszJiGwZ5s6aZMbX4fChojfaNAr
	TKGp+8Zrq/p+Dc0Dw9pu5r8y0tYMlfiAIZrIpW4kxWrL9s3D9NQEyydvabOswfHibQWd5LdnqCw
	NqXlr0QttsxXje9wPM2qZ5/VKZVEpUMf3hJriDAKfYjWqnvyajSsASkGxbB+VKtFS9xwTUvRMHB
	hxtnvff603RHDtqG7ddfGsontdUs9LTeohth68671BciWrMIeVjGEuwtqfjnYboAPI4BF4VcQWJ
	ba9LbnsO+KleY1Ml6T7Tj7KF9sSGvErMj6IZE7qwllIRQOxXx0rfeQ4EE5k8OK3GPwiJdVSzk61
	0m57h5Ic0b0ddDHNsX5VMWJPrj4bfgMVa0xOzKWTOI4tMtg4BvK2BFwIptR7SvlxINcTztfL0F3
	G4A23vUFK5xdMc6diyFgZDxNiOFhHIV8nY+k1GAK7Tx1NVtqaTGJ8QJm/YHnTMgGRN6DcGQyN6o
	MyPexzYySUVq6LmtuvPE2WCes6NAaD8Nq1ATcCm86bzvWRmoBA==
X-Received: by 2002:a17:90a:4ce5:b0:39d:e523:8f3e with SMTP id 98e67ed59e1d1-39dec170bb0mr8491853a91.3.1789457335290;
        Tue, 15 Sep 2026 00:28:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9c557asm3558205a91.2.2026.09.15.00.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:28:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv5] dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code
Date: Tue, 15 Sep 2026 00:28:53 -0700
Message-ID: <20260915072853.58587-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies probing.

Fix a resource size mismatch between allocating and freeing where
request_mem_region() and release_mem_region() hopefully use the same size
but is not guarenteed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v5: resend with PATCHv5 this time.
 v4: fix subject
 v3: reword again
 v2: remove Sashiko generated description. Reword description.
 drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
 1 file changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index ec58d2c6573f..241a91936fe8 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <asm/io.h>
@@ -365,13 +364,19 @@ bcom_engine_cleanup(void)
 static int mpc52xx_bcom_probe(struct platform_device *op)
 {
 	struct device_node *ofn_sram;
-	struct resource res_bcom;
+	struct resource *res_bcom;
+	void __iomem *regs;
 
 	int rv;
 
 	/* Inform user we're ok so far */
 	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
 
+	/* Get, reserve & map io */
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
 	/* Get the bestcomm node */
 	of_node_get(op->dev.of_node);
 
@@ -402,35 +407,13 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	/* Save the node */
 	bcom_eng->ofnode = op->dev.of_node;
 
-	/* Get, reserve & map io */
-	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't get resource\n");
-		rv = -EINVAL;
-		goto error_sramclean;
-	}
-
-	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
-				DRIVER_NAME)) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't request registers region\n");
-		rv = -EBUSY;
-		goto error_sramclean;
-	}
-
-	bcom_eng->regs_base = res_bcom.start;
-	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
-	if (!bcom_eng->regs) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't map registers\n");
-		rv = -ENOMEM;
-		goto error_release;
-	}
+	bcom_eng->regs = regs;
+	bcom_eng->regs_base = res_bcom->start;
 
 	/* Now, do the real init */
 	rv = bcom_engine_init();
 	if (rv)
-		goto error_unmap;
+		goto error_sramclean;
 
 	/* Done ! */
 	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
@@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	return 0;
 
 	/* Error path */
-error_unmap:
-	iounmap(bcom_eng->regs);
-error_release:
-	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
 error_sramclean:
 	kfree(bcom_eng);
 	bcom_eng = NULL;
@@ -464,10 +443,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
-	/* Release regs */
-	iounmap(bcom_eng->regs);
-	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
-
 	/* Release the node */
 	of_node_put(bcom_eng->ofnode);
 
-- 
2.55.0

