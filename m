Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302802DECC2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066852; cv=none; b=qWu8hUBT544EeME1McQ+unYbpoDiB645wacRIwjALqmGFAa1Zua/QR54QSEH/9X92qon4ZcGWRmaph3UPiEXfFDN7R3j8y+zoYDkJdDa1CouEAquIRfnLWgA/ZfBHkrs3I6wA3EpdEKl3NPsl1AUxRp5thmPYfs+WXjzi8DOjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066852; c=relaxed/simple;
	bh=Q33HR5Se8BzslnbssUes1Zl68yaouorY+HmA1jQ/xyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7EgfdxFK8r5JzJzqnrEb/R6JwHltduMCaKSQFbCD1wS8GBiUa6wVk+1UlMX+sWyVUP4fb0UQsx3ki/LCpMqV7ztvhn3iNxHAuEKmuhWA+D9Vy0nXRNEATdw/TXnbiKPcP9IzNjfc6/r4cksQUxYVN9g5ZsRt67S1iTzZghGYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=hFpXAfMQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="hFpXAfMQ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1571742a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066850; x=1788671650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJRx0Jd1M2+awD7NVhe4CKIIkdBtWXqqpTIhZLTtZn4=;
        b=hFpXAfMQWDZA3upTLdrIx6yI3ZqL/SG8I4Wvk+26v/EPlHgFxCI1G2Fcn6R/WhF+SL
         mkzqjWjLuO0NrGcNouHdwJxt2ZfaKHoxXG6W9RKUjmXHF3YOHpazfG5jBdIwUvwMjHa2
         DwpZR4o+48hIsGRrrcIKcvyKr354JEknO/u+I2olm9rFUmvJCZl0bOCMBh2adQtZsMBY
         eJKgiIpRU+47o3hf6xNqeTLJplO6CYAlAJEd8gMiVdwr67Mu3x4CYRwZNEBpKVPqYfTh
         3+Vu6c02zzi2vqdC5BgP6V8MVd5hKbUXxRzV5lKcgikrdVudNjD0ER7DGaqCYVeV9qO+
         iReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066850; x=1788671650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJRx0Jd1M2+awD7NVhe4CKIIkdBtWXqqpTIhZLTtZn4=;
        b=V1jVjsD2ukNAWBsE0x9QLbzr9ZeSRpbMJbzP2sA/D4Ctx5yLaamCflyV1PZ4NRt3mZ
         QP1hJiBXuiv/QgeoBuqEjD36SkEDlHEqn+zHsX2zKxjyOoGNMljN1RfP8R6NW8kR4b2+
         mAqiP4zqrXTUAJR/5vNze4911XSuv871DFl3Ez12uFyp7Q6NcJ7n3fdwdZE/tLgnb6qD
         jvH+jwu/2TBNwCjV5Rvg81uhrl73OZZHI5Rex2Cu/uOV+8a8yVSmQXDFmjnDxvbyJ7nv
         78wOsFyf+M8Sz5KkOeFqXxr/pXSOeFOXg1Z/XPxBDfcw0AHDuLxkQO64I9vks5QkccFI
         yIow==
X-Forwarded-Encrypted: i=1; AHgh+RrZUsR88X0ZoRLL0X3mIz/GeAEg9cUfYhSvBh7iei+9ttLKnLD1XwXBFOjk2LIWl9DxlF6t2VpvhPLvxK8=@vger.kernel.org
X-Gm-Message-State: AFuF++lHhwV+q1LhOB+ANF36v4cclSax2djitZuMKQ74R4V3ZClBrD2k
	4NC+QM4sJGhA9A26cwOAfE+VNPzVPiUtf1qzE517h3uKfdEm2JwKwPOxuLnbTlze1zw8Lqtgg+o
	V0s9IBajLdA==
X-Gm-Gg: AR+sD13sTvqKxwv3p7zXaGjhzhp5ckBzfVTUJbHrZcOPaLVnhnn5FYRRXCW7CQYsNJ7
	Sj3aSkkSLWOHTqPQmybVVK3ilb71jEb7IHip7y4NtbzyZKJKDSt596lhBZikXIFTvDa6PTbjnLd
	CRTCPbiDKTSvRsev2qiDiKQvabozX2xQLSjr/5EwYpjGLoUlzWRRKtlSvnOjRM8jmgJ9/TnxquB
	8v9aDksNAR38CE9l84eAGHWxOKtgmWf94MDaKVlhpq9sTti9sceqTIuaYcMBWl0JBCZ0SI3l/8c
	ScFJYjrvJsXg9H3jZ/aU/ltiVFnmuvIuR9BEDDJvdZQrMora8T0GYZRO9EG4+MBcgmiL8VXFi2V
	ETcppK17LVPNZEyf+M3yMJ/CK0N21IlJQ/Y4/RIZXRUhafv9MWMOCNReNRhkMIgc18h8m2c0ISx
	JZqlPb7xqtdGsUE8z2Hg+jlmTj0Dxeh8AbgcTRgvsmFLFQHgH0RowUSrXOe/TXdu3ntSplJxrWo
	SY3vMK0aFw37TsHC9IfDfLVtHpt/etg88o=
