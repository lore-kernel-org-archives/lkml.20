Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EA4119F2;
	Thu, 24 Sep 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269742; cv=none; b=i/SJNmmPAardlvNlVSmRpYIZWwaeNbyN483kGeIA0lNFHJp4KgoBFR5s3WjB7lC/BB5La1VQplaBRQllSgsVvdNNzAtA/Q5Qhslsr3g9OtY89uepB/2w2Rge3RVR7eO0Hx1PlehMKuMWmix9V0JkNKq8SYodsaol8Xb17Oquip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269742; c=relaxed/simple;
	bh=vqcJcS6lyg90lJJejSHuVpk4gsdFs1QYYjWOiSAIyaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jF71JqZXJhktFlF6VgTGtAm4Lo5QkQbownbUjRDYpkwW4dRDNMvRWn1ERx6DU5ZrlPnMoWOUHuEWjzsDHF7mMS7sgceLON7NeMIl8klwUQLTZjs8AG4YLRy+ZT3wGrk1TkZP5ooCrIS7QlrJbl9ci15H3SyjX6HQXJAUWQtgQQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Is01bH5e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Is01bH5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5E51F000FF;
	Thu, 24 Sep 2026 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269740;
	bh=x5ZoKFrFhWq0ko9IriYdQVJBVnwVJLNSWEvWxFgN6P4=;
	h=Date:From:To:Cc:Subject;
	b=Is01bH5e2jvyvol1V/mezD1ikkrak+tPxVUNgQJjIP5XZEJMi+eeMOGEqDjoo6Kly
	 v2a3lKXKq2xhgT4iIBt24ooITCVMlNhmjZD7WinaWoP6KBjvTzjPfI1C/0mzLXGcbs
	 qVSxoBh9wIUk/pPTAIybzb0DFrFDEp77QZhbS2EQiLwtbc5e2o1iEFwoouGLOVhjGm
	 I15ZtJlXh8m4ScIir6q8491tBpYwYyB5Flgt7djsTJbpvgFhsuSe3sa00zF8mU2rnr
	 qliB6n+CvSHmU1bZmj9PKoFXCyfrVeaHABW86vw5vvINvzDAeM4xE4qAYwrArkJ5XZ
	 LvzrzApsZVlnA==
Date: Thu, 24 Sep 2026 18:08:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: linux-next: manual merge of the liveupdate tree with the mm tree
Message-ID: <arVZKNJKTwEqrFsF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k2ygBHfmgcEzS5AT"
Content-Disposition: inline


--k2ygBHfmgcEzS5AT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the liveupdate tree got a conflict in:

  mm/mm_init.c

between commit:

  a666a70d029d3 ("mm/mm_init: skip initializing shared vmemmap tail pages")

=66rom the mm tree and commit:

  85d3615cea179 ("kho: rename KHO scratch to KHO bootmem")

=66rom the liveupdate tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/mm_init.c
index dc835f753ea9a,24a53d5f0893d..0000000000000
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@@ -29,7 -29,6 +29,7 @@@
  #include <linux/cma.h>
  #include <linux/crash_dump.h>
  #include <linux/execmem.h>
 +#include <linux/sizes.h>
  #include <linux/vmstat.h>
  #include <linux/kexec_handover.h>
  #include <linux/hugetlb.h>
@@@ -678,33 -677,21 +678,33 @@@ static inline void fixup_hashdist(void
  static inline void fixup_hashdist(void) {}
  #endif /* CONFIG_NUMA */
 =20
 -#if defined(CONFIG_ZONE_DEVICE) || defined(CONFIG_DEFERRED_STRUCT_PAGE_IN=
IT)
  static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
 -		unsigned long nr_pages, int migratetype, bool atomic)
 +		unsigned long nr_pages, int migratetype, bool isolate, bool atomic)
  {
  	const unsigned long end =3D pfn + nr_pages;
 =20
  	for (pfn =3D pageblock_align(pfn); pfn < end; pfn +=3D pageblock_nr_page=
s) {
- 		enum migratetype mt =3D kho_scratch_migratetype(pfn, migratetype);
+ 		enum migratetype mt =3D kho_bootmem_migratetype(pfn, migratetype);
 =20
 -		init_pageblock_migratetype(pfn_to_page(pfn), mt, false);
 -		if (!atomic && IS_ALIGNED(pfn, PAGES_PER_SECTION))
 +		init_pageblock_migratetype(pfn_to_page(pfn), mt, isolate);
 +		if (!atomic && IS_ALIGNED(pfn, PFN_DOWN(SZ_1G)))
  			cond_resched();
  	}
  }
 -#endif
 +
 +struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
 +{
 +	pg_data_t *pgdat =3D NODE_DATA(nid);
 +
 +	for (enum zone_type zone_type =3D 0; zone_type < MAX_NR_ZONES; zone_type=
++) {
 +		struct zone *zone =3D &pgdat->node_zones[zone_type];
 +
 +		if (zone_spans_pfn(zone, pfn))
 +			return zone;
 +	}
 +
 +	return NULL;
 +}
 =20
  #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
  static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
