Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9E3E0245
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680854; cv=none; b=t+rZhoYZXAF/bnOVlIaRdQBU94QvOygJrUR6eGyWvAX7Eu1hyj/2X7nAQCbz6WUme7f1ujOtIdSgXM8nS2gT9oXYJ043bp7HtLIWobR2jP0xDnfj9FwZ9hUOBqYnC6mrSGcqheiF8Keof911D5DFFRbFkVNYIS8eQ5o5ImvFFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680854; c=relaxed/simple;
	bh=oQTcMqmcb2ykFzgNObCXJvjBT9oiNdBbL6CkFLTxCy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDFNKu6JfRtvo8l5CwUYapn0QjQbbnjjkTD5VSo+MtBSgoJA4924SEVt7j6kBgxFRHTfubiyPjz0yXIEZQfqr9uy2Re/t5kYLO6E9DiU1MQpb9KA/VC8QiyUcm/MEBqX9mXakg6rAIIJJY7y+J8Dhq1j6SS4z9FiZEO1jnbE5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si1EKv6S; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si1EKv6S"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so25592095ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680852; x=1789285652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSsjcm7x9xAs+BmsWITo2dM5yWR0ym8L3hhdvVcy4pM=;
        b=Si1EKv6SHOhFJUKkbOdvayFX355eMPULCffDWeG8FBBsM8AVwKnotNhv+EarODUzOF
         2rxIIRpGtUQwypvCe3SUfkNKqn2fMPjSDjAYMlZgu8E09WO3/24Ht8TQKD3wMkk8h07c
         ixVI3Q2szDkoWlLNHUjwe9ue8Q+Hs2QD2XwbK0akODjY2jbH3rnD4IbV3brRBUvuyVsO
         ieQMA0axKVssNXWcM0UafC672vyCCvvakfT299T4XSfp/WFlck0D41up/VckiCQYq0Hh
         /HNGql0V8wpj1pU9AP3xZLY+xKouADnBuxzyRFDkFtsHcrvUe1Vp3FkxYu/UGlQERX1q
         gJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680852; x=1789285652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSsjcm7x9xAs+BmsWITo2dM5yWR0ym8L3hhdvVcy4pM=;
        b=VZjk8rpUTBS+LVhe8QvRfLiKUG0s3wOBzU9Q98okBpDFUpsyAYWv4Qm0tfedadTXH1
         ja4qVmbJucA4uDtuy3hxxpw2gA/TFC8S54uTt9YoDjRVqx4zu9OdOhaujrDcr0z3uEkf
         yTRsAvAGr7rTgqR8U2sBEuhP+M2NK2yH/pvwkIPxcicHFrM3i9x81hLDDRpjT3G6CvD8
         oBvXGxDQ3iViuitxGKfgQaPsGanhzwoEnlFXLHptBRwv5Ei3I0Txfc8jSQvdXF7joN1o
         6qEv0gcV+m9ZITPs3zJI+A8tEjh8Jw0EmIslboZrnW7QAU2Ya33RZJQySdAUmie1KA7L
         PCjg==
X-Forwarded-Encrypted: i=1; AKwUvBwtTflEDAdeR/m6lYxNLasF84CTt4ctJYOpG+PX8E1WOulxMIGfUk2/MW9XjDHMqAOD45jXJSxezpWJz24=@vger.kernel.org
X-Gm-Message-State: AFuF++kYNRrBFLXOs4XZgoLc1701T4kxXFbpka8VpVfG/O4hBlNwZ35o
	D4yWop4V9vG55om0WCHqm7HA9ZyPzIC2suqTcRnUHmMLpv97VopKM0Wh
X-Gm-Gg: AYBFou0EaOEHTCBHz3XAoQ5F+Sc+wbZvSm+ehcV69JSiuAxv+NnPkyAbwFP4slNQuqs
	Hb0kZXWduP/htFnntLz3O/mF/5fkc6H6nE1U8KKVevZ2cWM1oOHwUF1lGh0EUd3Cuw/F/X7X1BL
	yPEk2QHddQ8XYWNDlC5a+A3eZmeGDcLn04h12akTtlERyBTckLo8JYPWEKOYZsOLHnMo+RlWrIV
	a6soxYcKZ9hqEPFqWFNQLDGPAElCNq4GSA3mOevPzBxriHzP9S1DdemvOylk0z4qD4WMipsfMXb
	T4L/rmdn8gcyrfbLAtvbxz+aVlpACwiifRwrZdeAokkblbnzdEvdww3TQcr/zfNMSQeARezuWFn
	laOfho+o6uf/M7kfkYfu7EEUAVnC5bKHKzahc+U18zq1cT3Og8mu6tqMUM+yAeDHGhLVadEn1Ng
	fQxt9EtGKzXses+0qQw2Cj7wLQUVFPemzHasvPWlgM1fWXb0EppWvwVe7zIHm/yBQhsnsz97aMo
	bNLQTAZWsug7LEuDr9SSpdhyUzDFCUhesLhTNHXaFkevLFR0w==
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr26485339a91.11.1788680852316;
        Sun, 06 Sep 2026 00:47:32 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm21138905a91.16.2026.09.06.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:47:31 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 06 Sep 2026 15:47:18 +0800
