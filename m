Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F53D3CFB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459877; cv=none; b=LQTZkp7a39S/St5XMuSgkAhq3h0NvIoHN5h80SkKwZW2lie7/yZHocnYLs76P/Y+PNTuZnklMC7B3l8h7VCJHc+jqC4AO00zGHExU8x54et6S3G8r9zzKqUyCfUgLSvjMMamoUhBmRqvq0eq+tnSkLQIvEW6XFfKRCCYB4FprSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459877; c=relaxed/simple;
	bh=VB7rfIqtGoDKlSD9otyLdhuwA81Uw5TfgQnnUWobIgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2qZJ5GUoR3f0F6D2QnbtbTTAxxhDqzUdijdTy3YR59w75OZ93ntkXwMN5Bs1w8pF4/VfV6yHprh42pL7chXmmEVcoVnJgr4xSOBWVaeuWeEKKAJr08jFKbjkmFuB7h5NnyRBwpFeAOHfw8114q/R/UkouSR2aaI1MOqtCVoakE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgDf4IfB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iw6pfx/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgDf4IfB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iw6pfx/+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZPAS3487175
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7IQZQa5/6IC2HNgetbE142vyWr9XyPxBJevjzJHhEw=; b=mgDf4IfBZHm+AHXi
	nV1bitLsXNyb32jsn1rJkoaFBGmGWISq+Y2tas04OTk9qOpEI/yLkgzBxZ8V9uxJ
	27gGRaKzBdUX7h66Vyw6uIqOOjRomJdzRUnvWG3mbVKlILR0fvaxnudK+YavW0vr
	G/MTOWXU5lzKmFk+H1UC3THjXJyMiV0c0Bz5MuSfsENVyDrRBAFdw0Qh34hGD5h/
	SsUVKrkFuMSatd/QqmeEWEuYVYDFHDYr5zr4BBvIkwZ33eIxgtDxx0hnIGZ73IOJ
	zlALq6dXMyqjajUyQhsEAyDuoBlff4Av7DTAbWvidqrS+df+dMJR7qEI3HVRVb/R
	5IhlMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jerfn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso481356885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459873; x=1790064673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7IQZQa5/6IC2HNgetbE142vyWr9XyPxBJevjzJHhEw=;
        b=Iw6pfx/+5IuWSf7207jKTfhR262qFt/fPQwIx1sGce8VrTetVByEFoseCbinvNAtyq
         vhuSCtCLMYRsMmiAtiMmm7UiRhRFlZDs+kw6b+Ku9iqmjU3UpuNJ67OK/p928TAicRrk
         fiUovnqPbkFfVLX/afpF3mCT3jPvacwlEFUhYGN57A7OYjwhbCwU01k5rDsAiIpaQAYC
         qezutKodD4Rvqef3EODlKdU1IuUHDAS68Eob+VtwODf/VAe51DkH/27FSpGIks6aCNSG
         fgETi6sjatk5L10EY04bjrXup2aqcWD2ANOejtwZ0JSpuxHCSIINhfEUOoSkYg7MAV4L
         r5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459873; x=1790064673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7IQZQa5/6IC2HNgetbE142vyWr9XyPxBJevjzJHhEw=;
        b=BRL+26or61Q790+OVVJwymMI6Cvu7jDWlE0P8LZsYhfynu8xdAKNs79km9zI7V5RVh
         n6bZIFhRMFmaCa7BsXFfk/vNStTT+FtAlFVKsdNckt+04S7mu1Y2C9hTQVzo+CQUdyZY
         IokdN6aJ6v2chp4ux48Eb8fCz6vEi+T0f7XjXqTxOK5qDEDAWb9AfmDTuZKUBQv/uTU/
         q7BWjM0nfkaWNSZVjDg2dqWyWU/FHrAKIiJ5BL2ZnTEsCaVVrt3ropnPUQqOR43FQZez
         roo7aIqvMqTmj14lLnZr67cvx8DBXooQFyZXWriAVRZ5/DH42lFs/Wv5oQwHyDvOOC/B
         ynPw==
