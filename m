Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65273905EB;
	Tue, 15 Sep 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479158; cv=none; b=PNApSzZFxlDw6DVdgbAb8oXIiBo+7J4+ic7pR/7oAtqLzqiyDX91wfosPYiniPfLkNfUyoS8eCZxZ5/YM+ildfZo1pW20Iz6B8KELtmlrqygcuEhIXmZU+4nQB/lpGa5URDHRl6Byo9smxfPne+2yAzHKl01EjeIph7yamD42XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479158; c=relaxed/simple;
	bh=KQDuy9PCj6gMBTFXLpuqxZ7YlrK/O0LafW4uiOvYIJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOGAjdRFUzt4cNzt8lMfHikYck7nmS/M/8KcFMFdY/V8kSVd/8iEimjN+dWsUT4amFbSzx/V4KQle8QD46AIJWtZky9Oep9FkJX+YWu1EHBnKDv7Ck3l6vUMUl3xjKs2w+i4vzgu9C3abP7enU6LCvBhXPc4scwC5dz0idqgUoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrM9fo37; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrM9fo37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78AA1F000FF;
	Tue, 15 Sep 2026 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789479156;
	bh=SLPhtCo4oWGeIQibSMnmcwX14PhNBxqBmGCDZnENNcQ=;
	h=Date:From:To:Cc:Subject;
	b=hrM9fo37C9l9rHjxxoYNmUrW2LI9fPb5p5iUFDrlSiaPPZvBONsbtQONAiXj4Jnx2
	 Q1gP3Q4DZ09h4fFVsmLOqbIZnafTzwPb0ykDZgABbAoWlmbYNlCV7LOluBTyIqd0+1
	 LnnF7rkqGYicwADv7DU+2MM81nTMT66zZ6W9XAtfTXQGJH7HTV0RGTVTzaw1Z293fJ
	 ens3uL9Fybn2tKzckUOKyQGth64Fmyxrh3/CxiUT238B1MAffDQQKwg4rQuYwzbJiG
	 izAwn28+mYMaOQhfXBuFbftAz4td3g9PdqxsIBOnqQSBqcg9lN3fsRAYWVF/4o7vdI
	 J60MLDggew2Ag==
Date: Tue, 15 Sep 2026 14:32:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ackerley Tng <ackerleytng@google.com>, Hongfu Li <lihongfu@kylinos.cn>,
	Huaisheng Ye <yehuaisheng@open-hieco.net>,
	Jaewook You <jaewook376@gmail.com>,
	Jinmeng Zhou <jinmengzhou22@gmail.com>,
	Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Longlong Xia <xialonglong@kylinos.cn>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Zhao Li <enderaoelyther@gmail.com>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the mm
 tree
Message-ID: <aqlI7y6TVJTsINED@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZB7l/029rLDmknkk"
Content-Disposition: inline


--ZB7l/029rLDmknkk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/hugetlb.c

