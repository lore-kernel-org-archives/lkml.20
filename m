Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08AF475350
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094958; cv=none; b=DJvw49RTmocLcY32aiqnuW9kEwOEkDVGNsUfqrtK75RwNKZPDTT+oiGw1Fz6nskGcj5p6d/PRcEGqdxm56yqzSwjRs5zvOvc5FBdmyARABeDmADO67M5qEkDtL6EWrZ73KN6G98FfaDWKNMnF5BGaLgnnkNzaBVVYNyP0wGsWUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094958; c=relaxed/simple;
	bh=S/OdhPySBRbmZocD6BWu21RnoGNGWr4Ep2msGIau+qY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VWPBg4/YLqm7SnuTL3PskZgWPwwR4IS48g3CeIYVHarjqgQXBRSBeuaswuHE7dFiFifdvYSFYnl6uwtfOxXys5uUtO7RMe4CauGY7YUreC97HVamBS1CeXv213WgQIqTcNrBv91P+S4Il1pf4MjMt46o4nhiSY+4BBHMNhCs6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+tvPNbk; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+tvPNbk"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e2da5823aso321220866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094954; x=1792699754; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5ixsAbdw/m1P57/+3HLK7jfThlRJ+tmwZshst71JoE=;
        b=Y+tvPNbkVlyJneFdop25sV/6Cc/8fC5jwwBfChBP0gwymk8V8umar8VkOZNf6A2P0t
         0YpXBtmS/i1IgGdkRcGZoW0uiHy99bK1Z2ESe+n4AfYioa3xC6OIqaJJS9y8xefhihtO
         5U5VgLGYYMj6TduK1qONgiTupeM8PmpYDwra+IXTz5n/nL5zG89ZkWeyFs4YhC/hWho2
         xfzfKyze4dE737bgpuIvXmD7Mno4e4Gvdy4DBhvvI6NSNxM/AM5D1q+sFARMHb0Meo/g
         KZa1aSCbx/FxjbFbpz5YsmkecP+8Ys2lnJQM8tnBIDnbczMHOTYPmvJYCimnsfIkadEA
         qNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094954; x=1792699754;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5ixsAbdw/m1P57/+3HLK7jfThlRJ+tmwZshst71JoE=;
        b=jAZAoJ1xH74yOQhmdA9rbF8Exry8EY/EA10c5gUuOXzNo6migWkzyUVwD8cEHiXE+X
         kryiSEr4ps9YG6oC+Y5agrrqjmFNpCXYvAlNk0sx+PTtPgsPXAWkMDoLF4Ce2LikW16k
         QIZ67GknvifuiiCzOYrn7D1eZZf3uLLhIdpmztsEHn/wBKJMOsWXY8QDnfQJDoPFPZy6
         ysh6oGAzTP3ya4W4UfZJM+zUFKrUfdMgK99TPyODj6Q0jZuyqBvcXT4XUnVTWiNNN5bf
         JXy7PdwY+pkYun9UHLdsHxlVF7i84lj0h2+Ska853tj8F+zQxGte90cQPLyZUCDxZo9b
         LW3g==
X-Forwarded-Encrypted: i=1; AKwUvBy78WVYIGOcR+z/IiNQaKCtI/R25P4iExE9A2aId5zZ7e1/T6Jkl0Y4H+ZZki/Hkg/uPtBV9xNtFhbyzxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpQVz0Efw4JqQCJY3nHzLSQ9gTwgKrXOpxYBzQVbmSHtxuAbVI
	rGWrSi15Fo7+0eI3RQ5QM6YcqwzHUn+mb+j+NNNfxHpxoREJDrNEiYI/LN2KyKsHkk/eOY8u3Tu
	bkLqOeFE0p+qQzA==
X-Received: from ejiq6.prod.google.com ([2002:a17:906:e46:b0:c37:a171:8eda])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72cd:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c40033df381mr136086766b.39.1792094953037;
 Thu, 15 Oct 2026 13:09:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:33 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-3-smostafa@google.com>
Subject: [PATCH v9 02/25] iommu/arm-smmu-v3: Move Queue and STE functions to header
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

