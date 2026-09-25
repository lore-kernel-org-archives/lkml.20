Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580513B0594
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334997; cv=none; b=lkeG+APMMwlK/uxKx4QfX0RIBnlkETnJIkDBW4+cbk7lh/3gbCEUDKqHYWkcz3FnAR0lJwHfo8CCofw35punYVMofkDQxVYfYspFoXnQeANEZTXD3bkn9TKRbSt1pesixrroYWdzJZKL6Gveik3o9/uRuw7ZhxsVFhEkGIzI54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334997; c=relaxed/simple;
	bh=oz2pG9OBJ90Gf8k78u+aJ5rMU8R7Mx6xKJpcKa4YZPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSo3Cd2EiFgLtzNZOwAvJ0XMs9jT54BYs49HBedMkjRGarm7B+RLVBPqaYyJGu7oXFyrHwwqubDPCuwMIsUJyXolhC1YCOadXnuQssU1lx1EbjWH9KmN7x27Z/Lq79hw5Yo/YbEPjvDDmAcSnh/9FECjQVPiY2mq8Y89FcXzoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PeGq2pIP; arc=none smtp.client-ip=91.218.175.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PeGq2pIP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oz2pG9OBJ90Gf8k78u+aJ5rMU8R7Mx6xKJpcKa4YZPA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790334991; v=1; x=1790939791;
 b=PeGq2pIPWZn81HPrdJU/xMFq5qkieUhspXKwW8nyx2BAFWxWYqzSqalzGOUD2D2efNUTt/ZK
 ssMssZ7j0lCR1bXIWpQ1/281cEVgxLwyaBfWK9kWm4i+ie0adTnTLjiTb/R+jXiHwKiEP8FI7W1
 Zfn4lqn9J0sG6Cn59FhxAYdE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0b8268681074fdf1;
	Fri, 25 Sep 2026 11:16:31 +0000
X-Mizu-Trace-ID: 0b8268681074fdf1
X-Migadu-Flow: FLOW_OUT
Message-ID: <94cb5e25-770a-4a13-ba0f-ffe4119cafd6@linux.dev>
Date: Fri, 25 Sep 2026 12:16:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 12/29] mm: handle PMD swap entries in fork path
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-13-usama.arif@linux.dev>
 <69c54254-9657-4b95-a1cb-a6c0429c1c8c@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <69c54254-9657-4b95-a1cb-a6c0429c1c8c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/09/2026 21:28, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:28, Usama Arif wrote:
>> copy_huge_pmd() only knows about migration and device-private PMDs, so a
>> PMD swap entry would fall through to the present-PMD path and fork() would
>> duplicate it without taking a reference on the slots it points at.
>>
>> Copy it the way copy_nonpresent_pte() copies a PTE swap entry: duplicate
>> the swap references, clear the exclusive marker on the source, put the
>> destination mm on mmlist, and account the child's slots to MM_SWAPENTS.
>>
>> Duplicating HPAGE_PMD_NR slots one at a time would be wasteful, so give
>> swap_dup_entry_direct() an nr argument and rename it accordingly. Unlike
>> the put side it hands nr straight to the per-cluster helper, so the range
>> has to sit inside one cluster - which it does, since SWAPFILE_CLUSTER ==
>> HPAGE_PMD_NR under CONFIG_THP_SWAP and a PMD-order folio's slots are only
>> ever allocated at a cluster head. Reject a crossing range with -EINVAL so a
>> future caller cannot walk off the end of the swap table.
> 
> You have a lot of patches, put you could (should? :) ) consider moving the
> swapfile.c stuff into a separate patch, such that we can more reliably catch
> swap maintainers attention (and shrink this patch here).

Ack, the next revision will have the code to duplicate a range of swap entries
as a patch before this one.

