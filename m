Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FF489FBA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989262; cv=none; b=cNZn2Yh4SN84tE8sybXbW/bffifBH0HNP/6OElbiazbZORLZ53QxLffKRUbL1r/jBuzG2FhbOxU/3zZUhOXNC7B59Uov1dR8T3jHf9p97nBqjtrza03eSf4GrZiw2FYXELYaI5wTivyklYz/98NEa+tfIR1pl+cMVAxYZjvE4k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989262; c=relaxed/simple;
	bh=7P7BJ6r23yYgS++1l6kZcvA8y1BN9I+co7T6D4BrvHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWyr7M1uW7sq0xJmf0PdSxqcSwDvwiy86EJVTVXV7w+iLde7a6lOS3U++xikBqW5mtd/WdxZ4/qdFNbP6JlEaZ7phplKsdvJNCYkDB3owLPMoqlzUgVzfns3+3sW/p6cyqrxtGwF0MDb8FkK+IN4DUdSvQkoPQFdBsVQ9uRWBN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/9P10Se; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/9P10Se"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso27472205ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989260; x=1790594060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01ra1AO1mSvOrLFVgo6C3hu4ILWJ3jo+KfsYZ5db6+s=;
        b=d/9P10Se2nOuZrbxgw2stTg3T1B0DVkDqRQsVULRZs+Vkh5kA2iAFXLWaXe25wqYsr
         Sbp31rWip/KTyGfnHpoKsldelmiG8lfxSVvudPl2NhkwmqrQZ3Nkp1Zm0y/eeEvwD+mF
         Ow81zSbc008prfcbabE+HeMpcEvwxS0P0EYnHGIuOc0nedJOpxjk/eNdS3NsCYNegm9z
         kIVLgt8nbWuRbndxDMQ0pxCjgiyuEu7DaV9raJwM48VBt1CavPFa1/GD182G1LMR2naq
         uH7drKSiZ0hL2U56RMkaiWAMo975sR9nQMzZ6VUrg1bEhdY6OxvvQn7zY6Y/VRgEaDAd
         Dr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989261; x=1790594061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01ra1AO1mSvOrLFVgo6C3hu4ILWJ3jo+KfsYZ5db6+s=;
        b=Y4LdHtH7jYmnoMZWmANNqQtFJ9AESFoaZmSVeP+zuuyX5B0DRqEx9JohC6UuDgiVvk
         ibZd5/UXz3lK/3c8BjEd2lf6/l6beVNLO2gHylvXCUgwSLQDvC7CFT07BX3+9/JyaeGi
         4NtstokkKXINmuwGQwKSdUT3rRJg2SwvFLkGan111gxBk7We1RgqD9HbKeVIttkn1mGt
         iq73G7/6NtGlwyDR2xzy1RBTKz979b64Ap8gkeDP2at56JYf0B00Z1x+RbHcFRZHvewp
         9bBZrnlcI/ClyTzJasUNgGMDjMDsrfkZ04EO+b5JWLjfhHo6gMHTQZWIMJukKCia0JAd
         9exw==
X-Forwarded-Encrypted: i=1; AKwUvBxzciOmKJp/e4m17Hv0pckxAvWlEK1Gl9yQHc/d1HQgqAT87ESV35Hnuiiw6iI09JbnI+fITxOr15RwROY=@vger.kernel.org
X-Gm-Message-State: AFuF++mvhJ2o2ZnY4D4ZnwHDcTs8Ev8X0zWRYdw0xWGKgkWVyL0rxB6c
	UIcdKLMjb+UWIFat+DiJg7UA10Nvc0+39GYiV/Ui5UHXzhnTyPco0IFQ
X-Gm-Gg: AYBFou2pVBEpNCjzIV11NxCfMguz6sWM/ad+7pDJCR+Gf3H8aSg5wHztI+PbhkTe1Hd
	WpoPA/yWw/we7dBoJLutwgIEHxLEp/psB//layBPoPJOA4HQNGX3wJV223+RPm9Zrk+MYhZPabi
	wFyLjy/AD3nBJt7sLn6UoJidHNGnXOsJUS1+pAMfKo7mF1I+88GO0D1zya8vtlpP13wKrlHBRUC
	WyGMN4u70QS6N9e7oxZxj0sHX43MHsDSjt0gUNMVi8Qra4hoE9Fk9VApnQzTVjpl4qfQDPafJyu
	mLRBe22dpv8gHByu26iWc6Xoecnht5itqgMIQzOsL4W7sPnH11MI6hRXErJBqZV2p8opT3o3waP
	Ukvf3k+l8XeJzdvqWSKxTlwyGVAYgVfsS21TNjfWCUR/9904VQD8g/a+SO2P+9m0EZGgx1HhJDw
	2avfyRM1kYNF2XstEKdzdlEQkWzguYEbSUOEb/kXgn8Svr4368/E3734uD/6ES80ml9fBWysGyu
	Lq8jd4TB6QPa5n+ivybYCfXrvgfH409
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id 98e67ed59e1d1-39e55071981mr15415502a91.31.1789989260551;
        Mon, 21 Sep 2026 04:14:20 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:20 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 1/5] KVM: riscv: Age all G-stage PTEs in a GFN range
Date: Mon, 21 Sep 2026 20:13:58 +0900
Message-ID: <20260921111402.120911-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
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
-- 
2.52.0

