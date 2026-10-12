Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73A4A0127;
	Mon, 12 Oct 2026 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820769; cv=none; b=di2h1qx5jxXMhopPL3lWNypq8Ykjh+heT00EWrp08EPgxp2XJLUEV1JGmg8MU29SQhzVy+It4sqwb7HCQupCPTz1m0AbMUlvHn3J1tUqZVkVcU+HLj7Iopk21RdmGpehHag8P79MBJMV9V5c9GVsA4RxB2ppRLhYY2ScOfrZilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820769; c=relaxed/simple;
	bh=lfXUOHb7xMr3m7ybiBhvaJOk6Cil31nNsWApdeH5Xr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QH9iEPfDNYWbPUlK6Jc0WOKJ5TG/YLVfN4rb+CXFEF7VZAljmSYPnGgOFsgOGyfBSPcrPYmtIoSbqevPUuPUspw5+yGj4zZr2ktMUxOTZ0iYcK9224fVOTU30gxXpFDbcPj3fKPepIhxlWdUx7imKnrV2l9yXomrJO2CruW6CE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rcsyjhco; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rcsyjhco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA251F0089B;
	Mon, 12 Oct 2026 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791820767;
	bh=p0Oy1xgZO7bMYO+znqJGC/z5JxJhnO2Gj6YXrYk3if0=;
	h=Date:From:To:Cc:Subject;
	b=RcsyjhcoB1ZvpnrmRxUuFJB5E+L7hXh1kVDMDXcqNmAR2W/KlRNlD58D7wSOa9G6b
	 WNAyFv087r2MFRuOrRHNTvBpxZWbU2mPaIt0RMBOM+2E9djtYaGQaRJ9iIjbP+Gcu0
	 JSJKytZeRDDph0Re9Utu2oyzy4PgW/63vw0oBl6pAdFA5/T0DuHQR5FBgAEWduiRrL
	 iQ2oT8/0BdD/pftrj1OlkYDc17zOqAIACOGCYz1jxO7t79LwYrDFfge0rsJ2Cod/tt
	 UAV/MuIYU5bXIHMKmRI6OMe/6dzdznRgX5YtquSvmZGAv+cLPPxKSscniA9xE092VA
	 tLQ6lf4m6DX2Q==
Date: Mon, 12 Oct 2026 16:59:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the mm tree
Message-ID: <as0D2sHzh_UnNF5L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XyTK6uThIuKcT8tS"
Content-Disposition: inline


--XyTK6uThIuKcT8tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/mm/init.c

between commit:

  f02f1d1437449 ("riscv/mm: fix hotplug page-table destructor handling")

=66rom the mm tree and commit:

  79113093e9dc3 ("riscv: convert pgtable_l4|l5_enabled to inline function")

=66rom the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/riscv/mm/init.c
index 6f6b04795bb23,e2b738ca90cf3..0000000000000
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@@ -6,6 -6,11 +6,11 @@@
   *  Nick Kossifidis <mick@ics.forth.gr>
   */
 =20
+ #ifdef CONFIG_64BIT
+ /* riscv_has_extension_likely() cannot be used this early */
+ #define USE_EARLY_PGTABLE_LEVELS
+ #endif
+=20
  #include <linux/init.h>
  #include <linux/mm.h>
  #include <linux/memblock.h>
@@@ -22,7 -27,6 +27,7 @@@
  #include <linux/hugetlb.h>
  #include <linux/kfence.h>
  #include <linux/execmem.h>
 +#include <linux/vmemmap-optimization.h>
 =20
  #include <asm/alternative.h>
  #include <asm/fixmap.h>
@@@ -53,10 -57,8 +58,8 @@@ u64 satp_mode __ro_after_init =3D SATP_MO
  EXPORT_SYMBOL(satp_mode);
 =20
  #ifdef CONFIG_64BIT
- bool pgtable_l4_enabled __ro_after_init =3D true;
- bool pgtable_l5_enabled __ro_after_init =3D true;
- EXPORT_SYMBOL(pgtable_l4_enabled);
- EXPORT_SYMBOL(pgtable_l5_enabled);
+ bool _pgtable_l4_enabled __ro_after_init =3D true;
+ bool _pgtable_l5_enabled __ro_after_init =3D true;
  #endif
 =20
  phys_addr_t phys_ram_base __ro_after_init;
