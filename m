Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D836456DE8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528324; cv=none; b=SVKyeLnNwfngXrhfh2aqe3Kw7weFK5QKbmZlATpn1aqcutyGZEpw9WdoD6IRdXdIQXqGu8Ay3lKT1AaprfXGGKi5gRO+XPKLRJk0OYrseunPBfQTHb3I8rrOjiZ06AOPt/P6g/IPBZMOpcysHK0dmUnnYz+1ayoM9vPfEguz2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528324; c=relaxed/simple;
	bh=/xImwvacggtGVEw2C7dlGfR8T7mGtUHM/WsIdDcUzT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VacfTynR/H4koDmHrRvVn0aUxdEgXPKyzYzpmixdoIcKkDB6A6ztGj3jcEwTgeA9Rj00gGAtaFdGr5RTfl10oxYbhVj/HgoDZQSL/hNHkw2A/hgEJ+jPWjc2bV7noxVA8SLULeC794vije0qPO7suktExGeqPwHhacYeinNBdZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgI4+kCO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgI4+kCO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1229857b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528315; x=1789133115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8g/AFfc0xixTGDqDEvYMQWCEZQ1RAhdG9wVvkvsQsWo=;
        b=EgI4+kCOiutd78prNFwxIaK5IrrbxpBWOu+yxSPGN4UPlVVsgrwKz7v27CPrN05zmb
         PlMsPSVXhFWYT+peGBE6O2BHAxUAy82jluEusNyzbXaU4ltmHEpoXu5QXS9Hv1v/ZDb8
         0E7Vlb+NDBFeXQUv+tiWidP1JdqD1/rjyoui6Nbn89mggpjjTrGMwjXzylktdWlC+M0V
         NmjKymXDEInDlMbWg9PEY89WXLPey2K0Qvt1XgGchmyyDisui4HW5t5uLtED3jKKZarT
         oaC9LivAMh8X/dvw6ywtYimJzVInHuIo9q8FAz04ns9FXk5hC3Uqjw+SBOFpEY5L7Dwn
         zumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528315; x=1789133115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8g/AFfc0xixTGDqDEvYMQWCEZQ1RAhdG9wVvkvsQsWo=;
        b=ZfRiDRetvOPI6vjpVx6Ki1qgRGWZQjUmALpfyIktrC2nly1GSAh87NcOJzMBX+XN2W
         gjO8aYdp9al5qF+5isk2JL//aweOwQwxLi5xgbNKyc5kf3VWiNivHHTWsh8WlQ4pfc7t
         vQA8eVTUwOQA2Kkf32eKU8VNJkLRS1ShSdB7uqLaKNkEdM8xlNLrUxqLaC1C1WfoebYJ
         GVUS5FK+DAOeTg+lQmfSTDWafUguEoPXUzKmdnbs5CYJ9yQiQ2n6slRxkc5Gku7JY/v1
         ixvRJgDMBCzvsd+sjvE5HXSCpxXCfRAvVOpglzMvpCWW6rg5IH/hkIrdlOtra0OU5bIf
         XiNg==
X-Forwarded-Encrypted: i=1; AKwUvBzU0gvVHYUn5IssH+5RtAAykTEX/ALJ5ALv5Ib+NVo8hqxFc13Hh2D7L3eSjtZQKQlwM4uIcV538HPfOF4=@vger.kernel.org
X-Gm-Message-State: AFuF++ljwIlw/iPdJm6Nqsz6cJOTs3NloXgO95BVVhrtH+tku3+IthK3
	I+8XgJ8rkY9ZlCxkx3kCVHpOTaNTamSy7PjKuH4w5z8NoyeTNfRzN4bs
