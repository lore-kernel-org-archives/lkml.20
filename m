Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282000;
	b=RbViDLRewb0dNYGrwWzsC9QQbJ5Yj6MBheudk8sLL64P7MO6Vi43lc5GBfMVf5AS87Qh
	 fwzco5ebM8xA7mcuxHC/3Umoil+XExLefuBvDnEsY0WN0yL6ww5ymWc8o8MZDaGt2xFUN
	 XMXekBgBGtQ0iESWBGXvCqqWa5YYCcY50dKH21IZW7G+2dqRYAnw3Hv72/fgExogXUPmz
	 wWFzQ0g+IarNO+5BxmUWc8WdIAfwbyU+3blsRkfoSwOjW66yiw0csBqOIHd2fQYu6YvC/
	 Ef0I6JkGhh2G6VHAepnrODPVFCxowc7Cdq7j0piGs7rsU5WEqhR2dRq1iFfqquOaukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
	b=HkB6BV+M3078FewfNjeHCCwKmqs2ugu2LJ0kk1crWV/QPFl+36L/SHJJHSQ7RIhs78tB
	 QQKDpA1UJidhQTcN3NQ9Oy5cKEtRgjHG1h+cV6z5CiIjuaEiYW1MOOxdi7nVveOt6e7sS
	 Ds7jkg3jZNfMya/HD54x0/wBAr96ViP3tXMCuSQUswVnaQD2wDJC4hO8QTuqa+FnQ8Ouo
	 zNh95/XGkQ2kop1cL4rXuR9BExNeeK4U4kHoW1cFWHQTUYsppA4juf8rju8CnWIkn60Dw
	 vsepqhC6/p4ctnh46WbC/eVTE3rVu9/Qou17B56XTTvlSxqzVrCJfEeXWN4bJgjj1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRRfYxUF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9460A3837
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D9460A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRRfYxUF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so455271f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281997; x=1793886797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=gRRfYxUFQqwTkUT2oyeXYOUkBjicevEGc3PmbdOaYe4q525sM4GW1KHH/GZLMjZqxe
         cfIPkORDTIG6BYAy6VV0m89jmebmE4y5YMRVP55FKwHQf4NSXd0tGra8SfLioopUOoPa
         ORfS1uUt94DVUdWZA6okIiPnR1Ud85iMh+TC8ns0LYMrPETP8MW8svSr7lO0OrylXIvQ
         0tEhcDm3kkGY3aF1ZM+v+RjbQgMKbOsl6iEuxvBgtUpITXwjGmUb7AxYhgTHKAJuWpeO
         HQu3X4rwffKavXmno+LcnmaOq0Z4ZL/UZpM8D0dPodlH/A2LFz5fH+sAoashAsLevwSS
         GPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281997; x=1793886797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=AWNBwexMIvT+prEkvoP5XRuKoYbUG28uPZhJq7T7OcvdhsXcfLEYvwKRlnNNPifM+e
         mmZtXPwgjYbVBwcV54wUelwvaF9uH+0yI2dwckzENNN2lwUsdO5jVUdJPh4p+Nnb7I7f
         WmDW8dhFcA8TNT2Ds1ivgIp1FGWMJHg60Z4leHQMGShMdaPU35WP+hb0YPG8emLPURLv
         leu/G1U2iBpLogqNJoljHbi/uzvWXQOprWs7Il9XzLm8C6xi9Dsg0jfS0GWEtvN7x0yL
         BN+DC6PK/5bn5tdpx2XmbX4k5PlQ3pRWSi5Itbr1+xaKkH+8GVoIiw2pZ7AJnEIrPtYk
         b4wg==
X-Forwarded-Encrypted: i=1; AKwUvBy1b/n7xVae6HH6Jhr1DXd9dsK1WgdX3rLFRURu1hwlxLJ0uR0uFop5bC/Qi1WK3Ow0XjRYwWjVgvy21fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJnRZhhBLZLgwIo/Cbuav9Ddhzo81B5sIqJ4C6NWWKYnUw+VIu
	rMhjKEYpYF7PW4IzlFVRQmJgDzNAIYK1Ma3yhLj+IDG5PiNLJafgYgY=
X-Gm-Gg: AYBFou2P75ykHR2xz3scK0dtPzmvQwOkIwef68Fd9P4ieScZXIwCDjxJLQOH4hHFAgw
	bXtkPBVVe96S6bNvvpLjm3V2but+RHDSWgwf8y5JyZsMEZPKLSAiemdLEfpKu8G9ZxHOg5qlA5z
	38DK2CigOYRIOmbpRuIvqKXa+12PL86w3wqstE+epKA5xmgr2mFzvIAYGvuWJNSGvAoflerCYTa
	B+z4xDt2FFSFSwvdhOp0RQsPjYGPiqJOw5veugWVgulf8tlMVAnmYtQDehOzShtRlZN1X2VUMiW
	xk4mnY06PrdKvguXwjt9r7DLIbXVhFEOvnPrx/BQaNPXZRjzgoieuNf77QIZR/xoZOq5/d433Jc
	VmZa7oGcZcj7CiGXzxEOR3vZhM5QQrfsMf6NWud9v5QCqI0GgCEEHtDbYDklYy04iXAE7ZpvZYt
	jA/CXxHW5hGwT6nZeswMH+qAcSZHKPrRpF0RsfT5Ai98ZCxU7j3UNunB2vZbZGG+iA2HXf+JpgR
	ql8KXvp4N2+yX1XA+v/7uNGPkfONkz4zaBN7Q4I3Z5eTY6v7L5t3/E30QfXa1/WuqApiDWVphV2
	ykXpGdyShA7UDJBajaytLbAiV26x+zD0CuGPQTU0/1wVsQ==
X-Received: by 2002:a5d:5b91:0:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-48e649933c7mr5094994f8f.17.1793281997067;
        Thu, 29 Oct 2026 06:53:17 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:44 +0100
Subject: [PATCH RFC v2 07/14] iommu: arm-smmu-qcom: Fixed mapping between
 sid and cb for gpu and lpac
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-7-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2537;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ddmhwqAVzi4UvZ7es6VT6qKlZqL0nH2dFG7G9BUrboU=;
 b=bSLxcYA1Hg7TlJKZ47oBfv1YRksocS8fOUT+GDiqsMJuS2PEP6fGuu8UQ7sr0kvqrRp2ErWZv
 hi5jOvHNIWgDaeJxu8pdrMCwt9FmVwlER2SJfgdk1R9+hQIkj2UjR5Z
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 ++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..9413b748e79d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,24 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * LPAC will always use SID 1
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_LPAC_SID)
+			return true;
+	}
+
+	return false;
+}
+
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -237,8 +255,7 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
-		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
 			return true;
 	}
 
@@ -313,12 +330,14 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 2;
+		count = start + 1;
+	} else if (qcom_adreno_smmu_is_lpac_device(dev)) {
+		start = 1;
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 
@@ -363,8 +382,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	if (client_match)
 		qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
 
-	/* Only enable split pagetables for the GPU device (SID 0) */
-	if (!qcom_adreno_smmu_is_gpu_device(dev))
+	/* Only enable split pagetables for the GPU and LPAC devices (SID 0 and 1) */
+	if (!qcom_adreno_smmu_is_gpu_device(dev) && !qcom_adreno_smmu_is_lpac_device(dev))
 		return 0;
 
 	/*

-- 
2.56.0

