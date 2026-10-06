Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B213B95FA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326503; cv=none; b=uGXbHxuQQe81m0AjrvBmxx5wc6JZxSSP/ChWq9uBUZwSAU+yoMQqTNUrTM7Zx5Xt7ZYKxID2Q1ng8zJURUsJ1KRy4tkUMNm8lK6cLHwwCq0IKCNRZHEr+0CNR5P6tRJV3Xm4l1UDf1d5cNMxoyrlKk8eaXc7L+t3xdL+W9Oy/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326503; c=relaxed/simple;
	bh=rqu4FNhdUTumJ7gLHxysCsjwWP8otYcN5T2HHl3nAs4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ghlz5BmpHrYxHk+J2nWT3YCf1IRy4ftoUfJurAJbOOkND5zPp00zzxmiZvJM3SBxvzlGwyNeyCrrR7sIUeszvtOHFrJeuYuKu9znallEvcK/U6P7JqHeNcdhWfS7dFveZqCIIMacC0dDRwTbF1UpUoxacKtGwEFMVAkn8cJSv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgrjsCTg reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgrjsCTg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNvn1195947
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=suZeTeSV/HU
	Lbqllr/rTwPCg3vSPYtN+s0P60aSvpIs=; b=LgrjsCTgvJqoHs3EYouHDy1r61+
	UybrtS/7xWD2rod8ejOeHWcZFoQNIxAFCu18SnrLMJovGRdGNA6Gy6BIKTAELuxq
	Zu2C5+ViqQSZYmpM7gioUIj5m7VclldPKQJLn9+WUzJV5oaU/T4j0bFgkg+39T39
	7tgDsB0yBa3aAE6uk0KPTmPp/33ddqNYoHA6SAZetCyvfpBRdGXnKXmrzPjTwnxK
	2Q4Na6LK3/dyPkPC5BWREmVI1g/Ikvi7+MZMNI7i3fkbs4TOiV61c0dv7WleMhBh
	4B8Ly4EJXGKEYaXLbyVg1x/dBDqebE8vy+3ocWMn+w6KJgZIgvloCa2fonA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmruf69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so541849985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326481; x=1791931281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=suZeTeSV/HULbqllr/rTwPCg3vSPYtN+s0P60aSvpIs=;
        b=bI1snDyc6SA7MslSR+Z+9FqQV/y5vmf143bZEqZ3Lqenxs4OTAEUnCzhiNGpOddsZI
         HLbDkwJ1haRbW0zLXf78FaIMUEBN3Pa4SdCDiHINH2SCEhq11ieCabF/jk3SMCntI2+j
         N0PlijALy+omN97AfOKbQXoxt20YXRtk9SWyYMOpcaNIfHAh2/0fAWiQUzH23w3iIFlr
         GoP8/fpC2sVF2f8ep+k2/MyTc85eWKZseQGlWGw4lR0lHpgDi2IvtIo5zH88gq7cAAnt
         CkwYBregLrK8Ej4RHYOOedXcf7pKTpx5Ck4oM9ure/LE7+EG9RLNxsgDobEr2p+lKjch
         dGwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwePUfclD/3Z2sRdVoc8J2gR/JN5D3sl8+rIREBLPAO1W34aoURScwtObt9uY8IJhFTpZ8hh1CtB/zEirc=@vger.kernel.org
X-Gm-Message-State: AFuF++mRh3vJxvguXMOJW/wIvq3EVBzTUPaI2dKC+E4VftI+n2clPkC/
	vGOF4KxN+/zpOk5QZIeUHvx5pUP9G7+dXw8T0xeqhWdNjYFFkq96UtmpHr+SLAyBrUwejzse4zQ
	sJYUAi2j62RPrmwFNZhJF7m3sew7PhgfSxtTBlZXUiT2siymuDCz7yUDcsNbIFYN4KMI=
X-Gm-Gg: AYBFou3e5WdXLgiu74RkBDB7gFfQQBKt6CDaavABuCuPT73hu3bLvIFOWYc4OO8fHMf
	pRMvunMD2qNZ3L1LYw7y3r0TYAZzcpZFDE+JSYTw7v4ddrDeg4AMLBR9QSSeTxlMXiUjBNW+jGH
	bPLE+hYUGdr8qKxzJh47h0mDvYHXEXL4YnuRkqaygQcNA5xOzPQGpwN+DtDuhbrFJ95HYBdoujt
	KfAzgjvmaiLrgYf09X60yPfL6DoZEW1V2ZhC7sSl8wGyaZDv7RiWrTb/c/a78vZ6HtXYMf6tjog
	RzMEvUtNegv0GVM5R1HHCpAs+PMkW3YiMd66Rw7nfe1Q0xoJQkFT9wkGv/o=