@@@ -764,17 -751,23 +764,17 @@@ defer_init(int nid, unsigned long pfn,=20
 =20
  static void __meminit __init_deferred_page(unsigned long pfn, int nid)
  {
 -	pg_data_t *pgdat =3D NODE_DATA(nid);
 -	int zid;
 +	struct zone *zone;
 =20
  	if (early_page_initialised(pfn, nid))
  		return;
 =20
 -	for (zid =3D 0; zid < MAX_NR_ZONES; zid++) {
 -		struct zone *zone =3D &pgdat->node_zones[zid];
 -
 -		if (zone_spans_pfn(zone, pfn))
 -			break;
 -	}
 -	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
 -
 +	zone =3D pfn_to_zone(pfn, nid);
 +	__init_single_page(pfn_to_page(pfn), pfn,
 +			   zone ? zone_idx(zone) : MAX_NR_ZONES, nid);
  	if (pageblock_aligned(pfn)) {
  		enum migratetype mt =3D
- 			kho_scratch_migratetype(pfn, MIGRATE_MOVABLE);
+ 			kho_bootmem_migratetype(pfn, MIGRATE_MOVABLE);
  		init_pageblock_migratetype(pfn_to_page(pfn), mt, false);
  	}
  }
@@@ -823,41 -816,23 +823,41 @@@ void __meminit init_deferred_page(unsig
   *   the zone boundary; the pages in such holes will be prepended to the
   *   zone/node above the hole except for the trailing pages in the last
   *   section that will be appended to the zone/node below.
 + *
 + * The function counts pages that should be added to
 + * zone->pages_with_online_memmap. With CONFIG_SPARSEMEM_VMEMMAP there co=
uld
 + * be offline subsections even though the entire memory map is valid and =
all
 + * the early sections are online. Count only pages in online subsections
 + * (see pfn_to_online_page()).
   */
 -static void __init init_unavailable_range(unsigned long spfn,
 -					  unsigned long epfn,
 -					  int zone, int node)
 +static unsigned long __init init_unavailable_range(unsigned long spfn,
 +						   unsigned long epfn,
 +						   int zone, int node)
  {
 +	unsigned long next_chunk_pfn __maybe_unused =3D spfn;
  	unsigned long pfn;
 -	u64 pgcnt =3D 0;
 +	u64 online_pgcnt =3D 0, pgcnt =3D 0;
 +	bool is_online =3D true;
 =20
  	for_each_valid_pfn(pfn, spfn, epfn) {
  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
  		__SetPageReserved(pfn_to_page(pfn));
  		pgcnt++;
 +
 +#ifdef CONFIG_SPARSEMEM_VMEMMAP
 +		if (pfn >=3D next_chunk_pfn) {
 +			is_online =3D pfn_section_valid(__pfn_to_section(pfn), pfn);
 +			next_chunk_pfn =3D min(SUBSECTION_ALIGN_UP(pfn + 1), epfn);
 +		}
 +#endif
 +		if (is_online)
 +			online_pgcnt++;
  	}
 =20
  	if (pgcnt)
  		pr_info("On node %d, zone %s: %lld pages in unavailable ranges\n",
  			node, zone_names[zone], pgcnt);
 +	return online_pgcnt;
  }
 =20
  /*
@@@ -911,17 -886,6 +911,17 @@@ void __meminit memmap_init_range(unsign
  			}
  		}
 =20
 +		/*
 +		 * Vmemmap-optimizable PFNs are backed by shared tail struct pages,
 +		 * which have already been initialized during vmemmap population.
 +		 */
 +		if (vmemmap_optimizable_pfn(pfn)) {
 +			const unsigned int order =3D pfn_to_section_compound_order(pfn);
 +
 +			pfn =3D min(ALIGN(pfn, 1UL << order), end_pfn);
 +			continue;
 +		}
 +
  		page =3D pfn_to_page(pfn);
  		__init_single_page(page, pfn, zone, nid);
  		if (context =3D=3D MEMINIT_HOTPLUG) {
@@@ -933,13 -897,19 +933,13 @@@
  				__SetPageOffline(page);
  		}
 =20
 -		/*
 -		 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
 -		 * such that unmovable allocations won't be scattered all
 -		 * over the place during system boot.
 -		 */
 -		if (pageblock_aligned(pfn)) {
 -			enum migratetype mt =3D kho_bootmem_migratetype(pfn, migratetype);
 -
 -			init_pageblock_migratetype(page, mt, isolate_pageblock);
 +		if (pageblock_aligned(pfn))
  			cond_resched();
 -		}
  		pfn++;
  	}
 +
 +	pageblock_migratetype_init_range(start_pfn, pfn - start_pfn, migratetype,
 +					 isolate_pageblock, /* atomic */ false);
  }
 =20
  static void __init memmap_init_zone_range(struct zone *zone,
@@@ -960,21 -930,9 +960,21 @@@
  	memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
  			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE,
  			  false);
 +	zone->pages_with_online_memmap +=3D end_pfn - start_pfn;
 =20
 -	if (*hole_pfn < start_pfn)
 -		init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);
 +	if (*hole_pfn < start_pfn) {
 +		unsigned long hole_start_pfn =3D *hole_pfn;
 +		unsigned long pgcnt;
 +
 +		if (hole_start_pfn < zone_start_pfn) {
 +			init_unavailable_range(hole_start_pfn, zone_start_pfn,
 +					       zone_id, nid);
 +			hole_start_pfn =3D zone_start_pfn;
 +		}
 +		pgcnt =3D init_unavailable_range(hole_start_pfn, start_pfn,
 +					       zone_id, nid);
 +		zone->pages_with_online_memmap +=3D pgcnt;
 +	}
 =20
  	*hole_pfn =3D end_pfn;
  }
