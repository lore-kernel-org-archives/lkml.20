Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D5047F796
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327407; cv=none; b=mqDpqZPeljt6aUyW5RWJksrjFFFl7RXH2PmTNWRUVhYYznb8QDnR3bAgmrpZqgRBNw1JigYGzUy7noIy+Ai86oqZNGRWv+i2sy7CC7/mc45LDsyDhNPLheEHA0aH355irbMmcAGoXyNbHfRw8LqHe6RTtbBEMBz4cIdHj9CqzmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327407; c=relaxed/simple;
	bh=eFX4xFKGu1d2iMPrSFu9VG2KHuB4iXe/IQlKD1I5PhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AK+ORfLJor7ho7JqtL3WKjF31jTQSFscCAJ2fo8aCFF4KidxDPePvcjnv06cUPPOvbNq3dz0b+1n3cc0yR5pzCKAfeBa+7hD0rHG0iRA+nVLLF15B1Mhi9ZxCsDsC9fWRHhLP4GSlPkt5VqIn8OMonrz6s+eaw6G3Klv+kvcuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yhv7d+ab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdJnYFco; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yhv7d+ab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdJnYFco"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXP0289462
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQGoGb2ujLMFHLGciJF9hIS3vNu7w27PseR4q+F9Fug=; b=Yhv7d+abFLQGf5t3
	mrQkbVYc1kRTjGA3oBmGW+QzziDvK0z1w71LlFrAM0ImYTjexx3C1LNCwsuUJtxD
	INojZxOxberVnYRHMx0cfch3Fm1+3IFCmhdFFVSYRbOG+t8sWGggG6NP2o8C+V1H
	PQNLjpdSczlfhbR3RLXNIumByvrnC9xQ8ySRcqLTY2a1rpFsyEg4cTgp1atYOX5X
	deXuWH0s+rvgI4jMt4OcI3C80kN4bqI/BO9MrEH0UtQXk/UPEh9mHxBxPXXocPmf
	/jdpVzdU88W+TOz5mwdc+OtDlyD1oN0xGco6o3bB7xYXclvEi94Z0O7LcXkFOYWW
	phc0EQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tus9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9143cb073b9so1031516d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327399; x=1790932199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQGoGb2ujLMFHLGciJF9hIS3vNu7w27PseR4q+F9Fug=;
        b=GdJnYFco8ezFwVwmv+sluwUwa4ya4M82YBhTjc0soIYp1d7rvl9RtmZ41uePMHzCJm
         bGBPNI4m2ga4vPFThjDU+i/mSNCW2srV2mqWMekDrEdema9tYcVK37pGdqoZVfJCjjAs
         CbPtzLJKl3Z07ctB2sZxu1PDe2wwxPhQbop/QmCL6fjCt1j1YN50HuataSOCajFPMMTA
         5ee6RSOdo9FUoF4rqt5xa9EESRdrITUPc4ssfCvivT1Jv2ZeFgkg6Sf2c0mw1ts+YZDD
         kUuH3drVlBeJBC7jbBPaowhMHaM1BBv5moW7XVvnKYXsBbXr8KCBe9Q+ZzbdOLzicb03
         tj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327399; x=1790932199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQGoGb2ujLMFHLGciJF9hIS3vNu7w27PseR4q+F9Fug=;
        b=HPpGCfpiOu4uuNR7+J4ITctAh8nwkBMk0Uv/Y2uuWv4unTt93lub+AtZPwnzRf0mhK
         QP+Bp8y9rK0dXPeE8S4e04KkheCu5LBjBQj9wF7byWTzKTvo0qX7tTFjUJ2ATJkYvao3
         p6VOhNfmQcmVKmRlSBGb3Ah4ZgIT6PyWWqKiDkMQEMKiZQ2aLV2Upxp6LDNPj39fRIiv
         vurPXCEcf5LIxJMWdQ31ToeDxGmj0z4hxYqQSGAvUd9D+BqQtmR49h4q/AsjKeHDksBE
         4/Hny4hWjHR35hEhqjpeSlhvznzah25xh5+JnUhT2M+m4/eutUL5WEFGVD93or76QnMG
         rWBA==
X-Forwarded-Encrypted: i=1; AKwUvBxbhgJQyZzoS6YuBfpc+9u3cXY1mCbkz/Vq3UCrWSG65V15fbfY3yoI5Nu5n9DgQpBsqxg3QJW8beR0y1U=@vger.kernel.org
X-Gm-Message-State: AFuF++kQoSrmSaGphThhr3AfVEaT3Hh66DMCCe0+4xRz9g/aIxj6gwUS
	EA6yADsmsB3SQxEnU6VLrVyPZmab8yvdHvUjsBpcID7a8XKp9Btxd3eNk0FJ728wo4Ah31UU1PW
	nJtxr2mKdJOqawgrJpTdRj8zVwVvc1N/TfoToZyza9YZVS9AmZ0hmE9rbEAPsnrJVjBo=
