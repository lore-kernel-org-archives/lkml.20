Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F246D2D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778292; cv=none; b=VpmaymHf58vunXUmHtg1FEs5sMTvNqQ4hTolD+AGRcDkA20lpZu1eRCOYIN5+87IzMHm6Q0v+ELHv7SYoKJ8PEB4XkT14twTKufeAJlFpgtjcPZ0nCUp+2clkkCsoWXHzK3oZb2RTZAIPm99MPftnPUYuVYdrixHEvyba7aaUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778292; c=relaxed/simple;
	bh=VB7rfIqtGoDKlSD9otyLdhuwA81Uw5TfgQnnUWobIgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jb42Y1HCU4j76zBe2bvdiF3aXsAEP1gu7jkW1pnOQhLgtxqoukgi44Yw0+Nt1DImm+NhdpCMKB+1DT3UulKsOY6f0GX3qMrVvdQ+Hlg6J6VJrrJlkK8iVMFrswil2umqBcM4d9kTfUKBv3/M5oqhkZmALAunqAmm5DkRx1BwoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IydfSRgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdb/byRm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IydfSRgU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdb/byRm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmsFs3872704
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7IQZQa5/6IC2HNgetbE142vyWr9XyPxBJevjzJHhEw=; b=IydfSRgUaJWSshWc
	wPIW4v9QVq2Hd+Rd0rRCq8zrnF6dcvOb0kFCiDXjP3nr0gjoDHq9ye6BnIYc5Wl+
	cr8Hahvurd1qdW2kmSg5wTs7d1JpQPQ/oKJHsJafczaRGfZmO0nRChKItCpvGiq8
	7t3Oeyh0zVaJRcN79cAfUVJscTV8L4uxt7ckg+fULUJ8RTY5qSj67T1CYhxyXpOI
	td3xoLlxjFqTdlvW2Weif0uLz9cRwKvmYg4u4yLLNyiFXFoDc6QUT3bvCn9RlgIX
	Hlvy1uiakertOktTk3dwb4z8jisd3MlX74k9F1EzOQj7ViWUBbvU0TWpf8kwh5SZ
	J0G1uw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1nm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:51:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso528868885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778283; x=1789383083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7IQZQa5/6IC2HNgetbE142vyWr9XyPxBJevjzJHhEw=;
        b=kdb/byRmpSq19YXaCMM9PqX8Gw4mty66EX0UyoUy1LTjkeX7F78QvFfHVhNsGC7z4N
         W5hWJo/lnklG4FBvjFbuucQLo0D9J3E8V7rxCx8c+wL8icAOm6jDVIOHOqHKQc9ri+bV
         vh65tCVKxiiu5dydVfyigazE0CMYJLJ+nfjHNoC3FJUNU2rt075/fssAu85DMry8hNpA
         8pU9LCn2dCiMkd9DF5TlUXAqfIg/Hqi9/8j+RqWKWipBmK3HvoyEe4T0p7aaQ0b0m387
         6qqh0SytQPUGfYHC5JoKcy7OC+jWdV9boQaGeutM4DwJe78XGGDPnR8aOoHgKpp5ZnWm
         tDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778283; x=1789383083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7IQZQa5/6IC2HNgetbE142vyWr9XyPxBJevjzJHhEw=;
        b=b/ncZsiiO1QLL1OzysJOyubLyTvEXac4y9Pp9fZ6e6gxrgMFuBP4c06Y3vjD4Z2DPX
         mVwl7fvaMMfLkLtupddzGr0tZJaogG5DGe0zM+hwZOsXj8OGh5TGSJEZcqY/Aa6w183D
         JokQK4b2XUTtB21hHM+7bDGBGFNDf7rGPf9hYXXKyxvhXu0lrC+jHwwtEc7C0E2xoLEG
         QtIArfB/5+kvlVogL4Hrtp+K2stcMHC2y9HWXkelDngAr6HeKGw2Oe95Jcj7fIFFnlDl
         MiGhw7gkEMEplQCaQGTV2j/Abdb0y83pAton9PV2PC2D5y1BHd3J7gpuvHXe+KIQSfke
         6oIA==
