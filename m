Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAD337268C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803105; cv=none; b=njXqRYxp2EXk1aCdqOrkFCHIOvmik6LARN/iIPX9wHv8+OBljanK+P5VuFjDU1AuLyp9vg6hc8z/PujUqz1suw60MnzdCCfZeGcrhhxZwckpik65tFSAd9+JfWIhRboiJOQ3Z/8+yTZ4/nDzepvlxp3L4r+8COUaFPh9GD51WT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803105; c=relaxed/simple;
	bh=CiuLYuCbJ4w9EjOryd2zvfKnh9OdoUB6NB+Oqk8Mj88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRZ+a6NZh/dzJxAr7EeQJPR1yBxrh3Ica3RmZTeLUdZf5RBas306UGw2+FDnIxDeNQiEx1e7rDgBCEbu6fyTQ2VQOMF8SzBf9hrLFWYzscJnrlFYf40+5/xhClyiZWcD6xssb9n2p1Gkzu5+TlOjxJA1Eb6twNUz/fnaKBSDwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/HLLwgv; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/HLLwgv"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1208910a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803103; x=1790407903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zipXiy3Z2c8VL53l/rPwbA9WGYn3oGwXIJotl5EYBA=;
        b=d/HLLwgvKavwKbFE6aGJhvGWPW4J7MMsXxaJBB8oITDKIuJBrtRV5aBAORXdjl9zDX
         DsC4wPtfeIpVF7Qjkk4q45sBs9dP3cjS5cJIuRJBbsI1XxWFfWmaNCAdDnBKcqvWOcA9
         6g5DEoYsSx8o8A4fF6w8CvZLDmJOqP0eHIXdvyGMouQvxYoLm0bPsgTn0rwYKbgSE5/P
         /PXgVyalYovEtGYeLb0pSfJxgzj0h4iIJq3s4fgfMx7hKvQXv4fb6AR2k0jvtfH0huWo
         NEDeoR0+xunEf9JlnFqneDtC92UAI8ib4EZihoinkycKotlOGaDbjrKU+GBt4wxuKeDZ
         iteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803103; x=1790407903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zipXiy3Z2c8VL53l/rPwbA9WGYn3oGwXIJotl5EYBA=;
        b=YJFQgwFUvCuGzbSw5PXz1mRDNoObNXvKBpvBGAWhzoVC65Bv2fMD2TBpynqglTEJm1
         wThXKzEmk2DtgHYgFxtSAAmw9cPXesinZedX6xxWnsilagzpFiCLxlBA6XykQWTUMnBL
         2dKb3FMihJd+M1yiXtGukKCwvismiSBDGFuBQMAGs5O5c9ua21oxFUZLI0HR3C44ZTIo
         zOKcIHJchcfhVcDCvqk2wz32W/nWOBBcu+A0P9uVREo7thnR55WBIu19N1/3P4QWS2Tq
         Z7RXwLdLDzlo79UU26A0UJtVkkVwuj97a1EDMNsxwbv+lBwCLTkb4b5nCeil4nQPZr+r
         RryA==
X-Forwarded-Encrypted: i=1; AKwUvBxXS2mP9vEXpmF8Bhj/fn0wBVX0tqxQNSXGvBeLFqWZgZZdV/DMCszunVpVNuo7kwC0UtXwnszOrIwwW1s=@vger.kernel.org
X-Gm-Message-State: AFuF++l/+eyCChoCIZ0xLymvOyYrWVRi5fSIidgh7daR75ceAKgnIb58
	a1HDb19Sk93dj3LYmJiwgB3lq2XMlHOefTdUylOZd7CP4z1n15h9+1jl
X-Gm-Gg: AYBFou2CIlfPBsb4AOHgJwaw5lHkb/CujWCXyT7pcIAGaHl0eq89kRK4c5jdcyaGtuq
	jf4RaSsSHmZW1OvLQQiBYiNg8F6D4FR423yzzd1xeXOuzw4ff3gP8C0zRZb9T0Xx1/vI7ZaqOph
	3CTLxDQc5rwFK2FCjuQ2+DxEZegPWuF5fRFe2x0xx27cbLnNp4ucxwyNvhhR6SZsS+q59UH56oK
	qiOdG+31i0g2nus6iLcgx72ZIvaJzIIpUIgCDpmhUKlNX3XTmP1rl253pDwvaYbwU2wC8YkOGYb
	ZfV0DXCtpDW94Vq/RjsWBhAU4uOS8QAZQOTz12Au4bmN4T3c6MrjV69GUbs/OxhdNChzLtUWPSO
	xudI1mQAWik/hNlg/UGNLTaP9OtymyJQjWbFxnqqZei3ZP4m3dhRgliN7BZwkcpUhCLheCDOilO
	+sY16wYq0gDsBhTprfmg3MJxgHcvZYNnt/8ugi5qI6Ep6pMpEzlBIACyB3jOIVrkijI8s3/xNJQ
	R9ML7DtyLuYL5y9b/fbnXoVLuxdS4ZiZec0QNV/AoAfoZKNzx34zROMh8ez78sE3KMh0o1ujD+k
	/3/CqAWS/XG4cZDX0fRjBbs13Oc7BdEUp9jK
X-Received: by 2002:a05:6a21:7308:b0:3dd:a196:9073 with SMTP id adf61e73a8af0-3dda196a642mr2895494637.61.1789803102983;
        Sat, 19 Sep 2026 00:31:42 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae9e9c8sm654498a12.17.2026.09.19.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:31:42 -0700 (PDT)
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
Subject: [PATCH v2 1/2] mm/memory: reuse 16 PTEs of an exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 15:31:32 +0800
Message-ID: <20260919073134.639-2-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260919073134.639-1-aa9736195201@gmail.com>
References: <20260918064238.868-1-aa9736195201@gmail.com>
 <20260919073134.639-1-aa9736195201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fork() maps the anonymous pages of the parent read-only and clears
