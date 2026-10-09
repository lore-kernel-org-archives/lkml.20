Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96FC472558
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529968; cv=none; b=k5L5RWxDiP+H0fKvohk9hfEfZ/yu+MSBiA6cv6P8MEIt2L4ahZVYxgoTOx30BcJJx7x1hABk+TjBLL6BxRXX5FAahDNLhdonjv/giTR0Xkg0HxFj0ZQLoltc26e2pWnniiQ0gN0FEPhpHGHt+AUOibOkI8ICuMFnat3m69vr99Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529968; c=relaxed/simple;
	bh=RPylPp32GiwsHw8zUD13DIWH/x1fgQ+AKLOLcKHdS4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhYN3qnRuA8hAu/6ScQCbE17HvB8lOaCRZQo3GG9S9rliXRAuV9L5ilPzLvViZb0Yd5zktBwH9CmoQ91FLy4S4HQ96GYozqictdC9BQN4RlucGb0XkrQS6DOP1T+AD6VXoQ7bidzmpfw8lx/K61YpQApgmOF2bmB2yhcB8FbiGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FgAzGM3a; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FgAzGM3a"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1884555a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529966; x=1792134766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnpVN29DtbqPgrKOel1BWS5wocQF0xrQV49DCLSnSB8=;
        b=FgAzGM3ahDyKA+rWhD7JkCmBwDQz/TFwlQ7m6aTo1F1oPJhBLTSDg7JeBc8bdLSeAj
         rlyTEHkcGcnDyNiBhrgikTqKB1ADNUumS+JTI+eHgisQpLHOwZkknYGF7YBxPQssv5cx
         PqU/6uGl/gQN7mkIF1dqjKUI1GGGFLrw7udqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529966; x=1792134766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnpVN29DtbqPgrKOel1BWS5wocQF0xrQV49DCLSnSB8=;
        b=jCNc+xolurMtnHmaiE7ThrGup8S9zDBxWaPudFB76ldnXXmVw8ZWq2wwtFpJhbDDiH
         ACWCydB/uiDxYbkukGjTF6R9iVVe06/xeP66/+z9RcVo0mC19soDB2EUzxMv5/z/fxl2
         uJL5NjIp5x+Ywh+gZLmxNY+lEPSSWZKlIr1RFNQflQ/WrRKcNkOpSrypsh9b3Rrbtwt/
         v5jlxXLumB1BaMOqirUy1wi5pTlc+o7ogNXVTiSu/VAoOTJCREhyicqRY8CDDJyJLXhu
         omGT9BLATXdYBCWOSPYRFZDlmDXiRmPmZD0Bv5pkNSdW2XuadSEUps5m2DbMa+zMSbjq
         uHFw==
X-Forwarded-Encrypted: i=1; AKwUvByfPPMaS9F3RwnSHV2afxevjdE9F64aNxzDZD3GAFH/WRP/zH3XzcqDGuxX4s3LTVEBmuPircQpJKMlrjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK32E1m+/HNcVzeWLQmiaL5HFGeV+T2L/+qLmGi08B90HdGw13p
	wrU8uccrh1T8tvDodPJ1PwLgyQYKvxtwg3Ya0CzY4POPtEj6ZhFJU3rxXyLcZkHdOg==
X-Gm-Gg: AYBFou26QOJptJ6iS+7pAseJ4bIjdEwoB5E7BlKXP3q277l+3VEhPIWf1EEITCkSXhr
	JjwUrqiI0HbiZp/ZFo3VwEVky1rBjoeEGSelOsAAIuTYpcl1mlZlm9FAMY5YuKvLp50P4VsObz1
	931GYKVNJtEGpcWbe9tjnmVcx0w+RLoAmAtCQIOiBYx41/u8wiDedDj4yIVP6X7Sizuug7Ty50I
	DmhgifWvb/Wq+XjnjnwhA11EQ/2oGIybxvekwAWnfC46t7MfuoL4eoY7pA23Wxnz+0TmGBFUX0P
	SRmjmn3KcDqV3O1nvN7rAp/Lf3tpQdd7m5gcF9DUT4lYVb122JGuQazS7eVlIjAmZt0AVsX2yC5
	XzHzlkyGWGeeLvziDeUbqF1179beAXbasULbpA+Ab0UpefoauGL0H0STd+idtp2di0ItoWMBdEp
	kVIYQ26UmZSDWyoAxl2FAw1HMWPTNDMpmrr0lmwSTom7yI5UE33Yse+QeO/I224/nSOSADAKs0u
	t6reSJl3ZajC1M97vAnJ56AsM/g+60PKPk3zds+n+WA4wpW3T76Lsn5QZAPF9o=
