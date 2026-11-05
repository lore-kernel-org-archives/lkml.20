Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880208;
	b=GNAKTQt0vQj97/GZObRDJxTQXnobLLPJ0J7naxXzWBB5SujkK0+X/vVCpGEFRrsaXhn0
	 MupH477loBrgJwd4tUJ8GLW6ZLWsjQF4pSpqYhnEAeHx/I0Xx98NvQYCkEsd7rcKHjT05
	 56gozTZeV4UxpI3QkFpYAj0z+PKBBsNnypUtdDhNiiLsqar51KvOiYGhbGuswhh1kmvUV
	 ff1zhDjSxvcP73orIpSFaQiYqUf8BXFsRGaSA11GRTd3WStAO9nYLON7p7EgBsOBqdx6E
	 g2ELA++ZDiRYHxwIwYgRGStuxFkNpWIYIKrMzoCioZ2OHqHTcI2zLqNbIf6yenNowcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880208;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SnGqaF1m3+TcUoIUe8s1ktdd86fUI1Q/MOw+vA4nSY4=;
	b=2+5V9D4AInIKScBHp1kLxpUhU0srEAUSQtD3C9WIxpn8pH3i7fVeXFkA6NsG+2k65549
	 dFl6DbzxxJTWX/xrcXrnn4wKSTHzaftyAv8pQaJTkGEWxRYRs1WTSrp6/XoKScoV0v4TY
	 Hc6tY194zRUjPHlWAwJfGz3Q1RtNtuYUWDHNCWDau3ghBYqmHZ/eWcOv3z6U8L1KaznZJ
	 G0cHR0JBqK6Zn/qOCRlPc5uw2GZeRxRN+ePfmk/5BqWCjya+zOAD/ijK9yyluUqcKMqrK
	 nByu/7Xl3VdifC8hq/hX/KyUBcEtb1KCP/l9JKDzsTK9ovnLh4vp9e6yvEpXP6kRTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b="AeMnsfH/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MJbHSkdK;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C653606D81D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C653606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=AeMnsfH/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MJbHSkdK
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 922C6EC0612
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:03:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 05 Nov 2026 07:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1793880206; x=1793966606; bh=SnGqaF1m3+
	TcUoIUe8s1ktdd86fUI1Q/MOw+vA4nSY4=; b=AeMnsfH/5BMoyHL+Y4AAW0mnbZ
	Rt07AvuF+GG023uKzgW0I52pMsB2NrK2gn6ke8YrUWeXgDXKh54l2A1x68YQ58eZ
	uIegmwk5EFiaNyUu7q4A06WBeYVD07ZizdsPb6R/VuZBl/y7DDq8JBIQhtyxohi7
	9WwZFDUTSm6IQ8N6P+S2bQPymOouZBG4uWqFObHyCzZuqdFfHDnjEIAQ8HOx7+Q6
	9uixf4VOlfX4QWouTlLodngNGNsm06YJZ67MKRQ2P7vB9CBi/TRdk6htn460FL9B
	xz7RoIfS4GyPv0kpFE7hamAAfGg4Vgd9m5QZYub7Hjc0wmcWTbYt8eEFhadQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793880206; x=1793966606; bh=SnGqaF1m3+TcUoIUe8s1ktdd86fUI1Q/MOw
	+vA4nSY4=; b=MJbHSkdKfJRklbEdYDZNJSST9DKPjuhUfbfPB6z4JIiTXwlrA/Y
	nslxVGucnPsuYalga5szB+C5gID0QcRcdEHwJ9GewL5HccgHKWdLl8k/e9v8Xm/D
	tqObLszJv8vU6jO8CnLwT2YSTdl/IgZ1++lH2R4rKlOwbWG76x069+b6ZCTbCkFu
	/0+uyg/SaKdL6tAoLU3lg8Quy7XM0UZAY9Famp0Ijlr9SiSUJaYIDCUYt70I9yXA
	leX6bZyh0/QB6+GW8o9jFVVdUFGRm63e6/A6M10PBiwLrbm8+Haxu0UF36Buj68A
	3laycBGvz/SF90tJwy4XzIxtOVCoy3z3XIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793880206; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:PD17M4wU2sBoxGtXhJqN5Vo+5h9EW5bbUEfaQZJDgHmmsqY
	ySedr7biYYV1D4BVH3toW+YZE47EMZTQbY78+JWC9pAyqF2+YXWQF7tD5etEcYm7
	TsmOlefZqLv5q/E3YGbzhbNLiSRs6Full9ilOp4SzFFe89kc5sepNo1ztrmabpMU
	zwoFElcZadFRysgt42fbthtcLow5xP324Xm8Q6u/KmyCvgPWgWQt5nyy2IsveeqG
	VvsRqm5qTj20+mERM9vnYswkorxvTGRPMrI3RrChoCmEkWFgNgtbGdEyh4cgsLcY
	IFGHroRrQ3SC4bELzwb+tximaA+ai7Z30FlF0hA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:XI+rQWrzB4QmqCdlGOqtcUQo+pDdM93YcH03LgDilhs=:PbeghzKZd5F4FNVd5WY7yMjVzeJL5Zr7Shft7iWg58k=;
