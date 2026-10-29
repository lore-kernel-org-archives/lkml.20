Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281993;
	b=5FYYXhZoYSWs2BmquLADzKapzxMqLgekUL51kd4phxoPrr66rN2SQSP4GQPjWDepqfoJ
	 MPBYylIb1c7n/QOqqTXtJiZ/PxuJzjN7VbJVEE8VqbUEzlS2vEF82L2oqlxq9AxVJFU6V
	 jk9slWPyfK2pRlXfepn98ozmErcU/kIKn/WQo4DYdiIC9khn5xNR5adzPgtirTH9PSJcK
	 YjufLmAyb0/7FWGHyvpbJ+FbLzNqYA3afNJHD+ONkz1WmgjHOVWhRPdjOvUbeGy4GYOaV
	 fCfN9BVD1R+XvFt240OWsIuLpAvAspXtXwtNj1i+s3P03ty9l1Di+geKBaE0xbGSlgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T/SMmhEanFf2ZRlLzrXMdAPzQTHRLaYYpOnEMjr9oaE=;
	b=CTpSRr8Zj3IKKaQNwItot4M33Ulw6Z7oc3t4zBL9lMZsr6k0yP8tdU71gkETy+R7Wdam
	 pcQbOzrBIwinC+A+WeNBoaEAOpSlfEY1kPmFyZUCWUZTUCt6NqB9f/hxBvR811rlkSzUM
	 kmtZb7kQAeBr6QGFEyKBIEaaJ48t2T7EE9xW4lT3Qw3VFqbFjkb3nrj1tnCGzhHoIK6D7
	 28J2oIrwpVTt6vqOQMCZOhIEbJD0wunUwtEb7R1SY50Nog7ivzAmFRFQK0eItY+8nHEzt
	 GxhHUNIM/DHwZ26mruFbQu2ybkAmpF1Nl9RLHUSgQCVlK4ME15uCOEGSvN83paKts7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s3KEag0y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090FA60A3819
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090FA60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s3KEag0y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1810021f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281991; x=1793886791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/SMmhEanFf2ZRlLzrXMdAPzQTHRLaYYpOnEMjr9oaE=;
        b=s3KEag0yDnYz0U77lRR+6mYCT6xP8Wrf2rzYrQz7WTFHhYg4wu+8jAAhe+xm/9FqGH
         ZFQ6MVbK2rEMT8AYRwoARD/yBPkDUQocu+YHDUa9wDKH6+HxDRNXWqvUyfoL6HCPoWV9
         XEoeRnqdKqJuXjkpNIF4R6DU9xlDTs6u3LnD5gWTJWm4magjfR9ZfWO9D4VMWuYpRcpC
         wQaiP/WONLVDza2w0GdRZp5mHXfptS9IjgR6TA+KqQ/9whYYPbG6XOxMVXt6oa6XqJdX
         yWeY5L0hlfJdBHIQZ2efD8Bh6Eaq0pnANLKaU0zJJ3Ag/h806ghlr9ZUToPfRsaRtDFT
         Z9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281991; x=1793886791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/SMmhEanFf2ZRlLzrXMdAPzQTHRLaYYpOnEMjr9oaE=;
        b=bR8+YoK73dTKMGsagaUSe2eE/KcBj4DIPcaiGr9QZVKGU2SLw9UgT1uEm7RwFhhMD4
         VD6zkMpsZwRbFE1IyfhunrgrZNEf6qx2U2L1YSxx6fE5uqYyhkPpeGn6d82mw8teLMzb
         1mRxeAiihUs7tUVx6v8VdG2iB28Yj7oTWz18IDz5l8MgiHgDwAWBRuq+imx787ICyd9E
         Lu/aLdmDu/0vjs54Wk/404ca8wL2qWCkXGViEK52zorPpulD+NMxvlXOH/eBW0IvWUBz
         1Z9ZFG4qT/Uox8Q//SWsl15l1zcHAnq4bpxZtURBTFiPEvwPMNln8UI2WFKyuB8No2yU
         /Qyg==
