Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F0946EF75
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346299; cv=none; b=aKxkMPi/apbCxKDflgSMeNj+jV5jvqyNxQrDQa0v8gajtHnD7nKb9uwNRLbW61nHL6sicp8c2AwiJnaOfyahs2jamQ2MqjC+FHjQuKHpM26Is4MJrxrRRmmqnzPLeLw4xudleT926u9faaW0r5bQ0Iq9Dzz2abBXNNXWC032sX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346299; c=relaxed/simple;
	bh=IR5a7dw8niUl1D2oqM5QJBMPZf1MLc6PkEbzReKAZA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rOlxaQa43+mZEPlK9bC09uiKCLsijsXdJS9aQ1EzxOmkd4Ba4Cx8L5FmM25GErwcu+rboX3g4ynCQ7SP+Z8rNu+uNlSw/eRul0ZFeZyTY+9D+RCwFCtuw0lqRc2pXeigRhd6qYxtYT8IWwQcSRtymQ2d3JQIHt7yM+81rE6rLss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WXuXAD+N; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WXuXAD+N"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493fa6e28a7so8375245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346279; x=1788951079; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1wC9u3twhPNjqquLWPyT5Y0R6x/ILvd7DMTdNgZ19s=;
        b=WXuXAD+NsAQlcuemeby70nHcrjsZoBBMWjHzvJF9i0K/iI3X6b+YvlfPk3Vah9xNlD
         f1wilQQd0JZ9zCAsQBBKbYBVc05hEDXHEUhQ48ccCmLqaN32LLsFVLx9NAOi7yZcOL35
         UancxbOuVa0q4/lFgGIIuyYQ18rgveak81+CQP3SYHKyTp3C7cXjAQHoOydlU70n3i1T
         pGSXps3GZvdIfe/s4swNy/FnbnylWaVo5QypyZe/SasCdz/mQ9Z1phjNGK0IxoWTmFzI
         1LbpKa+OjnFZ2dc/CXDW1wEJs6m9e6RykuOF3/xeZgxpHR3a0Ibo93wd9NNsfhGlyDkT
         GnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346279; x=1788951079;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1wC9u3twhPNjqquLWPyT5Y0R6x/ILvd7DMTdNgZ19s=;
        b=oRJaTo8hVf2u17dqLA85hZ7mX2wk9upiaH92O4z46ma5qaEFFpK9NY2u41V9DKyhMf
         oldGN2rx18Vo/1JVLjhGZB3on6Ip0LYa+EE2VeQTHmUPxkEYwpi07Iw5OAB+qMJb5XDS
         8FJPhZfSc5DRkgnSNxvhADQGWMt7XLAqxEGcjxYTNJc7odRkUgjZVYoJ9zefHRtdukdA
         SNKQy26kK8hYPh9IrZrdIiXDDzmtXpTJwKB1RqclmwJB8WVdU4vSGPMzvG+UI7nvAbIt
         RmgYE/OCBAjyt00I3j3FnPS2xAbccB2EN09/yTdalxkllqqWep+oJEzpbfGy3A7e1BAh
         3rGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Zc+WBa2UbT8XLNqT14AM2g/XqRT4aYAHyu9CI4ID1Uh5l4xEoSpXwKGvgcudxqO7HeIUeqf3tjg4itc=@vger.kernel.org
X-Gm-Message-State: AFuF++mXHKS0P/4SYRvN+KEes2Kda6o6/U52/oYuiOCr5qmTgX/g2NZx
	3lTKs3/tQpFyA+yYUaDAUkVCv5dlqyuKAEjZjwtIZFlaLUmCt9v+dUkuCI6nLsvlCzfyBf9fwKi
	R1FyrJ5IykM82Rj3iRtqZww==
X-Received: from wmqy14.prod.google.com ([2002:a05:600c:364e:b0:49c:ca29:c0ed])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5653:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49ceb17cff4mr15337645e9.8.1788346278647;
 Wed, 02 Sep 2026 03:51:18 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:12 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-11-vdonnefort@google.com>
Subject: [PATCH v9 10/10] optee: Add support for arm,ffa-lend-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hook OP-TEE dynamically allocated protected memory pools to the
"arm,ffa-lend-pool" driver. While the SMC transport platform device
resolves the pool through its DT "memory-region" property, the FF-A
transport lacks a device tree node and binds via ffa_lend_pool_attach().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 633715b98625..4d6555171918 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -979,6 +979,7 @@ static void optee_ffa_remove(struct ffa_device *ffa_dev)
 
 	mutex_destroy(&optee->ffa.mutex);
 	rhashtable_free_and_destroy(&optee->ffa.global_ids, rh_free_fn, NULL);
