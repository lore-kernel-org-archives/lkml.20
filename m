Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3993B05B6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788090478; cv=none; b=HG2KqPK78PrlkuWwTWLpjUoZ/zCQg9Z2XwQjJS/3uIVjYtr5XxwHY0TTfTsPLigePkSx/5xnUDTSseiemLnjkAQkhwP4g/1y4OEQl/88dE/NRexq0/hTcERSeVHNuO13Otr7JMuTrMfy+315olxHitt4DT6BCEC7DaZP35/4uaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788090478; c=relaxed/simple;
	bh=TG/tnR9sDfGM5yHrG3LWTG8fvKdEeVzEQ53MY5CmnN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WINyXUhaBukKiXBtnCL/pkoIsnrRqp+EPPM9vVm2zqUOTuvBtVwKNFnvhYs6qa5OcuzS4xdTp+owHUNCemnsTE1xEvh/XMuiJwLuZFUQmbqeSCMUuCYr3/qUwSXNURakq/NZJLtnLXnpvHeiAvj+XsKK7wdLtcgVsHLeUygxdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7T8+gGK; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7T8+gGK"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso2431016b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788090476; x=1788695276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzS/CUfq1CG/W/aMP1Q7L3GLy6yqyPsMXhDWwjppSfA=;
        b=n7T8+gGKrQJVRdQBw/QbdbI2rWjgP5nZhASMo75j+C2AQwYbVaukh+dLpi4qmOoFhy
         gerfc+ODOIRIUewwZkpGrPIiNKsMaUMbTzjXlTlHDMz55oEckwmv6GLKW2Daox57JtCr
         alQ7TZDSMLkkYhIdSObaYzaIOUYb2FpExjcru4xy5I5YqOlCmZWH3gbzBxhYBFtZNdez
         sjakXSdi86Ek2l4Km42yNKWFpeCRXJFIoQFqphA7S8I7tJpXP2C6of0Hg8D4piJpyr3c
         LIiJJj1+zunTo5/6etzRIx44pZwuc06NTBdphKW9dkVZ/F/EvnRVlwSDO5czgsAFko8R
         ZizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788090476; x=1788695276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzS/CUfq1CG/W/aMP1Q7L3GLy6yqyPsMXhDWwjppSfA=;
        b=PUivGRWT5C9Q8aT1XDdGbxHhx44IpTyWQDn08F3zQcnEPorne4V7CUP/hpCQDQYnJD
         ZDXxYu+eUOz0G8zkz+rucMw9K0VIaiCZmJCdddfPc3hGE30s/P9LWt3FpfynS5bnuwaO
         tZSlYqsCNOIhC36eCRXtPKXORxVPhty0xe2SfO3u0qYZ7yqDJ73lD/++vtdj+5AlONC0
         jB4oVRer85t/eDs7hXmJc5MW20LFILqXFGpKb2+a7tuF51R/OkOIY3xeJQrlS7X7/+zY
         0nFuOkoP10YcLRmPGsgrYGd/bWEKZg3zejZKZyBWm6l2jPR3qcT/j3CyB138WcGLyYo3
         V+dQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEFXSQrQ2HG1bzTNnyDgsjyj8y6Lso6I9DkkXJUlOlgHZ0OCNeWpp7iKrJPbc3sX/h/k0+AW4pmjw5V5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mfYuhTQC3WosYbOidZ6Ij/MfpXZzLZucpzDmWzRUxPmuWply5Q
	XPXkWKO9azYCUpxhLci8o3a/N5HwXF1+jcYs3KxEuI3ZQQoCIV4gUR3g
