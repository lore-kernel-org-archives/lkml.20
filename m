Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB193BBFCA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646898; cv=none; b=oESrngQatTd1nIyPb7U8s6PpC3Mo4Y8Wgg6Tnu3RQtPDXm2gdOTKsDy1+K4jIURhGikiKwR8hjRLKYtSej69yy0wl2uwVECkIUVPxfwuk/m2e6u9RWuNkU9Hg+GED9bPJWAo7lGe2vrTUctukSKqxq+FmeJECag84mCzCEcdPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646898; c=relaxed/simple;
	bh=8F7ncVJr8+D4X0wcIsfrKdILXvhgsSXVVg4EjjW9Izw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EB7HPSqGO9wTRIdHol822NFBeSLSEMjFqKHngJlMV1aqFHR/h7hCecJokloDDL2PNZH84Oq/TPvGw3ljX/SMT61KoQ3r1rhmsBmSCCHZuKhcQ5TbF6i/UL+Wx/bsm3nGTdjTC+0rLjz54E59tdLkOwgWHpIxr6JZ1mFUvAFMpDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgaA27j3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUqRl0Dp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgaA27j3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUqRl0Dp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFOpj6114564
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lHYrzeSQljh
	SXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=; b=FgaA27j3gnyuIesmZgEXYpCbiEF
	0TcVR4OS4lc60vtPsJlIKA3mNSy0iVnewCO+4Sgi//H5Kk+lp8basBC+JuqopDDf
	7y5Yyba8pfPW/kDQDMceNUzNTzCHjKpw0thtgthp7WXM9s3oYUXV5gNpZrOkFDwG
	EqyiyzwYi4thepbfpsZe1xHaU8LoIpHuQKVn5uI7tgr95DwUbWrPHuqWjxAuwiB4
	FKUHCVPySOSrFvUYvW+frVEgKPBg21JSb0VZH8ymK0RHkceYhfMvh+nIy0QZvTna
	ipI43B7Hjc0+2rVX7CuAdKiwmn+rrC8xXhW012VfiV7sMVMTRNVhERjtFwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9s56b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e605efae40so8798805ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791646896; x=1792251696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHYrzeSQljhSXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=;
        b=BUqRl0Dpotf9bcVaITzvPglraPuQgojs3hwULu4AgTmO8I0gGRBV4FLXoL4ijdju2A
         VvJTBaAYmjUF6F4aqkn/f4apAgniBwLooJLwsywy2rcnGJnI38oOPrn7n85QkasLkgI2
         xQNTtylRWrQKEFd3vTQPhwO/Vwb8R5Whmss0j4r+14hO0L4BGlOgX/E27GVrn8uX6w3a
         DpAuCBZuUGKAF4w9eZ/ooQcpL/IVh93VuV7NXYAeBiq4ETjQDAlBKyUvH6IwCYyB+6hU
         ieAnCa4gDLoAumVMHQyEvuSn2FFE9P8CiNOEPf49p8BodxHltFxwPEnWDMNs5f4c76EJ
         xGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646896; x=1792251696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHYrzeSQljhSXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=;
        b=ag5f8E4ylzTkQmwF7HJ6ztUMbeVCbmv8mWnMTiE4eGupg2u/JHrP1Qtm6vnmuCI3XF
         T2bxZLnzpAN1AqbQYlIx7ayiaXNFPYu/8+SE3EA5DQvrQxBvUWlR+aathHUTv5hmr0YL
         XiNTsvJ9oqk9by4UNBsi+9CgurAh1DZUXzkId9E/GxDXvKLR36xjcd/kW4x03dgCdHTD
         LyZbkAnj8C3Q1iWmgWQID8+GKVIOPIQ61Upq3oTANaZIzkPTr7asHqzWCEZ9q8dzjVou
         CRy/3Vp1uJropiohQJbLLtC4a6T4kNhlD7j+gQHRZtksjZO09HQt2QhiD/Sx0Xw3c4C/
         IRDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhhOLhI/81GgovJb0qODtS9R7lnN/DcU3KakgzjaIe+hBph39ncbE0O6Rj0MMnD7km7CwSLtqYXsX0y50=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTo4P7doGGGH26E0XjgK4ignevcsiTNlg4Q9PCEMw8ouKJXVsp
	Jp/eNHd9ejC2YatIvilDPWaUeymmZjuE2RLRVET86wZr04vTHN0Fif3U4aAVa09lfopbEbqL5a2
	W2toNDb64fz3aaB0aFr8WvzcMlck+S9ZGNE0iw8jlv8V5gauz7Hwde0afMq+qy93dZPA=
