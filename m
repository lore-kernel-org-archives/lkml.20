Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A94E06D4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284529; cv=none; b=gitNFNmuZyN/hXLnzqlxGi5NW8YPFMiPd8emcIOUaP5xQVQmLghBOt5Z9Y5Q89E3aOk4PALxa34otaCCRDFlgfBCxIqurM2Rtjma4GfVDOQlAgQz8vKQHqNjWyGpo9uaKZ53s3W9L2e72MHiLGoFQxTo0z7EF4fE3TcbbOoCM2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284529; c=relaxed/simple;
	bh=e02s4WWH9yTVcdNXW9xvol+o9MtMw5H+b3owIqeQiAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNQtiazPNRNoiSy3EEK5Nu6kvbdkb3jllgxTYrNUEI0Js6P6cK0a1LdDZSVs+w8oqiIAjdt+q9JNny94sZg6ojj5TU+At20BRUsTtM4ZP1/GxSXPRmnhTShWmFNveo7Xmau8r/qXD6bLnF1xbdNdBfTUDztJVXTMWmDYw2yTLeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mz7NdAbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isyYjwnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mz7NdAbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isyYjwnO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdnd13613941
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJ0xZghxcteqbgqQNa5Ju0bXGRBgVxcsciLwivSYvoE=; b=Mz7NdAbNAlf8h0Co
	k2v4yGHyQJRsvNr/GRswo+5QJlKr2zmQZkeapv6h6BM+47Elrbv7H5Q5wUPOi0CV
	y90QsqIEa0/evXlwgiZKdOc90VIse6kqNgcUHXiihM6CbH4diIV82OGShQ16lO2H
	S3u/TWHG4lXxReyWHHlMu1sNs354jxSsySVhApVZUCaGkVKYKPU+QGrhx8G82tgv
	BT0yC1NWnHd5ICZH4SNpAW8t41OPpPSty6YMjjxW+XXQ6MzOhDPX/2NXclt/4vnf
	xVJ4THoE/Zfrecoc6DWtBZslP3x7xcxppqYbPvnLmrk4WmT+cqBIp2XtKAjMJ3bO
	QkMyTQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s92pb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so975251c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284524; x=1790889324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ0xZghxcteqbgqQNa5Ju0bXGRBgVxcsciLwivSYvoE=;
        b=isyYjwnOV+e8K6EkvRVsyUb7n/KoCDB+fOvN2vewOwg/b0FDvM4srSHdq2eQaBmao0
         8Gc1P7ch41NgnYhbCBZivBcOwJpZkGYYqq298mN7p6lhhVOVS2YnI626tZ7FJrAzNSRb
         MjhHyUaDRtoNISivCaNGNzFQ6ABtgXyyWlIk/kUcpHe5C+ruu9QdhuAnJdpuhwoDxt+D
         FFS25/cAZkdMhMw4uvjyOpxqRBroswlW3MA+Aafse6bWt2mLKpKQwkW2T4VhTLtGTjQJ
         ktaPSyPmomXUDz+RQCsfCDIl4qS/ZknBlvXnG3uAcDSHOxOfF0Ur5OsTRPQg4M5FxGz2
         kgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284524; x=1790889324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJ0xZghxcteqbgqQNa5Ju0bXGRBgVxcsciLwivSYvoE=;
        b=XcoXEYDHNajlSWEQEdhvxQKIXvc5v12A/xJOEle2Lhcz6q1QXgooePqkRdQOUXJ4vS
         QNVkybmp8rzcn8E2nGEl2R9MTGLjeC7l39H519GJzrtGmWbePyYms/+xwMX1HBUsZM0V
         IepSKVizcIf6AdMvzrg6Byj6Nwz5TRLnW+hkwt3yNCQPdJBLuGW21hS1Kx3QV/wY7mJX
         gZ39HvBILdvFzEPdUK5rIBImYd2XKaSZtdyrl/7jm7VwnxTVCDw9Mq8aqivehA3j23AU
         3C9kJgTFjRKt+mLtRpAtj6Zr3q376Oc/zHlSA2bGkreDzpcYLMgGxAhodGuR+iuwJE6G
         vihw==
X-Forwarded-Encrypted: i=1; AKwUvBwv+A7sy46Df3WaqKSTvHfmH/PE/hIOl8zErXcIfseT7zcFNAZyuTEd7e+zdPlzwJdpE85iI5AwZlG21FU=@vger.kernel.org
X-Gm-Message-State: AFuF++kJdsCrxlwOu9zAw7i22J21byTceK9g0Q9sdK09NI1SBKDJkv2G
	Alzk6BVUmFpbqgPjBbqD3KpN9fXcwR6gP8AVRPRJDoeMWdPeSIH+BmXgZSrby9L+Z+ycNangddj
	zR3QxnPjhH4/m4Ty5dqfQBNNCGYttoas4HuhQZWXn3I1fTLNSEGoiqdNsLEqqut5er/s=
