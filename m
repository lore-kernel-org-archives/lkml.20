Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EEB43A7F6;
	Fri,  4 Sep 2026 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559905; cv=none; b=RqmsODXA8R0IZRZGKnYXkN+3uQsQuNKB9t8x7WuPPj13N+sAB6pKATdWAEym79dXacHQgMHxvfkPcsSLeyIeYlg56SyoHMiJLQdE3TjTpPT7YVmRI5N1OmlV00hoc/Hz0Np+KaaYUPjGrjKzDJEA637lR3tzyBOVMu2yxXwEsRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559905; c=relaxed/simple;
	bh=ZVWj9IrirtOo1FK3Zc31IoCZ9tO7r9K01RlLiFJAz6A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Fxy3oa9AbWmqq17Cp0eOYmi2xR+QW2HhiP+lLSwk7jslSj6v6xELDXA8033NcUayIaiTjNnhOp+yjTFhvrG8Iqx10suY6rZxCXyWZ6RIuK4YsIwsCjAC/j68ai/uuMaQJDOvIU1WcciXV0Oxf4ez2CkKbEvPJ29oSXGPxJ/S4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sRHeh5Hu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HImJkHK5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sRHeh5Hu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HImJkHK5"
Date: Fri, 04 Sep 2026 22:11:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559901;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyE+UO+EXsOsEN9B/UDK5etIUwbbEmNimbAH0BFvd1c=;
	b=sRHeh5HuqmXpcGYk6Cg1KSm9IM3o4HTI7WM6kIWNgTucw6vED1vMJDxEwlLl44UI1iBDOZ
	Z1adm7UBduuhic0zUgMfuBG2CdmPUJ7bSlNIQr5SNJV9RWrgAmCwcHnY1qOVjN8frDhebT
	j3W+vB8EpvXW2XPN1o4ywE48THKXipysUo78JUBjjs46MThTfwrTg4eV9/RTtA/DmZpl+Z
	Xm+EXuZWmR33Xc0H+OKlbqngEF76fk0xf9FF0BRADB98s9tGMjgePWTD1F/mU2M51Wt7Nh
	F3DVzkGoaU1uVuf+5BJ+bzKoLyQs2LqkggY9eALr+9UgDqA6GTpk2kzemnuzkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559901;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyE+UO+EXsOsEN9B/UDK5etIUwbbEmNimbAH0BFvd1c=;
	b=HImJkHK55Ycq+p0sG8DBs0lc/xogvA1G7QRAzLVGSjprzbwisRYs5pSy0tjpwwz1we3bxg
	3gsvRqqrSky8VQBQ==
From: "tip-bot2 for Kirill A. Shutemov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] KVM/TDX: Get/put PAMT pages when (un)mapping private memory
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-9-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-9-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990033.3717435.4966645183007605219.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     d7fe610e6a6638c3944b9e553b426efd527ec502
Gitweb:        https://git.kernel.org/tip/d7fe610e6a6638c3944b9e553b426efd527=
ec502
Author:        Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:38 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

KVM/TDX: Get/put PAMT pages when (un)mapping private memory

Add Dynamic PAMT support to KVM's S-EPT MMU by "getting" a PAMT page when
adding guest memory (PAGE.ADD or PAGE.AUG), and "putting" the page when
removing guest memory (PAGE.REMOVE).

To access the per-vCPU PAMT caches without plumbing @vcpu throughout the
TDP MMU, begrudgingly use kvm_get_running_vcpu() to get the vCPU, and bug
the VM if KVM attempts to set an S-EPT leaf without an active vCPU.  KVM
only supports creating _new_ mappings in page (pre)fault paths, all of
which require an active vCPU.

The PAMT memory holds metadata for TDX protected memory. With Dynamic
PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX module
with a few pages that cover 2MB of host physical memory.

Releases are balanced via tdx_pamt_put(): every control-page free goes
through tdx_free_control_page(), and guest data pages are put directly on
the successful tdh_mem_page_remove() path and in the
tdx_mem_page_add/aug() error path.

Co-developed-by: Sean Christopherson <seanjc@google.com>
[rick: enhance log, reviewing, rebase, with help from AI tooling]
Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Acked-by: Sean Christopherson <seanjc@google.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-9-rick.p.edgecombe@intel=
.com
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +-
 arch/x86/include/asm/kvm_host.h    |  1 +-
 arch/x86/kvm/mmu/mmu.c             |  4 ++-
 arch/x86/kvm/vmx/tdx.c             | 64 +++++++++++++++++++++++++----
 arch/x86/kvm/vmx/tdx.h             |  2 +-
 arch/x86/virt/vmx/tdx/tdx.c        |  1 +-
 6 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x8=
