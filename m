Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0554A7C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082811; cv=none; b=lrJs9ZkkB3Ie6gcXVK8RpupiiNpk8N5SmDErwDpNND/pPWvQ8jbOZwlv9klQHmCq/nSO1WFdbiffs6lwglrsP55V+CIwSgOxFkpL3owS2cOjrLKzWb7fR8KZwuxPwBvQBvXXXEiGXXH+g0V/V1FjJSUtc1iGd8VOIZjwMot9iiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082811; c=relaxed/simple;
	bh=BmMSrhluolb6Av9guAg0Y9lbw2f/ziZAkRd5YJsY8PU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N4+rEOeXTshatrS07+6pOLaaCz46YprhRGJEEyEWC8k19YeAfU8lDu46fnkpFhb4jlEMCfD5RFwxHkmaT9DB/RhhkgH9kR3KkZGo4MrBsulyKjSMBwK020Gf0tU8i6E52DsjSV6WQ04Hw3898rXHseKiOkgx3e6MIcwdcelNme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t7SoNnLy; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t7SoNnLy"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f4bff865cso2157250f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082804; x=1790687604; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNp5S66G25hEx/lXvBHBQ4zrD/Jw7dlUu7oI6jfC/Cc=;
        b=t7SoNnLyHtnF2zJ99Z+p+hfFAh4lP2GknvAPmPqsdKrxs+0hHHpfjNfhPj4iqr6Rob
         WiyyPUgpCuDqDOOwy+JzA4ziAfuGUtXJVasmeh+vKJ0YanV3b1W1xsTGF7sgDKgcHVxy
         5mLyXnDcS46WmK1M4cLOSX68fQuSLXZSxKOQE5vzvUHbEMlGHO6EdIodZQzA1qb6cVkj
         5smy0vQY0UuLNjlnaUIOu4XB8uuL17bIa1MZuB+hCFgQmVAPU6PRoEaoD8YpNx2JL0e/
         Mqu0gSoubVWV+JHsZEWC7ivgW8FBfMm/L/PmzgPgXOCxktXMBl9dDJJpeS8fD8miVgze
         c8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082804; x=1790687604;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNp5S66G25hEx/lXvBHBQ4zrD/Jw7dlUu7oI6jfC/Cc=;
        b=u8pGexFEdKnd7HdenrzvBO8Ihp94cnx4rnKLhDTAvWY/c8bOmCYe9NpxbiNLeota04
         jCo/PUKmcLM3vkGRTxwBNw2qZojNFClzBVQKwuaIu1T7Bey8zbiknd2uNtDxTv0NbmjJ
         YKyS8QHBwMYnWT5jcglpBi8D67k+hA1+Lm+7/C+KE3QznejEHPa8H//qNtHQlENN5NKB
         4kNyB4KL8pYnHdppAElIXzDAEmvNMhHxsmd25efX0EH1DIk4ebMc926XjUUdbDi28BYH
         D2K4CZxxk5ytnHDteS5G5I3BVEBBZ1GubdyX/kiNHyz0XIxXc2yXcE11uml4I0WsuNoJ
         7GBA==
X-Forwarded-Encrypted: i=1; AKwUvBxsBmbpL89AyWwM48bgYM+kz8qifvw2lHfiPCUAOWvJUC2yH12fSXe5PxlB7Mcxt+8Wl3X2+uaQROQnE44=@vger.kernel.org
X-Gm-Message-State: AFuF++lLSu3RMYQlTsDxUkbyfpFenfRuAD7A4qIgug/T3B9lRdvkhMWy
	ONmEQO7In/FzJgPn8xjXjxcfHUoxb+uf5UUePr3zpbNB/4b22gRBEZlZVmgQBF58rMbsycBX4oT
	orP8SvWZdQlHsIw==
X-Received: from wmbg12.prod.google.com ([2002:a05:600c:a40c:b0:499:bc15:b29b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c7:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fc5726cfcmr270659405e9.11.1790082804465;
 Tue, 22 Sep 2026 06:13:24 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:51 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-19-smostafa@google.com>
Subject: [PATCH v8 18/25] iommu/arm-smmu-v3-kvm: Shadow STEs
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Add STE emulation, when the host sends the CFGI_STE command.

Copy the STE as is to the shadow owned by the hypervisor,
which is the one seen by HW.
In the next patch, stage-2 page table will be attached.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 124 +++++++++++++++++-
 1 file changed, 118 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 54049b8b1363..cb9aa7e4a394 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -24,6 +24,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 #define strtab_split(smmu)	(FIELD_GET(STRTAB_BASE_CFG_SPLIT, (smmu)->host_ste_cfg))
 #define strtab_l1_size(smmu)	((1UL << (strtab_log2size(smmu) - strtab_split(smmu))) * \
 				 (sizeof(struct arm_smmu_strtab_l1)))
+#define strtab_hyp_base(smmu)	((smmu)->features & ARM_SMMU_FEAT_2_LVL_STRTAB ? \
+				 (u64 *)(smmu)->strtab_cfg.l2.l1tab :\
+				 (u64 *)(smmu)->strtab_cfg.linear.table)
 
 #define for_each_smmu(smmu) \
 	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