X-Gm-Gg: AYBFou2boXml/V03J16jbssJjJ+OidUbj8+klIx9DKsp9j6LVpRFBAA/T3p8k3Y7OZx
	xtwWqmlcroZQ+wzGJ6mbTm1UTGpu9mGFvb6ibAVMRQJ51f3nIDzQ9kXLn9ZWK3ZngM0bmXA9ZPI
	hFTn/7qT3KjAh2Fi1h+HPQ0HlEtjJjwMIPBLssHyz9ajPfLKVFvNk0AvDBEJEBXR/EmzEf5l5cC
	4bVQVRsojRt1+e7+C6lKZbMCM+5xYbHOSEgCxtHnzjGgwjosMWOsasGiPbI7FPw+KjwFVQsFlM7
	QGnlnoIe9bWxr9Fi/3l2T29q6ljmP3NhG3qiWdv+763VPI3peZDUEF+rstdW5eX2WXTE6zvJ2K7
	rP5Q2Suy/6soV+hFAw6xKUNY=
X-Received: by 2002:a05:701b:4183:10b0:143:271a:3df3 with SMTP id a92af1059eb24-1450403a968mr2967573c88.45.1790284524284;
        Thu, 24 Sep 2026 14:15:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4183:10b0:143:271a:3df3 with SMTP id a92af1059eb24-1450403a968mr2967553c88.45.1790284523639;
        Thu, 24 Sep 2026 14:15:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:23 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:34 +0530
Subject: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=3597;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=I88dKR93qprsU57JQfFiug9aNzx2vTCQK2zznJC5iNU=;
 b=1psEMZuRUs7tbF4UQyIgkdQzaYUKb5r3TO16eJsS2mHei0/EsusvgUpRTNXYMHS/LegWQxYOi
 A/A00OyHanVDzGuLxHDd8SWZF/3mR9HLEhmSEIt7x9ElBifOKeHpu0N
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX1j0LNm1BhP5H
 uv8Bcsoy6lUnioXNJWlRAku3r1sJZoUb0RXNU9HuhkBUN/kt73k5rmMF6YzWoX1/WoyKa7iG1+X
 ToFpKHeKX4Cb5orXmZBHU13ygx3AeZstVA0jHUVotl1gOh+3WTtPWj9FZyPDTr9QcK3QUSPeRCH
 tszfQReWHiMDYZjMpTP7wGhoM5eMjdcWC2k0rOhvy9rnpr9cyGQOnqKzqTUXrrICgvJWQMX+rm+
 aVfgLkF4NKOFUUR1cRE8njEbdv3NrBdzMwtljq+X+t0QKqMjsb9l6ORy0o3+IMEsPY7MBXfofiy
 K+J9ZqxpoqgWZcY0GKcxMgY8t9wMpG85J23CJ4tr6ltW7YIfYH/o3Xbw+Uai9hhnJ0rfqoT4/sm
 t+v/JEgJ51gzEiW5UGIPtlgaZjtz6Xrdk2SBBjQoHD2xAQKYktLjiCy1HMxUUhPCbNlfpeUj9c0
 4lKVkw0kqS81sF+P6tw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab592ed cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_hwIf5ch9eKH10-pnQIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX05zqg74mVhxj
 h1w2ua29OzaPueR+yjpGiSAVP4VfThLssG/qkDlU6sSARcPONn3EgvuJXzmkG92Z/JlYfr32pUE
 HJP6ZJHUPmTW27o5+wadApB3fdqSS38=
X-Proofpoint-ORIG-GUID: 6Nq8wPS1Xc0RP8y2K3EWJTaODrVthcQ2
X-Proofpoint-GUID: 6Nq8wPS1Xc0RP8y2K3EWJTaODrVthcQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
smaller version of Glymur GPU with fewer slices and smaller internal
memories, but shares the same register layout. Also, the GMU chipid is
different when compared to Glymur's GPU. Add a new catalog entry to
support this GPU.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 42 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++++--
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 90a0c7ffb3c8..3f11b16e9a1f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2524,6 +2524,48 @@ static const struct adreno_info a8xx_gpus[] = {
 			{ 242, 1 },
 			{ 221, 2 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x44060000),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+			[ADRENO_FW_AQE] = "gen80100_aqe.fw",
+		},
+		.gmem = 15 * SZ_1M + SZ_512K + SZ_256K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_SOFTFUSE,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &x285_protect,
+			.nonctxt_reglist = x285_nonctxt_regs,
+			.pwrup_reglist = &a840_pwrup_reglist,
+			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
+			.ifpc_reglist = &a840_ifpc_reglist,
+			.gbif_cx = a840_gbif,
+			.max_slices = 3,
+			.gmu_chipid = 0x80a0000,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 388, 1 },
+			{ 357, 2 },
+			{ 284, 3 },
+		),
 	}
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index add93c1fa039..165620d51109 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -200,7 +200,7 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
-	if (adreno_is_x285(adreno_gpu) && state)
+	if (adreno_is_x285_family(adreno_gpu) && state)
 		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
 
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..eb394d9a1d9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -597,9 +597,12 @@ static inline int adreno_is_a810(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x44010000;
 }
 
-static inline int adreno_is_x285(struct adreno_gpu *gpu)
+static inline int adreno_is_x285_family(const struct adreno_gpu *gpu)
 {
-	return gpu->info->chip_ids[0] == 0x44070001;
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->chip_ids[0] == 0x44060000 ||
+	       gpu->info->chip_ids[0] == 0x44070001;
 }
 
 static inline int adreno_is_a840(struct adreno_gpu *gpu)

-- 
2.55.0

