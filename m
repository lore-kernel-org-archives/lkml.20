Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39A410D3D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377698; cv=none; b=h6Hh5f22h61Ydm4ZnCSxMKSRQ3OqoVv/SsWL/rQlkosFyeiFnBJT5xDV0dZqvcSuCNdmlV8L9tLkJDCFGONk+VvyjykGmn2uTY2P2mf13nuQ+/Y3txH+QFYa/T2Z+XYjGwKTrA/CVGWzYDhtNmog74bBPZ0QGGz3ZFAWCJqrz2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377698; c=relaxed/simple;
	bh=MlleD8QjMSMowLp06JepZC8Rof4LpffQJ09I3Y+7j8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjNRu6ny+QsxN22j6h4froHi7Br7nb8rpqyXO9eX9QaFlvCqqZ6eF55hcgWCsHRa92RmTIaG+QBiHM7muUVKUv1AQVtUQRlXoJ24iC0cXetIiD3/W7CPySUVFhQiUAcaP7UzShXhOZiV59OjldWCuWsg8YPyQxvA5r1cqyDayjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njhayYyS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njhayYyS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90e8e70fa02so39997246d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377695; x=1789982495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLY2GYRaOljR7tphE79zbHfzaT1w5oSZifPlkEd/L4U=;
        b=njhayYyS49eCQCQ1F61nPWPrwrbnxaEz0p+5klyDuM5p1xF1L21EZ6rIe9V8Tux6vS
         1q5eXhUhATGenpEFtrK3JsVZ1fcrTB2KUWEF7Ah2V3SADkm2AH3/aYlYTaUyQ47iO5kj
         klF8HxGm2eiXkTf9QRXnFFBXg0zyuqCSUPVd5CKomAiwOal/0xuEJv+8hcoVE5q04pG5
         w0pmTigEQXEB8+dvS2nfk7Ne/OOQbOnOceX/WCo4NoHvZCzN7lnZdTqiPVmX7L4fZSud
         wOHZd4YYpF4Di3C5iNOOuallM/+L+ZRjDbFwGVrCB5oGA1PCyJzl7V4xnOU52HQPWm8Y
         AURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377695; x=1789982495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLY2GYRaOljR7tphE79zbHfzaT1w5oSZifPlkEd/L4U=;
        b=sMT59a8npbWuW5v3Q8KVVXsKewi0H+2XrEeDuM1TtvH0FHX797VTs7nE9gD3JyIApT
         GRQK2XAVkQZDfj8V/5ZBRWn4ZmI2wpucJx7BHP38UPQ3Uqg7E7W/s3W+Y4mL8MRxVO2V
         aScX3Pt6HwmtBdlBO7Wig/E2ib8z7yATMx/FxMJBUpksmyA3VG0oFGDsV8LwZn5htYWa
         TWbO0eBbsTqg3h4e5k7WWIhsPmz1Xk9o1cTImwNwYNysadhRwcwUwxhz25vlE/oYO1sY
         0F+naxAqF+SN0mtqp/wb7ZFCtGyDASAyuCLrGi7PaMf5cepEGrOx2rQekc2VVQyRtH0h
         zUBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJWl+T+765/pIMio7/AAght9mENOiddSJV/4U/JyO8g3g10GoVedWoWkiJpT/lNZGJ8feKveiH+4VTSbc=@vger.kernel.org
X-Gm-Message-State: AFuF++nUY0+dAKO7CzmA7N5sr5ysgy01zpwykXYK+IdfsedUutmTnnye
	/5GwO6kfR8boRNK9zal0XSTS5O9yG1RWLn2bqyhy66wTscMNWgsb5dNa
X-Gm-Gg: AYBFou21rmIE/TmdtovwyQ+YGuBBqxb6VUZkBaiHaw6r4Ne+cSDYzy0JdTAp/UvAFJC
	t08vdLiivx1IkGgAOMBGvZGjDDqJdoAvHoed6rV1b1glVXUB5o6JOC2hwvd+HJFY/shVFggbgcm
	GETHPKMNCU+hhedBPaxHCYu/TfVK7wY32WLD/rWXD8R8N8imqk5JQcUk3Lu2I7UIdgD7wfqlXRg
	kfUfT3QWC+fHbmTh4ahrYnyeP8p06O8UV3tGCsHofCqpwDWGWJRPgvm7SacQcPf5mwcCat/djxk
	ohJV9TiFAeEQcetx08RuIIREYmJg9cGp+t2F5ne/k3NREl108rxowR109HmHuaJpibGuxdGh+NY
	fy9QYsRn2auMRwu8V3CyqId0R48akmCwzOylJEamt79uZBYOfUKcbeL47/qNGbYWPp08EJt+Zxy
	EKFewQDx/S2FCHrBrykxkGdeeLCBbLGE2+nG4btUUbvXDjdXhhF+OrT2hzqmen8ckg3J/mY4tXe
	ylDImQ94XHEwiztNBRE9W7cKIdx9Pc9WoHSo5yQZTj31M0SFbCjK0ppIvyqtq3F7qEM
X-Received: by 2002:a05:6214:8613:b0:910:6f25:8f49 with SMTP id 6a1803df08f44-9122e66152emr25233396d6.37.1789377695479;
        Mon, 14 Sep 2026 02:21:35 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm89854256d6.29.2026.09.14.02.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:21:35 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	asml.silence@gmail.com,
	Chengfeng Lin <lin2530632123@gmail.com>,
	linux-kernel@vger.kernel.org,
	Uzair Beg <uzairbeg11@gmail.com>