X-Received: by 2002:a05:6a21:328b:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3d2688b71f4mr29680395637.18.1788066850343;
        Sat, 29 Aug 2026 22:14:10 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:10 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 1/6] mm/damon: move damon_hugetlb_mkold() from vaddr to ops-common
Date: Sat, 29 Aug 2026 22:14:02 -0700
Message-ID: <20260830051407.50008-2-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830051407.50008-1-kiyer@crusoe.ai>
References: <20260830051407.50008-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_hugetlb_mkold() clears the accessed bit of a hugetlb-mapping huge
PTE and propagates the aging to secondary MMUs via
mmu_notifier_clear_young(), spanning the whole huge page size.  It
currently lives in vaddr.c, and is thus usable only by the virtual
address space monitoring operations set.

The physical address space monitoring operations set will need the same
logic, to support access monitoring of hugetlb-backed memory.  Move the
function to ops-common as-is, with no behavioral change.  A follow-up
change will use it from the folio-granular rmap walkers.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 mm/damon/ops-common.c | 30 ++++++++++++++++++++++++++++++
 mm/damon/ops-common.h |  9 +++++++++
 mm/damon/vaddr.c      | 27 ---------------------------
 3 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index fbda70d8ea4d..f5fe92b825bb 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -3,6 +3,7 @@
  * Common Code for Data Access Monitoring
  */
 
+#include <linux/hugetlb.h>
 #include <linux/migrate.h>
 #include <linux/mmu_notifier.h>
 #include <linux/page_idle.h>
@@ -98,6 +99,35 @@ void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 }
 
+#ifdef CONFIG_HUGETLB_PAGE
+void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
+		struct vm_area_struct *vma, unsigned long addr)
+{
+	bool referenced = false;
+	pte_t entry = huge_ptep_get(mm, addr, pte);
+	struct folio *folio = pfn_folio(pte_pfn(entry));
+	unsigned long psize = huge_page_size(hstate_vma(vma));
+
+	folio_get(folio);
+
+	if (pte_young(entry)) {
+		referenced = true;
+		entry = pte_mkold(entry);
+		set_huge_pte_at(mm, addr, pte, entry, psize);
+	}
+
+	if (mmu_notifier_clear_young(mm, addr,
+				     addr + huge_page_size(hstate_vma(vma))))
+		referenced = true;
+
+	if (referenced)
+		folio_set_young(folio);
+
+	folio_set_idle(folio);
+	folio_put(folio);
+}
+#endif	/* CONFIG_HUGETLB_PAGE */
+
 #define DAMON_MAX_SUBSCORE	(100)
 #define DAMON_MAX_AGE_IN_LOG	(32)
 
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index 38d295488fa1..f7811c9c7a02 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -9,6 +9,15 @@ struct folio *damon_get_folio(unsigned long pfn);
 
 void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr);
 void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr);
+#ifdef CONFIG_HUGETLB_PAGE
+void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
+		struct vm_area_struct *vma, unsigned long addr);
+#else
+static inline void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
+		struct vm_area_struct *vma, unsigned long addr)
+{
+}
+#endif	/* CONFIG_HUGETLB_PAGE */
 void damon_folio_mkold(struct folio *folio);
 bool damon_folio_young(struct folio *folio);
 
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 0648400b2d65..15379d984689 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -293,33 +293,6 @@ static int damon_mkold_pmd_entry(pmd_t *pmd, unsigned long addr,
 }
 
 #ifdef CONFIG_HUGETLB_PAGE
-static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
-				struct vm_area_struct *vma, unsigned long addr)
-{
-	bool referenced = false;
-	pte_t entry = huge_ptep_get(mm, addr, pte);
-	struct folio *folio = pfn_folio(pte_pfn(entry));
-	unsigned long psize = huge_page_size(hstate_vma(vma));
-
-	folio_get(folio);
-
-	if (pte_young(entry)) {
-		referenced = true;
-		entry = pte_mkold(entry);
-		set_huge_pte_at(mm, addr, pte, entry, psize);
-	}
-
-	if (mmu_notifier_clear_young(mm, addr,
-				     addr + huge_page_size(hstate_vma(vma))))
-		referenced = true;
-
-	if (referenced)
-		folio_set_young(folio);
-
-	folio_set_idle(folio);
-	folio_put(folio);
-}
-
 static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
 				     unsigned long addr, unsigned long end,
 				     struct mm_walk *walk)
-- 
2.54.0

