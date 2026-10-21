Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550603;
	b=YJ9ogqW68PBSlVdEjicokbTAN4TnEr+6T6vdqpRNUc6M1Cdq+m6Pw6g9Gvf1xgZ2fjiX
	 FtegoQiUOUxo/tHX8c7u6vA9du9jbamUVqP15iCngbPSxLvgUZDRjQyAm1n/uigBfUcge
	 6uNhYZnuvZxOSi5PfmdL64mySoGroJgFVgLMeacI5btR7FFL09vBS0lqjTMNF7p4CySMA
	 bfUjDld1FJk1SCUbA1TSUhxSXic1DrBWjaBRlCb4l2rRIROTTDwjwMp/IYpPirmx4DMzh
	 5FRWNPabZ75wmeKL8AjPZwFcS30BxBgIIlmzhaaoaeOW29Mxf3gRxYII7BJ/hGV0Yrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeOSor/7asw+7lrqLJjpFf8NPmnjTqTqBdeuEnm5rMc=;
	b=Fy1jOAgoFvN7WJUfMxFgK7vKTk0fyYABf0aXgUQTl3IFgLbUrAPssXUIaB78gDe8ALNg
	 2NtCDjvLeGspTjFeN0PxSbcnjY5gvLCzzyz3HHso47MbjYKuIocm9bhS2NhXRNc3km6mh
	 8G8r7V6pjCu6Ide/Z5ue9yiDL13PrWH+Nmv4/SZ7fg5T7K/nXVVhxJivYYap2Y+oTCYH7
	 GZ+arN322/EGh2T2WWg8Xy8PshxhuPAhCFGR0GfSFcXGRKvxh+ktsFtO+Py+rZoZUrzaN
	 0qJJLvuWN76joFS82TqFD+Tth641xptWrvT43LsP9v2BTBXlzLFBGiZC7T9/UqLuodA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W4PJySaw;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A31606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W4PJySaw
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15354aa70e8so779109c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550602; x=1793155402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeOSor/7asw+7lrqLJjpFf8NPmnjTqTqBdeuEnm5rMc=;
        b=W4PJySawBgZ1pYQceiVcn/kHLlbTboI/uHb7BX+w29Htx4i6udWLUGJY4v7EyjLo+2
         eEeCsydsDdmFRdDyCZEm3L1JC4Q20TIFFx0o8kX0aXjGV7363YowwN0MjIW8zCFQsEon
         zSYN9/SlGZ2CSklLK6RIWvP+kDv0T8Ge2WJAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550602; x=1793155402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeOSor/7asw+7lrqLJjpFf8NPmnjTqTqBdeuEnm5rMc=;
        b=osFCXK4oePi4vxvLZEC6EZzPtuwqfcrS2GL0X2lteB8sAlvnOB3b/qFoL2PssKtDK0
         MFUJxXJan1PvKaX8ScjYFuZO0BNxAYapG7X+PkhnL1Eiw6riT8J/2H/FdorEdpj72rMu
         gaWqietpG81YQt3HoqgHyM6Wj65s2rIdXEPPvt2C4sUy+Hy+cwzE2zMQ7VLXr/bHn9D1
         41Jpde5KWON7HftGsOhQ+OAmcaVqrPhwxFV3bzyYAhgmHvPeVQHzpHICS1BeGk2czMR1
         ewh5UTs8GpOaHXYGjBo/Mx783/dttOCT0n2KmiMFwalXc3sbLBmXdMPZGF7RerYXhitt
         hnsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpZ3k/OUvOaG1Ol43h7Ili4xTqQExEJLf/+IKc044LByiyzCL5KRCuAhgZswUvIfU8bEje+xSGdzgfUQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOaIA9fIhm1qBYnwRqGnB7fLaP8p25Mvi+VRAcM5j++nMXJ9tK
	rG/avWebOgvtesHYeJIFuXJD1VXupGNDt4Zk222ZHofBYlTPovRpW5eP+ZuXBCkTaQ==
X-Gm-Gg: AYBFou0morlDUbNnC5mIJi/V6vxCtK4K/OJMrYGZ9AdjtPB8UVT/+Yct8rSU1DhJjH8
	yBHBNQfsZqPMZgIFfZ5vlofslvtow5LWnmmWBvipvvYgvSofaUQy0mHP2beR8Jgegg1nornZ/rG
	d57vOx3lcxrb0N/MM4e0f7qtt/NDIr0fGZ8dP30c3S0tZZocQJAOsxmnhNoWF8DhfK621lYMA+q
	w2uxGLNWQLmUyQGU9kiQxqiYEJ4xaRlQZHFFLhPGxkBdUxaQ5RXCYmOvoLbT0TUXB/bJiOsYnqm
	gnVtohvz2GUgBy3rc+/RDIUTUjLZ1ZomOuXp8tfBckvRPgFjRWYUdjOuWpQpsJ7o6F62KTZTht5
	WBkOD/9E00B9j308PcMbjecH3MutbVlPPgZfJ1o3vcJHYbKtTHdNbwN7boY14voroobwDsaweTu
	tkZor+Y0uTfegMsl+ocr3R3pezXgebNp/z8U6cFdvXX9dZmCZPaBbYeN5oJfTRpYqhleZzwf7dW
	VRO35D0LhMS+5S8XfXK/IYLrLOoPm3qKaZAPJS11vejmE1/F20A57OLKXrtjQX0hosPIojZeDiY
	7PrDZ4HQgZIcfgsCZ7snliBXDaXA5FEdUusNEuM57E+lmg==
X-Received: by 2002:a05:7022:929:b0:14c:be8e:69fe with SMTP id a92af1059eb24-190a051dd50mr1271104c88.5.1792550602131;
        Tue, 20 Oct 2026 19:43:22 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:43:21 -0700 (PDT)
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
Subject: [PATCH v6 13/13] zram: use a singleton compression context for recompression
Date: Wed, 21 Oct 2026 11:42:23 +0900
Message-ID: <20261021024236.1787884-14-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index 72683f91313f..ad8c7dc73922 100644
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
2.56.0.212.g129ede20d9-goog