X-Forwarded-Encrypted: i=1; AKwUvBwyxdIjWz8da7WR6JkSOKXn+T46W3NRY/496TgnTYIEaTfgo7c79SWYHvYqE1oGeu6IldkfXUb+b08Muf8=@vger.kernel.org
X-Gm-Message-State: AFuF++lbllCH012Zwrze+2aPAILncHzh5ch+7ON11M0KggwtlaWtPRIZ
	1KiaX5Hyk8CUFFQtmRmSgGIsGUruDPZqvUiYsqyu4CE366+uQg/zfJ23X3QmFI9cJ0sJiHPIjFu
	RfbF0vYZlKlDl5O4gZEtJZdvjNnRKaDbRURkyg/DOBAx6Z7hsd0DBNSMwN/1/wYn6Riw7o4ork4
	kaRA==
X-Gm-Gg: AYBFou0OvumJXeFGGtz7aUK+WwwhMpZH1zhgojfuhfz8T+A5rf+pLcO9XiqEb+tyl0N
	d/3gvgAZbrWfiaJXRkzo9tpFZJi3bPgmrJPmw0UknK02hUcA/6Pyfok3E6G7TLnxvJ90cxA/Tc8
	bTOFwvA42+xbFu7EhSPjXVtfGr83gALCC4drMzDeKeTiCbheZOCYej+0so8n5Zhs9WNrtjqlkLh
	GImUuiVAU1rw2J/zBmOUwpwGtZ/6OjBEDxbK2vgQQQI7tNJhuhdT8yyiaxWeONLMtQaVd6Gi3WL
	RVCfpi/kegUf06dZU3ZOpKAAzBV/6h32EbR6z56mRqjBXUnhRFjRB32MDOdtXABvVXZulwP3IxS
	qdUWR1Opzv0Bl33e6QVW74MQjaNx3PmrhyLLaXku3xUkYU73DVCByCcOYRwCRTNSKXNIVl8qJbT
	md9Y8M29Jq2IzmEH+jJWQgZ1e7RTQ59b8fW0mtqlcD1QtDcGOAI+Q=
X-Received: by 2002:a05:620a:1708:b0:939:6df7:73f0 with SMTP id af79cd13be357-93a29c26d71mr927429285a.50.1789459872887;
        Tue, 15 Sep 2026 01:11:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1708:b0:939:6df7:73f0 with SMTP id af79cd13be357-93a29c26d71mr927424785a.50.1789459872411;
        Tue, 15 Sep 2026 01:11:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:11 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:07 +0200
Subject: [PATCH v7 4/9] media: uapi: Add CAMSS ISP configuration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX4TIZpQVVkqUB
 H9KfZyExCmyvZzaINDPX6EGWoFMB1xTHtWI7wYMYCoWYCWr9yyfYGo7Pe+dLDHgH0QF8GHdoT64
 aYg9DCtycwA81xxVOCTqMedWPZv48qs=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa8fda1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HGdwOU_5D0X-eGCZ8D1EY4-pTdKNR2E6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX2/iqkvzma4Yw
 wLnjvuedER+kBi1Tyr3eiP+4x4dQEDJcXq5RAjl67NpKI2DkjnK8NkprU5R0bHLODwN9RXay6AJ
 1gVNqKIzoUMj+6QreMFEDqd1jII3LuxaAQ8QwTS4RM/5EktgSaJ4f6I1FIbambiUU4E9AUt+KRy
 0CGezUaoYDRmkEDyCHp4rr44jddpCiLS+aVRP0aOHDxO1Yr9VnNmr3CanJ+Eu41W7ba/en8zEi7
 ubtAwLT5vlvtcFwXsea2N/Y1l+1sQp0Le68m4oMAcJPfPXRfxXZIZcO6+fdenPDs1VRwOvQvyLd
 otEcgfxW8NkPWnfJ8rh6/JFoLHTGXHjFgwe8Ye4x2EjPEZERYnaeFbC1lsQXL8oCbkVKixq11Ac
 wdrCKeZMD+6OzUEmXPPVKUnyckfuRE4AN2+oClAuVPp21m7Wi4RrRIGsYJjXsabL6SFidCL72Xy
 YyJvoUOH7QwjFM280/g==