> 
>>
>> The GFP_ATOMIC extend-table allocation inside the dup can fail;
>> copy_huge_pmd() then drops both PMD locks and retries once with
>> GFP_KERNEL. Bound it to one retry, because swap_retry_table_alloc() also
>> returns 0 when it decides the table is not needed. Normalise any remaining
>> failure to -ENOMEM: copy_pmd_range() treats every other error as "not a
>> huge PMD" and would then reach pmd_none_or_clear_bad(), clearing the source
>> PMD and leaking its swap slots.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> 
> [...]
> 
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 0e347a545588c..6dfe8ef6dd371 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1894,7 +1894,7 @@ bool touch_pmd(struct vm_area_struct *vma, unsigned long addr,
>>  	return false;
>>  }
>>  
>> -static void copy_huge_non_present_pmd(
>> +static int copy_huge_non_present_pmd(
>>  		struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  		pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
>>  		struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>> @@ -1940,14 +1940,40 @@ static void copy_huge_non_present_pmd(
>>  		 */
>>  		folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
>>  					    dst_vma, src_vma);
>> +	} else if (softleaf_is_swap(entry)) {
>> +		int err;
>> +
>> +		/*
>> +		 * PMD swap entry: duplicate swap references and clear
>> +		 * exclusive on source, matching copy_nonpresent_pte().
>> +		 *
> 
> I'd drop that, rather obvious.
> 
>> +		 * A PMD swap entry only exists under CONFIG_THP_SWAP, where
>> +		 * SWAPFILE_CLUSTER == HPAGE_PMD_NR, and it is cluster aligned,
>> +		 * so these HPAGE_PMD_NR slots are exactly one cluster - which
>> +		 * is what swap_dup_entries_direct() requires.
> 
> This is the more relevant information.

Dropped the first half, kept the cluster paragraph.


> 
>> +		 */
>> +		err = swap_dup_entries_direct(entry, HPAGE_PMD_NR);
>> +		if (err < 0)
>> +			return err;
>> +
>> +		mm_prepare_for_swap_entries(dst_mm);
>> +
>> +		if (pmd_swp_exclusive(pmd)) {
>> +			pmd = pmd_swp_clear_exclusive(pmd);
>> +			set_pmd_at(src_mm, addr, src_pmd, pmd);
>> +		}
>>  	}
>>  
>> -	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>> +	if (softleaf_is_swap(entry))
>> +		add_mm_counter(dst_mm, MM_SWAPENTS, HPAGE_PMD_NR);
>> +	else
>> +		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
> 
> Can we instead just do it like the PTE variant and move these into the
> respective cases?
> 

Have done it for next revision, but it makes the diff slightly longer.
The migration arm had to grow a nested if: the outer test is now
softleaf_is_migration(), because a plain readable migration entry
matched none of the old arms yet still needed MM_ANONPAGES.


> BTW, I'm surprised that we don't have to handle file THP migration and always
> assume MM_ANONPAGES. Maybe we always zap them instead of using migration entries
> ... maybe :)


Not zapped, just never copied.  copy_huge_pmd() bails long before this:

  /* Skip if can be re-fill on fault */
  if (!vma_is_anonymous(dst_vma))
          return 0;

so a file THP is simply refilled from the page cache on the child's
first fault.

> 
>>  int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>> @@ -1957,6 +1983,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  	spinlock_t *dst_ptl, *src_ptl;
>>  	struct page *src_page;
>>  	struct folio *src_folio;
>> +	bool retried = false;
> 
> Do we really need this retried logic? I cannot easily spot something similar in
> copy_pte_range(). I'd assume once swap_retry_table_alloc() succeeds we should be
> mostly good.

I actually implemented it similar to copy_pte_range() until v5, but changed it because
of sashiko feedback which looked reasonable to me at that time :)


