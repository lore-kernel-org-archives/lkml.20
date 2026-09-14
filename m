Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDFD4718E5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389100; cv=none; b=h81x4kkA5uSUzE41nHKhx31nWaMos+0HHKW65zqE1Z3Te4DgIta1KDrtl7WinNEa51QMHwqKqHxp16VxPIt8/i9jgtjBgta9cChrryeLVnydGhfnsz4sYCAD8mXZcXiIqwWLBSJGe9DssPbXYPZ0edrRmugW1vVY+vzF6gnqzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389100; c=relaxed/simple;
	bh=gQpqzqvH+WoJJUAO2d/0PD0oFz7Cyx7fYSRyoCuO5m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+wJk9lD4VoUl+JKXgWlGmM+4BzLm+MK183QbIOmNg55wvZO0R+BOcCgWrBfpWUx6P20S3MXqWae3zatDoyLQt22fX/1TTi//eRc4FklPzVjSPEPpxwMj/YfcvnvXT424YdQHTfLjOFvpGrC8DhqsqdFIVDM8ujsieB/qS5L6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F7pBAob/; arc=none smtp.client-ip=91.218.175.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F7pBAob/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gQpqzqvH+WoJJUAO2d/0PD0oFz7Cyx7fYSRyoCuO5m8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389091; v=1; x=1789993891;
 b=F7pBAob/bwheiLNE8XpRUnDs3xIwQokA5+aYb/8RxFVlmMJAMhbtsCkENmXn11jKYtH2Ygzs
 PC3dEixu0cLhpq8rqMj2QnlT5imQ0cinwPwaTOK39eya0gH34Cx1dHNZ4F6fDaPn3psFefFKKmH
 Kt6dniiFl8PNaAfRbOiRF/38=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c310bfb2d63ccb74;
	Mon, 14 Sep 2026 12:31:30 +0000
X-Mizu-Trace-ID: c310bfb2d63ccb74
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [RESEND v7 13/29] mm: zswap: reject high-order swap cache allocations backed by zswap
Date: Mon, 14 Sep 2026 05:28:03 -0700
Message-ID: <20260914122950.3283997-14-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zswap stores swapped-out pages one at a time, so a range of swap slots can
be split between zswap entries and the backing device. A high-order
swap-cache folio over such a range cannot be read back in one go: the disk
read would return stale or zero data for every slot zswap owns.

Reject that in __swap_cache_alloc(). Do the check after the folio is in the
swap cache: from that point zswap can neither start storing nor start
writing back any slot in the range, so the answer is stable. Callers
already fall back to order-0, which zswap_load() handles per page.

Export zswap_is_present() for the PMD-order swap-in users added later.

Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/zswap.h |  6 ++++++
 mm/swap_state.c       | 39 +++++++++++++++++++++++++--------------
 mm/zswap.c            | 12 +++++++++---
 3 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index df6cafbe95dc0..94746fb71bb65 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
 void zswap_folio_swapin(struct folio *folio);
 bool zswap_is_enabled(void);
 bool zswap_never_enabled(void);
+bool zswap_is_present(swp_entry_t entry, unsigned int nr);
 #else
 
 struct zswap_lruvec_state {};
@@ -73,6 +74,11 @@ static inline bool zswap_never_enabled(void)
 	return true;
 }
 
+static inline bool zswap_is_present(swp_entry_t entry, unsigned int nr)
+{
+	return false;
+}
+
 #endif
 
 #endif /* _LINUX_ZSWAP_H */
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 625c185a1ca4d..251b48b2c60e1 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -12,6 +12,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/mempolicy.h>
 #include <linux/swap.h>
+#include <linux/zswap.h>
 #include <linux/leafops.h>
 #include <linux/init.h>
 #include <linux/pagemap.h>
@@ -466,26 +467,27 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 	__swap_cache_do_add_folio(ci, folio, entry);
 	spin_unlock(&ci->lock);
 
+	/*
+	 * Now that the folio is in the swap cache, zswap can no longer start
+	 * storing or writing back any slot in the range, so this is a stable
+	 * answer. Reject a high-order allocation over a range that already
+	 * has per-page zswap entries.
+	 */
+	if (order && zswap_is_present(entry, nr_pages)) {
+		err = -EBUSY;
+		goto delete_folio;
+	}
+
 	if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
 					   vmf ? vmf->vma->vm_mm : NULL, gfp)) {
-		spin_lock(&ci->lock);
-		__swap_cache_do_del_folio(ci, folio, entry, shadow);
-		spin_unlock(&ci->lock);
-		folio_unlock(folio);
-		/* nr_pages refs from swap cache, 1 from allocation */
-		folio_put_refs(folio, nr_pages + 1);
+		err = -ENOMEM;
 		count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK_CHARGE);
-		return ERR_PTR(-ENOMEM);
+		goto delete_folio;
 	}
 
 	if (order > 1 && folio_memcg_alloc_deferred(folio)) {
-		spin_lock(&ci->lock);
-		__swap_cache_do_del_folio(ci, folio, entry, shadow);
-		spin_unlock(&ci->lock);
-		folio_unlock(folio);
-		/* nr_pages refs from swap cache, 1 from allocation */
-		folio_put_refs(folio, nr_pages + 1);
-		return ERR_PTR(-ENOMEM);
+		err = -ENOMEM;
+		goto delete_folio;
 	}
 
 	/* memsw uncharges swap when folio is added to swap cache */
@@ -499,6 +501,15 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 	/* Caller will initiate read into locked new_folio */
 	folio_add_lru(folio);
 	return folio;
+
+delete_folio:
+	spin_lock(&ci->lock);
+	__swap_cache_do_del_folio(ci, folio, entry, shadow);
+	spin_unlock(&ci->lock);
+	folio_unlock(folio);
+	/* nr_pages refs from swap cache, 1 from allocation */
+	folio_put_refs(folio, nr_pages + 1);
+	return ERR_PTR(err);
 }
 
 /**
diff --git a/mm/zswap.c b/mm/zswap.c
index 507f2d19fd2a4..f5b5827d30084 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1587,11 +1587,14 @@ bool zswap_store(struct folio *folio)
  * @entry: base swap entry of the range
  * @nr: number of contiguous slots to check
  *
- * Context: The caller must keep the range pinned, otherwise the answer can
- * change under it.
+ * Context: Unless the caller keeps the range pinned, the answer is only a
+ * hint: zswap can store or write back a slot right after this returns. A
+ * caller that needs a stable answer must pin the range first, as
+ * __swap_cache_alloc() does by inserting the folio into the swap cache before
+ * asking.
  * Return: true if at least one slot in the range is in zswap.
  */
-static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
+bool zswap_is_present(swp_entry_t entry, unsigned int nr)
 {
 	pgoff_t offset = swp_offset(entry);
 	struct xarray *tree = swap_zswap_tree(entry);
@@ -1605,6 +1608,9 @@ static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
 	 */
 	BUILD_BUG_ON(SWAPFILE_CLUSTER > ZSWAP_ADDRESS_SPACE_PAGES);
 
+	if (zswap_never_enabled())
+		return false;
+
 	return xa_find(tree, &index, offset + nr - 1, XA_PRESENT);
 }
 
-- 
2.53.0-Meta

