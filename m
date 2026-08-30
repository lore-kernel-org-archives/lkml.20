Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A23AAF43
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788090486; cv=none; b=RT4imuXGLq9FCQjlW14OG0NXhJFAJoivXkfhAPHi3TWCnaQ7tI2mpI2/AOlqXHIuze1XH16Pf+dQWEKkE27K/z2O+ZCjMFbs+mxV6djEIadJcN2wGYLNgLY4d5871wnEa5uOKXA0chiwAj1ZM3OsBuvqkJmcqvtASxTEjBs47P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788090486; c=relaxed/simple;
	bh=FervXIRyw43OBYO14oTZZBDzwZVgUWsR4CRlugmFWvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThjP17Yk8ctHkOfZV3JDeYjUb4CGz58BB/QGOPriraAg63Hyqrm7OLqturz18jVw9v2Y0VFxA6I5NIhb8GyoCE490ccWorIUZzW1fL4v29u46uf4Fg/E5DPc5AgtxrLu6lp8ZpmHgB2dSZtQGQ8G+rxd/D+RjtnMiPXP0F6E+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeDWx55n; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeDWx55n"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84864086bfeso2584000b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788090483; x=1788695283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZaMr9PcVum7xXG2P1QWnBBkzHTyXA9Vmtkj6+XCSfc=;
        b=JeDWx55nZxvoQ4S7DHIPM2EcqOLxvS82iMX9pNOA17vbubtI4C633dcRTm3wZui3sg
         eyh6J3e/zyMT75m4vAJb2X9mfPvYpRduaHDgb34ha7YblvIdF4DDIHyqxnQrFmAIs4+w
         aPOCsX7ZIje9Kn6hg9b36ZKVoTMXxXJSeycdrHEXK7L+lNRV4YJ0sUQb39R2+L2go1X9
         Re+eBdeL8GK5VVaUPZl93FV8+5n4obck2s3DPzoBpsLbHva1vraYg1UytI/cybUfbrcI
         +sYzoKi06pJ2H3ygXDUHzBhZ0dvJrDzLkcsZgvbxC5+R6sMcrhxJHFC6ZjFNFXjPgDkZ
         6HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788090483; x=1788695283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZaMr9PcVum7xXG2P1QWnBBkzHTyXA9Vmtkj6+XCSfc=;
        b=aYoVcGbxDJAkF0X0yjUvF8cx81ZXLC6tUkQkqhXRgeAQaG8KEpiCDPeTmQPt01Ty9Q
         eK7zb0ATuLdgSZz6NxcK9KFmJeKh/dQfgSoJdhbVx2ENbpLmsZtYWcJNRd68LQ7P2NVF
         Lt1D8f593/OtVZDKP7KoyK5L+XZ5QPC+o88wiOON/a7AP3GyXuemtUuPEEgz4AYfOi85
         BG535D/i6k2pC+jkbt9mxCXx4/Pcg+CCNsMfvHNE3SiGgB8+VlmtMICPK3SdORHReWhy
         +KY5DzxmrrzZYRrMFHeefhLgV/lmeMTM45cqoBBdw6uYSHVekqhiLo+/4a3k2j2h9aI2
         mE5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoCJX4O0ilA6TqcKVLEyalgvmI3K6veHOHAeh8SRVvJ4SaCulf3uDRmOOGEXlAHftFA4OPFSLu3E7pA6vk=@vger.kernel.org
X-Gm-Message-State: AFuF++m7EKUhq9aeEAphxlKQv4AvkkIRb8FDHTZSF+csSfl1p1g3PCfj
	KNWVpxd7djpbLRhqWWcgA+BbRsavuG5hB0Ir+Yl2g7OK6s/ktL9UwZyr
X-Gm-Gg: AR+sD12TdP0ZnpdFFWmwC20kDAP2sWyO3lZLi4DeJQ25n5yAa0eM6N9922aOfxyRYre
	xq75McZNTcOA2wKxobtWFMZwooYNoFEpun6l9ypw3Msm0DlNCtYPnakZ+x9q7pwd9lGBdwRPu9M
	uk5RekkQYiyACGE1GPONn7NZKizoLORm6MHUc08l+PMQvbE/vawrZPyGle5vUgqbryjAuwVYlE/
	jLHYJ9VghNdGIaPOsJjep+UdNCIR0NPNV71J923PWpiRymRuA5GJ4FqrRQODuQ8g2D+ZoGqp/3B
	t2rznDuQtn6bjqMrAJ1QPukqlnaUqNVhvBXTukNhYWqwkCC6wcUPyS75S1wrx2k18kTOVqZ6CsS
	DixOk1cFBd8wyBQScp5fASw28h8zx741ru6cgdXfR0dbmsof1A1M6hWRSPz4+IhqtHJRqZTIJsS
	3JTefG5z+3NnaSTkDCnv+E+hGP7VzQKQr7xUVHO7VVFmXadSTmWWLTmN90uGpP/+veirZVfATy+
	u64Z63VWhUwZdIVhr5f0HgNCIIR2WCkwfxVCg==
