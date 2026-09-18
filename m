Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C10199E89
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713767; cv=none; b=MTTLxfUoP1tI+BbPPsIZyBUGaw5i5+wfXVSV2+ZOvTOQRVm8Wz5XhvyUSDtunWvc/iVVhSkBESO5HtGcbQGFQsMWLFI2AA8Lk7ajYcE/fG/sPIrNGO56QIPfwAyRA7oHJ34N0q/tY+QDDFooJ5qxq01SEgS/dhECqgOEsxjZn4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713767; c=relaxed/simple;
	bh=8x7DWiKBUbdemsHSgSWZm8Y0iwa1MXa3L2UNISTcoGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XxDgdvzNsVmQn3Vm6Uf4+qYB3SyXVUtlCyGO/Vkxny+5U30w/r58MAQH1C/MZsTzpMdIgez9jcRtczB1aRRQ/zHOl7LGjIqwRrSXz01NbL//D6gBCMboRzHujekcTzVAgmg2/Q2TWiuvK4z6xmiBtwimktRi8sCbHPedUN9MZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8FGlM04; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8FGlM04"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so145117a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789713764; x=1790318564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtIhiKCuOAEoVt/C4TCUMvQnAVKyRCMQwoS5cwkd+M8=;
        b=h8FGlM04uenPUKCs1JKQ0Ja2o08xnOtJkELygN4AWUc9xp+NuDgQGfRxezoNiFcgNL
         2G3O4B2GjYxwmlj/oJPTKSj96jaBu6ZD+QikhOf38iDbhEpicLMQ3BvUQQE59+BobrvM
         YyMzm5kO4hdABnmvVG9/4TJPChsVklb+ROlHwiFFQbW7GvTrquU++9+nIFqcBMcEc6zZ
         d3+bfXKIH72KFp0OEiB6Z5BBiv6Flob3Q6ROlqOphzLqgrDDx8qHNL3T0Cj/6IF1XfFq
         2ToYzXSrgJcQrCCE/403bcJ9EEKXqlGcYHWCEsAJJ4fFHrCXWdoWbJ7P02SHVYGyzzIK
         FaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713764; x=1790318564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtIhiKCuOAEoVt/C4TCUMvQnAVKyRCMQwoS5cwkd+M8=;
        b=vcFwMA+7xsvOk2Hk9KBzLaxxkzBKXnBNtwWCcbqDZ0noyg1azX//NP3pdBUDXOHZrP
         XCfulGYBqM0IjCCxVI8RQBRE+eP0D8UY1Pp46PI9rYoFh+B5a40jh9LJHbXYzYQNgrW1
         o57xuswzmqe8/xKBrxyXJLyXEHQrnRm53IuGL/DGxoGFLQ2FrsprVDIQe9VkWMo80wmw
         c5a/0/NcywYbeVRFzraPMrIXj3MnMYht5mPyyWGu5vA1ZTfm42gj6RghEz7eiZVit7Md
         jp1lePaVN5edV/q/SJ9JodWCg//A6P2LlH0S0ODPhmRMte3pLlNs3EP21asJ4wKeOBB4
         mQwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr7cTCUr/dQ869s3Cz35aEoMdc0y8FRs0HAhGxit1J8I0D1HSnOdVgpSbQ5+iow3xjBPA9kmvBbd0wVJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ne0YYiWX5Bm5dppELXBYNy7DHAKCu8T8DJACTtQ3BvQumfX9mu
	6tPGMhloY4os7Gz+Qv9nrbuhYPiLvHNmdwCttm1yVpVo0kmfuOl4oVnh