> 
> 
>>  	pmd_t pmd;
>>  	pgtable_t pgtable = NULL;
>>  	int ret = -ENOMEM;
>> @@ -1988,6 +2015,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  	if (unlikely(!pgtable))
>>  		goto out;
>>  
>> +retry:
>>  	dst_ptl = pmd_lock(dst_mm, dst_pmd);
>>  	src_ptl = pmd_lockptr(src_mm, src_pmd);
>>  	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
>> @@ -1995,11 +2023,34 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  	ret = -EAGAIN;
>>  	pmd = *src_pmd;
>>  
>> -	if (unlikely(thp_migration_supported() &&
>> -		     pmd_is_valid_softleaf(pmd))) {
> 
> That thp_migration_supported() thingy is one ugly function.

pmd_is_valid_softleaf() should actually be sufficient here.

I dropped thp_migration_supported() here.

> 
>> -		copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd, addr,
>> -					  dst_vma, src_vma, pmd, pgtable);
>> -		ret = 0;
>> +	if (unlikely(pmd_is_valid_softleaf(pmd))) {
>> +		ret = copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
>> +						addr, dst_vma, src_vma, pmd,
>> +						pgtable);
>> +		if (ret) {
>> +			spin_unlock(src_ptl);
>> +			spin_unlock(dst_ptl);
>> +			/*
>> +			 * For PMD swap entries -ENOMEM means the per-cluster
>> +			 * swap-extend table couldn't be GFP_ATOMIC-allocated.
>> +			 * Try the GFP_KERNEL fallback once before giving up.
>> +			 * swap_retry_table_alloc() also returns 0 when it
>> +			 * decides the table is not needed after all, so bound
>> +			 * this to a single retry rather than looping on it.
>> +			 */
>> +			if (ret == -ENOMEM && !retried) {
>> +				softleaf_t entry = softleaf_from_pmd(pmd);
>> +
>> +				retried = true;
>> +				if (softleaf_is_swap(entry) &&
> 
> How can we suddenly not have a PMD
> 
>> +				    !swap_retry_table_alloc(entry, HPAGE_PMD_NR,
>> +							    GFP_KERNEL))
>> +					goto retry;
>> +			}
>> +			pte_free(dst_mm, pgtable);
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
> 
> 
> That's .... messy :)
> 
> 
> I was wondering whether we could handle it slightly like the PTE case: return
> -EIO and let the caller do that for us. We only have to return the "softleaf_t
> entry"
> 
> Would avoid the retry label, the manual unlocking etc.
> 
> Nit sure, just a thought. The code as is is definitely too messy :)


Yeah sorry about this.

I have changed it now, copy_huge_pmd() now returns -EIO and the softleaf_t,
with copy_pmd_range() handling the retry like the PTE path. The next revision
will look like:


 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
                  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
-                 struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
+                 struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
+                 softleaf_t *entryp)
 {
        spinlock_t *dst_ptl, *src_ptl;
        struct page *src_page;
@@ -1995,11 +2020,14 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
        ret = -EAGAIN;
        pmd = *src_pmd;

-       if (unlikely(thp_migration_supported() &&
-                    pmd_is_valid_softleaf(pmd))) {
-               copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd, addr,
-                                         dst_vma, src_vma, pmd, pgtable);
-               ret = 0;
+       if (unlikely(pmd_is_valid_softleaf(pmd))) {
+               ret = copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
+                                               addr, dst_vma, src_vma, pmd,
+                                               pgtable);
+               if (ret) {
+                       *entryp = softleaf_from_pmd(pmd);
+                       pte_free(dst_mm, pgtable);
+               }
                goto out_unlock;
        }

diff --git a/mm/memory.c b/mm/memory.c
index 477d7e359b447..c0ad446d0cea4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1437,11 +1437,21 @@ copy_pmd_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
        do {
                next = pmd_addr_end(addr, end);
                if (pmd_is_huge(*src_pmd)) {
+                       softleaf_t entry = softleaf_mk_none();
                        int err;

                        VM_BUG_ON_VMA(next-addr != HPAGE_PMD_SIZE, src_vma);
+again:
                        err = copy_huge_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
-                                           addr, dst_vma, src_vma);
+                                           addr, dst_vma, src_vma, &entry);
+                       if (err == -EIO) {
+                               VM_WARN_ON_ONCE(!entry.val);
+                               if (swap_retry_table_alloc_nr(entry,
+                                                             HPAGE_PMD_NR,
+                                                             GFP_KERNEL) < 0)
+                                       return -ENOMEM;
+                               goto again;
+                       }
                        if (err == -ENOMEM)
                                return -ENOMEM;
                        if (!err)


