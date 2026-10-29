Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281983;
	b=rkz4U8j87Y1V0sPl+qs7Zyr421U/+tfMKODv6D/6w/L5uZX0j1wVlnZbrvRkRHPBS4ls
	 /fFd1hwauBlO9ENRidUx9UgcPm+b0nvAobu6Zze5F1SPp1kfbhBaR/4flct4OSdki9sHM
	 pt1r8y6NoI5BkojBn6uX6ITBVYGRD6+TczSv/Lf6IcvHeseJrTU6WsIprMWG2yFJJiczg
	 3yTYPZHaOoO0ML+R4HrcjNRRyM+aScSKqLXvDUWv5IqFDx6vQ4Xv2j60Px2FnpVnIPcos
	 ow98v4g1GzxUyCYMoFbTUNAxQH5YNkAbQnKXQfFEXBvTFXcaEZZbE5eIy/0I/C8qEjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
	b=3Dm5yl4HrpngmkEu5uUxMD6/Nmh6o0k7kSZegJaxUEa4L9Qsp6Ml98Em6uCsiAunXpzN
	 pALqZgo/ZR4/MQw4QWRkaSTfbKNe65zZNU7NmrxRNF9xD8ImcdyS2pP5wPXZZIUApRXHr
	 RVJeDYMCAbGHnk+Ny/R8bWX2cJ+vl1GGfQhxWJJTcLMkstyz9m5XX5OPQ5DgUD4e86uyB
	 WDZkomwxbsyZqf4OI+KcTPQ72lNZ6D6cUQmBUK54Q3KUuyCF8B2KO9bsa5nmJcebcTPwc
	 uZVt5HZapWcKOYy32KnMkq9X5ojVYnsllSbgiLIRlYSefHWYTR/u4JU6nn1flwuweuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHBOXQLA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60255606A336
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60255606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHBOXQLA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so15749835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281982; x=1793886782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=CHBOXQLArqfC/kYwkg2z5vBijPZxsFSY/d7UHnyTZhCtyMpUYiXHDpdVgyIT/vkK0Q
         XajjYDO6pv5Q6dlNIzEuWeqnqkLtUNAr6dqiUgfyOZar6xRzhb3eW7hsw3PiYc/VD+5Q
         GV6YtxzpW2SNF9YRpZJbDdyo/hkR5nap0QL1/AeUzMZS80iltJpcNrMw8rt0Cze5QZ27
         K0xglNQu6uylBYa2ZblI8TGrJ+owFcp9Ze9yixdX+fyupq5zhylvAYWM62RKpocav+eO
         5lnDojSz2zcvVIa0carfvx136wUStQntxTF0jRiwa9Syhx9wYuPwLMzXoncAaFonEJdC
         yf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281982; x=1793886782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=tw0P8YCCejPqd0QQI5Vx7lLy6v0laxIkEsK9afvjCNYkNIkYW7TmHhifxvYB9JeoU2
         knCHAGOGwGbJ0bNDdztMkGhy/POaELBLIFc0/qk8OcwP0/DnOMNO+EjwkXpm1+fIzlxK
         +GnRGZHhDp54MdYHXkHl3optS+zhgdiYgQrsQ/okPTTz73//+1bDWm7sDpgHFIkAfFPy
         SDBMJlI+acGuZwyMUjl7upTsR396QGywnN0WvjuL+U/3wVw3NGslXsEIXgqqkS4vCpn3
         /Utq6u7VywaPLZ2XlU1rRtS6nWZbuWrJG0BG3/rDfzbO3Qllfp0gXihTdT6POrFq8jJG
         ubMg==
X-Forwarded-Encrypted: i=1; AKwUvBzoYxJby208LTkUhXX4nShb47nMSiLpGruwqSjdD0KtPmNBuNoa9PbawH3s42AvdwJRD7e58kPYoZcGmqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLqNib750PmcwXQ29I9csIKJvVNw8lUcegC3Jsh+I6e+v3Ls/J
	fLWvSU89DQs+ytV/pibwla5rJXrt5uYNPt0A9753CJ/sRQf+WsgeRyY=
X-Gm-Gg: AYBFou3BmgyVYbKyYsYVwllVrXazLU2NOfkCAOywjlmPxvObdu+XqrcZxIqrtrcgR2f
	f3PNkyZ98IxubQsBupztsUvWbz6hzNuBM77Z01wVaHqd6ohaoSN5CNC+fEtkOwJ0/FJmhnrPMDe
	WpIHurhxdDonY1ksDBXCGSqPRB9n/LQujO6w2tQAJ0BekE/8bXO+s2T8TxBpiparYaenaOTxt2X
	wm+h4te8tk5NwmaEcmTngYbdAHRB1yRbTXWjb+dZroCJQqVaj2taVkZAEfIumgcqZMa2u1aM5Ja
	dA6zXiq16O7xlOBtdOMhPWwN2IBxYyvwznHp5vBRVO5kFJv40Aj/SdZHlyZzZ+ZP5u6ysAe+qOQ
	iUQYKWLT+r5NGD0dnyxwDyRh2SKkJK6Fg/tM3OmQQ3fpdx0zMj8YZL55tEb6k4yjH1zWFWv3ty1
	3MHmKyJ0Tj3Rig3ZHL1zcyL8tI0eUiWu8cHeyIYLDGaB1ORxQX6FoEN7vc1VJEvqgWLrCBDCCTh
	dFYNl4E1tt9Vi9/gq5UgtLBNX0c8YLTnnCdF2e/uLMnxA79woIOsVDx8r90lGtrjJuIcJb9LSuG
	i9qf5CbMUjLOacIa6hpaDWGhRik5JF/cQF0mMY2b7jsCaQ==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr86595655e9.16.1793281981611;
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:38 +0100
Subject: [PATCH RFC v2 01/14] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-1-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2309;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=NJ73RVOWEiPlPH9Z7PnLGwHMRejJoPZBM69o25lxk5E=;
 b=gj8sBR9N8QG04JyrcmUt5R2oXuziVAr6kQLdSMm6i0TlFKl87Gop8V8EHKny6NTxmbotiGmJc
 fs65LYDtGd6Dd5piBIpN6ZzqbLECs9zGbUWlcBT96BceUkWcOkEDLhv
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want the context bank used by LPAC (Low Priority Async Compute) to
use split address space just like GFX in order to be able to handle
userspace submissions with per context page tables.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..48a590aaeb5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -35,6 +35,8 @@
 static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 	{ .compatible = "qcom,adreno",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,lpac",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-gmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
@@ -217,6 +219,7 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
+#define QCOM_ADRENO_SMMU_LPAC_SID 1
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
@@ -230,7 +233,8 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
+		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
 			return true;
 	}
 
@@ -305,9 +309,9 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 1;
+		count = 2;
 	} else {
-		start = 1;
+		start = 2;
 		count = smmu->num_context_banks;
 	}
 
@@ -394,6 +398,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,lpac" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },

-- 
2.56.0

