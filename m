Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD141D63F;
	Fri,  2 Oct 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945666; cv=none; b=daIY10XafNPhpcQaYcgRupBXbo4QN84tfAnb/biAvxlTBwf+4z3oxnBD+rORspNPSdECaicHNX8K8lPcNDffAyWfGiRt9V8U7EEE3LcbGr5PVJBJv3gavyo6aSTgtDddh8h1vBRFOMol5lXE/jFXWMAQrliaDW0mgV4j4GnG3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945666; c=relaxed/simple;
	bh=WB96WmKm+NMmOjdHLHmeCRUa8A6hvxXdFVlh4Mod/7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6arEEOW5dZEdr1NsSjkw8blnFcDnPT/y2GYopkledkIdi8o+xxJySwkdUq4Hgriblr6Ua6YT81NrogJsuYiAp+Ei1EHE9IkfPKl0k9SlI/SCWSGrbQs913J4oBq9fhDtiN92DKGZUYSARX+x/WitqHixS2NfvPRzpq8Pu2Sqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3v7buVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3v7buVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911081F000FF;
	Fri,  2 Oct 2026 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945663;
	bh=vOmmnEPRYaGFxOqxvBLDIKm79Lo86N5+y0qGyrtsz1E=;
	h=Date:From:To:Cc:Subject;
	b=J3v7buVLTC8sUVENQQFo3b/Rusf+z0Qey0SJgHMGUFpm4t4bEV4Pn5Rmgw2zzcLyA
	 I+gWgDue+WGt+a3DuPWc+gjMKBvaCAuXPs2w8hBHVxM50vR9rz0p2L+/CDvO/dEEIO
	 MmxRGGqKDilbOqOSRuNhsV8EtYKMUdTyKJjJzLPJSS+5KmNWHAt7hL9GDUrIP2J4+q
	 N3DSs+2opnSFgrvSxUr19hqn/ZXbC/G5ouoVmapXG+SabFn/RgyWN0gcJP9KXvaJ/D
	 Fu61ysnD4T4umacD/CP7IdyIr2raKxkisjYEuVi1EqvRE4jENkwP7oNGHIf6ePewnT
	 wEaD5qrVXYHHQ==
Date: Fri, 2 Oct 2026 13:54:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Yan Zhao <yan.y.zhao@intel.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm-arm tree
Message-ID: <ar-pennfcwC9B70R@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JMv/ldqycKmN/82L"
Content-Disposition: inline


--JMv/ldqycKmN/82L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/arm64/kvm/mmu.c

between commit:

  80b0b86dc5e43 ("KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()")

=66rom the kvm-arm tree and commit:

  89fbe3de01ccf ("KVM: guest_memfd: Stop returning struct page from PFN loo=
kup")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/arm64/kvm/mmu.c
index 85745d13c08e0,df48df8d89800..0000000000000
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@@ -5,10 -5,8 +5,10 @@@
   */
 =20
  #include <linux/acpi.h>
 +#include <linux/cleanup.h>
  #include <linux/mman.h>
  #include <linux/kvm_host.h>
 +#include <linux/interval_tree.h>
  #include <linux/io.h>
  #include <linux/hugetlb.h>
  #include <linux/sched/signal.h>
@@@ -324,19 -322,6 +324,19 @@@ static void invalidate_icache_guest_pag
   * we then fully enforce cacheability of RAM, no matter what the guest
   * does.
   */
 +
 +static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 =
addr, u64 size)
 +{
 +	int ret;
 +
 +	ret =3D kvm_pgtable_stage2_unmap(pgt, addr, size);
 +	if (ret)
 +		return ret;
 +
 +	kvm_remove_guest_s2_mappings(pgt->mmu, addr, size);
 +	return 0;
 +}
 +
  /**
   * __unmap_stage2_range -- Clear stage2 page table entries to unmap a ran=
ge
   * @mmu:   The KVM stage-2 MMU pointer
@@@ -354,17 -339,11 +354,17 @@@ static void __unmap_stage2_range(struc
  {
  	struct kvm *kvm =3D kvm_s2_mmu_to_kvm(mmu);
  	phys_addr_t end =3D start + size;
 +	int (*fn)(struct kvm_pgtable *, u64, u64);
 =20
  	lockdep_assert_held_write(&kvm->mmu_lock);
  	WARN_ON(size & ~PAGE_MASK);
 -	WARN_ON(stage2_apply_range(mmu, start, end, KVM_PGT_FN(kvm_pgtable_stage=
2_unmap),
 -				   may_block));
 +
 +	if (kvm_is_nested_s2_mmu(kvm, mmu))
 +		fn =3D kvm_pgtable_stage2_unmap_tracked;
 +	else
 +		fn =3D KVM_PGT_FN(kvm_pgtable_stage2_unmap);
 +
 +	WARN_ON(stage2_apply_range(mmu, start, end, fn, may_block));
  }
 =20
  void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
@@@ -896,7 -875,7 +896,7 @@@ static int get_user_mapping_size(struc
  	 * IPI-ing threads).
  	 */
  	local_irq_save(flags);
 -	ret =3D kvm_pgtable_get_leaf(&pgt, addr, &pte, &level);
 +	ret =3D kvm_pgtable_get_leaf(&pgt, addr, &pte, &level, 0);
  	local_irq_restore(flags);
 =20
  	if (ret)