@@@ -186,7 -188,7 +189,7 @@@ void __init arch_mm_preinit(void
  		 */
  		unsigned long size =3D
  			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
 -		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
 +		swiotlb_adjust_size(min(swiotlb_default_pool_size(), size));
  		swiotlb =3D true;
  		swiotlb_flags |=3D SWIOTLB_ANY;
  	}
@@@ -653,23 -655,23 +656,23 @@@ static void __meminit create_p4d_mappin
  }
 =20
  #define pgd_next_t		p4d_t
- #define alloc_pgd_next(__va)	(pgtable_l5_enabled ?			\
- 		pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled ?		\
+ #define alloc_pgd_next(__va)	(pgtable_l5_enabled() ?			\
+ 		pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled() ?	\
  		pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va)))
- #define get_pgd_next_virt(__pa)	(pgtable_l5_enabled ?			\
- 		pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled ?	\
+ #define get_pgd_next_virt(__pa)	(pgtable_l5_enabled() ?			\
+ 		pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled() ? \
  		pt_ops.get_pud_virt(__pa) : (pud_t *)pt_ops.get_pmd_virt(__pa)))
  #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
- 				(pgtable_l5_enabled ?			\
+ 				(pgtable_l5_enabled() ?			\
  		create_p4d_mapping(__nextp, __va, __pa, __sz, __prot) : \
- 				(pgtable_l4_enabled ?			\
+ 				(pgtable_l4_enabled() ?			\
  		create_pud_mapping((pud_t *)__nextp, __va, __pa, __sz, __prot) :	\
  		create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot)))
- #define fixmap_pgd_next		(pgtable_l5_enabled ?			\
- 		(uintptr_t)fixmap_p4d : (pgtable_l4_enabled ?		\
+ #define fixmap_pgd_next		(pgtable_l5_enabled() ?			\
+ 		(uintptr_t)fixmap_p4d : (pgtable_l4_enabled() ?		\
  		(uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd))
- #define trampoline_pgd_next	(pgtable_l5_enabled ?			\
- 		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled ?	\
+ #define trampoline_pgd_next	(pgtable_l5_enabled() ?			\
+ 		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled() ?	\
  		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd))
  #else
  #define pgd_next_t		pte_t
@@@ -714,11 -716,11 +717,11 @@@ static uintptr_t __meminit best_map_siz
  	if (debug_pagealloc_enabled())
  		return PAGE_SIZE;
 =20