Subject: [RFC PATCH 1/3] io_uring/rsrc: allocate io_rsrc_node from a dedicated kmem_cache
Date: Mon, 14 Sep 2026 09:20:47 +0000
Message-ID: <20260914092049.130079-2-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914092049.130079-1-uzairbeg11@gmail.com>
References: <20260914092049.130079-1-uzairbeg11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_rsrc_node allocations come from the generic kmalloc-32 bucket via
io_cache_alloc_new(). On a first fill of a sparse fixed file table the
per-ring node cache is empty by construction, since io_reset_rsrc_node()
returns early on a NULL slot and nothing is freed back, so every install
takes an allocator round trip.

Add an optional kmem_cache to io_alloc_cache and use it for the node
cache. The slab pointer defaults to NULL, so other io_alloc_cache users
are unchanged and imu_cache keeps using kmalloc, its element size being
variable. All three free paths honour the slab.

On its own this is neutral on the reported workload. It exists so that
the following patches can use kmem_cache_alloc_bulk(), which has no
equivalent for plain kmalloc.

Reported-by: Chengfeng Lin <lin2530632123@gmail.com>
Closes: https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
Tested-by: Chengfeng Lin <lin2530632123@gmail.com>
Signed-off-by: Uzair Beg <uzairbeg11@gmail.com>
---
 include/linux/io_uring_types.h |  1 +
 io_uring/alloc_cache.c         | 14 +++++++++++---
 io_uring/alloc_cache.h         |  8 ++++++--
 io_uring/io_uring.c            |  5 +++++
 io_uring/io_uring.h            |  1 +
 io_uring/rsrc.c                |  2 ++
 6 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index c2ea6280901..e8d5a585a60 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -253,6 +253,7 @@ struct io_alloc_cache {
 	unsigned int		max_cached;
 	unsigned int		elem_size;
 	unsigned int		init_clear;
+	struct kmem_cache	*slab;
 };
 
 struct io_ring_ctx {
diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
index 58423888b73..a44b82a80f1 100644
--- a/io_uring/alloc_cache.c
+++ b/io_uring/alloc_cache.c
@@ -10,8 +10,12 @@ void io_alloc_cache_free(struct io_alloc_cache *cache,
 	if (!cache->entries)
 		return;
 
-	while ((entry = io_alloc_cache_get(cache)) != NULL)
-		free(entry);
+	while ((entry = io_alloc_cache_get(cache)) != NULL) {
+		if (cache->slab)
+			kmem_cache_free(cache->slab, entry);
+		else
+			free(entry);
+	}
 
 	kvfree(cache->entries);
 	cache->entries = NULL;
@@ -30,6 +34,7 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
 	cache->max_cached = max_nr;
 	cache->elem_size = size;
 	cache->init_clear = init_bytes;
+	cache->slab = NULL;
 	return false;
 }
 
@@ -37,7 +42,10 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 {
 	void *obj;
 
-	obj = kmalloc(cache->elem_size, gfp);
+	if (cache->slab)
+		obj = kmem_cache_alloc(cache->slab, gfp);
+	else
+		obj = kmalloc(cache->elem_size, gfp);
 	if (obj && cache->init_clear)
 		memset(obj, 0, cache->init_clear);
 	return obj;
diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index d33ce159ef3..b288bfccc91 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -61,8 +61,12 @@ static inline void *io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp)
 
 static inline void io_cache_free(struct io_alloc_cache *cache, void *obj)
 {
-	if (!io_alloc_cache_put(cache, obj))
-		kfree(obj);
+	if (!io_alloc_cache_put(cache, obj)) {
+		if (cache->slab)
+			kmem_cache_free(cache->slab, obj);
+		else
+			kfree(obj);
+	}
 }
 
 #endif
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 296667ba712..f375f0ccc0e 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -151,6 +151,7 @@ static void __io_req_caches_free(struct io_ring_ctx *ctx);
 static __read_mostly DEFINE_STATIC_KEY_FALSE(io_key_has_sqarray);
 
 struct kmem_cache *req_cachep;
+struct kmem_cache *io_rsrc_node_cachep;
 static struct workqueue_struct *iou_wq __ro_after_init;
 
 static int __read_mostly sysctl_io_uring_disabled;
@@ -4074,6 +4075,10 @@ static int __init io_uring_init(void)
 				SLAB_HWCACHE_ALIGN | SLAB_PANIC | SLAB_ACCOUNT |
 				SLAB_TYPESAFE_BY_RCU);
 
+	io_rsrc_node_cachep = kmem_cache_create("io_rsrc_node",
+						sizeof(struct io_rsrc_node), NULL,
+						SLAB_HWCACHE_ALIGN | SLAB_PANIC);
+
 	iou_wq = alloc_workqueue("iou_exit", WQ_UNBOUND, 64);
 	BUG_ON(!iou_wq);
 
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 46d9141d772..6243dadd507 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -527,6 +527,7 @@ static inline bool io_req_cache_empty(struct io_ring_ctx *ctx)
 }
 
 extern struct kmem_cache *req_cachep;
+extern struct kmem_cache *io_rsrc_node_cachep;
 
 static inline struct io_kiocb *io_extract_req(struct io_ring_ctx *ctx)
 {
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d787c16dc1c..6413682ebe4 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -175,6 +175,8 @@ bool io_rsrc_cache_init(struct io_ring_ctx *ctx)
 				  node_size, 0);
 	ret |= io_alloc_cache_init(&ctx->imu_cache, IO_ALLOC_CACHE_MAX,
 				   imu_cache_size, 0);
+	if (!ret)
+		ctx->node_cache.slab = io_rsrc_node_cachep;
 	return ret;
 }
 
-- 
2.43.0

