Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668501;
	b=cSdvYW6nIwGAM/YMFdX3+i3Dx2qL2p9DWW/uMKRVd5p1ehtG267oj+JvnDvwJROfYp9t
	 uhtXCAgDJhzgpo6m9bimB1hDbTID/Op5C/7noOaKFTxdPQYEv1CGO1l36qMuGrfVznzha
	 8NgPjpQCazwiXrE7e9pl/EK3gfMegPp3TxHewOlKB+3pmWyIew2BOgFzejCNKiaN9piIR
	 goJk02HdLtmYoQJVjUSxs28yX+K4P8X6byEhdfPZJ/mEUVbkVk/VtY7K0iaitpb4migwY
	 53lw3xc2b7HSSQP7kBA9lG/+pfEHXDhZB+3qbjLrdkVFLBEVNGD5GPeTMZTpMq7wcCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668501;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KSp4S9ZjwuzfWMIR64V3sA3RWYtIEheB53HHsN9pZgg=;
	b=PWF7BqlUTqj5X24Mk/8NDfFpEjAh4sNMamBjVKJMmWsJbOhAbejMGP1MvDJJWMszwIZh
	 36UWI0Ket7zPvj+rP8ldWyAqaVVdUkRgCmQRf4vsERl5Z50SPqupcxsIVmI+HzDOS89iu
	 27gicMNszyW5aFqD0jgTyqNM86y9rlQ0PXPm8KKOIhRUXLiF9bnVIJBQBihGWnxhkaG8v
	 fNToMoIlSCbecD3w7Nfrl471nnxmlVQxADjFzHrGE69bNqXhz8zvzAcuZNxFuNUOhyipC
	 1NG9J0RjH5G0QmowuEfMIHlwH1e8wxmGs90W8QlpBvWu1NLbJWrN1eTQUSB1Nm75O6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Cj3zBLG3;
	arc=none smtp.remote-ip=91.218.175.213
Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB34606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB34606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Cj3zBLG3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lNXLLbEeqUH/mMzBqqTzZLUvl7muWrYcqXhU83WuGQQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668499; v=1; x=1794273299;
 b=Cj3zBLG3TVxip4THiBIwb61+V/bnfqEp0vHlUZYBLDaEL3MA9lJ3Nl0iY/FxZK0/7wtFxYQ6
 CbyxOPShG1Ug4zKaGJcdgZzkGU4hPDid5I7WxMXIiU3RqJFF0GiwGc7fsYakO44jUvTVSluslfk
 b8ln7i2Z+2bUg6CVFLZ2CyXuJRZWG+6PAD5p7NV4fIfKUDRHloF//dTxVSOsVJ18ScbgPTYBvOA
 BrcEK2NXrkwbTYhi6qAVx/i7ncSgIdWtPcvdu9Uw6CM0phH46veQI2wM+OG9PIQYR52IfH4E+wz
 o5JmopsqjRkgOuiPD/HmNCnB8pB+EhmyveiOG+PIFTwpw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6eebfda754537df2;
	Tue, 03 Nov 2026 01:14:58 +0000
X-Mizu-Trace-ID: 6eebfda754537df2
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
	Simona Vetter <simona@ffwll.ch>
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/msm/a6xx: Import a680 hwcg sequence from kgsl
Date: Mon,  2 Nov 2026 22:13:53 -0300
Message-ID: <20261103011358.65398-5-val@packett.cool>
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

The initialization sequence for a680 differs from a640 in a few places.
Match downstream by using this a680 specific one.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 56 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 6c154792cb07..48197a54984c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -9,6 +9,7 @@
 #include "adreno_gpu.h"
 #include "a6xx_gpu.h"
 #include "a6xx.xml.h"
+#include "a6xx_gmu.xml.h"
 
 static const struct adreno_reglist a612_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
@@ -449,6 +450,59 @@ static const struct adreno_reglist a660_hwcg[] = {
 	{},
 };
 
+static const struct adreno_reglist a680_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_CNTL, 0x8AA8AA82},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{REG_A6XX_GMU_GX_GMU_SP_RF_CONTROL_0, 0x00000001},
+	{REG_A6XX_GMU_GX_GMU_SP_RF_CONTROL_1, 0x00000001},
+	{},
+};
+
 static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
@@ -1163,7 +1217,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
-			.hwcg = a640_hwcg,
+			.hwcg = a680_hwcg,
 			.protect = &a630_protect,
 			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
-- 
2.56.0