@@@ -1063,8 -1042,6 +1063,8 @@@ int kvm_init_stage2_mmu(struct kvm *kvm
 =20
  	mmu->pgd_phys =3D __pa(pgt->pgd);
 =20
 +	mmu->guest_s2_mappings =3D RB_ROOT_CACHED;
 +
  	if (kvm_is_nested_s2_mmu(kvm, mmu))
  		kvm_init_nested_s2_mmu(mmu);
 =20
@@@ -1154,25 -1131,10 +1154,25 @@@ void stage2_unmap_vm(struct kvm *kvm
  	srcu_read_unlock(&kvm->srcu, idx);
  }
 =20
 +static void guest_s2_tracking_destroy(struct rb_root_cached *tree)
 +{
 +	struct kvm_guest_s2_mapping *mapping;
 +	struct interval_tree_node *node;
 +
 +	while ((node =3D interval_tree_iter_first(tree, 0, ULONG_MAX))) {
 +		interval_tree_remove(node, tree);
 +		mapping =3D container_of(node, struct kvm_guest_s2_mapping,
 +				       canonical);
 +		kfree(mapping);
 +		cond_resched();
 +	}
 +}
 +
  void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
  {
  	struct kvm *kvm =3D kvm_s2_mmu_to_kvm(mmu);
  	struct kvm_pgtable *pgt =3D NULL;
 +	struct rb_root_cached mappings_tree;
 =20
  	write_lock(&kvm->mmu_lock);
  	pgt =3D mmu->pgt;
@@@ -1185,18 -1147,12 +1185,18 @@@
  	if (kvm_is_nested_s2_mmu(kvm, mmu))
  		kvm_init_nested_s2_mmu(mmu);
 =20
 +	mappings_tree =3D mmu->guest_s2_mappings;
 +	mmu->guest_s2_mappings =3D RB_ROOT_CACHED;
 +
  	write_unlock(&kvm->mmu_lock);
 =20
  	if (pgt) {
  		kvm_stage2_destroy(pgt);
  		kfree(pgt);
  	}
 +
 +	if (!kvm_is_nested_s2_mmu(kvm, mmu))
 +		guest_s2_tracking_destroy(&mappings_tree);
  }
 =20
  static void hyp_mc_free_fn(void *addr, void *mc)
@@@ -1406,53 -1362,21 +1406,53 @@@ static void kvm_send_hwpoison_signal(un
  	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
  }
 =20
 -static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *me=
mslot,
 -					       unsigned long hva,
 +struct kvm_s2_fault_desc {
 +	struct kvm_vcpu		*vcpu;
 +	phys_addr_t		fault_ipa;
 +	struct kvm_s2_trans	*nested;
 +	struct kvm_memory_slot	*memslot;
 +	unsigned long		hva;
 +	unsigned long		esr;
 +	struct kvm_s2_mmu	*mmu;
 +};
 +
 +struct kvm_s2_fault_vma_info {
 +	unsigned long	mmu_seq;
 +	long		vma_pagesize;
 +	vm_flags_t	vm_flags;
 +	unsigned long	max_map_size;
 +	struct page	*page;
 +	kvm_pfn_t	pfn;
 +	gfn_t		gfn;
 +	bool		device;
 +	bool		mte_allowed;
 +	bool		is_vma_cacheable;
 +	bool		map_writable;
 +	bool		map_non_cacheable;
 +};
 +
 +struct kvm_s2_fault_result {
 +	unsigned long mapping_size;
 +};
 +
 +static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_=
desc *s2fd,
  					       unsigned long map_size)
  {
 -	gpa_t gpa_start;
 +	struct kvm_memory_slot *memslot =3D s2fd->memslot;
 +	unsigned long hva =3D s2fd->hva;
  	hva_t uaddr_start, uaddr_end;
 +	gpa_t gpa_start;
  	size_t size;
 =20
  	/* The memslot and the VMA are guaranteed to be aligned to PAGE_SIZE */
  	if (map_size =3D=3D PAGE_SIZE)
  		return true;
 =20
 -	/* pKVM only supports PMD_SIZE huge-mappings */
 -	if (is_protected_kvm_enabled() && map_size !=3D PMD_SIZE)
 -		return false;
 +	/* pKVM only supports PMD_SIZE huge-mappings for non-protected VMs */
 +	if (is_protected_kvm_enabled()) {
 +		if (vcpu_is_protected(s2fd->vcpu) || map_size !=3D PMD_SIZE)
 +			return false;
 +	}
 =20
  	size =3D memslot->npages * PAGE_SIZE;
 =20
@@@ -1512,9 -1436,9 +1512,9 @@@
   * Returns the size of the mapping.
   */
  static long
 -transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *mems=
lot,
 -			    unsigned long hva, kvm_pfn_t *pfnp, gfn_t *gfnp)
 +transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn=
_t *pfnp, gfn_t *gfnp)
  {
 +	struct kvm *kvm =3D s2fd->vcpu->kvm;
  	kvm_pfn_t pfn =3D *pfnp;
  	gfn_t gfn =3D *gfnp;
 =20
@@@ -1523,8 -1447,8 +1523,8 @@@
  	 * sure that the HVA and IPA are sufficiently aligned and that the
  	 * block map is contained within the memslot.
  	 */
 -	if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
 -		int sz =3D get_user_mapping_size(kvm, hva);
 +	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
 +		int sz =3D get_user_mapping_size(kvm, s2fd->hva);
 =20
  		if (sz < 0)
  			return sz;
@@@ -1544,11 -1468,32 +1544,11 @@@
  	return PAGE_SIZE;
  }
 =20
 -static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long h=
va)
 +static int get_vma_page_shift(struct vm_area_struct *vma)
  {
 -	unsigned long pa;
 -
 -	if (is_vm_hugetlb_page(vma) && !(vma->vm_flags & VM_PFNMAP))
 +	if (vma_is_hugetlb(vma))
  		return huge_page_shift(hstate_vma(vma));
 =20
 -	if (!(vma->vm_flags & VM_PFNMAP))
 -		return PAGE_SHIFT;
 -
 -	VM_BUG_ON(is_vm_hugetlb_page(vma));
 -
 -	pa =3D (vma->vm_pgoff << PAGE_SHIFT) + (hva - vma->vm_start);
 -
 -#ifndef __PAGETABLE_PMD_FOLDED
 -	if ((hva & (PUD_SIZE - 1)) =3D=3D (pa & (PUD_SIZE - 1)) &&
 -	    ALIGN_DOWN(hva, PUD_SIZE) >=3D vma->vm_start &&
 -	    ALIGN(hva, PUD_SIZE) <=3D vma->vm_end)
 -		return PUD_SHIFT;
 -#endif
 -
 -	if ((hva & (PMD_SIZE - 1)) =3D=3D (pa & (PMD_SIZE - 1)) &&
 -	    ALIGN_DOWN(hva, PMD_SIZE) >=3D vma->vm_start &&
 -	    ALIGN(hva, PMD_SIZE) <=3D vma->vm_end)
 -		return PMD_SHIFT;
 -
  	return PAGE_SHIFT;
  }
 =20
