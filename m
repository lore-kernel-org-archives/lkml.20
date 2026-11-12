Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469956;
	b=wz8BvhktZRsoMQ1h2bqnAfyb3D0WljUaBywpV/f/d1sAHmzxJUlmZjXi2U2hXLf2JU7P
	 MmddOGWtODS4qknEVBIMF56FPDTInKRs9WIzm22AbzT+gUBir5bEnCj2ucE9rFCD4mEuE
	 2kWXlr5ZdszyhKD6t0b4KlRyFJn8H/s8K72i13eLyb4Pd6ACXeYtxnrcfP4jmWQqsqnNk
	 xQ0tRwk/pO8VBs42kn6heHJAstekWWsrMgff864S3krEZS74cNejHC5Uh8dFcCh5adhd6
	 Ws4X7DGxXOoUpESKYz2t8bMb30Oc3NiNk2MGnfOlnCH+JeTYzRyLisDpTHEjeuKGk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zR8Eij2FPJgIUhxryQ5YRxF7TN8W0EpDXclL86k6m10=;
	b=v7odxqoSRnLWgE5ZOWz+Nc/Hk4my2Z+A2K+QOoIw8fbjYfMBO2h1yTS8xTfiDVVTRHLw
	 L25s/XzfBiwoaqeCfuHnzyUCFvt85xCnXg+ze44XVdv3G/JLyuLtGUGykA5eEBNopGVXF
	 xzPP23AfiFu3Bd9bYPqjHfWpn4jf/DYoZFHm0UkpWLlOgCdB/aKA9jzPUAGqmDSZLEKyu
	 AOyC25GjvKmKKz2W7mRILxfxH7W5LhG2POvEMVJuCG9aYvtKtIeJhDrCRxd8cz/Pa6F2C
	 mCX5cFl5VSO+aSSAzDcRDOcKmPCK2H0rYs2WJHWsytLW+jVrpT6ggtXGlD1d5Gq6LcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wllTw1FJ;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03AD606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03AD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wllTw1FJ
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1818308b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469955; x=1795074755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zR8Eij2FPJgIUhxryQ5YRxF7TN8W0EpDXclL86k6m10=;
        b=wllTw1FJSefjRxI8dVg3xqjiIbINMTysvEHAsLVpjmtTDs0Vk4sHhe/4viz5kZQIm9
         o7kZ0MHndEa9Y/HNeMXly4ImlsThnxmhqHOZjlcMp/OZ7MeJYzekTB8wpi6ZOOFLBR9a
         4ozlncFErpROdBjQHwRKXmUNAQ9tHUA2mublHQ8uhlAVwsEADvH8rAR3z1u23rhKcTOJ
         Ca1rOyvzjiHcBe/nC1BJj3DhOHZPUUEU3a51iRoUquNY9cdBbqvA7LJnqrHAPv800FaW
         D7drMUD6KYb1Mmaj4H0iiux6CzmIErw9WhZl3yM/8wjcDDXyeTKdWGoRKRLR0yrx7LK4
         KwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469955; x=1795074755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zR8Eij2FPJgIUhxryQ5YRxF7TN8W0EpDXclL86k6m10=;
        b=KdeLmUefPW0RWA0EDuiPrbs4ZILmO4JRVOmK+uuizK9pQJFfpDxAE9iwA/Pbcit/Mm
         nPOUvK3Nj75X6vHMbm5Clm1WUnUxguPngpDboutV/+Xq9cvjpjG/vGen2ECqUi8oFPk/
         4a11+IdYO6lMmyyi95hfiGBZWPNfzKRwLjW1yJJJKIaZPC8ZzBb+SAbpULVthqbBuFF3
         sRj9M42JHI3ZHcgWQhKFIRFvhFOXNujQqeP6KLvNswN86V9tQiCSTUD7YtR8Jdgt1A3V
         NEuNqrdEHftZeHBadhK+jUqBsBdFo3JIRfqhElHOmEX36xE8dp87g3s8lyeU3OpOo3N2
         Kd9g==
X-Forwarded-Encrypted: i=1; AL+hErEA2+VK2vipDB81RJwndMsMCul2o18m4VPxKRc/WhW5IPGMIbJJL91lluajl9Jkf1F4FEhXqM6CNtrrjE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bY/tEzDdNt19FObDo7OtJl3yglkd3zZjbPBDa79fuYJiCAQTh
	EdODrC/91PX7UeE235/KWCIAW38/96LllgtaKFDHHWi3cr78jfMmqlaLvA95Ms3OcG4=
