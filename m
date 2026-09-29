Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272CE399354
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666405; cv=none; b=g5496kItgDTnqZ0sShw0mNu34pIZMWK9hIM1U7ujvmtfvMUWUpWsCkfmyovys9aS8oM8hDLdPsAecMFvJ1weBDyuALdRyZF6Zx9HtFES6/AI13t5wMLuZYCpB38Wb3Kb+/v/9uRYl1AKe331APjmhKXXGkzRmGTKIjDFVuZGhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666405; c=relaxed/simple;
	bh=1TweBgm7chtQbs05r6X0a8/+z/XlG7SB0Ucx1nbozIY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=un5NdQk5zXRrXW8ZNMiKU6OIhKaKlT8Z2fb1ukheUbhtpC4xAm3yC0at++TuTGobMKP/cuJk9zYtCbQQ/zZBPieCY2l9tsOd2Kh9JA68vOKftJloxS24MZ4ismUJqE17JNqh/7CT5u8plKvXzNftn0ns3VKPbBIqu7gWCgi0o+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fJSMwPIP; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fJSMwPIP"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso26298265ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790666403; x=1791271203; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRnyONsjTJbkTxhyik3N20LZxPVoNoJ2Z/LPgYbbOw0=;
        b=fJSMwPIP0fWMenXQbv5brmu/hKQ1KfaeBK+51k8wKveL6G3eVC9PsDF/orB759iq0z
         Ty0rJyL9cKfD+AZJQWzm2uOmfzWJB3Xfd4DQrzWk+b/rGRBm2iaOV9v3kbUECArWOJhN
         Tz7GgQvMvmkxVnzafslV6Z4faxr1HziV0TAPCXS8s5DKpqHW9Lw1bPRDGIcgQJVuYSUS
         uvuVFR7lw678JC7buUjiTH33RffgJtqhkc4wCRRFUEwSWqXg9gdi4MGVfTvmHeQn+kO8
         VZU3pqWp8z4pvZGoGYkjx1v0G9e8QEU/H68M5Q+iEo3vdXoT6DuBoKTyPyAb7Ll+lAp9
         3yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666403; x=1791271203;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRnyONsjTJbkTxhyik3N20LZxPVoNoJ2Z/LPgYbbOw0=;
        b=MXa4ZWDCFkBD5SpnL3M8ieGHrAYbGY8ULAM86PrIscLk8nyeBZhJQQHrdT/ldwqPQi
         7WyAU2vg9fyCsipEgxx7qj2xOZbSxMP/CjblTtbma9ClxH3SDmY9Mywqc7qKWsUdiOVy
         AOhS6kfvwkPbLzobz2128KLNO7XEL+RrR1PvYNXxQ94nVlD8dRO9MCl8G4X1cvN7RwuO
         XBsvP3/dtzKC0q5Rv3spr8CTewXW2XsgKlpvVoAuMTyaNomuifKQX+zrF9AdfiVVcIyu
         LWmbA+pib6Im3u5KeVEqbt0/MwM1Ad05H/hxOIBPXGwULlqRcbBdYaZtsmqJl5QDCjgV
         cETQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU8l/mwbr8sGnSDXAxk8uhBTce22QiMBzNItK9RqyFtCct11RrOrCRLOAb/gvJyg/Ak38LKr+X7h+/vIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIvkQ53ygyVOi2Ho/VBTy/jTRyYcqudXpiyrHEqYStJ1ApdfNt
	yV8JRklWT5e22XF40pCWbvWarnMuluFLPXlSdo5eDQEdYm7AXArRJZGJfwcJbJf95OVdm14EXl/
	Z9A==
X-Received: from plbjk15.prod.google.com ([2002:a17:903:330f:b0:2e2:bc36:1c7b])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c40b:b0:2df:84e0:902f
 with SMTP id d9443c01a7336-2df84e098a5mr113133195ad.9.1790666403094; Tue, 29
 Sep 2026 00:20:03 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:19:45 +0000