X-Forwarded-Encrypted: i=1; AKwUvBxzkkfvOJbgV7iUPA5FrzLNHS1ZSMWiOPLhgQ6E0U+uVhBXLbASqMEkYSU42ZzbJJmMXFzepJGIEorSFwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7/hE99uN3UAhjxWUosI60q2VoI0qx0BKLn25HPPhpnjFl8CSr
	0CBOFqHBCHB6NLxjDQsIQTrk/N3XNMGKv65v5CzA3IjXH+W4H0NhF6A=
X-Gm-Gg: AYBFou1kXKvFi/9dhb1JXYFnoxy0+gfu1zur+Q4TM6T34PXAZ6RyFXnQS+aVuO51csf
	sDpWTr8qY4cWqS1WnqbnUTQRLiS9AMRfZBCobLookUhJ9mGBYDrgjvfgCrFjyi6hLTMqGIjjwaV
	DvaU0BgfWHUv/CBlmOkx8QgC8hyO5HWqOoamZkAKc2rC0S5G3uid8gzv/m3LRpaRiGBX4KbxZvz
	T+JxQlbbA7+KPpYAuqtNqdccnAhlhu1prDQN0DYBKauA06V/Ka9EqxkKdfo5Ace5RPreV2xwIym
	GlkijsjC/0kw5/9RVINHmCuVeF4gqC8Bbmh6rx+xnKQDLwjdez+xtUct9U1aL8sZDsqPzoM83qx
	XPFxKu90NLyBW4rm4dCysotNe3ZMGxkoSiuJ657sMSI+uosuK+6oNenvcZN5+lcGnonq80+fJFQ
	pKEm5FOfKesI6H9QsqiUn5iv/rixLkhZ8LxaVtneg3twX+pHGSOOrnOBCleOqVFwu9IsevDtdZT
	x/i+M5Jo9LlEWNWrXjLGws7bnnSJLXwoXGc/jPfQt/tLfHR2VaNQb4qa4wIhwBDmE4Dv+qkZcKC
	kziukIlxwS/6upPiuSPl5Mrp6raGAeW98MZRuxZKyDVBtg==
X-Received: by 2002:a05:6000:989:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48e5d2f2222mr13148384f8f.29.1793281991354;
        Thu, 29 Oct 2026 06:53:11 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:10 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:42 +0100
Subject: [PATCH RFC v2 05/14] firmware: qcom: scm: Configure LPAC aperture
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=4016;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ivUR5Pb7Po44Alwx0ZT6ubl1ZzDqmOPjsdTHTPY8+aE=;
 b=CzZBZhvXfsPR7VJKCtyL4sntORzIwyrw5dpz/xoNsZ5uORTwXp8jhcD9HDV0cCBFD+qYUv+9N
 gi7Oj1wgVHTBJ0bjH6egCOnjdXcy2F6zKpvCrmki17UM3EuffiJgPc1
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In order to be able to update the SMMU registers from CP for page table
updates we need to configure the LPAC aperture to include the context
bank that will be associated with SID 1.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 4 files changed, 26 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..92093399f20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
 #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
 
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
 {
@@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
 
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | (1 << 8 | context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_lpac_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1dedeb19946e..65d34d0cfc38 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -658,6 +658,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 int adreno_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct adreno_info *info = adreno_gpu->info;
 	int ret;
 
 	VERB("%s", gpu->name);
@@ -668,6 +669,11 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ret = qcom_scm_set_gpu_smmu_aperture(0);
 		if (ret)
 			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+		if (info->quirks & ADRENO_QUIRK_LPAC) {
+			ret = qcom_scm_set_gpu_smmu_lpac_aperture(1);
+			if (ret)
+				DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture: %d\n", ret);
+		}
 	}
 
 	for (int i = 0; i < gpu->nr_rings; i++) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1f201322cb6e..ec234a483036 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -64,6 +64,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_4GB_VA			BIT(6)
 #define ADRENO_QUIRK_IFPC			BIT(7)
 #define ADRENO_QUIRK_SOFTFUSE			BIT(8)
+#define ADRENO_QUIRK_LPAC			BIT(9)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..70fb93e303e2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -100,6 +100,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank);
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);

-- 
2.56.0