@@@ -1042,9 -1000,13 +1042,9 @@@ static void __ref __init_zone_device_pa
  	page->zone_device_data =3D NULL;
 =20
  	/*
 -	 * ZONE_DEVICE pages other than MEMORY_TYPE_GENERIC are released
 -	 * directly to the driver page allocator which will set the page count
 -	 * to 1 when allocating the page.
 -	 *
 -	 * MEMORY_TYPE_GENERIC and MEMORY_TYPE_FS_DAX pages automatically have
 -	 * their refcount reset to one whenever they are freed (ie. after
 -	 * their refcount drops to 0).
 +	 * MEMORY_DEVICE_GENERIC pages regain a refcount of 1 in the free
 +	 * path. The remaining ZONE_DEVICE types start from 0 here and raise
 +	 * the count again when the allocator or driver hands the page out.
  	 */
  	switch (pgmap->type) {
  	case MEMORY_DEVICE_FS_DAX:
@@@ -1059,17 -1021,6 +1059,17 @@@
  	}
  }
 =20
 +static void zone_device_page_init_from_template(struct page *page,
 +		unsigned long pfn, struct page *template)
 +{
 +	set_page_section_from_pfn(template, pfn);
 +#ifdef WANT_PAGE_VIRTUAL
 +	if (!is_highmem_idx(ZONE_DEVICE))
 +		set_page_address(template, __va(pfn << PAGE_SHIFT));
 +#endif
 +	memcpy_nontemporal(page, template, sizeof(*page));
 +}
 +
  /*
   * With compound page geometry and when struct pages are stored in ram mo=
st
   * tail pages are reused. Consequently, the amount of unique struct pages=
 to
@@@ -1079,14 -1030,19 +1079,14 @@@
   * of an altmap. See vmemmap_populate_compound_pages().
   */
  static inline unsigned long compound_nr_pages(unsigned long pfn,
 -					      struct vmem_altmap *altmap,
  					      struct dev_pagemap *pgmap)
  {
 -	/*
 -	 * If DAX memory is hot-plugged into an unoccupied subsection
 -	 * of an early section, the unoptimized boot memmap is reused.
 -	 * See section_activate().
 -	 */
 -	if (early_section(__pfn_to_section(pfn)) ||
 -	    !vmemmap_can_optimize(altmap, pgmap))
 +	const struct mem_section *ms =3D __pfn_to_section(pfn);
 +
 +	if (!section_vmemmap_optimizable(ms))
  		return pgmap_vmemmap_nr(pgmap);
 =20
 -	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
 +	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
  }
 =20
  static void __ref memmap_init_compound(struct page *head,
@@@ -1097,8 -1053,6 +1097,8 @@@
  {
  	unsigned long pfn, end_pfn =3D head_pfn + nr_pages;
  	unsigned int order =3D pgmap->vmemmap_shift;
 +	struct page template;
 +	struct page *page;
 =20
  	/*
  	 * We have to initialize the pages, including setting up page links.
@@@ -1107,23 -1061,13 +1107,23 @@@
  	 * the pages in the same go.
  	 */
  	__SetPageHead(head);
 -	for (pfn =3D head_pfn + 1; pfn < end_pfn; pfn++) {
 -		struct page *page =3D pfn_to_page(pfn);
 =20
 -		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 -		prep_compound_tail(page, head, order);
 -		set_page_count(page, 0);
 -	}
 +	/*
 +	 * All tails of the same compound page share the state established by
 +	 * prep_compound_tail(). Reuse one tail template for the whole range and
 +	 * refresh only the PFN-dependent fields in that template before each co=
py.
 +	 */
 +	pfn =3D head_pfn + 1;
 +	page =3D pfn_to_page(pfn);
 +	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 +	prep_compound_tail(page, head, order);
 +	set_page_count(page, 0);
 +	memcpy(&template, page, sizeof(*page));
 +
 +	/* Initialize the remaining tail pages from template. */
 +	for (pfn =3D head_pfn + 2; pfn < end_pfn; pfn++)
 +		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
 +						    &template);
  	prep_compound_head(head, order);
  }
 =20
