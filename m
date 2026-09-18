Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626F2D5436
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690731; cv=none; b=KALO9z8FOkP/PiN8cLMh06c+B6w7cf9//8+VAX//oRqnPlI8KmEJRvfomcN9Y8mTBFEcs9cXlAUnRY9dzELZ2DlFhwMjOMk3Sjt2CZ3nuiqDtIMvGxqET0YKRIalOO50XK9Bzj/fDYgKg1YOpAco0bGWAhHl6L7k7RtibjcXqKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690731; c=relaxed/simple;
	bh=Y1uP2/lYugyfCN+2I4UkWTh4Usx2avGiTdd9cnbd6Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WqFCB/1HA7hwXj/0kGVhezFL5sDrEs9rq0ACmsK+BDIKlsHuv37zhgTtl7fgmU/a2howds6ONuH1xMy8rnpJaCaYHBESkUBPGYkxTcD2x7VWrRG4IWsRjFOdmpKDMrMsf/01GaIUgFUwDOpRWSxvY6kaja47B2LwyBQ8yDYIL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2Kpa/9U; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2Kpa/9U"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso35400a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690720; x=1790295520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=;
        b=S2Kpa/9U8Mb6TaXMvb73pFErYSPdcgvTRhWYJJR9Oyinil8e64WnVfZhIkNQHnCozK
         9uFjQzf4DKTXrr3HaR3F8ZTXyqAHqJxRgGhHndm1sNdvW8pcxX3kUY/tDGoeS9CmOJuB
         yK5BHoMxpwcm+S65QcZD2Cu3rKKQlfDmWpvtXsq915MT0/57Wn3giyhPWoQBBy4r7/yz
         ANxxGwrCdXj5TfVhP84qR6N4oPTcWlA2xPd3Q8rOT9cXvgSw5Ey4OVehdWLtlg9z/0li
         yjeKx/vEqXgj1Cj86xOWajdEGMnTbJBAxNes2aoHZEwfqip3To4tPSlxCsXsGpmsj/64
         dZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690720; x=1790295520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=;
        b=J2BGe1a6Z8IneLb+iZiNkML69H5W5UQ88l9pEF+nVP7pXaQqDX8z9b9WZTLDdPuQZx
         m0BzWeurIPnIYqBWVAuAAoh94kLNZt4+dTY4V8ItbjOWWnAprxh24CbNsy+BPtA9W9XW
         dC8TQCJd6WKqskKVpyFaxsbwy2lJ20pnvv2CPN37acCAKHoesnDD5UVZwWrLq3eVZVPN
         NYA7iEf6AEyPlOEPFKca/ofUrIw20NWEBQuhrDePfsu0HYaXrmSXeggKJ5/SZxpIBJ1O
         /+xWLdALdemJU8GKbWvWTg0diBSVvKm0+FklrM3Hyp6lV2q7worW1dOsLgm5ihBYrtOp
         mweA==
X-Forwarded-Encrypted: i=1; AKwUvBwS3xPRWQ999vAtapa7l5bBQ2DJhsps6u76u9JtjQbQoKxxi9dOl+UA/bXwOuyWqjFi052EDqXyZfwV9tc=@vger.kernel.org
X-Gm-Message-State: AFuF++mly4e99HHqrziyH28R0Me7bKpgPiCQXG2LQZiYND7E804d4SiY
	Tn2l9adisG728oReywZKcrukUQhPPAf62Mu9rv1IQId4EC7rAwcbnSIn
X-Gm-Gg: AYBFou0+340+O748TdYURwy/+hNMpJKh1+R7WOqTWBnMUwaeRpR8Dp0PYlkiaD98du4
	4oqBXLRMRxZMTyLq+HivFbz0Gm7bLw+vGdSAa0g7CFvxhe2kkuGl8kdN8nGwn9ocBLqQZ1Ou/Dn
	ZgMVPKgbpyE8NlJJc5J21cns5IJ1c++DhamUIzCwx4RY/i3RKZn2c+ju1eiw5NGydSJTos0WLAD
	+iq/425TxAe+mCUpHFuAX5LMwtiubHCc6UwBXXHX/mNVfNrmkDHavk3oiafrEwlxFMNtliYla9j
	VHowLJ+xKLOKI9SkSnCODgp4iRLNP88yWBZTJ6sR1vepLEnIcPqxOwXYjS02iZKlhNpHpzCFtqx
	QC/eim+A6ixymroIjPwkUR8EJPa7m2zeeQyFT5tKuxL6gJLaIwQPtB0zLRf5hCvNJT2a5F7HqQg
	eVwYiQ5iVUv5zx+cYrFVWttWNohoYay6171g5TXf2wPbvAS0dQKK3YlS6YbD4/fEH3LLWWEdlfe
	TOBOBUNnGi7UaaXwf9bVU7xZdrIDR9syWz3gEAGpnzB4Rdi0gq9PGMNhMNE1U6BjDEPJNBWWEyM
	3GmAeXdVs6DGHGYXm0P07TWuLeJLUlVzmyzT3Ef9XxFlEPSf
