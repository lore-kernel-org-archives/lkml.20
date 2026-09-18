Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA7F49D5A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716416; cv=none; b=jGWVKzWjaM2qNIolWP4semBpwdLgVFSorBfSEP+dnjZkj+T49eu1/eIZH4XkRZHrH9nzalTI3e/oYspsQi33mb779CotJv1FREtAmGGCU4O4aIeYFwHNXubAxm0Cy1aUurLKagaR1bq+Yz1+lGF4F60b+TwAT1Ri5HSWpSzKpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716416; c=relaxed/simple;
	bh=j0Re39X5EzptSkn+keySa8RUS2nsQvmKZ/5s6481OKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PffRot3iMANcjm9+ji84w1q009utahhxDteCkTR2XlHI4BQnXFLBT2KQndQzN1G3E+hcVTcBGJMoKClFitpbdZ72a+5MfcesAZMGMmaB3OpC5EDmIeTfGmyTgzv+7wGQxj2vtdANKyoosqwf+EtP2SiEEpyHoBx+Crt1eRA1LDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCnf5Fld; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCnf5Fld"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so2741015ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716408; x=1790321208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0TiBnW0QZCej4PmxwEbVRI0oUSu1J4v1QwXVJOCioo=;
        b=qCnf5Fld7IE/GDBfrMQFkuINinH2umGDB20GkF5e5JJf7lEw8yAF2ztNLWnpxHBNIU
         LvLc1O47HWhFJg59rx5b+frRO89VL6zUYnygWYRKcVyvdyUTxZJRmyO+ishx5Nuwlmbz
         cKGpjvjGtD0HkIvA0LZU80e9aqI1NSTy/2swptrfXnkWi5+Q3PBCHVYY0aJ57egFotjV
         zlJiObUJ1hDfnZKpp9HLDRyWOr/nM4BWnLW0xIRfWx83U/idT0BAfTXlXgLqyDEPX93/
         BuPUStMCSu9lnXmGGmgYmwqWPf/qr4p1AMutDIC51dz+Xw8yrPY9TE0njVXRxcq84EXH
         Gn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716408; x=1790321208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0TiBnW0QZCej4PmxwEbVRI0oUSu1J4v1QwXVJOCioo=;
        b=P+IWcRPzZ+3CanGzsdwxvLbduWmavF25kdl73LSiFwNDGNLaHFhPyNuyoYlAHfOqqP
         H4ozPS5g9CHSEF/ONpvcNKwPgbFVJkxxW8ZVYLrW5YE8BUW83nZR++hYC2QeuFdIosL0
         OwrJEL0+oumw2e3Iwwj6ObHV/XAjEMeDNa5xfIfn+zlG+fLP7eqbsUOAHgTCQWbr1oSt
         ZrXzyBue6O9W9tM17zvi8+jUhkKH2MFg/vL1lEw6Af4lIChZw8/s3fwebPvKMpPEJPFp
         xIf9hn0yH74ohH8mZUbEUDhdoQXFWpmc+pD3LgRfQo6K3xju1FZlT7R/62vTNGNfifAq
         Z9DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpDDg1NGMKMMNAD9WmXzg/r412/R798oSx7u+uGRYIHB8QpNTe4UlMr3ShFJ5uwrQDfaajUScuRfpvdWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mhTK2zMbyMcEBxJX31+LabIQeQekAco4++UCFZtoHNjrQZz/NH
	OrGcp6l7mBowW/+Ng4IfPHIaKb2T5y2sT4T/FI/8a/oIYNPvKgDKTusY
X-Gm-Gg: AYBFou0i37KlsW7y/QCQtNhhN1uUwgcQ3odW5LWs/9MsKZiDCbjNku6szieKb4Xx9/S
	PNyGo0uu+ryLTlId9Ck88XrOBzcVsVnD9kz1wbH8GUaq3cQ6BpLKNxmyOYgsUsBMi4kifINL709
	43KrhQ7G1pVelJPvQLsW8ehrL3ufSSvoKvRRCaRMpVASDAZLo/9hwyjlGOOm3i8UR8anxcjqhdy
	cA6QFQ1nk4ynecqrGLklx7Bin5LqZQl7+0dAL6rstfawOk/KElWFtOtpJr1TjiTDM1TUb7UXUWs
	Q3vC0f+gMQiCXbTIlxRRcp3OF79rHxTAJgjpO4aBdSaa/Cn5MYJswQUazk3UbVUG3nsrx3om2oz
	mYGb2KLms6BCz4/0EB+nPkhjleRbYqgudFiyRkB9LAxRznybYVxH9FFJf7EBwViXqTLdQ0b6RIj
	406dGpPuLZx0vKeGWZyaJn9XgVUHswGef50dSok720iMiS6IAwKlVEwtfFeiDY+UvXEGPLl3Tro
	K30c3rwS5qlVXNiDTmVaKc=