between commits:

  e66eed4176426 ("mm/hugetlb: do not dissolve gigantic pages without runtim=
e support")
  f7b1987904bf9 ("mm/hugetlb: fix max-only subpool accounting on alloc_huge=
tlb_folio failure")
  6121655f693f7 ("mm/hugetlb: fix resv_huge_pages double decrement in memfd=
 error path")
  ed62771da8508 ("mm/hugetlb: use hugetlb_vmemmap_optimizable() in boolean =
contexts")
  e1b6218149da3 ("mm/sparse-vmemmap: rename HVO order macros")
  06f8705bfa9f1 ("mm/hugetlb: switch HugeTLB to section-based vmemmap optim=
ization")
  27da1e7e0591e ("mm/hugetlb: remove HUGE_BOOTMEM_HVO")
  becc26de43819 ("mm/hugetlb: remove HUGE_BOOTMEM_CMA")
  661924944464c ("mm/hugetlb: localize struct huge_bootmem_page")
  0906df87f1c72 ("mm/hugetlb: localize HUGE_BOOTMEM_ZONES_VALID")
  e5215e10fed91 ("mm/hugetlb: warn instead of silently bailing gigantic pag=
es without runtime support")
  858fd521da151 ("mm/hugetlb: preserve source surplus accounting during dem=
otion")
  ff2738512b84e ("mm/hugetlb: cap demotion at currently available free page=
s")
  2abb1820003ec ("mm: hugetlb: return -ENOSPC on memcg charge failure")
  4387fdebcd7cb ("mm: hugetlb: drop refcount before freeing on memcg charge=
 failure")
  1767ef423cd19 ("mm/hugetlb: charge folios to the target mm's memcg")
  23becfb18688d ("mm/hugetlb: fix subpool minimum reservation rollback")
  0bd66c5296ed7 ("mm/hugetlb: account for allowed nodes when gathering surp=
lus pages")
  755b5b6349080 ("mm/sparse-vmemmap: move vmemmap optimization helpers to a=
 public header")
  fc451c02dc6af ("mm/hugetlb: preserve mremap address delta when skipping p=
age tables")

=66rom the mm tree and commits:

  09a2c8a46cf62 ("mm/hugetlb: do not dissolve gigantic pages without runtim=
e support")
  1ff1504af83d9 ("mm/hugetlb: fix max-only subpool accounting on alloc_huge=
tlb_folio failure")
  770243d49fe62 ("mm/hugetlb: preserve mremap address delta when skipping p=
age tables")

=66rom the mm-nonmm-unstable tree (more duplicated commits).

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/hugetlb.c
index d3a0650ff6905,49ffbcb54f8c0..0000000000000
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@@ -38,7 -38,6 +38,7 @@@
  #include <linux/mm_inline.h>
  #include <linux/padata.h>
  #include <linux/pgalloc.h>
 +#include <linux/vmemmap-optimization.h>
 =20
  #include <asm/page.h>
  #include <asm/tlb.h>
@@@ -55,20 -54,12 +55,20 @@@
  #include "mm_init.h"
  #include <linux/page-isolation.h>
 =20
 +#define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
 +
 +struct huge_bootmem_page {
 +	struct list_head list;
 +	struct hstate *hstate;
 +	unsigned long flags;
 +};
 +
  int hugetlb_max_hstate __read_mostly;
  unsigned int default_hstate_idx;
  struct hstate hstates[HUGE_MAX_HSTATE];
 =20
  __initdata nodemask_t hugetlb_bootmem_nodes;
 -__initdata struct list_head huge_boot_pages[MAX_NUMNODES];
 +static struct list_head huge_boot_pages[MAX_NUMNODES] __initdata;
 =20
  /*
   * Due to ordering constraints across the init code for various
@@@ -125,7 -116,6 +125,7 @@@ struct mutex *hugetlb_fault_mutex_tabl
 =20
  /* Forward declaration */
  static int hugetlb_acct_memory(struct hstate *h, long delta);
 +static unsigned int allowed_mems_nr(struct hstate *h);
  static void hugetlb_vma_lock_free(struct vm_area_struct *vma);
  static void hugetlb_vma_lock_alloc(struct vm_area_struct *vma);
  static void __hugetlb_vma_unlock_write_free(struct vm_area_struct *vma);
@@@ -1397,11 -1387,8 +1397,11 @@@ void remove_hugetlb_folio(struct hstat
  	VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
 =20
  	lockdep_assert_held(&hugetlb_lock);
 -	if (hstate_is_gigantic_no_runtime(h))
 +	if (hstate_is_gigantic_no_runtime(h)) {
 +		/* Callers must filter gigantic_no_runtime upstream. */
 +		VM_WARN_ON_ONCE(1);
  		return;
 +	}
 =20
  	list_del(&folio->lru);
 =20
@@@ -1462,11 -1449,8 +1462,11 @@@ static void __update_and_free_hugetlb_f
  {
  	bool clear_flag =3D folio_test_hugetlb_vmemmap_optimized(folio);
 =20
 -	if (hstate_is_gigantic_no_runtime(h))
 +	if (hstate_is_gigantic_no_runtime(h)) {
 +		/* Callers must filter gigantic_no_runtime upstream. */
 +		VM_WARN_ON_ONCE(1);
  		return;
 +	}
 =20
  	/*
  	 * If we don't know which subpages are hwpoisoned, we can't free
@@@ -2203,10 -2187,8 +2203,10 @@@ struct folio *alloc_hugetlb_folio_reser
 =20
  	folio =3D dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
  					       nmask);
 -	if (folio)
 +	if (folio) {
 +		folio_set_hugetlb_restore_reserve(folio);
  		h->resv_huge_pages--;
 +	}
 =20
  	spin_unlock_irq(&hugetlb_lock);
  	return folio;
@@@ -2253,19 -2235,6 +2253,19 @@@ static nodemask_t *policy_mbind_nodemas
  	return NULL;
  }
 =20
 +/*
 + * Reservations are globally accounted, but they must also be backed by f=
ree
 + * pages on nodes allowed by the current cpuset and MPOL_BIND policy.
 + */
 +static long surplus_pages_needed(struct hstate *h, long delta, long alloc=
ated)
 +{
 +	long global_free =3D (long)h->free_huge_pages + allocated;
 +	long allowed_free =3D (long)allowed_mems_nr(h) + allocated;
 +
 +	return max((long)h->resv_huge_pages + delta - global_free,
 +		   delta - allowed_free);
 +}
 +
  /*
   * Increase the hugetlb pool such that it can accommodate a reservation
   * of size 'delta'.
@@@ -2288,7 -2257,7 +2288,7 @@@ static int gather_surplus_pages(struct=20
  		alloc_nodemask =3D cpuset_current_mems_allowed;
 =20
  	lockdep_assert_held(&hugetlb_lock);
 -	needed =3D (h->resv_huge_pages + delta) - h->free_huge_pages;
 +	needed =3D surplus_pages_needed(h, delta, 0);
  	if (needed <=3D 0) {
  		h->resv_huge_pages +=3D delta;
  		return 0;
@@@ -2319,10 -2288,11 +2319,10 @@@ retry
 =20
  	/*
  	 * After retaking hugetlb_lock, we need to recalculate 'needed'
 -	 * because either resv_huge_pages or free_huge_pages may have changed.
 +	 * because either resv_huge_pages or the free page counts may have chang=
ed.
  	 */
  	spin_lock_irq(&hugetlb_lock);
 -	needed =3D (h->resv_huge_pages + delta) -
 -			(h->free_huge_pages + allocated);
 +	needed =3D surplus_pages_needed(h, delta, allocated);
  	if (needed > 0) {
  		if (alloc_ok)
  			goto retry;
@@@ -2857,7 -2827,6 +2857,7 @@@ void wait_for_freed_hugetlb_folios(void
   * hugetlb_alloc_folio - Allocate a hugetlb folio.
   * @h: Hugetlb state control block.
   * @mpoli: Interpreted memory policy to use for allocation.
 + * @mm: Memory descriptor of the allocation target.
   * @alloc_flags: Flags controlling the allocation behavior.
   *
   * Allocates a hugetlb folio and handles cgroup charging and global hstate
@@@ -2865,10 -2834,10 +2865,10 @@@
   *
   * Return: A pointer to the allocated folio, or an ERR_PTR on failure.
   *         -ENOSPC if cgroup charging fails or no folio is available.
 - *         -ENOMEM if mem cgroup charging fails.
   */
  struct folio *hugetlb_alloc_folio(struct hstate *h,
 -		struct mempolicy_interpreted *mpoli, u8 alloc_flags)
 +		struct mempolicy_interpreted *mpoli, struct mm_struct *mm,
 +		u8 alloc_flags)
  {
  	bool charge_hugetlb_cgroup_rsvd =3D alloc_flags &
  					  HUGETLB_ALLOC_CHARG_CGROUP_RSVD;
@@@ -2923,8 -2892,7 +2923,8 @@@
 =20
  	spin_unlock_irq(&hugetlb_lock);
 =20
 -	ret =3D mem_cgroup_charge_hugetlb(folio, gfp | __GFP_RETRY_MAYFAIL);
 +	ret =3D mem_cgroup_charge_hugetlb(folio, mm,
 +					gfp | __GFP_RETRY_MAYFAIL);
  	/*
  	 * Unconditionally increment NR_HUGETLB here because if
  	 * mem_cgroup_charge_hugetlb failed, freeing the page will
@@@ -2933,17 -2901,13 +2933,17 @@@
  	lruvec_stat_mod_folio(folio, NR_HUGETLB, nr_pages);
 =20
  	if (ret =3D=3D -ENOMEM) {
 -		free_huge_folio(folio);
 +		folio_put(folio);
  		/*
  		 * Skip uncharging hugetlb_cgroup since the charges
  		 * were committed to the folio and freeing the folio
  		 * would have cleared those up.
  		 */
 -		return ERR_PTR(ret);
 +		/*
 +		 * Return -ENOSPC, since retrying the fault is futile:
 +		 * the OOM killer is not triggered for HugeTLB.
 +		 */
 +		return ERR_PTR(-ENOSPC);
  	}
 =20
  	return folio;
@@@ -3067,7 -3031,7 +3067,7 @@@ struct folio *alloc_hugetlb_folio(struc
  		.nodemask =3D nodemask,
  	};
 =20
 -	folio =3D hugetlb_alloc_folio(h, &mpoli, alloc_flags);
 +	folio =3D hugetlb_alloc_folio(h, &mpoli, vma->vm_mm, alloc_flags);
 =20
  	mpol_cond_put(mpol);
 =20
@@@ -3177,7 -3141,7 +3177,7 @@@ static bool __init alloc_bootmem_huge_p
  	 */
  	INIT_LIST_HEAD(&m->list);
  	m->hstate =3D h;
 -	m->flags =3D hugetlb_early_cma(h) ? HUGE_BOOTMEM_CMA : 0;
 +	m->flags =3D 0;
 =20
  	/* CMA pages: zone-crossing is validated in hugetlb_cma_reserve(). */
  	if (!hugetlb_early_cma(h) &&
@@@ -3195,7 -3159,6 +3195,7 @@@
  	} else {
  		list_add_tail(&m->list, &huge_boot_pages[nid]);
  		m->flags |=3D HUGE_BOOTMEM_ZONES_VALID;
 +		hugetlb_vmemmap_optimize_bootmem_page(pfn, huge_page_order(h));
  		/*
  		 * Only initialize the head struct page in memmap_init_reserved_pages,
  		 * rest of the struct pages will be initialized by the HugeTLB
@@@ -3253,6 -3216,16 +3253,6 @@@ static void __init hugetlb_folio_init_v
  	prep_compound_head(&folio->page, huge_page_order(h));
  }
 =20
 -static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *=
m)
 -{
 -	return m->flags & HUGE_BOOTMEM_HVO;
 -}
 -
 -static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page=
 *m)
 -{
 -	return m->flags & HUGE_BOOTMEM_CMA;
 -}
 -
  /*
   * memblock-allocated pageblocks might not have the migrate type set
   * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVAB=
LE)
@@@ -3322,7 -3295,6 +3322,7 @@@ static void __init gather_bootmem_preal
  	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
  		struct page *page =3D virt_to_page(m);
  		struct folio *folio =3D (void *)page;
 +		const unsigned long pfn =3D folio_pfn(folio);
 =20
  		h =3D m->hstate;
  		/*
@@@ -3340,9 -3312,16 +3340,9 @@@
  					   HUGETLB_VMEMMAP_RESERVE_PAGES);
  		init_new_hugetlb_folio(folio);
 =20
 -		if (hugetlb_bootmem_page_prehvo(m))
 -			/*
 -			 * If pre-HVO was done, just set the
 -			 * flag, the HVO code will then skip
 -			 * this folio.
 -			 */
 +		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
  			folio_set_hugetlb_vmemmap_optimized(folio);
 -
 -		if (hugetlb_bootmem_page_earlycma(m))
 -			folio_set_hugetlb_cma(folio);
 +		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
 =20
  		list_add(&folio->lru, &folio_list);
 =20
@@@ -3354,9 -3333,7 +3354,9 @@@
  		 * For CMA pages, this is done in init_cma_pageblock
  		 * (via hugetlb_bootmem_init_migratetype), so skip it here.
  		 */
 -		if (!folio_test_hugetlb_cma(folio))
 +		if (hugetlb_early_cma(h))
 +			folio_set_hugetlb_cma(folio);
 +		else
  			adjust_managed_page_count(page, pages_per_huge_page(h));
  		cond_resched();
  	}
@@@ -3385,6 -3362,31 +3385,6 @@@ void __init hugetlb_bootmem_struct_page
  		.max_threads	=3D num_node_state(N_MEMORY),
  		.numa_aware	=3D true,
  	};
 -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 -	struct zone *zone;
 -
 -	for_each_zone(zone) {
 -		for (int i =3D 0; i < NR_VMEMMAP_TAILS; i++) {
 -			struct page *tail, *p;
 -			unsigned int order;
 -
 -			tail =3D zone->vmemmap_tails[i];
 -			if (!tail)
 -				continue;
 -
 -			order =3D i + VMEMMAP_TAIL_MIN_ORDER;
 -			p =3D page_to_virt(tail);
 -			/*
 -			 * prep_and_add_bootmem_folios() can access pageblock
 -			 * flags on bootmem HugeTLB pages, so initialize the
 -			 * shared tail struct pages here before bootmem folios
 -			 * start using them.
 -			 */
 -			for (int j =3D 0; j < PAGE_SIZE / sizeof(struct page); j++)
 -				init_compound_tail(p + j, NULL, order, zone);
 -		}
 -	}
 -#endif
 =20
  	padata_do_multithreaded(&job);
  }
@@@ -3434,7 -3436,7 +3434,7 @@@ static void __init hugetlb_hstate_alloc
  			folio =3D only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid,
  					&node_states[N_MEMORY], NULL);
  			if (!folio && !list_empty(&folio_list) &&
 -			    hugetlb_vmemmap_optimizable_size(h)) {
 +			    hugetlb_vmemmap_optimizable(h)) {
  				prep_and_add_allocated_folios(h, &folio_list);
  				INIT_LIST_HEAD(&folio_list);
  				folio =3D only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid,
@@@ -3503,7 -3505,7 +3503,7 @@@ static void __init hugetlb_pages_alloc_
  	for (i =3D 0; i < num; ++i) {
  		struct folio *folio;
 =20
 -		if (hugetlb_vmemmap_optimizable_size(h) &&
 +		if (hugetlb_vmemmap_optimizable(h) &&
  		    (si_mem_available() =3D=3D 0) && !list_empty(&folio_list)) {
  			prep_and_add_allocated_folios(h, &folio_list);
  			INIT_LIST_HEAD(&folio_list);
@@@ -4030,7 -4032,6 +4030,7 @@@ long demote_pool_huge_page(struct hstat
  	struct hstate *dst;
  	long rc =3D 0;
  	long nr_demoted =3D 0;
 +	long nr_persistent =3D 0;
 =20
  	lockdep_assert_held(&hugetlb_lock);
 =20
@@@ -4043,60 -4044,22 +4043,60 @@@
 =20
  	for_each_node_mask_to_free(src, nr_nodes, node, nodes_allowed) {
  		LIST_HEAD(list);
 +		LIST_HEAD(surplus_list);
  		struct folio *folio, *next;
 +		unsigned long nr_available, nr_target;
 +
 +		/*
 +		 * Re-check available each node batch: the previous
 +		 * batch released hugetlb_lock for vmemmap restore/split,
 +		 * and a new reservation could have been added in that
 +		 * window, shrinking the budget.  available is global
 +		 * (resv is not per-node), so 0 means no node can
 +		 * contribute -- stop the whole scan.
 +		 */
 +		nr_available =3D available_huge_pages(src);
 +		if (!nr_available)
 +			break;
 +
 +		/*
 +		 * Cap this batch at the current budget; expressed as a
 +		 * cumulative stop point because nr_demoted is running.
 +		 */
 +		nr_target =3D nr_demoted + min_t(unsigned long,
 +				nr_to_demote - nr_demoted, nr_available);
 =20
  		list_for_each_entry_safe(folio, next, &src->hugepage_freelists[node], l=
ru) {
 +			bool adjust_surplus;
 +
  			if (folio_test_hwpoison(folio))
  				continue;
 =20
 -			remove_hugetlb_folio(src, folio, false);
 -			list_add(&folio->lru, &list);
 +			/* Surplus accounting is maintained per node, not per folio. */
 +			adjust_surplus =3D src->surplus_huge_pages_node[node] > 0;
 +			remove_hugetlb_folio(src, folio, adjust_surplus);
 +			list_add(&folio->lru, adjust_surplus ? &surplus_list : &list);
 +			if (!adjust_surplus)
 +				nr_persistent++;
 =20
 -			if (++nr_demoted =3D=3D nr_to_demote)
 +			if (++nr_demoted =3D=3D nr_target)
  				break;
  		}
 =20
 +		if (list_empty(&list) && list_empty(&surplus_list))
 +			continue;
 +
  		spin_unlock_irq(&hugetlb_lock);
 =20
 -		rc =3D demote_free_hugetlb_folios(src, dst, &list);
 +		if (!list_empty(&list))
 +			rc =3D demote_free_hugetlb_folios(src, dst, &list);
 +		if (!list_empty(&surplus_list)) {
 +			long tmp_rc;
 +
 +			tmp_rc =3D demote_free_hugetlb_folios(src, dst, &surplus_list);
 +			if (rc >=3D 0)
 +				rc =3D tmp_rc;
 +		}
 =20
  		spin_lock_irq(&hugetlb_lock);
 =20
@@@ -4104,14 -4067,6 +4104,14 @@@
  			list_del(&folio->lru);
  			add_hugetlb_folio(src, folio, false);
 =20
 +			nr_demoted--;
 +			nr_persistent--;
 +		}
 +
 +		list_for_each_entry_safe(folio, next, &surplus_list, lru) {
 +			list_del(&folio->lru);
 +			add_hugetlb_folio(src, folio, true);
 +
  			nr_demoted--;
  		}
 =20
@@@ -4123,7 -4078,7 +4123,7 @@@
  	 * Not absolutely necessary, but for consistency update max_huge_pages
  	 * based on pool changes for the demoted page.
  	 */
 -	src->max_huge_pages -=3D nr_demoted;
 +	src->max_huge_pages -=3D nr_persistent;
  	dst->max_huge_pages +=3D nr_demoted << (huge_page_order(src) - huge_page=
_order(dst));
 =20
  	if (rc < 0)
@@@ -5226,21 -5181,21 +5226,21 @@@ int move_hugetlb_page_tables(struct vm_
  	hugetlb_vma_lock_write(vma);
  	i_mmap_lock_write(mapping);
  	for (; old_addr < old_end; old_addr +=3D sz, new_addr +=3D sz) {
 -		const unsigned long offset_to_last_entry =3D
 +		const unsigned long remaining_size =3D
  			(old_addr | last_addr_mask) - old_addr;
 =20
  		src_pte =3D hugetlb_walk(vma, old_addr, sz);
  		if (!src_pte) {
 -			old_addr +=3D offset_to_last_entry;
 -			new_addr +=3D offset_to_last_entry;
 +			old_addr +=3D remaining_size;
 +			new_addr +=3D remaining_size;
  			continue;
  		}
  		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
  			continue;
 =20
  		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
 -			old_addr +=3D offset_to_last_entry;
 -			new_addr +=3D offset_to_last_entry;
 +			old_addr +=3D remaining_size;
 +			new_addr +=3D remaining_size;
  			continue;
  		}
 =20
@@@ -6878,6 -6833,15 +6878,6 @@@ long hugetlb_reserve_pages(struct inod
 =20
  out_put_pages:
  	spool_resv =3D chg - gbl_reserve;
 -	if (spool_resv) {
 -		/* put sub pool's reservation back, chg - gbl_reserve */
 -		gbl_resv =3D hugepage_subpool_put_pages(spool, spool_resv);
 -		/*
 -		 * subpool's reserved pages can not be put back due to race,
 -		 * return to hstate.
 -		 */
 -		hugetlb_acct_memory(h, -gbl_resv);
 -	}
  	/* Restore used_hpages for pages that failed global reservation */
  	if (gbl_reserve && spool) {
  		unsigned long flags;
@@@ -6887,15 -6851,6 +6887,15 @@@
  			spool->used_hpages -=3D gbl_reserve;
  		unlock_or_release_subpool(spool, flags);
  	}
 +	if (spool_resv) {
 +		/* put sub pool's reservation back, chg - gbl_reserve */
 +		gbl_resv =3D hugepage_subpool_put_pages(spool, spool_resv);
 +		/*
 +		 * subpool's reserved pages can not be put back due to race,
 +		 * return to hstate.
 +		 */
 +		hugetlb_acct_memory(h, -gbl_resv);
 +	}
  out_uncharge_cgroup:
  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
  					    chg * pages_per_huge_page(h), h_cg);

--ZB7l/029rLDmknkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpSO4ACgkQJNaLcl1U
h9BBgwf/daxo0Dbf7DtMB1E6d1MKC9qflt4qh2zafuLB/QQUK7/uBM85ELPvy3Gx
/XC0A6MoODjpTdsvyjdZUJbGygnA6lnHUG5LjkSu1LClcJrGrCxw0kwSFHc3bPYA
tkzYv1wVXPfJswWWmnQM/tGsGmjHqAoOrpWy9awKs6vGQG7Dx/UABDxYPhg21qk8
ybJGmDZuWaoQA1Le71QDTi/kZTHm3cpaKewZdyrpN28xy8XWw3iljZpM0UPlhRO7
REUtqI2ISjuFf7518jmYLwPAeUrhAbpxIHTsrTU69gIYwgrSTBsCbpXwBZCagMgW
MaJ51955H15+NANwe/XJFG3R1LG9pw==
=Tbww
-----END PGP SIGNATURE-----

--ZB7l/029rLDmknkk--
