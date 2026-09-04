Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677949DB86
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528634; cv=none; b=tEH2t6msvIKG4yZ1NKk2BS0hBbIuER/JSbzIGFo3UxgKLjGf2UH9210C8e0Mad5nSy9z325/RYwpgTBvhpsmk/puzzbmgpEOe4c8PmIENvKS72kuFLQUPc10R/uXzKxp9ZRzuENoyP6+WRjI6n/glgmmiGcl4e6OUoASm8cfTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528634; c=relaxed/simple;
	bh=0/cxIaf84kQjvtYAX1of/WtRKCUsCKmhJOuRQ0QVo+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MqeoeCAozPES/tGeYdZ2zUyGGegw1cQ+cKn/+f7jvkwDMSiAnxhFCSjpyeHN70+EEq+j27bdgN42pnIm4TV8pUG1mkmxsKzhkivX/RclGTbaP8ldJKxadKXDoD5Jk99liqYNbIJswjDuIzcGq+jSG8oJrRkzsPy4L5BiCSo+f/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VuWU5peQ; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VuWU5peQ"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-484357599a4so700276f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788528631; x=1789133431; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul9UGPOILM7B5DmFYUwOQNUEy1YqQtqP63zgojN5NOI=;
        b=VuWU5peQopZl+OuH6GBdf6/WtHz7akaVFuj7nFHAQebsD8g7vCZGWf21vaP5HPKer4
         xLz7d3a2QbRPJfw5UL0JlJLTaUU9T+yu0oDzWalcRjyD4m3pf9ROugA7c5P2rwyZ/DnO
         l7HOBH/a58X5mHlvtLT+gTMMKfRYKNwC7fs+vY3Jiwa8PnX/UVZUrPlxf2LFr4G6Euno
         bdlq88b/biXaqqUJzVLQ8vt9b5TOR+/sODLazirB12UAi7nMs3kwkZLYT0SZ+mEnyfTf
         Is6JvPhdk4mquvRY4Ejd42/rCP+6h91D5f4uYby3qCjzvwsOGVP3oL5yvdKZEILRFASu
         ZdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528631; x=1789133431;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ul9UGPOILM7B5DmFYUwOQNUEy1YqQtqP63zgojN5NOI=;
        b=aQv7hu6L5L2sGOEnWTj9OPCVBIvMIt3sSttqt62/4idvdOAV9CdI/QgBdPU3UyJonK
         kfgFUmLk8WX5sHCf1KBTpjIv2gJth6RlEBUxG3qL+aOKZJTPtG7jLfmBiEDtdvdAIEjq
         9m+1H3X3+ZGxirGAyKJOl877EhuW4lgCUGwNVn3j82HaJOrpHkPwpW1hiVb4ysHg4DXg
         wcgBS37IoHLyZT63w8Ouo3mHN9Y0xdNCsU1ONDmYmSQ8sulsPz3YK+u4+fHRLsCphIIw
         FE0s3wrtjwAxq09/q0q3O33mZTlxuAjyUG1o+RAu+FSxHDXckcC40OZxhn6UewJ0O5FM
         g4rQ==
X-Gm-Message-State: AFuF++nlZLhe6JtQWdT5Cz/U3jKuOIJGoIIUosZ3P5EROtK0w4O1PiRe
	+sqO646XOV0hk9BdAcFdCulCiVbyhooPG6gLTW+X9hteFEgs/esbCISS9tJQpmc0oGSlgMeawJx
	FnR8mOQlbWnYzbxifEOVtGdLJxUq7MmnpOCTNO4FfhVbnmhwBDxiD23iAQNFpj85F6h03ZF7Eec
	kOy06oUzFZg2faxZk5jYiuN7opUneh0FCi5iObs//Emdsn+1avX7js46g=
X-Received: from wmco24.prod.google.com ([2002:a05:600c:a318:b0:495:6d55:63ba])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00a:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49cf81f6736mr102706005e9.6.1788528628939;
 Fri, 04 Sep 2026 06:30:28 -0700 (PDT)
Date: Fri,  4 Sep 2026 13:28:54 +0000
In-Reply-To: <20260904132855.638117-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904132855.638117-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904132855.638117-2-smostafa@google.com>
Subject: [PATCH v3 1/2] KVM: arm64: Add stage2_clean_old_pte()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	qperret@google.com, linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

At the moment, the pgtable code rely on BBM in SW which looks like:
Break: stage2_try_break_pte()
	1) Break PTE and lock it
	2) TLBI
	3) Put the ref on the old PTE

Make: stage2_make_pte()
	1) Get a ref on the new PTE
	2) Install the new PTE

With BBML3, the sequence will look as
	1) Get ref on the new PTE
	2) Install new PTE
	3) TLBI
	4) Put the ref on the old PTE

Move step #2 and #3 from stage2_try_break_pte() to a new helper
stage2_clean_old_pte() so it can be re-used by BBML3.

No functional change.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 67 ++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..d670da8882a5 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -810,39 +810,10 @@ static bool stage2_try_set_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_
 	return cmpxchg(ctx->ptep, ctx->old, new) == ctx->old;
 }
 
-/**
- * stage2_try_break_pte() - Invalidates a pte according to the
- *			    'break-before-make' requirements of the
- *			    architecture.
- *
- * @ctx: context of the visited pte.
- * @mmu: stage-2 mmu
- *
- * Returns: true if the pte was successfully broken.
- *
- * If the removed pte was valid, performs the necessary serialization and TLB
- * invalidation for the old value. For counted ptes, drops the reference count
- * on the containing table page.
- */
-static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
+static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
 				 struct kvm_s2_mmu *mmu)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
-	kvm_pte_t locked_pte;
-
-	if (stage2_pte_is_locked(ctx->old)) {
-		/*
-		 * Should never occur if this walker has exclusive access to the
-		 * page tables.
-		 */
-		WARN_ON(!kvm_pgtable_walk_shared(ctx));
-		return false;
-	}
-
-	locked_pte = FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK,
-				KVM_INVALID_PTE_TYPE_LOCKED);
-	if (!stage2_try_set_pte(ctx, locked_pte))
-		return false;
 
 	if (!kvm_pgtable_walk_skip_bbm_tlbi(ctx)) {
 		/*
@@ -862,6 +833,42 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 
 	if (stage2_pte_is_counted(ctx->old))
 		mm_ops->put_page(ctx->ptep);
+}
+
+/**
+ * stage2_try_break_pte() - Invalidates a pte according to the
+ *			    'break-before-make' requirements of the
+ *			    architecture.
+ *
+ * @ctx: context of the visited pte.
+ * @mmu: stage-2 mmu
+ *
+ * Returns: true if the pte was successfully broken.
+ *
+ * If the removed pte was valid, performs the necessary serialization and TLB
+ * invalidation for the old value. For counted ptes, drops the reference count
+ * on the containing table page.
+ */
+static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
+				 struct kvm_s2_mmu *mmu)
+{
+	kvm_pte_t locked_pte;
+
+	if (stage2_pte_is_locked(ctx->old)) {
+		/*
+		 * Should never occur if this walker has exclusive access to the
+		 * page tables.
+		 */
+		WARN_ON(!kvm_pgtable_walk_shared(ctx));
+		return false;
+	}
+
+	locked_pte = FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK,
+				KVM_INVALID_PTE_TYPE_LOCKED);
+	if (!stage2_try_set_pte(ctx, locked_pte))
+		return false;
+
+	stage2_clean_old_pte(ctx, mmu);
 
 	return true;
 }
-- 
2.55.0.979.g7e5102b832-goog

