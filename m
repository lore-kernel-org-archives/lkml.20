Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B05C489881
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206752; cv=none; b=NjkSWN9hi0wW4tqJU1P3Id29vEpi6FOwMd2R0PtrPqhRoRSI/pcqa2T8gefrshZhxkO0fSf3qdZS7fqg6zPAdMec1145KSRsJ/LyuuP0BTDOI5N8V1BJpJkHG/myOrzaOQxbce4hMKC2KFphysiEA5vS/pSD8efIMaQFxXvJadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206752; c=relaxed/simple;
	bh=oUujiltu+gb2/UUd4friCRgQ1UDCr0Yo7jzhX7W0l/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j5mEuunSvg+CNSC1cKRw9vI4JPuoRIhmwOGkpD0xpLxk4ZffcmRrcFWLppmqbyUv8UpVBFQo/akvmRshg7FE/k6HqPTfQbSw2Rx3SNvPcEmRdWnIQHBCh3WmKeKBYNnPEOMTivWdMxQ/MSolkLEismRyb0reT7kMwiJI95EaAVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fsKhN+gp; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fsKhN+gp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791206662; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=LsApw2S/DbZZ+Xn0zXV8BIb2V2dRdoz7xDCzcJK011o=;
	b=fsKhN+gpgNZaHnu3CpxQtENXgiHyP62iF9wUNN3drEH9o67tcU2p5MujTxy0aTxMJLO5Uu0twF4eAzJ0sMuQNNRDrRpvgU+mB4ue26S8IZhmSAhR7MBwexqtG2P1EeCb8uxzQjN2mnrHIdBq7UhO6fIswMSLzNPQZeW6uZ5TTaw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XCB2SCi_1791206648;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XCB2SCi_1791206648 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 05 Oct 2026 21:24:21 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Zi Yan <ziy@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,
  Byungchul Park <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,
  Alistair Popple <apopple@nvidia.com>,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/migrate: walk runs of consecutive pages in
 do_pages_stat_array()
