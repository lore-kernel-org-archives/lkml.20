Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB031714A;
	Tue, 15 Sep 2026 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479147; cv=none; b=M2Wi2tc3yhXSWhiTPkdLtqlY58O0XxgVy+0GyuiTbu+pCje7ABI5BBgkCTj9IUvuqNZG7XmeYW8GE+THUnzKwVaILTdlOu+MDH0WCTyO+ReBB2qYDWsmh2iaW5lCUgmDc3P5fpzqYo8cEzBo/QQyt6vvDyCl3/1WPmdxGLXzkKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479147; c=relaxed/simple;
	bh=W01bw3lLBhyK1wtO5WC/HCKION1STeFAHjzgsUZXO0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAcpHbTGa1QlEVySttInpzlKYfkg6l1RgI8fLdDo1W70WtT7H2M8n6VGIX8De9lT2lB4aCYy6OpICNpKeJnX3qPYQvT3zVePXOuw+vSsJEg5qIVuQHaSpluTu7uF+2nHtXgtWisLAxBEvlbcD9NKo+hOYK7tzGdIsdR3NdT++k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZlyOr5A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZlyOr5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDE71F000FF;
	Tue, 15 Sep 2026 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789479146;
	bh=9SX8/GhIsJZrb9xb5I+Tzogfui1WoyhmuhNeR5jAvpM=;
	h=Date:From:To:Cc:Subject;
	b=NZlyOr5AGfptnFZtIQSSqn2lGUF1lXGBhihQCX66XKVflzJ2HEiY4xCTm/Kob7Vx/
	 h8Ey1+Ca29S7wmo+zPk4M1d5cr8KHIu9bG/GDxbF+WmBwdRU4ZM8JKOYyCWtbhShby
	 SWDITVWHI8+UtlS9ZLhIMomGhMTqVFcHisucSj9cmvIywrAr7KWadvyQoc0iddZULF
	 VmIIAqY5zBe0ceWJ4K6FZjyXXX+74APuaCBnxDbYyPJ5dL1Q3e5K6zE0bOHnyhjELp
	 yR/9CtAwRqyljoIj/CLlNXeBhcu1TAgoYPfRSnr8Onyj7L/G+Y8ZgxXqmvAuNtfeis
	 Yf5IC+DHkRZ9Q==
Date: Tue, 15 Sep 2026 14:32:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Krishna Iyer <kiyer@crusoe.ai>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	SJ Park <sj@kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the mm
 tree
Message-ID: <aqlI5oRGnTQDCgQu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tNpnpgWciLC/e1AT"
Content-Disposition: inline


--tNpnpgWciLC/e1AT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/damon/vaddr.c

