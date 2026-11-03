Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700828;
	b=VOi9kd1DLziQQPjL7XvIupwiV0/jTx4ggnp0QngRW/31DC9a7OpqqdSEmrIpVB1fBrV5
	 GSZRgmpxIAikXeTG8xVHDZMo8JvKm9a9n/Mv7OXu9mB2QQBWlAGMsB+1ngJl/nIdMoqmu
	 BRwgbsL6YLsdHX+/A/rBlSezWR38bW3+AnRjvRlpQVtHlus6RYJQWl4rcw0VfnMFfkdQj
	 zxTD8swuKlfTGwSLbIDKEaa7AdR3xjHoKOqjx1KLdwP7i8VUW5LZSiGMo2KVM7HSwuJm/
	 yybXbqbO0O2IQW8i2xqCiPsizUDykJgFSouMW7hTRz8NCn17nX5G/pSZMbROwmC2WrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700828;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8iafhbcQJ7sp3lB+0gHN0eXHJ45Ph346dETrlnBka+M=;
	b=mZBlSXiBQfrqzr5ZaNlt708qjXcBbPNwYRYyjEVMJ9BO9ls8NF5UqYnEpClCVK867Oev
	 pVDg+O7oRIY15y9ITkEgeWSqybG3JBF5sortwCWMjzGyLFf9SW9zFHbSo2bZUpwoHrFA+
	 JXj0+5Ro4Qwz4aFk0zF7xr+a1tNvwXmInT9G6b5HvQKisQ7UiR6jTiD7balInkHoJEI5I
	 9+rYPZPiL4pfxlvaPXMwmtFwStqX3xN2kdUVxZUPUrH5YUgsMTqUp7PonGM4V+ykASZ6G
	 ZV3ObOe4jH22zVJPfY37xLZ1EbFfUKnJd+d9jjBgPWDoEdQsuO+jRNy2u8D4qW5g59g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ49dyEW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08918606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ49dyEW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D520A1F00919;
	Tue,  3 Nov 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700827;
	bh=8iafhbcQJ7sp3lB+0gHN0eXHJ45Ph346dETrlnBka+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LJ49dyEW1HSNMVjc8HysCkMJAKValKvKD+anluel384bY8OL2y7pe1oyTioxxxJms
	 +ZIgIVllF8lLs0V9ZvZw9Lpf8itVjChw/caNCHbg1uSR3nlxQalDQDcuhkfwem8bM5
	 l5ypGZZHyfnLOuKDL9jnyCg2h3qAJcCL17ELAjWv5XkSui0MMtjR2xEavTstyfYd1I
	 5p9qOx6CuMLibkoWJmr6em6FHGjZeznrydK5tmcbZJLF3n970d5Lk3cO68vQz9fa3f
	 DsthOTEtZrQBQcPWYfgEIskwr/i8PG9UAcK29jq0rNt/L+5EUjkV4QnEwbkDjdZAHP
	 RQJH8eMKyVfHw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id A4BDD1980047;
	Tue,  3 Nov 2026 05:13:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 03 Nov 2026 05:13:45 -0500
X-ME-Sender: <xms:1bPpalr2gMXOjQyvyy7dSqZbILOBgga3ox1uzYDdZktOrYfTbQWUGQ>
    <xme:1bPpatVOTtGlPIcDh6wCoDEGO4n42_AQ-5X3kvnlBZNLT0PAgkoDodLtNdjpnzRak
    RBL3p4XnfgxEvHgHdm92hqNh_esleSXtbvsWChbo5OBanSwJ08FEThDmA>