X-Received: by 2002:a05:620a:700c:b0:939:c7dc:8712 with SMTP id af79cd13be357-93e86041086mr763427185a.15.1791326480725;
        Tue, 06 Oct 2026 15:41:20 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:939:c7dc:8712 with SMTP id af79cd13be357-93e86041086mr763422785a.15.1791326480259;
        Tue, 06 Oct 2026 15:41:20 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:19 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 28/45] media: qcom: camss: sa8775p: add IFE scaler v2.3x
Date: Wed,  7 Oct 2026 01:39:36 +0300
Message-Id: <20261006223953.3382273-29-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac57911 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=j_Fy4U6pMzJLmy7aSM4A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: CFTKAP29UIAdeFBBU1OpF8hqiPZenQKD
X-Proofpoint-ORIG-GUID: CFTKAP29UIAdeFBBU1OpF8hqiPZenQKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1alGK1LqubPN
 uSZVkVf+Jf8tbLPAHfA5FATpgwxp2ySrGbmxpJYzCrd9ntthGueT68b3RVKhW2/iTWvGwcUKmkF
 2wz2VrXW/VWCJE4hUtVivdm0ZT04HiO/yIQgNi990iUXIrvlQIhqDBaJaFhEejaxr5yC6DPOlm4
 M19SXICyWuZM57CleuF89DsiCcduVaKeZhkWpV8Jn+w+zRGdP8FYv5T4Z3jXmp0qarLk/DkLkgN
 s+JaTb+e2W5s++FZZxuwmaFUNylsv2M6RwyurD+ajAVo7BPMtJjuwqN701cWvIK4XcqGtCwek9+
 trQgn5+QMNKjXD289bLW1sBBJjah5LkGRO4NI4lYeFUkQsijEl5AEaVBJkp6i1HIbCws898nDPc
 htzNkrcWZOTxEKAsKcTpwABKkErjrQwc+8O6I50RFey7SttvIMuoLAYZ6+hNIo6Ep6wIUVEw0NX
 ydobYMZeFVZrsuEwTVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXwTfcPdXkE066
 reW4PsqRiravwkwUAhuFg2nTQv3ccwdPjwrqY2TJOb5YAiYvZcNVcfYBu/Y/UBb9lmn/2CtCyxT
 4PBwZff75KCzaHbcxwPHgBaNgLynRsQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the scaler helpers used by the IFE v4.1x pixel outputs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-scale-v23x.c         | 203 ++++++++++++++++++
 .../qcom/camss/camss-ife-scale-v23x.h         |  19 ++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 2251b57ba38b..e28b7477dab1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -22,6 +22,7 @@ qcom-camss-objs += \
 		camss-ife-mod-v10x.o \
 		camss-ife-params.o \
 		camss-ife-scale-v10x.o \
+		camss-ife-scale-v23x.o \
 		camss-ife-top-v20x.o \
 		camss-ife-pads.o \
 		camss-ispif.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
