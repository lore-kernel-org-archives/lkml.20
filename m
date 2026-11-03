Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668489;
	b=1E1Wn2kcXreAPQf/scoAggSCGEJ3rd8TaZbBMyAkH2H1fDVR1hypQhhc/BvblG15KLX0
	 oisGdMXNtqZql2iI8mQ1cwvrG1O+imJKV27AoY+4HSq2ZcjEOc1tYmcX5SsbTxoldAx6A
	 ZqPTAxxoXd6qBW7Vm4mIsZQsmSgAx9ZEv6b3rN+osajg5sfnKYatfJf4Ky07kl2HZoCvx
	 qAi/4Q9qK6AeLZQ77AujUeEuMClJM0d5sJ0uaoTzPTcxnWv5QMinK3QYTZDE0V7YznBtM
	 3622gAPqLBuqqnabuQuM3Qee5rK9gpV8MAFoTuPyL0ejz/D2FSBzespcMPlS2Ab45Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668489;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g/UwPbZsEfKPyu0kqvTNSyQCWMIFwuSw3fy30ScQPdQ=;
	b=NBC7rj7oDpCf+FWTZZ1onfTJ2JZVoL0yE6pijahC16rd8BMjeDAG4NMr39qiEsrpujq1
	 UKF8caJQOK0BBiZjzZqz1EKrrnR6zajEMcCRlHiYTNglBoUBo8Jac7rluI32jJ4Kg9de5
	 haw4ZvK6xow2R5xQtC7Zeg2J0PtknR5TGOAxsVS/MxwcdRFDM8C/jsIXfB4+y3WN6v5bH
	 hCUSsD496jGcmj50aBkHmha4FBVKaf/Uzm4vs0GU5/tec/TtLDxMIqwO3V2pYX88t2k4S
	 HatRttNSj4ctQtTttlh8q9rZQXZ34tT3sLDB8qOvg+rCS5RL/UPdf9Za8vJdEMLRZqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F4arHuq4;
	arc=none smtp.remote-ip=95.215.58.187
Received: from mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF8606D80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0EF8606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F4arHuq4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M7KNsVL52+HwE/KuKiYMZJHZOwiCnmNAq9sLJ6hYIck=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668487; v=1; x=1794273287;
 b=F4arHuq4FHDJHgNxIEEys7umdiHLgMrSgCsfVaV6xxPXERvRoSTxmhaBL8eYlLW6MH4mcXHZ
 M8XfHFVc94YZ43DeopcJh3CXMXl6IjcPt4mxEQ/AxDc8uQdzC51OGhJEw21xpMlXj1WL5F4dkKX
 LnNzLOhTiQwlrUZ9wOGSTPcdf6oJIGPKYT7bUzNy1AnfAx+HVHxb2eQE9gWaQQvAbZt8lPj9rNp
 hIax2WLGOQY35cTjTkCzPw0fodvKgD3f2almjEm030FLfc6IGYwtZl8IrMix7jA8vdZ0z3AqpHp
 +gyx1qzg2xj0XTRvA6JMuWjYPXh0UeP/VkNMPTwkEv49A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 347836c0883605c2;
	Tue, 03 Nov 2026 01:14:46 +0000
X-Mizu-Trace-ID: 347836c0883605c2
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/msm/a6xx: Fix GMEM range on a680
Date: Mon,  2 Nov 2026 22:13:51 -0300
Message-ID: <20261103011358.65398-3-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103011358.65398-1-val@packett.cool>
References: <20261103011358.65398-1-val@packett.cool>
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

On a680, the GMEM range starts at 0, like on newer generations.
Trying to use the 1M value results in texture corruption in Vulkan.
Fix the wrong range by introducing checks specific to this model.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15349
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Val Packett <val@packett.cool>
---
I have tried adding it to the if (!(..)) condition i.e. not
touching the REG_A6XX_UCHE_GMEM_RANGE_* at all -- that just
made launching gtk4-demo instantly hang the system..

So the only thing that works and solves the issue
is actually writing the zero for the start.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3e4afaa5345f..26440a3ccecb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1279,8 +1279,11 @@ static int hw_init(struct msm_gpu *gpu)
 	if (!(adreno_is_a650_family(adreno_gpu) ||
 	      adreno_is_a702(adreno_gpu) ||
 	      adreno_is_a730(adreno_gpu))) {
-		gmem_range_min = (adreno_is_a740_family(adreno_gpu) ||
-				  adreno_is_a722(adreno_gpu)) ? SZ_16M : SZ_1M;
+		gmem_range_min = SZ_1M;
+		if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
+			gmem_range_min = SZ_16M;
+		else if (adreno_is_a680(adreno_gpu))
+			gmem_range_min = 0;
 
 		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, gmem_range_min);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dadfe4c69438..67bd66c78424 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3 ||
+		    adreno_is_a680(adreno_gpu))
 			*value = 0;
 		else
 			*value = 0x100000;
-- 
2.56.0