X-Received: by 2002:a17:903:b8f:b0:2e6:23e5:494b with SMTP id d9443c01a7336-2e842ab67d0mr7500745ad.19.1791529965967;
        Fri, 09 Oct 2026 00:12:45 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:44 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 10/11] zram: use a singleton compression context for recompression
Date: Fri,  9 Oct 2026 16:11:33 +0900
Message-ID: <20261009071157.3730698-11-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009071157.3730698-1-senozhatsky@chromium.org>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Secondary compressors are only used by recompress_store(), which is
serialized under zram->dev_lock, so we only ever use one secondary
compressor at a time, yet we still allocate them on each CPU, which is
just a plain memory wastage.  However, we do need per-CPU decompressors
in order to support concurrent reads.

Now that Read and Write contexts are split, we can allocate just a
single compression stream (recomp_cstream) for secondary algorithms
instead of per-CPU streams, which saves N - 1 compression contexts
and 2 * PAGE_SIZE buffers.

For example, on an 8-CPU x86_64 system (4K PAGE_SIZE), this saves:
- zstd (level 3, default):        ~700 KB (~100 KB/CPU)
- zstd (levels 12-22, no dict):   ~1.91 MB (~280 KB/CPU)
- zstd (levels 14-22, 110K dict): ~5.33 MB (~780 KB/CPU, lazy)
- deflate (winbits=-11, default): ~1.04 MB (~152 KB/CPU)
- deflate (winbits=15):           ~1.86 MB (~272 KB/CPU)
- lz4hc:                          ~1.84 MB (~269 KB/CPU)

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 78 +++++++++++++++++++++++++----------
 drivers/block/zram/zcomp.h    |  9 ++--
 drivers/block/zram/zram_drv.c |  5 ++-
 3 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 1c9f6d5c8cd1..20c487bafff2 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -151,6 +151,11 @@ ssize_t zcomp_available_show(const char *comp, char *buf, ssize_t at)
 
 struct zcomp_cstrm *zcomp_cstrm_get(struct zcomp *comp)
 {
+	if (comp->recomp_cstream) {
+		mutex_lock(&comp->recomp_cstream->lock);
+		return comp->recomp_cstream;
+	}
+
 	for (;;) {
 		struct zcomp_cstrm *zstrm = raw_cpu_ptr(comp->cstream);
 
@@ -243,22 +248,25 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_dstrm *zstrm,
 int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node)
 {
 	struct zcomp *comp = hlist_entry(node, struct zcomp, node);
-	struct zcomp_cstrm *cstrm;
+	struct zcomp_cstrm *cstrm = NULL;
 	struct zcomp_dstrm *dstrm;
 	int ret;
 
-	cstrm = per_cpu_ptr(comp->cstream, cpu);
-	ret = zcomp_cstrm_init(comp, cstrm);
-	if (ret) {
-		pr_err("Can't allocate a compression stream\n");
-		return ret;
+	if (comp->cstream) {
+		cstrm = per_cpu_ptr(comp->cstream, cpu);
+		ret = zcomp_cstrm_init(comp, cstrm);
+		if (ret) {
+			pr_err("Can't allocate a compression stream\n");
+			return ret;
+		}
 	}
 
 	dstrm = per_cpu_ptr(comp->dstream, cpu);
 	ret = zcomp_dstrm_init(comp, dstrm);
 	if (ret) {
 		pr_err("Can't allocate a decompression stream\n");
-		zcomp_cstrm_free(comp, cstrm);
+		if (cstrm)
+			zcomp_cstrm_free(comp, cstrm);
 		return ret;
 	}
 
@@ -271,10 +279,12 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
 	struct zcomp_cstrm *cstrm;
 	struct zcomp_dstrm *dstrm;
 
-	cstrm = per_cpu_ptr(comp->cstream, cpu);
-	mutex_lock(&cstrm->lock);
-	zcomp_cstrm_free(comp, cstrm);
-	mutex_unlock(&cstrm->lock);
+	if (comp->cstream) {
+		cstrm = per_cpu_ptr(comp->cstream, cpu);
+		mutex_lock(&cstrm->lock);
+		zcomp_cstrm_free(comp, cstrm);
+		mutex_unlock(&cstrm->lock);
+	}
 
 	dstrm = per_cpu_ptr(comp->dstream, cpu);
 	mutex_lock(&dstrm->lock);
@@ -284,7 +294,8 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
 	return 0;
 }
 
-static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
+static int zcomp_init(struct zcomp *comp, struct zcomp_params *params,
+		      bool recomp)
 {
 	int ret, cpu;
 
@@ -293,10 +304,28 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 	if (ret)
 		goto cleanup;
 
-	comp->cstream = alloc_percpu(struct zcomp_cstrm);
-	if (!comp->cstream) {
-		ret = -ENOMEM;
-		goto cleanup;
+	if (recomp) {
+		comp->recomp_cstream = kzalloc_obj(*comp->recomp_cstream);
+		if (!comp->recomp_cstream) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+		mutex_init(&comp->recomp_cstream->lock);
+		ret = zcomp_cstrm_init(comp, comp->recomp_cstream);
+		if (ret) {
+			/* zcomp_cstrm_init() cleans up after itself */
+			kfree(comp->recomp_cstream);
+			comp->recomp_cstream = NULL;
+			goto cleanup;
+		}
+	} else {
+		comp->cstream = alloc_percpu(struct zcomp_cstrm);
+		if (!comp->cstream) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+		for_each_possible_cpu(cpu)
+			mutex_init(&per_cpu_ptr(comp->cstream, cpu)->lock);
 	}
 
 	comp->dstream = alloc_percpu(struct zcomp_dstrm);
@@ -305,10 +334,8 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 		goto cleanup;
 	}
 
-	for_each_possible_cpu(cpu) {
-		mutex_init(&per_cpu_ptr(comp->cstream, cpu)->lock);
+	for_each_possible_cpu(cpu)
 		mutex_init(&per_cpu_ptr(comp->dstream, cpu)->lock);
-	}
 
 	ret = cpuhp_state_add_instance(CPUHP_ZCOMP_PREPARE, &comp->node);
 	if (ret < 0)
@@ -317,6 +344,10 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 	return 0;
 
 cleanup:
+	if (comp->recomp_cstream) {
+		zcomp_cstrm_free(comp, comp->recomp_cstream);
+		kfree(comp->recomp_cstream);
+	}
 	comp->ops->release_params(comp->params);
 	free_percpu(comp->dstream);
 	free_percpu(comp->cstream);
@@ -326,13 +357,18 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 void zcomp_destroy(struct zcomp *comp)
 {
 	cpuhp_state_remove_instance(CPUHP_ZCOMP_PREPARE, &comp->node);
+	if (comp->recomp_cstream) {
+		zcomp_cstrm_free(comp, comp->recomp_cstream);
+		kfree(comp->recomp_cstream);
+	}
 	comp->ops->release_params(comp->params);
 	free_percpu(comp->dstream);
 	free_percpu(comp->cstream);
 	kfree(comp);
 }
 
-struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params)
+struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params,
+			   bool recomp)
 {
 	struct zcomp *comp;
 	int error;
@@ -355,7 +391,7 @@ struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params)
 		return ERR_PTR(-EINVAL);
 	}
 
