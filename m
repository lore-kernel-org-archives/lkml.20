Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899199;
	b=C7QNhC7dlkYStthc+30hiUHLzxLUzCK8ej7gZkghHvsVIv7OuKExTumQVQGSqnaXej7O
	 cyA5xXUvKsQmHKZBqUm2G/YryytirmCGqi7pfENuPaTRJrT2MVyEwpxF9ZtQLCuubqAw/
	 dRvBWada1n2pvWhXGMT5EZQIGQllbMBVx/HzVxsQJNNLpF3ahRKAoDjZx3TBCbhH9vb6V
	 sgGUqzjSfT2rmQ/yUsB9Ayv+cbdrGwICcG6itQ5R7tPBjo5WihrIhB4mRn6/V7NebKMdF
	 CeJz5lPyfs8gwkPYAQztj7hOf8vK6USPJRu+rkvhG+MWFmIvYiqjaX1cjGxfMY0BBNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899199;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XBmhljpBm36DpauCU/FC6A+ud2fsxJbY98dDN8rTn0E=;
	b=jNKCUZhkeDAVQH0dNx02+i7pxT4K1H1RQxA4EhxUw5WDuGErUq64RuWKMBsF/n5pIU/z
	 L1y7WMXPsShgDVeBQ6+oBoJUUG4ygGYtM/xaHwMtR6Zzf6YnAvWrr2FvJ1lgq935bQC4p
	 g7JDcDJiCJk2AwSzv5NojSFhn05mxurpZO0VcvCL0RppJPNHyqIaklznwF5qT/sduYnS/
	 iRrUwYuQgnxAC3KS58ZpR6tyadVY0KwcCRRBN480i9lbTy98TZmQbny4yBf9WV9Wu3BiA
	 X/MSVEIEzHYPIM8riuYEGPX3BQjLAzW8GmN686zaW4TYB4hkBLA36BKucZVMlBGy6Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DVZWanrd;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74DE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DVZWanrd
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356CA1476;
	Mon, 16 Nov 2026 23:06:35 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8DB3F763;
	Mon, 16 Nov 2026 23:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899198; bh=H9pPB228ZKcouR7EGAqs954E12//ZNJz1w9Ri3nVlDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVZWanrdeOkLWYf6DEdxSEAPF1W6DW8GvjazZk2burG4qUVfM3Wu5X70vLTHHw2Ui
	 dwYx8ZTf4NFFsPBR67TsJhxeoAx1AwQJB9UZbpc5+Vi15DqVIH1PGqFkaDPo333Zbm
	 LChHw/uwrOD0IzjBpVI1AnnF19kJX03Yp2MZjfxU=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 04/14] arm64/mm: Route all pgtable atomics to central helpers
Date: Tue, 17 Nov 2026 12:36:03 +0530
Message-ID: <20261117070613.1183243-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
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

Route all cmpxchg() operations performed on various page table entries to a
new ptval_cmpxchg_relaxed() helper. Similarly route all xchg() operations
performed on page table entries to a new ptval_xchg_relaxed() helper.

Currently these helpers just forward to the same APIs that were previously
called direct, but in future we will change the routing for D128 which is
too long to use the standard APIs.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V3:

- Fixed indent problems in ___ptep_set_wrprotect() and __clear_young_dirty_pte()

 arch/arm64/include/asm/pgtable.h | 30 +++++++++++++++++++++---------
 arch/arm64/mm/fault.c            |  2 +-
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0ce2e59e09198..d3a50d35fd017 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -87,6 +87,17 @@ static inline void arch_leave_lazy_mmu_mode(void)
 #define ptval_get(x)		READ_ONCE(x)
 #define ptval_set(x, val)	WRITE_ONCE(x, val)
 
+static inline ptval_t ptval_cmpxchg_relaxed(ptval_t *ptep, ptval_t old,
+					      ptval_t new)
+{
+	return cmpxchg_relaxed(ptep, old, new);
+}
+
+static inline ptval_t ptval_xchg_relaxed(ptval_t *ptep, ptval_t new)
+{
+	return xchg_relaxed(ptep, new);
+}
+
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(const pmd_t *pmdp)
 {
@@ -1287,8 +1298,8 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 	do {
 		old_pte = pte;
 		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						      pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 
 	return pte_young(pte);
@@ -1330,7 +1341,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 					       pte_t *ptep,
 					       unsigned long pgsize)
 {
-	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
+	pte_t pte = __pte(ptval_xchg_relaxed(&pte_val(*ptep), 0));
 
 	switch (pgsize) {
 	case PAGE_SIZE:
@@ -1406,8 +1417,8 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 	do {
 		old_pte = pte;
 		pte = pte_wrprotect(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						     pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
 
@@ -1444,8 +1455,8 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
 		if (flags & CYDP_CLEAR_DIRTY)
 			pte = pte_mkclean(pte);
 
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						     pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
 
@@ -1483,7 +1494,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
 	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
-	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
+	return __pmd(ptval_xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
 
@@ -1813,7 +1824,8 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+	old = ptval_cmpxchg_relaxed(&pte_val(*ptep), old, pte_val(new_pte));
+	if (old != 0)
 		return false;
 
 	/*
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b489fbeeb070..74bbcd49f52fc 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -244,7 +244,7 @@ int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 		pteval ^= PTE_RDONLY;
 		pteval |= pte_val(entry);
 		pteval ^= PTE_RDONLY;
-		pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
+		pteval = ptval_cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
 	} while (pteval != old_pteval);
 
 	/*
-- 
2.43.0

