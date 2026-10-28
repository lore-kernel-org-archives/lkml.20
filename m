Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156719;
	b=Ke7uHDTyuXA5fxG6ReJG6XZXYjRtc8kaIk+oJzER3B24EG1vn0yxhMoc8Cvek+hkW/zW
	 ROCT3uw8NCV28w2lkOLTbcR1+pFKOIGoeSjCb6BPEDqZEh3f7PjzYFndXPKzjjoHIqiq5
	 NZnnzai3L9MYcSL3o+hkup8Cvh5JUuL0rMgqP7XsON0srsNe141hRcmDYablAkrz2/gfe
	 zOX46u94GaI5WgnoZ9UHMSzxiII+brqhHlr0tpceJkmguuQ4EQYENXAwW5h5dIOje/zE/
	 Z4OrCHfeOjLC+KWqrvnmnY/R5qtpNgW4H93kfhz3TVwI3bbZSqaxr2yM7M6esgWPDoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3MUpJwq590qKxQafFD8yMuDx2EKKmvFmC/ravAUrJ70=;
	b=xdjVlGcIlvgiHunoAlL3SDvgPZb57lTTAaqWFMzm9btS+kA40tRolzKu/jjStN/6y8v6
	 G4cb8nHfZSBb4Hhgg6o7NqX7nCH3NHadGQo72zxYK4lW19kM0Brv0whAS3IsOaEizRNSJ
	 o5u4lYj+wNA8wp0IBkRmqK8GNFiOGyPXRNXHpu5zSsYsR5eiSRR8rbATNtFGcHaLvsZJq
	 ceoZPrEA7lv6SNgkMx/Lv/5giC28DzeNcJYOw0YbRa55uVOmfK/2fXSJmM16TXhfqzzfU
	 1tGy/bvCh5OKBKnZzR57eD1A5wT2wgi3fMJD1bVAagUCPGr7TZ3MUvFaAtbHozyxTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lu0aN/Bf";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE771606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE771606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lu0aN/Bf
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-156cbe59524so569304c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156718; x=1793761518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MUpJwq590qKxQafFD8yMuDx2EKKmvFmC/ravAUrJ70=;
        b=lu0aN/Bf13LzUy/y7a8c9pHBCWjgPjy2A5uDvfFvXglkah6xQzVtJxKQWfFiezaU8p
         /Jcca6GYoyM62Qm9anLld99DCIaqedrdq6i/Y8YGeiG3F8F6QF55T2q26fN+QDy0+tNR
         2JRci5gscV7kF+s/lcliRkwuAOqwGOqM9qCOF5SemgyyaF1btvd48JywxLnZUDcJ9WEs
         gVC51P+BSBe/25Uk823KGINiumgTwtGV8nyTFjFX1CJmeN2/mb7+f7dIW22M0D9H6LzT
         Z+Xu8Ec1B9J+KwoNTGMZOY9Rval/OPzG2QVCNvwPYfl19x1YbpZ63qB2kDuOoPjMa5dm
         nxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156718; x=1793761518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MUpJwq590qKxQafFD8yMuDx2EKKmvFmC/ravAUrJ70=;
        b=KKni1+y4jywJ7WQyXCKqT6S8uZ0qy+BH0MpLyxXzIrKYVlzhH8cwWY2iwSXW+WYEEU
         tFt+C0v6XkB3qKknISHm9XaA0MVBK+Zymz/WZ4DzYqcMBVRtiGzRSWU6LyOiEkIxDikW
         OPO3GJq1QEKpeMTUrXy2g4E+dCOodczMlPYGoDu75RHyJbkRwjWF7rHTk9x2OJ6Gnxis
         N8NNDdISSjBkcQzZpXWYaiWo9W/XlkuVjpi5G+eMAp9zRX5o9JEggczgyH6OSN39f3Tk
         ydx6iQOMGMpQtl/WQImMTbm9sCTVoeV5MPcXelkSBqspUs/dxRsVYBV8cq/pRbcpipO6
         7azg==
