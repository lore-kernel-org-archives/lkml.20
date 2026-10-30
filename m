Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354701;
	b=Ed2IanYqXzKj2U7Jrna4eQ43fsXFlGkoSikYKLzgY6ETVtLzv0jUE1a69AmBLt2Tyz8Q
	 n/0KcjNN6UeljuJnaW/7vBA89bba4q7AbTobdWyXosh62ETjJ4EvZjdAoRbZvFh8fm9ME
	 eZ9USH/LJ64e1t4ACqFKnjmPLfPXicjvxBSX5iM+ofjogQXgNYU9vCN4QJzfJo62yzTEE
	 cJsBASV/gB4qKNuXrHWyNNLUBM86ITvNWsyelMZloOUBE3cFY+pdNkhYr5rhGflnmvrqp
	 oPZXZTldNEkrQagg8hPslgXTpxdyzT4ctZN9Dg3nMMR3oXBM86nA16Mw/7ZlZpM3xtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354701;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+GO32LyuJxZ4CB3rxhjZ+uTReaisqj4Jl+d/0LVNI3M=;
	b=y3QSbxHb57x2MyI0T8aUJx8hvt9jOYMSZ0YTBHzyJAJRk1uGnyqvNl3lVOxBMxf+gfOs
	 o9IXUj31UBdWYHnfB7giVUPhZZ9HBK9nTaswqA+JEyX4ukvj+mPJYdf/jsKJI6sv98tve
	 3NM/k0VDe5i3MvSjFEMFcozdNxytiLtg7Tw6lj/HfLHzbeJP0AQt/Ro+aQHrf0SVEkXrl
	 UP/xLJ3Wm9HxzxfjopIp7BRiWltG9PSMhJskAEI7nX4U+lIHGiI3ZBOvibdlNpVygPdMd
	 DPbOm4Hfq5Ma21Luko1b8keC6wwQ66WPTSA+jJXZkGeeAMHx63q1DOEr3sVx2SrHrbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WCfuQBm/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC63606A32F;
	Fri, 30 Oct 2026 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCfuQBm/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8161F000C1;
	Fri, 30 Oct 2026 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354700;
	bh=+GO32LyuJxZ4CB3rxhjZ+uTReaisqj4Jl+d/0LVNI3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WCfuQBm/ajUVh7TkOjSzGflBEonBEN6jTYRNMojCz+tgJ4cJk+OIKiPsIVLlMljW9
	 5kpRQ3K4RC+apCP2MppOI+nDDjG9RrQ7WQHhDw/UPaibo0Ry6ujUuztNLsN9W1joOc
	 ZRJSYduFFeLifvmriLOwJ3mOVX2gcZReSMMm83cBk4FiXqNVT1lYgVmF724KMhXoxE
	 rZE0SZBjbkw3RTyYSlzPCydMOFIvqh11eaDVhCPfUx0s2FuZeSdgcBtIDm6Gfq8J6z
	 8dgAVMjD+NJ3gFLwxSpZeOecu2i7U0Joxq/4qgsELCg7CW/QUYledVyd01r7/yHA/W
	 NOkO92Z0pNVcQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:04:02 +0100
Subject: [PATCH 6/8] drm/msm/a6xx: Add IFPC tables for Adreno 640/680
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
Message-Id: <20261030-topic-a6xx_ifpc-v1-6-6992841a9a32@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793354666; l=3219;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Bn21FIZgbJ0x2iqwzVvV+m0E6nI21CSgNDe8kf/dsGQ=;
 b=tyX5LP8tzAE9ErBXE0+FGB+drPm25MZIhehecVpwV+U2oXF5vPh7oRkz9jlwJyxFTAjNFND6m
 n0xxGUmlH51C0RHyaqeGQXR6QPBajZW/huS8QyNleNrj1Jk5W1vobmk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fill out the register tables to enable IFPC on these SKUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 47 +++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 5e1d91a73a4e..89829fa8f4f4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -814,6 +814,43 @@ static const u32 a630_pwrup_reglist_regs[] = {
 
 DECLARE_ADRENO_REGLIST_LIST(a630_pwrup_reglist);
 
+static const u32 a640_pwrup_reglist_regs[] = {
+	REG_A6XX_VSC_ADDR_MODE_CNTL,
+	REG_A6XX_GRAS_ADDR_MODE_CNTL,
+	REG_A6XX_RB_ADDR_MODE_CNTL,
+	REG_A6XX_PC_ADDR_MODE_CNTL,
+	REG_A6XX_HLSQ_ADDR_MODE_CNTL,
+	REG_A6XX_VFD_ADDR_MODE_CNTL,
+	REG_A6XX_VPC_ADDR_MODE_CNTL,
+	REG_A6XX_UCHE_ADDR_MODE_CNTL,
+	REG_A6XX_SP_ADDR_MODE_CNTL,
+	REG_A6XX_TPL1_ADDR_MODE_CNTL,
+	REG_A6XX_UCHE_WRITE_RANGE_MAX,
+	REG_A6XX_UCHE_WRITE_RANGE_MAX + 1,
+	REG_A6XX_UCHE_TRAP_BASE,
+	REG_A6XX_UCHE_TRAP_BASE + 1,
+	REG_A6XX_UCHE_WRITE_THRU_BASE,
+	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
+	REG_A6XX_UCHE_GMEM_RANGE_MIN,
+	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
+	REG_A6XX_UCHE_GMEM_RANGE_MAX,
+	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
+	REG_A6XX_UCHE_FILTER_CNTL,
+	REG_A6XX_UCHE_CACHE_WAYS,
+	REG_A6XX_UCHE_MODE_CNTL,
+	REG_A6XX_RB_NC_MODE_CNTL,
+	REG_A6XX_TPL1_NC_MODE_CNTL,
+	REG_A6XX_SP_NC_MODE_CNTL,
+	REG_A6XX_PC_DBG_ECO_CNTL,
+	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
+	REG_A6XX_UCHE_GBIF_GX_CONFIG,
+	REG_A6XX_UCHE_CLIENT_PF,
+	REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
+	REG_A6XX_RBBM_PERFCTR_CNTL,
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a640_pwrup_reglist);
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -1115,7 +1152,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_4GB_VA,
+			  ADRENO_QUIRK_4GB_VA |
+			  ADRENO_QUIRK_IFPC,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
@@ -1124,6 +1162,8 @@ static const struct adreno_info a6xx_gpus[] = {
 			.protect = &a630_protect,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
+			.ifpc_reglist = &a630_ifpc_reglist,
+			.pwrup_reglist = &a640_pwrup_reglist,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -1238,7 +1278,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_2M,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_4GB_VA,
+			  ADRENO_QUIRK_4GB_VA |
+			  ADRENO_QUIRK_IFPC,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
@@ -1247,6 +1288,8 @@ static const struct adreno_info a6xx_gpus[] = {
 			.protect = &a630_protect,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
+			.ifpc_reglist = &a630_ifpc_reglist,
+			.pwrup_reglist = &a640_pwrup_reglist,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),

-- 
2.56.0