X-Gm-Gg: AYBFou3Co960eghaTZpv6vgpiPhiX7Lfrh6ug/RTulcFQd+Bl3CpOX7SxRYqHTsLg5T
	mv5viUr0+fZVEe5QirRgHhIHCq1BPCqRz9jCC91kThezFIqVYbV6ZFdbg3KdyHEQIKmOhXH4BYX
	yowTSiSkUq4G9nVbIfioy5lwB25PEuQoQ6TQDcAD6CGIivE4Iqli2VrjM0XSxoo29MtzG//Z2qD
	qnmGGIdkdmNPwh2N7PsuY3TlTs6BJ7cg/9ljQ7P7wXyci+LCXzstFO6DUxhK5kl5vQWpzomD+cy
	PJpSlTue1NttJ2+dIz+0V1JjYc2oIbJ+AKQdECjo07N6OMYHEjp76dWYtNMGurFSRUQHMPvC4Xw
	CTmfgQbtzflq3RfswD630G2XrCGkSoRC7b3RdjPuCSRhTBsIJbTPgPvFxk10b6AsoqfW6BMjDE+
	wy7JsMu3Ih5kr1YMxz2nwat7jQRTSMbWs3ZpzBW38aa5giB6K/u7cVz2issvSkEIaWoNCnJi7v+
	BBXWG3268Px3or//dhjnMSBM3lA+PxOse2GHxEM5xOCxHP7
X-Received: by 2002:aa7:88c3:0:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-861696788b3mr7866901b3a.3.1788528315173;
        Fri, 04 Sep 2026 06:25:15 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm1147302b3a.30.2026.09.04.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:25:14 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] mm/zswap: replace the zswap_pools list with an allocating xarray
Date: Fri,  4 Sep 2026 21:24:55 +0800
Message-ID: <22625ed4915936814f766092e9d7ac6637c5b2f4.1788528216.git.wujianyue000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788528216.git.wujianyue000@gmail.com>
References: <20260830114731.8322-1-wujianyue000@gmail.com> <cover.1788528216.git.wujianyue000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally zswap keeps its pools on an RCU list whose head also serves
as the current pool. Convert the pool table to an allocating xarray
keyed by a small integer id, and track the current pool with a separate
RCU-protected pointer.

The xarray gives each pool a stable id for a later zswap_entry shrink.
XA_FLAGS_ALLOC1 starts ids at 1, so id 0 remains reserved. The id range
is bounded by ZSWAP_MAX_POOL_ID because the later entry field is a u8.

Keep compressor switching close to the previous flow: look up an
existing pool under xa_lock, resurrect it outside the lock if reused, or
create a new one. zswap_pool_create() allocates the pool's id and
publishes it into the xarray as its final step, so the create call is
itself atomic: it either fully builds the pool and publishes it, or
unwinds completely on failure. Publishing makes the pool live, so a
caller that later fails (e.g. param_set_charp()) must still kill the
pool to erase it from the xarray. Runtime compressor parameter updates
are serialized by the module parameter lock, so no speculative loser
path is needed.

A retiring pool is erased from the xarray in __zswap_pool_empty() and
freed via queue_rcu_work(), preserving the old RCU teardown ordering.

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Suggested-by: Yosry Ahmed <yosry@kernel.org>
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 mm/zswap.c | 87 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 33 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index e456e5080531..74876acfa9dc 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -34,6 +34,7 @@
 #include <linux/writeback.h>
 #include <linux/pagemap.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>
 #include <linux/list_lru.h>
 #include <linux/zsmalloc.h>
 
@@ -154,12 +155,24 @@ struct zswap_pool {
 	struct zs_pool *zs_pool;
 	struct crypto_acomp_ctx __percpu *acomp_ctx;
 	struct percpu_ref ref;
-	struct list_head list;
 	struct rcu_work release_rwork;
 	struct hlist_node node;
+	u8 idx;
 	char tfm_name[CRYPTO_MAX_ALG_NAME];
 };
 
+/*
+ * Live pools keyed by id (1..ZSWAP_MAX_POOL_ID).  XA_FLAGS_ALLOC1 keeps
+ * the reserved id 0 unallocated, so looking it up never aliases a live
+ * pool.  XA_FLAGS_LOCK_BH makes the xa_lock softirq-safe: it is taken
+ * from __zswap_pool_empty(), which runs from a percpu_ref release
+ * callback in softirq context.
+ */
+#define ZSWAP_FIRST_POOL_ID 1
+#define ZSWAP_MAX_POOL_ID U8_MAX
+static DEFINE_XARRAY_FLAGS(zswap_pools, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH);
+static struct zswap_pool __rcu *zswap_current_pool;
+
 /* Global LRU lists shared by all zswap pools. */
 static struct list_lru zswap_list_lru;
 
