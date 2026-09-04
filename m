Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AA30F803
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482142; cv=none; b=SduaiLejO074U7w34JcFqbuuNE8DIe3V7POB74oa7Lbd1tAxg28dNIsN2wWN3T00lW3vNU1Rnvc1Q4jZ18oF7za34eOk07GODNjhQG6lOJj5FPCVuEp4e87oTG/9zUEyzlghITKYpoMxOC8HoFk+Qrs7tiZaqdWZN1+/vWl+kfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482142; c=relaxed/simple;
	bh=QzPzqwD5bXlAH0QXI99aAM/zfAyGsV2sBYdZexZT2EU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OgR+mZh7G9zowIWMrPm5mGICoLUtaYLUKtyksJOVnSuqeHXX4DlwhQvk2DeFiSoKyhCgfana28mZl3eDwteIp1ZzXjX4iqXALJqocvi0I1DWD0jHeuy6naRyJlB8ZMV00pls0jQjhefVB9Z3vis0eHgFvPnARlmTpfsixMrTTP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RL1Vm7GC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RL1Vm7GC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98E41F000E9;
	Fri,  4 Sep 2026 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788482141;
	bh=/i0PB9wZ1BVhvmuU/BjDsAlCJWHvx+Op8tKKNzHHKY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RL1Vm7GCgFf5V9xYnCjpbbZYUGpe6r9pkdDDULkM8h3VSSYPHnHI0b0+fkdMB/iRh
	 PqWDkm7zxDo/trg60ESnjwaGEwBo75ZTD4QD8KqUhouYiWS042mB4Fde7cNTiPBvCI
	 3dFpKjDn79U4dj243cWrUyJQiNCk01+xCg739Hjk=
Date: Thu, 3 Sep 2026 17:35:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: SJ Park <sj@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, David Hildenbrand
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/memory: fix hugetlb_zap_begin() call in
 zap_vma_range_batched()
Message-Id: <20260903173540.e8f660dcaf083946417cba3e@linux-foundation.org>
In-Reply-To: <20260904000028.149656-1-sj@kernel.org>
References: <20260904000028.149656-1-sj@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  3 Sep 2026 17:00:26 -0700 SJ Park <sj@kernel.org> wrote:

> Commit f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during
> final unmap") added zap_details parameter to hugetlb_zap_begin().  But
> the hugetlb_zap_begin() call in zap_vma_range_batched() is not updated.
> As a result, build fails as below.  Fix it.
> 
>   CC      mm/memory.o
> .../mm/memory.c: In function ‘zap_vma_range_batched’:
> .../mm/memory.c:2308:9: error: too few arguments to function ‘hugetlb_zap_begin’
>  2308 |         hugetlb_zap_begin(vma, &range.start, &range.end);
>       |         ^~~~~~~~~~~~~~~~~
> In file included from .../mm/memory.c:48:
> .../include/linux/hugetlb.h:253:20: note: declared here
>   253 | static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
>       |                    ^~~~~~~~~~~~~~~~~

You cleverly pulled during the ten-minute-window after I'd pushed this
out in order to pull it onto my build-test-machine.

There's probably a smarter way of doing this, not sure what though.

It doesn't happen often - I usually only need to push/pull the quilt
patches (25-new).

> /* TODO: move below to commentary */
> 
> I didn't read the broken commit in depth.  This fix is only
> build-tested.  I wanted to report the issue with this as a temporal fix,
> but the broken commit doesn't have Link: tag.  So directly posting this
> temporal and not very well verified fix first.

Yeah, this is possible fix for
https://syzkaller.appspot.com/bug?extid=bd6aaf99e8443d8a9034 which I
had chatgpt create for me.  It's in limbo at present until I figure out
what to do with it.  Actually I'll hide it from others while figuring-out
happens.



For the morbidly curious.  It's really only a 2-line change, plus a bunch
of changes to pass the zap_details down to  __hugetlb_zap_begin().



From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm/hugetlb: don't lock private resv_map during final unmap

Replacing a private hugetlb mapping can trigger a lockdep circular
locking warning and, if the corresponding reclaim, NBD and socket paths
run concurrently, can deadlock userspace tasks.

The mmap path holds mmap_lock for write while removing an overlapping
mapping and then reaches:

  unmap_vmas()
    hugetlb_zap_begin()
      hugetlb_vma_lock_write()
        resv_map->rw_sema

This establishes the lock ordering:

  mmap_lock -> resv_map->rw_sema

Lockdep already knows about a transitive dependency in the other
direction.  In full, the relevant part of the dependency graph is:

  resv_map->rw_sema
    -> fs_reclaim
    -> q->q_usage_counter
    -> q->elevator_lock
    -> set->srcu
    -> cmd->lock
    -> nsock->tx_lock
    -> sk_lock-AF_INET6
    -> mmap_lock

The resv_map->rw_sema -> fs_reclaim edge can be established by a
private hugetlb fault.  The fault holds the private VMA lock for read
and huge_pte_alloc() can allocate page-table memory with reclaim
enabled.  The middle of the chain comes from the block and NBD paths,
while sk_lock-AF_INET6 -> mmap_lock can be established when an IPv6
send copies from userspace while holding the socket lock and faults on
the user buffer.

