Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6FC599A24
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094989; cv=none; b=kRa9ZiSjxW9aagWK37YieQiQKlhn88Nlmgw9OXgnfzGtfggr9MB+M9kdzw81ityyxYwBWJE/8jl2/l9EqJpqy4/QWSrDqoSqXIEcD8jecPcm7Ycp6g9fClgze9KTJlSnGfS/i2pz70+gtOfQ/Fc6aM5R71oVx5KBQp/GOh+Vf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094989; c=relaxed/simple;
	bh=tBz432yZOVanKRViYqmo2mhM8D8MdHrMDagSLSsS7Ac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gCRlwi/C4uEV3073FnHJmw/HNL6xAQjf4MjCApLbRShKuUPxO3mVIS/M1nHelSR1qpNpH3920S7MUrrlVSbUbogGYw4/sMAI98JwwWf9ytuYMcLqI4qSD4azkE5nqeQnU0rPd6WrqlT18bPC70IzTOX/VzA2W6YwkGsWZIwTRrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7x7ztuU; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7x7ztuU"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48af5a07314so3622099f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094980; x=1792699780; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXSBGll6V5AX0HAYiKE1Rqp8ZLXo/cvuVZr8HoLMmEg=;
        b=r7x7ztuUiOQNNtrRJ2IpLQc+yP2MgVRM3mxDHCaEZWehLsPNviB/WIB7WvUxyzd9wx
         iJ6rSyaJlj3Ax8YjhL9GyCDEmI49GxYzb3mCErY5QtQdPGpghA33RRE5omDmLnY0RKIg
         VYwTicPfX6YYUJSVjzZzqAd1R3EuZJ/FY46lBuVjPrE6VEyLqXzxdRoVL9GBe8ucfPeC
         sxtTKZOE1/Rv6z7G1R/ZDMEc6Ynd63SewGejHqQtGInYTwavACrYTeXccA6Gr2YqIPLX
         tYQOcCCQ4jMUx69wAZHRqWw/U3PnhGU6rsyjcXWGAN8dv5p3ni/5JMdJuHu8AmC+E0Br
         EFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094980; x=1792699780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXSBGll6V5AX0HAYiKE1Rqp8ZLXo/cvuVZr8HoLMmEg=;
        b=OcjoR1sh8/PdFBt3ifWsY69hsR1RtVeFsFhKFMf7XxvjKcl++1sGm20incd0DMXKNP
         j/QORS8jp2LNq4RR7GytM7wli5j5/+7sR/wo4LDtM6KBlH2Fu/0XFi/Pxg1nP1Zbrj+p
         +QEHWqijmBMvTdF5/rKNwJ6pjecE7h1eknHnvGPayxinxMI+jgpR+CCy69VXfLeWoARt
         wWNZdgndWaTJMKoEGX9hhiEWlrGVoYPxyXwb2DPlafKZ6D2HZsr1HVtnW01QGCU0K3HH
         QOJFiTsI4kqPndIF9JNNYDG1IqSifUkqhG3tJJ0M+jKbY10IXc3ofwOL687KJC7h2aJp
         NiwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhf45eoZzVjzYYTGL02Gwj1MEBSUkzMFbq93S/Wpc5aUUQ8/8CkTKsNpqk5WyojMjnjuWoVNDiTfuCLv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Y50XJ/87qTJIEl3PtEKArRtcBA/ntdYpn5/oOZlqroAPUH95
	RxjG+koIJCrUR2EZ7/UauteW4PCDCxMhu3WlxMtnoPnSFQA92yM8xexvMhzmxa3TCyE9EoELuQt
	ow+8fYq3x7RqlPA==
X-Received: from wmjs1.prod.google.com ([2002:a7b:c381:0:b0:4a1:ae53:2feb])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcb:b0:4a0:1fe2:d4f1 with SMTP id 5b1f17b1804b1-4a18e4d1686mr397679435e9.28.1792094980042;
 Thu, 15 Oct 2026 13:09:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:55 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-25-smostafa@google.com>
Subject: [PATCH v9 24/25] iommu/arm-smmu-v3-kvm: Enable nesting
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

As now the hypervisor controls the command queue, stream table,
and shadows the stage-2 page table, we enable stage-2 translation
in case the host puts an STE in bypass or stage-1.