X-Gm-Gg: AYBFou0MvuojIkIM3Ju6Z9oQPx5BilMXnyXH4M53s/XaYXRFHpNQAm5TEvBy8eP1Ogh
	fdnzNPz4bhAXhC6Naeccq/YjoK08YHv7Tnmn6OI3e6XFj4XQalrfS+IgijW+QDbHsY7wJdLKzgZ
	VYHyGebcP0Kfz8ZhV984/2kp97HtbXP3wKfWMoRvgnBRjFJxppIuTIBaSP2NViJXWlxP8rpWI0C
	eUC3yE87oY2CBPwR9yC4WxQrB9SerkmmgPuO0YpliInmNsdBXNGGoM7BeNx6wp4cb97pSEaNVoC
	i1VA5Y0ah33+ckiqmhAH6eJIsG+xl5Uc9R/mVcSiafsSQNzaBDT9ZcxJsSTsdo7F1XEWcYlXW9f
	1gopSY7qUTwDHw3bYK31vBt+5gwDzOxMzxI3MmziIKwWHv0IjUMtgCWna3+LN9i9t27w6D/iT2J
	ZKb30JVdQ4v5shhIfkZMjMnAr6lZwUF4G4nhxOJsMk/Ah8eGvcIq/jrAiv6Z6M3CC76VZjIH3D3
	H81LTJUdzTrLTBLGlUEn0UvVEsSgDddTqa3U1yFtjNJlvItc0a+4OaxY3PY7SV4FTvGVsSI8VbQ
	DQ8dhi/cs1nOF00WSXIfJFTlCA==
