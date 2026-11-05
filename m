Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904117;
	b=pK31IIVW+lPJhbLYxFRw2cR8gKyS3MvST/WffuByC0jlGmZIW2OYQnpALiBY/U4r2AIb
	 0MFaKlYvoPw2vUqGGr+K30d+Lky73NEbgf2ms/TnUcqC+Nmh5J7aDFCie4irBzIyo+byT
	 njZ9jl9DOHvlyqQujzzE9KMC4QvJA7LJtSmei8zie/88SDOXj54UiRNx06iFbvKKRjO07
	 8V5FHPh7qlA5iQgGfFwbS5MllOZlUDezvBq9lF6h8Vb2VO7yTLQsOfaO4MAIdogp/nYCC
	 LaRN032TTdG8QGDP146YeA0ssakHFlL4qzXxaN6bjd7pH2GCd//5R8MLQCyo0SckWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904117;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WjeqWKNMbOj2IfnQB7/cLqu6IolR411/M21RbM7KJ0Q=;
	b=WWM9M/k2A6G3q77G3rQNrf8yYRoWrLBI1j4S7eifSOqxj3DPqQtP+MNcRWa9TdW3OFrV
	 iFrOgPwiuUVCGm4bGrXyicUziiwRp6ncFLbNl/4rlO+HScIk2+5JNXa6XaIHDXWAVMXVk
	 YggNPX9tAbQiRypx/kOoiHPYP01htQRBLYP9Fzekc/pdvqBoWg4agnyEk6f3X/BEkZrjY
	 Cv3eiHI28howZIosXbIZbC0dB06QuMcxNNDNjEWFPf7mXTW13JsUiR88cuIOcul5XfOAS
	 vaKENhxhI4JQEpnC3gErsWnNTzNKvQ3LVGwjjCkD7D+/Ldfe/p4TYWYfEJBn55+jj/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SZWNW336;
	arc=none smtp.remote-ip=91.218.175.2
Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F10606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F10606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SZWNW336
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z1cBPSmGhHjlikXJzChWDSoswF1O+JWyvo2Vwvu0Pzo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904115; v=1; x=1794508915;
 b=SZWNW336O72rg7Hjnk0P/6ozc5Kgb44dnwqh0Mm6HJZak5E2BCwqOYzbidsvD0K8+0PVACly
 BIRbhiI6xVYGo+j1tk/b/Pd0HTiah80FU9v+A1p73kRHjfBBZ9/wo5jnb69QhIEob60oK9rPn7b
 ACsPISjLt1Do1KwIxNgkzTKM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id dc7789f0cca6bcf0;
	Thu, 05 Nov 2026 18:41:55 +0000
X-Mizu-Trace-ID: dc7789f0cca6bcf0
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 22/32] mm/madvise: free PMD swap entries with MADV_FREE
Date: Thu,  5 Nov 2026 10:39:06 -0800
Message-ID: <20261105183940.2236717-23-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

madvise_free_pte_range() only calls madvise_free_huge_pmd() for a present
THP, and its PTE loop cannot descend into a non-present PMD, so MADV_FREE
over a swapped-out THP silently does nothing. Over the same range as PTE
swap entries it frees every slot, which is what userspace gets today.

Free it at PMD granularity when the advice covers the whole PMD, and split
and let the PTE path handle the subrange when it does not.

zap_deposited_table() moves above its new caller; it is otherwise
unchanged.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 34 +++++++++++++++++++++++++---------
 mm/madvise.c     |  2 +-
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f8df5cd723f01..65922d9e4bec1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2425,6 +2425,15 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
+{
+	pgtable_t pgtable;
+
+	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	pte_free(mm, pgtable);
+	mm_dec_nr_ptes(mm);
+}
+
 /*
  * Return true if we do MADV_FREE successfully on entire pmd page.
  * Otherwise, return false.
@@ -2449,6 +2458,22 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		goto out;
 
 	if (unlikely(!pmd_present(orig_pmd))) {
+		if (pmd_is_swap_entry(orig_pmd)) {
+			softleaf_t entry = softleaf_from_pmd(orig_pmd);
+
+			if (next - addr != HPAGE_PMD_SIZE) {
+				spin_unlock(ptl);
+				__split_huge_pmd(vma, pmd, addr);
+				goto out_unlocked;
+			}
+
+			pmdp_huge_get_and_clear(mm, addr, pmd);
+			zap_deposited_table(mm, pmd);
+			spin_unlock(ptl);
+			swap_put_entries_direct(entry, HPAGE_PMD_NR);
+			add_mm_counter(mm, MM_SWAPENTS, -HPAGE_PMD_NR);
+			return true;
+		}
 		VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
 				!pmd_is_device_private_entry(orig_pmd));
 		goto out;
@@ -2503,15 +2528,6 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	return ret;
 }
 
-static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
-{
-	pgtable_t pgtable;
-
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
-	pte_free(mm, pgtable);
-	mm_dec_nr_ptes(mm);
-}
-
 static void zap_huge_pmd_folio(struct mm_struct *mm, struct vm_area_struct *vma,
 		pmd_t pmdval, struct folio *folio, bool is_present)
 {
diff --git a/mm/madvise.c b/mm/madvise.c
index e9fa4f71efeac..156290227c236 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -677,7 +677,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	int nr, max_nr;
 
 	next = pmd_addr_end(addr, end);
-	if (pmd_trans_huge(*pmd))
+	if (pmd_trans_huge(*pmd) || pmd_is_swap_entry(*pmd))
 		if (madvise_free_huge_pmd(tlb, vma, pmd, addr, next))
 			return 0;
 
-- 
2.53.0-Meta