X-ME-Received: <xmr:1bPpajYB4CDza1uoYOfmW8OTbvpIYI0lnBB1y75umVPSVbw88Xb2r8Gpo_M>
X-ME-Proxy-Cause: dmFkZTEwQUzH9wfsWr85L33/7Ip8vsacIUnJqbt5Fzpmxj6hGx0brSuxDwz8Cr9mCj51ov
    Ixy3YLwmNS9t2Eu+tskJCdR54uQZWpOzJSDT4qm+jBBxJN6PKyJ1hsnh4IoHE4bCysApMW
    YfwR1L2hSiVYcvadWZx00S2J7ZYGsyv3Z4v4dGUcEyxibWsq6sXCysn97CP9L5rsW8Dqa4
    qa0lutljG5RxY65EWsu+0Y6ZYfQ50/7c7rccNHV1kdgiVqzt00A+kNFk6M/GZBFwivSj06
    mvpX2fLJNE88WXgipN7XHGTOR8F9B9MCi5FrcPE8QrxMRpxGF8GRAEvZGnwfAgiMQp6Hel
    WWY9pmnT3gLJo1in4TAthn4hhGbypTlHoqCm+sY9XTKOmmr9Y5xg9/8FyGxLE/eB3vVbQ7
    lNOgdrWrb+y//wC66bz/qyr3TeASU/l8s9iS14SXwAU22UfHMMtS1x2mNxq4safC4LECWI
    6Zlg57xFEZmMJmkLwabNSeudd8wAkO5aMs4gjRn0c88p0wKZXOCs98rIzCbwi/LlSL7Iv3
    6AO9cvt9Yj/i4FgKDfEmX5O1ECillOv0T7kToh8g7QVA3TQ4B4wGwLR2pWAlukQfhrPsWt
    f2XsDWJZJjFP5/hNVNKpc/iwph1G2jqKvw2q16xIyeZDk6HEu4jMojOSXb9A
X-ME-Proxy: <xmx:1bPpautBv3lU7CCVrH7Yh7YJd1hgS7NNQVXkymg5Ok1CjQCT85t3Ug>
    <xmx:1bPpaqp4J_12LQlGj_SYfL2c9PmP4uidYGPuBNdZBjQoK6a19YBX3w>
    <xmx:1bPpauISTpEI2L4Yff1qlbMTdFL8llRWQeLA6gz0NAex2KASEsymFQ>
    <xmx:1bPpah6AD4KSee7fZthwezNfUIufqKyi1AHQhOe6AtB4b_lGrTAksw>
    <xmx:1bPpanQAi20wLItnIVmA_XLNiBtcmBUCkk3YSrlCgxdxN83QjMZXtNXL>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 05:13:40 -0500 (EST)
Date: Tue, 3 Nov 2026 10:13:39 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Rohan McLure <rmclure@linux.ibm.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Message-ID: <aumzjHyJsshPJBUI@thinkstation>
References: <20261102144001.342837-1-kas@kernel.org>
 <b04316eb-a2f8-4587-9392-e673c7bd2fc8@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b04316eb-a2f8-4587-9392-e673c7bd2fc8@intel.com>

On Mon, Nov 02, 2026 at 01:12:47PM -0800, Dave Hansen wrote:
> Or, heck, I'm not that attached to these checks. Let's just kill them.

Works for me. x86 is the only architecture with them, although arm64 and
riscv have shadow stacks too, and the x86 helpers already keep
Write=0,Dirty=1 out of other VMAs. Patch below, without the Fixes: tag.

Rick, any objection?

-- >8 --
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH] x86/mm: Remove the zapped-entry checks

Zapping a range calls arch_check_zapped_pte() for every batch of PTEs,
which is every page for small folios, and arch_check_zapped_pmd() or
arch_check_zapped_pud() for every huge leaf. Only x86 implements them, as
out-of-line functions that warn about a shadow stack entry (Write=0,
Dirty=1) in a VMA without VM_SHADOW_STACK.

The warning is a VM_WARN_ON_ONCE(), so without CONFIG_DEBUG_VM the
functions are empty, but the calls remain. With the SRSO "Safe RET"
mitigation the return of every such call mispredicts.

The x86 helpers already keep such entries out of other VMAs.
pte_wrprotect(), pte_mkdirty(), pte_modify() and their PMD versions go
through SavedDirty, and only pte_mkwrite() and pmd_mkwrite() on a
VM_SHADOW_STACK VMA create the combination.

Remove the checks, their callers and pud_shstk(), which has no other
user.

In a KVM guest on Zen 4 with Safe RET, zapping 4K pages takes one branch
miss per page fewer. MADV_DONTNEED of 1 GiB gets 6% faster on anonymous
memory and 8% on shmem, munmap() 5%. THP is unchanged. Without Safe RET
the difference is within noise.

Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 arch/x86/include/asm/pgtable.h | 16 ----------------
 arch/x86/mm/pgtable.c          | 26 --------------------------
 include/linux/pgtable.h        | 20 --------------------
 mm/huge_memory.c               |  2 --
 mm/memory.c                    |  3 ---
 5 files changed, 67 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c1ca37..613c22c7838a 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -199,13 +199,6 @@ static inline int pud_young(pud_t pud)
 	return pud_flags(pud) & _PAGE_ACCESSED;
 }
 
