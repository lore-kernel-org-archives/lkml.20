Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354695;
	b=09pyNSnk2+FQkuFefemoDCr3tOBH8mgxtInqID5whnSOeYceA0ZdA8mrZ3+O1eZgejiB
	 iBL8hKXHIYOOtnYDB1j0rrftnCnf9yRXlczVYq4W9aEPQvD7MpCXg6/7Hkak+0IbpDxsc
	 ughGKJ/4ntOcb1RsyvIkniExumiD7f+Y88jDuahs/zvUQYxQHthPvP5idHjE+GKc0Dooy
	 OxXWOF4Nu57bsSCkEK4p01IXfmF2AqCatVhIfaMPafzUaUNoZHJBkQYUeybN4J7/gWUve
	 eOJJyBmdZC8tNI60T0Ny6DWec4Zc3rfNbEJ3NJ4+9vYK1ut+DQOeCNYXItsRRsTI6Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354695;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rnaL+kVNjk+qwE0+x2Wn8dzdhiv+lBzw9SM0UVlu+fk=;
	b=1ODtFhfm8GUfZ0E4+70y+HT954Zz+XVLqIt5vxkU67KHHu1v99ySlvOAYyEy2uIXkavj
	 gc1s4kW13edEEOlej6ZE5HTY3vGMBQbhrQh1FMgKSenU44wPIUksD0gKbJqUroKffudWV
	 FhVGsqQX+LOmuczTibqW/V3bfaClt1iRG+3G01mY7jQjDSgpcmktkhE2vhioeO3fBSzsn
	 SYRQLzgA0Ggwb/1GGAso3LQ18U0WgsirslAwUdwMMgWis8hU4g8QoVxgUB+L85IkcbwHX
	 5Bo6GZgcTNfcuIz425OtQ+Wuh24vrIP//Gn8C0GG6vm+ri0fharFDZ9fsCzuPeT+r1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6q47jxV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779E606A321;
	Fri, 30 Oct 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6q47jxV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9A11F0093A;
	Fri, 30 Oct 2026 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354695;
	bh=rnaL+kVNjk+qwE0+x2Wn8dzdhiv+lBzw9SM0UVlu+fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P6q47jxVKqgySo9Q5bL4IiBAzZ9/QdFzeFepDtWCv1PIUNjdTI1lCgdPBuEVRT0Iu
	 brazHJu/htNDZJgYnjsPxImx7CTRzIPJZ29r25ai2lHWB9sICUI9AGsyoH4INs8SuZ
	 jF8V25b9zjxiNZawxJ+ZbTsl7NoVEKJubjUN28a4l4YXub33sPBURJ3cvB5bDfiZRO
	 ssR1qrpW238CDgGLJvVxBXBPFbG4G2iJs0OPK8bh5RFz3AjIIgm3YI70KlIp1kjH1s
	 s8G5PtC1KRunvIK9ojIJzzma+pfC3e5n3fOf9pF05CIkfGKrVn8wrNfXKKO+jSFI9P
	 lTXPvftAZOo9A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:04:01 +0100
Subject: [PATCH 5/8] drm/msm/a6xx: Add IFPC tables for Adreno 630
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
Message-Id: <20261030-topic-a6xx_ifpc-v1-5-6992841a9a32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793354666; l=3631;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ySe0q2BlYULz/e91t03gJdxsYUc92f50azZxS4CeWCQ=;
 b=Emn+dMfVpxrwIx5QWU8MoKfY59M/lxODetgnkk7eD/Wr+KfIjnfho/m333JooYc97F/GqeLhF
 RJC3Q27N+7SARO+ZFZQ2qDS22kZ4wInFjUDCfhhkJFfZWZ0L/7MovfL
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fill out the register tables to enable IFPC on this SKU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 83 ++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7ad2..5e1d91a73a4e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -736,6 +736,84 @@ static const struct adreno_reglist a702_hwcg[] = {
 	{}
 };
 
+static const u32 a630_ifpc_reglist_regs[] = {
+	REG_A6XX_CP_CHICKEN_DBG,
+	REG_A6XX_CP_DBG_ECO_CNTL,
+	REG_A6XX_CP_PROTECT_CNTL,
+	REG_A6XX_CP_PROTECT(0),
+	REG_A6XX_CP_PROTECT(1),
+	REG_A6XX_CP_PROTECT(2),
+	REG_A6XX_CP_PROTECT(3),
+	REG_A6XX_CP_PROTECT(4),
+	REG_A6XX_CP_PROTECT(5),
+	REG_A6XX_CP_PROTECT(6),
+	REG_A6XX_CP_PROTECT(7),
+	REG_A6XX_CP_PROTECT(8),
+	REG_A6XX_CP_PROTECT(9),
+	REG_A6XX_CP_PROTECT(10),
+	REG_A6XX_CP_PROTECT(11),
+	REG_A6XX_CP_PROTECT(12),
+	REG_A6XX_CP_PROTECT(13),
+	REG_A6XX_CP_PROTECT(14),
+	REG_A6XX_CP_PROTECT(15),
+	REG_A6XX_CP_PROTECT(16),
+	REG_A6XX_CP_PROTECT(17),
+	REG_A6XX_CP_PROTECT(18),
+	REG_A6XX_CP_PROTECT(19),
+	REG_A6XX_CP_PROTECT(20),
+	REG_A6XX_CP_PROTECT(21),
+	REG_A6XX_CP_PROTECT(22),
+	REG_A6XX_CP_PROTECT(23),
+	REG_A6XX_CP_PROTECT(24),
+	REG_A6XX_CP_PROTECT(25),
+	REG_A6XX_CP_PROTECT(26),
+	REG_A6XX_CP_PROTECT(27),
+	REG_A6XX_CP_PROTECT(28),
+	REG_A6XX_CP_PROTECT(29),
+	REG_A6XX_CP_PROTECT(30),
+	REG_A6XX_CP_PROTECT(31),
+	REG_A6XX_CP_AHB_CNTL,
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a630_ifpc_reglist);
+
+static const u32 a630_pwrup_reglist_regs[] = {
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
+	REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL,
+	REG_A6XX_RBBM_PERFCTR_CNTL,
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a630_pwrup_reglist);
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -1014,7 +1092,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_4GB_VA,
+			  ADRENO_QUIRK_4GB_VA |
+			  ADRENO_QUIRK_IFPC,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a630_zap.mdt",
@@ -1023,6 +1102,8 @@ static const struct adreno_info a6xx_gpus[] = {
 			.protect = &a630_protect,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
+			.ifpc_reglist = &a630_ifpc_reglist,
+			.pwrup_reglist = &a630_pwrup_reglist,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),

-- 
2.56.0