@@@ -1139,8 -1083,6 +1139,8 @@@ void __ref memmap_init_zone_device(stru
  	unsigned long zone_idx =3D zone_idx(zone);
  	unsigned long start =3D jiffies;
  	int nid =3D pgdat->node_id;
 +	struct page template;
 +	struct page *page;
 =20
  	if (WARN_ON_ONCE(!pgmap || zone_idx !=3D ZONE_DEVICE))
  		return;
@@@ -1155,28 -1097,10 +1155,28 @@@
  		nr_pages =3D end_pfn - start_pfn;
  	}
 =20
 -	for (pfn =3D start_pfn; pfn < end_pfn; pfn +=3D pfns_per_compound) {
 -		struct page *page =3D pfn_to_page(pfn);
 +	if (!nr_pages)
 +		return;
 =20
 -		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 +	/*
 +	 * Seed the reusable head-page template from the first real struct
 +	 * page. The normal page-init and refcount helpers must operate on
 +	 * a real memmap entry rather than a stack object.
 +	 */
 +	pfn =3D start_pfn;
 +	page =3D pfn_to_page(pfn);
 +	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 +	memcpy(&template, page, sizeof(*page));
 +	if (pfns_per_compound !=3D 1)
 +		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
 +				     compound_nr_pages(pfn, pgmap));
 +	pfn +=3D pfns_per_compound;
 +
 +	/* Initialize the remaining head pages from template. */
 +	for (; pfn < end_pfn; pfn +=3D pfns_per_compound) {
 +		page =3D pfn_to_page(pfn);
 +
 +		zone_device_page_init_from_template(page, pfn, &template);
 =20
  		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
  			cond_resched();
@@@ -1185,11 -1109,10 +1185,11 @@@
  			continue;
 =20
  		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
 -				     compound_nr_pages(pfn, altmap, pgmap));
 +				     compound_nr_pages(pfn, pgmap));
  	}
 =20
 -	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE, f=
alse);
 +	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
 +					 /* isolate */ false, /* atomic */ false);
 =20
  	pr_debug("%s initialised %lu pages in %ums\n", __func__,
  		nr_pages, jiffies_to_msecs(jiffies - start));
@@@ -1243,10 -1166,6 +1243,10 @@@ static unsigned long __init __absent_pa
  	unsigned long start_pfn, end_pfn;
  	int i;
 =20
 +	/* range is empty, nothing to do */
 +	if (!nr_absent)
 +		return 0;
 +
  	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
  		start_pfn =3D clamp(start_pfn, range_start_pfn, range_end_pfn);
  		end_pfn =3D clamp(end_pfn, range_start_pfn, range_end_pfn);