In-Reply-To: <20261002-bug-mm-move-pages-stat-batch-v2-1-f73b5d20519f@gmail.com>
	(Qiliang Yuan's message of "Fri, 02 Oct 2026 09:25:26 +0800")
References: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com>
	<20261002-bug-mm-move-pages-stat-batch-v2-1-f73b5d20519f@gmail.com>
Date: Mon, 05 Oct 2026 21:24:07 +0800
Message-ID: <87v77ggu14.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Hi, Qiliang,

Qiliang Yuan <odys.yuan@gmail.com> writes:

> move_pages() with a NULL node list reports the node of each page. RDMA
> and KV-cache transfer engines use it to find where large registered
> buffers live, querying every 4K page of buffers that span hundreds of
> gigabytes.
>
> do_pages_stat_array() looks up the VMA and walks the page tables from
> the top for every address, taking and dropping the PTE lock each time.
> That costs about 105 ns per page, so a 16 GiB buffer takes 486 ms.
>
> Callers almost always pass consecutive addresses. Group them into runs
> and walk each run with walk_page_range(), which looks up each VMA and
> PTE table once and answers every page under it while holding the lock.
> Report pages as folio_walk_start() with FW_ZEROPAGE found them: the node
> of a normal folio, -EFAULT for the zero page or an address outside any
> VMA, and -ENOENT otherwise. Handle PUD and hugetlb leaves in their own
> callbacks so that the walk never splits them.
>
> On 7.3-rc5 in a 16-vCPU VM, querying every page of a populated 4 GiB
> buffer:
>
>                 before    after
>   4K pages      105 ns    31.9 ns
>   THP           90 ns     23.1 ns

As pointed out by David, nanosecond-level optimization for a not-so-hot
path isn't very attractive.  I understand the target of your
optimization is not the performance of a single page but that of a large
number of pages (such as 16 GiB).  So, please describe more clearly why
your change is necessary, for example, by providing the performance
improvement of querying 16 GiB memory.

Additionally, the raw performance number depends on the system under
test.  Please provide a little more information about your testing
system, for example, the CPU architecture, generation, physical core
count, etc.  For comparison, the performance improvement percentage
would also be helpful.

---
Best Regards,
Huang, Ying

> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  mm/migrate.c | 188 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 162 insertions(+), 26 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 15b45832bcfa7..f4d8bfb9b7b4a 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2451,44 +2451,180 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
>  	return err;
>  }
>  
> +struct pages_stat_walk {
> +	unsigned long start;
> +	int *status;
> +};
> +
> +static void pages_stat_set(struct pages_stat_walk *psw, unsigned long addr,
> +			   unsigned long end, int stat)
> +{
> +	int *status = psw->status + ((addr - psw->start) >> PAGE_SHIFT);
> +
> +	/* end wraps to 0 for the last page of the address space */
> +	for (; addr != end; addr += PAGE_SIZE)
> +		*status++ = stat;
> +}
> +
> +static int folio_stat(struct folio *folio)
> +{
> +	if (is_zero_folio(folio) || is_huge_zero_folio(folio))
> +		return -EFAULT;
> +	if (folio_is_zone_device(folio))
> +		return -ENOENT;
> +	return folio_nid(folio);
> +}
> +
> +/* Report pages the same way folio_walk_start() with FW_ZEROPAGE finds them. */
> +static int pages_stat_pud_entry(pud_t *pudp, unsigned long addr,
> +				unsigned long end, struct mm_walk *walk)
> +{
> +	struct page *page;
> +	spinlock_t *ptl;
> +	pud_t pud;
> +	int stat;
> +
> +	if (!IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES))
> +		return 0;
> +	pud = pudp_get(pudp);
> +	if (pud_present(pud) && !pud_leaf(pud))
> +		return 0;
> +
> +	ptl = pud_lock(walk->mm, pudp);
> +	pud = pudp_get(pudp);
> +	if (pud_present(pud) && !pud_leaf(pud)) {
> +		spin_unlock(ptl);
> +		return 0;
> +	}
> +	stat = -ENOENT;
> +	if (pud_present(pud)) {
> +		page = vm_normal_page_pud(walk->vma, addr, pud);
> +		if (page)
> +			stat = folio_stat(page_folio(page));
> +	}
> +	pages_stat_set(walk->private, addr, end, stat);
> +	spin_unlock(ptl);
> +	walk->action = ACTION_CONTINUE;
> +	return 0;
> +}
> +
> +static int pages_stat_pmd_entry(pmd_t *pmdp, unsigned long addr,
> +				unsigned long end, struct mm_walk *walk)
> +{
> +	struct vm_area_struct *vma = walk->vma;
> +	struct page *page;
> +	spinlock_t *ptl;
> +	pte_t *ptep;
> +	pmd_t pmd;
> +	int stat;
> +
> +	pmd = pmdp_get_lockless(pmdp);
> +	if (IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES) &&
> +	    (!pmd_present(pmd) || pmd_leaf(pmd))) {
> +		ptl = pmd_lock(walk->mm, pmdp);
> +		pmd = pmdp_get(pmdp);
> +		if (pmd_present(pmd) && !pmd_leaf(pmd)) {
> +			spin_unlock(ptl);
> +			goto pte_table;
> +		}
> +		stat = -ENOENT;
> +		if (pmd_present(pmd)) {
> +			page = vm_normal_page_pmd(vma, addr, pmd);
> +			if (page)
> +				stat = folio_stat(page_folio(page));
> +			else if (is_huge_zero_pmd(pmd))
> +				stat = -EFAULT;
> +		}
> +		pages_stat_set(walk->private, addr, end, stat);
> +		spin_unlock(ptl);
> +		return 0;
> +	}
> +
> +pte_table:
> +	ptep = pte_offset_map_lock(walk->mm, pmdp, addr, &ptl);
> +	if (!ptep) {
> +		walk->action = ACTION_AGAIN;
> +		return 0;
> +	}
> +	for (; addr < end; addr += PAGE_SIZE, ptep++) {
> +		pte_t pte = ptep_get(ptep);
> +
> +		stat = -ENOENT;
> +		if (pte_present(pte)) {
> +			page = vm_normal_page(vma, addr, pte);
> +			if (page)
> +				stat = folio_stat(page_folio(page));
> +			else if (is_zero_pfn(pte_pfn(pte)))
> +				stat = -EFAULT;
> +		}
> +		pages_stat_set(walk->private, addr, addr + PAGE_SIZE, stat);
> +	}
> +	pte_unmap_unlock(ptep - 1, ptl);
> +	return 0;
> +}
> +
> +static int pages_stat_hugetlb_entry(pte_t *ptep, unsigned long hmask,
> +				    unsigned long addr, unsigned long end,
> +				    struct mm_walk *walk)
> +{
> +#ifdef CONFIG_HUGETLB_PAGE
> +	spinlock_t *ptl;
> +	pte_t pte;
> +	int stat = -ENOENT;
> +
> +	ptl = huge_pte_lock(hstate_vma(walk->vma), walk->mm, ptep);
> +	pte = huge_ptep_get(walk->mm, addr, ptep);
> +	if (pte_present(pte))
> +		stat = folio_stat(pfn_folio(pte_pfn(pte)));
> +	pages_stat_set(walk->private, addr, end, stat);
> +	spin_unlock(ptl);
> +#endif
> +	return 0;
> +}
> +
> +static int pages_stat_pte_hole(unsigned long addr, unsigned long end,
> +			       int depth, struct mm_walk *walk)
> +{
> +	/* No VMA at all is -EFAULT, a VMA without the page is -ENOENT */
> +	pages_stat_set(walk->private, addr, end, walk->vma ? -ENOENT : -EFAULT);
> +	return 0;
> +}
> +
> +static const struct mm_walk_ops pages_stat_walk_ops = {
> +	.pud_entry	= pages_stat_pud_entry,
> +	.pmd_entry	= pages_stat_pmd_entry,
> +	.hugetlb_entry	= pages_stat_hugetlb_entry,
> +	.pte_hole	= pages_stat_pte_hole,
> +	.walk_lock	= PGWALK_RDLOCK,
> +};
> +
>  /*
>   * Determine the nodes of an array of pages and store it in an array of status.
>   */
>  static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
>  				const void __user **pages, int *status)
>  {
> -	unsigned long i;
> +	unsigned long i, n;
>  
>  	mmap_read_lock(mm);
>  
> -	for (i = 0; i < nr_pages; i++) {
> -		unsigned long addr = (unsigned long)(*pages);
> -		struct vm_area_struct *vma;
> -		struct folio_walk fw;
> -		struct folio *folio;
> -		int err = -EFAULT;
> +	for (i = 0; i < nr_pages; i += n) {
> +		unsigned long addr = (unsigned long)pages[i] & PAGE_MASK;
> +		struct pages_stat_walk psw = {
> +			.start = addr,
> +			.status = status + i,
> +		};
>  
> -		vma = vma_lookup(mm, addr);
> -		if (!vma)
> -			goto set_status;
> +		/* Walk runs of consecutive pages in one go */
> +		for (n = 1; i + n < nr_pages; n++) {
> +			unsigned long next = (unsigned long)pages[i + n] & PAGE_MASK;
>  
> -		folio = folio_walk_start(&fw, vma, addr, FW_ZEROPAGE);
> -		if (folio) {
> -			if (is_zero_folio(folio) || is_huge_zero_folio(folio))
> -				err = -EFAULT;
> -			else if (folio_is_zone_device(folio))
> -				err = -ENOENT;
> -			else
> -				err = folio_nid(folio);
> -			folio_walk_end(&fw, vma);
> -		} else {
> -			err = -ENOENT;
> +			if (next != addr + n * PAGE_SIZE || next < addr)
> +				break;
>  		}
> -set_status:
> -		*status = err;
> -
> -		pages++;
> -		status++;
> +		if (walk_page_range(mm, addr, addr + n * PAGE_SIZE,
> +				    &pages_stat_walk_ops, &psw))
> +			pages_stat_set(&psw, addr, addr + n * PAGE_SIZE, -EFAULT);
>  	}
>  
>  	mmap_read_unlock(mm);
