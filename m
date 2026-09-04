Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D54334688
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528325; cv=none; b=heMp1KIA3Xvml+W+yvxLnGARU5hi9nXZOtQVRwalgwayKLVS+S8P8xnRkuKnl7kcgmxdMTSZ7wQ5zC8ErbRSt+Jzsafvkh7aCxVcv4/dpxOLRwa4U5JuZNX+bRwtw8uWBReCbXUP0iP73cUWJl72D4ud7a77+46oMdQnS0oDhnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528325; c=relaxed/simple;
	bh=O9MCNSI+GMyP9gfLL+ocEAYNrlYLVYTd6UWI01eb7sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nn/b7lt7UxaIc85zz6R7ojGmCLvlBJvSU7R1xwaMNC90L9MYww6bWrirV6J0qrPAPOgqtpK8OWhusWJxb9kuY6CiZ/L6sqC3dh3sI8k0QpqUwxYwlQbFG7OAJHKFZRYDoDsMOygwO5w+a3SwdITlWWd6mo0WZfonh1PO7XvnXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhOJ1Awa; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhOJ1Awa"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso690510a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528318; x=1789133118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSh3mJfdO0nEIzhBW2LVy8p7WdUuzr0B9b3+/UuFCgI=;
        b=YhOJ1AwaGUwP1ayKIho1XdhHmhaKFgbSLiby/AWZBGCuDBUzCKNMYxLj/N3Db2xaVl
         fZAVi3ebYpFcSLBHWQxZ2vgVfv4FHqRxcjOmURsy1vxDoNT4PPEGer6bnwBpQKBwRWyW
         QS4YDAujXpcqsJEH73UICy+X/T2Nw6RA5cksm+cALMlLYKbnjp8CrmcXK0Zje9OnPOdc
         dzXU4O83KinUuOuxRif9un5Dh6vkih4BQYsZz0R8CtGPod1FYQwppQyKKlIB/RWLmKUy
         514q1/Z41ISJ4NbEyJGXM98GUYm+qnD/HOjr9xwDzPJyNev3PSNiPqQdiuA7fTIAHXkr
         /XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528318; x=1789133118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSh3mJfdO0nEIzhBW2LVy8p7WdUuzr0B9b3+/UuFCgI=;
        b=OgqRpVuoGZTn9nIqFoXEABKJyWiSANEYZKRVoSP8nuDNUWjlZS0S7/MjmanH+vt8dc
         EpDGlpXAZBH3TTHah5nKV3R0jbuGGJBdzJX4hsdouU0ENo1tNbv70n07WK4YexFaFGTl
         mFShR5DCb/1JlVd53kyplbamjDwNP/6YeKGlJ8cmzZUzzaV2inZ7MIll7ZME1xhOmy2+
         vWoNacx+mjtdWMXZ8daI0VXxfyho8YzWJtg2E2ngMlqsvJJ/fOgi6Yp5KLEzdtAK41Sq
         mN5PrPA29zv5OlLW2uoBkM3kQ0hTkzib8bJ20O10bA2YpdEqE39oR+RtJEK/aFpva8qz
         Eqgg==
X-Forwarded-Encrypted: i=1; AKwUvBwu8czpLDfSRc6EnGQgMqvwiz1o6xQG7YCyw/ar9TGfhXwbu7QbfdwR0cnHWMjPoO9oh8QUks21O/lL82A=@vger.kernel.org
X-Gm-Message-State: AFuF++mXKunYZE8kzYchpbV7EOCp5D84pC9GeH4/0NHLGj8amFYLuoXd
	FX4/4aD2y+Br8z5zmghfo4heWJ3iSRn9farQnLzlX11Ly3sPBcbTRM9k
X-Gm-Gg: AYBFou0K3XVrcyaKUTjNbg/+ZD/J662af7ADAoJEF8MgtmFeKTntSWf7+IqDfayRzeS
	7pOaSDpofkwN+D2lUe7x/mBIUWk5koykB8gPCxv9HygGvLrCq2x0gH3PyTMneMIkCjiQQQ4jntw
	gp4Crf5AtukMaw9Fb7isS9xHDqX4l4BHJf8WGXlpxjylwId7k5fjCrcyRfuYo3U82rSctkwGDiK
	J2y8wfC5+8/Mny70XqAS85AGSiaf+7MoCpf0FE3f44t9wRyAZFyW7wkTlyDdqxU1BYrAgQxqNpx
	kIe/8/fY+s1lvdQjZItvhS8+E+4z3rIeoxK5oATDe1hVzoncxjkjG9vNzkUAmWEirsRgwFu0ZWD
	oIUTGF4fChvszP9JoC3hKtAJMWoLM2F+Yook+fVjWeBiYl1U0xYHOqYb4Zi5kIzBiaVCNGFGZie
	JyV8gssGdseI3ipKRaInf4MBFZZ8XD+F2vJDxFs6xwL+MuDG5+Yl6hNStdwUcr0Ung6+UGKbw94
	gTy7xoaYRNGkaiFiIYqxayyd5Gu1hR18lm2cw==
X-Received: by 2002:a05:6a21:680d:b0:3d3:aee4:66f3 with SMTP id adf61e73a8af0-3da3a22a052mr9685866637.25.1788528318470;
        Fri, 04 Sep 2026 06:25:18 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm1147302b3a.30.2026.09.04.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:25:17 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] mm/zswap: reference the pool by id to shrink struct zswap_entry