X-ME-Sender: <xms:jXDsatgLbPS1GAvpfedVT73RSp_Dq3SRlNteoTClHQt4VMOyak92aw>
    <xme:jXDsavYRRbbztS7PgI8-pXFQQSKQ4OijoPz26sJ2gsw8Otjk_fcfjlPEJibwEOgiN
    sDj8K3K9WMFV8m5HS0GVyhlnfk2o87rNH66g8I8ekJ2NI0efl4SvNw>
X-ME-Received: <xmr:jXDsapGeNWETG8-WnhjvG-W-YvWxKL67iDYalHddbMRR__Ogcl9tqfGHqy8>
X-ME-Proxy-Cause: dmFkZTEG2q+iUQ7hlytx20LnP+Hs1c68SNVEZZBwR+/lDeS96dUa25vm89TwO3Uk7oTvWw
    a+Er0Bz/jzSjyW92/P+/jrFJRS4b/gVCoYwZmiAYNCT0aJA7Hd7wl8p2R03tyw1lzv3FU2
    H0PYH4FQ19BPMrR0uXSpoK0sj0wBGfn3kKPFFhzXlvD2hufDW7PVKFznXwdwbcInpT38UG
    rx8fq+JvcHpvJLajIkA9aqus5DzG95Y76S64A0X4tnIHh66o9j7J0p3SQrmuhU8SuMX8G0
    qkA6P4dLPb8Hx/NoOwbLI4IHHmndPEFhG8Rwv6ThGqKDEyzwU7wruNBA9vc5k0CuNEdEda
    PGu7Osiw6JBmr8UKTjuW/cjHPUX401xWhTxEY2pZPzbq0k4uGQXPXDhH9TlUrNpNzjwaXU
    A71MzzGCOCua4pj4gYbb7NhaL4BI+TzyFau8yTS41RgnexOiO8D6Gu3O6kHLINfmSZT6/H
    cvu9l3tZDeZpHHAo1EZCafmtlTpgFjwxpvgfrJTiI6cGnEc774SfrMnr+0SliqAA+f7bBg
    YS6vrjpkcYQuYtSlBPDOKGiVY1e2325it6igDshZxsvQa1gXbEDt0V2Ltctz1KOzj5OfLn
    E8VzMEbojWGuXfPqAHj1MOXGdLTYsPiFep4dmYBFhPndur05dg18IL3RW40w
X-ME-Proxy: <xmx:jXDsal9MwR0syf-ZWwPHiWHQyqZK9UKL3oeZh8g9M0CL1X0nMVVZWQ>
    <xmx:jXDsamUqG1zB4JIvkK56hBckAEzSvYXLz77xkuJFe0-S_Xfre233mQ>
    <xmx:jXDsapYw5O7usH1mY6tGMxGKYz_Um2zULrlcivzgISWiTMBgOL5jfw>
    <xmx:jXDsajUKpXbiBn0gbURPIQlQr_wNqHe9YM2ykoG5GZ14BpWouRHfrA>
    <xmx:jnDsajlBG3OHGa0_wTaAm1ZM8KH-F76nm8Pp5UrehdjqVBdzF9TXKfeF>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 07:03:25 -0500 (EST)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Tejun Heo <tj@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2] x86/mm: Remove the zapped-entry checks
Date: Thu,  5 Nov 2026 12:03:21 +0000
Message-ID: <20261105120322.3319301-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

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
v2:
 - Remove the checks instead of building them only with CONFIG_DEBUG_VM
   (Dave Hansen).
 - Drop the Fixes: tag (Rick Edgecombe).
 - Note that without Safe RET the difference is within noise (Rick
   Edgecombe).
 - Drop Jose's Reviewed-by: the patch is new.

v1: https://lore.kernel.org/all/20261102144001.342837-1-kas@kernel.org/

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
2.54.0