X-Forwarded-Encrypted: i=1; AKwUvBzoukQDWvnTucJ8o2kHcky6smIeiKYY8sNb8QCidvq3Q+H0jVZATHx6aUluNNazS3y8w8K7Px4q7nNk++M=@vger.kernel.org
X-Gm-Message-State: AFuF++lnmUiqViL522rRcJkXo0Hii9mXyEkjW4B6AwM/BbQ7h7OC0m4j
	0LNp3PSVmTtP/MHAYMkmugTatfP7bhtTbqIdCgQ02SVNujAnzd2Acau37Dhgbm4Dy6tUU1L8hGh
	+H6Q7oWSvxln9I6AHANwHsfp0WNLrmBtXwqPTcJVkUxXOJJLOtzSbUiEDjBZrRrzRWBI=
X-Gm-Gg: AYBFou0ABiQOYmlzgNOgjlwwt7QIa64oVHRZCarJHMrd62oKOnE5kI/nAMQGOJlCuhv
	dHtqGmewiycLhNvtPExd43SVQLU8egoRgU1YEbTj5JFMMLeej7dYESP/SjNVxGnyn+SfdJv2Myb
	UovnXmqIE/aCfdjszVbDwmVsWjR6oWGOy4qQtPrOWj+eZmeLbKw1Pz37ngwHM6C/JRJJqZf7dzU
	AXNFBbg55k9HJDLvsWws0q8jnZQnbThSezi6bnlQ2gfZ0pNPHz3dzp/7n9seG7sFPceGcnjNHlC
	DA/X1WWwJLECron66kh5qlXTKPtSMrjv9y2ALjo8biPjREBrcBl2Xae7mj2JdH2Ry0ny1qlSA8X
	23s5f3FuouBW/0SKjIy1hnxoHclJ0LtULZ6wylTg1eJ8KzqUDoxakVJJTbYx3Ubo5GgW6v3cPna
	cMqK/QvsmRLk2OnjaPZnICvq52YASR08YDg4bKBqto0gVnVMX7tso=
X-Received: by 2002:ae9:e507:0:b0:92e:57ea:8c8b with SMTP id af79cd13be357-9396dcc94b0mr1723839685a.0.1788778282822;
        Mon, 07 Sep 2026 03:51:22 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:92e:57ea:8c8b with SMTP id af79cd13be357-9396dcc94b0mr1723837185a.0.1788778282308;
        Mon, 07 Sep 2026 03:51:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:14 +0200
Subject: [PATCH v6 4/8] media: uapi: Add CAMSS ISP configuration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-camss-isp-ope-v6-4-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXxlj8zzPaELUb
 Guow/yuhnGJyz6Ob5cC800QGUXcbyR9VVGVMD+87tRMHp+rT5CRpp0A/ta6r3L8q8QIMeAS1JkM
 GrGxELfoXDoaP1zmr742XPFxBY9vhMJg1kvEVdLU8kE63k8QJLgwXLjYjmVfz0aeg/reZ5w9Snl
 cbDNrZ7BaMq3ybzP+C2nDTdJR7fEt91mYTIJ9e/QjkHSvcRCmBYYFJuC/hOl4iv9Y7PeIJYzOp+
 d8ZD5yfZxOeeQY2Epevl8AYtsQ0ilACequKUL1zSQlxXGLrY0p1DATGhFnCJK6hRhX9zGP6V3mk
 UzV6lavCccEQVUZ58ZJLWdjxBowsCsnC1SnEtnNO3GL08Dgax1cl2D5cP3CK4kViIDv2Tb2aFyU
 bZ3VrxTdEki+Fe9Jzn6cMa87S9QhRt8Wh5O0ib98Vzy+QufuDVjz4VXFqKzXchxpCAs9HyUoQ4Y
 OCWYVCzIgV6Cx9Ha8Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX5x9WjmXj1CVo
 hJMx2YMk3Mb87ShP3+Xs0jOn6RZFNGcdcj5RloC+N6O/+sjgpWCBWhwWyiJo37m8c1AwF/bCS7Y
 YO1l/9NGYtPKfF63XK1rf6eoD0/Zyoc=
X-Proofpoint-ORIG-GUID: SmITtnwlu0Bw33zr8TfNKGLUc9J8HKbI
X-Proofpoint-GUID: SmITtnwlu0Bw33zr8TfNKGLUc9J8HKbI
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e972b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

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