X-Received: by 2002:a05:6a00:1c9a:b0:84e:9257:d0c2 with SMTP id d2e1a72fcca58-8562a00149emr33552260b3a.9.1788090482772;
        Sun, 30 Aug 2026 04:48:02 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([2409:8929:a7b:121:d0e3:2a32:8ea7:5ade])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397c0a7sm2395264b3a.49.2026.08.30.04.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:48:02 -0700 (PDT)
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
Subject: [RFC PATCH v4 3/3] mm/zswap: reference the pool by index to shrink struct zswap_entry
Date: Sun, 30 Aug 2026 19:47:31 +0800
Message-ID: <20260830114731.8322-4-wujianyue000@gmail.com>
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

struct zswap_entry is one allocation per stored page, so its size is
pure overhead. It currently embeds an 8-byte pool pointer, even though
the live pools now sit in a small fixed array indexed by a u8 slot
number.

Replace the per-entry pool pointer with that u8 slot index and resolve
it through the fixed pool array. A live entry holds a reference to its
pool, so the slot cannot be reused under it. The lookup therefore needs
no RCU read-side section or zswap_pools_lock.

The u8 fits in the padding after the bool referenced field, shrinking
the entry from 56 to 48 bytes on x86_64. This raises objs_per_slab from
73 to 85 and saves about 2MiB of metadata per 1GiB of data held in
zswap.

Suggested-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 mm/zswap.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index b3b5e2887c00..521e0187bcd1 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -198,7 +198,7 @@ static struct shrinker *zswap_shrinker;
  *              writeback logic. The entry is only reclaimed by the writeback
  *              logic if referenced is unset. See comments in the shrinker
  *              section for context.
- * pool - the zswap_pool the entry's data is in
+ * pool_idx - slot of the zswap_pool that the entry's data is in.
  * handle - zsmalloc allocation handle that stores the compressed page data
  * objcg - the obj_cgroup that the compressed memory is charged to
  * lru - handle to the pool's lru used to evict pages.
@@ -207,12 +207,22 @@ struct zswap_entry {
 	swp_entry_t swpentry;
 	unsigned int length;
 	bool referenced;
-	struct zswap_pool *pool;
+	u8 pool_idx;
 	unsigned long handle;
 	struct obj_cgroup *objcg;
 	struct list_head lru;
 };
 
+static struct zswap_pool *zswap_entry_pool(struct zswap_entry *entry)
+{
+	/*
+	 * A live entry holds a pool reference, so the slot stays valid with no
+	 * RCU read-side section. The != 0 check marks access protected by
+	 * the reference. A live entry never uses the reserved slot 0.
+	 */
+	return rcu_dereference_check(zswap_pools[entry->pool_idx], entry->pool_idx != 0);
+}
+
 static struct xarray *zswap_trees[MAX_SWAPFILES];
 static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
@@ -808,9 +818,13 @@ static void zswap_entry_cache_free(struct zswap_entry *entry)
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
@@ -967,12 +981,15 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 
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
@@ -1008,7 +1025,7 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 	pr_alert_ratelimited("Decompression error from zswap (%d:%lu %s %u->%d)\n",
 						swp_type(entry->swpentry),
 						swp_offset(entry->swpentry),
-						entry->pool->tfm_name,
+						pool->tfm_name,
 						entry->length, dlen);
 	return false;
 }
@@ -1511,7 +1528,7 @@ static bool zswap_store_page(struct page *page,
 	 *    The publishing order matters to prevent writeback from seeing
 	 *    an incoherent entry.
 	 */
-	entry->pool = pool;
+	entry->pool_idx = pool->idx;
 	entry->swpentry = page_swpentry;
 	entry->objcg = objcg;
 	entry->referenced = true;
-- 
2.43.0