Date: Fri,  4 Sep 2026 21:24:56 +0800
Message-ID: <5c4f72f1ffbd5f15d0b57fb1a87f73b4249ab424.1788528216.git.wujianyue000@gmail.com>
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

struct zswap_entry is one allocation per stored page, so its size is
pure overhead. It currently embeds an 8-byte pool pointer, even though
the live pools now sit in an allocating xarray keyed by a small integer
id that fits in a u8.

Replace the per-entry pool pointer with that u8 id and resolve it
through the xarray with xa_load(). A live entry holds a reference to its
pool, so the id cannot be reused under it; xa_load() is lockless and
only needs an rcu_read_lock() section, no zswap_pools_lock. A live entry
never uses the reserved id 0, so looking up that id resolves to NULL
and trips a WARN rather than aliasing a live pool.

The u8 fits in the padding after the bool referenced field, shrinking
the entry from 56 to 48 bytes on 64-bit. This raises objs_per_slab from
73 to 85 and saves about 2MiB of metadata per 1GiB of data held in
zswap.

Suggested-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 mm/zswap.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 74876acfa9dc..31cf0ef43d23 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -195,7 +195,7 @@ static struct shrinker *zswap_shrinker;
  *              writeback logic. The entry is only reclaimed by the writeback
  *              logic if referenced is unset. See comments in the shrinker
  *              section for context.
- * pool - the zswap_pool the entry's data is in
+ * pool_idx - id of the zswap_pool that the entry's data is in.
  * handle - zsmalloc allocation handle that stores the compressed page data
  * objcg - the obj_cgroup that the compressed memory is charged to
  * lru - handle to the pool's lru used to evict pages.
@@ -204,12 +204,27 @@ struct zswap_entry {
 	swp_entry_t swpentry;
 	unsigned int length;
 	bool referenced;
-	struct zswap_pool *pool;
+	u8 pool_idx;
 	unsigned long handle;
 	struct obj_cgroup *objcg;
 	struct list_head lru;
 };
 
+/*
+ * The pool stays alive after this returns because a stored entry holds a
+ * reference to its pool (taken in zswap_store_page()).
+ */
+static struct zswap_pool *zswap_entry_pool(struct zswap_entry *entry)
+{
+	struct zswap_pool *pool;
+
+	rcu_read_lock();
+	pool = xa_load(&zswap_pools, entry->pool_idx);
+	rcu_read_unlock();
+
+	return pool;
+}
+
 static struct xarray *zswap_trees[MAX_SWAPFILES];
 static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
@@ -770,9 +785,13 @@ static void zswap_entry_cache_free(struct zswap_entry *entry)
  */
 static void zswap_entry_free(struct zswap_entry *entry)
 {
+	struct zswap_pool *pool = zswap_entry_pool(entry);
+
 	zswap_lru_del(entry);
-	zs_free(entry->pool->zs_pool, entry->handle);
-	zswap_pool_put(entry->pool);
+	if (!WARN_ON_ONCE(!pool)) {
+		zs_free(pool->zs_pool, entry->handle);
+		zswap_pool_put(pool);
+	}
 	if (entry->objcg) {
 		obj_cgroup_uncharge_zswap(entry->objcg, entry->length);
 		obj_cgroup_put(entry->objcg);
@@ -929,12 +948,15 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 
 static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 {
-	struct zswap_pool *pool = entry->pool;
+	struct zswap_pool *pool = zswap_entry_pool(entry);
 	struct scatterlist input[2]; /* zsmalloc returns an SG list 1-2 entries */
 	struct scatterlist output;
 	struct crypto_acomp_ctx *acomp_ctx;
 	int ret = 0, dlen;
 
+	if (WARN_ON_ONCE(!pool))
+		return false;
+
 	acomp_ctx = raw_cpu_ptr(pool->acomp_ctx);
 	mutex_lock(&acomp_ctx->mutex);
 	zs_obj_read_sg_begin(pool->zs_pool, entry->handle, input, entry->length);
@@ -970,7 +992,7 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 	pr_alert_ratelimited("Decompression error from zswap (%d:%lu %s %u->%d)\n",
 						swp_type(entry->swpentry),
 						swp_offset(entry->swpentry),
-						entry->pool->tfm_name,
+						pool->tfm_name,
 						entry->length, dlen);
 	return false;
 }
@@ -1428,6 +1450,16 @@ static bool zswap_store_page(struct page *page,
 	if (!zswap_compress(page, entry, pool))
 		goto compress_failed;
 
+	/*
+	 * Set pool_idx before publishing the entry: compression has
+	 * succeeded and the pool is already pinned by this store, so the id is
+	 * final.  Doing it here (rather than after xa_store()) means the entry
+	 * is never briefly visible with a stale pool_idx left over from slab
+	 * reuse, which zswap_entry_pool() would otherwise resolve to an
+	 * unrelated live pool.
+	 */
+	entry->pool_idx = pool->idx;
+
 	old = xa_store(swap_zswap_tree(page_swpentry),
 		       swp_offset(page_swpentry),
 		       entry, GFP_KERNEL);
@@ -1473,7 +1505,6 @@ static bool zswap_store_page(struct page *page,
 	 *    The publishing order matters to prevent writeback from seeing
 	 *    an incoherent entry.
 	 */
-	entry->pool = pool;
 	entry->swpentry = page_swpentry;
 	entry->objcg = objcg;
 	entry->referenced = true;
-- 
2.43.0

