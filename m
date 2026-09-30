Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1444F4049
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793533; cv=none; b=omEDOUxHKCXl/I6kKMFiwT4T2NNjrJazmgvGxo1iJniZQc6AXFtGifs5dEduW+2YDCNxa1I3SZhvD4bNv01gD2evLaxDp8g+jrzdPAztHEI9zJNZ0Nas2tQS/ZO9P34BUQ8V6urDoRk74wdhMzXrak82mYn+9+fI6CxrTBAGiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793533; c=relaxed/simple;
	bh=gwB6d9Z3k0CW/Oqy+i7I0rfrOnAAIB0oSBCF2qad6Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cJWrOh6q2+BJDNP0x6jv0HrSIERaBb37oMDT5xDPeCvYtfkSmibL5ZAxhvuAcUqo3cVsoEKiuztW3tNotzvm1GlfSKsfiv1yAbUPlSoTuAZxYbioZQ/VUTk8177n+Gn2LCik/jGZGbJSBMxJotvia5aiX26z1Z0kI3lLPFT+UhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaNbWlLm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaNbWlLm"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c6so3441926b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793531; x=1791398331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcLxcO8uIEkG6hV4cv0W1hvR/CfXs/3hY5D6RxZfqyQ=;
        b=gaNbWlLmbCHahLBE/8kn2wmZo3jtZXwIArNRajRoMWjHOb/lSx8WomEhiHTpgVE7sA
         f40AW1w5lCdYnuZWrP7WYySUq3upntvmSTaKoX+BM4lIFNdZ8DmgAiQ10Ejsxg3ZcTCa
         8FFwD8LMQWrxmgq1FOBmCd31qm4UJdBvT9zvfATMExSKBT6j2jR926bDruGvuxhGpOTy
         Z1Hv2kSSFNZ68BGSk0hzqP8Subl85bQoR6bDRCUP5poIdk0qAo5LaRz483XnaEhHY8Dl
         ojzqLuIV4YAyYdvpZpBluL56MWMJq4o3cZ+MTCOKNl/8T4l92jPsfjAxi0Tnfq/asRqF
         VBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793531; x=1791398331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcLxcO8uIEkG6hV4cv0W1hvR/CfXs/3hY5D6RxZfqyQ=;
        b=HrnEuz5xHgbNG6xn0EZZqug74HWQpc0xc0AV4HR8IFP2KTcX1TPkQ7noJD+aYKa4+H
         S/gXhJG1i+1HCqD0wdHzZsUeGc8nCVXEUeZv9wRTDwF169jzTd+PtNJTyeUjc8jGpI4S
         AIq/IpiQgyafpxTw2fo25/8mP9UAEXuGFSd8aYL2iXtwAaIZiO8gwMGMLT4zNfdMSrpi
         Fa0nwvAJxAXmBwSxspuMKNbwOpeIgHxhzmJXcGZYsgwrSfjOT0M8Obf0/Awz7kDYqtRQ
         svCn/6OhyM3D+ACaKIHjnkjnfrSyvZrx7PjCIAAenEt70vVWM934lSSSY/1f8mqTxWmO
         3X9g==
X-Forwarded-Encrypted: i=1; AKwUvBy9bstW2IOlIGW3drLr1SA0Y7hzqelhEQc5ydRaipfY4Ho7kMPaqzikU2+6EBayMB3lAqYIFkZvVpN/KRI=@vger.kernel.org
X-Gm-Message-State: AFuF++nMS472vrQ0RW9/p83f2vLe8Dz0X5nO/fUEQi2Dic9LHHhJK6Z6
	zluOSQTzhCUYeU2T5mw6PkCqfWRNiLHWvsUY/6//tMVP4XSCAbQ1v271