X-Received: by 2002:a17:90b:2886:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e54d564ccmr1600831a91.25.1789690719570;
        Thu, 17 Sep 2026 17:18:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55a0e7e2sm337468a91.4.2026.09.17.17.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:18:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv3] dmaengine: bestcomm: use platform machinery to get irq
Date: Thu, 17 Sep 2026 17:18:35 -0700
Message-ID: <20260918001835.154305-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() avoids having to explicitly map and dispose of an irq
by having the platform_device machinery take care of it.

This requires replacing the device_node with a platform_device in the
bcom_eng struct so that platform_get_irq() can use it.

Conveniently, this also allows getting rid of of_node_get and
of_node_put as the platform_device machinery also handles that.

Adjust the goto labels in bcom_task_alloc to match what is being freed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: drop stale description
 v2: resend
 drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..1006030ff167 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -47,6 +47,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 {
 	int i, tasknum = -1;
 	struct bcom_task *tsk;
+	int irq;
 
 	/* Don't try to do anything if bestcomm init failed */
 	if (!bcom_eng)
@@ -67,30 +68,32 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (tasknum < 0)
 		return NULL;
 
+	irq = platform_get_irq(bcom_eng->pdev, tasknum);
+	if (irq < 0)
+		goto err1;
+
 	/* Allocate our structure */
 	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
 	if (!tsk)
-		goto error;
+		goto err1;
 
 	tsk->tasknum = tasknum;
 	if (priv_size)
 		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
 
 	/* Get IRQ of that task */
-	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
-	if (!tsk->irq)
-		goto error;
+	tsk->irq = irq;
 
 	/* Init the BDs, if needed */
 	if (bd_count) {
 		tsk->cookie = kmalloc_array(bd_count, sizeof(void *),
 					    GFP_KERNEL);
 		if (!tsk->cookie)
-			goto error;
+			goto err2;
 
 		tsk->bd = bcom_sram_alloc(bd_count * bd_size, 4, &tsk->bd_pa);
 		if (!tsk->bd)
-			goto error;
+			goto err3;
 		memset_io(tsk->bd, 0x00, bd_count * bd_size);
 
 		tsk->num_bd = bd_count;
@@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
 	return tsk;
 
-error:
-	if (tsk) {
-		if (tsk->irq)
-			irq_dispose_mapping(tsk->irq);
-		bcom_sram_free(tsk->bd);
-		kfree(tsk->cookie);
-		kfree(tsk);
-	}
-
+err3:
+	kfree(tsk->cookie);
+err2:
+	kfree(tsk);
+err1:
 	bcom_eng->tdt[tasknum].stop = 0;
-
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(bcom_task_alloc);
@@ -125,7 +123,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -377,16 +374,12 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	/* Get the bestcomm node */
-	of_node_get(op->dev.of_node);
-
 	/* Prepare SRAM */
 	ofn_sram = of_find_matching_node(NULL, mpc52xx_sram_ids);
 	if (!ofn_sram) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"No SRAM found in device tree\n");
-		rv = -ENODEV;
-		goto error_ofput;
+		return -ENODEV;
 	}
 	rv = bcom_sram_init(ofn_sram, DRIVER_NAME);
 	of_node_put(ofn_sram);
@@ -394,7 +387,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -405,8 +398,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
+	bcom_eng->pdev = op;
 	bcom_eng->regs = regs;
 	bcom_eng->regs_base = res_bcom->start;
 
@@ -426,8 +418,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	kfree(bcom_eng);
 	bcom_eng = NULL;
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -443,9 +433,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
-	/* Release the node */
-	of_node_put(bcom_eng->ofnode);
-
 	/* Release memory */
 	kfree(bcom_eng);
 	bcom_eng = NULL;
diff --git a/include/linux/fsl/bestcomm/bestcomm_priv.h b/include/linux/fsl/bestcomm/bestcomm_priv.h
index 3b52f3ffbdf8..cddde7c74cb5 100644
--- a/include/linux/fsl/bestcomm/bestcomm_priv.h
+++ b/include/linux/fsl/bestcomm/bestcomm_priv.h
@@ -66,7 +66,7 @@ struct bcom_tdt {
  * This holds all info needed globaly to handle the engine
  */
 struct bcom_engine {
-	struct device_node		*ofnode;
+	struct platform_device		*pdev;
 	struct mpc52xx_sdma __iomem     *regs;
 	phys_addr_t                      regs_base;
 
-- 
2.55.0

