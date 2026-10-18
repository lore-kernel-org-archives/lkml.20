Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4764E3D331D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295548; cv=none; b=MNJi6k0L6lGRfZR7B3TnTzpP1tfljiAMYRH6lQ2nZ7/I1/ZnMR4GDhZ48uX82qS0+Fzw2BejZXrZp9GNvKr+7hmUyqmALWfPVY8ZCg6PAim2irN7jccg/GjYdejULFrQjJJVSaQimWfB0vr/fBxTU9zsLlOJNqcOFPyGmq5WVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295548; c=relaxed/simple;
	bh=IMwXcOIFbaTba9duylEhRaH0+iChQsLlcede3lTgSF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OY5Eyo+jIr1yQkkmN1DM8QuDNsHzVjKZKrwXMsYmdKA3qXqyXlkymBxlyyR5Mo72t62fsWRxkZB/aM3FMkBH8V4a61A+ltXlEP5wCm0sKfZmRfz0774V7SF2gtfxpH6oKzezHyvlo49pOrcTuTArMDWpcxmzGbEuKbAMMq01mE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kep02YzY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kep02YzY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e812e2b31bso5263135ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295547; x=1792900347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M55JStFe4+ywWFb/Lnl0qjUNokQckie0nywOU4qhi9c=;
        b=kep02YzYJO0Cd30vCzdL3FrJ048+oBE8NvG3qtNe+AuxVmxSNoSaE8iCHDqGg2rCvS
         ciNiJyQ781cIYscihRYlgt1RHc0IxPjnJLgDrrhxMOLanQh6hDswIM565k2bDoHIgOeW
         Q9/KPeSmvl9p+CI3c7DMf2CbieNqRi3WorPH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295547; x=1792900347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M55JStFe4+ywWFb/Lnl0qjUNokQckie0nywOU4qhi9c=;
        b=CSbqcxzvZJtq4W4Unot+ZtrhkwZdbbNA/TeHPFRZ3VAgPjTcsKbFUP/2DsqbrfzUcQ
         KQTm33UzSdA4aAbMTc1B94Yq2N5wUuE6i/xlcQJGiAJ5VPsZLuDTo/iXA8ETAsC9sUB/
         Oxn9LIELTE4NYHb2v2MRxFBgT2b8OylUHfmFOZMyvPPgwCTwkAtSbY9DCHQ4TkVQEMFs
         We30ZfUGd5/GMVGESaw0NDfUgv/c8T7JshVVP1ZTLuyBgPZBYH2kYk6yfSepv+9sb4td
         Hp1nx+y5afdilO6MEmE8uem+lBaGtLRYlZXB0VVJc1bXczAsG4M+Q4Ub3tJAFTlHAPaO
         Kmkw==
X-Forwarded-Encrypted: i=1; AKwUvBxMvkUjwIa2Qk67A81oKUqjJyDYJPpfOlq1OtzCsnwG49RKzuI/TpyeD3lMjIQ+wpvZu36bQnIJAokXZFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSvwjBV1EadXfT1U2JilQRvc+M6sAQPyZnR4O1T4P8hIz81OiF
	MYbhom5KLoR6DBAiuFMlh84dRQx8RFeNGLyKYsLOJUC7azkbGqFnVvbuvIBwLDJeJQ==
X-Gm-Gg: AYBFou0xfL3P4jv2ZAjGjt+7c4Zbm/0Y4uyW238cxgCpkWNjiokB1ZE7dqtzOy81ABT
	TFALP0uMyx1wOU5tY7AdkNhao3Uzr6Wznhic80dnnUj85w+rY8fgebjFP/3C5clvcNRPmhiah6F
	5b1wKBRNRUyv93X9u1/XSQ1oVnbMjgDsiSZGM1ASxjLJoUkFZLYuGB+1yEzp1DX17uFAHsprziU
	VIaSbunSygXSg8DnHyVDBSxzAmt+kJlSLUpUs9Fufcs/ToamukaAuFDVzMl/sJasfQxK47LkLcH
	akR1tOtYT4uwD+tCSuS0iCj5ucrbQSuRGQP2DXI5lrgSnQjO/HJ0ssvd4BDzxjuywJGkIe3mSJV
	f8TrQtOiHQsyiZl5WTTQsKpkzjtXYZ5Gn3Gru4587AB2R7T6Lq/W0haypDh6KytwVYe350TbLQx
	/PY7ot1cqF1Z4vZ45LZJDcgFSyKsW6+HIbpbReqZnRwR71eybko9Idv1Ph8HrdBp3iYz2J2jziu
	nTydCWfWU1CqnbaUyeC9CMlBK4ePsHn0+x2Iiq7lhmBfTJZnTQV7gTm6kr/kCY=
X-Received: by 2002:a17:90b:28ce:b0:3ac:d17c:2a70 with SMTP id 98e67ed59e1d1-3acef5dcc7dmr3685875a91.62.1792295546657;
        Sat, 17 Oct 2026 20:52:26 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:52:24 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 13/13] zram: use a singleton compression context for recompression