The KVM SMMUv3 driver would re-use some of the CMDQ and STE code
inside the hypervisor. Move those functions to the header file that
would be shared between the host kernel and the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 62 --------------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 63 +++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 34e916ea339f..101ece0e38d3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -140,33 +140,6 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
 }
 
 /* Low-level queue manipulation functions */
-static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
-{
-	u32 space, prod, cons;
-
-	prod = Q_IDX(q, q->prod);
-	cons = Q_IDX(q, q->cons);
-
-	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
-		space = (1 << q->max_n_shift) - (prod - cons);
-	else
-		space = cons - prod;
-
-	return space >= n;
-}
-
-static bool queue_full(struct arm_smmu_ll_queue *q)
-{
-	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
-	       Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
-}
-
-static bool queue_empty(struct arm_smmu_ll_queue *q)
-{
-	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
-	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
-}
-
 static bool queue_consumed(struct arm_smmu_ll_queue *q, u32 prod)
 {
 	return ((Q_WRP(q, q->cons) == Q_WRP(q, prod)) &&
@@ -185,12 +158,6 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 	writel_relaxed(q->llq.cons, q->cons_reg);
 }
 
-static void queue_inc_cons(struct arm_smmu_ll_queue *q)
-{
-	u32 cons = Q_POS(q, q->cons) + 1;
-	q->cons = Q_OVF(q->cons) | Q_POS(q, cons);
-}
-
 static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
 {
 	struct arm_smmu_ll_queue *llq = &q->llq;
@@ -221,12 +188,6 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 	return ret;
 }
 
-static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
-{
-	u32 prod = Q_POS(q, q->prod) + n;
-	return Q_OVF(q->prod) | Q_POS(q, prod);
-}
-
 static void queue_poll_init(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue_poll *qp)
 {
@@ -254,14 +215,6 @@ static int queue_poll(struct arm_smmu_queue_poll *qp)
 	return 0;
 }
 
-static void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
-{
-	int i;
-
-	for (i = 0; i < n_dwords; ++i)
-		*dst++ = cpu_to_le64(*src++);
-}
-
 static void queue_read(u64 *dst, __le64 *src, size_t n_dwords)
 {
 	int i;
@@ -1817,21 +1770,6 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_master *master)
 }
 
 /* Stream table manipulation functions */
-static void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
-					  dma_addr_t l2ptr_dma)
-{
-	u64 val = 0;
-
-	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
-	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
-
-	/* Ensure the new L2 table is fully visible. */
-	dma_wmb();
-
-	/* The HW has 64 bit atomicity with stores to the L2 STE table */
-	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
-}
-
 struct arm_smmu_ste_writer {
 	struct arm_smmu_entry_writer writer;
 	u32 sid;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bb048e08d613..8c8957831286 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1284,6 +1284,69 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				bool sync);
 bool arm_smmu_erratum_repeat_tlbi_cfgi(void);
 
+/* Queue and STE functions shared between kernel and hyp. */
+static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
+{
+	u32 space, prod, cons;
+
+	prod = Q_IDX(q, q->prod);
+	cons = Q_IDX(q, q->cons);
+
+	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
+		space = (1 << q->max_n_shift) - (prod - cons);
+	else
+		space = cons - prod;
+
+	return space >= n;
+}
+
+static inline bool queue_full(struct arm_smmu_ll_queue *q)
+{
+	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+	       Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
+}
+
+static inline bool queue_empty(struct arm_smmu_ll_queue *q)
+{
+	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
+}
+
+static inline u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
+{
+	u32 prod = Q_POS(q, q->prod) + n;
+	return Q_OVF(q->prod) | Q_POS(q, prod);
+}
+
+static inline void queue_inc_cons(struct arm_smmu_ll_queue *q)
+{
+	u32 cons = Q_POS(q, q->cons) + 1;
+	q->cons = Q_OVF(q->cons) | Q_POS(q, cons);
+}
+
+static inline void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
+{
+	int i;
+
+	for (i = 0; i < n_dwords; ++i)
+		*dst++ = cpu_to_le64(*src++);
+}
+
+static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
+						 dma_addr_t l2ptr_dma)
+{
+	u64 val = 0;
+
+	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
+	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
+
+	/* Ensure the new L2 table is fully visible. */
+	dma_wmb();
+
+	/* The HW has 64 bit atomicity with stores to the L2 STE table */
+	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
+}
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.56.0.176.g3575e65682-goog