@@@ -1618,9 -1563,9 +1618,9 @@@ static void *get_mmu_memcache(struct kv
  		return &vcpu->arch.pkvm_memcache;
  }
 =20
 -static int topup_mmu_memcache(struct kvm_vcpu *vcpu, void *memcache)
 +static int topup_mmu_memcache(struct kvm_s2_mmu *mmu, void *memcache)
  {
 -	int min_pages =3D kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
 +	int min_pages =3D kvm_mmu_cache_min_pages(mmu);
 =20
  	if (!is_protected_kvm_enabled())
  		return kvm_mmu_topup_memory_cache(memcache, min_pages);
@@@ -1661,85 -1606,54 +1661,85 @@@ static enum kvm_pgtable_prot adjust_nes
  	return prot;
  }
 =20
 -struct kvm_s2_fault_desc {
 -	struct kvm_vcpu		*vcpu;
 -	phys_addr_t		fault_ipa;
 -	struct kvm_s2_trans	*nested;
 -	struct kvm_memory_slot	*memslot;
 -	unsigned long		hva;
 -};
 +static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 +{
 +	return esr_fsc_is_permission_fault(s2fd->esr);
 +}
 =20
 -static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 +static bool kvm_s2_fault_is_exec(const struct kvm_s2_fault_desc *s2fd)
 +{
 +	return esr_abt_is_exec_fault(s2fd->esr);
 +}
 +
 +static bool kvm_s2_fault_is_write(const struct kvm_s2_fault_desc *s2fd)
 +{
 +	return esr_abt_is_write_fault(s2fd->esr);
 +}
 +
 +static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
 +{
 +	u64 level;
 +
 +	if (!kvm_s2_fault_is_perm(s2fd))
 +		return 0;
 +	level =3D s2fd->esr & ESR_ELx_FSC_LEVEL;
 +	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
 +}
 +
 +static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
 +				     struct kvm_s2_fault_vma_info *s2vi);
 +
 +static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
 +			       const struct kvm_s2_fault_vma_info *s2vi);
 +
 +static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
 +		      struct kvm_s2_fault_result *result)
  {
  	bool write_fault, exec_fault;
 -	bool perm_fault =3D kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 +	bool perm_fault =3D kvm_s2_fault_is_perm(s2fd);
  	enum kvm_pgtable_walk_flags flags =3D KVM_PGTABLE_WALK_SHARED;
  	enum kvm_pgtable_prot prot =3D KVM_PGTABLE_PROT_R;
 -	struct kvm_pgtable *pgt =3D s2fd->vcpu->arch.hw_mmu->pgt;
 -	unsigned long mmu_seq;
 +	struct kvm_pgtable *pgt =3D s2fd->mmu->pgt;
 +	struct kvm_guest_s2_mapping *mapping =3D NULL;
 +	struct kvm_s2_fault_vma_info s2vi =3D {};
  	struct kvm *kvm =3D s2fd->vcpu->kvm;
  	void *memcache =3D NULL;
 -	kvm_pfn_t pfn;
 -	gfn_t gfn;
 +	gfn_t canonical_gfn;
  	int ret;
 =20
  	if (!perm_fault) {
  		memcache =3D get_mmu_memcache(s2fd->vcpu);
 -		ret =3D topup_mmu_memcache(s2fd->vcpu, memcache);
 +		ret =3D topup_mmu_memcache(s2fd->mmu, memcache);
  		if (ret)
  			return ret;
 +		if (kvm_is_nested_s2_mmu(kvm, pgt->mmu)) {
 +			mapping =3D kmalloc_obj(struct kvm_guest_s2_mapping, GFP_KERNEL_ACCOUN=
T);
 +			if (!mapping)
 +				return -ENOMEM;
 +		}
  	}
 =20
 -	if (s2fd->nested)
 -		gfn =3D kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
 -	else
 -		gfn =3D s2fd->fault_ipa >> PAGE_SHIFT;
 +	s2vi.vma_pagesize =3D PAGE_SIZE;
 +	s2vi.gfn =3D ALIGN_DOWN(s2fd->fault_ipa, s2vi.vma_pagesize) >> PAGE_SHIF=
T;
 +	canonical_gfn =3D get_canonical_gfn(s2fd, &s2vi);
 =20
 -	write_fault =3D kvm_is_write_fault(s2fd->vcpu);
 -	exec_fault =3D kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
 +	write_fault =3D kvm_s2_fault_is_write(s2fd);
 +	exec_fault =3D kvm_s2_fault_is_exec(s2fd);
 =20
  	VM_WARN_ON_ONCE(write_fault && exec_fault);
 =20
 -	mmu_seq =3D kvm->mmu_invalidate_seq;
 +	s2vi.mmu_seq =3D kvm->mmu_invalidate_seq;
  	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
  	smp_rmb();
 =20
- 	ret =3D kvm_gmem_get_pfn(kvm, s2fd->memslot, canonical_gfn, &s2vi.pfn, &=
s2vi.page, NULL);
 -	ret =3D kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, NULL);
++	ret =3D kvm_gmem_get_pfn(kvm, s2fd->memslot, canonical_gfn, &s2vi.pfn, N=
ULL);
  	if (ret) {
 -		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
 -					      write_fault, exec_fault, false);
 -		return ret;
 +		/* If result is non-NULL this is a synthetic fault. */
 +		if (!result)
 +			kvm_prepare_memory_fault_exit(s2fd->vcpu, gfn_to_gpa(canonical_gfn),
 +						      s2vi.vma_pagesize, write_fault, exec_fault,
 +						      false);
 +		kfree(mapping);
  	}
 =20
  	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
@@@ -1755,7 -1669,7 +1755,7 @@@
  		prot =3D adjust_nested_exec_perms(kvm, s2fd->nested, prot);
 =20
  	kvm_fault_lock(kvm);
 -	if (mmu_invalidate_retry(kvm, mmu_seq)) {
 +	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
  		ret =3D -EAGAIN;
  		goto out_unlock;
  	}