X-Gm-Gg: AR+sD114KSD44pQzILP4f9TNoS/EFqW2UR2wToLbD6oRZs1yU/Xp3YQFmrgfjW0m7mZ
	UQKi+W+J8WkXcxdi8lNPQsCRx8P3cOY1IJqqYDNZCn4B11u4p9GCat5Ofhr7wkUiyE46WbiN6Os
	phvNRBfoC1v8TEVU20XYxziJyz+A5Y2Pbd7zsyTGmwuc5zQ4cZyJGw9BWnzj1Wlm6kzB1YL6zcc
	tet5Rr7eFDjuEiYEd8OsX/qQpolK37jLFxM8Pw63B5mmNxGS8F7TjlrvJrUysyw3FV/cQFTF1W5
	P3vNJDeAhkXyZnVjtTmO3Qc5w88g33D/eDBcLRBB5LAiMFB8icI0+MZtFC7YK0Ry5RlfHFlVwyK
	HkBeVlzxsv3dKXJPij7NsqJcnw+bOz3kkTlK+5t7bFWNGb+NcbkfbL/Ppt83cEfcUS5wz018jjp
	6FTSdSdmM0PpQRqpjQhr15kZxzA3u3M0P2RW9J37VMPjGd9hGksZwkKwwq8nMPOwut2pUk3fCMb
	mTgwp6tibOQRLqZ+/8h5IbxgingHcOcjTqAjFsy3xvsjd8U
X-Received: by 2002:a05:6a00:3311:b0:857:72ba:ff0a with SMTP id d2e1a72fcca58-85772baff9cmr19441422b3a.18.1788090475923;
        Sun, 30 Aug 2026 04:47:55 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([2409:8929:a7b:121:d0e3:2a32:8ea7:5ade])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397c0a7sm2395264b3a.49.2026.08.30.04.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:47:55 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Jianyue Wu <wujianyue000@gmail.com>,
	Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 2/3] mm/zswap: replace the zswap_pools list with a fixed pools array
Date: Sun, 30 Aug 2026 19:47:30 +0800
Message-ID: <20260830114731.8322-3-wujianyue000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830114731.8322-1-wujianyue000@gmail.com>
References: <20260830114731.8322-1-wujianyue000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally zswap holds its pools on an RCU list whose head also serves
as the "current pool". Only a handful of pools are ever live at once,
since a new pool is only created when the compressor is (re)set and
pools are reused across compressor switches.

Hold the pools in a fixed ZSWAP_MAX_POOLS-element array so each pool
has a stable slot number, and track the current pool with a separate
rcu-protected pointer.

Slot 0 is intentionally left unused (always NULL): a zeroed or
incorrectly initialized pool index then resolves to NULL and trips a
WARN rather than silently aliasing a live pool in another slot.

The array keeps the same RCU publish/retire discipline the list had,
so lookup and teardown stay equivalent. A fully-constructed pool is
stored into its slot as the last step of zswap_pool_create(), so array
walkers only ever observe a NULL slot or a ready pool. Pool creation
is serialized by the module-wide kernel param mutex (all built-in
params share one lock) and otherwise only happens during
single-threaded init, so no two creators race for a slot.
zswap_pools_lock still serializes the store against a retiring pool
clearing its slot in __zswap_pool_empty().

Behavior change: the fixed array bounds the number of simultaneously
live pools at ZSWAP_MAX_POOLS - 1 (15, since slot 0 is reserved),
whereas the old list was unbounded. A pool is only live while it is
the current pool or still has stored pages referencing it, and pools
are reused across compressor switches, so 15 is far more than any real
configuration needs. Once all slots are occupied, creating a pool for
a 16th distinct compressor fails: zswap_pool_create() errors and
returns NULL, and the compressor switch is rejected with -EINVAL
rather than silently succeeding. The cap can be raised by increasing
ZSWAP_MAX_POOLS (bounded by the u8 slot index, so up to 256).

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 mm/zswap.c | 97 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 72 insertions(+), 25 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 0bb30e58950a..b3b5e2887c00 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -13,6 +13,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/cpu.h>
 #include <linux/highmem.h>
@@ -154,12 +155,27 @@ struct zswap_pool {
 	struct zs_pool *zs_pool;
 	struct crypto_acomp_ctx __percpu *acomp_ctx;
 	struct percpu_ref ref;
-	struct list_head list;
 	struct rcu_work release_work;
 	struct hlist_node node;
+	u8 idx;
 	char tfm_name[CRYPTO_MAX_ALG_NAME];
 };
 