X-Received: by 2002:a17:90b:2744:b0:39e:2192:f81e with SMTP id 98e67ed59e1d1-39e554cea27mr1826375a91.7.1789713764296;
        Thu, 17 Sep 2026 23:42:44 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-230-153.dynamic-ip.hinet.net. [36.232.230.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a0e860asm1829055a91.1.2026.09.17.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:42:43 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Fri, 18 Sep 2026 14:42:38 +0800
Message-ID: <20260918064238.868-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fork() maps the anonymous pages of the parent read-only and clears
PageAnonExclusive on them.  Once the child has exec'ed or exited, a
write fault of the parent ends up in the reuse path of do_wp_page():
wp_can_reuse_anon_folio() finds that all references to the folio come
from mappings in this MM, the page is marked exclusive again and its PTE
is made writable.

For a large folio that check is about the folio, and what it finds holds
for every page of it.  Still only the page that faulted is marked
exclusive and only its PTE becomes writable, so each of the other pages
takes a write fault of its own, and each of those takes the large
mapcount lock to find out the same thing again: 16 faults for a 64K
folio, 512 for a 2M THP that is mapped by PTEs.  The same THP mapped by
a PMD is reused by one fault in do_huge_pmd_wp_page(), do_swap_page()
maps all PTEs of an exclusive large folio writable at once, and
numa_rebuild_large_mapping() upgrades all PTEs of the folio from one
hinting fault.

Commit 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for
PTE-mapped THP") left this for later because faulting around might
increase the COW latency.  Numbers for that are below.

When a large folio has been found exclusive, walk the part of it that
this page table maps inside the VMA.  PTEs that still map it read-only
are batched with folio_pte_batch_flags(), their pages are marked
exclusive, and where can_change_pte_writable() agrees the batch is made
writable with modify_prot_start_ptes()/modify_prot_commit_ptes(), the
way mprotect() does it.  That leaves NUMA hinting and uffd-wp PTEs
alone, keeps soft-dirty tracking exact, and on arm64 writes a contpte
block back as a whole where ptep_set_access_flags() on a single PTE has
to unfold it.  Pages that cannot be made writable are marked exclusive
all the same, so their own fault skips the folio check.  The PTE that
faulted is in one of the batches and is then completed by
wp_page_reuse() as before.  Small folios, PMD-mapped THPs, unsharing
faults and the copy path are not changed.

x86-64, i7-12700KF, 256 MiB of anonymous memory, fork(), the child
exits, then the parent stores to the memory.  Medians of 15 runs, two
boots of each kernel, taken alternately:

                          v7.3-rc3+           patched
  one byte per page, a clock_gettime() between the stores
    write faults
      4K pages            65,601              65,601
      64K mTHP            65,601               4,161
      1M mTHP             65,601                 321
      2M THP, PTE-mapped  65,601                 193
      2M THP, PMD-mapped     193                 193
    time (ms)
      4K pages            29.7 / 30.1         30.0 / 31.1
      64K mTHP            29.4 / 29.7          5.5 /  5.6
      1M mTHP             29.3 / 29.8          3.9 /  3.9
      2M THP, PTE-mapped  29.9 / 29.2          3.8 /  3.9
      2M THP, PMD-mapped   2.5 /  2.5          2.5 /  2.6
  memset() of all of it (ms)
      4K pages            57.2 / 56.5         56.9 / 57.1
      64K mTHP            56.5 / 56.3         39.0 / 38.7
      2M THP, PTE-mapped  58.6 / 56.5         36.8 / 37.7
      2M THP, PMD-mapped  37.5 / 35.9         35.9 / 36.5
  8 threads, one byte per page, random order (ms)
      64K mTHP             6.1 /  6.2          0.9 /  1.0
      2M THP, PTE-mapped   6.0 /  6.7          0.7 /  0.7

The latency of the one fault that now does the work for the folio,
measured as the time of the store that takes it, against 420 ns for a
reuse fault today (medians, ns):

                          reuse fault   fault that     COW fault that
                          (patched)     allocated it   copies 4K
      64K mTHP                   730          4,600          1,500
      1M mTHP                  5,500         63,000          1,500
      2M THP, PTE-mapped      10,100        126,000          1,500

That is 14 to 20 ns per PTE.  Builds that differ only by NOPs in front
of the new function take either 10,100 or 7,500 ns for the 2M folio,
with a period of 32 bytes: it is the loop of modify_prot_commit_ptes()
that changes speed with its address.

Capping the walk to the 16 PTEs around the fault instead was measured as
well: it takes 5.4 ms where the above takes 3.9 ms on 1M and 2M folios,
it is slower than today when only one page per 64K is written (3.1 ms
against 1.9 ms, the whole folio takes 1.5 ms), and it is only ahead when
no more than one page per 2M is ever written (0.1 ms against 1.3 ms for
the 256 MiB).

Redis 7.0.15 with 1.3 M keys of 512 bytes on 64K mTHP, BGSAVE and then
1,000,000 SETs: the faults of redis-server during the SETs go from
262,100 to 18,500, its CPU time from 1.48-1.53 s to 1.25-1.33 s, and
redis-benchmark reports 742,000 to 794,000 requests per second instead
of 652,000 to 658,000.  With THP off all three stay where they were.

arm64 was only run under QEMU, for the counters and with DEBUG_VM and
PAGE_TABLE_CHECK: the faults are the same as above, and with 64K folios
the first pass after fork() unfolds every contpte block today (512
contpte_convert() calls for 512 blocks, and nothing folds them again)
while none is unfolded with this patch.

What does not get faster on x86 are stores to pages that this CPU still
has a read-only TLB entry for.  The fault makes the PTEs writable but,
like mprotect(), does not flush, so such a page still takes a fault, a
spurious one that costs about the same as the reuse fault it replaces.
That happens to pages that were read since fork(): reading the 16 pages
of every 64K folio before storing to them takes 65,500 faults and 28 ms
before and after.  And it happens in a loop that does nothing but store
one byte to every page in ascending order, which is what the reuse-byte
mode of David's pte-mapped-folio-benchmarks does (120 ms before and
after for 1 GiB of 64K folios; 2M folios: 119 ms to 18 ms; the reuse
mode, a memset(), goes from 232 ms to 157 ms with 64K folios): while the
first store of a folio is faulting, the CPU has already run the next
stores speculatively and has filled the TLB with the read-only
translations of their pages.  Counting with kprobes, such a run enters
handle_mm_fault() 135,687 times and do_wp_page() 8,457 times; with an
LFENCE after every store the faults are 4,100 instead of 65,400 and the
loop takes 4 ms instead of 29 ms.  The PMD-mapped case, which this patch
does not touch, shows the same: 8,800 faults for 128 THPs, 133 with the
LFENCE.

