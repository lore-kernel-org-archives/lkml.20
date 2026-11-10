Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339296;
	b=LK3lb1OEgyl4W9w6x/vG3z+p4Md05G3O3oqt828LK0CPJfRNHtYG4E0CnsqhPTTL1bpf
	 lPmcy7RszcRb/L9ZFQqB0q2MvnJfgYcNg+S6vy2yXW++tho6YxzdbsASaHAQyKbRU7qB/
	 NKeEhQ9l4wwETDSMltAijeLrh/FtoUwsf3h8BRuK2qOaLYWpGW6S845HRAsKX7JNDh9gH
	 h7YbYKVLGHviFnt1Hx3dfpA8uEUlQE7T6ePSarDCgv/n159NZ9Xa86qTZTLvjyFQf+uDx
	 rb7kQ9SM2CSx6001yksAe4vW1wpaDBfQG0KV7lVcuHZT9iyPgv2bKWlVWOPFB+qMX5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ChagzA3lJxUq0s2lDSqu1oPMXsQXK2vBrbmsrjJtE9U=;
	b=bldOO3CFWtnLM/2kHcj6JveHrSl6tzRkJRK+veLz13hH0NzI2JFyXf5AmMjkzUzzoJvq
	 NOVuFwYphhydJsLTc4KpgBTlB6ja7SE0ZRyqLiHXZatU1tJl+rLoQGOacCb/0fxT/rd9D
	 DiZDk6+aIQFWf/T9NwcdSybiKLcLA8pT0zI4aXu0sTRvh+YQ4X3Z1cCUWRQudj9EqFD3L
	 CHQT3ScWxv2S3gDQ2AX4dU1TQ13lhlj2VvjXGs8utARSAkfdOw3zbE+yPiiLyomjnOnPt
	 +FmWvpkVTxSCbZNJcv4pER8kKDR7TKWTE9mr5aamkXFKeUi/ouYIcOJl2p6etuKBJRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BrEOdeTB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21837606A325;
	Tue, 10 Nov 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BrEOdeTB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441F21F008A3;
	Tue, 10 Nov 2026 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339296;
	bh=ChagzA3lJxUq0s2lDSqu1oPMXsQXK2vBrbmsrjJtE9U=;
	h=Date:From:To:Cc:Subject;
	b=BrEOdeTBhQwlo7YHiCuCPE7oZVyDgthVyZowmnF4KIIqwcfP5CbVWvhdwWUp5Di1y
	 r1KGhdaSX6GOeCRJJgUc93lxdAVk5JryMXM2pT+qV4IVUMLbdPy6aMl56pAy2pcYR5
	 mGmnqAJzUKT9mqyZCxuHSowu0h/suXurTaapuZ1Li9RoTPBQ+DZlHDPfB33QHXTASV
	 hXkJP7L4O5mQ1g0KEsItwTf4zcJu6BQwE05hrlX0myHdE/qCJ+SmlnONn/v7XE8OX1
	 e0IZkgH3IIEsNq7X3tktnrykBIuzPQBvDgJ7cTdTPf+X10C/hfJxcXkeROsPX5xnPy
	 ZcYxgkIOBMEoA==
Date: Tue, 10 Nov 2026 19:34:51 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>
Subject: linux-next: manual merge of the mm tree with the mm-fixes tree
Message-ID: <avNx2xUs15uvXX3f@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2NR5BjWITPMxj5J1"
Content-Disposition: inline


--2NR5BjWITPMxj5J1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  include/linux/mm.h