+#define ZSWAP_MAX_POOLS 16
+/*
+ * Slot 0 is intentionally never used: it stays NULL so that a zeroed or
+ * incorrectly initialized pool->idx resolves to NULL (and trips a WARN)
+ * instead of silently aliasing a live pool in another slot.
+ */
+#define ZSWAP_FIRST_POOL_SLOT 1
+static struct zswap_pool __rcu *zswap_pools[ZSWAP_MAX_POOLS];
+static_assert(ZSWAP_MAX_POOLS - 1 <= U8_MAX);
+/*
+ * The current pool (NULL if none): an alias of one zswap_pools[] slot.
+ * It always holds a ref, so a pool is never retired while it is current.
+ */
+static struct zswap_pool __rcu *zswap_current_pool;
+
 /* Global LRU lists shared by all zswap pools. */
 static struct list_lru zswap_list_lru;
 
@@ -200,9 +216,6 @@ struct zswap_entry {
 static struct xarray *zswap_trees[MAX_SWAPFILES];
 static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
-/* RCU-protected iteration */
-static LIST_HEAD(zswap_pools);
-/* protects zswap_pools list modification */
 static DEFINE_SPINLOCK(zswap_pools_lock);
 /* pool counter to provide unique names to zsmalloc */
 static atomic_t zswap_pools_count = ATOMIC_INIT(0);
@@ -270,6 +283,31 @@ static void acomp_ctx_free(struct crypto_acomp_ctx *acomp_ctx)
 	acomp_ctx->buffer = NULL;
 }
 
+/*
+ * Publish a fully-constructed pool into a free array slot.  Pool creation is
+ * serialized by the module-wide kernel param mutex (all built-in params share
+ * one lock) and only otherwise happens during single-threaded init, so no two
+ * creators race for a slot.  The pool is complete before it is stored, and
+ * zswap_pools_lock still serializes this store against a concurrent retiring
+ * pool clearing its slot in __zswap_pool_empty(), so array walkers only ever
+ * observe a NULL slot or a ready pool.
+ */
+static int zswap_pool_assign_slot(struct zswap_pool *pool)
+{
+	int i;
+
+	guard(spinlock_bh)(&zswap_pools_lock);
+	for (i = ZSWAP_FIRST_POOL_SLOT; i < ZSWAP_MAX_POOLS; i++) {
+		if (!rcu_access_pointer(zswap_pools[i])) {
+			pool->idx = i;
+			rcu_assign_pointer(zswap_pools[i], pool);
+			return i;
+		}
+	}
+
+	return -ENOSPC;
+}
+
 static struct zswap_pool *zswap_pool_create(char *compressor)
 {
 	struct zswap_pool *pool;
@@ -313,19 +351,29 @@ static struct zswap_pool *zswap_pool_create(char *compressor)
 	if (ret)
 		goto cpuhp_add_fail;
 
-	/* being the current pool takes 1 ref; this func expects the
-	 * caller to always add the new pool as the current pool
+	/*
+	 * The initial ref keeps the pool alive while it is current. Stored
+	 * entries take additional refs so a retired pool remains alive while
+	 * any entries still reference it.
 	 */
 	ret = percpu_ref_init(&pool->ref, __zswap_pool_empty,
 			      PERCPU_REF_ALLOW_REINIT, GFP_KERNEL);
 	if (ret)
 		goto ref_fail;
-	INIT_LIST_HEAD(&pool->list);
+
+	ret = zswap_pool_assign_slot(pool);
+	if (ret < 0) {
+		pr_err("cannot create more than %d pools\n",
+		       ZSWAP_MAX_POOLS - ZSWAP_FIRST_POOL_SLOT);
+		goto slot_fail;
+	}
 
 	zswap_pool_debug("created", pool);
 
 	return pool;
 
+slot_fail:
+	percpu_ref_exit(&pool->ref);
 ref_fail:
 	cpuhp_state_remove_instance(CPUHP_MM_ZSWP_POOL_PREPARE, &pool->node);
 
@@ -386,7 +434,6 @@ static void __zswap_pool_release(struct work_struct *work)
 	WARN_ON(!percpu_ref_is_zero(&pool->ref));
 	percpu_ref_exit(&pool->ref);
 
-	/* pool is now off zswap_pools list and has no references. */
 	zswap_pool_destroy(pool);
 }
 
