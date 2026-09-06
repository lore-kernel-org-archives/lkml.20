Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AFA3E51E8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680857; cv=none; b=loweYsnrYugKDyoMHGr+Yvq09WNa4WACGo58SrdfwF62MMsgXEyIt+9j8OY8sujUcOKjf+MJCPK5FQ25FO8ucPYoXUhT/q/eW8DtHf2WY0iFh7AbxxdMMln0EK4SNPDJEeHfvcZt4j4FiUVWGN2mzqx6Z0mulcrcApdPPO8/jBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680857; c=relaxed/simple;
	bh=aySURi7Iu1LgXwQtkFbM8kcAXTbBl9vxZBkFnJ9ZVdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f56x4jF/hRQlifuXd9c5Ned7E1XUaFRVHrUayTAnBSOA/a2iCyNwyD1RmIFQHfD87x927SPQ+uBF9agi/4wsJ9p5GEVzItQvblhkXdmEHgGwb2v/WEtDGicwUE9ilxZTF6BSPtxrg+A3iapet2jpLThWT2U01gMKbHA/bBKxDa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzyqfiyR; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzyqfiyR"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2151019a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680856; x=1789285656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoId2o2x9KdlacVuk+UZ2/vbMr0aP2lUNDh5bJfaWLA=;
        b=hzyqfiyREnZ0mnhTRDryfpyVhuk7HS5+CepTfar/d8f33GbXEWGkupVysTaAiPF3SP
         f4TIXR69x7jjXJuJcsOvEAeY9U/pyMa6CCzErDUQBS/gIEIqv95p1Jr0LYa7ap0m1tPx
         1PZzrhrjHyzBX4JVWfeFfqaXCdYREizUolerAdJxvhFsz4koQSb6yFxr1UihdHS4J2Io
         gUWHSLQF1cQSyy0h1pjWEWm+EPtzO9C2aLLZ4Oj/Oout5SaDoPl2h/eTDJM47a8sBop0
         Uz2wjY8W8pTYXJ0X9r64YF7KDkESDPpOquZ9wJoKVUrhTlsRzn8u+JHSLrMEucK+8UxS
         TaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680856; x=1789285656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoId2o2x9KdlacVuk+UZ2/vbMr0aP2lUNDh5bJfaWLA=;
        b=lK7syabg6k4F9944mhhSc8gZgDaFKgNt89bjmOwRMyV2NG5BA1pasUSbacPA8vZcC2
         YU6K1Tr5ZGWcc6M6jbUTM7UBT+83V1JmQLRWZTo2nqu/rJsZJHmhmzg20qoEoIQuJZVM
         lCAkomvr8tJ8j1Ox27SkcbCkRZBZTxIwWbtKmihG7R0bQddbb+OLJVdT88gESuDN0F7d
         Xih2RtSKvzmdILgutHkm5rUqPQmvSrSJNtNrfUUbIWpcrOnNgUuyh1UsPzpneLyeIQmZ
         evFOxx8CQ5yIUomKJ8sywG63D1v3Dz8+BPz28qbUQTr2RTsch+PzbZob7nByYfh4ofDn
         HTKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2i3WmYHL5W+E8zOgfMGli08nt0ZYThY9YcrK6fJvASqdqBl33r6A+yNSTwoyMz/8kOHXvjDtqJLsKmXM=@vger.kernel.org
X-Gm-Message-State: AFuF++k9XVvGuk8S4BoGR3qkY34BZYRV+eAQ8mJXgp5ItGD0q2L9sA3v
	CAFAPaR4jwSq7WyTJZ5Yte1SifXUx7QPRyqFcNlEh6autTqTtszjZ4XP
X-Gm-Gg: AYBFou3hxJRXMMEmKyBn5qtg++MpRuelGhq9IOrOhgSk6mdnsdm+f3g5j58hlYyzr6C
	RoKX2t8qg747lt0BpFWJrSsKk5eQzIT4HU4nAANIgbRe+urZT1jfsEXq7+rolCg/wulS1KIpK9p
	hh+TTBcbRhKzVYw6u2cK3xDGjKlQHGDVNoGa31BOunLDs+Lj0MFTjh0hWGJlv+q44cj5wBCkMQE
	wdAMz9RwDY2Ltv3xhFvzjI5S7GxwG6nxDt5T7qiGwmMBMOhQaFqpQXwmqTXaYCLu6nYWEc0SW/9
	r2g81QL68t7n4k+sezrvT1yTjrWmQnpKcSawZAeGV9b4soQeAcvGmofTsoKk/EpBhMSZc/NFkdJ
	YZn5WzE69Kg+JuFHrvIoqKRgA68c09Ep6F2b+1+8E5KEOfqDd4fI6lEFpN+ARsQEVlU9MtywuRD
	JdPr+6eEd3Sxc6CDMfiEPk8UobynOASpEN3P/2uwDqlodqho/m2PiawU7Vs/NQRYLwC6j5bl2xk
	m3hp5vvQ7+irC8O7UkDg7Ii+kHfa1BvnQQpWpk=
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr22448300a91.18.1788680855786;
        Sun, 06 Sep 2026 00:47:35 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm21138905a91.16.2026.09.06.00.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:47:35 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 06 Sep 2026 15:47:19 +0800
