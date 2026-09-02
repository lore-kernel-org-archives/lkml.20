Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86E4AFE18
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385585; cv=none; b=BrNF6JzvvgbSm5Anr56O7ieYaXZ1O7BHZkZAb91nuNwC/16gG8AiX33uMPxgn16YQYiTOss/LU3Romaij+pKyVZ+F6PJEnAhRCGrSyWAnvef9WBtXhuwgVWt8NjWzIX0GmpmxNOtefDyOfEQCoVlWq2wms1SnzVHFjlJuHHA660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385585; c=relaxed/simple;
	bh=5JwzSsfz0aQCzNb5RvVhNxFL9Ur0OR3IWCI47dZbe4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OmHpX230fWyMqW+oSbRwkT/D5GUE+lwG19jrBZrOmllsDSgtZYbVn+GMqN8ASlNyjlbSHqsThmcTWInnVCpoj5FpNvtFCOr4oHgaHcGT59R5cp9jD9e6BGfl7y3pZfgXr3XplkkaWv0STfOyOZPNn2f7uB3ppHxbkxJ4wIqIjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwmbJp+I; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwmbJp+I"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d560775ca2so14347505ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385574; x=1788990374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7K3SDtPyUG4Mgptm2ekLrg2N2MmRQSuElIMP3BqTu0=;
        b=KwmbJp+IX76yHoV8z38i+7ItXdZONlyEPeVdaZ1SIF1bxuehNgOub3+4fR/Xamk+lL
         sZyALfCNheStCfA56LV04rg535WXYNI8YBgIkZST/Sp02AZOylS+AWI7KM5va2V526Pe
         vN9IX0CJ+qGmVlvIbaskthWmfZnONga3tziQ2hiXH9GuKD53cOQnBR1y/BhaB/oTVwq2
         C3EAcpjiL/CB8K5iBfLr+w++bP/z1yTBJlt8NsPK0hzpWpDeaYHXOo+7mYOjiWCq6M8r
         HJq3/9FzrSqa9fVDNF8B4tfXH44r0hZ3ttCzTM5kYfR3utKIPuTGUFl2ghXW95tdEsA4
         Bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385574; x=1788990374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7K3SDtPyUG4Mgptm2ekLrg2N2MmRQSuElIMP3BqTu0=;
        b=FQPuOVec3n6s89d1qQrqnXJlCEQBalGrnGlXX4u21GALlLWlZ4+1/is5OMeiPT8ZKT
         gpjQ3UjSKuZZD/X+qA/YOk1JxggdkZgJAhiO6xtpSgkHJiVXXreXkaZLbeEp3rHoBux4
         JDvKDMgMoN92NbuMxg36ETgDDKy0Y4oeKfuz8XQABzbyoHZ6lwTGVSLcpXjtatIkcTOy
         6EXWDtar+sQJoN5/bHQgv935arGG0xl8pdTGnSNgVZ1qX+4bUuDtC/TEldsbu7ulAPae
         bvZKy22doIRj8Qy7UPFgXaZLpFneq2COmpEP07QV5cxHaQ4a454oPwrXa5kbxTBcqXm3
         UIcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnkpJZTFMt3jtrVifgasbNgRU+1AnNrMfeVeurGgnL+8ZgZdvTo2gBD6gvd00yPmEBRERyLfCjKpwiKpU=@vger.kernel.org
X-Gm-Message-State: AFuF++lwioeY9PLDNWuyR2sG/OdOcvweIK+Fj4qPHEuADQ6GVCo1g2nt
	YTV29kc/CIpxim00jPOZDdgXhN46nnO2yIwBW1iXc2Uid6qhfsqmpdyF
X-Gm-Gg: AYBFou2tHKVefP1bc7thUZEEzQl1bMxyE5ikSoMlmr0LBJBMXU1KF92Fi/YICjkG6OG
	rpgrOIcSbKo795OAbS9Fih8yx8FR26RjUhNvy8GdwyNkq6/Y7tTyjQeroX4uNYu5TT78NOy4pRd
	TIIzonllOaVWVa0Qrk8SwyK7gm8RX3ApB8YhdU7n1z5dAWGZrawB1kIpI75uBJGmMckIhV4hPtm
	iUs8A2QPck+wibLJYjDeIvBTxX74NDErG6pu9jqo5EpbLtA71/CUz1edpizMy32je1cLf3i9X4M
	HVxlHDSZxSWAu4ADhmhDLHRivo9PquVQpijxBOCw7NEomg6v7TlpytkvipTd6KsCyJQ3d/ee+gO
	iRuGNSKQKbCU2F9eo3wTbEfyufU89gXO+xrgKcV/2ZBk8SXRFTiGlFmvM1wOz/hxiXWSUrhpWgL
	7pDaiY4PAvd+31NnbIfJQzbxW2Bx1IqbSzVItHkKUEZAJ9BXQcLppuFZ49gBGmDH18WjiwHZh5/
	bTnqZ5FcxTPgSfz5TF9fVGRZWEiNa5TFqIHBoBzp+MgdlhTqzb5I58OV0+zZHqGtWxe1Xcgedqx
	XhCwS27Nr9MeX2vj8Tt06rkbZKOYgtixzUHPBA==
X-Received: by 2002:a17:903:1a2e:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2daec5f3489mr109411475ad.1.1788385574314;
        Wed, 02 Sep 2026 14:46:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec3becesm919285ad.58.2026.09.02.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:46:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: bestcomm: ioremap early
Date: Wed,  2 Sep 2026 14:46:12 -0700
Message-ID: <20260902214612.311207-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ioremap early as devm_platform_get_and_ioremap_resource() only needs a
platform_device pointer. Also avoid doing work before alllocating the main
 struct.

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies probing.

This also fixes a resource size mismatch between allocating and freeing
where request_mem_region() and release_mem_region() hopefully use the
same size but is not guarenteed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove Sashiko generated description. Reword description.
 drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
 1 file changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 432b43520ddc..44ff4a42376b 100644
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
 	bcom_sram_cleanup();
@@ -463,10 +442,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
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