X-Gm-Gg: AYBFou1Mt9GMfPydAheQDETEYamrDq3lHpMnfYJd/tJ8pcOngVI9XM9sbiUu5vo12Vp
	Pq4g2Sn3f46GHg0C8CW8cPOhUpFR3IHn7sZEJkTJUMCS8BQDg6eeTnCyKmCT+gy2FKcAbknpXyH
	P78JHAKkFJOEe+3/Pp/CAb2dWz8l03CedGQtL+rWYS00x1d/qzs5MMsm2hMl0/XWelnPJixqphX
	SPrKjj5ZKszWx/uOLeIBVVnifuuZ7wVdJ8rEZTvECc3FQxBC2n4UgcaEJ9gVWMYy7VBqthH8F6o
	3j0tqijmjc5C7yBtbs7BRbAseOEc6kqhLsTWW8QXcfneyjSi9YdzBNmQmZ78EUfTPyxUzU2XpY/
	Zpu6MHkTcNyrRRJ/xys6ZpcIAXQ8MZhUqrO1gvKuIGc5UBhhD02ObpVUnXxvVGXY4d9+a18uImN
	q05PVM6NDUKllFMQR6KBUyDwPyhnUUIV93A8/NTn7wU2mLy9IhjOOOQPwzVGNRw+FZbKWHsbut0
	yDD+aLzjB60KH5BW5vT5p/3x6OHEdRMq8C66VGVg1d2m3jgeLOFnUaci4P3aILUWdbJUOG82e5J
	eG7O3M07+Z4eUmtBEvJZktCPUEBxsw==
X-Received: by 2002:a05:6a00:2343:b0:8a0:3336:4b45 with SMTP id d2e1a72fcca58-8bc1c594810mr5000583b3a.12.1794469955132;
        Wed, 11 Nov 2026 23:52:35 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:34 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:05 +0800
Subject: [PATCH 4/8] drm/msm/dpu: expand CWB to 4 pipes
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
Message-Id: <20261112-cwb-upstream-v1-4-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=3075;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=4/WCCF14ztFcYuwH5sdlLJ/Y7c6CkeQnN0+bpY4resY=;
 b=nyBY/lFPmt026D4jaKbY3LdrTEesIm0s11kGJMZMD+33M+x3eBjnEEOkuqbVPgMHoBAu76oXa
 DrBwZvYJAoCA6o82V6wAXorre2C0gYxNXBja5PIX5ldV+gQZX1gnuoZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Only 2 CWB is supported in topology currently. Expand to 4 CWB
with dedicated CWB counter to support quad-pipe use case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 7 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      | 1 +
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 09563a766390..7ac2cdbce8de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1423,7 +1423,6 @@ static struct msm_display_topology dpu_crtc_get_topology(
 
 	if (topology.num_intf == 2) {
 		if (dpu_use_virtual_planes && caps->has_3d_merge &&
-		    !topology.cwb_enabled &&
 		    (mode->hdisplay > 2 * caps->max_mixer_width ||
 		     mode_rate > 2 * dpu_kms->perf.max_core_clk_rate))
 			topology.num_lm = 4;
@@ -1443,6 +1442,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	if (dsc)
 		topology.num_dsc = topology.num_lm;
 
+	if (topology.cwb_enabled)
+		topology.num_cwb = topology.num_lm;
+
 	if (crtc_state->ctm || crtc_state->gamma_lut)
 		topology.num_dspp = topology.num_lm;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d455845ba14b..11eae4b19684 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,7 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 4
-#define MAX_CWB_PER_ENC 2
+#define MAX_CWB_PER_ENC MAX_CHANNELS_PER_ENC
 
 #define IDLE_SHORT_TIMEOUT	1
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4ada16cf8610..9519cc59e9f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -240,12 +240,17 @@ static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
 						 uint32_t crtc_id,
 						 struct msm_display_topology *topology)
 {
-	int num_cwb_mux = topology->num_lm, cwb_mux_count = 0;
+	int num_cwb_mux = topology->num_cwb, cwb_mux_count = 0;
 	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
 	int cwb_pp_idx[MAX_BLOCKS];
 	int cwb_mux_idx[MAX_BLOCKS];
 	int cwb_mux_idx_start = 0;
 
+	if (!topology->num_cwb) {
+		DPU_ERROR("invalid number of cwb: %d\n", topology->num_cwb);
+		return -EINVAL;
+	}
+
 	/*
 	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
 	 * mixer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ccd64404f12d..9b2ea51608de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -62,6 +62,7 @@ struct msm_display_topology {
 	u32 num_intf;
 	u32 num_dspp;
 	u32 num_dsc;
+	u32 num_cwb;
 	int num_cdm;
 	bool cwb_enabled;
 };

-- 
2.53.0

