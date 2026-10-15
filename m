Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918847B406
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094955; cv=none; b=i+lKu/OPl5DbBiDYBt6x+sy5DYVBe2qCrPdfXFHSJ1HYfOQ3sdFXoWP74UbqHJpTYafFE42Pg+/RJ0iqNjx8MXOMKN8UauBj77k1/5ljl8q3nL75Uz8Syj54lPabh6LxLBYS2j1442cDJENEBG6yoexB5Hcxo9v6VNKOFoyre0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094955; c=relaxed/simple;
	bh=YxLFkA27bOezQ/xTbhKCXlt4eRe3P5CCTBEyjjxxyRk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bgYN5Ocz/xKuY1dhlQAkFTHCaI6UAdiVVnrhk40Ht1j3Lb08USx4dOewJp/V9VtdRD7JwY0QcrxJXEIUMOMIC9yebpbZcGB/vshH/qkVeSKFzeXtOh1z5/W8+st3s4FtOHlq1apovMtgpm5EVWcNQn4KL7iJOof1f74uhWT3opc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLICnJmB; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLICnJmB"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17e77c5b1so20420895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094952; x=1792699752; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMjLsiB8JUe1zn3H8B72Qby1JQXygMn6MqjBzblWNdg=;
        b=PLICnJmBaS49fe6uqgrMfdDKWx+8HdJWh9SlOx79Ka+f/eWiIcUuMbi4tbnGpEPykR
         3BE4jrEO/usoLxHeaO584k+90z4766t4mr4kYNd9ggF3I10ELAJl4gpADQ9tL3k62gEh
         AqWBxbZYktKBo8R7OZMx2S+Ail1ccKHR7bJyFPDeTRUfx7UupZ4uS77EAXAOea+scLBm
         AUenYCcyL3kX3S+1qrqr5FA+HNVW/klGo9IQY+fezNAL0v68Vcge2xawoTeLbfBvbnMq
         vI9wqKJd60JC3br3YCU4OxyjqsQPUOHznoaHXPSHpiZ7Pqcyw1X99J277Nvv5J5h/8IE
         YoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094952; x=1792699752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMjLsiB8JUe1zn3H8B72Qby1JQXygMn6MqjBzblWNdg=;
        b=v/Fb2Npixq77et7G4WppE8lTlUixAT3vEiRUU/aSHnO42u24xJ4KnxVyXMJ2VP67y6
         o6oAwENdL+gKg2kRzqSFh2wrRHZYDMwWDEd4wPetTy7Ugvc5YYzE2l7iLONTfD/Vco/+
         Qgr/4e0nUA+2nxv3WP6TgPyCi/355hKyV9jG8tmvZB8tPkY1LLXmofAN32ucnDDN3OdY
         S8XhdtOyCVpi+u65M+twNorhFZ96Voy4ldo+ZtbrAF7jaKrVec10Iz4YshgwlOE1FI1T
         ahBotHy9a3cJjugapPiirAK873tBgDpo4ocGYqeIgqadVNAioWlHb7U1rVw+5JIg5yDa
         Qjyw==
X-Forwarded-Encrypted: i=1; AKwUvByorC+2hqKBobLS19YDJ7dw7ImlGklr6ictg/4lHcjcfanFIaVNo4R7Qa+HM9muttfx569fn2q5RVhE+6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgosPQDq8qiviHHTvhp77JbTMf+E8V6lscAq/b5clML/LhQO94
	0kzqzUt8P1y2gNwTOn6dmh1HVkNFrmbPju1jq/wgE4TGhQm7iU0r22BHC7JQuhcwyczlVM9KDY0
	r2bxjQlsynwxKzQ==
X-Received: from wmbd18.prod.google.com ([2002:a05:600c:58d2:b0:4a1:7ec4:6621])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:17:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a196637a39mr305024695e9.34.1792094952096;
 Thu, 15 Oct 2026 13:09:12 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:32 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-2-smostafa@google.com>
Subject: [PATCH v9 01/25] KVM: arm64: Donate MMIO to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Add __pkvm_host_donate_hyp_mmio() so IOMMU drivers in the hypervisor can
take ownership of the IOMMU MMIO. The range is mapped in the hypervisor
private range and annotated as owned by the hypervisor in the host
stage-2, so host accesses fault and further donations of the same range
are refused. MMIO has no struct hyp_page, so the annotation is the only
state, and a dedicated function is simpler than teaching the memory
donation path about MMIO. Donation is only allowed before the host is
de-privileged, which is when the hypervisor IOMMU drivers initialise.

