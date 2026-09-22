Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F84549376
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082802; cv=none; b=KKcHfBoVgLwQ1l1JWDN68QpPQ1Xbj+deamPkVDrg0FAnG/TzGDXSkEVDGoUfT6Cd9SeP2VBSMJcANFfcOmRszena3HuRcw0mr+yzIOPrx/duVovabWKwMI6CMsUtLahRHH2QyZO4rdAT1J/PRS6z1uAH8fU4l/+gEY3rgglrQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082802; c=relaxed/simple;
	bh=Z6nvWlZl6ZyRFq5nMq8MrPqbtp24BhsCJ+lfiJMwhHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rlf0auV7yeaYu1ESvBVYvocTRi3yDEemwE6C27KPyLoyY1FLWkzvzhghQO2f7rCPSvW76uUM4aUyDe6Ts9vfkgBGVlme6yV+FfKQ+dpaErc0wGT9aGGguHLAYHH1UvMCjW+hV6jrdHktLmSQTOlyrbH6fwym9xxQW5CHN5AZ+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=au5/xoXo; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="au5/xoXo"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2967165d94so255366566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082797; x=1790687597; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvoQA8X3jDn0rRsmVdAwT+tCU9aeM3PwPyd0xfJ5Z9Q=;
        b=au5/xoXoYXTZuJb6xtpXlkeYznKKezyLyUICnqERQPk46+wi9ekq7LodZo+VzLfjPr
         VZXBe+tjFpGxO6LJsUjr5LbMQD+xJh3vhxz62dFtPJHw+EHLMrsZXBmnjsD4DrdGxvPJ
         x2ORnD7RjWeaW+lt503UER5iVsG5NW826432dqrkLK+Ns2diPcVSsvexvg1D5tgKowgZ
         0/jvjv1CKm/s/wOH7ggJ7wVlm3znfASi8Xbsdr/xxBadnjREv+HY340Xlk7dzKzNMJ4Y
         z3cjDDTX3xMHHeB4ZBuQ1SLszk9CNDlmZYfpqfI2710BvueUsngDzp+t5r897QSdzLez
         uwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082797; x=1790687597;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvoQA8X3jDn0rRsmVdAwT+tCU9aeM3PwPyd0xfJ5Z9Q=;
        b=JrEqBqPx5IbjoBjHLGxFQzdiCuKnomq0/1MmPdSLBtwEg1bbbmPXZa/7zsNCvuyQwq
         U7Ptp9O+kSVp/csrf3SJxVGd77XpevufhO931nCKZ915gFG8Q0rC2l83T2SzgkM2SN/L
         V4iWCduyYjPlHFuMzVTQSR7IdvpEarBmjjjFMeq1VEBadCIcp0vsOgH1JQQ3VTedZ+Jm
         WiuK4C/VzOGmtoqfNRLgY/8sOgm9gdTXKE6pwOSnl9yJwPXdFkqcRnov9dsLjnEus5NU
         Sso1mvz0DRu2zHKw5E92iTjjbZi0tcEoWWAmxGHPotr5sNHx73rM+Ugm+o0oh7QBuZHd
         ZKAw==
X-Forwarded-Encrypted: i=1; AKwUvBzCqF5L5m85LJcABAXfBA3BSIX123X17258mX97I7sIzPO6GGH1i+AITyvo4kOxzOFzHvyHUTPSz5cJy3g=@vger.kernel.org
X-Gm-Message-State: AFuF++nR/fTwFKkovHDYTvWp07v0svjFLjVAXkubNKpKK8DHVcuuAIgG
	0j/SsU1N1LneBO4tp0aP6c3nEAv0RPBV2XjDzwRVPDpSRMLXIkPCE6a0YahwhaUQJzcF6qlX07x
	4vdcO9e7w4Ez6AQ==
X-Received: from ejra17.prod.google.com ([2002:a17:906:4691:b0:c26:2953:6831])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9620:b0:c29:3821:ae6c with SMTP id a640c23a62f3a-c2a15b94662mr1235917766b.37.1790082796869;
 Tue, 22 Sep 2026 06:13:16 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:45 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-13-smostafa@google.com>
Subject: [PATCH v8 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
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

Probe SMMU features from the IDR register space. Most of
the logic is common with the kernel.

The hypervisor enforces 2 extra requirements:
- Cache coherency.
- Nested translation support.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  4 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 47 +++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 17b9454dab85..91177f00fa97 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -11,6 +11,9 @@
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
+ * @oas			PA size
+ * @pgsize_bitmap	Supported page sizes
+ * @sid_bits		Max number of SID bits supported
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -20,6 +23,7 @@ struct hyp_arm_smmu_v3_device {
 	u32			options;
 	unsigned long		oas;
 	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 7022d38e75c4..f8b7c5406017 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -29,6 +29,47 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = NULL;
 }
 
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		return -EINVAL;
+
+	reg = arm_smmu_idr0_probe(smmu);
+
+	if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64))
+		return -ENXIO;
+
+	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE)))
+		return -ENXIO;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
+	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL))
+		return -EINVAL;
+
+	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
+	/* Follows the kernel logic */
+	if (smmu->sid_bits <= STRTAB_SPLIT)
+		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	arm_smmu_idr3_probe(smmu);
+
+	arm_smmu_idr5_probe(smmu);
+	if (!smmu->oas)
+		smmu->oas = 48;
+
+	arm_smmu_device_iidr_probe(smmu);
+
+	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
+		return -ENXIO;
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -43,8 +84,14 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 		return ret;
 
 	smmu->base = (void __iomem *)haddr;
+	ret = smmu_probe(smmu);
+	if (ret)
+		goto out_ret;
 
 	return 0;
+out_ret:
+	smmu_deinit_device(smmu);
+	return ret;
 }
 
 /* Called while is the host is still trusted. */
-- 
2.55.0.1082.g2b9226bbc0-goog