X-Gm-Gg: AYBFou06sFIgo0yTUNWsOWzotq1ICnzSAQEnvtgvCXNcOlZaobg/N8mFM9OT85D/GpA
	LwdPb2SmiHP0Z28CVyqH1ohzjtf0HPYjAmL/xUrcCJ0D5O5LfsukceVLVIM543igIJgfxmNAYzh
	GMeeFDxmVtT1WvlNrCco+kSxOqdD5ngD4cOBu1QIK97tV5r7Hz24QS4eEaSU7Q/tZ7thGtTYEcf
	Yao5nXnLdwGmxnh1fRuEfsYylLl866AILirVaCl/3KrQW5sypk8jaMKINq75286uws6ylegsGCY
	J5nioLNbG+2tA2iXWkoDFW4qML7jwK15VuLiH+y1qDo9ESo4mv9oJWTcUyfsHV1UDj/8/W/WslD
	SRdnTf33iPBiRB/Nqbm8qScNagOt6EM5jfUOTJ2kvBUlu/95aIA==
X-Received: by 2002:a17:903:324d:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2e84280aef7mr42482275ad.5.1791646895900;
        Sat, 10 Oct 2026 08:41:35 -0700 (PDT)
X-Received: by 2002:a17:903:324d:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2e84280aef7mr42482105ad.5.1791646895337;
        Sat, 10 Oct 2026 08:41:35 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422db284sm23095575ad.68.2026.10.10.08.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:41:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
Date: Sat, 10 Oct 2026 08:41:19 -0700
Message-ID: <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6aca5cb0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lSLAbbbIx1VGLg0Ku8YA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: a7RbZdp-Cs9KW1FFVN1pfTLu-jyzB1Cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MiBTYWx0ZWRfX39NVw0+/zsFt
 gnXpCyUtAh9vNCgOx5h4Yvuu9r9ed3gOCknP5TS1qlx/Wt5PDqZm5aDYUYH6lww1IQyAC2HJVkN
 H/MEndA89IAdoW0//Cvzklxmb4lfeMfYQySwAOS6hmXainLKz9mzfEllfxbuKGdEiXGbb086l7P
 9+JOPLiCgv/RpNnv0bACbLczM8xjPQJph8Dg8+scpZvDouQ00Awf50+oAoOACwaz4foT1RJgWVx
 dcUpYKiCoUd80kHLuGaRYAV9UCUHAs1XbGc2D5keUHJFG87X2/GaXveKvbqGmDTKRuOtOQWYlpy
 +Q1/VIRQZblTCJxzS0n86/ktFam27sX9groRErEFVTuXzv7wgcgfgtEOO+Y3bZOk1wFOU+Me7qi
 x+2r+resIyt8Vnhbn6TWyMqHq9APMjDPOycWT7uruiYcCnr/jgMTr3u0g6mnzmUtpHPvaoiiOjR
 u7e+xdJKN4Of7V2RsBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MiBTYWx0ZWRfXwbd96R6p0HR0
 NrEYCA4MkpT9YncLWpEsmrNBFzqas8my+FaXfqwISeJ8lqYb6zKWAl2SklXmJ2y14Z3CvKpI+e8
 UFOXZridAbgovQbkXYpyjo1+VX/CzwU=
X-Proofpoint-ORIG-GUID: a7RbZdp-Cs9KW1FFVN1pfTLu-jyzB1Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100062

It is a bit more a6xx than a7xx, and this simplifies the next patch.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 168 +++++++++++-----------
 1 file changed, 84 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7319f3ed6968..b44b0fd916aa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -678,6 +678,65 @@ static const struct adreno_reglist a640_gbif[] = {
 	{ },
 };
 
+static const struct adreno_reglist a702_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
+	{}
+};
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -1129,69 +1188,34 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
-	}
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
+		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
+		.fw = {
+			[ADRENO_FW_SQE] = "a702_sqe.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a6xx_gmuwrapper_funcs,
+		.zapfw = "a702_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a702_hwcg,
+			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
+			.gmu_cgc_mode = 0x00020202,
+			.prim_fifo_threshold = 0x0000c000,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 236, 1 },
+			{ 178, 2 },
+			{ 142, 3 },
+		),
+	},
 };
 DECLARE_ADRENO_GPULIST(a6xx);
 
-static const struct adreno_reglist a702_hwcg[] = {
-	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
-	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
-	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
-	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
-	{}
-};
-
 static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
@@ -1454,30 +1478,6 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
-		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
-		.fw = {
-			[ADRENO_FW_SQE] = "a702_sqe.fw",
-		},
-		.gmem = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
-		.funcs = &a6xx_gmuwrapper_funcs,
-		.zapfw = "a702_zap.mbn",
-		.a6xx = &(const struct a6xx_info) {
-			.hwcg = a702_hwcg,
-			.protect = &a650_protect,
-			.gbif_cx = a640_gbif,
-			.gmu_cgc_mode = 0x00020202,
-			.prim_fifo_threshold = 0x0000c000,
-		},
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 236, 1 },
-			{ 178, 2 },
-			{ 142, 3 },
-		),
-	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
 		.family = ADRENO_7XX_GEN1,
 		.fw = {
-- 
2.55.0

