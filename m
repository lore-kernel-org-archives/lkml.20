Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128CE3AAF5E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206585; cv=none; b=lmu84qBeAoDBoO1zNChXauemQjAMpx67rK3U3cMdmuR2n2I90HgIdGMvYJmjQ15SfsaFDcjSBb4npwMBziui+SHXa54RLAGATfSEirTxhZV+caXCVrHmvVGprpdRhExxv3KutRjaI8np/yh1VsdXaX+YwxZH+FB/zXu5pE2YAcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206585; c=relaxed/simple;
	bh=zDoMxRzARHHAy5ri+HjeBWocd4VpQdNpx8uIHCb8OO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLypF0fzsRsEtyuL7HyDNY2qBhoDNEkFH/lPsRfxSFqFGpZEiIET+laPFU7bM5yMQ9HuhOxdE9o8ozeI1gtDDxG4assfhDK6x0D4RrIRNp9qOQqi9jhqD+OBCe5wAhMA44vNBwFzM/Z7KZoA0QygsCYB503WDCIZZP2ocewei1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8NQSuSz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8NQSuSz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso2374595ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206583; x=1792811383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=enK3RSWvXdgqwIVRPBvjJmOYoe9F1G7CwzrwYjBwBdA=;
        b=o8NQSuSzgCXIdFSZZ+2MsfR9MAPbOPh2uYIQbEAizPuIr2fimr1aRAHpLzBaH3pEYI
         /F94ZDCPpGq1/JUMOxY1/1LcKGYRt9LsAQXWHo/hUuR8+XE3wPcxzaYFdtcOn8uNMBta
         BpSB2enEL47sles4fWQL7RKiSjbGlyrwBDryhLvqqYlPtzgsJoBTPQ3uaB2gnsU7toQ1
         qnxucSC6Lq6h0KAfs1HmaFcpQ042anF/O2fVAgYmCY1PdkDwooZ+dXK05v19hheQoSaM
         +55fgUfzXM8VLs4YWqqevu6atMcERWl8QUp4vu1uFpF/Mh/wgkmPOYLZoJ58omAGOm2s
         iVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206583; x=1792811383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enK3RSWvXdgqwIVRPBvjJmOYoe9F1G7CwzrwYjBwBdA=;
        b=bTVut30XQa6iioMij9e9mIoyBKT8MHxvKPe7M52ejdLq/neZfwXL3qrzQw+BwMb4ss
         auY2lHeEcMsZiLjzaQXMx4CeNKlTsVGEJ6XqVkzcnrKaS2ACVgzaTAg/X40rwhFcOcyQ
         aV2hhUf3+boOErQBC7rE9EinnI2UA7uWKZkorbNXENijWzQysrBhi8NB2yQQPqjXF9F+
         BMfsnT5yok70q/7w4RdBa+MWYSgyz42qI594nmxpULKaOXM3ddxwT/movoUQy9fXRgnG
         qghv8XLxpOd+OAofOzR6bfi2g1TRQ85zLeDqTHQm0q5/75b8nsnO131AeSsbRG+3zYUn
         iRKg==
X-Forwarded-Encrypted: i=1; AKwUvByqU7jm3YSYv4aodTgyWmeC4HP46ViUB5JgpFgqUqYkUkXqssHCuLR5H/blsE75XfYuvjhP3qB/+AuUntw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbhlAP8lo5DldWDjH04B0XJS3c8WiLVU+Ww75LzLKwezKZo/rO
	NsW7qST48xvXR3Am1frK0FXnnkyzOsKQysLTj4CFZ3hwOOekd9D6+/uo
X-Gm-Gg: AYBFou1sPF7Ui8Rr3L4iU/5C0HGlUAZQcgqp8oo+jOUaZ0uzOjVlsBd0A5z46WfYeSN
	dvxmIdSEj4ftKQyc1SNNt0eeE4WI7A4N4Q4Nw9gDBT2qWAoc5KA6Jo/1TPu5z4ftmanGnJDVGKG
	5PyzRrlPDpAb2UsQ+5pEAA6ue9Xt7vnSrKtOhD4qkXhTXN7J+ZyxBE/ubXu0BEajV5cQRwase3e
	LUtS21VX/4RbAu26do8tLYFEpoMgFpYrE73rnjYnUiUodsPmQEFzC/0Q0M4KMH7Otg+WToC5LKO
	jKBp8ywRGvTDp4VabZI7aNlrx7Io8DoJ7pHcRCfZpttWlX70IxxTRlxDP6GZBKrrgjPMRFtL0/d
	4qPtBAuzXdJ6ioVjUi9ikH9vhyiOGz7Lh1BioSbPxarC8uUCkcXkdap2HIIEou1xbgK9vM42IWb
	rFQcou4UvLJCiH90dlDxZUFBpFgBPhIkMm09Is4zqcglpWaYh9D0AsEz49B4PwA04Q50+f8EUAN
	Ww8ooY+uBemgrfRQhy+by6rgbZBlOP5tw==