X-Received: by 2002:a17:902:da85:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2ddb7420950mr15441415ad.15.1789716407615;
        Fri, 18 Sep 2026 00:26:47 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73dae10sm3772535ad.1.2026.09.18.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:26:45 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jinyu Tang <tjytimi@163.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: Age all G-stage PTEs in a GFN range
Date: Fri, 18 Sep 2026 16:26:22 +0900
Message-ID: <20260918072622.284188-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_age_gfn() and kvm_test_age_gfn() only operate on the G-stage
leaf covering range->start. They also warn unless the range size is
exactly 4K, 2M, or 1G.

The MM can pass larger ranges when batching the PTEs of a large folio.
For example, a 64K mTHP range triggers the warning and only the first
4K leaf is aged, leaving the Accessed bits of the remaining leaves
unchanged.

This can be reproduced on an rv64 host with Svadu by disabling 2M THP,
enabling 64K mTHP, and running:

access_tracking_perf_test -s anonymous_thp

This results in:

WARNING: arch/riscv/kvm/mmu.c:362 at kvm_age_gfn+0x210/0x370
...
[<ffffffff800c8fc8>] kvm_age_gfn+0x210/0x370
[<ffffffff80095c90>] kvm_mmu_notifier_clear_young+0x250/0x478
[<ffffffff80ae532e>] __mmu_notifier_clear_young+0xde/0x1a0
[<ffffffff80932f76>] walk_pud_range+0x86e/0x1688
[<ffffffff80a18720>] walk_pgd_range+0x518/0x17b0
[<ffffffff80a19aa2>] __walk_page_range+0xea/0x580
[<ffffffff80a1a422>] walk_page_range+0x3a/0x80
[<ffffffff80931dc0>] try_to_inc_max_seq+0x520/0xe68
[<ffffffff80939dc0>] lru_gen_seq_write+0xd08/0x1310

Walk all G-stage leaves in the requested range. Advance by the leaf
size when a mapping is found, or by the size of the non-present region
at the level where the walk stopped. When testing the age, return as
soon as a young leaf is found.

Remove the range-size warning since arbitrary GFN ranges are valid.

Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  2 ++
 arch/riscv/kvm/gstage.c             | 34 +++++++++++++++++++++++++++++
 arch/riscv/kvm/mmu.c                | 22 ++++---------------
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77..a03db1a10095 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -81,6 +81,8 @@ bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 				  gpa_t start, gpa_t size, bool may_block);
 
 bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
+bool kvm_riscv_gstage_age_range(struct kvm_gstage *gstage, gpa_t start,
+				gpa_t end, bool test_only);
 
 bool kvm_riscv_gstage_wp_pt_masked(struct kvm_gstage *gstage, gfn_t base_gfn,
 				   unsigned long mask);
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef..f61ba434093c 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -485,6 +485,40 @@ bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 	return flush;
 }
 
+bool kvm_riscv_gstage_age_range(struct kvm_gstage *gstage, gpa_t start,
+				gpa_t end, bool test_only)
+{
+	unsigned long page_size;
+	bool young = false;
+	gpa_t addr = start;
+	pte_t *ptep;
+	u32 level;
+	bool found;
+
+	while (addr < end) {
+		found = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &level);
+		if (gstage_level_to_page_size(gstage, level, &page_size))
+			break;
+
+		if (found) {
+			if (test_only) {
+				if (pte_young(ptep_get(ptep)))
+					return true;
+			} else {
+				young |= ptep_test_and_clear_young(NULL, 0, ptep);
+			}
+		}
+
+		/*
+		 * Advance past this leaf, or past the non-present region at
+		 * the level where the walk stopped.
+		 */
+		addr = ALIGN_DOWN(addr, page_size) + page_size;
+	}
+
+	return young;
+}
+
 static inline void clear_huge_mask(unsigned long *mask, unsigned long page_size,
 				   gfn_t base_gfn, gpa_t addr)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3e955d808743..342f606399e5 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -351,42 +351,28 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
-	u32 ptep_level = 0;
-	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
-
 	kvm_riscv_gstage_init(&gstage, kvm);
-	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
-				       &ptep, &ptep_level))
-		return false;
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
+					  range->end << PAGE_SHIFT, false);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
-	u32 ptep_level = 0;
-	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
-
 	kvm_riscv_gstage_init(&gstage, kvm);
-	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
-				       &ptep, &ptep_level))
-		return false;
 
-	return pte_young(ptep_get(ptep));
+	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
+					  range->end << PAGE_SHIFT, true);
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,

base-commit: 41e81f7e3ef96594fb840445343c0ee7723aa550
-- 
2.52.0

