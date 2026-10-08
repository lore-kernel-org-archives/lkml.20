Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEB3859DE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493638; cv=none; b=O6/JvmWE33jOsnWcK+v08xvWLJY8XiKEb375/Uop+NAdrjy7qov7tClYA3F6zpGbOJstS/RztqIEddnD13LCntCk2RMynAjynsI7VU6G9GNq/U0ebNiXLaLlPevqiGtNBug3eEBuOB5juX28QDo4O5wLXu3NOtrGbdOeFHla4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493638; c=relaxed/simple;
	bh=KvPdk/ipP15XJT12nt+hSp4KmfJWK6ALjQGJM6YPSac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/LI/Nmq8XYnzzvMcc8pJLZ8lrItgUDYjs/95foUDYTX7biL8tyorumvxuPrq5tIFs0bnv6IjN0BHE7U7oZDC3UW84eCjkqQlr6P4P32cgh8YD+4Zfp89KWhFDh4Vnna64Zy3zPBFDBgbEGWnwTAepdVpIOBL42ITns8xBpvyEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hItutviV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8XBJxox; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hItutviV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8XBJxox"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0GA5296734
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 21:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JiQ4G0gZ5viePGZhZ73UWJGMyPxd/63uKSm0F3XQUSE=; b=hItutviVHb3MpJDU
	dQPnWkF9t5qVQ7KoonYDYaiZyFUbLz3Ec1msFQ9kAggOGdv/lpb+ZHcZoFbsmdjr
	P4TrRFwzzHHQu5t3YOgDcxEx9bdzFuS+Lhe4dsP6Zc8fNMrOkh+p4aIRbLAd3FLf
	yUBIVkK4SdUHpJjhHcwNSDZMwaR2Xx2LzzxrKW8djlY6rDwDC/wRzaB+bvu28p7K
	IhywcJWh+bdtKA3BvTWohOY7fQF8ijTx6w1F7d8ln1CdD7H6nvvuEHUVdGBFk7rg
	O7cMi1vnpKxcODrHqKgjMAsC8Ao+65NKd9K8ca2oVKeg/O8podyVNmp/FBm4b9Cd
	p1RcFw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekv8yy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:07:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510562ef98so8018550eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493634; x=1792098434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiQ4G0gZ5viePGZhZ73UWJGMyPxd/63uKSm0F3XQUSE=;
        b=K8XBJxox0EJncXNGD6i7Tc0n6ZizrBQqwK1TTF3ma7tzsHpEq0EmJwHVtPbwQBOkTW
         Q9M6PFbDwKrDsE+SMxSLcC5pnPAica/MqJq6mAPuvhihPRK0YBuUOOZS1kj4H7LIjUrK
         Yc9Tl1AiRb6QpsNIgkwJDMyCuavKZIGO0UZCgD/gpte+/MzEK09d86F98qvemcJu1td0
         +IfUl39If+wly5shdStUxSanG/BXX+mlBiy/4xwTCqrsrJmHL2A3PQ6/NcyZJND5s1/U
         gWpCNd56DhSfLzh+QYWj+/Bsdc67rLdFaWBY+p/Idai5GRe2XdyK+DGc8qCPt/z8JDrd
         NR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493634; x=1792098434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiQ4G0gZ5viePGZhZ73UWJGMyPxd/63uKSm0F3XQUSE=;
        b=bdiiOMoAy8VmlHIow1RUifWD0BgFtLlxvLj76uagd9jQ2FuUFm3xoLXy2x3bUksto3
         BAwfCzQAYitKoNgN3kGSVQPEGMH9a6NFPKLtY1kCZXlEJeXIpbGWKhYfkcLghVI5UrXx
         N9MGe4BOy2Gqe/K4xyv2ky+1UJ3AhX3cVxZMQOvgeZz2x1OP3EFPeM/ao3YAMFsxhmHR
         jmnLY1nltZXkASjrm66Hw+VJIj+Q8VHxkhN5/F6DVMP/f6XhKm5rwCrNHImjQABDSqqw
         Cgcqv9BP3DmyxJHltIcCMGvHpwCI1gLw+2NKsGiPvp/gbggI6KBBTeP6FzF6Sj48cJjC
         zacg==
X-Forwarded-Encrypted: i=1; AKwUvBwVlKginOxOrEHuNs5TrH69sfhZkidjhw73VMxqYH8iDGOmNOR6dVIv3qdznPOGytNAmGxTE60LIaj5H6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZJxjQM3e0aLg+mYXm6g+w5D+4odFMGjRG+XSrnMVA3m7BiCNz
	6otNMBU0/jOzzWQSlH6V7byCUSHHaiABeP+4uOJQ9v1fhC2TCezYukzDZPTTEqDt2pCXNArH+cG
	k+cEScsOyVc7O4QcMYKHWAbhZYM2rgDRMxeWU8pcTWkxyFcf2fa58Wh4VbuyVVrmroEs=
