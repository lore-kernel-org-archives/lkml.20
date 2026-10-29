Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281996;
	b=WpTsdWCdm8/dW51pw4hTNUbHWpixhyFAI3ZXe+qL5YKmiwqujtAkeA59IYRokpZ80fia
	 AwHooWPw1cQQ3NfpJKyBtepPHqsiIXkODyBPfoWKxP2+0N4CPPGgFB+k9yFU6ONgMAeeD
	 uGmJaccLhN3ktlXk3DbuIrYwnxkmY65wMU0hKvLbTVOpBoWzVELloL7mT8Ikdz5dvgVSV
	 9pVTBecIY6GCC1Tj/If4qjuzzIILY9G0iFJl1nzj3t/q5p0hz0UzExJ5UL5Y+7BhjZxAN
	 YawnRA6qSfIO70uNfqBRh3DTo0p7TWL3mH7rPsCGPY8J7Yr9ZM+IwQ+iysT/QTOnxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
	b=1sRZK0PG67DVvA7qgbWnwDp6njljlw7wrrMemGOH39L1v6wsTvkiohqw0kKaFXJPch5B
	 LSURRjLZkSCDIUXxm0oAQdhhf1luwmtgeWdI7C2usKa6tEYq4PYZTRcAYQ7UPbe2+dKHz
	 +6UAdWK71QB8DTtqw6KHvQwi237UhW2Ric4errLwyetoWHKiEI180OQPmQVNIbhs0fc2X
	 b7h9HaJYElrTfieCuBA8K3ybWH8EOy3i/jhM70NK4+keKuIhcof5C5xqYfqSSv/i3ObS2
	 uoSHh8D0QrIkp0K+CfPci1lR3OiN7NpnRU6tu+WwGub+JMQ9Yb/bRlns6aoeoGlWmSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXI0uiV;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24594606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24594606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXI0uiV
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1157816f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281994; x=1793886794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=XdXI0uiV0ZwTd9Wa3AVe8BbXXAxv1zWCaXkMKoaY80znZIIZrzYEfmcCzvWj+5Zm4k
         ztmZhqI0ftUqS7EyiHCrspnfFV+wJCT3zsHo7Tv0T906QAxsHJlB6tcXUHyNQUadTmYV
         hnGXrOz+RzyfYvTy/TY+KHu6Iku22IehZklIyuUnj2W0Padnj7srM56WWTX28iDGeIGz
         gv45OgI4AkKWESn3MJqXmLxza+b4ml15fCMz2nhGO5Dg+1yAYxufF3hJD8NbEPppOYKJ
         HEFt8+buX3/ImND6YerrHO0wJH88YB1TmFlrNzB9H5pc1yVfF4v89tFBSrZ9Zw2NGOf/
         BZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281994; x=1793886794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=eNHxnbTHsPI+OG0Mq59ckJj1gFjNw7YfQbrgjui+ikkMS5X1YReB3cp59HuSQfgPXm
         bfFD/Y+Utokko1dbxSPfALV4pfg4B+GOSkucBQ4R95WbnNFU6sqkhA5Dug62xrMFZDMo
         50X4BtV8Cxu8zL3dphhOCS6svfnPRHoA4yB4mSMKA9RXeacSWFnXZyVFSa3wh6OWp7vf
         JWxQZ+W7MOrcluPLKGxmGwK2NiVvdqwj+ymcHqORhEWt6QcuOPKDpI0OgYe5SkUBOMJV
         ap3Uf5osjB5eRzPxPKlyBo6hVFCyZ3+QMcH60tSJNidDkUgMp+UhoS+uRBc4fX5t7ngE
         85Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxjCStZfTtfWQJLwvLytXoKpQZFUsorhhi7zNBms4v3coqbKqwTdxxUKDbSXb5nymgryrRSEbJRPLjSdjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpuvXTiXpC07r0fTwNvHo2IfrzkMX0Is254R1aIt8eNhX3r728
	tw+NdQRPhX6lFuK04ywm0iAVIZnc+WcPlnR2LTrwfT+4Rws6DXLpp/g=
X-Gm-Gg: AYBFou3YKLMirKjTuj0WY+TM2KfeUJkOvTYyyYdwDvOVmiRXC48ovTchqiJ/Mw0I4Qh
	EIc9Wqt0ZZS+Kf+WILGpMY+AHrTkcGthvWQqcdZd6A6DgSPSN/SazkrkM4O2ynCGQCDidmKQgnx
	PP8+zZ56C8jwwki0YO8qEeoNML+UvRWD4OOOevbetH7Bj4nj1K7zXCbMvdi5QT+85ZifSEhS/gd
	ydC0CQy7bmByUU/KWDNhiNNsCnyrifzQVC5SkDLzPCuMJpr9Xy2U8DyXNotdsk2IiNFqwyDpJ7U
	tLn1oL1vXawDS8JJfvYjJXSci5czTuHAfYZC5uZR6AlMXRgcY/WrSprmkFpalX+DNUt66g93u6e
	LsFc2TGm+eW7pF/b5sotPBSJluJMGM51+03pMKbAeXC5nxoSMNCceb+pCuS+DSLJIywyKtyFkDn
	4zuDF08P0M6J31wwO034myJe08k9pg724H4uksJvHOi03IIJgF7zS9oG1oL6uTB1XxhyXKv87FV
	NuEqa3Oh6ulF49TP4qBl3b637U7tmZe3ohpHDEdyN+yMM4XwPOmpEmM1EEfMxHh3jL7lQh6uV9M
	9Pu2DOAUpO5dmrOuN7uhGIm0pQ9EtBWKqmCoax7eZ0hiEg==
X-Received: by 2002:a05:6000:4715:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-48e5d5d16afmr13493554f8f.53.1793281994421;
        Thu, 29 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:13 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:43 +0100
Subject: [PATCH RFC v2 06/14] DEBUGGING: print contextbank and other ttbrs
 on fault
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-6-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=dH+it9hPPDLJzOx0q/+eo2IfgBzUDyQPf1+n9ilF6yo=;
 b=rSQ/TIKRIiV2aSX7/+jAtk7J1jcL0JxB8zRWLfn1sl11ELATT02XD6e/9sRnBZS+9corw6Stl
 Oo1uS/fWy8LCZ5C5THVWfEq4MkKG8/9Q7VkA0Io7j8QvOp628/2VM06
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Faults can now come from different context banks so print that
information as well.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 include/linux/adreno-smmu-priv.h           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 65d34d0cfc38..4389559e1d17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -329,8 +329,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
+	pr_warn_ratelimited("*** gpu fault: cb=%d ttbr0=%.16llx cb0_ttbr0=%.16llx cb1_ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->contextbank, info->ttbr0, info->cb0_ttbr0, info->cb1_ttbr0, iova,
 			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
 			type, block,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48a590aaeb5e..ae6152bddf8f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -136,6 +136,10 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	info->contextbank = cfg->cbndx;
+
+	info->cb0_ttbr0 = arm_smmu_cb_readq(smmu, 0, ARM_SMMU_CB_TTBR0);
+	info->cb1_ttbr0 = arm_smmu_cb_readq(smmu, 1, ARM_SMMU_CB_TTBR0);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f..5d6de4b4de06 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -32,6 +32,8 @@ struct adreno_smmu_fault_info {
 	u32 fsynr0;
 	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextbank;
+	u64 cb0_ttbr0, cb1_ttbr0;
 };
 
 /**

-- 
2.56.0