X-Received: by 2002:a17:90b:5803:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3acee29303bmr1411650a91.6.1792206583320;
        Fri, 16 Oct 2026 20:09:43 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm1795406a12.14.2026.10.16.20.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:09:42 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on host-writable leaves
Date: Sat, 17 Oct 2026 12:09:26 +0900
Message-ID: <20261017030927.345454-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dirty-log write fault fast path sets _PAGE_WRITE without checking
whether the backing page is host-writable. A read fault can install
a read-only mapping to the shared zero page. A subsequent guest write
then takes the fast path and writes into the zero page instead of
going through the slow path to break CoW.

Use RSW bit 9 to record host writability before dirty logging forces
the mapping read-only. Preserve this bit across write-protection and
fall back to the slow path when it is clear.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-174168@kernel.org/
Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:

1. HiFive Premier P550

   A selftest makes the guest read an untouched page, then write to
   it with dirty logging enabled. Before the fix, the write corrupts
   the host zero page. After the fix, CoW allocates a private page
   and the zero page stays zero.

   dirty_log_perf_test -v 3 -b 256M -i 3 shows no noticeable
   regression (14-21s per iteration before and after).

2. QEMU (-cpu rv64,h=true)

   The same selftest reproduces the zero-page corruption before the
   fix and passes after it.

This patch applies on top of the Accessed-bit fix [1].

[1] https://lore.kernel.org/all/20261016101458.221648-1-suunj1331@gmail.com/

 arch/riscv/include/asm/kvm_gstage.h |  5 ++++-
 arch/riscv/kvm/gstage.c             |  5 ++++-
 arch/riscv/kvm/mmu.c                | 15 +++++++++++++--
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77..0d19ad6d7dfe 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -35,6 +35,9 @@ extern unsigned long kvm_riscv_gstage_max_pgd_levels;
 #define kvm_riscv_gstage_pgd_xbits	2
 #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
 
+/* RSW bit 9: the host mapping behind this leaf is writable. */
+#define KVM_GSTAGE_PTE_HOST_WRITABLE	BIT(9)
+
 static inline unsigned long kvm_riscv_gstage_gpa_bits(unsigned long pgd_levels)
 {
 	return (HGATP_PAGE_SHIFT +
@@ -61,7 +64,7 @@ bool kvm_riscv_gstage_try_update_pte(struct kvm_gstage *gstage, u32 level,
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
-			      bool page_rdonly, bool page_exec,
+			      bool page_rdonly, bool page_exec, bool host_writable,
 			      struct kvm_gstage_mapping *out_map);
 
 bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index be70607a33ea..d9bfd0c6d5fd 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -207,7 +207,7 @@ static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 leve
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
-			      bool page_rdonly, bool page_exec,
+			      bool page_rdonly, bool page_exec, bool host_writable,
 			      struct kvm_gstage_mapping *out_map)
 {
 	bool found_leaf;
@@ -246,6 +246,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			prot = PAGE_WRITE;
 	}
 
+	if (host_writable)
+		prot = __pgprot(pgprot_val(prot) | KVM_GSTAGE_PTE_HOST_WRITABLE);
+
 	found_leaf = kvm_riscv_gstage_get_leaf(gstage, gpa, &ptep, &ptep_level);
 	if (found_leaf) {
 		/*
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 042d1e3b3547..196cde6c40cd 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -586,6 +586,12 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
 			break;
 		}
 
+		/* Let the slow path handle host-side write protection and CoW. */
+		if (!(pte_val(old_pte) & KVM_GSTAGE_PTE_HOST_WRITABLE)) {
+			ret = false;
+			break;
+		}
+
 		if (!dirty_marked) {
 			mark_page_dirty_in_slot(kvm, memslot, gfn);
 			dirty_marked = true;
@@ -630,6 +636,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	bool is_hugetlb;
 	bool unused = false;
 	bool writable;
+	bool host_writable;
 	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
@@ -714,6 +721,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (is_error_noslot_pfn(hfn))
 		return -EFAULT;
 
+	host_writable = writable;
+
 	/*
 	 * If logging is active then we allow writable pages only
 	 * for write faults.
@@ -739,10 +748,12 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-						vma_pagesize, false, true, out_map);
+						vma_pagesize, false, true, host_writable,
+						out_map);
 	} else {
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-						vma_pagesize, true, true, out_map);
+						vma_pagesize, true, true, host_writable,
+						out_map);
 	}
 
 	if (ret)
-- 
2.52.0

