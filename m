Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4939CD00
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564075; cv=none; b=j3S2wCrlng625fq8RR/PZqU+yuVuCFlzMvWqzUKhH7qZQw6XMZ4BpOE5SgPdCROSuIN7bFsBh3sFCZe/VeM+bE7hkuGBFKPxrbgqLq2Q8R8g0cP2HHWLg7bhYQVyi9sIhbTe5nXWxkVdqclZ0aOwUizO0m6Ko1BDA0qkS3Poz84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564075; c=relaxed/simple;
	bh=mFKfiW7m4C22p52MsDdwYU0NcfC494ItXTGRtMvxW9Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k6okZv3hiDxTOXRnGqXOuodtMvoIqyIc8EHu5LCCBUywdhxueH3JZiPrA+7jvas2qynG/rwpTJjUQIA7Ak0bbB3OJF48eBFwfOb6RsWuhKsljrMpiHQPufZH1v/6YbbyiU4svbWtIqXxBoHvk2mAe/VA71qB+TwEZu4S8eewdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ND4M2+vZ; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ND4M2+vZ"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1818266a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788564071; x=1789168871; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJKXKrq7yq1xNiVeL0CLanUf8ioKHs425feCWZPQVgw=;
        b=ND4M2+vZdFm9W0d51U0QYmp98IytRX4m+1QwNh8iOcLVt3aLaUQJplExuzSvhHRqEF
         d7GDXosFTQdMnrrBh8rPonBzuuaSiMqsiH2DgCmm3fsQCXozk5cD6I7828KBYtKCDHTj
         Rw1x2DlZS5ps0uXcvb771lhbrNJ4kN3ZZX26K+iAJe7UoRPBIxs6n9q7cHM9WHnKUXJu
         pfYedN5ErX8KBEX0Y3UBNYu3pC1Scq1mFqRo9D2ntnpMNAGiBdMaFrHkg3ZagJzcamnd
         SzkQWZWeYE1wvPSnBml94rCSYY5MFwFud9WLivoxrbmrnOUbA77C8gWrUNa6nJrBuZw+
         +jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564071; x=1789168871;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJKXKrq7yq1xNiVeL0CLanUf8ioKHs425feCWZPQVgw=;
        b=kC9pgo5RARBEWaDy+KRVOxic9katSgw4kjGCmNbF8GzhUWaI+syYHG/amvboJSqUIe
         FgCQkYCjNzKHgRB/QsdBusnCTpvXFou+uyTc+ZOeejeeY1HIvDthGXzg/pD6U2Ls8/e9
         N3gSY0nfTmQL5dLwHi+a0m6lnn2G0e0L8xWeh8J2Wb/nCPnrT+BSFyxViyEH/xTOwVYz
         Swjaf8+ZnWyXKy3EwcNAyktIxC56m9SlQ1sQrHt/Us7ijBOgrFDzkM1yIg93RQBQbC4g
         EuHYm6EI/fFj+sFTDjGcsYTQXFajUeztw9NHf+PRN9xGQ1cO0+3a/zkGj56saTq+TtX8
         2KHg==
X-Forwarded-Encrypted: i=1; AKwUvBwYQeFE9nOSPn1qjX/xpcfqcoHE9uxZbMppJlQhwEX79QdQzKUHFMLWGMZKpRsFvffQbZHrG0CrRP/bdxk=@vger.kernel.org
X-Gm-Message-State: AFuF++m5uXin/ZlwldzMqD7dfr6Ln2aCZFIOIQLI+yeo/okxesouX2vj
	Nq5A8eWVXO0Wa5kzIcgp38Q88Z1SPSZOBhm0TRT2wXG3wZUka70ECBu5FgHPttSnIh/rQhU+nMc
	WiRLsqwbm7A==
X-Received: from pfux26.prod.google.com ([2002:a05:6a00:bda:b0:84e:1951:8efd])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8009:b0:852:3726:dfde
 with SMTP id d2e1a72fcca58-8616809429bmr12694250b3a.9.1788564071116; Fri, 04
 Sep 2026 16:21:11 -0700 (PDT)