and then in copy_huge_non_present_pmd(), I added:


+               err = swap_dup_entries_direct(entry, HPAGE_PMD_NR);
+               if (err)
+                       /* Only -ENOMEM is worth a GFP_KERNEL retry. */
+                       return err == -ENOMEM ? -EIO : -ENOMEM;

as returning -EIO causes a retry. Only -ENOMEM is made retryable,
malformed-entry errors remain terminal rather than potentially retrying indefinitely.


> 
>>  		goto out_unlock;
>>  	}
>>  
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 477d7e359b447..84e1e1c22bffa 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -979,7 +979,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  	struct page *page;
>>  
>>  	if (likely(softleaf_is_swap(entry))) {
>> -		if (swap_dup_entry_direct(entry) < 0)
>> +		if (swap_dup_entries_direct(entry, 1) < 0)
>>  			return -EIO;
>>  
>>  		mm_prepare_for_swap_entries(dst_mm);
>> @@ -1394,7 +1394,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>>  
>>  	if (ret == -EIO) {
>>  		VM_WARN_ON_ONCE(!entry.val);
>> -		if (swap_retry_table_alloc(entry, GFP_KERNEL) < 0) {
>> +		if (swap_retry_table_alloc(entry, 1, GFP_KERNEL) < 0) {
>>  			ret = -ENOMEM;
>>  			goto out;
> 
> 
> For both, I'd provide a simple inline helper that maintains the existing
> interface. Less chrun in unrelated code.


Done, I added:

static inline int swap_dup_entry_direct(swp_entry_t entry)
  {
          return swap_dup_entries_direct(entry, 1);
  }

  static inline int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
  {
          return swap_retry_table_alloc_nr(entry, 1, gfp);
  }

swap_retry_table_alloc_nr() is not a name I love - suggestions welcome.


> 
> [...]
> 
>>  
>>  /*
>> - * swap_dup_entry_direct() - Increase reference count of a swap entry by one.
>> + * swap_dup_entries_direct() - Increase reference count of swap entries by one.
>>   * @entry: first swap entry from which we want to increase the refcount.
>> + * @nr: number of contiguous swap entries to duplicate.
>>   *
>>   * Returns 0 for success, or -ENOMEM if the extend table is required
>>   * but could not be atomically allocated.  Returns -EINVAL if the swap
>> @@ -3978,8 +3997,16 @@ void si_swapinfo(struct sysinfo *val)
>>   * owner. e.g., locking the PTL of a PTE containing the entry being increased.
>>   * Also the swap entry must have a count >= 1. Otherwise folio_dup_swap should
>>   * be used.
>> + *
>> + * Unlike swap_put_entries_direct(), the whole range [entry, entry + nr) must
>> + * lie within one swap cluster; a range that crosses a cluster boundary is
>> + * rejected with -EINVAL. The only caller passing nr > 1 is the PMD swap entry
>> + * fork path: a PMD swap entry can only exist with CONFIG_THP_SWAP, where
>> + * SWAPFILE_CLUSTER == HPAGE_PMD_NR, and a PMD-order folio's slots are only ever
>> + * allocated at a cluster head (see alloc_swap_scan_cluster()), so such a range
>> + * is exactly one cluster.
> 
> I would reduce this drastically. This will bitrot easily and the details are
> only relevant if this actually ever starts failing.
> 
> Just keep the first sentence and add the details to the patch description (which
> you effectively already have)
> 

Done!


Thanks for the reviews!
