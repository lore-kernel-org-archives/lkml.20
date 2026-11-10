Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351207;
	b=j9LcV6tBDfjok7/bnyot/T/ktbCQ0tNulmYPnAJS2NiPhKkCo29veOLr3IHmTOHevmWM
	 8lUBeT993gyNejR+joJIq9YJtzDC2r4Pcs0mVAEJCXMoondrAOpZ18B6tmeYQN82wv98R
	 5oZ7UWB7OSyb73y9srMUenNOIbXWJngTRKsGV0VfJqwo03Z9LSbysvFq+vgLOHCwh67uq
	 XLjFvbH7QBZ+YLhurh0Q4wuizM0gCKjzrJ42QQUGDAFJ8JNjdpZQeKnbafh4iFP3aLOPD
	 lGWyPh0SM8E0ebypUzhSE3Nq0KGFre2AONUXtcjc+v2py2ERi/DBpPzI9rHHXGqw0Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351207;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qbpNJXzYoqPd4VfqV9VFB8azfuYpEDyQvQ4rjCYOYeg=;
	b=PyTlNqzCDxr4kpZdNwE1fCFwRrK1TRKHfaQdI0jBj9SXjmQ+gHb6jRfQ+k+Ez2Yhq0ig
	 oaE8JL29aKUHSqZVwGRcjXgRHWb5VgPfffXmlXdcyDu8rkBX9iV6aijx8LCTGcKG2YqkI
	 BWCfea/AfZvE1QjKX2qQxMF0Eb4B8daUi4HCOVSXaO/MjdQZ77psVz6QGLHI0Y3Nl5+kA
	 q/TAn37sxFxdBK+Iu0IsTu50dXZdSPzBmeTeZFl2OYd+yJ8PXk835AT6FzIKGtTJ+AOtE
	 b8dNFHpzOhwCn9gmEzLTlZiCtqXZ+/bXtJNoTZGTTVdXqX2YCRm3ML0B46meK7vgQQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eg77k85J;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EFC606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59EFC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eg77k85J
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B060B1D34;
	Tue, 10 Nov 2026 14:53:23 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87C6D3F85F;
	Tue, 10 Nov 2026 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794351206; bh=km9gKyPNIEGHowwbPNAwa8hxGTvimZnmSsS4JYV4E0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eg77k85Jdy0+R16HKJh9Lw6CgTedDXPN5B/c/9QnFId7wsvE4FclWxbYLQvd3ybje
	 u6xtwEDg0GQdaBTIHac/ZHyGCKYvZvuZqt/cI12SfuyhLaSKejsqjPSY+ghPYgabc2
	 TdyGJYgyH1CssbFRkK5hmDp1SSU3KF+XhRNfmiAY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 10 Nov 2026 22:52:56 +0000
Subject: [PATCH v4 6/6] mm: gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-refactor_gup_fast-v4-6-e779a7674274@arm.com>
References: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
In-Reply-To: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7028; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=km9gKyPNIEGHowwbPNAwa8hxGTvimZnmSsS4JYV4E0w=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq86BU67PUYgzIaGvlXWmCR42RxyK2ZX6Tz05Wz
 QEq16IwK2eJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavOgVAAKCRBt1cPRWsUx
 M7kzC/9dOSoDeMINM4IeowxVidTgidaBqPtBNywryTkYP8YvLFcq0nk//vvMBMmuY3l4NGAPYc2
 zIS/2L7dyjEKiirwdWzVLPT8M86NqRwZ15nf5ufrBtDg59TkDDn+Y+CtudSCu7aXeto3ZUAErG9
 SGiC9s2RTa0QaLqkOCue03D8cnisMk0/IIPgs1tt/Yt1JM68l8j1SZ2SaveW20zjjyypEbkoiZt
 WcPbQjuU2mvfqEBA4b5OcKZtCkRoIjM+Gq/DVm7HxMDiDVwkzA/SdeqDmGrR4owCdHZ8Syf48Cm
 oBuqKx7ECAXJ7zqnhnWOAU84g9P/uhId1eZvXGgwbpGV3p7+N+Beec7nuhEmjHObNuP3pLGEcme
 kduut8e9HR988nZhvPsWxFPUb9opwzvFCVEDnQbMEapX70k3O8Ly8gDXPvQYyYwoNFn6yROJ09+
 BYNEmLzMGSrvJtrtRtAJ0EA0viYbOZxdcAkRP7TJks8CjnMETpxJy2hEAG0ea0aAauXtw=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

GUP-fast grabs a PTE-mapped large folio one page at a time.  Every PTE
costs a try_grab_folio_fast() (a refcount cmpxchg, plus the pincount
atomic, a full barrier and a node stat update for FOLL_PIN), a
gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB mTHP
pays sixteen of each and a PTE-mapped 2 MB THP pays 512.

The users are the hot ones: iov_iter_extract_user_pages() pins every
O_DIRECT buffer through pin_user_pages_fast(), io_uring registers its
buffers through it, and so does RDMA memory registration.
With mTHP those buffers are PTE-mapped large folios.

After the head page has been grabbed and verified as before, extend the
run to the following PTEs that map the next pages of the same folio
with the same protection bits, take the remaining references for the
run with try_grab_folio(), and fill pages[] from the run.
The PTEs of the run are read while the reference on the folio is held,
so the folio can neither be collapsed, freed nor split underneath the scan.
A read-only run of an anonymous folio stops at the first page
that gup_must_unshare() rejects, so the per-page exclusivity guarantee for
FOLL_PIN is kept.

folio_pte_batch_flags() does the scan.  It reads the entries with
ptep_get(), which is not safe without the page table lock on
CONFIG_GUP_GET_PXX_LOW_HIGH (x86 PAE, mips32, sh) or with arm64 contpte,
and GUP-fast reads every PTE with ptep_get_lockless() for that reason.
Add FPB_LOCKLESS to make the helper do the same; it is inlined per call
site, so the other callers do not change.