X-Gm-Gg: AYBFou2iizxjP8UzRCYK4oN9xliwSLQK64wQR2zJbL1TjJ955pc/zGEulLYE22lcBpd
	U1Y1nO73Y7PHGzE5CvKtsISvpd/6on82Qj/GDnvDnM0mPn6FFgOql7cONjHwhS0pwSa7xnnq0MR
	pkpUmNoKxmWBvTkCLQmuA+Z0atX1qg5MAR7B6T3NsEM2WT+Mh7eHCX4Lm2rF8Z+e37ynJgA343Y
	3Jmrtxe7CojibIU5jBb6BGuxNevj1I6zMXXZ47PUosWv17mD07tG/Aou+gJLboc54OCVDaw8zYv
	qRx+szqA7IwTmdlRCHiR6LfS9tb1Aj/jvZ4P2tU0Epi5NfIMK+pYvDmj8GfElhw9H7NkB7sSnkX
	aMnyjH3Nv0kaMjTxsyAKkOTI=
X-Received: by 2002:a05:693c:6394:10b0:34a:48ce:b687 with SMTP id 5a478bee46e88-3537e010c56mr89282eec.32.1791493634315;
        Thu, 08 Oct 2026 14:07:14 -0700 (PDT)
X-Received: by 2002:a05:693c:6394:10b0:34a:48ce:b687 with SMTP id 5a478bee46e88-3537e010c56mr89242eec.32.1791493633648;
        Thu, 08 Oct 2026 14:07:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:35 +0530
Subject: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=5322;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nb6T8geDCzkpeFTOrwwsYrqC+RHl+27ew58mDBGW+hE=;
 b=WAACSw7F6mIiQVWQ89mlTiJMUrzTq7uamUc1N1SEjMuK0TQtTQ+BBOMdTiMhV7OzeCwgq+ceh
 Dsozw0HELXBA9aYdu2s2QNkCwDppkJ58fQuS2Doa3BL4sAcc5++biE2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: AeKNeiZS4T4fQBlYOEn1qrcuzGRNR4T7
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac80603 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hH_-AztgxIDa4u2WOLkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXwKGwUSKem1Sw
 VTNsvC9y9R9oulfKwRUMSmhgHqrzoDYYG+Sq5/DAyFifW6U7GO8PEAcUXdeOx7LSM/jeDEZpsSq
 gAdsiquehhb8+Hx1jGLvxByCHQfvh2IFn+4zt0pNEe9xzYg6ofg21z0slkGSb+OwepNKTxy3/ua
 FrntmYUK01PpRDx5BLjYszu8g/S2T+XcOkVIJJo5Wfn57dSi2OcIkYAC1/88BBKM6GtKlhEtjGE
 5H/45W7fYNFvrvcmjOwQpXbr22aPXbswzIkpehJboOvoPhyj7zxFcrL7zTr3ZwQu+oewrC192TM
 dTXYDJr6Uwt+VTRTiYpeI4lToVYBc0eM88FFIj4A0Azqm6Lw8Vu0cj5gihABM0zPaeaIZuPorYV
 PXEqCSAZkANkYLD0mEUoZLqVAa+kEqCxgyI/KG/BV6SVtIRiJeg1T7wRJBy4NSwz7cAZmA0EtPp
 9SBnGfUsoIaXCWZkw+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXz7Pk7jD12qvp
 Nqfx4d+ZWnLCFo8fN4ol2YV/Aae8YGRaYmTPuFuEBAK+R9ndqlnKRRINjsaYpPsBPw393002F52
 HC3uFfmCqGwRteyuyntMkL+UWdW1rOU=
X-Proofpoint-GUID: AeKNeiZS4T4fQBlYOEn1qrcuzGRNR4T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080084

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
the A7xx Gen3 family. It is derived from A750 and shares the same
IP-level configuration: protected registers, pwrup/IFPC register lists,
GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
record size. The differences visible to the KMD are the chip id
(0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
firmware.

The Nord primary GPU is the same as A750 but has a different chip id,
so it needs its own catalog entry. Add a new catalog entry for this
GPU and an adreno_is_a753() helper. HW clock gating is not working at
the moment, so it is kept disabled for now.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 35 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7319f3ed6968..dd198a6e50b2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1648,6 +1648,41 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051701), /* "C523v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71300_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71300_gmu.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
+		.funcs = &a7xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
+			.gmu_chipid = 0x70d0000,
+			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 3572 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
 		.family = ADRENO_7XX_GEN2,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..982c66df7815 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1045,7 +1045,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
-	if (adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a8xx(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	} else if (adreno_is_a722(adreno_gpu))
@@ -1221,7 +1221,9 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 	if (test_bit(GMU_STATUS_SECURE_INIT, &gmu->status))
 		return 0;
 
-	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) ||
+	    adreno_is_a753(adreno_gpu) ||
+	    adreno_is_a8xx(adreno_gpu)) {
 		/*
 		 * Assume that if qcom scm isn't available, that whatever
 		 * replacement allows writing the fuse register ourselves.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 92e8c8abb86d..a34f5f4e8bf8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
+	if (adreno_is_a753(adreno_gpu))
+		state = false;
+
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
 	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
@@ -1421,7 +1424,7 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
-	if (adreno_is_a750(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		/* Disable ubwc merged UFC request feature */
 		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..016a7a7a2ff7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -557,6 +557,11 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43051401;
 }
 
+static inline int adreno_is_a753(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051701;
+}
+
 static inline int adreno_is_x185(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x43050c01;

-- 
2.55.0

