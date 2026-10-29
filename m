Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282016;
	b=WldL1bcAwI64WA93ZtIsoMlYsM+QSkJjPHLFUqByuMxsquyPyvbDN903eMWQmZ+m8pPo
	 W4KjWRmxycdddW99/4bDAEsI+v+PLu6YI6ZiW0IhiHytOOcun5hopdJ9wwm0T6kYXhNiY
	 2mFPLZoqEVkzfGHbwUtmkFmkrfUUghJlYnH5JdnvWHnmIs8wKn+oLCrkxejHcnZhqp8sR
	 H7khkd9gVGOmLzvXot9hfm8e4TyDlqBMPTFWkACp7opxzTGvlhDAI8dpGIwbYoI16Dap0
	 NxHp3rY7gU8MOZWlMrXOcgiE5CeynzMwra3m+nHzNC9YOIVNWui3ELMmBZkQp5mYLaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
	b=yu0okA2Em3AZo9wpqHbUJgMJUKeKLbd6o5XLmnoV6+GZmYybeNeqlGUTyOCKGKflqUwf
	 MyJiF5vZqD6VKotTsXuDdb/oXi0UxeAWSkQW8DxjJ+q7LnEnbx2GV/PnGst4Q7LGsQppv
	 tt3mXp3wAGMlSALT7SCUWUzaT7V9jRV+VjIKAP4Oh/wy4hHdyeMW2Ywy8b/Hlx4kI3Y/q
	 iHJ4IuqLaeEyMz54FSsS3p+nUmfZMyW8R/b4uXFtnrtTGCdqMgon8xX1x2SgxrX1vHlV0
	 oSmBOMYk1pcyBDMAZ1VuoitFED7jhsgpc82mi+JepNf1tSappi4PodBimjml67HUCtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+vHwzI+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05A606A819
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF05A606A819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+vHwzI+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20edd106so1696196f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282014; x=1793886814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=h+vHwzI+H9X2csVamkSfKUUHbALtnKDHtUUA24TsKBK5H9ZDQZfHU1FQwXDhmLEtPE
         Dr1BA7GbX+S/GMv1HE5p4KXcvVuMUEBO3nAjpaCQFQb6m4TdIWHn/w1E0RVpiLfzQflN
         nAez3m7HSTCeoZAuuBMJeUPwzNfjYmKEqJBWEXWF7E+4AD0DDcUTj1jIS740Hf76uMjz
         fOmJWWt6x1qIx11OQM6kvfNdn1re4sfj3X22rQXNoEuHddWn8BOFmZvnzH/mdhdTY42T
         qpQrN5/tchfxVBD2umWC8BqYUsPBegGq6yOEnKgC5Pp8OhC64QoKMrFABH6NGHzXMdCX
         tTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282014; x=1793886814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=QQ8/fLR9feEn9aklfh9CTDKTaqPZDrRDr6D8HgjjEh4rBIiOUGubKp306ySBbKvQjA
         RovswNW5nW4tOqI3KX4A86CUUoXJsrHbGRNBRRiW2G/wri1aezaWp8tYV5a6Gi0dJ+SD
         yH5YF9VDlrI/y0KtBCcFwmtt41/p8kdVbiMsRHxoJifemxXDJhyJRLsyyKD2zQcpSQJo
         1MJJebjRD3zM2V3ohJO6ffHDrl1awj8LponTKcI+g99MnPdZaoyVLq3hK8EWhyt107Ig
         kIsRS2zwpGWXUT4MwRJ6kx0NVIc2V8KcI8MZnkdV6a2UNl2/wYP6N8uCHDUBEo8mOvyF
         d2Eg==
X-Forwarded-Encrypted: i=1; AKwUvBw3b9PYmMUMcBXxdvW2M42eo3vU7sI7tZmaSVgDNVftG//DP5+qYgPPyU7aCbc4vk0tyPXNB14fa6zFuSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOdSvjwv5utqSQMqA2RzBrjEJk5MYh+qTJiLNF0sMMP61xIoS2
	2aiB2+Q1Bly9nb692lLxETS0IxpAzu6pgtITGNNP5eO1KCvMIoQXZ9o=
X-Gm-Gg: AYBFou1+P3ztNhj3chWcoi2TZNK2QNfk0wIJ1S/ONsLCyazS/kLprlxU+pzV3FZNrFc
	HykYhwAN7rhjBBex1K1qeiysz8djxAXWW0L5MLHw9+rZVXDMcnpNeHNQI4RTNjHhOnhCqaBmiTq
	wwk211XLM0RoaXmdrwfM7DG2E9OKlRNurni2Ub/tyZEcYrdi6oAXrEv2KGvaHfLVkRrs+kogpxw
	jxniYao91TtrsyR764lYGfi+GZ7G+GKFJst+bAWlaQPdjdAG7a/whYL5V3bw5jVXTOekC5VYRP/
	7/EndSUzFRuIzFNYaPX3TiogWF4iuhU9PY4FcNF5f/KP/Z7q+OAF4JPK5mf2EWlc5ngY4R9Y8IR
	RTADjQzR/uLp8scwFCaKIdiHmpjF0vWpaAckMQfhFWK3IoXIrAeJr5hkIPccmi40wR7PofTjOAc
	A84i3zS/FxdSacImGkefY0DT7Ya1uHXrBkhQFxrCXnw6Grk4Mm6N5qImjNCfPAuhilDojgQ1xpq
	AKXkGp+0d0KpK37TXpKpzwjtnV2bI+JCtGmgOg19Xc1qZT7RgxoG2cBu7oofd+u0Z3bpMIrLjKV
	Opltwc0YIYIlLjlnyMPzHUTp7tttEeHF92j/i0hA05Sx7A==
X-Received: by 2002:adf:f491:0:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e5d5909aamr9182569f8f.18.1793282014126;
        Thu, 29 Oct 2026 06:53:34 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:50 +0100
Subject: [PATCH RFC v2 13/14] drm/msm: gate lpac behind modparam
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-13-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1928;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ZEwODnTsRSIiQzAvYlWfm8pmWhNZkrTmOspw3E7UZvA=;
 b=Z9dhvvnQgx4S38zM+b46UTdfg9SThPOIVSdAoOz7EGATYLcY7dL9exHHWjN9XuX2BOku7wLrT
 FTPWSEv0DrrDpKLv4feGQ8Wj41R/cQfHXOM+Z/TSHsGDJf0un1xYOaN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add a mod param to allow initializing and exposing the LPAC ring.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.c              | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6e2333466d7f..51781a2e8a00 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -30,6 +30,10 @@ static bool skip_gpu;
 MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
 module_param(skip_gpu, bool, 0400);
 
+int enable_lpac = 0;
+MODULE_PARM_DESC(enable_lpac, "Enable LPAC (A7xx+ only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_lpac, int, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4244d9324cda..f6927c797fa5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -889,6 +889,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config)
 {
 	struct msm_drm_private *priv = drm->dev_private;
+	extern int enable_lpac;
 	int i, ret, nr_rings = config->nr_rings;
 	void *memptrs;
 	uint64_t memptrs_iova;
@@ -1012,7 +1013,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
-	if (config->has_lpac) {
+	if (config->has_lpac && enable_lpac != 0) {
 		gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
 
 		if (IS_ERR(gpu->lpac_rb)) {

-- 
2.56.0