Date: Fri,  4 Sep 2026 23:20:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904232108.3034333-1-wfelipe@google.com>
Subject: [PATCH] mm/zswap: convert zswap_store_page() and zswap_compress() to
 take a folio
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, zswap_store() iterates through a folio and extracts individual
struct page pointers using folio_page() to pass into zswap_store_page()
and zswap_compress().

Pass the folio and the page index directly into these functions instead.
This eliminates the need to materialize struct page pointers inside the
zswap_store() loop and replaces legacy page-based accessors with their
folio equivalents:

- sg_set_page() -> sg_set_folio()
- kmap_local_page() -> kmap_local_folio()
- page_to_nid() -> folio_nid()
- page_swap_entry() -> calculated via folio->swap and index

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 mm/zswap.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..225308c195c7 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -837,8 +837,8 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 	return ret;
 }
 
-static bool zswap_compress(struct page *page, struct zswap_entry *entry,
-			   struct zswap_pool *pool)
+static bool zswap_compress(struct folio *folio, long index,
+			   struct zswap_entry *entry, struct zswap_pool *pool)
 {
 	struct crypto_acomp_ctx *acomp_ctx;
 	struct scatterlist input, output;
@@ -854,7 +854,7 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 
 	dst = acomp_ctx->buffer;
 	sg_init_table(&input, 1);
-	sg_set_page(&input, page, PAGE_SIZE, 0);
+	sg_set_folio(&input, folio, PAGE_SIZE, index * PAGE_SIZE);
 
 	sg_init_one(&output, dst, PAGE_SIZE);
 	acomp_request_set_params(acomp_ctx->req, &input, &output, PAGE_SIZE, dlen);
@@ -883,8 +883,7 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	 */
 	if (comp_ret || !dlen || dlen >= PAGE_SIZE) {
 		rcu_read_lock();
-		if (!mem_cgroup_zswap_writeback_enabled(
-					folio_memcg(page_folio(page)))) {
+		if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
 			rcu_read_unlock();
 			comp_ret = comp_ret ? comp_ret : -EINVAL;
 			goto unlock;
@@ -892,12 +891,12 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 		rcu_read_unlock();
 		comp_ret = 0;
 		dlen = PAGE_SIZE;
-		dst = kmap_local_page(page);
+		dst = kmap_local_folio(folio, index * PAGE_SIZE);
 		mapped = true;
 	}
 
 	gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
-	handle = zs_malloc(pool->zs_pool, dlen, gfp, page_to_nid(page));
+	handle = zs_malloc(pool->zs_pool, dlen, gfp, folio_nid(folio));
 	if (IS_ERR_VALUE(handle)) {
 		alloc_ret = PTR_ERR((void *)handle);
 		goto unlock;
@@ -1405,21 +1404,22 @@ static void shrink_worker(struct work_struct *w)
 * main API
 **********************************/
 
-static bool zswap_store_page(struct page *page,
+static bool zswap_store_page(struct folio *folio, long index,
 			     struct obj_cgroup *objcg,
 			     struct zswap_pool *pool)
 {
-	swp_entry_t page_swpentry = page_swap_entry(page);
+	swp_entry_t page_swpentry = swp_entry(swp_type(folio->swap),
+					      swp_offset(folio->swap) + index);
 	struct zswap_entry *entry, *old;
 
 	/* allocate entry */
-	entry = zswap_entry_cache_alloc(GFP_KERNEL, page_to_nid(page));
+	entry = zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
 	if (!entry) {
 		zswap_reject_kmemcache_fail++;
 		return false;
 	}
 
-	if (!zswap_compress(page, entry, pool))
+	if (!zswap_compress(folio, index, entry, pool))
 		goto compress_failed;
 
 	old = xa_store(swap_zswap_tree(page_swpentry),
@@ -1528,9 +1528,7 @@ bool zswap_store(struct folio *folio)
 	}
 
 	for (index = 0; index < nr_pages; ++index) {
-		struct page *page = folio_page(folio, index);
-
-		if (!zswap_store_page(page, objcg, pool))
+		if (!zswap_store_page(folio, index, objcg, pool))
 			goto put_pool;
 	}
 
-- 
2.55.0.979.g7e5102b832-goog

