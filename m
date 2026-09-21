Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F74BEE45
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005011; cv=none; b=KQn2FWjHlqGCcGtiGDY6sl1lz+e54XWin4ZNw5D6Yt7vB+onNMNZk6Uw0UqkOYRgxGMVPDb5e3C0eP7wa/36SwCZ3c1hQjrTWLLqJVTfvVqv3XHMFfWtUOOzzuCVNYFUe+lZ6zRxBUwWRU8YGmk+jJfdNiqApA3qfLlhk7mFr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005011; c=relaxed/simple;
	bh=eFX4xFKGu1d2iMPrSFu9VG2KHuB4iXe/IQlKD1I5PhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fI6IlgP2nqBLixq8PYV9JJt+WiueEotRqlz41LaNGJJKIw+n0Mhws/4NC3Qy1j51wzcH8UJQfHgTt5qWdWxHCJqOAdzZWCUaZ87fyc3/153LyeXcfw8q5I2rLLOR7W7/KTVvS7K4J9XKj584x5zbHUhKT0xBJoUD47mrpvBPjZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l17a2sHP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMjaD8y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l17a2sHP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMjaD8y9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAMUG2526901
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQGoGb2ujLMFHLGciJF9hIS3vNu7w27PseR4q+F9Fug=; b=l17a2sHPpJHLv4/l
	GpX7wie6QwrNwgS1Zi9Lzas/cKfVFBpjt82Xd9x8rGitysYTTOLYYnxwNtggvz6U
	qI+5YmCnZrNctYfG5APRD/Pa05OfA+JYwokZbnq4b+lY4t15RYLLHI3Cwf3TPHWL
	r3UA1hNRfhAGh5uNF3rfKnrphIOVe5g5bbPSA3imubc6PZCJR3JThZFz/6o1HQaH
	z1fXIP1rCK/STzC82+9E/s1a8TvOuo5KoNCkST6cCc+0QXRxq6zJTqzSye6QcjNm
	AAbYytJjsJUAFBon19XxQZLSh08l3cHptfiRiFb9Do2XRFDYrpyny85TmUg7xjEq
	wpUO2g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vb629-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7847917c402so2916851137.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005005; x=1790609805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQGoGb2ujLMFHLGciJF9hIS3vNu7w27PseR4q+F9Fug=;
        b=jMjaD8y9OhjqVXVbrNuHKSXFoKNil/J4A0Vu82l9TkH6tFr+9pM+BG92yQfe272LZI
         ZlWX8i9ZalFAStCTnA5q6BpPDbOcg2UQdnm2bU5II8vWBSLe4y7AcI2EQtvb1xRkAzEN
         lWO4Wl0OZP6QXvhhI0rDwhYayeQyztr2U5qGGguOSmVzAdYB301eHr80vs2QyPtBKQTa
         /PTJ0VFTgDGQg6XpKmVOXqA4B0H7hvPY2MrhSu7T1QtVk/vL/pVtEJUO0iIGAXC+MJCW
         ZLunDnHNbecn5kV2OpI75uUObLCv+3wsbkkHJZhwCTgieRIp4xV/CbiHlY+cEoKIl4DH
         9gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005005; x=1790609805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQGoGb2ujLMFHLGciJF9hIS3vNu7w27PseR4q+F9Fug=;
        b=EtxFIBe7y5Ji/yAjdYF6DxyNE4fDzcnZ0cCbowXQStXJouQlV/zFvonK74iwCGYh3d
         iB5Rpq/gOIm7KLwqswoy/eVQsmEzyL3xIsc4IsIbl5V2ZyqZPtzgJTLqDYZUeUAuhsdB
         5SUR8xmcxI3yP1OE9ygkRwFcwYXpfAxdNwARXQvrx0rg6hQMW550IYdOfheD1Ylr39T2
         ugjeXzRfzTIxWcG5JDaVd7GP1NZryhHecblPOmAimgtP7iUCwIGMom81xponXSZ7MxYk
         5HOybsN3la7jgyeGu6GrCxbx0MKsmLLVQ9FRNevJuo6l+ki7pjJJhHaBQupBR7A9As2/
         KfKA==