@@@ -1268,9 -1187,22 +1268,9 @@@ unsigned long __init absent_pages_in_ra
  	return __absent_pages_in_range(MAX_NUMNODES, start_pfn, end_pfn);
  }
 =20
 -/* Return the number of page frames in holes in a zone on a node */
 -static unsigned long __init zone_absent_pages_in_node(int nid,
 -					unsigned long zone_type,
 -					unsigned long zone_start_pfn,
 -					unsigned long zone_end_pfn)
 -{
 -	/* zone is empty, we don't have any absent pages */
 -	if (zone_start_pfn =3D=3D zone_end_pfn)
 -		return 0;
 -
 -	return __absent_pages_in_range(nid, zone_start_pfn, zone_end_pfn);
 -}
 -
  /*
   * Return the number of pages a zone spans in a node, including holes
 - * present_pages =3D zone_spanned_pages_in_node() - zone_absent_pages_in_=
node()
 + * present_pages =3D zone_spanned_pages_in_node() - __absent_pages_in_ran=
ge()
   */
  static unsigned long __init zone_spanned_pages_in_node(int nid,
  					unsigned long zone_type,
@@@ -1360,8 -1292,9 +1360,8 @@@ static void __init calculate_node_total
  						     node_end_pfn,
  						     &zone_start_pfn,
  						     &zone_end_pfn);
 -		absent =3D zone_absent_pages_in_node(pgdat->node_id, i,
 -						   zone_start_pfn,
 -						   zone_end_pfn);
 +		absent =3D __absent_pages_in_range(pgdat->node_id, zone_start_pfn,
 +						 zone_end_pfn);
 =20
  		real_size =3D spanned - absent;
 =20
@@@ -1988,8 -1921,7 +1988,8 @@@ static void __init deferred_free_pages(
  	if (!nr_pages)
  		return;
 =20
 -	pageblock_migratetype_init_range(pfn, nr_pages, MIGRATE_MOVABLE, true);
 +	pageblock_migratetype_init_range(pfn, nr_pages, MIGRATE_MOVABLE,
 +					 /* isolate */ false, /* atomic */ true);
 =20
  	page =3D pfn_to_page(pfn);
 =20
@@@ -2256,6 -2188,28 +2256,6 @@@ void __init init_cma_pageblock(struct p
  }
  #endif
 =20
 -void set_zone_contiguous(struct zone *zone)
 -{
 -	unsigned long block_start_pfn =3D zone->zone_start_pfn;
 -	unsigned long block_end_pfn;
 -
 -	block_end_pfn =3D pageblock_end_pfn(block_start_pfn);
 -	for (; block_start_pfn < zone_end_pfn(zone);
 -			block_start_pfn =3D block_end_pfn,
 -			 block_end_pfn +=3D pageblock_nr_pages) {
 -
 -		block_end_pfn =3D min(block_end_pfn, zone_end_pfn(zone));
 -
 -		if (!__pageblock_pfn_to_page(block_start_pfn,
 -					     block_end_pfn, zone))
 -			return;
 -		cond_resched();
 -	}
 -
 -	/* We confirm that there is no hole */
 -	zone->contiguous =3D true;
 -}
 -
  /*
   * Check if a PFN range intersects multiple zones on one or more
   * NUMA nodes. Specify the @nid argument if it is known that this
@@@ -2674,7 -2628,6 +2674,7 @@@ void __init mm_core_init_early(void
  {
  	kho_memory_init_early();
 =20
 +	sparse_sections_init();
  	free_area_init();
 =20
  	hugetlb_cma_reserve();

--k2ygBHfmgcEzS5AT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1WScACgkQJNaLcl1U
h9B2QQf+KaXPYHTwx6SPJqDUf9hjYitBBwpaoRdBh7oZpRAtOlmXXOp/cv4K2vRW
5URWDXsCRQb3VNOhReT9F+n8Yzi+TaniTU0OFuUxExdTVUbpJyFTF4CngtYNngP+
yYl72kLgDMIJV4oApfUFocEJjo3LAOiReHGRpa4YdVCE4vpTpcUvdQw8lywWgE+X
8kIC8VQ2dYJkYMLso+MPvJzR7ytLiFvPrWDygGrgNUX7TP0R8DDxkFaoX1NjkV8D
tDmt+V2hkafCTy8pF8Au42mbzMH6yC7e4fwrIrABSrly8H2SL4rNBFsqlfyknKbp
LXKxSiW9T9pGVs2deB7KUz1oOAANIA==
=6nuz
-----END PGP SIGNATURE-----

--k2ygBHfmgcEzS5AT--