- 	if (pgtable_l5_enabled &&
+ 	if (pgtable_l5_enabled() &&
  	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >=3D P4D_SI=
ZE)
  		return P4D_SIZE;
 =20
- 	if (pgtable_l4_enabled &&
+ 	if (pgtable_l4_enabled() &&
  	    !(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >=3D PUD_SI=
ZE)
  		return PUD_SIZE;
 =20
@@@ -770,14 -772,14 +773,14 @@@ u64 __pi_set_satp_mode_from_fdt(uintptr
 =20
  static void __init disable_pgtable_l5(void)
  {
- 	pgtable_l5_enabled =3D false;
+ 	_pgtable_l5_enabled =3D false;
  	kernel_map.page_offset =3D PAGE_OFFSET_L4;
  	satp_mode =3D SATP_MODE_48;
  }
 =20
  static void __init disable_pgtable_l4(void)
  {
- 	pgtable_l4_enabled =3D false;
+ 	_pgtable_l4_enabled =3D false;
  	kernel_map.page_offset =3D PAGE_OFFSET_L3;
  	satp_mode =3D SATP_MODE_39;
  }
@@@ -840,6 -842,14 +843,14 @@@ static __init void set_satp_mode(uintpt
 =20
  	kernel_map.page_offset =3D PAGE_OFFSET_L5;
 =20
+ 	/* Fall back to SV48 if RISCV_ISA_SV57 isn't enabled */
+ 	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV57) && satp_mode_limit =3D=3D 0)
+ 		satp_mode_limit =3D SATP_MODE_48;
+=20
+ 	/* Fall back to SV39 if RISCV_ISA_SV48 isn't enabled */
+ 	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV48) && satp_mode_limit =3D=3D SATP_MO=
DE_48)
+ 		satp_mode_limit =3D SATP_MODE_39;
+=20
  	if (satp_mode_limit =3D=3D SATP_MODE_48) {
  		disable_pgtable_l5();
  	} else if (satp_mode_limit =3D=3D SATP_MODE_39) {
@@@ -868,7 -878,7 +879,7 @@@ retry
 =20
  	create_pgd_mapping(early_pg_dir,
  			   set_satp_mode_pmd,
- 			   pgtable_l5_enabled ?
+ 			   pgtable_l5_enabled() ?
  				(uintptr_t)early_p4d : (uintptr_t)early_pud,
  			   PGDIR_SIZE, PAGE_TABLE);
 =20
@@@ -880,7 -890,7 +891,7 @@@
  	local_flush_tlb_all();
 =20
  	if (hw_satp !=3D identity_satp) {
- 		if (pgtable_l5_enabled) {
+ 		if (pgtable_l5_enabled()) {
  			disable_pgtable_l5();
  			memset(early_pg_dir, 0, PAGE_SIZE);
  			goto retry;
@@@ -893,6 -903,10 +904,10 @@@ out
  	memset(early_p4d, 0, PAGE_SIZE);
  	memset(early_pud, 0, PAGE_SIZE);
  	memset(early_pmd, 0, PAGE_SIZE);
+ 	if (pgtable_l4_enabled())
+ 		set_bit(RISCV_ISA_EXT_SV48, riscv_isa);
+ 	if (pgtable_l5_enabled())
+ 		set_bit(RISCV_ISA_EXT_SV57, riscv_isa);
  }
  #endif
 =20
@@@ -1121,11 -1135,11 +1136,11 @@@ asmlinkage void __init setup_vm(uintptr
 =20
  #ifndef __PAGETABLE_PMD_FOLDED
  	/* Setup fixmap P4D and PUD */
- 	if (pgtable_l5_enabled)
+ 	if (pgtable_l5_enabled())
  		create_p4d_mapping(fixmap_p4d, FIXADDR_START,
  				   (uintptr_t)fixmap_pud, P4D_SIZE, PAGE_TABLE);
  	/* Setup fixmap PUD and PMD */
- 	if (pgtable_l4_enabled)
+ 	if (pgtable_l4_enabled())
  		create_pud_mapping(fixmap_pud, FIXADDR_START,
  				   (uintptr_t)fixmap_pmd, PUD_SIZE, PAGE_TABLE);
  	create_pmd_mapping(fixmap_pmd, FIXADDR_START,
@@@ -1133,10 -1147,10 +1148,10 @@@
  	/* Setup trampoline PGD and PMD */
  	create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
  			   trampoline_pgd_next, PGDIR_SIZE, PAGE_TABLE);
- 	if (pgtable_l5_enabled)
+ 	if (pgtable_l5_enabled())
  		create_p4d_mapping(trampoline_p4d, kernel_map.virt_addr,
  				   (uintptr_t)trampoline_pud, P4D_SIZE, PAGE_TABLE);
- 	if (pgtable_l4_enabled)
+ 	if (pgtable_l4_enabled())
  		create_pud_mapping(trampoline_pud, kernel_map.virt_addr,
  				   (uintptr_t)trampoline_pmd, PUD_SIZE, PAGE_TABLE);
  	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
@@@ -1407,7 -1421,7 +1422,7 @@@ static void __init preallocate_pgd_page
  		if (!p4d)
  			goto failed;
 =20
- 		if (pgtable_l5_enabled)
+ 		if (pgtable_l5_enabled())
  			continue;
 =20
  		lvl =3D "pud";
@@@ -1415,7 -1429,7 +1430,7 @@@
  		if (!pud)
  			goto failed;
 =20
- 		if (pgtable_l4_enabled)
+ 		if (pgtable_l4_enabled())
  			continue;
 =20
  		lvl =3D "pmd";
@@@ -1486,17 -1500,10 +1501,17 @@@ struct execmem_info __init *execmem_arc
  #endif /* CONFIG_EXECMEM */
 =20
  #ifdef CONFIG_MEMORY_HOTPLUG
 +static void __meminit free_pgtable_page(struct page *page)
 +{
 +	if (PageReserved(page))
 +		free_reserved_page(page);
 +	else
 +		pagetable_free(page_ptdesc(page));
 +}
 +
  static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
  {
  	struct page *page =3D pmd_page(*pmd);
 -	struct ptdesc *ptdesc =3D page_ptdesc(page);
  	pte_t *pte;
  	int i;
 =20
@@@ -1506,13 -1513,18 +1521,13 @@@
  			return;
  	}
 =20
 -	pagetable_dtor(ptdesc);
 -	if (PageReserved(page))
 -		free_reserved_page(page);
 -	else
 -		pagetable_free(ptdesc);
 +	free_pgtable_page(page);
  	pmd_clear(pmd);
  }
 =20
 -static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool i=
s_vmemmap)
 +static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
  {
  	struct page *page =3D pud_page(*pud);
 -	struct ptdesc *ptdesc =3D page_ptdesc(page);
  	pmd_t *pmd;
  	int i;
 =20
@@@ -1522,7 -1534,12 +1537,7 @@@
  			return;
  	}
 =20
 -	if (!is_vmemmap)
 -		pagetable_dtor(ptdesc);
 -	if (PageReserved(page))
 -		free_reserved_page(page);
 -	else
 -		pagetable_free(ptdesc);
 +	free_pgtable_page(page);
  	pud_clear(pud);
  }
 =20
@@@ -1538,7 -1555,10 +1553,7 @@@ static void __meminit free_pud_table(pu
  			return;
  	}
 =20
 -	if (PageReserved(page))
 -		free_reserved_page(page);
 -	else
 -		__free_pages(page, 0);
 +	free_pgtable_page(page);
  	p4d_clear(p4d);
  }
 =20
@@@ -1621,13 -1641,13 +1636,13 @@@ static void __meminit remove_pud_mappin
 =20
  	for (; addr < end; addr =3D next) {
  		next =3D pud_addr_end(addr, end);
- 		pudp =3D pgtable_l4_enabled ? pud_base + pud_index(addr) : pud_base;
+ 		pudp =3D pgtable_l4_enabled() ? pud_base + pud_index(addr) : pud_base;
  		pud =3D pudp_get(pudp);
  		if (!pud_present(pud))
  			continue;
 =20
  		if (pud_leaf(pud)) {
- 			if (pgtable_l4_enabled) {
+ 			if (pgtable_l4_enabled()) {
  				pud_clear(pudp);
  				if (is_vmemmap)
  					free_vmemmap_storage(pud_page(pud), PUD_SIZE, altmap);
@@@ -1638,8 -1658,8 +1653,8 @@@
  		pmd_base =3D pmd_offset(pudp, 0);
  		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 =20
- 		if (pgtable_l4_enabled)
- 			free_pmd_table(pmd_base, pudp);
+ 		if (pgtable_l4_enabled())
+ 			free_pmd_table(pmd_base, pudp, is_vmemmap);
  	}
  }
 =20
@@@ -1652,13 -1672,13 +1667,13 @@@ static void __meminit remove_p4d_mappin
 =20
  	for (; addr < end; addr =3D next) {
  		next =3D p4d_addr_end(addr, end);
- 		p4dp =3D pgtable_l5_enabled ? p4d_base + p4d_index(addr) : p4d_base;
+ 		p4dp =3D pgtable_l5_enabled() ? p4d_base + p4d_index(addr) : p4d_base;
  		p4d =3D p4dp_get(p4dp);
  		if (!p4d_present(p4d))
  			continue;
 =20
  		if (p4d_leaf(p4d)) {
- 			if (pgtable_l5_enabled) {
+ 			if (pgtable_l5_enabled()) {
  				p4d_clear(p4dp);
  				if (is_vmemmap)
  					free_vmemmap_storage(p4d_page(p4d), P4D_SIZE, altmap);
@@@ -1669,7 -1689,7 +1684,7 @@@
  		pud_base =3D pud_offset(p4dp, 0);
  		remove_pud_mapping(pud_base, addr, next, is_vmemmap, altmap);
 =20
- 		if (pgtable_l5_enabled)
+ 		if (pgtable_l5_enabled())
  			free_pud_table(pud_base, p4dp);
  	}
  }

--XyTK6uThIuKcT8tS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNA9kACgkQJNaLcl1U
h9Cokwf/XGxeek8Pjpb5ljbeysmSmetay24qxxEE0DZr+uYGRqa1gP01PBY/ibOh
ZPj+JRddvmIBKJ8O8qxNNS8hzociy6RhMI4kW7CgtqYDRJxwtrMX22xqEYcu40dJ
Y/Ol/Emn+jTk6eECtrie+rt/Rv6rMrgkLLotypIdAVOwPPeGs/VjLSgAodxyNi9H
nCJkl0Q0k7vOnKwRUtMtpgkTNMeIgWm/gYJ9X/pAniQoB2z2VGg+L1Lsg107thpF
7Z1AHePyt/MQT6uuC773zZa9W+9lUYwEgCYYvSfbaRXdSVxUHHlyobeLYUrJMNa+
ToRy36Wbh0Fo/NlQHqxVlJmCIfVgvQ==
=NDh/
-----END PGP SIGNATURE-----

--XyTK6uThIuKcT8tS--