new file mode 100644
index 000000000000..13ce9cb93bb0
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/bitfield.h>
+#include <linux/math.h>
+
+#include "camss-ife.h"
+#include "camss-ife-scale-v23x.h"
+
+#define CAMIF_V23X_Q21_FORMAT			21
+
+#define CAMIF_V23X_DS_MN_MODULE_CFG		0x60
+#define CAMIF_V23X_DS_MN_CFG			0x64
+#define CAMIF_V23X_DS_MN_IMAGE_SIZE_CFG		0x68
+#define CAMIF_V23X_DS_MN_H_CFG			0x6c
+#define CAMIF_V23X_DS_MN_V_CFG			0x74
+#define CAMIF_V23X_DS_MN_CROP_LINE_CFG		0x7c
+#define CAMIF_V23X_DS_MN_CROP_PIXEL_CFG		0x80
+
+#define CAMIF_V23X_DS_MN_MODULE_CFG_CROP_EN	BIT(8)
+#define CAMIF_V23X_DS_MN_MODULE_CFG_EN		BIT(0)
+#define CAMIF_V23X_DS_MN_CFG_V_SCALE_EN		BIT(10)
+#define CAMIF_V23X_DS_MN_CFG_H_SCALE_EN		BIT(9)
+#define CAMIF_V23X_DS_MN_IMAGE_SIZE_WIDTH	GENMASK(29, 16)
+#define CAMIF_V23X_DS_MN_IMAGE_SIZE_HEIGHT	GENMASK(13, 0)
+#define CAMIF_V23X_DS_MN_CFG_INTERP_RES		GENMASK(31, 30)
+#define CAMIF_V23X_DS_MN_CROP_FIRST		GENMASK(29, 16)
+#define CAMIF_V23X_DS_MN_CROP_LAST		GENMASK(13, 0)
+
+#define CAMIF_V23X_INTERP_RES_0			0
+#define CAMIF_V23X_INTERP_RES_1			1
+#define CAMIF_V23X_INTERP_RES_2			2
+#define CAMIF_V23X_INTERP_RES_3			3
+
+#define CAMIF_V23X_POST_MN_MODULE_CFG		0x60
+#define CAMIF_V23X_POST_MN_CROP_LINE_CFG	0x68
+#define CAMIF_V23X_POST_MN_CROP_PIXEL_CFG	0x6c
+#define CAMIF_V23X_POST_MN_CH0_CLAMP_MIN	0x70
+#define CAMIF_V23X_POST_MN_CH0_ROUND_CFG	0x74
+#define CAMIF_V23X_POST_MN_CH1_CLAMP_MIN	0x78
+#define CAMIF_V23X_POST_MN_CH1_ROUND_CFG	0x7c
+#define CAMIF_V23X_POST_MN_CH2_CLAMP_MIN	0x80
+#define CAMIF_V23X_POST_MN_CH2_ROUND_CFG	0x84
+#define CAMIF_V23X_POST_MN_CH0_CLAMP_MAX	0x88
+#define CAMIF_V23X_POST_MN_CH1_CLAMP_MAX	0x8c
+#define CAMIF_V23X_POST_MN_CH2_CLAMP_MAX	0x90
+
+#define CAMIF_V23X_POST_MN_EN			BIT(0)
+
+static u32 camif_v23x_calc_ds_q2(u32 src_size, u32 dst_size)
+{
+	if (src_size > 64 * dst_size)
+		return CAMIF_V23X_INTERP_RES_0;
+	else if (src_size > 32 * dst_size)
+		return CAMIF_V23X_INTERP_RES_1;
+	else if (src_size > 16 * dst_size)
+		return CAMIF_V23X_INTERP_RES_2;
+
+	return CAMIF_V23X_INTERP_RES_3;
+}
+
+static u32 camif_v23x_calc_ds_q21(u32 src_size, u32 dst_size)
+{
+	u64 rq21 = (u64)src_size << CAMIF_V23X_Q21_FORMAT;
+
+	return DIV_ROUND_CLOSEST_ULL(rq21, dst_size);
+}
+
+static void camif_v23x_crop_config(void __iomem *mod_base,
+				   const struct camss_ife_pipeline_cfg *cfg)
+{
+	u32 rval;
+
+	rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_FIRST, cfg->ds_mn_crop->left) |
+	       FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, cfg->ds_mn_crop->width - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_PIXEL_CFG);
+
+	rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_FIRST, cfg->ds_mn_crop->top) |
+	       FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, cfg->ds_mn_crop->height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_LINE_CFG);
+}
+
+void camif_v23x_scale_config(void __iomem *mod_base,
+			     const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg)
+{
+	u32 height;
+	u32 width;
+	u32 h_q21;
+	u32 v_q21;
+	u32 h_q2;
+	u32 v_q2;
+	u32 rval;
+
+	if (cfg->ds_mn_crop) {
+		camif_v23x_crop_config(mod_base, cfg);
+		width = cfg->ds_mn_crop->width;
+		height = cfg->ds_mn_crop->height;
+
+		rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+		rval |= CAMIF_V23X_DS_MN_MODULE_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	} else {
+		width = cfg->in_width;
+		height = cfg->in_height;
+
+		/*
+		 * Vertical scaling misbehaves unless the crop registers are
+		 * programmed to the full frame, even with crop disabled.
+		 */
+		rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, width - 1);
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_PIXEL_CFG);
+
+		rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, height - 1);
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_LINE_CFG);
+
+		rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+		rval &= ~CAMIF_V23X_DS_MN_MODULE_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	}
+
+	rval = FIELD_PREP(CAMIF_V23X_DS_MN_IMAGE_SIZE_WIDTH, width - 1) |
+	       FIELD_PREP(CAMIF_V23X_DS_MN_IMAGE_SIZE_HEIGHT, height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_IMAGE_SIZE_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_CFG);
+	if (wm_cfg->width < width) {
+		h_q2 = camif_v23x_calc_ds_q2(width, wm_cfg->width);
+		h_q21 = camif_v23x_calc_ds_q21(width, wm_cfg->width);
+
+		writel_relaxed(FIELD_PREP(CAMIF_V23X_DS_MN_CFG_INTERP_RES, h_q2) | h_q21,
+			       mod_base + CAMIF_V23X_DS_MN_H_CFG);
+		rval |= CAMIF_V23X_DS_MN_CFG_H_SCALE_EN;
+	} else {
+		rval &= ~CAMIF_V23X_DS_MN_CFG_H_SCALE_EN;
+	}
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_CFG);
+	if (wm_cfg->height < height) {
+		v_q2 = camif_v23x_calc_ds_q2(height, wm_cfg->height);
+		v_q21 = camif_v23x_calc_ds_q21(height, wm_cfg->height);
+
+		writel_relaxed(FIELD_PREP(CAMIF_V23X_DS_MN_CFG_INTERP_RES, v_q2) | v_q21,
+			       mod_base + CAMIF_V23X_DS_MN_V_CFG);
+		rval |= CAMIF_V23X_DS_MN_CFG_V_SCALE_EN;
+	} else {
+		rval &= ~CAMIF_V23X_DS_MN_CFG_V_SCALE_EN;
+	}
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CFG);
+}
+
+void camif_v23x_scale_enable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	rval |= CAMIF_V23X_DS_MN_MODULE_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+}
+
+void camif_v23x_scale_disable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	rval &= ~CAMIF_V23X_DS_MN_MODULE_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+}
+
+void camif_v23x_post_mn_config(void __iomem *base,
+			       const struct camss_ife_wm_config *cfg,
+			       bool chroma)
+{
+	writel_relaxed(cfg->height - 1, base + CAMIF_V23X_POST_MN_CROP_LINE_CFG);
+	writel_relaxed(cfg->width - 1, base + CAMIF_V23X_POST_MN_CROP_PIXEL_CFG);
+	writel_relaxed(0, base + CAMIF_V23X_POST_MN_CH0_CLAMP_MIN);
+	writel_relaxed(1023, base + CAMIF_V23X_POST_MN_CH0_CLAMP_MAX);
+	writel_relaxed(4 << 3, base + CAMIF_V23X_POST_MN_CH0_ROUND_CFG);
+
+	if (chroma) {
+		writel_relaxed(0, base + CAMIF_V23X_POST_MN_CH1_CLAMP_MIN);
+		writel_relaxed(1023, base + CAMIF_V23X_POST_MN_CH1_CLAMP_MAX);
+		writel_relaxed(4 << 3, base + CAMIF_V23X_POST_MN_CH1_ROUND_CFG);
+		writel_relaxed(0, base + CAMIF_V23X_POST_MN_CH2_CLAMP_MIN);
+		writel_relaxed(1023, base + CAMIF_V23X_POST_MN_CH2_CLAMP_MAX);
+		writel_relaxed(4 << 3, base + CAMIF_V23X_POST_MN_CH2_ROUND_CFG);
+	}
+}
+
+void camif_v23x_post_mn_enable(void __iomem *base)
+{
+	writel_relaxed(0, base + CAMIF_V23X_POST_MN_MODULE_CFG);
+}
+
+void camif_v23x_post_mn_disable(void __iomem *base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(base + CAMIF_V23X_POST_MN_MODULE_CFG);
+	rval &= ~CAMIF_V23X_POST_MN_EN;
+	writel_relaxed(rval, base + CAMIF_V23X_POST_MN_MODULE_CFG);
+}
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h
new file mode 100644
index 000000000000..d3ca6420a5c7
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#ifndef _CAMSS_IFE_SCALE_V23X_H_
+#define _CAMSS_IFE_SCALE_V23X_H_
+
+void camif_v23x_scale_config(void __iomem *mod_base,
+			     const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg);
+void camif_v23x_scale_enable(void __iomem *mod_base);
+void camif_v23x_scale_disable(void __iomem *mod_base);
+
+void camif_v23x_post_mn_config(void __iomem *base,
+			       const struct camss_ife_wm_config *cfg,
+			       bool chroma);
+void camif_v23x_post_mn_enable(void __iomem *base);
+void camif_v23x_post_mn_disable(void __iomem *base);
+
+#endif /* _CAMSS_IFE_SCALE_V23X_H_ */
-- 
2.34.1