+	ffa_lend_pool_detach(&optee->teedev->dev);
 
 	kfree(optee);
 }
@@ -1042,13 +1043,21 @@ static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_caps)
 	int rc = 0;
 
 	if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
+		rc = ffa_lend_pool_attach(&optee->teedev->dev);
+		if (rc && rc != -ENODEV)
+			return rc;
+
 		pool = optee_protmem_alloc_dyn_pool(optee, id);
-		if (IS_ERR(pool))
+		if (IS_ERR(pool)) {
+			ffa_lend_pool_detach(&optee->teedev->dev);
 			return PTR_ERR(pool);
+		}
 
 		rc = tee_device_register_dma_heap(optee->teedev, id, pool);
-		if (rc)
+		if (rc) {
 			pool->ops->destroy_pool(pool);
+			ffa_lend_pool_detach(&optee->teedev->dev);
+		}
 	}
 
 	return rc;
diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
index be3abf6e8aa6..9b64db9b4e64 100644
--- a/drivers/tee/optee/protmem.c
+++ b/drivers/tee/optee/protmem.c
@@ -42,14 +42,6 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 		goto err_null_protmem;
 	}
 
-	/*
-	 * TODO unmap the memory range since the physical memory will
-	 * become inaccesible after the lend_protmem() call.
-	 *
-	 * If the platform supports a hypervisor at EL2, it will unmap the
-	 * intermediate physical memory for us and stop cache pre-fetch of
-	 * the memory.
-	 */
 	rc = rp->optee->ops->lend_protmem(rp->optee, rp->protmem,
 					  rp->mem_attrs,
 					  rp->mem_attr_count, rp->use_case);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b8a2bdac3208..5949aa717cad 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/rpmb.h>
 #include <linux/sched.h>
@@ -1528,6 +1529,8 @@ static void optee_smc_remove(struct platform_device *pdev)
 	if (optee->smc.memremaped_shm)
 		memunmap(optee->smc.memremaped_shm);
 
+	of_reserved_mem_device_release(&optee->teedev->dev);
+
 	kfree(optee);
 }
 
@@ -1712,16 +1715,22 @@ static int optee_protmem_pool_init(struct optee *optee)
 	if (!protm && !dyn_protm)
 		return 0;
 
+	of_reserved_mem_device_init_by_idx(&optee->teedev->dev,
+					   dev_of_node(optee->teedev->dev.parent), 0);
 	if (protm)
 		pool = static_protmem_pool_init(optee);
 	if (dyn_protm && IS_ERR(pool))
 		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
-	if (IS_ERR(pool))
+	if (IS_ERR(pool)) {
+		of_reserved_mem_device_release(&optee->teedev->dev);
 		return PTR_ERR(pool);
+	}
 
 	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
-	if (rc)
+	if (rc) {
 		pool->ops->destroy_pool(pool);
+		of_reserved_mem_device_release(&optee->teedev->dev);
+	}
 
 	return rc;
 }
@@ -1833,14 +1842,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 6742b3579c86..49a9b2993c83 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
  */
 #include <linux/anon_inodes.h>
+#include <linux/arm_ffa.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
@@ -43,6 +44,7 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 
 		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
 		p = dma_mem;
+		ffa_lend_reclaimed(&teedev->dev, shm->paddr, shm->size);
 		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
 			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
 #endif
@@ -288,6 +290,7 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 	struct tee_shm_dma_mem *dma_mem;
 	dma_addr_t dma_addr;
 	struct page *page;
+	int ret;
 
 	if (!tee_device_get(teedev))
 		return ERR_PTR(-EINVAL);
@@ -297,9 +300,13 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 	if (!page)
 		goto err_put_teedev;
 
+	ret = ffa_prepare_lend(&teedev->dev, page_to_phys(page), page_count * PAGE_SIZE);
+	if (ret && ret != -ENODEV)
+		goto err_free_pages;
+
 	dma_mem = kzalloc_obj(*dma_mem);
 	if (!dma_mem)
-		goto err_free_pages;
+		goto err_map_pages;
 
 	refcount_set(&dma_mem->shm.refcount, 1);
 	dma_mem->shm.ctx = ctx;
@@ -313,6 +320,8 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 
 	return &dma_mem->shm;
 
+err_map_pages:
+	ffa_lend_reclaimed(&teedev->dev, page_to_phys(page), page_count * PAGE_SIZE);
 err_free_pages:
 	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
 		       DMA_BIDIRECTIONAL);
-- 
2.55.0.970.g62bdec98f9-goog

