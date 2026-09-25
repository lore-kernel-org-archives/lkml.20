Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D551282F1F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790298801; cv=none; b=ahycoKAG4cDBtJiYvKiNVrnU2HVfiTa5BjDU3SiTgHNir4d/n1bkZ9xY+uocId2jzmaoEFJn4sik0+mT7e5delHQ+qncWM4lCaNXY3C6KptOKcYxGvFD6uiBFeGFwTp3r1BoM8Ct79lB9ToXZ7STErIT0LFfwx7JjdyUcmMP3DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790298801; c=relaxed/simple;
	bh=olGKtxlwn+yhg4dpPmL5Bvr0U6JSMPIbqlhgOBWdrKk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fvnf8nEoVc6gQALeD2Kp4lWjS4ipvCwRltE96bti+IMLO9mXm7qirKudWFwW/Gci1GRZ8Inb7cnGVTmAv272crv7SOUGwxfQD6XtWORxITseRUEDtUAu2sc/G2kGiG96f37Y+UwOj1Lqk/VBvc01KhmfDDzhBmgk97hAGy2llWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FL5rq+BK; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FL5rq+BK"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so194268a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790298795; x=1790903595; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wql0u/3ksmOdy8r//TkBURdk2dF75TPdcHGkWL4FBiE=;
        b=FL5rq+BKIJ12jQxMdnXEYvt+aYfpDrrWk5iuLmXjJc48QL40a+8rglj7chzlShdGs7
         PKWPkE3DcSrc/YjzUZ9YXNPShZQIVy362bRLR8IXUneqr/LnTt2Bi0OnW7jDzkM++VIt
         fSLgjTV6COmguGHbzNNHbI9g2k1zS9hbWJ47cL8T6owX00XweapiY8ikq0jHyksxYSsT
         C9WsK1ne9RqqEaUVvVhdiXdkT6OOvFDeHoYHgAk7oh2m6Bbe2c6YjZT7DFrh9rjEXNCm
         n56G29/tCIju8BEbJwyCErXNKvTkuaVBtZjwLleTJxuM3GwRROAaCcduq5KrAbmVekF1
         riBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298795; x=1790903595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wql0u/3ksmOdy8r//TkBURdk2dF75TPdcHGkWL4FBiE=;
        b=mcigQUCFsY8rXtWZNELcgAKOLtO76q8Wf8Ms9wM9OVto8XqgqgB+vjuBG/mqW/FmMI
         ztabwMuMla5XMN4CPTC/gWK203AgLVi1Wcf0h4hCINCMWJ6w884YvegisVhIwk1js09r
         u5OP4Gijt6Jb77aI6OZYZK7AHq2JOq318yW9gVhEU3Jk2xODfe8/IMPyP/EMTykbsYLX
         L8qHSvQoDVxyG0j+1a1sgiF7h5pLibGatSZ1JLYe68Ou59XLC/BC1Dai+RnrtH2WWD4D
         UGoU9v4rpsaHA8J4bhM6wLVC0mxSL8Eb0bt4O0zN61KmarvdbLsU5wQ+h01yjxQdzsEi
         uYEw==
X-Forwarded-Encrypted: i=1; AKwUvBzHl/4zK03cdylZ0rQITsrYhLHxuS4M7/BZBtgRDegHecqDEFtZnfrDyu5nOFkWInvbxftFQYOAkKlIfas=@vger.kernel.org
X-Gm-Message-State: AFuF++lwhMLIQJhkiAyfwL40VxiGwum75/wiZcCYAW2sVd8omBrOUskr
	M/POsZLbrDQnvFTWlyhAu214bHA01cnRijXK3uKCXn/d+ojIFvMY9zXK/mus/W4yvjQXD4r4Utv
	VOoNBkzdjhc7HdA==
X-Received: from pgbbf22.prod.google.com ([2002:a65:6d16:0:b0:cc7:620f:a25f])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7485:b0:3dd:a195:fa1b with SMTP id adf61e73a8af0-3de0e9a0863mr3871178637.64.1790298794332;
 Thu, 24 Sep 2026 18:13:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:13:07 +0000
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925011308.3381953-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925011308.3381953-4-skhawaja@google.com>
Subject: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless replace of
 S1 domains
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

S1 domains are programmed by CD entries in the CD table. During a new
domain attach these are updated using write_cd_entry. Since ASID and
TTB0 are in different 64-bit words, the write_cd_entry considers it a
non-hitless update and sets V=0. This means such an update is disruptive
and would generate translation faults if there are ongoing DMAs.

Replace the CD entries by using an unused temporary ASID in following
sequence to allow hitless replacement of CD entry,

- Update the CD entry with temporary ASID.
- Update the CD entry with the target TTB0.
- Update the CD entry with the target ASID.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 ++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..59f4b8cf89f6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1641,6 +1641,68 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
 	arm_smmu_write_entry(&cd_writer.writer, cdptr->data, target->data);
 }
 
+/* Invalidate every stage-1 TLB entry tagged with @asid. */
+static void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid)
+{
+	enum arm_smmu_cmdq_opcode op = (smmu->features & ARM_SMMU_FEAT_E2H) ?
+					       CMDQ_OP_TLBI_EL2_ASID :
+					       CMDQ_OP_TLBI_NH_ASID;
+
+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
+					  arm_smmu_make_cmd_tlbi(op, asid, 0));
+}
+
+static void arm_smmu_cd_set_asid(struct arm_smmu_cd *cd, u16 asid)
+{
+	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
+	cd->data[0] |= cpu_to_le64(FIELD_PREP(CTXDESC_CD_0_ASID, asid));
+}
+
+static void arm_smmu_replace_cd_entry(struct arm_smmu_master *master, int ssid,
+				      struct arm_smmu_cd *cdptr,
+				      const struct arm_smmu_cd *target)
+{
+	struct arm_smmu_device *smmu = master->smmu;
+	struct arm_smmu_cd stage;
+	u32 tmp_asid;
+
+	lockdep_assert_held(&arm_smmu_asid_lock);
+
+	/*
+	 * Nothing is translating through an invalid CD, and an update that
+	 * invalidates one cannot be made hitless anyway.
+	 */
+	if (!(cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V)) ||
+	    !(target->data[0] & cpu_to_le64(CTXDESC_CD_0_V)))
+		goto write_directly;
+
+	if (xa_alloc(&arm_smmu_asid_xa, &tmp_asid, XA_ZERO_ENTRY,
+		     XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL))
+		goto write_directly;
+
+	/* Copy the existing cd entry and update only the ASID. */
+	stage = *cdptr;
+	arm_smmu_cd_set_asid(&stage, tmp_asid);
+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
+
+	/* Copy the target cd entry and update ASID to the temporary ASID. */
+	stage = *target;
+	arm_smmu_cd_set_asid(&stage, tmp_asid);
+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
+
+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
+
+	/* Update to the target cd entry as it should be hitless now. */
+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
+
+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
+	xa_erase(&arm_smmu_asid_xa, tmp_asid);
+	return;
+
+write_directly:
+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
+}
+
 void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
 			 struct arm_smmu_master *master,
 			 struct arm_smmu_domain *smmu_domain)
@@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
 		struct arm_smmu_cd target_cd;
 
 		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
-		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
-					&target_cd);
+		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
+					  &target_cd);
 		arm_smmu_make_cdtable_ste(&target, master, state.ats_enabled,
 					  STRTAB_STE_1_S1DSS_SSID0);
 		arm_smmu_install_ste_for_dev(master, &target);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

