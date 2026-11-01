Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556338;
	b=WTtK891dCzRflLOzYhRbnfsaVJAAIrLxByeveqcUbJib0WK9yL3SMhgbY2kkYGJ4meFM
	 ZttPlMYDp9e4YlSzLxobXx0cq7IrCUtzHXeHWjK4d1sKI+3xCTpA4GIL4NrJHFTZThyQU
	 5MW3gw+n/uXbeVAYnTRuDZbLU+i2KDlQR/v5XFJXxQCnxtldiI/MpelxU4ozyYPqbX3SG
	 NW58O3kGHf5VelegLOk1cgXc4Zq7w9G+YcGaC9v8hhMS/KEdnu1ed30zzKvHtfQO/6nzG
	 rdiwky/Dp1pLljc+3LXLCkJ6mvShdqDpX/lGBy/bbN8F+QYfT3b8K3lCERuTPNxsqdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZfx8zG3lr0SxJdej5NZrOvMKfAGpQe9QBAGg9mMie8=;
	b=W+d57CX+j8kGQvuRwrbsnXxO5kP1foTtZl0D3NzWIllRON3wOLcPpbu3p/r2O1ICAwHw
	 uK1pubImuKefstpuLlHrLpOMY3ByUKExw62WixwORBOuWSuBsF8oZxYQu97jRACHa41qH
	 wBZjtjhEJYJ4zvRmPKumc7rKLruGzEkh6A8o798sKwA0hD8UQn4fPKslgL989PnYw9dGb
	 ySro+omWeJLdRf5zWyjrv2vHwhp17HaXtZ3vjJCzmMLvS+ydCPikfZqOCw1ZXlYSwTH/0
	 bZcygX+f1dA6SYD+IOUpPa3N03up2m7UN/IvGORVCp1PnWZEs1rp3DLLrFfFj3tIeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkBZBrhz;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B6A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkBZBrhz
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1297766b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556336; x=1794161136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZfx8zG3lr0SxJdej5NZrOvMKfAGpQe9QBAGg9mMie8=;
        b=xkBZBrhz35b1PtVI3eDzsXibSRdAnSrMXguCCo3D1eUCyG0jBF5Exo4cXt8kSKSMFt
         w5+0p+bsWxKcqGCSAOo5YSKu8uWNn+KYw1xmp302oQ/wXTG9PCbSF8vo0xVBIzKxMcOp
         MkDhNibvjQlpV0a2/skrJP7x6IRyEnyg0Cf99BzB16LdRK8HY+l9Qq88RRIARUmbPRRm
         jNU/0Dx4D3fXDdsNWYnLzPc+X2kARabg8umHOvCr4GgjqrwAIlznJCFVOSZ9CnP0Q5tZ
         G7RzXprwQ8Gqgbi8ZDCEgZIBcyZs9alsut6IYf+JxgUD9eNyTWrT1j20lqhCKHwn9keb
         rS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556336; x=1794161136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZfx8zG3lr0SxJdej5NZrOvMKfAGpQe9QBAGg9mMie8=;
        b=muv41PdrU4l9slJ9+CqaVvWsRZdv5WBBX3/J6aPZDMzle5Mbrc6oOSITdgiSfvEqr4
         3M0c078JqZwn7G0U52sMhHWXQHwAtxDzwc5qxPEPxbiJbUDMwcybGY9L5owV0NzyAMN1
         i7GQhSQiCNMA1j4qjJUNnNvkVRCwWVOffWVQl5gl7muXvGbpkaKYctXJPgpJA5igL5E7
         7JQGtfypSfqsdLUSk5DWs+N3YFxCs6K1zSKD8p/Ifdbw38yiiXcz9n8MDpzzn9KgqU5m
         WztbcfcON56mLAGu+GpP7okYwFiioa11AzxJlXdV42EZuKz5zwRqhVJlLQutIeKAQ9Ly
         sCdA==
X-Forwarded-Encrypted: i=1; AKwUvBz2ezqClom7NPeWVjijBPd0N3ITc+3+nHpJpWAF2+cee2frM23KCVQhlN7Lq4RSLfRPSlGrHt2/rXcYdsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ98U3CJMlZZvtXeo8D7+pLOOWoK/dpFJ3G85iyKe6n6VLNZSn
	CLTODlURwr/u/0lKPCtDw/Tn8EdWD0m2zV0iG7Qp1ste9UZyZ8HMyX9K
X-Gm-Gg: AYBFou0loraeUS9IGZ0k7QxrQtb8SkmOkMBB8gF9ymiTpOkjAsv/3qXMpYvnrlVa/Q+
	a6+H4OCozWNSeX9NJSNwhfTcpIx3NjUDdWXxwTcmBmkdlrjQUEYYPqfeTMi0qSS3Yn1aFfDlVsW
	yZZO1rcHlP/La7Urmx6GJd8QCS3laOea3j/RaB0thLrNDCw9v5UwmCBKpkeTVbb1GAQVAvzFkSU
	dRbgXXfdg/kDCuFo1K/4cw0eEVLvOzXw0ebI98GCcVDGfvumefwJZ/43/J3fiTOnishr9ODDr7S
	M7SJ8RXXQsllx7VR45wBG0WuQvyQyC1U7IXysNW/yDI6eUnyfHqPTbdBBR4kXvk6ACGfcNOlHS9
	S3ouaGkfuxIlWjvvWkTByfPoRGQctsBD72UcnCmV3qosEscI37MWPrlMLiIW3hMmqTrlMmurpLF
	5v48qRCtF3Fy6dVY3LzNka+JHc3tUoERPetBHDltlgazLx67JUe9WfSOO24yPgQcvqgw+oatu2o
	gjzrDgPSbo3Bcli9Xscnlncgju77RtwFdZNpt0refNWSKLXBx+mSWwX+Ii635c2El9NlgVOMatM
	7Y3vlGzmYmqlXr35h+n3C2w=