@@ -200,10 +213,6 @@ struct zswap_entry {
 static struct xarray *zswap_trees[MAX_SWAPFILES];
 static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
-/* RCU-protected iteration */
-static LIST_HEAD(zswap_pools);
-/* protects zswap_pools list modification */
-static DEFINE_SPINLOCK(zswap_pools_lock);
 /* pool counter to provide unique names to zsmalloc */
 static atomic_t zswap_pools_count = ATOMIC_INIT(0);
 
@@ -275,6 +284,7 @@ static struct zswap_pool *zswap_pool_create(char *compressor)
 	struct zswap_pool *pool;
 	char name[38]; /* 'zswap' + 32 char (max) num + \0 */
 	int ret, cpu;
+	u32 id;
 
 	if (!zswap_has_pool && !strcmp(compressor, ZSWAP_PARAM_UNSET))
 		return NULL;
@@ -320,12 +330,24 @@ static struct zswap_pool *zswap_pool_create(char *compressor)
 			      PERCPU_REF_ALLOW_REINIT, GFP_KERNEL);
 	if (ret)
 		goto ref_fail;
-	INIT_LIST_HEAD(&pool->list);
+
+	ret = xa_alloc_bh(&zswap_pools, &id, pool,
+			  XA_LIMIT(ZSWAP_FIRST_POOL_ID, ZSWAP_MAX_POOL_ID),
+			  GFP_KERNEL);
+	if (ret) {
+		if (ret == -EBUSY)
+			pr_err("cannot allocate pool id (max %d live pools)\n",
+			       ZSWAP_MAX_POOL_ID - ZSWAP_FIRST_POOL_ID + 1);
+		goto xa_fail;
+	}
+	pool->idx = id;
 
 	zswap_pool_debug("created", pool);
 
 	return pool;
 
+xa_fail:
+	percpu_ref_exit(&pool->ref);
 ref_fail:
 	cpuhp_state_remove_instance(CPUHP_MM_ZSWP_POOL_PREPARE, &pool->node);
 
@@ -386,7 +408,7 @@ static void __zswap_pool_release(struct work_struct *work)
 	WARN_ON(!percpu_ref_is_zero(&pool->ref));
 	percpu_ref_exit(&pool->ref);
 
-	/* pool is now off zswap_pools list and has no references. */
+	/* The pool is no longer in zswap_pools and has no references. */
 	zswap_pool_destroy(pool);
 }
 
@@ -398,16 +420,16 @@ static void __zswap_pool_empty(struct percpu_ref *ref)
 
 	pool = container_of(ref, typeof(*pool), ref);
 
-	spin_lock_bh(&zswap_pools_lock);
+	xa_lock_bh(&zswap_pools);
 
 	WARN_ON(pool == zswap_pool_current());
 
-	list_del_rcu(&pool->list);
+	__xa_erase(&zswap_pools, pool->idx);
 
 	INIT_RCU_WORK(&pool->release_rwork, __zswap_pool_release);
 	queue_rcu_work(system_percpu_wq, &pool->release_rwork);
 
-	spin_unlock_bh(&zswap_pools_lock);
+	xa_unlock_bh(&zswap_pools);
 }
 
 static int __must_check zswap_pool_tryget(struct zswap_pool *pool)
@@ -433,7 +455,8 @@ static struct zswap_pool *__zswap_pool_current(void)
 {
 	struct zswap_pool *pool;
 
-	pool = list_first_or_null_rcu(&zswap_pools, typeof(*pool), list);
+	pool = rcu_dereference_check(zswap_current_pool,
+				     lockdep_is_held(&zswap_pools.xa_lock));
 	WARN_ONCE(!pool && zswap_has_pool,
 		  "%s: no page storage pool!\n", __func__);
 
@@ -442,7 +465,7 @@ static struct zswap_pool *__zswap_pool_current(void)
 
 static struct zswap_pool *zswap_pool_current(void)
 {
-	assert_spin_locked(&zswap_pools_lock);
+	lockdep_assert_held(&zswap_pools.xa_lock);
 
 	return __zswap_pool_current();
 }
@@ -462,14 +485,15 @@ static struct zswap_pool *zswap_pool_current_get(void)
 	return pool;
 }
 
