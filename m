Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71459595747
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094981; cv=none; b=cJhl4RW0LfvXSU3m+R8kgySiQsjZ0nxubcGwpg+qZ2nuB9TOF+yNhdu3StRIb6SUeFOWcMzir8cnIhQMrvnexFLiQv0H4jgcW2iGYC8MvoncHQmmdsnNTyeWQTFt7H7tGpyFkE5t8DGgy1Qhzzzu2vArMkitkildSe0HqlaxZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094981; c=relaxed/simple;
	bh=esGTvS6DZ/ClMQbU119hVRZc93nVCLe8LifqfkQfW5A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p3cCNpHsIt8fV2zxZDtZRR/zbsHbHP2gmBBplROexV0YcWX4ZVNvfhL7pmXWn5ZUj6RtjBLuSumUm7LRtSImVSowpk+va9kAAk1QpeDThN7Q9Ye/iTm0O3zSkgON4iIYTGoyEohStmnrDQLPcASe8JxoLTmuQmO7dt76KbQnckY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/DE1dTI; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/DE1dTI"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25501f4aa2so42476166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094975; x=1792699775; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACz9N/uLV4ni8vIh9HTqb065WbDM683/OQmKXL1iQNQ=;
        b=O/DE1dTIb979jcCiV8zfPazR5KxHehC70/iq3d6I/jNsWANt51RT9WdF3Fxuo90PbY
         HBa/AGauf3nZHN8LKNPbdPEJNkx82F4FmbOs1khF0tsYoCG3yiYDKxpP5dKaREJ6eMxS
         yd8ocLDkQtYikYDpg/6ePAoiplmrJli4NeqFmgn8Mubl65wi4lV+pwB/e7PTgGjynPXU
         xyTnEz2dZIB79h7zTUDIJy7f7S1xKaZzsC6xWxy152B08HWnTXj1ycCG8jnUklBYuesE
         3KC/h4E+drIKKGI60RbDyYHOxPdCg9y6RfYL35QeOCE22PJSBAi25LSZCsIxru2Pt530
         QpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094975; x=1792699775;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACz9N/uLV4ni8vIh9HTqb065WbDM683/OQmKXL1iQNQ=;
        b=rdwM0/bu12mHp6z0ZFChkf11XzEC3aFJ2HW0Bj7fF9Isa+zzbAVJYbwG7tN0UgEpFj
         1iIt0GnaGTcvMy0Ee205rtr8cD7/Fpfb4R9zIDAcBnxvvhQPakKVUlVA5ZEfWny9jQ7i
         jja14r1zd/eMrni8qpUE0QI8PjB8Lb3UlPel0m7lWx2gRJyjgzoRO2nfjXSlfasDAIRz
         4fPZPuBE48SvZ6pZHPaCldPkMW1+4YX9ZmbLv7I+QPjAtK/J0Sl2WQ0gMFURDTfD549I
         kkCp+9a9hOtrgwNXbp6OJJY4Rmg1zd8QM2sNfqAcCR0jjKpKNj/cOjVgvNya11W3bdKJ
         y0SA==
X-Forwarded-Encrypted: i=1; AKwUvBzGBWyxZfFTHwuJv0PbTdFpk+U4gLxWj6J1YDa0UL02rNs21/B5wuqah+GflgVBWROBcUOtECBik5JChEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyksWY3mVFEvu2FVDQUq7JmTYsymLJFKc4qUDkKTpUTayevM9R
	EMZk1gBkVrrLfFeqXaaNg12m3NkTgHsbITbusoku2fCko+B0vCbA42/CeWgME8F1FSGTgfJE6BF
	AU1OElS+AlFfTJw==
X-Received: from ejsh10.prod.google.com ([2002:a17:906:584a:b0:c3f:cc01:4b72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d11:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c402349d091mr109107066b.33.1792094975445;
 Thu, 15 Oct 2026 13:09:35 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:51 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-21-smostafa@google.com>
Subject: [PATCH v9 20/25] iommu/arm-smmu-v3-kvm: Emulate GBPA
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

The last bit of emulation is GBPA. it must be always set to ABORT,
as when the SMMU is disabled it's not allowed for the host to bypass
the SMMU.

That's is done by setting the GBPA to ABORT at init time, and host
writes are always ignored and host reads always return ABORT.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 1972df1d2a8d..943ffef0bb4a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -217,6 +217,22 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 reg;
+
+	ret = smmu_wait(false,
+			(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) == 0);
+	if (ret)
+		return ret;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT | reg, smmu->base + ARM_SMMU_GBPA);
+	return smmu_wait(false,
+			 (readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) == 0);
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
@@ -456,6 +472,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_deinit;
 
+	ret = smmu_abort_gbpa(smmu);
+	if (ret)
+		goto out_deinit;
+
 	return 0;
 
 out_deinit:
@@ -781,10 +801,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			val = smmu->host_ste_cfg;
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_GBPA:
-		mask = read_write;
-		break;
+		if (len != sizeof(u32))
+			break;
+
+		/* Ignore write, always read to abort. */
+		if (!is_write) {
+			val = GBPA_ABORT;
+			goto out_update_regs;
+		}
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (len != sizeof(u32))
 			break;
-- 
2.56.0.176.g3575e65682-goog