Subject: [PATCH v6 2/3] mm/zswap: replace the zswap_pools list with an
 allocating xarray
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-shrink_zswap_entry_v6-v6-2-ac4cf61565fb@gmail.com>
References: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
In-Reply-To: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788680840; l=9534;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=oQTcMqmcb2ykFzgNObCXJvjBT9oiNdBbL6CkFLTxCy4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKM3EjzeMxLVbtS5O6J8JsvkhCt4itR5BM71w/fYDp6FCcf8nTgvx/WAI9XZAZDDZi450SCQKHM
 J1JIWeuEL9gY=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Originally zswap kept its pools on an RCU list whose head also served
as the current pool. Convert the pool table to an allocating xarray
keyed by a small integer id, and track the current pool with a separate
RCU-protected pointer.

The xarray gives each pool a stable id for a later zswap_entry shrink.
XA_FLAGS_ALLOC1 starts ids at 1, so id 0 remains reserved. The id range
is bounded by ZSWAP_MAX_POOL_ID because the later entry field is a u8.

Keep compressor switching close to the previous flow: look up an
existing pool with xa_for_each(), resurrect it if reused, or create a
new one. zswap_pool_create() allocates the pool's id and publishes it
into the xarray as its final step, so the create call either fully
publishes or fully unwinds on failure. Publishing makes the pool live,
so a caller that later fails (e.g. param_set_charp()) must still kill
the pool to erase it from the xarray.

Compressor switches update zswap_current_pool with rcu_assign_pointer(),
serialized by the module parameter lock, so no xa_lock is needed for
that update. The pool walk above is lockless under RCU. xa_lock is taken
only to allocate (xa_alloc_bh()) and erase (xa_erase_bh()) xarray
entries.

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Suggested-by: Yosry Ahmed <yosry@kernel.org>
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 mm/zswap.c | 122 +++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 66 insertions(+), 56 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index e456e5080531..86db023d63ed 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -34,6 +34,7 @@
 #include <linux/writeback.h>
 #include <linux/pagemap.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>
 #include <linux/list_lru.h>
 #include <linux/zsmalloc.h>
 
@@ -154,12 +155,23 @@ struct zswap_pool {
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
+ * Live pools keyed by id (1..ZSWAP_MAX_POOL_ID).  XA_FLAGS_ALLOC1 keeps id 0
+ * reserved so it is never handed to a live pool.  XA_FLAGS_LOCK_BH makes the
+ * xa_lock softirq-safe: it is taken from __zswap_pool_empty(), which runs from
+ * a percpu_ref release callback in softirq context.
+ */
+#define ZSWAP_FIRST_POOL_ID 1
+#define ZSWAP_MAX_POOL_ID U8_MAX
+static DEFINE_XARRAY_FLAGS(zswap_pools, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH);
+static struct zswap_pool __rcu *zswap_current_pool;
+
 /* Global LRU lists shared by all zswap pools. */
 static struct list_lru zswap_list_lru;
 
@@ -200,10 +212,6 @@ struct zswap_entry {
 static struct xarray *zswap_trees[MAX_SWAPFILES];
 static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
-/* RCU-protected iteration */
-static LIST_HEAD(zswap_pools);
-/* protects zswap_pools list modification */
-static DEFINE_SPINLOCK(zswap_pools_lock);
 /* pool counter to provide unique names to zsmalloc */
 static atomic_t zswap_pools_count = ATOMIC_INIT(0);
 
@@ -275,6 +283,7 @@ static struct zswap_pool *zswap_pool_create(char *compressor)
 	struct zswap_pool *pool;
 	char name[38]; /* 'zswap' + 32 char (max) num + \0 */
 	int ret, cpu;
+	u32 id;
 
 	if (!zswap_has_pool && !strcmp(compressor, ZSWAP_PARAM_UNSET))
 		return NULL;
@@ -320,12 +329,29 @@ static struct zswap_pool *zswap_pool_create(char *compressor)
 			      PERCPU_REF_ALLOW_REINIT, GFP_KERNEL);
 	if (ret)
 		goto ref_fail;
-	INIT_LIST_HEAD(&pool->list);
+
+	/*
+	 * Publish only after the pool is fully built, so lockless walkers
+	 * never see a half-initialized pool.  The _bh variant pairs with the
+	 * softirq-context xa_lock taken in __zswap_pool_empty().
+	 */
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
 
@@ -386,28 +412,22 @@ static void __zswap_pool_release(struct work_struct *work)
 	WARN_ON(!percpu_ref_is_zero(&pool->ref));
 	percpu_ref_exit(&pool->ref);
 
-	/* pool is now off zswap_pools list and has no references. */
+	/* The pool is no longer in zswap_pools and has no references. */
 	zswap_pool_destroy(pool);
 }
 