Consequently, lockdep summarizes the relevant reverse path as:

  resv_map->rw_sema -> sk_lock-AF_INET6 -> mmap_lock

This is a transitive lockdep dependency, not a single call stack
holding all three locks.

Commit bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private
VMAs") made hugetlb_vma_lock_write() acquire resv_map->rw_sema for
private hugetlb mappings.  That lock is needed for partial zaps such as
MADV_DONTNEED.  It keeps a concurrent fault from running after the PTE
has been cleared but before the hugepage has actually been returned to
the pool, which could otherwise result in an unexpected SIGBUS when the
hugepage pool is fully allocated.

That serialization is unnecessary when the VMA is being finally
unmapped.  mmap_lock prevents a concurrent fault from entering a VMA
which is being removed, and private VMAs do not participate in hugetlb
PMD sharing.

Pass the zap details to hugetlb_zap_begin() so that it can distinguish
a final unmap.  For final unmaps, continue taking the hugetlb VMA lock
for shareable mappings, where it protects PMD sharing and the lifetime
of the VMA lock, but do not take resv_map->rw_sema for a private
mapping.  Likewise, do not attempt to release the private reservation
map lock from hugetlb_zap_end().

Non-final zaps continue taking resv_map->rw_sema, preserving the
MADV_DONTNEED versus page-fault serialization for which private hugetlb
VMA locking was introduced.

Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: syzbot+bd6aaf99e8443d8a9034@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bd6aaf99e8443d8a9034
Cc: Rik van Riel <riel@surriel.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Jane Chu <jane.chu@oracle.com>
Assisted-by: ChatGPT <chatgpt@openai.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/hugetlb.h |    8 +++++---
 mm/hugetlb.c            |   16 ++++++++++++++--
 mm/memory.c             |    4 ++--
 3 files changed, 21 insertions(+), 7 deletions(-)

--- a/include/linux/hugetlb.h~mm-hugetlb-dont-lock-private-resv_map-during-final-unmap
+++ a/include/linux/hugetlb.h
@@ -245,15 +245,17 @@ void adjust_range_if_pmd_sharing_possibl
 				unsigned long *start, unsigned long *end);
 
 extern void __hugetlb_zap_begin(struct vm_area_struct *vma,
-				unsigned long *begin, unsigned long *end);
+				unsigned long *begin, unsigned long *end,
+				struct zap_details *details);
 extern void __hugetlb_zap_end(struct vm_area_struct *vma,
 			      struct zap_details *details);
 
 static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
-				     unsigned long *start, unsigned long *end)
+				     unsigned long *start, unsigned long *end,
+				     struct zap_details *details)
 {
 	if (is_vm_hugetlb_page(vma))
-		__hugetlb_zap_begin(vma, start, end);
+		__hugetlb_zap_begin(vma, start, end, details);
 }
 
 static inline void hugetlb_zap_end(struct vm_area_struct *vma,
--- a/mm/hugetlb.c~mm-hugetlb-dont-lock-private-resv_map-during-final-unmap
+++ a/mm/hugetlb.c
@@ -5403,13 +5403,25 @@ void __unmap_hugepage_range(struct mmu_g
 }
 
 void __hugetlb_zap_begin(struct vm_area_struct *vma,
-			 unsigned long *start, unsigned long *end)
+			 unsigned long *start, unsigned long *end,
+			 struct zap_details *details)
 {
+	zap_flags_t zap_flags = details ? details->zap_flags : 0;
+
 	if (!vma->vm_file)	/* hugetlbfs_file_mmap error */
 		return;
 
 	adjust_range_if_pmd_sharing_possible(vma, start, end);
-	hugetlb_vma_lock_write(vma);
+
+	/*
+	 * A final unmap cannot race with a fault in this VMA because
+	 * mmap_lock prevents the fault from entering a VMA which is being
+	 * removed.  Skip the private resv_map lock in that case to avoid
+	 * inverting its lock order with mmap_lock.  Shareable mappings
+	 * still need the VMA lock to protect PMD sharing.
+	 */
+	if (!(zap_flags & ZAP_FLAG_UNMAP) || __vma_shareable_lock(vma))
+		hugetlb_vma_lock_write(vma);
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
 }
--- a/mm/memory.c~mm-hugetlb-dont-lock-private-resv_map-during-final-unmap
+++ a/mm/memory.c
@@ -2268,7 +2268,7 @@ void unmap_vmas(struct mmu_gather *tlb,
 		unsigned long start = max(vma->vm_start, unmap->vma_start);
 		unsigned long end = min(vma->vm_end, unmap->vma_end);
 
-		hugetlb_zap_begin(vma, &start, &end);
+		hugetlb_zap_begin(vma, &start, &end, &details);
 		__zap_vma_range(tlb, vma, start, end, &details);
 		hugetlb_zap_end(vma, &details);
 		vma = mas_find(unmap->mas, unmap->tree_end - 1);
@@ -2304,7 +2304,7 @@ void zap_vma_range_batched(struct mmu_ga
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				address, end);
-	hugetlb_zap_begin(vma, &range.start, &range.end);
+	hugetlb_zap_begin(vma, &range.start, &range.end, details);
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
 	/*
_

