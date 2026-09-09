Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190D4B4897
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996389; cv=none; b=oI8nCrQXWKqy/LbotuHmVrQPa4i51vnsh3vBbb/YgfzYgNze9cUWc5V3FVd1joE8HdKwmlXpCj/3kDnVkYnabeGQOFw4JZwBv6O1PZyRxJM6YAiwK8kwug98RmQDJEcZyl2nXCgZ1MuJ9/if56RcJvA9kZDXczWG3UDnKjlD5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996389; c=relaxed/simple;
	bh=vHVSTh8M1AwQHCmiA5uM6Py6FU6Hze6PbEnwhbzyPnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHGgXodcEmbBMjyBoqQXspHCXvI40+pvHyEZGvffKBNmTcxoa4DNG9JqJp5qQo158KDRYC5TGG5E+cO586QqQVt0jRWE9K84H3+QBqGTmfKDnB8szF/0tt4UKg8JkM+A+3pf+n/+VsT1I52J0V1EhQl8uV3lMifmUBnJc9ylJmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osk/E2pk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osk/E2pk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so6456099a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788996385; x=1789601185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEIm42tAeXbJp7ay2ok7KmxnSfwEm1dWuxKNMkog/7I=;
        b=osk/E2pkSbfu75txEfoI14yvSTgDXSEeStQs5NSf7dt9XLrkGWuZ2CRu0Bx/Bt4iqX
         ft5z6SoMmdcmA5EPsHLZhpzLmM2frAKes0VrO1XS5UPx/9Do6uU+zd3xCnC/JAy60EzY
         wMqFMp6ko1quMELdyjF9Rnc6dhuP6sVvMS5uyp+tsii7g/GTPgN/aULQCN+FiIbKL0Wh
         H2r8MPqcAU35LlJDyN6fM0UmDdulzmCFvmPBiYSyF1wyjLdjkjt5rvXKm56FXOqQsQvd
         yGGnRkEGxemZUBHjyOryuqdsklrmKP2dBe7eLsbybhPGolEJKYhATbh/w3lUqP0b5+0l
         bxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788996385; x=1789601185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEIm42tAeXbJp7ay2ok7KmxnSfwEm1dWuxKNMkog/7I=;
        b=N0XewLRKBAw4DRm8doSRtFlzq3e6m1dgeJqbLcHrXxp2nEvUb9y6MJCr6T13V53YXI
         CsQRURqndFKGzZLudM0lBl54rjl7d9AkezHXYKjuUfH9vtEJMrUTRkJbzZwhEg/s8SR2
         7YpKVwsiK0JvfnAaNxShaz1/XkDQp9ALtxD9uj8EaOB1eeXpP0EpHvzXeuiI+0oiw3qr
         wtDk/BSe0ZfufMUmeGVDizil/uEC4XGtN+pfTD2EotAv2PpGNd9bEZ1NwrVzprB3/XQ5
         D+AdgCl/pJhnjsHHDoHeptW9poARxC6hvDE+FedStdVlk9cT6vvh2q2kzlSYTedmgKil
         aIgQ==
X-Forwarded-Encrypted: i=1; AKwUvBycn9zB8W+YT0Rwn2BTgH/XcBa+KqHn2hHskZlbMPDA72h8ZOM1ga/i/uExX+N9DWV2OhyaMT5GBxd5b3I=@vger.kernel.org
X-Gm-Message-State: AFuF++lDkvtVYjHizP7rEbZWAF6+WLFlX2BsltnoKQyMeuS0c94Vg3pk
	J1RVJS0jMNArHIAL+yeTRjbjy21vWPIMu11qbNEruK5rBWt4mU93ZcyC
X-Gm-Gg: AYBFou0b0xelEXXqS3PjELL1PT7XROrY8nw7Vp5NbQ6yr53jzZYg2uL/rykGnrxi3VF
	kqf9Em1sLl7oOS2LYZroOZWHrac3+4nEU5SP2vwo+U5JWo6iuXmlnmBH5CY1eoB88EA8ikvlj6m
	IlJeqTRcjAHuiGrCEpb3X6t7cq6zugyUpfF6T6tUH1SAw8FeuAuy7OxxnvRTWjtJMSfdSG+tyR3
	bRhoBqY2hL/G7LeUfqfAHB/zpgR/BdNSNdqI8Z6sN8Q2O9CeO29Oy+OGpUzfFdVB6cIA0CxaVn2
	T3XgHO1QBduzTf/hzHMa4F/Cbh4wSXJZUQ+0/HfQA+jkUUhDlSJihw4LQxY2iFiYouNgvGUDS+C
	wgBG8sFV0ih+HNsqeMxl7sqkX2VGyPA4kQKtOTc5DgZUrQTooqF5/CLnQKiR4wrICNK1rROm6NV
	9OBbN0YvrOJdfL74Zm2gQ3UTYcaZnCduedVV227PrfDQSztojzKxgKgTsXrfQjLWfGnu3RFJBXH
	nJ4RkU14nPFrtfNmOQEZ4QZAhb4/xiFcjSul4fiSuTuUNhlfx0IQojH2eu3OipCbLjsF1cJDaN+
	1nKIGHwk0t4KahxaM39pCQNd0RCTVoJ1whU1V23YdtSec0cK
X-Received: by 2002:a17:90a:51e6:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39b4877aeb8mr27572602a91.22.1788996385063;
        Wed, 09 Sep 2026 16:26:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e8ad192sm442018a91.14.2026.09.09.16.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:26:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code
Date: Wed,  9 Sep 2026 16:26:23 -0700
Message-ID: <20260909232623.89321-1-rosenp@gmail.com>
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
 v4: fix subject
 v3: reword again
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

