Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B484457D8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386249; cv=none; b=F59NHDsfWpHurbw8yPrg3M8v5asomjSxwQJsiwk3pvBrOplKpyE29nzTntTBn1XVQRTzZIYnIwivxF0ujC14zJvProZW9TEhX0Bj3BT7AeODBIY87yB2GM9GqEByIwdaZmpQ8JRIU9vJRNt8hsTMP3/iwQYdK9RouiFDkXOiaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386249; c=relaxed/simple;
	bh=GA4gtvHV/+JkGd0QoK3boOJtdQKcFFleMRDfJWwQDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmFpTIj5eja+PouNslPW14aXPDhnGLj+HT+Zmmlu09xAj5l6KO7MS8Iwz/v/ee1wENHktJBZXfGutgPHu9mBemC14eqvbsYNkXH52K79T5S70+ceKhH+Jh3T9Fi/qQxwCxwuuFrV6vCya0i9QKquvipnPbpqLFIirZk8Oxu0/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sbYpd23A; arc=none smtp.client-ip=91.218.175.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sbYpd23A"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GA4gtvHV/+JkGd0QoK3boOJtdQKcFFleMRDfJWwQDhk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386245; v=1; x=1789991045;
 b=sbYpd23AJ10EIinCmE1j6N7OToX0BrigvCU2D4vaA2swUzJel3SE6Syrf7vh6fQSiznE7Uwf
 VKeiMkbJFumu10vWgN6asowc45BthXc8DAeM0N/apKRerDENUtOCnfimplvsNkAiyreeq9/KeuX
 Xsc6MlUmFcYoFAie3xtICwl0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 22fdb36f8cd0ef39;
	Mon, 14 Sep 2026 11:44:05 +0000
X-Mizu-Trace-ID: 22fdb36f8cd0ef39
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
Subject: [PATCH v7 08/29] mm: recognize PMD swap entries in the softleaf layer
Date: Mon, 14 Sep 2026 04:42:00 -0700
Message-ID: <20260914114320.12988-9-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914114320.12988-1-usama.arif@linux.dev>
References: <20260914114320.12988-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
before unmapping it, so an ordinary swap entry has never had to appear in a
PMD. Later patches install one there instead, and the softleaf layer is
where every consumer decodes non-present PMDs.

Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
return NULL rather than interpret a swap offset as a page frame number.

Unlike migration and device-private entries, a PMD swap entry can also
carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
before decoding. Strip all three overlays unconditionally while we are
here: each clear is a plain bit clear, so testing first only buys a branch.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/leafops.h | 40 ++++++++++++++++++++++++++++------------
 include/linux/pgtable.h | 17 +++++++++++++++++
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 7c13c58a5e218..ce176c78cefd4 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -98,10 +98,9 @@ static inline softleaf_t softleaf_from_pmd(pmd_t pmd)
 	if (pmd_present(pmd) || pmd_none(pmd))
 		return softleaf_mk_none();
 
-	if (pmd_swp_soft_dirty(pmd))
-		pmd = pmd_swp_clear_soft_dirty(pmd);
-	if (pmd_swp_uffd(pmd))
-		pmd = pmd_swp_clear_uffd(pmd);
+	pmd = pmd_swp_clear_soft_dirty(pmd);
+	pmd = pmd_swp_clear_uffd(pmd);
+	pmd = pmd_swp_clear_exclusive(pmd);
 	arch_entry = __pmd_to_swp_entry(pmd);
 
 	/* Temporary until swp_entry_t eliminated. */
@@ -634,18 +633,29 @@ static inline bool pmd_is_migration_entry(pmd_t pmd)
  */
 static inline bool softleaf_is_valid_pmd_entry(softleaf_t entry)
 {
-	/* Only device private, migration entries valid for PMD. */
 	return softleaf_is_device_private(entry) ||
-		softleaf_is_migration(entry);
+		softleaf_is_migration(entry) ||
+		softleaf_is_swap(entry);
+}
+
+/**
+ * pmd_is_swap_entry() - Does this PMD entry encode an actual swap entry?
+ * @pmd: PMD entry.
+ *
+ * Returns: true if the PMD encodes a swap entry, otherwise false.
+ */
+static inline bool pmd_is_swap_entry(pmd_t pmd)
+{
+	return softleaf_is_swap(softleaf_from_pmd(pmd));
 }
 
 /**
  * pmd_is_valid_softleaf() - Is this PMD entry a valid softleaf entry?
  * @pmd: PMD entry.
  *
- * PMD leaf entries are valid only if they are device private or migration
- * entries. This function asserts that a PMD leaf entry is valid in this
- * respect.
+ * PMD leaf entries are valid only if they are device private, migration,
+ * or swap entries. This function asserts that a PMD leaf entry is valid
+ * in this respect.
  *
  * Returns: true if the PMD entry is a valid leaf entry, otherwise false.
  */
@@ -660,10 +670,12 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
  * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
  * @pmd: PMD entry.
  *
- * The PMD entry is expected to be a valid PMD softleaf entry.
+ * The PMD entry is expected to be a valid PMD softleaf entry that references a
+ * PFN, that is a migration or device private entry. A PMD swap entry is a valid
+ * softleaf entry but encodes swap slots rather than a PFN, so it has no folio.
  *
- * Returns: the folio the softleaf entry references if this is a valid softleaf
- * entry, otherwise NULL.
+ * Returns: the folio the softleaf entry references, or NULL if the entry is not
+ * a valid PMD softleaf entry or does not reference a PFN.
  */
 static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
 {
@@ -673,6 +685,10 @@ static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
 		VM_WARN_ON_ONCE(true);
 		return NULL;
 	}
+	if (!softleaf_has_pfn(entry)) {
+		VM_WARN_ON_ONCE(true);
+		return NULL;
+	}
 	return softleaf_to_folio(entry);
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e3c8ab96941c5..3f955f836abfe 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1917,6 +1917,23 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
 }
 #endif
 
+#ifndef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return false;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return pmd;
+}
+#endif
+
 #ifndef __HAVE_PFNMAP_TRACKING
 /*
  * Interfaces that can be used by architecture code to keep track of
-- 
2.53.0-Meta