@@ -402,7 +449,7 @@ static void __zswap_pool_empty(struct percpu_ref *ref)
 
 	WARN_ON(pool == zswap_pool_current());
 
-	list_del_rcu(&pool->list);
+	rcu_assign_pointer(zswap_pools[pool->idx], NULL);
 
 	INIT_RCU_WORK(&pool->release_work, __zswap_pool_release);
 	queue_rcu_work(system_percpu_wq, &pool->release_work);
@@ -433,7 +480,8 @@ static struct zswap_pool *__zswap_pool_current(void)
 {
 	struct zswap_pool *pool;
 
-	pool = list_first_or_null_rcu(&zswap_pools, typeof(*pool), list);
+	pool = rcu_dereference_check(zswap_current_pool,
+				     lockdep_is_held(&zswap_pools_lock));
 	WARN_ONCE(!pool && zswap_has_pool,
 		  "%s: no page storage pool!\n", __func__);
 
@@ -466,11 +514,12 @@ static struct zswap_pool *zswap_pool_current_get(void)
 static struct zswap_pool *zswap_pool_find_get(char *compressor)
 {
 	struct zswap_pool *pool;
+	int i;
 
-	assert_spin_locked(&zswap_pools_lock);
-
-	list_for_each_entry_rcu(pool, &zswap_pools, list) {
-		if (strcmp(pool->tfm_name, compressor))
+	for (i = ZSWAP_FIRST_POOL_SLOT; i < ZSWAP_MAX_POOLS; i++) {
+		pool = rcu_dereference_protected(zswap_pools[i],
+						 lockdep_is_held(&zswap_pools_lock));
+		if (!pool || strcmp(pool->tfm_name, compressor))
 			continue;
 		/* if we can't get it, it's about to be destroyed */
 		if (!zswap_pool_tryget(pool))
@@ -495,10 +544,14 @@ unsigned long zswap_total_pages(void)
 {
 	struct zswap_pool *pool;
 	unsigned long total = 0;
+	int i;
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(pool, &zswap_pools, list)
-		total += zs_get_total_pages(pool->zs_pool);
+	for (i = ZSWAP_FIRST_POOL_SLOT; i < ZSWAP_MAX_POOLS; i++) {
+		pool = rcu_dereference(zswap_pools[i]);
+		if (pool)
+			total += zs_get_total_pages(pool->zs_pool);
+	}
 	rcu_read_unlock();
 
 	return total;
@@ -560,7 +613,6 @@ static int zswap_compressor_param_set(const char *val, const struct kernel_param
 	if (pool) {
 		zswap_pool_debug("using existing", pool);
 		WARN_ON(pool == zswap_pool_current());
-		list_del_rcu(&pool->list);
 	}
 
 	spin_unlock_bh(&zswap_pools_lock);
@@ -588,15 +640,9 @@ static int zswap_compressor_param_set(const char *val, const struct kernel_param
 
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
 
@@ -1801,7 +1847,8 @@ static int zswap_setup(void)
 	pool = __zswap_pool_create_fallback();
 	if (pool) {
 		pr_info("loaded using pool %s\n", pool->tfm_name);
-		list_add(&pool->list, &zswap_pools);
+		/* zswap_pool_create() already stored the pool in its array slot. */
+		rcu_assign_pointer(zswap_current_pool, pool);
 		zswap_has_pool = true;
 		static_branch_enable(&zswap_ever_enabled);
 	} else {
-- 
2.43.0