Date: Sun, 18 Oct 2026 12:51:15 +0900
Message-ID: <20261018035125.3120704-14-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
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
instead of per-CPU streams, avoiding unused per-CPU compression
contexts and 2 * PAGE_SIZE buffers.

For example, on an 8-CPU x86_64 system (4K PAGE_SIZE), this saves:
- zstd (level 3, default):        ~700 KB (~100 KB/CPU)
- zstd (levels 12-22, no dict):   ~1.91 MB (~280 KB/CPU)
- zstd (levels 14-22, 110K dict): ~5.33 MB (~780 KB/CPU, lazy)
- deflate (winbits=-11, default): ~1.04 MB (~152 KB/CPU)
- deflate (winbits=15):           ~1.86 MB (~272 KB/CPU)
- lz4hc:                          ~1.84 MB (~269 KB/CPU)

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 75 ++++++++++++++++++++++++++---------
 drivers/block/zram/zcomp.h    |  9 +++--
 drivers/block/zram/zram_drv.c |  5 ++-
 3 files changed, 65 insertions(+), 24 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index c6d2fd23c6f6..ce94dd96cc98 100644
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
 
@@ -326,22 +331,25 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_dstrm *zstrm,
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
 
@@ -354,10 +362,12 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
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
 	down_write(&dstrm->lock);
@@ -367,7 +377,8 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
 	return 0;
 }
 
-static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
+static int zcomp_init(struct zcomp *comp, struct zcomp_params *params,
+		      bool recomp)
 {
 	int ret, cpu;
 
@@ -376,10 +387,28 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
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
@@ -393,7 +422,6 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 	for_each_possible_cpu(cpu) {
 		struct zcomp_dstrm *zstrm = per_cpu_ptr(comp->dstream, cpu);
 
-		mutex_init(&per_cpu_ptr(comp->cstream, cpu)->lock);
 		init_rwsem(&zstrm->lock);
 		mutex_init(&zstrm->excl_lock);
 	}
@@ -405,6 +433,10 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 	return 0;
 
 cleanup:
+	if (comp->recomp_cstream) {
+		zcomp_cstrm_free(comp, comp->recomp_cstream);
+		kfree(comp->recomp_cstream);
+	}
 	comp->ops->release_params(comp->params);
 	free_percpu(comp->dstream);
 	free_percpu(comp->cstream);
@@ -414,13 +446,18 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
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
@@ -443,7 +480,7 @@ struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params)
 		return ERR_PTR(-EINVAL);
 	}
 
-	error = zcomp_init(comp, params);
+	error = zcomp_init(comp, params, recomp);
 	if (error) {
 		kfree(comp);
 		return ERR_PTR(error);
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index ca1ebc70ad0a..39efefc43a13 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -40,7 +40,8 @@ struct zcomp_params {
 /*
  * Run-time driver context - scratch buffers, etc. It is modified during
  * request execution (compression/decompression), cannot be shared, so
- * it's in per-CPU area.
+ * it's in per-CPU area (except for recompression, which uses a single
+ * per-device compression stream).
  */
 struct zcomp_ctx {
 	void *context;
@@ -95,9 +96,10 @@ struct zcomp_ops {
 
 /* dynamic per-device compression frontend */
 struct zcomp {
-	struct zcomp_cstrm __percpu *cstream;
 	struct zcomp_dstrm __percpu *dstream;
 	wait_queue_head_t dstrm_waitq;
+	struct zcomp_cstrm __percpu *cstream;
+	struct zcomp_cstrm *recomp_cstream;
 	const struct zcomp_ops *ops;
 	struct zcomp_params *params;
 	struct hlist_node node;
@@ -108,7 +110,8 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node);
 ssize_t zcomp_available_show(const char *comp, char *buf, ssize_t at);
 const char *zcomp_lookup_backend_name(const char *comp);
 
-struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params);
+struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params,
+			   bool recomp);
 void zcomp_destroy(struct zcomp *comp);
 
 struct zcomp_cstrm *zcomp_cstrm_get(struct zcomp *comp);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 52341f05da83..079f3723db31 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2526,7 +2526,7 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	}
 
 	/*
-	 * We are holding per-CPU stream mutex and entry lock so better
+	 * We are holding compression stream mutex and entry lock so better
 	 * avoid direct reclaim.  Allocation error is not fatal since
 	 * we still have the old object in the mem_pool.
 	 *
@@ -2928,7 +2928,8 @@ static ssize_t disksize_store(struct device *dev, struct device_attribute *attr,
 			continue;
 
 		comp = zcomp_create(zram->comp_algs[prio],
-				    &zram->params[prio]);
+				    &zram->params[prio],
+				    prio != ZRAM_PRIMARY_COMP);
 		if (IS_ERR(comp)) {
 			pr_err("Cannot initialise %s compressing backend\n",
 			       zram->comp_algs[prio]);
-- 
2.56.0.176.g3575e65682-goog

