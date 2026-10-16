Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3210D4A4F0C;
	Fri, 16 Oct 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155304; cv=none; b=OYEfAnvLne4RUubId71taTinevMIFX4fR2gVuXFbngrdNxV/FZptGUpeZhyN/TjQn1ZdsGJdpybJHH85gApIcrn9B7fWjKwCEUdVDXxy7kraWxOir80nuMRWciTG0AuozgQ3vj597vqiUcsjQLeB00CVz976gaKka2P3kQA+OYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155304; c=relaxed/simple;
	bh=ea2OUxXLWQt5wLiM83SWl80l53VzZvnJqIMVUE0yUBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RF4STQMtVOqGmLWnySJqrUwfmPmsbS8x3eUWtVf36YirI1ek4aw9PU2c+GsMrJicPKqheIomSnlaCVlSrBsnxsh27VH7M+f0GEORqJDyfJTIREerIbtzYwJwFs5rfvkoAMKTR2wNlOhx0qyPfatodXYOUFajQp8Gfs3wh4V93VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO+q235S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO+q235S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0815FC32781;
	Fri, 16 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792155304;
	bh=ea2OUxXLWQt5wLiM83SWl80l53VzZvnJqIMVUE0yUBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MO+q235SNMF5ugDLGtO6PV4DeBiFytq/IAX/5Y1osktwUWlKVDjL//Sb1vJgygnvM
	 ufgT9b0kCgIVINshwuXCheVjltUuxZYXP8F7arRJnBZYntAw3qJ6+ymLil/8os9tkC
	 i8zSKMy+UkELuXmfBsfkxNrGLZiPDxZSKYRU9TElrGVK6JhTNSo/M/sp+4oNPilwol
	 +sqELOBSPlarloaeCdeHlMbNIo/kt217OfTjQ1eZevpmJeIOnyOsgrmdglrnu4KakK
	 nbAAPxMAOJJbsUWjR85NXLKN9wzvrpiZwOP221576q5yBPYQAfMFGbprbz1Gr/1fPd
	 YzeAcoR3HiQUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B57CCF2C1;
	Fri, 16 Oct 2026 12:55:03 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 18:23:14 +0530
Subject: [PATCH 4/4] drm/msm/adreno: Add Adreno 620
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-adreno-a620-v1-4-4a7ed6210d7d@brar.si>
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
In-Reply-To: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792155300; l=1735;
 i=patches@brar.si; h=from:subject:message-id;
 bh=TWtFaD6Cu2y3fcwXHfGH+7v1dt6VDV1C2TR+TW/3vM8=;
 b=tiEY/urZ6uoeNOO8oKnRlwhkiykMQJ/KVboQRNQsKg5GKqdhxUt3deLS1JYZG5AKOQmmi8dK2
 JWdeYnFUT2pBMOhjtuuR1t5s29KkQkYWwhnMRJDfdBilWKmn5r6LeRL
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

From: Ishu Brar <patches@brar.si>

Add the catalog entry for the Adreno 620 (chip id 0x06020000) found in
the Snapdragon 765/765G/768G (SM7250). It is an A650 derivative and
uses its SQE and GMU firmware and protect table, together with the A620
zap shader.

The speed-bin fuse values map to the OPP bins as in the downstream
"lito" devicetree: fuse 0 is the default bin and fuse 132 and 115 are
the two alternate ones.

Tested on a OnePlus Nord (SM7250) with Vulkan.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7..45480dbf4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -943,6 +943,31 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 169, 2 },
 			{ 180, 1 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06020000),
+		.family = ADRENO_6XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "a650_sqe.fw",
+			[ADRENO_FW_GMU] = "a650_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a6xx_gpu_funcs,
+		.zapfw = "a620_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a620_hwcg,
+			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
+			.gmu_cgc_mode = 0x00020200,
+			.prim_fifo_threshold = 0x00010000,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 132, 1 },
+			{ 115, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06020100),
 		.family = ADRENO_6XX_GEN3,

-- 
2.56.0