X-Forwarded-Encrypted: i=1; AKwUvByJxVAry1NP/XxI04wniKP58iMNLlPjmVc3fZVyKZvcwwTJn9vTbPJ1uHxlneH7WhebZjQcGGBQLxA5qeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0MlzpWJNWaODVsJA7XbJ2v6TIqaAWUzUHTdISQwdDFawfEw/J
	bTPpv4csTCEvBILZmcInllEVUeoy9XzAW0UjhuHAglYv6m7HPOSO/o0V
X-Gm-Gg: AYBFou3Q+NU1DpD55xM0bPTmnrL0YFKmO8HRx18eVsb+JNarTdzibm3Jz6bIelBB7Gl
	rMyLFZsWdlueSX+zu0GbKbAM+UwS3qMK51QaOI+Big/KyN1qYM9+hjKMgGLWilBlGeodqfuzPPU
	dK/R7fmdKagWRv5DuANc+Y8cb0bb2DAdLJ5Q4KaWkkEGqYHK69sdcB4XmgtL/GVyaCINP8Lehtm
	P0nRZCzuUjxOLfs3LzB8dIzm/bEjbt0CbvvP2HDphngCVelJGGo7xLSjtULyYifrzQqlW477cUj
	R+3zCUaP4jiWDwimBgZ5WnOWvL1lRTlWEpoAe26YTmXAiYGwf0q44p3JYA8veNi3dSuIFcYyXg+
	zDE+LhIz/2QGIq0xbrESJlRwsHe6UnWAoB3EkIqEVoT6OySJSr4qvyt8fFjR2rzswkoA859IWd3
	yYADyzHDjXCmoDL6BeZDfUbzSEqMuJ3LPNga49tX4FWapre0NEmPNSPWiT6KZMV6u6Hwn97ePPz
	Ac+UfX1uQsroatjDLaZIrAqRiKe7CUCCBsLIk7Fg3LqVeS4ynzFlJaScoIP3c2vqboq/b8KYVVh
	oQg6hPE63VXUYmPTtMRMlX1meAmx8n6YVYkFY8v4rw==
X-Received: by 2002:a05:701b:4552:10b0:1a3:dfb6:e593 with SMTP id a92af1059eb24-1a6ced8ee94mr1353465c88.27.1793156717838;
        Tue, 27 Oct 2026 20:05:17 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm1150734c88.3.2026.10.27.20.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:05:17 -0700 (PDT)
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
To: hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	kanchanapsridhar2026@gmail.com,
	linux-kernel@vger.kernel.org
Cc: rientjes@google.com,
	willy@infradead.org,
	senozhatsky@chromium.org