With a flush_tlb_local() in the new function, as an experiment, the
ascending loop takes 4.1 ms instead of 28 ms on 64K folios, the
read-then-store loop 5.3 ms instead of 28 ms and the memset() 21 ms
instead of 38 ms, for a fault of 870 instead of 730 ns and 11% more time
for the pass with the clock_gettime().  Generic code has no way to ask
x86 for a flush that stays on this CPU, so that is left for later.

Assisted-by: LLM sparse
Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
---
 mm/memory.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..85c883d1e558 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4355,6 +4355,64 @@ static bool wp_can_reuse_anon_folio(struct folio *folio,
 	return true;
 }
 
+/*
+ * wp_can_reuse_anon_folio() found a large folio to be exclusive to this MM.
+ * That holds for all of its pages and not only for the one that faulted: mark
+ * the ones that this page table maps exclusive as well and map them writable,
+ * like mprotect() would. Each of them would otherwise take a write fault of
+ * its own that repeats the check on the very same folio.
+ *
+ * The PTE that faulted is among them; wp_page_reuse() completes it.
+ */
+static void wp_reuse_large_anon_folio(struct vm_fault *vmf,
+		struct folio *folio)
+{
+	const fpb_t flags = FPB_RESPECT_WRITE | FPB_RESPECT_SOFT_DIRTY;
+	const unsigned long idx = folio_page_idx(folio, vmf->page);
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address;
+	unsigned long pt_start = ALIGN_DOWN(addr, PMD_SIZE);
+	unsigned long nr_before, nr_after, end;
+	struct page *page;
+	unsigned int nr, i;
+	pte_t *ptep, pte;
+
+	/* Stay within the folio, the VMA and the page table. */
+	nr_before = min3(idx, (addr - pt_start) >> PAGE_SHIFT,
+			 (addr - vma->vm_start) >> PAGE_SHIFT);
+	nr_after = min3(folio_nr_pages(folio) - idx,
+			(pt_start + PMD_SIZE - addr) >> PAGE_SHIFT,
+			(vma->vm_end - addr) >> PAGE_SHIFT);
+	end = addr + (nr_after << PAGE_SHIFT);
+	addr -= nr_before << PAGE_SHIFT;
+	ptep = vmf->pte - nr_before;
+	page = vmf->page - nr_before;
+
+	for (; addr != end; addr += nr * PAGE_SIZE, ptep += nr, page += nr) {
+		pte = ptep_get(ptep);
+		nr = 1;
+
+		/* Unmapped or replaced since, or writable already. */
+		if (!pte_present(pte) || pte_pfn(pte) != page_to_pfn(page) ||
+		    pte_write(pte))
+			continue;
+
+		nr = folio_pte_batch_flags(folio, NULL, ptep, &pte,
+					   (end - addr) >> PAGE_SHIFT, flags);
+		for (i = 0; i < nr; i++)
+			if (!PageAnonExclusive(page + i))
+				SetPageAnonExclusive(page + i);
+
+		/* The PTEs of a batch agree on everything this looks at. */
+		if (!can_change_pte_writable(vma, addr, pte))
+			continue;
+
+		pte = modify_prot_start_ptes(vma, addr, ptep, nr);
+		modify_prot_commit_ptes(vma, addr, ptep, pte,
+					pte_mkwrite(pte, vma), nr);
+	}
+}
+
 /*
  * This routine handles present pages, when
  * * users try to write to a shared page (FAULT_FLAG_WRITE)
@@ -4449,8 +4507,14 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 	 */
 	if (folio && folio_test_anon(folio) &&
 	    (PageAnonExclusive(vmf->page) || wp_can_reuse_anon_folio(folio, vma))) {
-		if (!PageAnonExclusive(vmf->page))
-			SetPageAnonExclusive(vmf->page);
+		if (!PageAnonExclusive(vmf->page)) {
+			if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
+			    folio_test_large(folio) && likely(!unshare) &&
+			    likely(vma->vm_flags & VM_WRITE))
+				wp_reuse_large_anon_folio(vmf, folio);
+			else
+				SetPageAnonExclusive(vmf->page);
+		}
 		if (unlikely(unshare)) {
 			pte_unmap_unlock(vmf->pte, vmf->ptl);
 			return 0;

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.43.0