X-Forwarded-Encrypted: i=1; AKwUvBxHUNIBeAsNcIjKdg1AarkcdLkoQF5cUDej5saS0PcShtEX32onyra/2k8iVwZTiHeSRpp23e7V1CwwA7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kymWRyNlFNT9L+YABzwctX5idSr+pU+20+0LAPHhNLMEwrSs1b
	NQdCsmgH8x7i2PLBjkKJCA4dosvb+sgKBFjEJ8phESKiFVrh0spXrIq8F1VoDjOu3XqLfsIlSUk
	dcmzjY3sb+wZVtmYRSP4K6mF9MsIgSlSHW0RInAwgmpWXZyUm9vqGqc/mZqdVUXk7pxA=
X-Gm-Gg: AYBFou1nHga+lO6HcH/o5WP6Vkrk0G7a8GYlaX5RmYO7iWf10NZfsuuhql9KqnuN+gp
	YUIzZ1nXNyHD6cg9earEbn72c5mG4NWHAHOPiUARc0nVPTKhRnbNWLa/P/QKP2FyfhXfchufno3
	GrUAnJp23K3mkm2smKE+s0RW0/rrWZlFOhkE5d6wRRkcONtcZ+QHXmKe2aOqd4ZP/7J4i8EsJ0H
	WqQC1u93KehhG9GV0rCPrnlm5ufQHEPAMXD91wlXkYDNuBcsy41SX8KVGHxmMT9yXc72oGkw3s3
	wgA8D0ZkDGsQ2VO31W61kskv3LhpK/4MRtr78vGnIZLu1L2nxXEYpbXkhrlGdbo+6EYYa+lyYrk
	PCGKjCydkMlGLDo9dJ7MmnZT76n50+Pf2ZzkJeTFLxSLN0t11IslHi0b9SUqkzkPfkEY2Q2hK0X
	Yu5K3osKlQZYjtLXNouVEpzr5phQQla1pKnmdlSwdcloYU38EvZt8=
X-Received: by 2002:a05:6102:4b13:b0:7a1:f951:6652 with SMTP id ada2fe7eead31-7a55d899c80mr4794040137.25.1790005004559;
        Mon, 21 Sep 2026 08:36:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:7a1:f951:6652 with SMTP id ada2fe7eead31-7a55d899c80mr4793990137.25.1790005003992;
        Mon, 21 Sep 2026 08:36:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:24 +0200
Subject: [PATCH v8 4/9] media: uapi: Add CAMSS ISP configuration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-camss-isp-ope-v8-4-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab14f0e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: I578TU12FKU6F3bojSKYgu_n-zbkj6I8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX5PN71mfM6jTf
 ebLcA9RA4cxB0yAXjFYEDcVSorVbuzp01nImJUqjSEaxoFBY0CZFQwIxsaHWjBRJLpLOcMhFGOB
 iSWHUYZZ6aHikUEhqV0DNU+dEl8XTLY=
X-Proofpoint-GUID: I578TU12FKU6F3bojSKYgu_n-zbkj6I8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX6pzCs6sZ4oKR
 MS+yUZ7HUccyBJhGcDfP65ZBio2rl7vZnDli5nArGkzgfrR1XaeQQWn/mKvOO6GCI69VzG56r26
 sbxl48EFmFrKSVpkjDehx0i14agacmr4/SXehlYjGYQ8PbV9uORid0Rkpx3k3w3srdgxbLElkWX
 g2C/7QgNMIIaayOajPVEhpDiLqhoU2uQjCXeAjyBoZCw/NmtlOtZw0GaF8VvpWrPeJskMPG7WlM
 89+3cjMgj2BNsBVDnmIGST4P63nIlZmj/JJ36wRK1gha9W7uYO1HMaaDVXevrp0PS69+PvqbUzo
 flOLa3DAHS0PoN8lmiqInGB9mC8L0JAOGJLFtl9T9QiHtGKcI9pkg85Rafta/tjsg97rW+wGETR
 Bl6hdiVpS+yQAjcrtjAbSWOjd88QsNtesZ071WMcZeol/j9d+x+7KFuXu+emrpwV5YkKNIBLce/
 tuLR3m7VlTkqsmzC3lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210227

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