between commits:

  6acc47b87e9f0 ("mm/damon/vaddr: avoid hw-driven pte updates during damon_=
hugetlb_mkold()")
  24f6b1a0ab44a ("mm/damon/vaddr: respect folio end for DAMOS_STAT")
  f256012bb6a1c ("mm/damon/vaddr: respect folio end for DAMOS_MIGRATE_{HOT,=
COLD}")
  fa5b61fcf5c9d ("mm/damon/vaddr: remove a debug message")
  ed6700504e3f5 ("mm/damon: move damon_hugetlb_mkold() from vaddr to ops-co=
mmon")
  88ac1f509a7e6 ("mm/damon/vaddr: support prep_probes")
  68ce5caa141c4 ("mm/damon/vaddr: support apply_probe")
  45e6bd6ac2868 ("mm/damon/vaddr: extend apply_probes() for hugetlb")
  4144f08e72a48 ("mm/damon/vaddr: support pgidle_unset probe filter type")
  6a00e5447c45e ("mm/damon/vaddr: support DAMON_FILTER_TYPE_PGIDLE_SET")
  3dabc621c0cfd ("mm/damon/core: extend probe_hits_wsum() for moving sum ba=
sed calculation")

=66rom the mm tree and commit:

  566380a1497eb ("mm/damon/vaddr: avoid hw-driven pte updates during damon_=
hugetlb_mkold()")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/damon/vaddr.c
index d5dde97b3cd0d,04ee2a2c6a4d6..0000000000000
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@@ -189,12 -189,22 +189,12 @@@ static int damon_va_three_regions(struc
   *   <BIG UNMAPPED REGION 2>
   *   <stack>
   */
 -static void __damon_va_init_regions(struct damon_ctx *ctx,
 -				     struct damon_target *t)
 +static void __damon_va_init_regions(struct damon_target *t)
  {
 -	struct damon_target *ti;
  	struct damon_addr_range regions[3];
 -	int tidx =3D 0;
 =20
 -	if (damon_va_three_regions(t, regions)) {
 -		damon_for_each_target(ti, ctx) {
 -			if (ti =3D=3D t)
 -				break;
 -			tidx++;
 -		}
 -		pr_debug("Failed to get three regions of %dth target\n", tidx);
 +	if (damon_va_three_regions(t, regions))
  		return;
 -	}
 =20
  	damon_set_regions(t, regions, 3, DAMON_MIN_REGION_SZ);
  }
@@@ -207,7 -217,7 +207,7 @@@ static void damon_va_init(struct damon_
  	damon_for_each_target(t, ctx) {
  		/* the user may set the target regions as they want */
  		if (!damon_nr_regions(t))
 -			__damon_va_init_regions(ctx, t);
 +			__damon_va_init_regions(t);
  	}
  }
 =20
@@@ -283,6 -293,40 +283,6 @@@ out
  }
 =20
  #ifdef CONFIG_HUGETLB_PAGE
 -static bool damon_hugetlb_ptep_mkold(pte_t *pte, struct mm_struct *mm,
 -		struct vm_area_struct *vma, unsigned long addr, pte_t *entry)
 -{
 -	unsigned long psize =3D huge_page_size(hstate_vma(vma));
 -
 -	if (!pte_young(*entry))
 -		return false;
 -	*entry =3D huge_ptep_get_and_clear(mm, addr, pte, psize);
 -	*entry =3D pte_mkold(*entry);
 -	set_huge_pte_at(mm, addr, pte, *entry, psize);
 -	return true;
 -}
 -
 -static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
 -				struct vm_area_struct *vma, unsigned long addr)
 -{
 -	bool referenced =3D false;
 -	pte_t entry =3D huge_ptep_get(mm, addr, pte);
 -	struct folio *folio =3D pfn_folio(pte_pfn(entry));
 -
 -	folio_get(folio);
 -
 -	referenced =3D damon_hugetlb_ptep_mkold(pte, mm, vma, addr, &entry);
 -	if (mmu_notifier_clear_young(mm, addr,
 -				     addr + huge_page_size(hstate_vma(vma))))
 -		referenced =3D true;
 -
 -	if (referenced)
 -		folio_set_young(folio);
 -
 -	folio_set_idle(folio);
 -	folio_put(folio);
 -}
 -
  static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
  				     unsigned long addr, unsigned long end,
  				     struct mm_walk *walk)
@@@ -483,243 -527,6 +483,243 @@@ static unsigned int damon_va_check_acce
  	return max_nr_accesses;
  }
 =20
 +static void damon_va_prep_probe_region(struct damon_ctx *ctx,
 +		struct mm_struct *mm, struct damon_region *r,
 +		struct damon_probe *probe)
 +{
 +	struct damon_prep *p;
 +
 +	damon_for_each_prep(p, probe) {
 +		switch (p->action) {
 +		case DAMON_PREP_SET_PGIDLE:
 +			damon_va_mkold(mm, r->sampling_addr);
 +			break;
 +		default:
 +			break;
 +		}
 +	}
 +}
 +
 +static void damon_va_prep_probes(struct damon_ctx *ctx, bool set_samples)
 +{
 +	struct damon_target *t;
 +	struct mm_struct *mm;
 +	struct damon_region *r;
 +	struct damon_probe *p;
 +
 +	damon_for_each_target(t, ctx) {
 +		mm =3D damon_get_mm(t);
 +		if (!mm)
 +			continue;
 +		damon_for_each_region(r, t) {
 +			if (set_samples)
 +				r->sampling_addr =3D damon_rand(ctx, r->ar.start,
 +						r->ar.end);
 +			damon_for_each_probe(p, ctx)
 +				damon_va_prep_probe_region(ctx, mm, r, p);
 +		}
 +		mmput(mm);
 +	}
 +}
 +
 +static bool damon_va_young_addr(struct folio *folio, pte_t *pte, pmd_t *p=
md,
 +		struct mm_struct *mm, unsigned long addr)
 +{
 +	bool young =3D false;
 +
 +	if (pte)
 +		young =3D pte_young(*pte);
 +	else if (pmd)
 +		young =3D pmd_young(*pmd);
 +	young =3D young || !folio_test_idle(folio) ||
 +		mmu_notifier_test_young(mm, addr);
 +	return young;
 +}
 +
 +static bool damon_va_filter_match(struct damon_filter *filter,
 +		struct folio *folio, pte_t *pte, pmd_t *pmd,
 +		struct mm_struct *mm, unsigned long addr)
 +{
 +	bool matched =3D false;
 +
 +	switch (filter->type) {
 +	case DAMON_FILTER_TYPE_PGIDLE_UNSET:
 +		if (!folio)
 +			matched =3D false;
 +		else
 +			matched =3D damon_va_young_addr(folio, pte, pmd, mm,
 +					addr);
 +		break;
 +	case DAMON_FILTER_TYPE_PGIDLE_SET:
 +		if (!folio)
 +			matched =3D false;
 +		else
 +			matched =3D !damon_va_young_addr(folio, pte, pmd, mm,
 +					addr);
 +		break;
 +	default:
 +		return damon_ops_filter_match(filter, folio);
 +	}
 +	return matched =3D=3D filter->matching;
 +}
 +
 +static bool damon_va_filter_pass(struct folio *folio, struct damon_probe =
*p,
 +		pte_t *pte, pmd_t *pmd, struct mm_struct *mm,
 +		unsigned long addr)
 +{
 +	struct damon_filter *f;
 +	bool pass =3D true;
 +
 +	damon_for_each_filter(f, p) {
 +		if (damon_va_filter_match(f, folio, pte, pmd, mm, addr)) {
 +			pass =3D f->allow;
 +			break;
 +		}
 +		pass =3D !f->allow;
 +	}
 +	return pass;
 +}
 +
 +struct damon_va_probe_walk_private {
 +	struct damon_ctx *ctx;
 +	struct damon_region *r;
 +};
 +
 +static void damon_va_probe_folio(struct damon_ctx *ctx,
 +		struct damon_region *r, struct folio *folio,
 +		pte_t *pte, pmd_t *pmd, struct mm_struct *mm)
 +{
 +	struct damon_probe *probe;
 +	int i =3D 0;
 +
 +	damon_for_each_probe(probe, ctx) {
 +		if (damon_va_filter_pass(folio, probe, pte, pmd, mm,
 +					r->sampling_addr))
 +			r->probe_hits[i]++;
 +		i++;
 +	}
 +}
 +
 +static int damon_va_probe_pmd_entry(pmd_t *pmd, unsigned long addr,
 +		unsigned long next, struct mm_walk *walk)
 +{
 +	pte_t *pte;
 +	pte_t ptent;
 +	spinlock_t *ptl;
 +	struct folio *folio;
 +	struct damon_va_probe_walk_private *priv =3D walk->private;
 +
 +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 +	ptl =3D pmd_trans_huge_lock(pmd, walk->vma);
 +	if (ptl) {
 +		pmd_t pmde =3D pmdp_get(pmd);
 +
 +		if (!pmd_present(pmde))
 +			goto huge_out;
 +		folio =3D vm_normal_folio_pmd(walk->vma, addr, pmde);
 +		if (!folio)
 +			goto huge_out;
 +		damon_va_probe_folio(priv->ctx, priv->r, folio, NULL, &pmde,
 +				walk->vma->vm_mm);
 +
 +huge_out:
 +		spin_unlock(ptl);
 +		return 0;
 +	}
 +#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
 +
 +	pte =3D pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
 +	if (!pte)
 +		return 0;
 +	ptent =3D ptep_get(pte);
 +	if (!pte_present(ptent))
 +		goto out;
 +	folio =3D vm_normal_folio(walk->vma, addr, ptent);
 +	if (!folio)
 +		goto out;
 +	damon_va_probe_folio(priv->ctx, priv->r, folio, &ptent, NULL,
 +			walk->vma->vm_mm);
 +
 +out:
 +	pte_unmap_unlock(pte, ptl);
 +	return 0;
 +}
 +
 +#ifdef CONFIG_HUGETLB_PAGE
 +static int damon_va_probe_hugetlb_entry(pte_t *pte, unsigned long hmask,
 +		unsigned long addr, unsigned long end, struct mm_walk *walk)
 +{
 +	struct damon_va_probe_walk_private *priv =3D walk->private;
 +	struct hstate *h =3D hstate_vma(walk->vma);
 +	struct folio *folio;
 +	spinlock_t *ptl;
 +	pte_t entry;
 +
 +	ptl =3D huge_pte_lock(h, walk->mm, pte);
 +	entry =3D huge_ptep_get(walk->mm, addr, pte);
 +	if (!pte_present(entry))
 +		goto out;
 +
 +	folio =3D pfn_folio(pte_pfn(entry));
 +	folio_get(folio);
 +	damon_va_probe_folio(priv->ctx, priv->r, folio, &entry, NULL,
 +			walk->vma->vm_mm);
 +	folio_put(folio);
 +
 +out:
 +	spin_unlock(ptl);
 +	return 0;
 +}
 +#else
 +#define damon_va_probe_hugetlb_entry NULL
 +#endif /* CONFIG_HUGETLB_PAGE */
 +
 +static void __damon_va_apply_probes(struct damon_ctx *ctx,
 +		struct mm_struct *mm,  struct damon_region *r)
 +{
 +	struct damon_va_probe_walk_private arg =3D {
 +		.ctx =3D ctx,
 +		.r =3D r,
 +	};
 +	struct mm_walk_ops damon_probe_walk_ops =3D {
 +		.pmd_entry =3D damon_va_probe_pmd_entry,
 +		.hugetlb_entry =3D damon_va_probe_hugetlb_entry,
 +	};
 +	unsigned long addr =3D r->sampling_addr;
 +
 +	if (!mm)
 +		return;
 +
 +	damon_va_walk_page_range(mm, addr, addr + 1, &damon_probe_walk_ops,
 +			&arg);
 +}
 +
 +static unsigned int damon_va_apply_probes(struct damon_ctx *ctx,
 +		bool set_samples, bool return_max_wsum)
 +{
 +	struct damon_target *t;
 +	struct mm_struct *mm;
 +	struct damon_region *r;
 +	unsigned int max_wsum =3D 0;
 +
 +	damon_for_each_target(t, ctx) {
 +		mm =3D damon_get_mm(t);
 +		damon_for_each_region(r, t) {
 +			if (set_samples)
 +				r->sampling_addr =3D damon_rand(ctx, r->ar.start,
 +						r->ar.end);
 +			__damon_va_apply_probes(ctx, mm, r);
 +			if (return_max_wsum)
 +				max_wsum =3D max(damon_probe_hits_wsum(r, false,
 +							false, ctx), max_wsum);
 +		}
 +		if (mm)
 +			mmput(mm);
 +	}
 +
 +	return max_wsum;
 +}
 +
  static bool damos_va_filter_young_match(struct damos_filter *filter,
  		struct folio *folio, struct vm_area_struct *vma,
  		unsigned long addr, pte_t *ptep, pmd_t *pmdp)
@@@ -869,8 -676,6 +869,8 @@@ huge_out
  		return 0;
 =20
  	for (; addr < next; pte +=3D nr, addr +=3D nr * PAGE_SIZE) {
 +		unsigned long page_idx;
 +
  		nr =3D 1;
  		ptent =3D ptep_get(pte);
 =20
@@@ -883,8 -688,7 +883,8 @@@
  			continue;
  		damos_va_migrate_dests_add(folio, walk->vma, addr, dests,
  				migration_lists);
 -		nr =3D folio_nr_pages(folio);
 +		page_idx =3D folio_page_idx(folio, pte_page(ptent));
 +		nr =3D folio_nr_pages(folio) - page_idx;
  	}
  	pte_unmap_unlock(start_pte, ptl);
  	return 0;
@@@ -1034,8 -838,6 +1034,8 @@@ huge_unlock
  		return 0;
 =20
  	for (; addr < next; pte +=3D nr, addr +=3D nr * PAGE_SIZE) {
 +		unsigned long page_idx;
 +
  		nr =3D 1;
  		ptent =3D ptep_get(pte);
 =20
@@@ -1049,8 -851,7 +1049,8 @@@
 =20
  		if (!damos_va_filter_out(s, folio, vma, addr, pte, NULL))
  			*sz_filter_passed +=3D folio_size(folio);
 -		nr =3D folio_nr_pages(folio);
 +		page_idx =3D folio_page_idx(folio, pte_page(ptent));
 +		nr =3D folio_nr_pages(folio) - page_idx;
  		s->last_applied =3D folio;
  	}
  	pte_unmap_unlock(start_pte, ptl);
@@@ -1148,8 -949,6 +1148,8 @@@ static int __init damon_va_initcall(voi
  		.update =3D damon_va_update,
  		.prepare_access_checks =3D damon_va_prepare_access_checks,
  		.check_accesses =3D damon_va_check_accesses,
 +		.prep_probes =3D damon_va_prep_probes,
 +		.apply_probes =3D damon_va_apply_probes,
  		.target_valid =3D damon_va_target_valid,
  		.cleanup_target =3D damon_va_cleanup_target,
  		.apply_scheme =3D damon_va_apply_scheme,

--tNpnpgWciLC/e1AT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpSOUACgkQJNaLcl1U
h9Acegf+OyKB8YxeuNXv6e1sLsLw4KZD2li9YMwdhe478iIKlmsBMtgJA44vfzxG
d4TEtg4L6FYI5WG7Uwy4K0VhW3DXw4cIfvaqKVelg+/Z/vvqsbfmpgvNmwAHwKhU
WUEhp6jBx4k1yH3LbPgyUfLyiP7dcSVteMiylCO95qkbqU2n/j3K2DzSjvbky+en
vfkEnxvBRmKsZ/419o5i6V33ABs/okcn/C0Rxk0vPScviO4mBNFdYnC1VDEldV+K
KKPIruiX+rpZUlcNPA+4xg2S7f5gxRqErOj4mW+/eM60tX8lWFkN4T5i6rzHY+gF
UszHqwSs9OlHVxLOU/zycpEhCQpXfA==
=EY/M
-----END PGP SIGNATURE-----

--tNpnpgWciLC/e1AT--