Subject: [PATCH v6 3/3] mm/zswap: reference the pool by id to shrink struct
 zswap_entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-shrink_zswap_entry_v6-v6-3-ac4cf61565fb@gmail.com>
References: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
In-Reply-To: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788680840; l=4916;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=aySURi7Iu1LgXwQtkFbM8kcAXTbBl9vxZBkFnJ9ZVdk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPpwHMd9/QdHAzFgAbtJaK6isCG2rxSbIwPWQYshJrQ5IblpffIxNYW2Cc8NvsfLkXjSqcFV+5/
 /JAf50ZMmygY=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

struct zswap_entry is one allocation per stored page, so its size is
pure overhead. It currently embeds an 8-byte pool pointer, even though
the live pools now sit in an allocating xarray keyed by a small integer
id that fits in a u8.

Replace the per-entry pool pointer with that u8 id and resolve it
through the xarray with xa_load(). xa_load() does its own RCU-protected
lookup, so the caller needs no rcu_read_lock() section of its own. The
resolved pool stays valid because a live entry pins it via percpu_ref
(taken in zswap_store_page()), so its id cannot be reused. A live entry
never uses the reserved id 0, so a zeroed id resolves to NULL and trips
a WARN rather than aliasing a live pool.

The u8 fits in the padding after the bool referenced field, shrinking
the entry from 56 to 48 bytes on 64-bit. This raises objs_per_slab from
73 to 85 and saves about 2MiB of metadata per 1GiB of data held in
zswap.

Suggested-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 mm/zswap.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 86db023d63ed..253eebb971b9 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -194,7 +194,7 @@ static struct shrinker *zswap_shrinker;
  *              writeback logic. The entry is only reclaimed by the writeback
  *              logic if referenced is unset. See comments in the shrinker
  *              section for context.
- * pool - the zswap_pool the entry's data is in
+ * pool_idx - id of the zswap_pool that the entry's data is in.
  * handle - zsmalloc allocation handle that stores the compressed page data
  * objcg - the obj_cgroup that the compressed memory is charged to
  * lru - handle to the pool's lru used to evict pages.
@@ -203,12 +203,22 @@ struct zswap_entry {
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
+ * No RCU section is needed around the returned pointer: a stored entry pins
+ * its pool via percpu_ref (taken in zswap_store_page()), so the id cannot be
+ * reused under us.  Callers WARN and handle a NULL from a corrupt pool_idx.
+ */
+static struct zswap_pool *zswap_entry_pool(struct zswap_entry *entry)
+{
+	return xa_load(&zswap_pools, entry->pool_idx);
+}
+
 static struct xarray *zswap_trees[MAX_SWAPFILES];
 static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
@@ -759,9 +769,13 @@ static void zswap_entry_cache_free(struct zswap_entry *entry)
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
@@ -918,12 +932,15 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 
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
@@ -959,7 +976,7 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 	pr_alert_ratelimited("Decompression error from zswap (%d:%lu %s %u->%d)\n",
 						swp_type(entry->swpentry),
 						swp_offset(entry->swpentry),
-						entry->pool->tfm_name,
+						pool->tfm_name,
 						entry->length, dlen);
 	return false;
 }
@@ -1417,6 +1434,13 @@ static bool zswap_store_page(struct page *page,
 	if (!zswap_compress(page, entry, pool))
 		goto compress_failed;
 
+	/*
+	 * Set pool_idx before the xa_store() below publishes the entry, or a
+	 * concurrent reader could resolve a stale pool_idx left by slab reuse
+	 * to an unrelated live pool.
+	 */
+	entry->pool_idx = pool->idx;
+
 	old = xa_store(swap_zswap_tree(page_swpentry),
 		       swp_offset(page_swpentry),
 		       entry, GFP_KERNEL);
@@ -1462,7 +1486,6 @@ static bool zswap_store_page(struct page *page,
 	 *    The publishing order matters to prevent writeback from seeing
 	 *    an incoherent entry.
 	 */
-	entry->pool = pool;
 	entry->swpentry = page_swpentry;
 	entry->objcg = objcg;
 	entry->referenced = true;

-- 
2.43.0