PageAnonExclusive on them.  Once the child has exec'ed or exited, the
parent's write fault takes the reuse path of do_wp_page():
wp_can_reuse_anon_folio() finds that all references to the folio come
from this MM, the page is marked exclusive again and its PTE is made
writable.

For a large folio that check is about the folio and holds for every
page of it, but only the page that faulted is marked exclusive and
made writable.  Each other page takes a write fault of its own and
takes the large mapcount lock to find out the same thing again: 16
faults for a 64K folio.  The same THP mapped by a PMD is reused by one
fault in do_huge_pmd_wp_page(), and do_swap_page() maps all PTEs of an
exclusive large folio writable at once.

Barry proposed reusing the whole mTHP from one fault in 2024 [1].  The
reservations then were the latency of the individual write fault and
how far to go around the faulting PTE: a contpte-sized block was fine,
anything bigger not yet convincing (David's replies, linked below).
Commit 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for
PTE-mapped THP") then added the per-folio check and left faulting
around for later.

This is the contpte-sized part.  Once the folio is known to be
exclusive, walk the aligned block of 16 PTEs around the fault, within
the folio and the VMA.  PTEs that still map the folio read-only are
batched with folio_pte_batch_flags(), their pages are marked
exclusive, and where can_change_pte_writable() agrees the batch is
made writable with modify_prot_start_ptes()/modify_prot_commit_ptes(),
as mprotect() does it.  That leaves NUMA hinting and uffd-wp PTEs
alone, keeps soft-dirty tracking exact, and on arm64 writes a contpte
block back as a whole where ptep_set_access_flags() on one PTE has to
unfold it.  Pages that cannot be made writable are still marked
exclusive, so their own fault skips the folio check.  The PTE that
faulted is in one of the batches and is completed by wp_page_reuse()
as before.  Small folios, PMD-mapped THPs, unsharing faults and the
copy path are unchanged.

The cost is bounded by the block: at most 16 PTEs read once by
folio_pte_batch_flags(), the scan fork() and mprotect() already run
over them, 16 pages marked exclusive and 16 PTEs written.  On x86-64
(i7-12700KF; medians of 15 runs, two boots of each kernel taken
alternately) the fault that does that for a 64K folio takes 750 ns,
against 420-440 ns for a reuse fault today and 4,600-5,000 ns for the
fault that allocated the folio.

256 MiB of 64K folios after fork() and the child's exit, faults and
time of the pass:

                            v7.3-rc3+             patched
  one byte per page, seq    65,601  30.8/30.5 ms   4,164   5.7/ 5.7 ms
  one byte per page, random 65,601  39.5/41.6 ms   4,161   7.4/ 7.6 ms
  memset()                  65,541  57.4/59.5 ms   4,102  39.5/39.8 ms
  8 threads, random order   65,541   6.1/ 6.2 ms   4,155   0.9/ 0.9 ms
  one store per 64K folio    4,101   1.9/ 2.0 ms   4,101   3.5/ 3.3 ms

Redis 7.0.15, 1.3 M keys of 512 bytes on 64K mTHP, BGSAVE and then
1,000,000 SETs: the faults of redis-server during the SETs go from
262,100 to 18,550 and its CPU time from 1.48-1.53 s to 1.31-1.41 s;
the requests per second stay within the boot-to-boot spread.  With
THP off nothing changes.

arm64, under QEMU for the counters: the first pass after fork()
unfolds every contpte block of the 64K folios today (512
contpte_convert() calls for 512 blocks, and nothing folds them again);
with this patch none is unfolded.

[1] https://lore.kernel.org/r/20240831092339.66085-1-21cnbao@gmail.com

Link: https://lore.kernel.org/all/20240831092339.66085-1-21cnbao@gmail.com/
Link: https://lore.kernel.org/all/b7853f0f-7044-4c49-931c-c61900229b19@redhat.com/
Link: https://lore.kernel.org/all/36933711-ae0f-468c-93bd-d6a67d974c9d@redhat.com/
Assisted-by: LLM sparse
Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
---
 mm/memory.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..73e5691b3ed8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4355,6 +4355,71 @@ static bool wp_can_reuse_anon_folio(struct folio *folio,
 	return true;
 }
 
+/*
+ * The pages of the folio around the one that faulted are handled in aligned
+ * blocks of this many PTEs: a 64K folio with 4K pages, and the size of a
+ * contpte block on arm64.
+ */
+#define WP_REUSE_NR_PTES	16
+
+/*
+ * wp_can_reuse_anon_folio() found a large folio to be exclusive to this MM.
+ * That holds for all of its pages and not only for the one that faulted: mark
+ * the ones in the same block exclusive as well and map them writable, like
+ * mprotect() would. Each of them would otherwise take a write fault of its own
+ * that repeats the check on the very same folio.
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
+	unsigned long block = ALIGN_DOWN(addr, WP_REUSE_NR_PTES * PAGE_SIZE);
+	unsigned long nr_before, nr_after, end;
+	struct page *page;
+	unsigned int nr, i;
+	pte_t *ptep, pte;
+
+	/* Stay within the folio, the VMA and the block. */
+	nr_before = min3(idx, (addr - block) >> PAGE_SHIFT,
+			 (addr - vma->vm_start) >> PAGE_SHIFT);
+	nr_after = min3(folio_nr_pages(folio) - idx,
+			(block + WP_REUSE_NR_PTES * PAGE_SIZE - addr) >> PAGE_SHIFT,
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
@@ -4449,8 +4514,14 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
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
-- 
2.43.0