@@@ -1766,68 -1680,60 +1766,67 @@@
  		 * PTE, which will be preserved.
  		 */
  		prot &=3D ~KVM_NV_GUEST_MAP_SZ;
 -		ret =3D KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
 +		ret =3D KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(s2vi=
=2Egfn),
  								 prot, flags);
  	} else {
 -		ret =3D KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_S=
IZE,
 -							 __pfn_to_phys(pfn), prot,
 +		ret =3D KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(s2vi.gfn),
 +							 s2vi.vma_pagesize,
 +							 __pfn_to_phys(s2vi.pfn), prot,
  							 memcache, flags);
 +		/*
 +		 * -EAGAIN from kvm_pgtable_stage2_map() can install mappings.
 +		 * We don't know which subrange is installed, track the whole
 +		 * thing.
 +		 */
 +		if ((ret =3D=3D 0 || ret =3D=3D -EAGAIN) && kvm_is_nested_s2_mmu(kvm, p=
gt->mmu)) {
 +			kvm_record_guest_s2_mapping(pgt->mmu, canonical_gfn << PAGE_SHIFT,
 +						    s2fd->fault_ipa, s2vi.vma_pagesize, mapping);
 +			mapping =3D NULL;
 +		}
  	}
 =20
  out_unlock:
- 	kvm_release_faultin_page(kvm, s2vi.page, !!ret, prot & KVM_PGTABLE_PROT_=
W);
  	kvm_fault_unlock(kvm);
 +	kfree(mapping);
 =20
  	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
 -		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
 +		mark_page_dirty_in_slot(kvm, s2fd->memslot, canonical_gfn);
 =20
 -	return ret !=3D -EAGAIN ? ret : 0;
 +	if (ret =3D=3D -EAGAIN)
 +		return result ? ret : 0;
 +
 +	if (result && !ret)
 +		result->mapping_size =3D s2vi.vma_pagesize;
 +
 +	return ret;
  }
 =20
 -struct kvm_s2_fault_vma_info {
 -	unsigned long	mmu_seq;
 -	long		vma_pagesize;
 -	vm_flags_t	vm_flags;
 -	unsigned long	max_map_size;
 -	struct page	*page;
 -	kvm_pfn_t	pfn;
 -	gfn_t		gfn;
 -	bool		device;
 -	bool		mte_allowed;
 -	bool		is_vma_cacheable;
 -	bool		map_writable;
 -	bool		map_non_cacheable;
 -};
 -
  static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
  {
  	unsigned int flags =3D FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 +	struct kvm_s2_fault_vma_info s2vi =3D {};
  	struct kvm_vcpu *vcpu =3D s2fd->vcpu;
 -	struct kvm_pgtable *pgt =3D vcpu->arch.hw_mmu->pgt;
 +	struct kvm_pgtable *pgt =3D s2fd->mmu->pgt;
  	struct mm_struct *mm =3D current->mm;
  	struct kvm *kvm =3D vcpu->kvm;
  	void *hyp_memcache;
 -	struct page *page;
  	int ret;
 =20
  	hyp_memcache =3D get_mmu_memcache(vcpu);
 -	ret =3D topup_mmu_memcache(vcpu, hyp_memcache);
 +	ret =3D topup_mmu_memcache(s2fd->mmu, hyp_memcache);
  	if (ret)
  		return -ENOMEM;
 =20
 +	ret =3D kvm_s2_fault_get_vma_info(s2fd, &s2vi);
 +	if (ret)
 +		return ret;
 +
  	ret =3D account_locked_vm(mm, 1, true);
  	if (ret)
  		return ret;
 =20
  	mmap_read_lock(mm);
 -	ret =3D pin_user_pages(s2fd->hva, 1, flags, &page);
 +	ret =3D pin_user_pages(s2fd->hva, 1, flags, &s2vi.page);
  	mmap_read_unlock(mm);
 =20
  	if (ret =3D=3D -EHWPOISON) {
@@@ -1837,7 -1743,7 +1836,7 @@@
  	} else if (ret !=3D 1) {
  		ret =3D -EFAULT;
  		goto dec_account;
 -	} else if (!folio_test_swapbacked(page_folio(page))) {
 +	} else if (!folio_test_swapbacked(page_folio(s2vi.page))) {
  		/*
  		 * We really can't deal with page-cache pages returned by GUP
  		 * because (a) we may trigger writeback of a page for which we
@@@ -1857,8 -1763,8 +1856,8 @@@
  	}
 =20
  	write_lock(&kvm->mmu_lock);
 -	ret =3D pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
 -				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
 +	ret =3D pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), PAGE_SIZE,
 +				      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
  				      hyp_memcache, 0);
  	write_unlock(&kvm->mmu_lock);
  	if (ret) {
@@@ -1869,7 -1775,7 +1868,7 @@@
 =20
  	return 0;
  unpin:
 -	unpin_user_pages(&page, 1);
 +	unpin_user_page(s2vi.page);
  dec_account:
  	account_locked_vm(mm, 1, false);
  	return ret;
@@@ -1886,13 -1792,13 +1885,13 @@@ static short kvm_s2_resolve_vma_size(co
  		vma_shift =3D PAGE_SHIFT;
  	} else {
  		s2vi->max_map_size =3D PUD_SIZE;
 -		vma_shift =3D get_vma_page_shift(vma, s2fd->hva);
 +		vma_shift =3D get_vma_page_shift(vma);
  	}
 =20
  	switch (vma_shift) {
  #ifndef __PAGETABLE_PMD_FOLDED
  	case PUD_SHIFT:
 -		if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PUD_SI=
ZE))
 +		if (fault_supports_stage2_huge_mapping(s2fd, PUD_SIZE))
  			break;
  		fallthrough;
  #endif
@@@ -1900,7 -1806,7 +1899,7 @@@
  		vma_shift =3D PMD_SHIFT;
  		fallthrough;
  	case PMD_SHIFT:
 -		if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PMD_SI=
ZE))
 +		if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
  			break;
  		fallthrough;
  	case CONT_PTE_SHIFT:
@@@ -1941,6 -1847,11 +1940,6 @@@
  	return vma_shift;
  }
 =20
 -static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 -{
 -	return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 -}
 -
  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
  				     struct kvm_s2_fault_vma_info *s2vi)
  {
@@@ -2006,11 -1917,13 +2005,11 @@@ static int kvm_s2_fault_pin_pfn(const s
  		return ret;
 =20
  	s2vi->pfn =3D __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s=
2vi),
 -				      kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
 +				      kvm_s2_fault_is_write(s2fd) ? FOLL_WRITE : 0,
  				      &s2vi->map_writable, &s2vi->page);
  	if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
 -		if (s2vi->pfn =3D=3D KVM_PFN_ERR_HWPOISON) {
 -			kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
 -			return 0;
 -		}
 +		if (s2vi->pfn =3D=3D KVM_PFN_ERR_HWPOISON)
 +			return -EHWPOISON;
  		return -EFAULT;
  	}
 =20
@@@ -2037,6 -1950,16 +2036,6 @@@
  				return -EFAULT;
  			}
  		} else {
 -			/*
 -			 * If the page was identified as device early by looking at
 -			 * the VMA flags, vma_pagesize is already representing the
 -			 * largest quantity we can map.  If instead it was mapped
 -			 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
 -			 * and must not be upgraded.
 -			 *
 -			 * In both cases, we don't let transparent_hugepage_adjust()
 -			 * change things at the last minute.
 -			 */
  			s2vi->map_non_cacheable =3D true;
  		}
 =20
@@@ -2052,7 -1975,7 +2051,7 @@@ static int kvm_s2_fault_compute_prot(co
  {
  	struct kvm *kvm =3D s2fd->vcpu->kvm;
 =20
 -	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && s2vi->map_non_cacheable)
 +	if (kvm_s2_fault_is_exec(s2fd) && s2vi->map_non_cacheable)
  		return -ENOEXEC;
 =20
  	/*
@@@ -2061,7 -1984,7 +2060,7 @@@
  	 * and trigger the exception here. Since the memslot is valid, inject
  	 * the fault back to the guest.
  	 */
 -	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(s2fd->vcpu))) {
 +	if (esr_fsc_is_excl_atomic_fault(s2fd->esr)) {
  		kvm_inject_dabt_excl_atomic(s2fd->vcpu, kvm_vcpu_get_hfar(s2fd->vcpu));
  		return 1;
  	}
@@@ -2070,13 -1993,13 +2069,13 @@@
 =20
  	if (s2vi->map_writable && (s2vi->device ||
  				   !memslot_is_logging(s2fd->memslot) ||
 -				   kvm_is_write_fault(s2fd->vcpu)))
 +				   kvm_s2_fault_is_write(s2fd)))
  		*prot |=3D KVM_PGTABLE_PROT_W;
 =20
  	if (s2fd->nested)
  		*prot =3D adjust_nested_fault_perms(s2fd->nested, *prot);
 =20
 -	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
 +	if (kvm_s2_fault_is_exec(s2fd))
  		*prot |=3D KVM_PGTABLE_PROT_X;
 =20
  	if (s2vi->map_non_cacheable)