X-Gm-Gg: AYBFou196yXlr46QFRRCJ9ej3/DJ1yH0Wp5dJcwk/p0H6e6RAXnnVgDFFXvKdeFtzwq
	NntIPyxBI55nVPHQ+O1h5ryjtTioWgf2Or/rN77JTRgmDh7b1GTvmNeMx5DxLHJMxkSyrseRNzM
	H2sLiRxS1wqQlJQs/6nKjBJgErG1s+tIaacgXh1o8mDhiLdRqMG1+ZdExcUtGiVJa+oLZ1+SMrZ
	gmNnv3f/SRDm2brPURwKFA4sykWvkHWJNUagJbBhXOQSnmZBCq5iVK2vsnIshphbNA5VQlsGXUs
	GCg8ZPnWfEDK1Ois+Zecdhe7t6un04qytqDbIkemhzMYgpc3nOAesn+Qa/utct9Yuul66GNGSll
	r0t2G7s57c3FC7gRmCnuGUkDUceLeYEKENgO9lJJqkP6ly+f20mqL1b3V7q3DjJ5GaZTiQ7wjT7
	hWNnU5Ar7OPxwSBnAYc8JK1U3fZb0whA75iCXIebhGNcRQVp07+xUWJJA/PTPIiAkaZV+DrIm22
	3klw5ICJchDASONYmSR5Cu/2Ao/+jjRx6HVv8AU9ZUw1pxt5QYrDNWL0FR4jANHZCIPcwijK/8+
	+EqrN3E2qZ4qm1r6RaPf3jl44tWf3LeGjosg
X-Received: by 2002:a05:6a21:7001:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3de9e6dc7a9mr2517958637.25.1790793530634;
        Wed, 30 Sep 2026 11:38:50 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e539e30esm347997a12.3.2026.09.30.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:38:49 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH msm-next v2] drm/msm/a8xx: report the GMEM size of the active slices
Date: Thu,  1 Oct 2026 00:08:39 +0530
Message-ID: <20260930183840.1171-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A8xx GPUs split GMEM evenly between their slices, and parts can have
slices fused off: a8xx_gpu_get_slice_info() reads the active slice mask
and folds the slice count into the chip ID. The GMEM size reported to
userspace (MSM_PARAM_GMEM_SIZE) is still the catalog value for all
slices, so on a part with fused-off slices userspace would size its
tiles and place its CCU caches past the end of the GMEM that exists.

Qualcomm's downstream driver reports GMEM for the active slices:
gen8_get_gmem_size() in KGSL divides the GMEM size by the number of
physical slices and multiplies it by the number of active ones. Do the
same when reading the slice mask. The GMEM protection and UCHE setup
still cover the full range, as in KGSL.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
Changes in v2:
- Reword the commit message without the device it was found on
- Parenthesize the GMEM expression and keep it on one line
- Link to v1: https://lore.kernel.org/r/20260930111711.1160-1-theflyingrahul@gmail.com

 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index add93c1fa0..2f6f36fb8b 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -112,6 +112,9 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	/* Chip ID depends on the number of slices available. So update it */
 	adreno_gpu->chip_id |= FIELD_PREP(GENMASK(7, 4), hweight32(slice_mask));
 
+	/* GMEM is split evenly between slices: report the active share */
+	adreno_gpu->gmem = (adreno_gpu->info->gmem / info->max_slices) * hweight32(slice_mask);
+
 	/* Update the gpu-name to reflect the slice config: */
 	const char *name = devm_kasprintf(dev, GFP_KERNEL,
 			"%"ADRENO_CHIPID_FMT,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6..dadfe4c694 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -379,7 +379,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->revn;
 		return 0;
 	case MSM_PARAM_GMEM_SIZE:
-		*value = adreno_gpu->info->gmem;
+		*value = adreno_gpu->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
 		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
@@ -1205,6 +1205,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = config->info;
 	adreno_gpu->chip_id = config->chip_id;
+	adreno_gpu->gmem = config->info->gmem;
 
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79e..8e6a881036 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -204,6 +204,8 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;
 	uint32_t chip_id;
+	/* GMEM size available to userspace, see a8xx_gpu_get_slice_info(): */
+	uint32_t gmem;
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 

base-commit: d33622598496c8994c35ba0a8a913de064dfc1a4
-- 
2.53.0