-/* type and compressor must be null-terminated */
+/* compressor must be null-terminated */
 static struct zswap_pool *zswap_pool_find_get(char *compressor)
 {
 	struct zswap_pool *pool;
+	unsigned long id;
 
-	assert_spin_locked(&zswap_pools_lock);
+	lockdep_assert_held(&zswap_pools.xa_lock);
 
-	list_for_each_entry_rcu(pool, &zswap_pools, list) {
+	xa_for_each(&zswap_pools, id, pool) {
 		if (strcmp(pool->tfm_name, compressor))
 			continue;
 		/* if we can't get it, it's about to be destroyed */
@@ -495,9 +519,15 @@ unsigned long zswap_total_pages(void)
 {
 	struct zswap_pool *pool;
 	unsigned long total = 0;
+	unsigned long id;
 
+	/*
+	 * rcu_read_lock() is required here, not just for xa_for_each(): it also
+	 * keeps each pool alive while it is dereferenced, since a concurrently
+	 * retired pool is freed via queue_rcu_work() after a grace period.
+	 */
 	rcu_read_lock();
-	list_for_each_entry_rcu(pool, &zswap_pools, list)
+	xa_for_each(&zswap_pools, id, pool)
 		total += zs_get_total_pages(pool->zs_pool);
 	rcu_read_unlock();
 
@@ -554,20 +584,17 @@ static int zswap_compressor_param_set(const char *val, const struct kernel_param
 		return -ENOENT;
 	}
 
-	spin_lock_bh(&zswap_pools_lock);
-
+	xa_lock_bh(&zswap_pools);
 	pool = zswap_pool_find_get(s);
 	if (pool) {
 		zswap_pool_debug("using existing", pool);
 		WARN_ON(pool == zswap_pool_current());
-		list_del_rcu(&pool->list);
 	}
+	xa_unlock_bh(&zswap_pools);
 
-	spin_unlock_bh(&zswap_pools_lock);
-
-	if (!pool)
+	if (!pool) {
 		pool = zswap_pool_create(s);
-	else {
+	} else {
 		/*
 		 * Restore the initial ref dropped by percpu_ref_kill()
 		 * when the pool was decommissioned and switch it again
@@ -584,23 +611,17 @@ static int zswap_compressor_param_set(const char *val, const struct kernel_param
 	else
 		ret = -EINVAL;
 
-	spin_lock_bh(&zswap_pools_lock);
+	xa_lock_bh(&zswap_pools);
 
 	if (!ret) {
 		put_pool = zswap_pool_current();
-		list_add_rcu(&pool->list, &zswap_pools);
+		rcu_assign_pointer(zswap_current_pool, pool);
 		zswap_has_pool = true;
 	} else if (pool) {
-		/*
-		 * Add the possibly pre-existing pool to the end of the pools
-		 * list; if it's new (and empty) then it'll be removed and
-		 * destroyed by the put after we drop the lock
-		 */
-		list_add_tail_rcu(&pool->list, &zswap_pools);
 		put_pool = pool;
 	}
 
-	spin_unlock_bh(&zswap_pools_lock);
+	xa_unlock_bh(&zswap_pools);
 
 	/*
 	 * Drop the ref from either the old current pool,
@@ -1788,7 +1809,7 @@ static int zswap_setup(void)
 	pool = __zswap_pool_create_fallback();
 	if (pool) {
 		pr_info("loaded using pool %s\n", pool->tfm_name);
-		list_add(&pool->list, &zswap_pools);
+		rcu_assign_pointer(zswap_current_pool, pool);
 		zswap_has_pool = true;
 		static_branch_enable(&zswap_ever_enabled);
 	} else {
-- 
2.43.0