-	error = zcomp_init(comp, params);
+	error = zcomp_init(comp, params, recomp);
 	if (error) {
 		kfree(comp);
 		return ERR_PTR(error);
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 22be50dc51ba..e48e3f075352 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -33,7 +33,8 @@ struct zcomp_params {
 /*
  * Run-time driver context - scratch buffers, etc. It is modified during
  * request execution (compression/decompression), cannot be shared, so
- * it's in per-CPU area.
+ * it's in per-CPU area (except for recompression, which uses a single
+ * per-device compression stream).
  */
 struct zcomp_ctx {
 	void *context;
@@ -81,8 +82,9 @@ struct zcomp_ops {
 
 /* dynamic per-device compression frontend */
 struct zcomp {
-	struct zcomp_cstrm __percpu *cstream;
 	struct zcomp_dstrm __percpu *dstream;
+	struct zcomp_cstrm __percpu *cstream;
+	struct zcomp_cstrm *recomp_cstream;
 	const struct zcomp_ops *ops;
 	struct zcomp_params *params;
 	struct hlist_node node;
@@ -93,7 +95,8 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node);
 ssize_t zcomp_available_show(const char *comp, char *buf, ssize_t at);
 const char *zcomp_lookup_backend_name(const char *comp);
 
-struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params);
+struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params,
+			   bool recomp);
 void zcomp_destroy(struct zcomp *comp);
 
 struct zcomp_cstrm *zcomp_cstrm_get(struct zcomp *comp);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index def5266679b0..70d3f0ed9a3c 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2522,7 +2522,7 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	}
 
 	/*
-	 * We are holding per-CPU stream mutex and entry lock so better
+	 * We are holding compression stream mutex and entry lock so better
 	 * avoid direct reclaim.  Allocation error is not fatal since
 	 * we still have the old object in the mem_pool.
 	 *
@@ -2924,7 +2924,8 @@ static ssize_t disksize_store(struct device *dev, struct device_attribute *attr,
 			continue;
 
 		comp = zcomp_create(zram->comp_algs[prio],
-				    &zram->params[prio]);
+				    &zram->params[prio],
+				    prio != ZRAM_PRIMARY_COMP);
 		if (IS_ERR(comp)) {
 			pr_err("Cannot initialise %s compressing backend\n",
 			       zram->comp_algs[prio]);
-- 
2.56.0.385.gd3acb90ef8-goog