In-Reply-To: <20260929071950.2710070-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929071950.2710070-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929071950.2710070-5-praan@google.com>
Subject: [RFC PATCH v1 4/9] iommu/arm-smmu-v3: Implement Live Update Stream
 Table restoration
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

During the boot phase of a Kexec Handover (KHO), the incoming kernel
must adopt the preserved SMMU Stream Table to seamlessly inherit the
IOMMU state from the outgoing kernel.

Restore it in arm_smmu_init_strtab() using the kexec helpers to validate
the live STRTAB_BASE{,_CFG} and reserve the in-use ASIDs/VMIDs. Enable
ARM_SMMU_V3_KEXEC for IOMMU_LIVEUPDATE for this.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/Kconfig                     |   2 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c  | 142 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   4 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   6 +
 4 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index ad1693e3b9c8..8f98d3ad984a 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -113,7 +113,7 @@ config ARM_SMMU_V3_IOMMUFD
 
 # Common helpers for a kexec'd kernel, e.g. kdump adoption and live update
 config ARM_SMMU_V3_KEXEC
-	def_bool CRASH_DUMP
+	def_bool CRASH_DUMP || IOMMU_LIVEUPDATE
 
 config ARM_SMMU_V3_KUNIT_TEST
 	tristate "KUnit tests for arm-smmu-v3 driver"  if !KUNIT_ALL_TESTS
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
index 38b9d4e4ab4d..4998234e1e7a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
@@ -429,4 +429,146 @@ void arm_smmu_unpreserve(struct iommu_device *iommu,
 		arm_smmu_unpreserve_strtab_linear(smmu, iommu_ser);
 }
 