-static inline bool pud_shstk(pud_t pud)
-{
-	return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
-	       (pud_flags(pud) & (_PAGE_RW | _PAGE_DIRTY | _PAGE_PSE)) ==
-	       (_PAGE_DIRTY | _PAGE_PSE);
-}
-
 static inline int pte_write(pte_t pte)
 {
 	/*
@@ -1666,15 +1659,6 @@ static inline bool arch_has_pfn_modify_check(void)
 	return boot_cpu_has_bug(X86_BUG_L1TF);
 }
 
-#define arch_check_zapped_pte arch_check_zapped_pte
-void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte);
-
-#define arch_check_zapped_pmd arch_check_zapped_pmd
-void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd);
-
-#define arch_check_zapped_pud arch_check_zapped_pud
-void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud);
-
 #ifdef CONFIG_XEN_PV
 #define arch_has_hw_nonleaf_pmd_young arch_has_hw_nonleaf_pmd_young
 static inline bool arch_has_hw_nonleaf_pmd_young(void)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 4a105f283cfb..58e5012b56b0 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -797,29 +797,3 @@ pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
 
 	return pmd_clear_saveddirty(pmd);
 }
-
-void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte)
-{
-	/*
-	 * Hardware before shadow stack can (rarely) set Dirty=1
-	 * on a Write=0 PTE. So the below condition
-	 * only indicates a software bug when shadow stack is
-	 * supported by the HW. This checking is covered in
-	 * pte_shstk().
-	 */
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
-			pte_shstk(pte));
-}
-
-void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd)
-{
-	/* See note in arch_check_zapped_pte() */
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
-			pmd_shstk(pmd));
-}
-
-void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
-{
-	/* See note in arch_check_zapped_pte() */
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) && pud_shstk(pud));
-}
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..fc32289af58a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -621,26 +621,6 @@ static inline unsigned int exec_folio_order(void)
 }
 #endif
 
-#ifndef arch_check_zapped_pte
-static inline void arch_check_zapped_pte(struct vm_area_struct *vma,
-					 pte_t pte)
-{
-}
-#endif
-
-#ifndef arch_check_zapped_pmd
-static inline void arch_check_zapped_pmd(struct vm_area_struct *vma,
-					 pmd_t pmd)
-{
-}
-#endif
-
-#ifndef arch_check_zapped_pud
-static inline void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
-{
-}
-#endif
-
 #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bd44d58e8684..6e49fa841911 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2558,7 +2558,6 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	 */
 	orig_pmd = pmdp_huge_get_and_clear_full(vma, addr, pmd,
 						tlb->fullmm);
-	arch_check_zapped_pmd(vma, orig_pmd);
 	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 
 	is_present = pmd_present(orig_pmd);
@@ -3045,7 +3044,6 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		return 0;
 
 	orig_pud = pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
-	arch_check_zapped_pud(vma, orig_pud);
 	tlb_remove_pud_tlb_entry(tlb, pud, addr);
 	if (!vma_is_mm_managed(vma)) {
 		spin_unlock(ptl);
diff --git a/mm/memory.c b/mm/memory.c
index 0fb676dd2bd6..25d630033642 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1755,8 +1755,6 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 		clear_full_ptes(mm, addr, pte, nr, tlb->fullmm);
 		rss[MM_ANONPAGES] -= nr;
 	}
-	/* Checking a single PTE in a batch is sufficient. */
-	arch_check_zapped_pte(vma, ptent);
 	tlb_remove_tlb_entries(tlb, pte, nr, addr);
 	if (unlikely(userfaultfd_pte_wp(vma, ptent)))
 		*any_skipped = zap_install_uffd_wp_if_needed(vma, addr, pte,
@@ -1795,7 +1793,6 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
 	if (!page) {
 		/* We don't need up-to-date accessed/dirty bits. */
 		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
-		arch_check_zapped_pte(vma, ptent);
 		tlb_remove_tlb_entry(tlb, pte, addr);
 		if (userfaultfd_pte_wp(vma, ptent))
 			*any_skipped = zap_install_uffd_wp_if_needed(vma, addr,
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