Subject: [PATCH v2 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
Date: Tue, 27 Oct 2026 20:05:00 -0700
Message-Id: <20261028030503.17923-6-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
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

When storing a folio in zswap, save the folio's node id in the zswap
entry instead of relying on the zswap_entry being allocated on the same
node. This enables optimizations such as batch allocation of zswap
entries for large folios using kmem_cache_alloc_bulk() that does not
support specifying a node id.

Accordingly, replace the SLUB allocation in zswap_entry_cache_alloc() to
be node-agnostic.

The size of the zswap_entry remains unchanged as 'referenced' is lumped
in with the 'length' (as it doesn't need a full unsigned int anyway).
A build time assertion checks for the zswap_entry's 'length' bitfield
being at least as large as the PAGE_SHIFT, which can be 18 on some
architectures.

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 mm/zswap.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index e1d57a7d9595..19b7d60bc7d2 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -180,6 +180,7 @@ struct zswap_pool {
  */
 #define ZSWAP_FIRST_POOL_ID 1
 #define ZSWAP_MAX_POOL_ID U8_MAX
+#define ZSWAP_MAX_COMPR_LENGTH_SHIFT 18U
 static DEFINE_XARRAY_FLAGS(zswap_pools, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH);
 static struct zswap_pool __rcu *zswap_current_pool;
 
@@ -206,15 +207,19 @@ static struct shrinker *zswap_shrinker;
  *              logic if referenced is unset. See comments in the shrinker
  *              section for context.
  * pool_idx - id of the zswap_pool that the entry's data is in.
+ * nid - NUMA node id of the page for which this is the zswap entry.
  * handle - zsmalloc allocation handle that stores the compressed page data
  * objcg - the obj_cgroup that the compressed memory is charged to
  * lru - handle to the pool's lru used to evict pages.
  */
 struct zswap_entry {
 	swp_entry_t swpentry;
-	unsigned int length;
-	bool referenced;
-	u8 pool_idx;
+	struct {
+		unsigned int length:ZSWAP_MAX_COMPR_LENGTH_SHIFT;
+		bool referenced:1U;
+		u8 pool_idx;
+	};
+	int nid;
 	unsigned long handle;
 	struct obj_cgroup *objcg;
 	struct list_head lru;
@@ -679,14 +684,8 @@ static int zswap_enabled_param_set(const char *val,
 * lru functions
 **********************************/
 
-static inline int entry_to_nid(struct zswap_entry *entry)
-{
-	return page_to_nid(virt_to_page(entry));
-}
-
 static void zswap_lru_add(struct zswap_entry *entry)
 {
-	int nid = entry_to_nid(entry);
 	struct mem_cgroup *memcg;
 
 	/*
@@ -703,19 +702,18 @@ static void zswap_lru_add(struct zswap_entry *entry)
 	rcu_read_lock();
 	memcg = obj_cgroup_memcg(entry->objcg);
 	/* will always succeed */
-	list_lru_add(&zswap_list_lru, &entry->lru, nid, memcg);
+	list_lru_add(&zswap_list_lru, &entry->lru, entry->nid, memcg);
 	rcu_read_unlock();
 }
 
 static void zswap_lru_del(struct zswap_entry *entry)
 {
-	int nid = entry_to_nid(entry);
 	struct mem_cgroup *memcg;
 
 	rcu_read_lock();
 	memcg = obj_cgroup_memcg(entry->objcg);
 	/* will always succeed */
-	list_lru_del(&zswap_list_lru, &entry->lru, nid, memcg);
+	list_lru_del(&zswap_list_lru, &entry->lru, entry->nid, memcg);
 	rcu_read_unlock();
 }
 
@@ -763,10 +761,11 @@ void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg)
 **********************************/
 static struct kmem_cache *zswap_entry_cache;
 
-static struct zswap_entry *zswap_entry_cache_alloc(gfp_t gfp, int nid)
+static struct zswap_entry *zswap_entry_cache_alloc(gfp_t gfp)
 {
 	struct zswap_entry *entry;
-	entry = kmem_cache_alloc_node(zswap_entry_cache, gfp, nid);
+
+	entry = kmem_cache_alloc(zswap_entry_cache, gfp);
 	if (!entry)
 		return NULL;
 	return entry;
@@ -1507,9 +1506,10 @@ static bool zswap_store_page(struct folio *folio, long index,
 {
 	swp_entry_t page_swpentry = folio_swap_entry(folio, index);
 	struct zswap_entry *entry, *old;
+	int nid = folio_nid(folio);
 
 	/* allocate entry */
-	entry = zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
+	entry = zswap_entry_cache_alloc(GFP_KERNEL);
 	if (!entry) {
 		zswap_reject_kmemcache_fail++;
 		return false;
@@ -1524,6 +1524,7 @@ static bool zswap_store_page(struct folio *folio, long index,
 	 * to an unrelated live pool.
 	 */
 	entry->pool_idx = pool->idx;
+	entry->nid = nid;
 
 	old = xa_store(swap_zswap_tree(page_swpentry),
 		       swp_offset(page_swpentry),
@@ -1897,6 +1898,8 @@ static int zswap_setup(void)
 	struct zswap_pool *pool;
 	int ret;
 
+	BUILD_BUG_ON(ZSWAP_MAX_COMPR_LENGTH_SHIFT < PAGE_SHIFT);
+
 	zswap_entry_cache = KMEM_CACHE(zswap_entry, 0);
 	if (!zswap_entry_cache) {
 		pr_err("entry cache creation failed\n");
-- 
2.39.5