Make kvm_pgtable_stage2_unmap() leave invalid counted PTEs (annotations)
in place. host_stage2_unmap_dev_all() unmaps all non-memory ranges to
recycle page-table pages under memory pressure, and would otherwise drop
the annotation and let the host fault the MMIO back in. No caller depends
on the old behaviour: host_stage2_unmap_dev_all() only covers non-memory
ranges, where no annotation existed until now, and the guest unmap paths
check that the PTE is valid first. Returning an error for counted PTEs
instead is not an option, as a non-zero visitor return stops the walk,
which would abort recycling at the first hypervisor-owned MMIO page and
inject an abort into the host for an unrelated address.

Add __pkvm_hyp_donate_host_mmio() for the IOMMU driver error path. It
unmaps the range from the hypervisor and maps it back in the host
stage-2. The private VA range cannot be reclaimed and is leaked, as with
every other failed private mapping.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h          |  2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 10 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 99 ++++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c                  |  8 +-
 4 files changed, 112 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..20b1adb8a058 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -713,6 +713,8 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * freed. Unmapping a cacheable page will ensure that it is clean to the PoC if
  * FWB is not supported by the CPU.
  *
+ * Invalid counted PTEs (annotations) are left in place.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ec85a9547120..c9c3e2dbbe58 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,16 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+/*
+ * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
+ * private range and unmapped from the host stage-2.
+ */
+int __pkvm_host_donate_hyp_mmio(u64 pfn, u64 nr_pages, unsigned long *haddr);
+/*
+ * Undo __pkvm_host_donate_hyp_mmio(), typically on an error path. @haddr is
+ * the address returned by the donation.
+ */
+int __pkvm_hyp_donate_host_mmio(u64 pfn, u64 nr_pages, unsigned long haddr);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a6a47c1e058b..75d250ca809c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -385,7 +385,11 @@ static int host_stage2_unmap_dev_all(void)
 	u64 addr = 0;
 	int i, ret;
 
-	/* Unmap all non-memory regions to recycle the pages */
+	/*
+	 * Unmap all non-memory regions to recycle the pages.
+	 * That relies on kvm_pgtable_stage2_unmap() not clearing
+	 * counted PTEs which include hypervisor MMIO.
+	 */
 	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
 		reg = &hyp_memory[i];
 		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
@@ -1146,6 +1150,99 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+int __pkvm_host_donate_hyp_mmio(u64 pfn, u64 nr_pages, unsigned long *haddr)
+{
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
+	unsigned long addr;
+	kvm_pte_t pte;
+	u64 offset;
+	int ret;
+
+	/* Only before de-privilege. */
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
+	host_lock_component();
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(phys + offset)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (pte && !kvm_pte_valid(pte)) {
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+
+	ret = __pkvm_create_private_mapping(phys, size, PAGE_HYP_DEVICE, &addr);
+	if (ret)
+		goto unlock;
+
+	/*
+	 * Mark the range as owned by the hypervisor in the host stage-2.
+	 * The annotation makes host accesses fault, and is retained by
+	 * host_stage2_unmap_dev_all()
+	 */
+	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
+			      phys, size, &host_s2_pool,
+			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
+			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
+	if (ret) {
+		hyp_lock_component();
+		WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, addr, size) != size);
+		hyp_unlock_component();
+	} else {
+		*haddr = addr;
+	}
+unlock:
+	host_unlock_component();
+	return ret;
+}
+
+int __pkvm_hyp_donate_host_mmio(u64 pfn, u64 nr_pages, unsigned long haddr)
+{
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
+	kvm_pte_t pte;
+	u64 offset;
+	int ret = 0;
+
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
+	host_lock_component();
+	hyp_lock_component();
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(phys + offset)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (!host_stage2_pte_is_hyp_owned(pte)) {
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, haddr, size) != size);
+	WARN_ON(host_stage2_idmap_locked(phys, size, PKVM_HOST_MMIO_PROT));
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+	return ret;
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..58b74450c824 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1161,13 +1161,9 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	kvm_pte_t *childp = NULL;
 	bool need_flush = false;
 
-	if (!kvm_pte_valid(ctx->old)) {
-		if (stage2_pte_is_counted(ctx->old)) {
-			kvm_clear_pte(ctx->ptep);
-			mm_ops->put_page(ctx->ptep);
-		}
+	/* Invalid PTEs are left in place, including annotations. */
+	if (!kvm_pte_valid(ctx->old))
 		return 0;
-	}
 
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp = kvm_pte_follow(ctx->old, mm_ops);
-- 
2.56.0.176.g3575e65682-goog