@@ -287,6 +290,91 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
+				struct arm_smmu_ste *host_ste_out)
+{
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	struct arm_smmu_strtab_l1 host_l1_desc;
+	struct arm_smmu_strtab_l2 *l2ptr;
+	phys_addr_t host_l2_tab;
+	int ret, i;
+
+	host_l1_desc.l2ptr = READ_ONCE(host_ste_base[arm_smmu_strtab_l1_idx(sid)]);
+	if (!(le64_to_cpu(host_l1_desc.l2ptr) & STRTAB_L1_DESC_SPAN))
+		return -EINVAL;
+
+	host_l2_tab = le64_to_cpu(host_l1_desc.l2ptr) & STRTAB_L1_DESC_L2PTR_MASK;
+	/* Share and pin the table before accessing it. */
+	ret = smmu_share_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2));
+	if (ret)
+		return ret;
+
+	l2ptr = hyp_phys_to_virt(host_l2_tab);
+
+	for (i = 0; i < STRTAB_STE_DWORDS; ++i)
+		host_ste_out->data[i] =
+			READ_ONCE(l2ptr->stes[arm_smmu_strtab_l2_idx(sid)].data[i]);
+
+	WARN_ON(smmu_unshare_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2)));
+	return 0;
+}
+
+static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	int ret, i;
+
+	/* Leaf = 0 is not supported, as the kernel driver. */
+	if (!leaf || !is_smmu_enabled(smmu) ||
+	    (sid >= (1UL << strtab_log2size(smmu))))
+		return -EINVAL;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)) {
+		struct arm_smmu_ste *hyp_table = (struct arm_smmu_ste *)hyp_ste_base;
+		u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+		struct arm_smmu_ste *host_table = (struct arm_smmu_ste *)host_ste_base;
+
+		if (sid >= cfg->linear.num_ents)
+			return -E2BIG;
+
+		hyp_ste_ptr = &hyp_table[sid];
+		host_ste_ptr = &host_table[sid];
+	} else {
+		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (l1_idx >= cfg->l2.num_l1_ents)
+			return -E2BIG;
+
+		host_ste_ptr = &host_ste_copy;
+		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		if (ret)
+			return ret;
+
+		/* No hypervisor entry, first time the L2 is populated. */
+		if (!l1tab[l1_idx].l2ptr) {
+			struct arm_smmu_strtab_l2 *l2table;
+
+			l2table = pkvm_iommu_alloc_pages(get_order(sizeof(*l2table)));
+			if (!l2table)
+				return -ENOMEM;
+			/* Ensure L2 is observed before writing the ptr. */
+			dma_wmb();
+			arm_smmu_write_strtab_l1_desc(&l1tab[l1_idx], hyp_virt_to_phys(l2table));
+		}
+		l2ptr = hyp_phys_to_virt(le64_to_cpu(l1tab[l1_idx].l2ptr) &
+				STRTAB_L1_DESC_L2PTR_MASK);
+		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+
+	for (i = 0; i < STRTAB_STE_DWORDS; ++i)
+		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
+	return 0;
+}
+
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
@@ -406,8 +494,24 @@ static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *comman
 
 	switch (type) {
 	case CMDQ_OP_CFGI_STE:
-		/* TBD: SHADOW_STE*/
+	{
+		u32 leaf = FIELD_GET(CMDQ_CFGI_1_LEAF, command[1]);
+		u32 sid = FIELD_GET(CMDQ_CFGI_0_SID, command[0]);
+		int ret;
+
+		/*
+		 * If STE update is required, flush the CMDQ and drop the lock as that
+		 * might require to update the host page table and acquire its lock.
+		 */
+		writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+		hyp_spin_unlock(&smmu->hw_lock);
+		ret = smmu_reshadow_ste(smmu, sid, leaf);
+		hyp_spin_lock(&smmu->hw_lock);
+		if (ret)
+			return true;
+
 		break;
+	}
 	case CMDQ_OP_CFGI_ALL:
 	{
 		/*
@@ -624,25 +728,33 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			val = smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_STRTAB_BASE:
+		if (len != sizeof(u64))
+			break;
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			if (is_smmu_enabled(smmu))
 				break;
 			smmu->host_ste_base = val;
+			goto out_ret;
+		} else {
+			val = smmu->host_ste_base;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
 	case ARM_SMMU_STRTAB_BASE_CFG:
+		if (len != sizeof(u32))
+			break;
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			if (is_smmu_enabled(smmu))
 				break;
 			smmu->host_ste_cfg = val;
+			goto out_ret;
+		} else {
+			val = smmu->host_ste_cfg;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
+	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_GBPA:
 		mask = read_write;
 		break;
-- 
2.55.0.1082.g2b9226bbc0-goog

