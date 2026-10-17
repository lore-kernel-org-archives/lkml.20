Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5083A48E4
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259843; cv=none; b=DvE8YTcN6E/kWI1uedKSQ19e5BNKhkQrboNijCgP72aVl17zI26rxojwbgR4x4GjC1O3cstldcc8RT8iTXSyoXMd8oXhu1gIbkRV9wCTCJMwavWAwBTW10SrDByLEyNdKjOY/ZV4VCqtbMXh3R4CF9FSJYVHGUI/t630CFzgmaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259843; c=relaxed/simple;
	bh=EP+Yh7zVtw63V7f+4ONS7jOC5SzHWx3d6o530mKBuas=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lMDT1zJdusWgugSDSG6UMVH86RJQ5mYqLHSOr7esYrb5Lvr6NrbCWf/mWXnch3CVuje3asIvqQb0u9hOAU0gD0aorGaU7HJ1y/LZ5JPRaCeHR37bcegkPJk0eT7npd95Uea83+OWUr88OXwz+FZlKDAeENPQcSDAxC96WnSKWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uvHF/VwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uvHF/VwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35471F000C5;
	Sat, 17 Oct 2026 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792259841;
	bh=Vtx+65y7QTGULn7fm4HfmV0OLS9IPk81AvNxPjWvnAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uvHF/VwLv8dVwjABFGOGu7YX5E6f4mpYaxGdV6A4uI1XwYGCY2g8SEOWe/+RFZfPa
	 OLPILKZvlDh3dI/Ao7vW26/E/1WcHDm8UeK1ac8LmJf4vFGPQkmEBRYeDq1W32KNRx
	 LQra22rpuge0dXttY1x2zi9k/LJtHVeOOBQQSayI=
Date: Sat, 17 Oct 2026 10:57:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?UTF-8?B?6rmA7KKF7ZiB?= <malhyuk97@gmail.com>
Cc: xueyuan.chen21@gmail.com, david@kernel.org, lance.yang@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] mm/huge_memory: lazyfree THP PMD restore races
 zap_pmd_range
Message-Id: <20261017105721.994b4c0e57bb96b4345e6da5@linux-foundation.org>
In-Reply-To: <CADQRuqv1akf67+qe+DHbfEM-nPtEjLNzz8BWBRtBVZ8VVqKubA@mail.gmail.com>
References: <CADQRuqv1akf67+qe+DHbfEM-nPtEjLNzz8BWBRtBVZ8VVqKubA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 17 Oct 2026 12:05:49 -0500 김종혁 <malhyuk97@gmail.com> wrote:

> On Sat, Oct 17, 2026, Xueyuan wrote:
> > This bug should be fixed by:
> >
> >
> https://www.google.com/url?q=https://lore.kernel.org/linux-mm/20261012-lazyfree-stable-fix-v2-1-6387d6e30063@nvidia.com/&source=gmail&ust=1792343148969000&sa=E
> >
> > It is already in mm-unstable. Your reproducer would be a good test for it.
> 
> Thanks, that looks like the same race, and I should have checked
> mm-unstable before writing rather than only the released trees. Sorry
> for the duplicate.
> 
> I would be glad to test it. The reproducer runs unprivileged and gives
> the KASAN report in 30 s to 5 min on a 6.12.112 KASAN build, 6 of 7
> five-minute boots, so a before and after on the same guest should be a
> reasonably clear signal, and I can leave it running longer than that if
> you want more confidence in the negative.
> 
> https://www.google.com/url?q=http://lore.kernel.org&source=gmail&ust=1792343148969000&sa=E
> is refusing my requests from this network, so I cannot
> pull the patch from the archive. Could you point me at a tree and
> branch to fetch it from, or send it inline? Either is fine. I will
> report back with the two runs.

Thanks.   Here it is:

From: Zi Yan <ziy@nvidia.com>
Subject: mm/rmap: don't discard lazyfree THPs at PMD level
Date: Mon, 12 Oct 2026 22:20:16 -0400

__discard_anon_folio_pmd_locked() clears a lazyfree THP's PMD before it
determines whether the folio can be discarded, and restores it if the
folio is dirty or has extra references.  It is done under only the PMD
lock and the anon_vma read lock inside try_to_unmap_one() and no mmap lock
is held.  The temporarily none PMD causes UAF.

A parallel munmap() or mremap() is supposed to serialize with it on the
PMD lock, but zap_pmd_range() (called by munmap()) and move_page_tables()
(called by mremap()) do not take the lock when they see the temporarily
none PMD and skip the PMD.  There is no more page table walk after the
none PMD is restored:

- munmap(): free_pgtables() waits in unlink_anon_vmas() for the anon_vma
  lock, then free_pmd_range() drops the restored PMD as bad without
  removing the rmap, so the folio keeps a stale mapcount.

- whole-VMA MREMAP_DONTUNMAP: dontunmap_complete() unlinks the source VMA
  from its anon_vma while the restored PMD still maps the folio.

- plain mremap(): the THP is not moved but unmapped, so the THP's data is
  lost.

In the first two cases, the folio stays mapped, but no VMA that maps it is
linked to its anon_vma.  When the anon_vma is freed, it is still reachable
when one rmap walks the folio.  Racing lazyfree reclaim against
MREMAP_DONTUNMAP as an unprivileged user reproduces a KASAN use-after-free
in folio_lock_anon_vma_read() as reported in the Closes link.

One solution is to use an invalidated PMD instead of a cleared one until
the discard is committed, but it needs arch fixes first.
1. GUP-fast still follows an invalidated PMD on riscv, LoongArch and s390.
2. sparc64 miscounts thp_pte_count when an invalidated PMD is set again or
   cleared.

To keep the fix simple for backport, stop discarding lazyfree THPs at PMD
level instead. try_to_unmap_one() splits the PMD and discards the folio at
PTE level.

unmap_huge_pmd_locked() and __discard_anon_folio_pmd_locked() are left in
place, unused, to minimize this fix for backport and the invalidated PMD
approach is planned as a follow-up series to use them again.

Link: https://lore.kernel.org/20261012-lazyfree-stable-fix-v2-1-6387d6e30063@nvidia.com
Fixes: 735ecdfaf4e8 ("mm/vmscan: avoid split lazyfree THP during shrink_folio_list()")
Signed-off-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: Kyle Zeng <kylebot@openai.com>
Closes: https://lore.kernel.org/r/20261009165214.40212-2-kylebot@openai.com
Reviewed-by: Kyle Zeng <kylebot@openai.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Assisted-by: LLM
Cc: Rik van Riel <riel@surriel.com>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: <stable@vger.kernel.org>
---

 mm/rmap.c |   11 -----------
 1 file changed, 11 deletions(-)

--- a/mm/rmap.c~mm-rmap-dont-discard-lazyfree-thps-at-pmd-level
+++ a/mm/rmap.c
@@ -2275,17 +2275,6 @@ static bool try_to_unmap_one(struct foli
 		}
 
 		if (!pvmw.pte) {
-			if (folio_test_lazyfree(folio)) {
-				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
-					goto walk_done;
-				/*
-				 * unmap_huge_pmd_locked has either already marked
-				 * the folio as swap-backed or decided to retain it
-				 * due to GUP or speculative references.
-				 */
-				goto walk_abort;
-			}
-
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
 				 * We temporarily have to drop the PTL and
_

