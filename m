Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790DD4F30E5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796216; cv=none; b=M4n0YRXjOUL1GCx+j5/MC30a5cCwMBqIPVqYcXZ0Ay66Z+ompIYF25EOUJ3WyiWUM/GPjf2IS/IEBgzGgqNmH6yKevE1TwzKeNkXZ1Wt9K9C9QT8ADWtfudJk7h82kvccGalyb8ts8SH8lA2P7Eo3YWfVEf4n7WhPCtwhnpqXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796216; c=relaxed/simple;
	bh=S6O22p+wuJo8nVpOkLZNP3zPq8w1MkckusuLOMBo/3Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bVhpn4tw/rR1tL+91s8wZX0Yq35JuC38nRH5A+c/r9dEz3kqK4Dt6qynHYaF4M0xPEwIrI44oC6Pkh92NeZMGXnd2OxD9mD5IFtLtB4zttxVrvsLrY2Vhvk4A+xi7+pEnciJvMaSd6Pv3SvLphFJmKVpPMSGP1SVG8x1B+da8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GN4D026L; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GN4D026L"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so11465645e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788796212; x=1789401012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AQlaDcTakC6mCvyGWi5enhbjbBFVdjTH0o/87MLG6l8=;
        b=GN4D026LHtCzIJbD8O5Xwl4IDPm/9doYuiT+NkF0AwfFAmDqf4/hOn2u4HBmToXGxe
         AR8cL9cs6pjRz0Cj6JEEBC22kkldy3bLLWJTTszAFkqXe+bUVTQWXdRjClEu2YknhHoH
         l4Oz814t0VUmjlgSQUmTRmvUZrLEgcO5mmnNLrDD/V7jSsVwUOzunwJ1jfpifX7T4Ynf
         06zvQwKSJ7I0oGLplagwhO+6ShJCynqor/fknqQ1mOf6PNA88IeBsYs5gZuZKmZqu4Hg
         9N4fYKgXdwEXKY+BoqWTStz3B2ismNckTtJPpqMiUzN4EZu3/J1KJ1APBMmDKTYORjpM
         +fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796212; x=1789401012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQlaDcTakC6mCvyGWi5enhbjbBFVdjTH0o/87MLG6l8=;
        b=C/aT3kVY6EiPkbwcCySp7yrTGAsayrJOhtyEm9Da9uoA6KAhAVE68i1pp4L8/bOag3
         sEtZNY1FNxj2te9mPkkGfoZW6dyiyORQhOhzfaIBEcs0vr04WWcqfEzuKDqlLveRQk0i
         bCBO6a51NPsyHrjx+01WpVon7A2ZN3bmZszngzjEN1D2Sy4TRQ0N4B/l+6w4H3A5dr07
         bs84sZrU0cUyTBNA2jVRHLgnTAf1jb0EWNafXnekJIptvs+azowew9N9ifNjZwxCeyQN
         C361EtfX6OOe/Q3KL9d//HJsqIGct7eVuJktM3BmUEcfcoDsi72okE494T5SLaRXXV3B
         7EGA==
X-Gm-Message-State: AFuF++m9suMsF7gijAL4oyejMl5cvWF39Xg304sIrwVOdrcn+DaSRRPo
	F2UKgA1HszTawyQ4Iw86TaWyoOOIv3cJ7Rait7vqIXJOkLSBPAP1V6nfaiKNPzSMavcThfHA7O9
	AmMfFzTGoaNjBraR1dsuSPn8CNi52st2++r4ea5PCnos+aUn58+6BKaPsS1iBr9BvPTuZ60K+j1
	weGP7wto/oypCj/KxWlNwCyiziYvXhFfd9i0eaAb7KtvmD915wKkAWh+8=
X-Received: from wmte7.prod.google.com ([2002:a05:600c:8b27:b0:49c:f186:4fa4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f91:b0:49d:e0c:e560 with SMTP id 5b1f17b1804b1-49d0e0ce65emr77546445e9.4.1788796210294;
 Mon, 07 Sep 2026 08:50:10 -0700 (PDT)
Date: Mon,  7 Sep 2026 15:49:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907154928.4012151-1-smostafa@google.com>
Subject: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: jpb@kernel.org, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jgg@ziepe.ca, nicolinc@nvidia.com, praan@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

arm_smmu_sva_supported() have some residual checks for ASID from the
original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")

As DVM was used for TLB invalidation and the ASID of the domain was shared
with the CPU process.

However, the commit
d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
removed that support.

So matching the SMMU ASID space to the CPU is unnecessary and can be
relaxed.

Remove the CPU ASID related code, and update the print for the SMMUv3.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 0a429c64fbf3..a071f9841839 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -199,7 +199,6 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 {
 	unsigned long reg, fld;
 	unsigned long oas;
-	unsigned long asid_bits;
 	u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
 
 	if (vabits_actual == 52) {
@@ -232,20 +231,7 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 	if (smmu->oas < oas)
 		return false;
 
-	/* We can support bigger ASIDs than the CPU, but not smaller */
-	fld = cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_EL1_ASIDBITS_SHIFT);
-	asid_bits = fld ? 16 : 8;
-	if (smmu->asid_bits < asid_bits)
-		return false;
-
-	/*
-	 * See max_pinned_asids in arch/arm64/mm/context.c. The following is
-	 * generally the maximum number of bindable processes.
-	 */
-	if (arm64_kernel_unmapped_at_el0())
-		asid_bits--;
-	dev_dbg(smmu->dev, "%d shared contexts\n", (1 << asid_bits) -
-		num_possible_cpus() - 2);
+	dev_dbg(smmu->dev, "Max SMMUv3 SVA contexts: %u\n", 1 << smmu->asid_bits);
 
 	return true;
 }
-- 
2.55.0.979.g7e5102b832-goog

