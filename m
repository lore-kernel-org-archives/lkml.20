Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9434A6892
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094969; cv=none; b=lUVWJA/0JGrAqAd2LfCUXtLfrxj7mWYbl5gEwPkzTfOWCpe6MRBgiJalBJ4LFnxJAOOHqigDUWU+Tjm/id/OWqwa3Tmu+1qF88VdTjZWtmAK72vlpnwVqsMpfFx1KWaECJMi/XVSrDOL8DVHLB5oi1JkJdL4pODRH/xP0W4A/a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094969; c=relaxed/simple;
	bh=v96PErYEvvh2sXqT5nhrigxoy5ACRjUIgyH+xbGOyoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=APqxl2hmTDoukR3SwNVlspSNuzhYoGHnqenanN+yXlMUTNs/IJHBsG9ZjUp0m8OKMtXtxAioZ+amYUGB5JafmQvY4LS68mA7sLMp2GxkAv6zcozuB3xSFw1Gr0LpjZrF/GGzRnIAmGPoEDWpR8RyhREoPO9q7ou6xJ/ExkQoK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=suHdEnS0; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="suHdEnS0"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b1d6c10725so4994461a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094965; x=1792699765; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20qKmJOpxWxZsYx6berl9FrHJn60ekVP6T05FryarsM=;
        b=suHdEnS0yrBvXeY7qOneV4ApVJZnO9jXDkxXBKcHpQ9UR4wVc0lYhdqkXbIR6XVQnE
         LkN2s/TRofDZB8oCpmThQ3x9mORcVRv7Kncs6JuD2iSshc86rEmfHe5MFEnr/GYOqh4R
         9jmEVaWkwY/t7RflKMhLuiOz/upYAY8mm/eOQfoWQmwgga1WFeqEUc4XwOUEOIZb4Fw8
         1XVjUrHtXugxUlozSIV9iFtTo8E/OdOkhukoUg0vQpU332cQR/qFOpwJFbNJ+k58OEbc
         eJ8G1yV9Elo6OSacl+DqPV3N9rhipOtPbj+TyUGyRWHIHfhZXGZriT/P/XhOoCXloWBx
         CbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094965; x=1792699765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20qKmJOpxWxZsYx6berl9FrHJn60ekVP6T05FryarsM=;
        b=zOjmTwjM4iO2nK0Xjr2j555W/kwr+e4tMTU6l/lObZ28/yIRvnf2lJeYhKNIXVCm1s
         6U8KyTcmgQPOR01CJm6NcEW6V2FWbG7Ylef77ozYdxfiI2hPwUDnP8LWV8uS/uADqsov
         G7wPHny1rdcczVZ4xkbH+zQ9lYqtAE6CcXpxuTJ054VxdZfkyBQULMHCgmcB2yNCzVm9
         s3AoM43lltTe/YF51B1Rp/dOGRVb0+Way7T+MocMI/iErVckyiHDhvLclqLfFEvPM1YY
         h1DnrNKZNvC91UaHAr/BMkpU1m/2emy0l6vq+ZM7PldPU6Icr1aKiPr8s2UPFBGS6YkI
         9AoA==
X-Forwarded-Encrypted: i=1; AKwUvBySE8j6sYq3cGl0RQN4xuD/yyvsTpa/0wsDAlUSc1YRy+3zUEnaoaVjfhMdfPhx2J1q6Xmb3+NzrixVpPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb00kBbONWCzrigpWOtKiUk3kn61N/qqtFebCogDdlilzCiic5
	CetXTMdd5Zubaaj3QSydP8PUE5ejC4RDkX2EAglV+OTNYuxgU/HMf0HX0Gt9f4N5ys7PyAlMvtZ
	Ph+/CWcPk0xKboA==
X-Received: from edai29.prod.google.com ([2002:a05:6402:f1d:b0:6b1:d940:d8b8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4554:b0:6b1:ced2:dfd4 with SMTP id 4fb4d7f45d1cf-6b1ced2e477mr7043030a12.21.1792094964923;
 Thu, 15 Oct 2026 13:09:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:43 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-13-smostafa@google.com>
Subject: [PATCH v9 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Probe the SMMU features from the IDR registers with the functions shared
with the kernel driver. SubstreamID bits and queue sizes are not needed
here: CDs are not shadowed and the command queue is set up later.

The hypervisor requires two things the kernel driver does not:
- Coherent table walks, reported by both firmware and IDR0.COHACC, as
  it does no cache maintenance on its tables.
- Nested translation, as the host keeps stage-1 and the hypervisor adds
  stage-2.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index ba209951039f..2b4a0f961a66 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -31,6 +31,47 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = NULL;
 }
 
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+	int ret;
+
+	/* Not supported yet. */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		return -ENXIO;
+
+	ret = arm_smmu_device_idr0_probe(smmu, true, &reg);
+	if (ret)
+		return ret;
+
+	/*
+	 * Core code clears FEAT_ATS with !CONFIG_PCI_ATS, but the hypervisor
+	 * must know if it is actually supported for CR0 emulation.
+	 */
+	if (reg & IDR0_ATS)
+		smmu->features |= ARM_SMMU_FEAT_ATS;
+
+	/* Firmware says coherent, the hardware must agree. */
+	if (!(reg & IDR0_COHACC))
+		return -ENXIO;
+
+	ret = arm_smmu_device_idr1_probe(smmu, &reg);
+	if (ret)
+		return ret;
+
+	arm_smmu_device_idr3_probe(smmu);
+	arm_smmu_device_idr5_probe(smmu);
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
@@ -45,8 +86,11 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 		return ret;
 
 	smmu->base = (void __iomem *)haddr;
+	ret = smmu_probe(smmu);
+	if (ret)
+		smmu_deinit_device(smmu);
 
-	return 0;
+	return ret;
 }
 
 /* Called while the host is still trusted. */
-- 
2.56.0.176.g3575e65682-goog