@@@ -2100,14 -2023,11 +2099,14 @@@
  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
  			    const struct kvm_s2_fault_vma_info *s2vi,
  			    enum kvm_pgtable_prot prot,
 -			    void *memcache)
 +			    void *memcache,
 +			    struct kvm_s2_fault_result *result)
  {
  	enum kvm_pgtable_walk_flags flags =3D KVM_PGTABLE_WALK_SHARED;
 +	struct kvm_guest_s2_mapping *mapping =3D NULL;
  	bool writable =3D prot & KVM_PGTABLE_PROT_W;
  	struct kvm *kvm =3D s2fd->vcpu->kvm;
 +	phys_addr_t canonical_ipa;
  	struct kvm_pgtable *pgt;
  	long perm_fault_granule;
  	long mapping_size;
@@@ -2115,43 -2035,35 +2114,43 @@@
  	gfn_t gfn;
  	int ret;
 =20
 +	if (kvm_is_nested_s2_mmu(kvm, s2fd->mmu)) {
 +		mapping =3D kmalloc_obj(struct kvm_guest_s2_mapping,
 +				      GFP_KERNEL_ACCOUNT);
 +		if (!mapping) {
 +			kvm_release_page_unused(s2vi->page);
 +			return -ENOMEM;
 +		}
 +	}
 +
  	kvm_fault_lock(kvm);
 -	pgt =3D s2fd->vcpu->arch.hw_mmu->pgt;
 +	pgt =3D s2fd->mmu->pgt;
  	ret =3D -EAGAIN;
  	if (mmu_invalidate_retry(kvm, s2vi->mmu_seq))
  		goto out_unlock;
 =20
 -	perm_fault_granule =3D (kvm_s2_fault_is_perm(s2fd) ?
 -			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
 +	perm_fault_granule =3D kvm_s2_perm_fault_granule(s2fd);
  	mapping_size =3D s2vi->vma_pagesize;
  	pfn =3D s2vi->pfn;
  	gfn =3D s2vi->gfn;
 +	canonical_ipa =3D gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 =20
  	/*
  	 * If we are not forced to use page mapping, check if we are
 -	 * backed by a THP and thus use block mapping if possible.
 +	 * backed by a huge stage-1 mapping and thus use block mapping if
 +	 * possible.
  	 */
 -	if (mapping_size =3D=3D PAGE_SIZE &&
 -	    !(s2vi->max_map_size =3D=3D PAGE_SIZE || s2vi->map_non_cacheable)) {
 +	if (mapping_size =3D=3D PAGE_SIZE && s2vi->max_map_size !=3D PAGE_SIZE) {
  		if (perm_fault_granule > PAGE_SIZE) {
  			mapping_size =3D perm_fault_granule;
  		} else {
 -			mapping_size =3D transparent_hugepage_adjust(kvm, s2fd->memslot,
 -								   s2fd->hva, &pfn,
 -								   &gfn);
 +			mapping_size =3D transparent_hugepage_adjust(s2fd, &pfn, &gfn);
  			if (mapping_size < 0) {
  				ret =3D mapping_size;
  				goto out_unlock;
  			}
  		}
 +		canonical_ipa =3D ALIGN_DOWN(canonical_ipa, mapping_size);
  	}
 =20
  	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
@@@ -2174,45 -2086,31 +2173,45 @@@
  		ret =3D KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mappin=
g_size,
  							 __pfn_to_phys(pfn), prot,
  							 memcache, flags);
 +		/*
 +		 * -EAGAIN from kvm_pgtable_stage2_map() can install mappings.
 +		 * We don't know which subrange is installed, track the whole
 +		 * thing.
 +		 */
 +		if ((ret =3D=3D 0 || ret =3D=3D -EAGAIN) && kvm_is_nested_s2_mmu(kvm, p=
gt->mmu)) {
 +			kvm_record_guest_s2_mapping(pgt->mmu, canonical_ipa,
 +						    gfn_to_gpa(gfn), mapping_size, mapping);
 +			mapping =3D NULL;
 +		}
  	}
 =20
  out_unlock:
  	kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
  	kvm_fault_unlock(kvm);
 +	kfree(mapping);
 =20
  	/*
  	 * Mark the page dirty only if the fault is handled successfully,
  	 * making sure we adjust the canonical IPA if the mapping size has
  	 * been updated (via a THP upgrade, for example).
  	 */
 -	if (writable && !ret) {
 -		phys_addr_t ipa =3D gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 -		ipa &=3D ~(mapping_size - 1);
 -		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
 -	}
 +	if (writable && !ret)
 +		mark_page_dirty_in_slot(kvm, s2fd->memslot,
 +					gpa_to_gfn(canonical_ipa));
 =20
 -	if (ret !=3D -EAGAIN)
 -		return ret;
 -	return 0;
 +	if (ret =3D=3D -EAGAIN)
 +		return result ? ret : 0;
 +
 +	if (result && !ret)
 +		result->mapping_size =3D mapping_size;
 +
 +	return ret;
  }
 =20
 -static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 +static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
 +			  struct kvm_s2_fault_result *result)
  {
 -	bool perm_fault =3D kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 +	bool perm_fault =3D kvm_s2_fault_is_perm(s2fd);
  	struct kvm_s2_fault_vma_info s2vi =3D {};
  	enum kvm_pgtable_prot prot;
  	void *memcache;
@@@ -2230,19 -2128,16 +2229,19 @@@
  	memcache =3D get_mmu_memcache(s2fd->vcpu);
  	if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
  	    is_protected_kvm_enabled()) {
 -		ret =3D topup_mmu_memcache(s2fd->vcpu, memcache);
 +		ret =3D topup_mmu_memcache(s2fd->mmu, memcache);
  		if (ret)
  			return ret;
  	}
 =20
 -	/*
 -	 * Let's check if we will get back a huge page backed by hugetlbfs, or
 -	 * get block mapping for device MMIO region.
 -	 */
  	ret =3D kvm_s2_fault_pin_pfn(s2fd, &s2vi);
 +	if (ret =3D=3D -EHWPOISON) {
 +		/* If result is specified, let the caller handle this. */
 +		if (result)
 +			return -EHWPOISON;
 +		kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi.vma_pagesize));
 +		return 0;
 +	}
  	if (ret !=3D 1)
  		return ret;
 =20