The order-0 path keeps its instruction sequence.  The folio flags are
tested before folio_set_referenced() on purpose: a load of the flags
right after that locked instruction cost about 25% on order-0 pages in
the gup_test benchmark below, and reading them first brings that path
back to the baseline.

gup_test ioctl over a 256 MB anonymous region, FOLL_WRITE, 65536 pages
per call, median of 15 runs, two baseline boots / one patched boot, on
an x86-64 VM:

                       get_user_pages_fast()   pin_user_pages_fast()
                       before       after      before       after
  4 kB pages           849/789 us   783 us     1174/1138 us 1094 us
  64 kB mTHP           812/811 us   126 us     1215/1113 us  188 us
  1 MB mTHP            799/774 us    59 us     1185/1077 us   64 us
  2 MB THP, PTE-mapped 803/786 us    57 us     1159/1120 us   58 us
  2 MB THP, PMD-mapped  42/40 us     40 us       46/41 us     42 us

fio O_DIRECT randread of a null_blk device (CPU bound) with the I/O
buffer in 64 kB mTHP, median of 15 five-second runs:

  bs=1M psync                 126.2/125.6 GB/s  ->  220.6 GB/s
  bs=1M io_uring, iodepth 16   71.2/71.6 GB/s   ->  112.1 GB/s
  bs=64k io_uring, iodepth 16  50.2/50.7 GB/s   ->   60.1 GB/s

IORING_REGISTER_BUFFERS of 1 GB, median of 15:

  64 kB mTHP           6179/5998 us  ->  1599 us
  1 MB mTHP            5790/5801 us  ->   893 us
  4 kB pages           7173/6741 us  ->  6763 us

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Rik van Riel <riel@surriel.com>
Co-developed-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c | 65 +++++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 8ef41353afe8..b0a0019de80a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2936,7 +2936,8 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		unsigned long addr, unsigned long end,
 		unsigned int flags, struct page **pages)
 {
-	unsigned long nr_pages = 0;
+	unsigned long nr_pages = 0, nr_batch;
+	struct folio *folio = NULL;
 	pte_t *ptep, *ptem;
 
 	ptem = ptep = pte_offset_map(&pmd, addr);
@@ -2945,7 +2946,9 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 	do {
 		pte_t pte = ptep_get_lockless(ptep);
 		struct page *page;
-		struct folio *folio;
+		unsigned long i;
+
+		nr_batch = 1;
 
 		/*
 		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
@@ -2955,13 +2958,13 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		 * permissions.
 		 */
 		if (pte_protnone(pte))
-			goto pte_unmap;
+			goto out;
 
 		if (!pte_access_permitted(pte, flags & FOLL_WRITE))
-			goto pte_unmap;
+			goto out;
 
 		if (pte_special(pte))
-			goto pte_unmap;
+			goto out;
 
 		/* If it's not marked as special it must have a valid memmap. */
 		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
@@ -2969,7 +2972,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 
 		folio = try_grab_folio_fast(page, 1, flags);
 		if (!folio)
-			goto pte_unmap;
+			goto out;
 
 		/*
 		 * Recheck the PTE after grabbing the folio to detect concurrent
@@ -2980,19 +2983,25 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		 * would not detect that we are walking a detached page table.
 		 */
 		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
-		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
-			gup_put_folio(folio, 1, flags);
-			goto pte_unmap;
-		}
+		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep))))
+			goto out;
 
-		if (!gup_fast_folio_allowed(folio, flags)) {
-			gup_put_folio(folio, 1, flags);
-			goto pte_unmap;
-		}
+		if (!gup_fast_folio_allowed(folio, flags))
+			goto out;
 
-		if (!pte_write(pte) && gup_must_unshare(NULL, flags, folio, page)) {
-			gup_put_folio(folio, 1, flags);
-			goto pte_unmap;
+		if (folio_test_large(folio))
+			/*
+			 * The reference acquired above keeps the folio stable
+			 * for the following checks.
+			 */
+			nr_batch = folio_pte_batch_flags(folio, NULL, ptep, &pte,
+							 (end - addr) >> PAGE_SHIFT,
+							 FPB_LOCKLESS | FPB_RESPECT_WRITE);
+
+		if (!pte_write(pte)) {
+			nr_batch = gup_pages_not_requiring_unshare(NULL, flags, folio, page, nr_batch);
+			if (!nr_batch)
+				goto out;
 		}
 
 		/*
@@ -3001,16 +3010,22 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		 * see Documentation/core-api/pin_user_pages.rst for
 		 * details.
 		 */
-		if ((flags & FOLL_PIN) && arch_make_folio_accessible(folio)) {
-			gup_put_folio(folio, 1, flags);
-			goto pte_unmap;
-		}
+		if ((flags & FOLL_PIN) && arch_make_folio_accessible(folio))
+			goto out;
+
+		if (nr_batch > 1 && try_grab_folio(folio, nr_batch - 1, flags))
+			nr_batch = 1;
+
 		folio_set_referenced(folio);
-		pages[nr_pages] = page;
-		nr_pages++;
-	} while (ptep++, addr += PAGE_SIZE, addr != end);
+		for (i = 0; i < nr_batch; i++)
+			pages[nr_pages + i] = page + i;
+		nr_pages += nr_batch;
+		folio = NULL;
+	} while (ptep += nr_batch, addr += nr_batch * PAGE_SIZE, addr != end);
 
-pte_unmap:
+out:
+	if (folio)
+		gup_put_folio(folio, 1, flags);
 	pte_unmap(ptem);
 	return nr_pages;
 }

-- 
2.43.0