6-ops.h
index e213c9a..5c358c4 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -99,6 +99,7 @@ KVM_X86_OP_OPTIONAL_RET0(tdp_has_smep)
 KVM_X86_OP(load_mmu_pgd)
 KVM_X86_OP_OPTIONAL_RET0(set_external_spte)
 KVM_X86_OP_OPTIONAL(free_external_spt)
+KVM_X86_OP_OPTIONAL_RET0(topup_external_cache)
 KVM_X86_OP(has_wbinvd_exit)
 KVM_X86_OP(get_l2_tsc_offset)
 KVM_X86_OP(get_l2_tsc_multiplier)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 683bb8b..57d3749 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1644,6 +1644,7 @@ struct kvm_x86_ops {
 	/* Update external page tables for page table about to be freed. */
 	void (*free_external_spt)(struct kvm *kvm, struct kvm_mmu_page *sp);
=20
+	int (*topup_external_cache)(struct kvm_vcpu *vcpu, int min_nr_spts);
=20
 	bool (*has_wbinvd_exit)(void);
=20
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 064ecc3..2816861 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -617,6 +617,10 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu=
, bool maybe_indirect)
 					       PT64_ROOT_MAX_LEVEL);
 		if (r)
 			return r;
+
+		r =3D kvm_x86_call(topup_external_cache)(vcpu, PT64_ROOT_MAX_LEVEL);
+		if (r)
+			return r;
 	}
 	r =3D kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_shadow_page_cache,
 				       PT64_ROOT_MAX_LEVEL);
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 3592596..7c79f4d 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -681,6 +681,8 @@ int tdx_vcpu_create(struct kvm_vcpu *vcpu)
 	if (!irqchip_split(vcpu->kvm))
 		return -EINVAL;
=20
+	tdx_init_pamt_cache(&tdx->pamt_cache);
+
 	fpstate_set_confidential(&vcpu->arch.guest_fpu);
 	vcpu->arch.apic->guest_apic_protected =3D true;
 	INIT_LIST_HEAD(&tdx->vt.pi_wakeup_list);
@@ -866,6 +868,8 @@ void tdx_vcpu_free(struct kvm_vcpu *vcpu)
 	struct vcpu_tdx *tdx =3D to_tdx(vcpu);
 	int i;
=20
+	tdx_free_pamt_cache(&tdx->pamt_cache);
+
 	if (vcpu->cpu !=3D -1) {
 		KVM_BUG_ON(tdx->state =3D=3D VCPU_TD_STATE_INITIALIZED, vcpu->kvm);
 		tdx_flush_vp_on_cpu(vcpu);
@@ -1618,6 +1622,17 @@ void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t roo=
t_hpa, int pgd_level)
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
 }