-static struct zswap_pool *zswap_pool_current(void);
-
 static void __zswap_pool_empty(struct percpu_ref *ref)
 {
 	struct zswap_pool *pool;
 
 	pool = container_of(ref, typeof(*pool), ref);
 
-	spin_lock_bh(&zswap_pools_lock);
-
-	WARN_ON(pool == zswap_pool_current());
+	WARN_ON(pool == rcu_access_pointer(zswap_current_pool));
 
-	list_del_rcu(&pool->list);
+	xa_erase_bh(&zswap_pools, pool->idx);
 
 	INIT_RCU_WORK(&pool->release_rwork, __zswap_pool_release);
 	queue_rcu_work(system_percpu_wq, &pool->release_rwork);
-
-	spin_unlock_bh(&zswap_pools_lock);
 }
 
 static int __must_check zswap_pool_tryget(struct zswap_pool *pool)
@@ -433,20 +453,13 @@ static struct zswap_pool *__zswap_pool_current(void)
 {
 	struct zswap_pool *pool;
 
-	pool = list_first_or_null_rcu(&zswap_pools, typeof(*pool), list);
+	pool = rcu_dereference(zswap_current_pool);
 	WARN_ONCE(!pool && zswap_has_pool,
 		  "%s: no page storage pool!\n", __func__);
 
 	return pool;
 }
 
-static struct zswap_pool *zswap_pool_current(void)
-{
-	assert_spin_locked(&zswap_pools_lock);
-
-	return __zswap_pool_current();
-}
-
 static struct zswap_pool *zswap_pool_current_get(void)
 {
 	struct zswap_pool *pool;
@@ -462,23 +475,28 @@ static struct zswap_pool *zswap_pool_current_get(void)
 	return pool;
 }
 
-/* type and compressor must be null-terminated */
+/* compressor must be null-terminated */
 static struct zswap_pool *zswap_pool_find_get(char *compressor)
 {
 	struct zswap_pool *pool;
+	unsigned long id;
 
-	assert_spin_locked(&zswap_pools_lock);
-
-	list_for_each_entry_rcu(pool, &zswap_pools, list) {
+	/*
+	 * __zswap_pool_empty() can erase from zswap_pools in softirq while we
+	 * walk.  rcu_read_lock() keeps the walk consistent and each pool alive
+	 * across tryget().  xa_for_each()'s own RCU does not span the loop body.
+	 */
+	rcu_read_lock();
+	xa_for_each(&zswap_pools, id, pool) {
 		if (strcmp(pool->tfm_name, compressor))
 			continue;
 		/* if we can't get it, it's about to be destroyed */
-		if (!zswap_pool_tryget(pool))
-			continue;
-		return pool;
+		if (zswap_pool_tryget(pool))
+			break;
 	}
+	rcu_read_unlock();
 
-	return NULL;
+	return pool;
 }
 
 static unsigned long zswap_max_pages(void)
@@ -495,9 +513,14 @@ unsigned long zswap_total_pages(void)
 {
 	struct zswap_pool *pool;
 	unsigned long total = 0;
+	unsigned long id;
 
+	/*
+	 * rcu_read_lock() keeps each pool alive across zs_get_total_pages().
+	 * xa_for_each()'s own RCU does not span the loop body.
+	 */
 	rcu_read_lock();
-	list_for_each_entry_rcu(pool, &zswap_pools, list)
+	xa_for_each(&zswap_pools, id, pool)
 		total += zs_get_total_pages(pool->zs_pool);
 	rcu_read_unlock();
 
@@ -554,20 +577,13 @@ static int zswap_compressor_param_set(const char *val, const struct kernel_param
 		return -ENOENT;
 	}
 
-	spin_lock_bh(&zswap_pools_lock);
-
 	pool = zswap_pool_find_get(s);
-	if (pool) {
+	if (!pool) {
+		pool = zswap_pool_create(s);
+	} else {
 		zswap_pool_debug("using existing", pool);
-		WARN_ON(pool == zswap_pool_current());
-		list_del_rcu(&pool->list);
-	}
-
-	spin_unlock_bh(&zswap_pools_lock);
+		WARN_ON(pool == rcu_access_pointer(zswap_current_pool));
 
-	if (!pool)
-		pool = zswap_pool_create(s);
-	else {
 		/*
 		 * Restore the initial ref dropped by percpu_ref_kill()
 		 * when the pool was decommissioned and switch it again
@@ -584,24 +600,18 @@ static int zswap_compressor_param_set(const char *val, const struct kernel_param
 	else
 		ret = -EINVAL;
 
-	spin_lock_bh(&zswap_pools_lock);
-
+	/*
+	 * Compressor switches are serialized by the kernel param lock, so this
+	 * is the only writer of zswap_current_pool: no xa_lock needed.
+	 */
 	if (!ret) {
-		put_pool = zswap_pool_current();
-		list_add_rcu(&pool->list, &zswap_pools);
+		put_pool = rcu_access_pointer(zswap_current_pool);
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
-
 	/*
 	 * Drop the ref from either the old current pool,
 	 * or the new pool we failed to add
@@ -1788,7 +1798,7 @@ static int zswap_setup(void)
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

