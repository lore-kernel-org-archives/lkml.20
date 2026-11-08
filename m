Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127245;
	b=eAemxvQBbUEbZIgh1iZ1o3wGpTKtSPOAG07mzGWFugoeixSpuIutAUSMfDz1m0+PJp0o
	 CHWxQT/5+OIbuOL4zra5OV90J/inI1V4lzOJc8O2B0RV6jSPh6T5nuPkO+gDe0HzWsrrE
	 E5avHbD65RuoyD0xnnlEeP1KZldEKW1X2XAaoWCVZqbV+S/50rhQR8Nd+uexhyiYwFhCg
	 qUoqvKorojFiOIP3weKrfGCTl0iGadeAP8ks27E+7nu4sv6lSkvYCH3M9robuSv97J6Cp
	 tJAFwn7y4IwdUUQ1CfNJNZrurY7LWrL3r4wojmVIjG4M8X5cf7XM2I6yv/VDu68pobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127245;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aYoUmexxPLJigYcrWiTOVyZolQmaaSPk22SDsY8yV2M=;
	b=J1bqqeU0u83DXP2Wj9DjbmuUXNfZLJ8vc/MUjwMW17ojuL1jX/YFNol3NzfLoQjKBOX5
	 B9OQkqyrz/7Fb3NZfaNcEWqj8ojh9DgiUyqm1F7NLQ6EI6q7/PTZ9CtS4fhjNrp9afGQX
	 MA3RWbyn3jK1okHsRSXcjBKFHWQg7g2H36TJBJ8UukUluqMST1Q2chTpclw04qoeYx61v
	 pvjnIKRGWefs8u4iersb5WNpuNGBUNqBy6p/jRqwNQZGatfMOZnhDAdJoZcnBdaoUZojk
	 DWJ6PNHt0vxGhwsg8dPatBssiANf4ytPBiD5BHrKfP7jJClkzGQgM9EqmBBfzVaNlKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KkGdeozW;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADB606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FADB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KkGdeozW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BYyngODmPBf6+ONXmDqmz1GGGko3fLEGOZKdoUTwChM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794127241; v=1; x=1794732041;
 b=KkGdeozWw6GzIN8/N1hxwiHvUcHndwbzmWMXS7USNunUJ+FeltMBIA61FH1QyV1noHYwTZaL
 lqQnkwuDy9gYU9aZHZ0BwPRLdCkrMG8Ryi4wOesGVzbn7U+RHJ+Ci/bcrIJGcab1pufAWsnLlyi
 gr5PHUZgMheMxtfRnWLaiPRI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8756b258539f3c21;
	Sun, 08 Nov 2026 08:40:41 +0000
X-Mizu-Trace-ID: 8756b258539f3c21
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	qi.zheng@linux.dev,
	tz2294@columbia.edu,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/mprotect: don't skip uffd marker install when racing with PTE table reclaim
Date: Sun,  8 Nov 2026 16:40:35 +0800
Message-ID: <20261108084035.85404-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107-uffd_shmem_marker-v1-1-91fa2d653cfe@kernel.org>
References: <20261107-uffd_shmem_marker-v1-1-91fa2d653cfe@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Nov 07, 2026 at 12:28:55AM +0100, David Hildenbrand (Arm) wrote:
>change_pmd_range() populates PTE tables before installing uffd-wp
>markers. An empty PTE table can be removed after change_pmd_prepare()
>returns but before the pmd_none() check.
>
>That check then skips the range, allowing UFFDIO_WRITEPROTECT to report
>success without installing the required markers. Subsequent writes by
>userspace to these areas will not trigger uffd events.
>
>PTE table reclaim during MADV_DONTNEED and page table retraction during
>khugepaged can trigger this.
>
>Retry page-table allocation in that case. Simplify the code, getting
>rid of change_pmd_prepare() by routing all code through the "again" label.

Cool, nice work1

>It's a small race though, so likely this is not very urgent.
>
>Fixes: fe2567eb5521 ("mm/shmem: allow uffd wr-protect none pte for file-backed mem")
>Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
>Cc: stable@vger.kernel.org
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---
>I expect Andrew to pick this up.
>---
> mm/mprotect.c | 48 +++++++++++-------------------------------------
> 1 file changed, 11 insertions(+), 37 deletions(-)
>
>diff --git a/mm/mprotect.c b/mm/mprotect.c
>index e18d4e12fc341..ef4e7188e24da 100644
>--- a/mm/mprotect.c
>+++ b/mm/mprotect.c
>@@ -470,25 +470,8 @@ pgtable_populate_needed(struct vm_area_struct *vma, unsigned long cp_flags)
> }
> 
> /*
>- * Populate the pgtable underneath for whatever reason if requested.
>- * When {pte|pmd|...}_alloc() failed we treat it the same way as pgtable
>- * allocation failures during page faults by kicking OOM and returning
>- * error.
>- */
>-#define  change_pmd_prepare(vma, pmd, cp_flags)				\
>-	({								\
>-		long err = 0;						\
>-		if (unlikely(pgtable_populate_needed(vma, cp_flags))) {	\
>-			if (pte_alloc(vma->vm_mm, pmd))			\
>-				err = -ENOMEM;				\
>-		}							\
>-		err;							\
>-	})
>-
>-/*
>- * This is the general pud/p4d/pgd version of change_pmd_prepare(). We need to
>- * have separate change_pmd_prepare() because pte_alloc() returns 0 on success,
>- * while {pmd|pud|p4d}_alloc() returns the valid pointer on success.
>+ * Populate the lower-level page table if marker installation requires it.
>+ * Return -ENOMEM on allocation failure.
>  */
> #define  change_prepare(vma, high, low, addr, cp_flags)			\
> 	  ({								\
>@@ -517,30 +500,21 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
> again:
> 		next = pmd_addr_end(addr, end);
> 
>-		ret = change_pmd_prepare(vma, pmd, cp_flags);
>-		if (ret) {
>-			pages = ret;
>-			break;
>-		}
>-
>-		if (pmd_none(*pmd))
>+		if (unlikely(pgtable_populate_needed(vma, cp_flags))) {
>+			if (pte_alloc(vma->vm_mm, pmd)) {
>+				pages = -ENOMEM;
>+				break;
>+			}
>+		} else if (pmd_none(*pmd)) {
> 			goto next;
>+		}

Previously, reclaim could clear the PMD after allocation and we'd just
skip the range without installing the markers ...

Now it's change_pte_range() -> -EAGAIN -> goto again (retry the same range)

And yeah, that should do the trick ;)

> 
> 		_pmd = pmdp_get_lockless(pmd);
> 		if (pmd_is_huge(_pmd)) {
> 			if ((next - addr != HPAGE_PMD_SIZE) ||
> 			    pgtable_split_needed(vma, cp_flags)) {
> 				__split_huge_pmd(vma, pmd, addr, false);
>-				/*
>-				 * For file-backed, the pmd could have been
>-				 * cleared; make sure pmd populated if
>-				 * necessary, then fall-through to pte level.
>-				 */
>-				ret = change_pmd_prepare(vma, pmd, cp_flags);
>-				if (ret) {
>-					pages = ret;
>-					break;
>-				}
>+				goto again;

And, after the split, we just go back to again -> allocate a PTE table
if needed -> recheck the PMD.

So, no need for that second change_pmd_prepare() ANYMORE :D

LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>

Cheers, Lance