=20
+static int tdx_topup_external_pamt_cache(struct kvm_vcpu *vcpu, int min_nr_s=
pts)
+{
+	/*
+	 * Minus one page to exclude the root SPT, but plus one page for a
+	 * possible 4KB private mapping.
+	 */
+	min_nr_spts +=3D -1 + 1;
+
+	return tdx_topup_pamt_cache(&to_tdx(vcpu)->pamt_cache, min_nr_spts);
+}
+
 static int tdx_mem_page_add(struct kvm *kvm, gfn_t gfn, enum pg_level level,
 			    kvm_pfn_t pfn)
 {
@@ -1676,16 +1691,28 @@ static struct page *tdx_spte_to_sept_pt(struct kvm *k=
vm, gfn_t gfn,
 static int tdx_sept_map_nonleaf_spte(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, u64 new_spte)
 {
+	struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
 	gpa_t gpa =3D gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 	struct page *sept_pt;
+	int ret;
+
+	if (KVM_BUG_ON(!vcpu, kvm))
+		return -EIO;
=20
 	sept_pt =3D tdx_spte_to_sept_pt(kvm, gfn, new_spte, level);
 	if (!sept_pt)
 		return -EIO;
=20
+	ret =3D tdx_pamt_get(page_to_pfn(sept_pt), &to_tdx(vcpu)->pamt_cache);
+	if (KVM_BUG_ON(ret, kvm))
+		return ret;
+
 	err =3D tdh_mem_sept_add(&to_kvm_tdx(kvm)->td, gpa, level, sept_pt,
 			       &entry, &level_state);
+	if (err)
+		tdx_pamt_put(page_to_pfn(sept_pt));
+
 	if (unlikely(tdx_operand_busy(err)))
 		return -EBUSY;
=20
@@ -1698,8 +1725,13 @@ static int tdx_sept_map_nonleaf_spte(struct kvm *kvm, =
gfn_t gfn,
 static int tdx_sept_map_leaf_spte(struct kvm *kvm, gfn_t gfn, enum pg_level =
level,
 				  u64 new_spte)
 {
+	struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
 	struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
 	kvm_pfn_t pfn =3D spte_to_pfn(new_spte);
+	int ret;
+
+	if (KVM_BUG_ON(!vcpu, kvm))
+		return -EIO;
=20
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level !=3D PG_LEVEL_4K, kvm))
@@ -1707,6 +1739,10 @@ static int tdx_sept_map_leaf_spte(struct kvm *kvm, gfn=
_t gfn, enum pg_level leve
=20
 	WARN_ON_ONCE((new_spte & VMX_EPT_RWX_MASK) !=3D VMX_EPT_RWX_MASK);
=20
+	ret =3D tdx_pamt_get(pfn, &to_tdx(vcpu)->pamt_cache);
+	if (KVM_BUG_ON(ret, kvm))
+		return ret;
+
 	/*
 	 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
 	 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
@@ -1719,10 +1755,15 @@ static int tdx_sept_map_leaf_spte(struct kvm *kvm, gf=
n_t gfn, enum pg_level leve
 	 * If the TD isn't finalized/runnable, then userspace is initializing
 	 * the VM image via KVM_TDX_INIT_MEM_REGION; ADD the page to the TD.
 	 */
-	if (unlikely(kvm_tdx->state !=3D TD_STATE_RUNNABLE))
-		return tdx_mem_page_add(kvm, gfn, level, pfn);
+	if (likely(kvm_tdx->state =3D=3D TD_STATE_RUNNABLE))
+		ret =3D tdx_mem_page_aug(kvm, gfn, level, pfn);
+	else
+		ret =3D tdx_mem_page_add(kvm, gfn, level, pfn);
=20
-	return tdx_mem_page_aug(kvm, gfn, level, pfn);
+	if (ret)
+		tdx_pamt_put(pfn);
+
+	return ret;
 }
=20
 /*
@@ -1819,6 +1860,7 @@ static int tdx_sept_remove_leaf_spte(struct kvm *kvm, g=
fn_t gfn,
 		return -EIO;
=20
 	tdx_quirk_reset_paddr(PFN_PHYS(pfn), PAGE_SIZE);
+	tdx_pamt_put(pfn);
 	return 0;
 }
=20
@@ -1862,6 +1904,8 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, g=
fn_t gfn, u64 old_spte,
  */
 static void tdx_sept_free_private_spt(struct kvm *kvm, struct kvm_mmu_page *=
sp)
 {
+	struct page *sept_pt =3D virt_to_page(sp->external_spt);
+
 	/*
 	 * KVM doesn't (yet) zap page table pages in mirror page table while
 	 * TD is active, though guest pages mapped in mirror page table could be
@@ -1875,15 +1919,15 @@ static void tdx_sept_free_private_spt(struct kvm *kvm=
, struct kvm_mmu_page *sp)
 	 * the page to prevent the kernel from accessing the encrypted page.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(to_kvm_tdx(kvm)), kvm) ||
-	    tdx_reclaim_page(virt_to_page(sp->external_spt)))
+	    tdx_reclaim_page(sept_pt))
 		goto out;
=20
 	/*
-	 * Immediately free the S-EPT page because RCU-time free is unnecessary
-	 * after TDH.PHYMEM.PAGE.RECLAIM ensures there are no outstanding
-	 * readers.
+	 * Immediately free the S-EPT page as the TDX subsystem doesn't support
+	 * freeing pages from RCU callbacks, and more importantly because
+	 * TDH.PHYMEM.PAGE.RECLAIM ensures there are no outstanding readers.
 	 */
-	free_page((unsigned long)sp->external_spt);
+	tdx_free_control_page(sept_pt);
 out:
 	sp->external_spt =3D NULL;
 }
@@ -3480,6 +3524,10 @@ int __init tdx_hardware_setup(void)
=20
 	vt_x86_ops.set_external_spte =3D tdx_sept_set_private_spte;
 	vt_x86_ops.free_external_spt =3D tdx_sept_free_private_spt;
+
+	if (tdx_supports_dynamic_pamt(tdx_sysinfo))
+		vt_x86_ops.topup_external_cache =3D tdx_topup_external_pamt_cache;
+
 	vt_x86_ops.protected_apic_has_interrupt =3D tdx_protected_apic_has_interrup=
t;
 	return 0;
=20
diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index ac8323a..fd368e3 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -72,6 +72,8 @@ struct vcpu_tdx {
=20
 	u64 map_gpa_next;
 	u64 map_gpa_end;
+
+	struct tdx_pamt_cache pamt_cache;
 };
=20
 void tdh_vp_rd_failed(struct vcpu_tdx *tdx, char *uclass, u32 field, u64 err=
);
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 39865a2..ff00ee6 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2049,6 +2049,7 @@ bool tdx_supports_dynamic_pamt(const struct tdx_sys_inf=
o *sysinfo)
 	/* To be enabled when kernel is ready. */
 	return false;
 }
+EXPORT_SYMBOL_FOR_KVM(tdx_supports_dynamic_pamt);
=20
 static struct page *tdx_alloc_page_pamt_cache(struct tdx_pamt_cache *cache)
 {
