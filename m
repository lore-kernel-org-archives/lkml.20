Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE042D75F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164404; cv=none; b=tVhJgeM5bOmw00dHCzyChMoIRdm7GGUk2Sz3A8JMAsY1HGriY+f80CJIQuoHRRzY7Z561oBE4Dzb+uy6YZmZjVOkkxLJ8jniVd0S55u+vU74sl3VY0kRWjvEtHlfF93RnS7KXvAwj5vHml4iKEVCGYZ6gTuTtO136qh6APazTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164404; c=relaxed/simple;
	bh=aToO4pp8C7M492LuZqiVte8e2Tu4lbhA5eT7W+4ZbNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H04NnqDXuNS66Bf2qHqMZlRAj0wrtGq/ojdpaAhQNBw4zW9/M0ycJY+OhJ/QpiU4ykOJScHB12XVtj6Q/4ubVcHxx7sv/o/Du70pQETpQkbQ3WVkYNtL+LgZG/V1vhGanH6rlZm4NAUxYbv0j34qEBi9wRugw3jDMDlstQL5CHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPFseqjZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPFseqjZ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so398495ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164402; x=1789769202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnH05WBvR/80ATWuPrHor+2LYakQx2ATwEyMS0URpoA=;
        b=nPFseqjZsrrDLE5vdfrynjpEIjO71l9a6hWuJIOeRlENyrzsE9R1pIR//67qqX6wiv
         JwUdI49YfnuSv6UvI9GChucjNlUENcanD+RQ4CrMksuUIeP+8tHJ1IOggtsM5nTfy0k3
         YtpMH9Zf9y9WXj1EJS7mJf/Ux/Q10RipfQTPqG1osYvn8qdLeJkN/u1eG2C+btkLR2vV
         cym+92irSjuj61HbrG6QBk/rHSqRTiKXfBeCc3gL7oy8CIRTzx4MwZ8J8Q7Z9PZcksUs
         a1a0jvvQIxe2S2vQb8pniZDKrZeum0DjgjiDrRzb3PLrxfWvk0u/o3caO70fw8KdplJY
         rZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164402; x=1789769202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnH05WBvR/80ATWuPrHor+2LYakQx2ATwEyMS0URpoA=;
        b=FezUtvd6CK4VR8GbbJaBbOh352zZxt+ohXt0CAUAMHltJ5MpYy4kIwy/uU4wyhd4UC
         u87m5yH1FXBbWmVGPfVTD6IKiMLbnoiUamVz460pXkrLLCJEtiSRSRnGVzhcz9Dc0Yjt
         MrTai3VkcNYi7vwNa32B4acT1qqhYFDfGc0mnOswbru6Hdt4eO+NP7kazZ/Im8Ga1NuC
         IqtHNNCiO573IYBL+PwoWjC0bmZzSKIivtHej9zA8eQmw/bTbkNprPAD0+qIT+HNkCKM
         O+/SUVQJSq65/tcD8YH0CnAAiW/TYxXkMP9QRa1ygLY/tY+WR+txTRlwKTTWYdiAfrK0
         cI2w==
X-Forwarded-Encrypted: i=1; AKwUvBzO4GwSZYP2JnjrvSySiESzIZNBbZ17c+ho4fx1Ec4MMV1ve1EE6pi49dW9Pc1HnSe2q+5RwVVTkzgGPy4=@vger.kernel.org
X-Gm-Message-State: AFuF++kQgyFfLToY0qk9ZFYgUXkDemRx+cXxNI3Y+FQWMFedNsrCi3ke
	K8DJS91WeckOTLmM7P5r1BsQZVQ5NhkRP1kFrX/xQbIHgJsX3sonThK9hhyKdw==
X-Gm-Gg: AYBFou1hVA/fDwMnt1tkv4GWir9Jf0l57hYB67ppiF03rKBvXwgl+5btjYj+q7dSeOA
	YewNFlx/0lZaRK44xapL/jVw4iKN0/st8ew8+5SQypGhRj3O5fM26WshuEvsJpARow0lXmI7C+2
	fnypQizghZ5nlMoRNCuS6TKBPMpSlL9eGEyY384eFOKp549sHIUk/HXr9b+InSye2lE2tQOFTT8
	oSlifQ/ZmOcYsATPifrT77mwvu+dTDdX2Y+iO7T/ll6JFL/IjAI8LuDAq27k+KY+w6W75A/Fz0G
	AO3Mk/twnybQYF2wOvC1MtVtsWdT0WtR2ywp9sJZtGGUJU0KePVeLzQXMis3d8lOrSPaAVsjeru
	NTG+8YXN8ZVy1cs9cOHZDcfVv5VKsbR29oMo6ww6QQISnjAA8JI3toaYOZZ5r/3EII+hmKcfQPw
	OY1OzEo3V2GKEn/xyxyu7FD9CPAbLTMdTM2Hc0rePf7ZM67kYbd1eBttojbP5UUZcGz7QxH12uj
	KM/Zc4mi1/XqsTrZkMiXWblUdbgH96rgqpoQYjlN/0G9gMBMDnTHDZzH0UGmhje5b6lxS5ApTOF
	INYgyO3K6U1Kt2TpLvvQEO8W3nqRJEvb2sxtnBwresFe8uLUqA==