X-Received: by 2002:a05:6a00:6c83:b0:899:915:792b with SMTP id d2e1a72fcca58-8a9bfddf73emr6622142b3a.54.1793556336463;
        Sun, 01 Nov 2026 10:05:36 -0800 (PST)
Received: from tabby-boi ([2a09:bac5:4fad:e6::17:370])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8ac269b8805sm446544b3a.44.2026.11.01.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:05:35 -0800 (PST)
From: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
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
	Connor Abbott <cwabbott0@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Subject: [PATCH 3/4] drm/msm/a8xx: add a memory-only GPU crash state
Date: Mon,  2 Nov 2026 02:05:07 +0800
Message-ID: <20261101180508.66598-1-nicoangelodelacruz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

a8xx had no gpu_state_get callback, so no devcoredump was ever
produced when the GPU hung or faulted.

Add a8xx_gpu_state_get(), a memory-only snapshot: the generic Adreno
state from adreno_gpu_state_get() (ring buffer contents and fences,
with rptr read from the hw_apriv shadow rather than a register), the
GMU log/HFI/debug buffers and the HFI queue history. No register is
read, because the GMU may be wedged and GX powered off when this runs
from the recover worker or the SMMU fault path. As a result a8xx
dumps always report "gpu-initialized: 0", as a6xx/a7xx dumps do when
GX is off.

The shared part moves out of a6xx_gpu_state_get() into
a6xx_gpu_state_get_gmu(), which also runs adreno_gpu_state_get().
It is a pure move except for a new gmu_regs parameter that gates
a6xx_get_gmu_registers(); a6xx/a7xx pass true, so their output is
unchanged. Reviewed with git diff --color-moved=dimmed-zebra: apart
from the moved lines, the new code is the helper's signature, the
"if (gmu_regs)" check, the locals the helper needs, and the call.

Tested on an Adreno 830: IGT msm_recovery gpu-fault (6 of 6 runs) and
natural GPU hangs produce dumps with the ringbuffer, gmu-log, gmu-hfi
and queue-history sections; capture takes 1.1 to 4.0 ms.

a6xx/a7xx: build and pure-move review only, Tested-by welcome.

Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  7 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 47 ++++++++++++++++-----
 3 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 92e8c8abb..0f4b0af0a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2918,9 +2918,16 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.active_ring = a6xx_active_ring,
 		.irq = a8xx_irq,
 		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
 		.gpu_busy = a8xx_gpu_busy,
 		.gpu_get_freq = a6xx_gmu_get_freq,
 		.gpu_set_freq = a6xx_gpu_set_freq,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a8xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
 		.create_vm = a6xx_create_vm,
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 79912a33e..03432abf9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -338,6 +338,7 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		struct drm_printer *p);
 
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
+struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 26c17861c..a3751358a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1629,25 +1629,19 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 	return;
 }
 
-struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
+static void a6xx_gpu_state_get_gmu(struct msm_gpu *gpu,
+				   struct a6xx_gpu_state *a6xx_state, bool gmu_regs)
 {
-	struct a6xx_crashdumper _dumper = { 0 }, *dumper = NULL;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct a6xx_gpu_state *a6xx_state = kzalloc_obj(*a6xx_state);
-	bool stalled;
-
-	if (!a6xx_state)
-		return ERR_PTR(-ENOMEM);
-
-	INIT_LIST_HEAD(&a6xx_state->objs);
 
 	/* Get the generic state from the adreno core */
 	adreno_gpu_state_get(gpu, &a6xx_state->base);
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu) &&
 	    !adreno_has_rgmu(adreno_gpu)) {
-		a6xx_get_gmu_registers(gpu, a6xx_state);
+		if (gmu_regs)
+			a6xx_get_gmu_registers(gpu, a6xx_state);
 
 		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
 		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
@@ -1655,6 +1649,21 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
 	}
+}
+
+struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
+{
+	struct a6xx_crashdumper _dumper = { 0 }, *dumper = NULL;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu_state *a6xx_state = kzalloc_obj(*a6xx_state);
+	bool stalled;
+
+	if (!a6xx_state)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&a6xx_state->objs);
+
+	a6xx_gpu_state_get_gmu(gpu, a6xx_state, true);
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
@@ -1714,6 +1723,24 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	return  &a6xx_state->base;
 }
 
+/*
+ * Memory-only snapshot for a8xx: no register is read, as the GMU may be
+ * wedged and GX powered off by the time this runs.
+ */
+struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu)
+{
+	struct a6xx_gpu_state *a6xx_state = kzalloc_obj(*a6xx_state);
+
+	if (!a6xx_state)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&a6xx_state->objs);
+
+	a6xx_gpu_state_get_gmu(gpu, a6xx_state, false);
+
+	return &a6xx_state->base;
+}
+
 static void a6xx_gpu_state_destroy(struct kref *kref)
 {
 	struct a6xx_state_memobj *obj, *tmp;
-- 
2.53.0