@@@ -2252,7 -2147,7 +2251,7 @@@
  		return ret;
  	}
 =20
 -	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
 +	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache, result);
  }
 =20
  /* Resolve the access fault by making the page young again. */
@@@ -2362,8 -2257,7 +2361,8 @@@ int kvm_handle_guest_sea(struct kvm_vcp
  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
  {
  	struct kvm_s2_trans nested_trans, *nested =3D NULL;
 -	unsigned long esr;
 +	unsigned long esr =3D kvm_vcpu_get_esr(vcpu);
 +	struct kvm_s2_mmu *mmu =3D vcpu->arch.hw_mmu;
  	phys_addr_t fault_ipa; /* The address we faulted on */
  	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
  	struct kvm_memory_slot *memslot;
@@@ -2372,9 -2266,11 +2371,9 @@@
  	gfn_t gfn;
  	int ret, idx;
 =20
 -	if (kvm_vcpu_abt_issea(vcpu))
 +	if (esr_abt_is_sea(esr))
  		return kvm_handle_guest_sea(vcpu);
 =20
 -	esr =3D kvm_vcpu_get_esr(vcpu);
 -
  	/*
  	 * The fault IPA should be reliable at this point as we're not dealing
  	 * with an SEA.
@@@ -2383,7 -2279,7 +2382,7 @@@
  	if (KVM_BUG_ON(ipa =3D=3D INVALID_GPA, vcpu->kvm))
  		return -EFAULT;
 =20
 -	is_iabt =3D kvm_vcpu_trap_is_iabt(vcpu);
 +	is_iabt =3D esr_trap_is_iabt(esr);
 =20
  	if (esr_fsc_is_translation_fault(esr)) {
  		/* Beyond sanitised PARange (which is the IPA limit) */
@@@ -2393,14 -2289,14 +2392,14 @@@
  		}
 =20
  		/* Falls between the IPA range and the PARange? */
 -		if (fault_ipa >=3D BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
 +		if (fault_ipa >=3D BIT_ULL(VTCR_EL2_IPA(mmu->vtcr))) {
  			fault_ipa |=3D FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 =20
  			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
  		}
  	}
 =20
 -	trace_kvm_guest_fault(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
 +	trace_kvm_guest_fault(*vcpu_pc(vcpu), esr,
  			      kvm_vcpu_get_hfar(vcpu), fault_ipa);
 =20
  	/* Check the stage-2 fault is trans. fault or write fault */
@@@ -2408,10 -2304,10 +2407,10 @@@
  	    !esr_fsc_is_permission_fault(esr) &&
  	    !esr_fsc_is_access_flag_fault(esr) &&
  	    !esr_fsc_is_excl_atomic_fault(esr)) {
 -		kvm_err("Unsupported FSC: EC=3D%#x xFSC=3D%#lx ESR_EL2=3D%#lx\n",
 -			kvm_vcpu_trap_get_class(vcpu),
 -			(unsigned long)kvm_vcpu_trap_get_fault(vcpu),
 -			(unsigned long)kvm_vcpu_get_esr(vcpu));
 +		kvm_err("Unsupported FSC: EC=3D%#lx xFSC=3D%#lx ESR_EL2=3D%#lx\n",
 +			ESR_ELx_EC(esr),
 +			(unsigned long)(esr & ESR_ELx_FSC),
 +			(unsigned long)esr);
  		return -EFAULT;
  	}
 =20
@@@ -2430,8 -2326,8 +2429,8 @@@
  	 * nothing to walk and we treat it as a 1:1 before going through the
  	 * canonical translation.
  	 */
 -	if (kvm_is_nested_s2_mmu(vcpu->kvm,vcpu->arch.hw_mmu) &&
 -	    vcpu->arch.hw_mmu->nested_stage2_enabled) {
 +	if (kvm_is_nested_s2_mmu(vcpu->kvm, mmu) &&
 +	    mmu->nested_stage2_enabled) {
  		u32 esr;
 =20
  		ret =3D kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
@@@ -2460,7 -2356,7 +2459,7 @@@
  	gfn =3D ipa >> PAGE_SHIFT;
  	memslot =3D gfn_to_memslot(vcpu->kvm, gfn);
  	hva =3D gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 -	write_fault =3D kvm_is_write_fault(vcpu);
 +	write_fault =3D esr_abt_is_write_fault(esr);
  	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
  		/*
  		 * The guest has put either its instructions or its page-tables
@@@ -2473,7 -2369,7 +2472,7 @@@
  			goto out;
  		}
 =20
 -		if (kvm_vcpu_abt_iss1tw(vcpu)) {
 +		if (esr_abt_is_s1ptw(esr)) {
  			ret =3D kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
  			goto out_unlock;
  		}
@@@ -2488,7 -2384,7 +2487,7 @@@
  		 * So let's assume that the guest is just being
  		 * cautious, and skip the instruction.
  		 */
 -		if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
 +		if (kvm_is_error_hva(hva) && esr_dabt_is_cm(esr)) {
  			kvm_incr_pc(vcpu);
  			ret =3D 1;
  			goto out_unlock;
@@@ -2506,7 -2402,7 +2505,7 @@@
  	}
 =20
  	/* Userspace should not be able to register out-of-bounds IPAs */
 -	VM_BUG_ON(ipa >=3D kvm_phys_size(vcpu->arch.hw_mmu));
 +	VM_BUG_ON(ipa >=3D kvm_phys_size(mmu));
 =20
  	if (esr_fsc_is_access_flag_fault(esr)) {
  		handle_access_fault(vcpu, fault_ipa);
@@@ -2520,20 -2416,19 +2519,20 @@@
  		.nested		=3D nested,
  		.memslot	=3D memslot,
  		.hva		=3D hva,
 +		.esr		=3D esr,
 +		.mmu		=3D mmu,
  	};
 =20
  	if (kvm_vm_is_protected(vcpu->kvm)) {
  		ret =3D pkvm_mem_abort(&s2fd);
  	} else {
 -		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
 -				!write_fault &&
 -				!kvm_vcpu_trap_is_exec_fault(vcpu));
 +		VM_WARN_ON_ONCE(kvm_s2_fault_is_perm(&s2fd) && !write_fault &&
 +				!kvm_s2_fault_is_exec(&s2fd));
 =20
  		if (kvm_slot_has_gmem(memslot))
 -			ret =3D gmem_abort(&s2fd);
 +			ret =3D gmem_abort(&s2fd, NULL);
  		else
 -			ret =3D user_mem_abort(&s2fd);
 +			ret =3D user_mem_abort(&s2fd, NULL);
  	}
 =20
  	if (ret =3D=3D 0)
@@@ -2548,16 -2443,14 +2547,16 @@@ out_unlock
 =20
  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
  {
 +	gpa_t gpa =3D range->start << PAGE_SHIFT;
 +	size_t size =3D (range->end - range->start) << PAGE_SHIFT;
 +	bool may_block =3D range->may_block;
 +
  	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
  		return false;
 =20
 -	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
 -			     (range->end - range->start) << PAGE_SHIFT,
 -			     range->may_block);
 +	__unmap_stage2_range(&kvm->arch.mmu, gpa, size, may_block);
 +	kvm_nested_unmap_cipa_range(kvm, gpa, size, may_block);
 =20
 -	kvm_nested_s2_unmap(kvm, range->may_block);
  	return false;
  }
 =20
@@@ -2839,7 -2732,7 +2838,7 @@@ void kvm_arch_flush_shadow_memslot(stru
 =20
  	write_lock(&kvm->mmu_lock);
  	kvm_stage2_unmap_range(&kvm->arch.mmu, gpa, size, true);
 -	kvm_nested_s2_unmap(kvm, true);
 +	kvm_nested_unmap_cipa_range(kvm, gpa, size, true);
  	write_unlock(&kvm->mmu_lock);
  }
 =20
@@@ -2910,146 -2803,3 +2909,146 @@@ void kvm_toggle_cache(struct kvm_vcpu *
 =20
  	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
  }
 +
 +/*
 + * Try to walk to the specified GPA in canonical mmu - if unmapped return=
s 0, if
 + * mapped returns the granule size, otherwise returns an error.
 + */
 +static long kvm_walk_s2(struct kvm_pgtable *pgt,
 +			gpa_t gpa, s8 *level)
 +{
 +	struct kvm *kvm =3D kvm_s2_mmu_to_kvm(pgt->mmu);
 +	kvm_pte_t pte;
 +	long ret;
 +
 +	guard(read_lock)(&kvm->mmu_lock);
 +
 +	ret =3D kvm_pgtable_get_leaf(pgt, gpa, &pte, level,
 +				   KVM_PGTABLE_WALK_SHARED);
 +	if (ret)
 +		return ret;
 +	/* Unpopulated, must fault. */
 +	if (!kvm_pte_valid(pte))
 +		return 0;
 +	return kvm_granule_size(*level);
 +}
 +
 +/* Synthesised data abort at specified page table level. */
 +#define PRE_FAULT_ESR(level)				\
 +	 ((ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT) |	\
 +	  ESR_ELx_IL | ESR_ELx_FSC_FAULT_L(level))
 +
 +/* Retrieve either a read-only or a read/write hva. */
 +static hva_t gfn_to_hva_memslot_read(struct kvm_memory_slot *slot, gfn_t =
gfn)
 +{
 +	return gfn_to_hva_memslot_prot(slot, gfn, /*writable=3D*/NULL);
 +}
 +
 +static long __pre_fault_s2(struct kvm_s2_mmu *mmu, struct kvm_vcpu *vcpu,
 +			   gpa_t gpa, struct kvm_memory_slot *memslot, s8 level)
 +{
 +	const bool is_gmem =3D kvm_slot_has_gmem(memslot);
 +	const gfn_t gfn =3D gpa_to_gfn(gpa);
 +	const hva_t hva =3D is_gmem ? 0 : gfn_to_hva_memslot_read(memslot, gfn);
 +	const struct kvm_s2_fault_desc s2fd =3D {
 +		.vcpu		=3D vcpu,
 +		.fault_ipa	=3D gpa,
 +		.nested		=3D NULL,
 +		.memslot	=3D memslot,
 +		.hva		=3D hva,
 +		.esr		=3D PRE_FAULT_ESR(level),
 +		.mmu		=3D mmu,
 +	};
 +	struct kvm_s2_fault_result result =3D {};
 +	long ret;
 +
 +	if (kvm_is_error_hva(hva))
 +		return -EFAULT;
 +
 +	if (is_gmem)
 +		ret =3D gmem_abort(&s2fd, &result);
 +	else
 +		ret =3D user_mem_abort(&s2fd, &result);
 +	if (IS_ERR_VALUE(ret))
 +		return ret;
 +	return result.mapping_size;
 +}
 +
 +static long pre_fault_s2(struct kvm_s2_mmu *mmu, struct kvm_vcpu *vcpu,
 +			 gpa_t gpa, struct kvm_memory_slot *memslot)
 +{
 +	s8 level;
 +	long ret;
 +
 +	/* Try a walk first. */
 +	ret =3D kvm_walk_s2(mmu->pgt, gpa, &level);
 +	if (ret)
 +		return ret;
 +	/* OK, have to fault page in. */
 +	return __pre_fault_s2(mmu, vcpu, gpa, memslot, level);
 +}
 +
 +static unsigned long
 +pre_fault_bytes_consumed(gpa_t gpa, unsigned long granule_size,
 +			 unsigned long bytes_remaining)
 +{
 +	/* Granules are always a power-of-2. */
 +	const unsigned long granule_bytes_remaining =3D
 +		granule_size - (gpa % granule_size);
 +
 +	return min(granule_bytes_remaining, bytes_remaining);
 +}
 +
 +/* If you lose the race this many times, time to give up. */
 +#define MAX_PRE_FAULT_RETRIES 3
 +
 +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
 +{
 +	if (is_protected_kvm_enabled())
 +		return -EOPNOTSUPP;
 +	if (!kvm_vcpu_initialized(vcpu))
 +		return -ENOEXEC;
 +
 +	return 0;
 +}
 +
 +/**
 + * kvm_arch_vcpu_pre_fault_memory - pre-fault stage-2 page tables for the
 + * specified GPA.
 + * @vcpu:	The VCPU pointer
 + * @range:	{gpa, size, flags} tuple
 + *
 + * The mapping performed is always best-effort - faulting in is necessari=
ly
 + * racey. The ranges faulted in are canonical, nested page tables are ign=
ored.
 + *
 + * @range->gpa specifies the GPA to pre-fault, @range->size specifies how=
 many
 + * bytes remain to be pre-faulted and @range->flags is reserved and must =
be 0.
 + *
 + * Returns: the number of bytes the pre-fault consumed, or an error.
 + */
 +long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 +				    struct kvm_pre_fault_memory *range)
 +{
 +	struct kvm *kvm =3D vcpu->kvm;
 +	const u64 bytes_remaining =3D range->size;
 +	struct kvm_s2_mmu *mmu =3D &kvm->arch.mmu; /* Canonical. */
 +	struct kvm_memory_slot *memslot;
 +	const gpa_t gpa =3D range->gpa;
 +	int num_retries =3D 0;
 +	long ret;
 +
 +	memslot =3D gfn_to_memslot(kvm, gpa_to_gfn(gpa));
 +	if (!memslot)
 +		return -ENOENT;
 +	/* SRCU must be released for progress and only userland can do that. */
 +	if (memslot->flags & KVM_MEMSLOT_INVALID)
 +		return -EAGAIN;
 +
 +	do {
 +		ret =3D pre_fault_s2(mmu, vcpu, gpa, memslot);
 +	} while (ret =3D=3D -EAGAIN && num_retries++ < MAX_PRE_FAULT_RETRIES);
 +
 +	if (IS_ERR_VALUE(ret))
 +		return ret;
 +	return pre_fault_bytes_consumed(gpa, ret, bytes_remaining);
 +}

--JMv/ldqycKmN/82L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/qXoACgkQJNaLcl1U
h9B3PAf8Cho5WvRvLoBjI7pd2ubz8VqqP+1lxtuIl53f9SptA4GNNtkrqIJ8XA2m
MWW3rTQO3qcMT+CqDXWTawZ8AGVcvlerOVZZOTQcGh3dBMpWCUqmwUYnI2bQnGLh
AEv4mvWYHrz3mOvepZm4c864zQ9Z2RykPE17FncXl4t7HrHWjGAvL7NzSuhuMuuZ
FCuikD+/+3ILL5SWJ3KeLUegCv2TH9GKebAtftfIT+V6iPwsMwf9t7Rg9iDyfwD+
8hsmrBObF/D3EcITx69W6FA66NtdKftRJwI6EtbuvdtN4IO+Wx2vSWYuHPEEFuVT
BYC/H/7CCREBl0D37USqDowMBobvBA==
=GRYp
-----END PGP SIGNATURE-----

--JMv/ldqycKmN/82L--
