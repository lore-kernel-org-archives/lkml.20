Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155E9379C55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241476; cv=none; b=kMne53ZA4Vuli3Lz1oyXaV+XbcdcgCANneoGQyC5fAYQafGpn0lCwkbh62n7hf5Zxia7x7NGN+0HIwL8hhQFd4S9huyYYPZa7Gq9tkUBtVnnNcH+uA0Br7ZUKr1Fsig6NHl9e1iTI5gVJ8wS7/Ez0jQQqf+/+nkPF2XC/9Poa5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241476; c=relaxed/simple;
	bh=4tS7tmRJt89rYLLLP6NkERN/c/Y1n2Ho9ctBU+vN0ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVmEbmp8jvVBthzM+vbHZbDL8ChicL+D1/AXvdjBKWx9B4p95G+uLjHhcVJjqo3w1AoUoo0RNg3DDstJn4xvmfYgxAnI+6tz012pqzeAFJWDfmxnfwxaQzguq5x+mcv10YRDc5HEUZaOEBPNzNg1NcSS/ieXNq+xfEHyG+Ub3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oz2H0BCH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oz2H0BCH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 434201BCA;
	Mon, 31 Aug 2026 22:44:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C75C3F85F;
	Mon, 31 Aug 2026 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241473; bh=4tS7tmRJt89rYLLLP6NkERN/c/Y1n2Ho9ctBU+vN0ME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oz2H0BCHqxgB8+EYjO1CA6z0w/3MTbwN/Bfl0F/wGW82MBejFyFiivi+atLNtZA95
	 HR7yQfq+oXKfD4NtrevQ8lbiL8cn7edktq/LjALdoUuLMssxPktPZQkewKoiMBiB0B
	 zxaU7ipCnf3gZL3SU8D2mw2zk0i9x6NZJsLc3TzU=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 3/8] mm: move anon-exclusive batch helper to mm.h
Date: Tue,  1 Sep 2026 05:43:50 +0000
Message-ID: <20260901054358.4049095-4-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901054358.4049095-1-dev.jain@arm.com>
References: <20260901054358.4049095-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for optimizing large folio unmapping, we need to reuse
the page_anon_exclusive_batch helper in rmap.c and rmap.h and obey the
existing use in mprotect.c .

Therefore, move it from mprotect.c to mm.h. Gate with CONFIG_MMU since
both rmap and mprotect users are built only for CONFIG_MMU.

While at it, change start_idx and max_len to unsigned long type for
future proofing against THP support at >= PUD level. Also shorten
expected_anon_exclusive -> anon_exclusive.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/mm.h | 19 +++++++++++++++++++
 mm/mprotect.c      | 17 -----------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23e..63da8813bc5df 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -244,6 +244,25 @@ static inline unsigned long folio_page_idx(const struct folio *folio,
 	return page - &folio->page;
 }
 
+#ifdef CONFIG_MMU
+/*
+ * Get max length of consecutive PTEs pointing to PageAnonExclusive() pages or
+ * !PageAnonExclusive() pages, starting from start_idx. Caller must enforce
+ * that the PTEs point to consecutive pages of the same anon large folio.
+ */
+static __always_inline int page_anon_exclusive_batch(unsigned long start_idx,
+		unsigned long max_len, struct page *first_page, bool anon_exclusive)
+{
+	int idx;
+
+	for (idx = start_idx + 1; idx < start_idx + max_len; ++idx) {
+		if (anon_exclusive != PageAnonExclusive(first_page + idx))
+			break;
+	}
+	return idx - start_idx;
+}
+#endif
+
 static inline struct folio *lru_to_folio(struct list_head *head)
 {
 	return list_entry((head)->prev, struct folio, lru);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 2888ee638d872..75c2b1a00eb36 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -138,23 +138,6 @@ static __always_inline void prot_commit_flush_ptes(struct vm_area_struct *vma,
 		tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
 }
 
-/*
- * Get max length of consecutive ptes pointing to PageAnonExclusive() pages or
- * !PageAnonExclusive() pages, starting from start_idx. Caller must enforce
- * that the ptes point to consecutive pages of the same anon large folio.
- */
-static __always_inline int page_anon_exclusive_batch(int start_idx, int max_len,
-		struct page *first_page, bool expected_anon_exclusive)
-{
-	int idx;
-
-	for (idx = start_idx + 1; idx < start_idx + max_len; ++idx) {
-		if (expected_anon_exclusive != PageAnonExclusive(first_page + idx))
-			break;
-	}
-	return idx - start_idx;
-}
-
 /*
  * This function is a result of trying our very best to retain the
  * "avoid the write-fault handler" optimization. In can_change_pte_writable(),
-- 
2.43.0