between commits:

  4ad0729ad201b ("mm: fix missing page-table destructor in pagetable_free()=
")
  b8fdad7f507db ("mm-vma-read-anon_vma-carefully-in-validate_mm-fix")

=66rom the mm-fixes tree and commit:

  3b11ce5e7f0cf ("mm: remove pagetable_dtor_free()")

=66rom the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined include/linux/mm.h
index d57c61b928f47,627e8878d6dca..0000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -38,7 -38,6 +38,6 @@@
  #include <linux/bitops.h>
  #include <linux/iommu-debug-pagealloc.h>
  #include <linux/kcsan-checks.h>
- #include <linux/vmemmap-optimization.h>
 =20
  struct mempolicy;
  struct anon_vma;
@@@ -2146,27 -2145,6 +2145,6 @@@ static inline unsigned int page_shift(s
  	return PAGE_SHIFT + compound_order(page);
  }
 =20
- /**
-  * thp_order - Order of a transparent huge page.
-  * @page: Head page of a transparent huge page.
-  */
- static inline unsigned int thp_order(struct page *page)
- {
- 	VM_BUG_ON_PGFLAGS(PageTail(page), page);
- 	return compound_order(page);
- }
-=20
- /**
-  * thp_size - Size of a transparent huge page.
-  * @page: Head page of a transparent huge page.
-  *
-  * Return: Number of bytes in this page.
-  */
- static inline unsigned long thp_size(struct page *page)
- {
- 	return PAGE_SIZE << thp_order(page);
- }
-=20
  #ifdef CONFIG_MMU
  /*
   * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
@@@ -2181,7 -2159,8 +2159,8 @@@ static inline pte_t maybe_mkwrite(pte_
  	return pte;
  }
 =20
- vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct p=
age *page);
+ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct p=
age *page,
+ 		bool may_alloc);
  void set_pte_range(struct vm_fault *vmf, struct folio *folio,
  		struct page *page, unsigned int nr, unsigned long addr);
 =20
@@@ -4083,12 -4062,6 +4062,6 @@@ static inline void pagetable_free(struc
  	}
  }
 =20
- static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
- {
- 	pagetable_dtor(ptdesc);
- 	pagetable_free(ptdesc);
- }
-=20
  static inline bool pagetable_pte_ctor(struct mm_struct *mm,
  				      struct ptdesc *ptdesc)
  {
@@@ -4990,8 -4963,6 +4963,6 @@@ vm_fault_t vmf_insert_pfn_prot(struct v
  			unsigned long pfn, pgprot_t pgprot);
  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long add=
r,
  			unsigned long pfn);
- vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
- 		unsigned long addr, unsigned long pfn);
  int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsign=
ed long len);
 =20
  static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,
@@@ -5344,8 -5315,7 +5315,7 @@@ static inline void print_vma_addr(char=20
  #endif
 =20
  struct page * __populate_section_memmap(unsigned long pfn,
- 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
- 		struct dev_pagemap *pgmap);
+ 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap);
  void *vmemmap_alloc_block(unsigned long size, int node);
  struct vmem_altmap;
  void *vmemmap_alloc_block_buf(unsigned long size, int node,
@@@ -5361,8 -5331,6 +5331,6 @@@ int vmemmap_populate_hugepages(unsigne
  			       int node, struct vmem_altmap *altmap);
  int vmemmap_populate(unsigned long start, unsigned long end, int node,
  		struct vmem_altmap *altmap);
- void vmemmap_wrprotect_hvo(unsigned long start, unsigned long end, int no=
de,
- 			  unsigned long headsize);
  void vmemmap_populate_print_last(void);
  #ifdef CONFIG_MEMORY_HOTPLUG
  void vmemmap_free(unsigned long start, unsigned long end,
@@@ -5395,42 -5363,6 +5363,6 @@@ static inline void vmem_altmap_free(str
  }
  #endif
 =20
- #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
- static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
- 					  struct dev_pagemap *pgmap)
- {
- 	unsigned long nr_pages;
- 	unsigned long nr_vmemmap_pages;
-=20
- 	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
- 		return false;
-=20
- 	if (!pgmap || !is_power_of_2(sizeof(struct page)))
- 		return false;
-=20
- 	nr_pages =3D pgmap_vmemmap_nr(pgmap);
- 	nr_vmemmap_pages =3D ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
- 	/*
- 	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
- 	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
- 	 */
- 	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
- }
- /*
-  * If we don't have an architecture override, use the generic rule
-  */
- #ifndef vmemmap_can_optimize
- #define vmemmap_can_optimize __vmemmap_can_optimize
- #endif
-=20
- #else
- static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
- 					   struct dev_pagemap *pgmap)
- {
- 	return false;
- }
- #endif
-=20
  enum mf_flags {
  	MF_COUNT_INCREASED =3D 1 << 0,
  	MF_ACTION_REQUIRED =3D 1 << 1,

--2NR5BjWITPMxj5J1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzcdoACgkQJNaLcl1U
h9BUEAf+KNn1QnHD7Uht9MlBeLmBj1AWAp6RAtS6rIknLh7/svmv6KPyBAARhKsg
0l1TjfkRKC38ol7Vxg/QVG0x5FJjyhvb4BDAg/5eexOKb1vULuQh7M+9E1xwx6BC
8bo00O6m1VL+WKFE5uecNjRKWtD5oYQm5XJC4clILsjbc3lpolQ684sq56UXTHLQ
nUO8FdtCoDvvB9aCj/rjZTmH6vo/t7X0VACudSHOBMDgeSO+S2ZtPSyPNVXmLoCe
IPQ5tqZQj7uD2NVBUs4SWoQ9As61siiD1yQsBW9gkyt6zQmTo1pzWerhvfmYB3Ku
Re7bSIcj2x38oDTQUZX4SCIokUZmxQ==
=lsbo
-----END PGP SIGNATURE-----

--2NR5BjWITPMxj5J1--