The hypervisor will control the S2 part of the STE and sanitize it.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 112 +++++++++++++++++-
 1 file changed, 106 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 01f23fce6be5..3562bb222f53 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -443,6 +443,60 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_attach_stage_2(struct hyp_arm_smmu_v3_device *smmu,
+			       struct arm_smmu_ste *ste)
+{
+	unsigned long vttbr, cfg;
+	unsigned long ts, sl, ic, oc, sh, tg, ps;
+	struct io_pgtable_cfg *pgt_cfg = &idmap_pgtable->cfg;
+
+	cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(ste->data[0]));
+	if (!FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(ste->data[0])) ||
+	    (cfg == STRTAB_STE_0_CFG_ABORT)) {
+		return 0;
+	}
+	/* S2 is not advertised, that should never be attempted. */
+	if ((cfg == STRTAB_STE_0_CFG_S2_TRANS) ||
+	    (cfg == STRTAB_STE_0_CFG_NESTED))
+		return -EINVAL;
+	vttbr = pgt_cfg->arm_lpae_s2_cfg.vttbr;
+	ps = pgt_cfg->arm_lpae_s2_cfg.vtcr.ps;
+	tg = pgt_cfg->arm_lpae_s2_cfg.vtcr.tg;
+	sh = pgt_cfg->arm_lpae_s2_cfg.vtcr.sh;
+	oc = pgt_cfg->arm_lpae_s2_cfg.vtcr.orgn;
+	ic = pgt_cfg->arm_lpae_s2_cfg.vtcr.irgn;
+	sl = pgt_cfg->arm_lpae_s2_cfg.vtcr.sl;
+	ts = pgt_cfg->arm_lpae_s2_cfg.vtcr.tsz;
+
+	if (smmu->features & ARM_SMMU_FEAT_ATTR_TYPES_OVR) {
+		ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_SHCFG);
+		ste->data[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING));
+	}
+
+	ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_EATS | STRTAB_STE_1_S2FWB | STRTAB_STE_1_STRW);
+
+	/* The host shouldn't write dwords 2 and 3, overwrite them. */
+	ste->data[2] = cpu_to_le64(FIELD_PREP(STRTAB_STE_2_VTCR,
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
+				   FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
+				   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R |
+#ifdef __BIG_ENDIAN
+				   STRTAB_STE_2_S2ENDI |
+#endif
+				   STRTAB_STE_2_S2PTW);
+
+	ste->data[3] = cpu_to_le64(vttbr & STRTAB_STE_3_S2TTB_MASK);
+	/* Convert S1 => nested and bypass => S2 */
+	ste->data[0] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_0_CFG, cfg | BIT(1)));
+	return 0;
+}
+
 static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
 				struct arm_smmu_ste *host_ste_out)
 {
@@ -472,12 +526,40 @@ static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
 	return 0;
 }
 
+struct smmu_ste_writer {
+	struct arm_smmu_entry_writer writer;
+	struct hyp_arm_smmu_v3_device *smmu;
+	u32 sid;
+};
+
+static void smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
+{
+	struct smmu_ste_writer *ste_writer =
+		container_of(writer, struct smmu_ste_writer, writer);
+	struct arm_smmu_cmd cfgi_cmd = arm_smmu_make_cmd_cfgi_ste(ste_writer->sid, true);
+
+	WARN_ON(smmu_send_cmd(ste_writer->smmu, &cfgi_cmd));
+}
+
+static const struct arm_smmu_entry_writer_ops smmu_ste_writer_ops = {
+	.get_used = arm_smmu_get_ste_used,
+	.get_update_safe = arm_smmu_get_ste_update_safe,
+	.sync = smmu_ste_writer_sync_entry,
+};
+
 static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	struct arm_smmu_ste *hyp_ste_ptr;
 	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	__le64 used[STRTAB_STE_DWORDS] = {};
+	struct arm_smmu_ste target = {};
 	int ret, i;
+	struct smmu_ste_writer ste_writer = {
+		.writer.ops = &smmu_ste_writer_ops,
+		.smmu = smmu,
+		.sid = sid,
+	};
 
 	/* Leaf = 0 is not supported, as the kernel driver. */
 	if (!leaf || !is_smmu_enabled(smmu) ||
@@ -493,7 +575,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 			return -E2BIG;
 
 		hyp_ste_ptr = &hyp_table[sid];
-		host_ste_ptr = &host_table[sid];
+		memcpy(target.data, host_table[sid].data, STRTAB_STE_DWORDS << 3);
 	} else {
 		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
 		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
@@ -502,8 +584,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		if (l1_idx >= cfg->l2.num_l1_ents)
 			return -E2BIG;
 
-		host_ste_ptr = &host_ste_copy;
-		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		ret = smmu_get_host_l2_ste(smmu, sid, &target);
 		if (ret)
 			return ret;
 
@@ -523,8 +604,27 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
 	}
 
-	for (i = 0; i < STRTAB_STE_DWORDS; ++i)
-		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
+	/*
+	 * Summary of each host emulated state vs real HW.
+	 * |	Host	|	HW	|
+	 * ==============================
+	 * |	V=0	|	V=0	|
+	 * |	Abort	|	Abort	|
+	 * |	Bypass	|	S2	|
+	 * |	S1	|	S1+S2	|
+	 */
+	ret = smmu_attach_stage_2(smmu, &target);
+	if (ret)
+		return ret;
+
+	/* The HW ignores unused fields, don't let the host set them. */
+	arm_smmu_get_ste_used(target.data, used);
+	for (i = 0; i < STRTAB_STE_DWORDS; i++)
+		target.data[i] &= used[i];
+
+	hyp_spin_lock(&smmu->hw_lock);
+	arm_smmu_write_entry(&ste_writer.writer, hyp_ste_ptr->data, target.data);
+	hyp_spin_unlock(&smmu->hw_lock);
 	return 0;
 }
 
-- 
2.56.0.176.g3575e65682-goog