X-Proofpoint-ORIG-GUID: HGdwOU_5D0X-eGCZ8D1EY4-pTdKNR2E6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

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
index 0000000000000000000000000000000000000000..e3d6cc4df7de00345e8142c81392dd42338c6ead
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
+ * @CAMSS_PARAMS_OPE_WB_GAIN: white balance gains and offsets (CLC_WB),
+ *	&struct camss_params_ope_wb_gain
+ * @CAMSS_PARAMS_OPE_CHROMA_ENHAN: RGB to YUV colour transfer matrix
+ *	(CLC_CHROMA_ENHAN), &struct camss_params_ope_chroma_enhan
+ * @CAMSS_PARAMS_OPE_COLOR_CORRECT: colour correction matrix (CLC_CC),
+ *	&struct camss_params_ope_color_correct
+ * @CAMSS_PARAMS_OPE_GAMMA: per-channel gamma correction curves (CLC_GLUT),
+ *	&struct camss_params_ope_gamma
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_OPE_WB_GAIN = 1,
+	CAMSS_PARAMS_OPE_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_OPE_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_OPE_GAMMA = 4,
+};
+
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_OPE_GAMMA_LUT_SIZE	256
+
+/**
+ * struct camss_params_ope_wb_gain - White Balance gains
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
+ * @header:   block header; @header.type = CAMSS_PARAMS_OPE_WB_GAIN
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
+struct camss_params_ope_wb_gain {
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
+ * struct camss_params_ope_chroma_enhan - RGB to YUV colour transfer matrix
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
+ * @header: generic block header; @header.type = CAMSS_PARAMS_OPE_CHROMA_ENHAN
+ * @_pad:   padding for 64-bit alignment, must be zero
+ */
+struct camss_params_ope_chroma_enhan {
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
+ * struct camss_params_ope_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_OPE_COLOR_CORRECT
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
+struct camss_params_ope_color_correct {
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
+ * struct camss_params_ope_gamma - per-channel gamma correction curves
+ *
+ * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
+ * holds one independent lookup table per colour channel. Each table is a
+ * direct (not segmented) map of input level to output level.
+ *
+ * Each table has @CAMSS_OPE_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
+ * output. Each entry holds an X-bit output value depending on internal bus,
+ * the upper bits are ignored by the hardware.
+ *
+ * On Agatti OPE, The module maps a 12-bit input to an 8-bit output, the top
+ * 8 input bits index the table and the low 4 bits are used to linearly
+ * interpolate between adjacent entries. Entry i therefore represents the
+ * output for input level i/255 of full scale.
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
+ * @header:  block header; @header.type = CAMSS_PARAMS_OPE_GAMMA
+ * @glut:    green channel gamma curve
+ * @blut:    blue  channel gamma curve
+ * @rlut:    red   channel gamma curve
+ */
+struct camss_params_ope_gamma {
+	struct v4l2_isp_params_block_header header;
+	__u16 glut[CAMSS_OPE_GAMMA_LUT_SIZE];
+	__u16 blut[CAMSS_OPE_GAMMA_LUT_SIZE];
+	__u16 rlut[CAMSS_OPE_GAMMA_LUT_SIZE];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_ope_wb_gain)	+\
+	 sizeof(struct camss_params_ope_chroma_enhan)	+\
+	 sizeof(struct camss_params_ope_color_correct)	+\
+	 sizeof(struct camss_params_ope_gamma))
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */

-- 
2.34.1