X-Received: by 2002:a17:90b:4b0e:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dbc725258mr311632a91.24.1789164402015;
        Fri, 11 Sep 2026 15:06:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d58adb5sm2091295a91.3.2026.09.11.15.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:06:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
Date: Fri, 11 Sep 2026 15:06:40 -0700
Message-ID: <20260911220640.178074-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded sequence of of_address_to_resource(),
request_mem_region(), and ioremap() with devm_platform_ioremap_resource().
This eliminates error-path cleanup for both the memory region and the
ioremap.

The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMREG
are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
both steps.

Also emove unused PPC_ADMA_INIT_MEMREG enum value

The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
to devm_platform_ioremap_resource().  Remove it from the enum and the
corresponding error string.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: cut some stuff from description
 drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 39498779e241..17b60704a702 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -37,7 +37,6 @@
 enum ppc_adma_init_code {
 	PPC_ADMA_INIT_OK = 0,
 	PPC_ADMA_INIT_MEMRES,
-	PPC_ADMA_INIT_MEMREG,
 	PPC_ADMA_INIT_ALLOC,
 	PPC_ADMA_INIT_COHERENT,
 	PPC_ADMA_INIT_CHANNEL,
@@ -49,7 +48,6 @@ enum ppc_adma_init_code {
 static char *ppc_adma_errors[] = {
 	[PPC_ADMA_INIT_OK] = "ok",
 	[PPC_ADMA_INIT_MEMRES] = "failed to get memory resource",
-	[PPC_ADMA_INIT_MEMREG] = "failed to request memory region",
 	[PPC_ADMA_INIT_ALLOC] = "failed to allocate memory for adev "
 				"structure",
 	[PPC_ADMA_INIT_COHERENT] = "failed to allocate coherent memory for "
@@ -3997,7 +3995,6 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
 static int ppc440spe_adma_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-	struct resource res;
 	struct ppc440spe_adma_device *adev;
 	struct ppc440spe_adma_chan *chan;
 	struct ppc_dma_chan_ref *ref, *_ref;
@@ -4040,28 +4037,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 		pool_size <<= 2;
 	}
 
-	if (of_address_to_resource(np, 0, &res)) {
-		dev_err(&ofdev->dev, "failed to get memory resource\n");
-		initcode = PPC_ADMA_INIT_MEMRES;
-		ret = -ENODEV;
-		goto out;
-	}
-
-	if (!request_mem_region(res.start, resource_size(&res),
-				dev_driver_string(&ofdev->dev))) {
-		dev_err(&ofdev->dev, "failed to request memory region %pR\n",
-			&res);
-		initcode = PPC_ADMA_INIT_MEMREG;
-		ret = -EBUSY;
-		goto out;
-	}
-
 	/* create a device */
 	adev = kzalloc_obj(*adev);
 	if (!adev) {
 		initcode = PPC_ADMA_INIT_ALLOC;
 		ret = -ENOMEM;
-		goto err_adev_alloc;
+		goto out;
 	}
 
 	adev->id = id;
@@ -4081,10 +4062,10 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
 		adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
 
-	regs = ioremap(res.start, resource_size(&res));
-	if (!regs) {
-		dev_err(&ofdev->dev, "failed to ioremap regs!\n");
-		ret = -ENOMEM;
+	regs = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(regs)) {
+		ret = PTR_ERR(regs);
+		initcode = PPC_ADMA_INIT_MEMRES;
 		goto err_regs_alloc;
 	}
 
@@ -4121,7 +4102,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	if (!chan) {
 		initcode = PPC_ADMA_INIT_CHANNEL;
 		ret = -ENOMEM;
-		goto err_chan_alloc;
+		goto err_regs_alloc;
 	}
 
 	spin_lock_init(&chan->lock);
@@ -4214,19 +4195,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	}
 err_page_alloc:
 	kfree(chan);
-err_chan_alloc:
-	if (adev->id == PPC440SPE_XOR_ID)
-		iounmap(adev->xor_reg);
-	else
-		iounmap(adev->dma_reg);
 err_regs_alloc:
 	dma_free_coherent(&ofdev->dev, adev->pool_size,
 			  adev->dma_desc_pool_virt,
 			  adev->dma_desc_pool);
 err_dma_alloc:
 	kfree(adev);
-err_adev_alloc:
-	release_mem_region(res.start, resource_size(&res));
 out:
 	if (id < PPC440SPE_ADMA_ENGINES_NUM)
 		ppc440spe_adma_devices[id] = initcode;
@@ -4240,8 +4214,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 static void ppc440spe_adma_remove(struct platform_device *ofdev)
 {
 	struct ppc440spe_adma_device *adev = platform_get_drvdata(ofdev);
-	struct device_node *np = ofdev->dev.of_node;
-	struct resource res;
 	struct dma_chan *chan, *_chan;
 	struct ppc_dma_chan_ref *ref, *_ref;
 	struct ppc440spe_adma_chan *ppc440spe_chan;
@@ -4278,12 +4250,6 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 
 	dma_free_coherent(adev->dev, adev->pool_size,
 			  adev->dma_desc_pool_virt, adev->dma_desc_pool);
-	if (adev->id == PPC440SPE_XOR_ID)
-		iounmap(adev->xor_reg);
-	else
-		iounmap(adev->dma_reg);
-	of_address_to_resource(np, 0, &res);
-	release_mem_region(res.start, resource_size(&res));
 	kfree(adev);
 }
 
-- 
2.55.0