X-Gm-Gg: AYBFou3EO7xfEkVnWqhWOWLUsnuGUy+trmFQjbc42uyZIW+1xe8vIB4ctagCb6pNqXM
	/bF6x/V8QPbcXiSWoQQrvDxI2c3UheM03jpIreyBumjzx5Gu1/ZkAVj6YoGfTHJulA0S4+lBN/5
	LiCPH+cZ5CdNMS+Q8dSC1oCz2OMWYt0ByrXN1bT7UdyD/vqy/ElMHSzEh4Urn3m99Bda2udaKwr
	f1I0ioih01F1Wg/2qoxk3xa0acAciwp2B28wxT+oio/t+nRcOMeG7mGrG+UK0mP5JQDXRM70Yii
	d7xPhbx0zI0iA7RMwCtq/1GW58hnHCoHftoeZKckLOC9U+ppjQCe465bUs8QB8Y4v2eFUcwKME6
	Wzpmc4vXQ3IJorbov8T4v5qnnCnwBuQv9/iF/RKjBdcs4yJjYhRLAQ56S9nyXDfm/dNvfIigz6o
	VV1/Mj1Qy/6zsUtAzaq4gnajc7yf1dbId1Prb0KOFN8nG2Ki1N8w8=
X-Received: by 2002:a05:620a:7010:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c43cd31b9mr320614285a.33.1790327399365;
        Fri, 25 Sep 2026 02:09:59 -0700 (PDT)
X-Received: by 2002:a05:620a:7010:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c43cd31b9mr320610485a.33.1790327398804;
        Fri, 25 Sep 2026 02:09:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:51 +0200
Subject: [PATCH v10 4/9] media: uapi: Add CAMSS ISP configuration
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-camss-isp-ope-v10-4-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab63a68 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXys0F4vuFn/FC
 YtJUcKT9PglfKVTls8bhXgp9UuaZtzR7fz+1WhVbnl9y527hKbe5mL36qg8+OjQW/3eTu8icau5
 zvYtXCcc7unPvxciz9oFmptD3Brc138yJIkSmiEeuqeKaCOm6lhoatzvUstmw/RF2D2VI+vUvou
 Z40Ys9/vnr5dn2tHa0eQLCCGPm4IeKSxbDiG6GBJzgmDGODB1Ox07CZhLquoYdrk6WGlmaRA8z/
 90P2ZraLlFtkRegZl7E2lE8TqkhM1CST4wnhi9/OBXXIuROS9uibowMLUJGUpARWWdI05hF7zqj
 7xNV6xLixB55FlX8Jz+QD7jbCt8RfzzUlZgFZRIwEt1BjHpeAcIzkec6IkbFrXL+Oh6NpgUXWFO
 HiOxPzrTnKTezeTRSYsjzDd7z8fL5Jbsy8bxSUc2u0csQVKdNKsVnSR/c6IQ+oCFzhrMaO9zqxo
 EEH+Aq3yUt3Fk+wNyeA==
X-Proofpoint-ORIG-GUID: t8uJLnN-EugiowLmSdflL5aTsXz7zswG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX6DExWE4i0GeF
 6WqamBprpGHiM1wvjS2rGPpYMosD/jgFvAU3NYziZ/EjR4wAPlRbh6IVB2nhOlDlkxXjiZeedXv
 aiOA4o6dTr+E+ra7AByloPZaB/q28KA=
X-Proofpoint-GUID: t8uJLnN-EugiowLmSdflL5aTsXz7zswG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

Add the uapi header qcom-camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

The block type enum is shared across CAMSS ISPs so that userspace only
has to deal with a single set of block identifiers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..aa3d97cfcc78e22a6f7ed79bee331c2dfd06f662
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_params_block_header.
+ *
+ * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
+ *	&struct camss_params_wb_gain
+ * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
+ *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
+ * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
+ *	&struct camss_params_color_correct
+ * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
+ *	&struct camss_params_gamma
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_GAMMA = 4,
+};
+
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level subtraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ * @_pad:     padding for 64-bit alignment, must be zero
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) coefficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ * @_pad:   padding for 64-bit alignment, must be zero
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_params_block_header header;
+	__u16 luma_v0;
+	__u16 luma_v1;
+	__u16 luma_v2;
+	__u16 luma_k;
+	__u16 coeff_ap;
+	__u16 coeff_am;
+	__u16 coeff_bp;
+	__u16 coeff_bm;
+	__u16 coeff_cp;
+	__u16 coeff_cm;
+	__u16 coeff_dp;
+	__u16 coeff_dm;
+	__u16 kcb;
+	__u16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-16.0 .. +15.992)
+ *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
+ *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
+ *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
+ * @_pad:    padding for 64-bit alignment, must be zero
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_gamma - per-channel gamma correction curves
+ *
+ * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
+ * holds one independent lookup table per colour channel. Each table is a
+ * direct (not segmented) map of input level to output level.
+ *
+ * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
+ * output. The number of significant output bits follows the width of the
+ * engine's internal bus; the upper bits are ignored by the hardware.
+ *
+ * The module maps a 12-bit input to an 8-bit output: the top 8 input bits
+ * index the table and the low 4 bits are used to linearly interpolate
+ * between adjacent entries. Entry i therefore represents the output for
+ * input level i/255 of full scale.
+ * Output range: 0x00 = black, 0xFF = white.
+ *
+ * How to fill a curve (same on all three channels for pure luminance
+ * gamma; different curves per channel additionally shift colour balance):
+ *
+ *   Identity (pass-through, gamma 1.0):
+ *     lut[i] = i;                                // i = 0..255
+ *
+ *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
+ *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_GAMMA
+ * @glut:    green channel gamma curve
+ * @blut:    blue  channel gamma curve
+ * @rlut:    red   channel gamma curve
+ */
+struct camss_params_gamma {
+	struct v4l2_isp_params_block_header header;
+	__u16 glut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 blut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 rlut[CAMSS_GAMMA_LUT_SIZE];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct)	+\
+	 sizeof(struct camss_params_gamma))
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */

-- 
2.34.1