+static int arm_smmu_liveupdate_restore_strtab_2lvl(struct arm_smmu_device *smmu,
+						   struct iommu_hw_ser *iommu_ser,
+						   u32 cfg_reg, phys_addr_t base)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 num_l1_ents, i;
+	u64 *l2_states;
+	int ret;
+
+	if (!iommu_ser->smmuv3.l2_strtab_lu_states_phys)
+		return -EINVAL;
+	l2_states = phys_to_virt(iommu_ser->smmuv3.l2_strtab_lu_states_phys);
+
+	ret = arm_smmu_kexec_parse_strtab_2lvl(smmu, cfg_reg, base,
+					       &num_l1_ents);
+	if (ret)
+		goto out_free_states;
+	cfg->l2.num_l1_ents = num_l1_ents;
+
+	ret = -ENOMEM;
+	cfg->l2.l1tab = dmam_restore_coherent_allocation(smmu->dev,
+			num_l1_ents * sizeof(*cfg->l2.l1tab), &cfg->l2.l1_dma,
+			GFP_KERNEL, iommu_ser->smmuv3.l1_strtab_lu_state);
+	if (!cfg->l2.l1tab)
+		goto out_free_states;
+
+	cfg->l2.l2ptrs = devm_kcalloc(smmu->dev, num_l1_ents,
+				      sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
+	if (!cfg->l2.l2ptrs)
+		goto out_free_states;
+
+	/* The outgoing .shutdown cleared the L1 STDs of unpreserved L2 tables */
+	for (i = 0; i < num_l1_ents; i++) {
+		u64 l1_desc = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
+		phys_addr_t l2_base;
+		dma_addr_t l2_dma;
+
+		ret = arm_smmu_kexec_check_strtab_l1_desc(smmu, l1_desc, i,
+							  &l2_base);
+		if (ret == 1)
+			continue;
+		if (ret)
+			goto out_free_states;
+
+		if (!l2_states[i]) {
+			dev_err(smmu->dev, "L1[%u] has no preserved L2 table\n",
+				i);
+			ret = -EINVAL;
+			goto out_free_states;
+		}
+
+		l2_dma = l2_base;
+		cfg->l2.l2ptrs[i] = dmam_restore_coherent_allocation(smmu->dev,
+				sizeof(*cfg->l2.l2ptrs[i]), &l2_dma, GFP_KERNEL,
+				l2_states[i]);
+		if (!cfg->l2.l2ptrs[i]) {
+			ret = -ENOMEM;
+			goto out_free_states;
+		}
+	}
+	ret = 0;
+
+out_free_states:
+	kho_restore_free(l2_states);
+	return ret;
+}
+
+static int
+arm_smmu_liveupdate_restore_strtab_linear(struct arm_smmu_device *smmu,
+					  struct iommu_hw_ser *iommu_ser,
+					  u32 cfg_reg, phys_addr_t base)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 num_ents;
+	int ret;
+
+	ret = arm_smmu_kexec_parse_strtab_linear(smmu, cfg_reg, base,
+						 &num_ents);
+	if (ret)
+		return ret;
+	cfg->linear.num_ents = num_ents;
+
+	cfg->linear.table = dmam_restore_coherent_allocation(smmu->dev,
+			num_ents * sizeof(*cfg->linear.table),
+			&cfg->linear.ste_dma, GFP_KERNEL,
+			iommu_ser->smmuv3.l1_strtab_lu_state);
+	if (!cfg->linear.table)
+		return -ENOMEM;
+	return 0;
+}
+
+/*
+ * Take over the stream table left programmed by the previous kernel and
+ * reserve the ASIDs/VMIDs used by the preserved STEs. Returns -ENOENT if
+ * nothing was preserved for this SMMU.
+ */
+int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu)
+{
+	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
+	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
+	bool is_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
+	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
+	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
+	struct iommu_hw_ser *iommu_ser;
+	int ret;
+
+	iommu_ser = iommu_get_preserved_data(smmu->base_phys, IOMMU_ARM_SMMUV3);
+	if (!iommu_ser)
+		return -ENOENT;
+
+	if (cfg_reg != iommu_ser->smmuv3.strtab_base_cfg) {
+		dev_err(smmu->dev, "STRTAB_BASE_CFG changed across live update\n");
+		return -EINVAL;
+	}
+
+	/* The preserving kernel always uses a 2-level table when supported */
+	if (fmt == STRTAB_BASE_CFG_FMT_2LVL && is_2lvl)
+		ret = arm_smmu_liveupdate_restore_strtab_2lvl(smmu, iommu_ser,
+							      cfg_reg, base);
+	else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR && !is_2lvl)
+		ret = arm_smmu_liveupdate_restore_strtab_linear(smmu, iommu_ser,
+								cfg_reg, base);
+	else
+		ret = -EINVAL;
+	if (ret) {
+		dev_err(smmu->dev, "failed to restore stream table: %d\n", ret);
+		return ret;
+	}
+
+	/* Keep new domains off the ASIDs/VMIDs used by the preserved STEs */
+	ret = arm_smmu_kexec_scan_and_resv_ids(smmu);
+	if (ret) {
+		dev_err(smmu->dev, "failed to reserve in-use ASIDs/VMIDs\n");
+		arm_smmu_kexec_unresv_ids(smmu);
+		return ret;
+	}
+
+	dev_info(smmu->dev, "restored preserved %s stream table\n",
+		 is_2lvl ? "2-level" : "linear");
+	return 0;
+}
+
 #endif
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ae4a1c98228c..c8bcf901f1c8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4772,6 +4772,10 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 	    !arm_smmu_kdump_adopt_strtab(smmu))
 		return 0;
 
+	ret = arm_smmu_liveupdate_restore_strtab(smmu);
+	if (ret != -ENOENT)
+		return ret;
+
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 7bce5bbe75e5..6b75f48671f8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1208,6 +1208,12 @@ void arm_smmu_unpreserve_device(struct device *dev,
 				struct iommu_device_ser *device_ser);
 void arm_smmu_unpreserve(struct iommu_device *iommu,
 			 struct iommu_hw_ser *iommu_ser);
+int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu);
+#else
+static inline int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu)
+{
+	return -ENOENT;
+}
 #endif
 
 static inline void arm_smmu_domain_free(struct arm_smmu_domain *smmu_domain)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

