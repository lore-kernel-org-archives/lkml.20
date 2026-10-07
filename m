Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CD386C25
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363692; cv=none; b=f+hx+6snUZjsIH12f6ZuglHako9ZlyaowVpobZheRj7wxym+vGTKkEaHsAULel7MjhgUAFPA6zqh2KX/klPw+7BbRr9yCqDoKAz5jdzW6vNVKxwTfwT5gd0jebDHb9HrrJvguCxpnWrpCXmxMNsQJv37NOp4HVgCbGWKlMyqSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363692; c=relaxed/simple;
	bh=dm77JisP2qryPkO1etyQVWroqhfN4DJQbsaMACzJ4JA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ask/RxkvLOAGbUeSO5hR87ei3nnehNZkVSg3Brm1pyG/1rssL3unUrTH1VyMaDula/Q8WZTydL2b2zMMXnZaCPST8NECMWxKhtpvFO6UkwBgyCDYjFU9cBhgBYtlWYsD/HlkCRkTaDBAnQyyX6BWqwON4IpYUITi+y4oNyWpzVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifb/UU0Q reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifb/UU0Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgCm2969902
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JEsmT2osR55
	9cHG4YCghhy8jV0KEReJym4+XrJb8+5E=; b=ifb/UU0Q8GXXz97OAbSUYACDKgr
	cqyjAmCYX6DalQaRg9I8R9/nRdOlgw/D6zE1R0RXkQ6GaQXPr1sWteygwANaAwe7
	jzOdYpJ3N/x4mNrijOaLLcXV4MCfDObbUvGobnQnFr7sufU8OgS5VbTO7/lT+AzJ
	ZWD3LPXsbN3Ay2EfYKKDHH7mzWfVj6LkWT4CfMZyH4/8uNKkTVspZ7o44yAe0esl
	KICjOd6tuDkY6pABrTBJgctxCwKfi2dxA+EBqfkyzgfwyaxxBF1mBF87gG/qVbT7
	ZlifxA/YACtfFWUGDwWzrbAbn/vNmIfriKLmyZLSrpGWBLVYoy+GX4kkBhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679bqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so697412485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363673; x=1791968473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEsmT2osR559cHG4YCghhy8jV0KEReJym4+XrJb8+5E=;
        b=s0njJIHRi264j+eNqzK1WUWIFrzr0i13v8pfdebWb5iyDHOLXbkHvw1EuIh8Ne8ZR7
         gIkeC0TxGnd/j8KdZdwkgQ1QYyz/VvGC8hcafZz67NwHza0Q+WEk99aggmH8w9ZQ+fPW
         CBhonQS4SDDRrPx/xd9mArbsaZZkkeaXME8mvTeN23tOEkMbQJehwXrN5+3tcAVDKndX
         uFVaZCLup2rEwK53gNLxiqkErldhM/pFD9ib9SyjNCaL45sPOp0cMNcCgrTdDkFJ0sKc
         Yrm0HeLVyic/H1nbDBSy4baq0EMv4R38+eRmtVq1bwku9/3cc90Z/tmrPy0hb3cO8odM
         OB5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKsiGJaaE9TOAx+SA2haXGBtrnqZ3Ihd3+hKZKKT0hTMfDmQEQJ1Qqk+a6UI2+9o5Py4TAvkkYHANl7rI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8SyOe64Q/s8vRaRSBhItu6I9kjBjcuVg8y6sjgmT85982Vhso
	aArpO/IobMTh2BRjghRvULQPzt8xaaVO7cqfx8NMi6cuyBwxI7ml2LgMmR6gdh35mYOa6GhFDQj
	+lUq5WwL+tTmziBDC9hNvhgRhzBmWMrYj3G8aVjINGtO5bzfZXCTlCLVKAaIvoQrB58A=
X-Gm-Gg: AYBFou1u+jrcsmvHtKVR93NRadSxW0G2joTpdGQPj+hIrFmjIO5+op/RD97RVHlIvkq
	bjLPt9MLOIqXZ9PuFzX/UXx5f8e3ML321hg6rBJ5S1/pm9piD9Nb/81jV5z7FydIWlrUim6fpO0
	uXPA/xhMa69b3dvqlTCxFLitM0FSrtz1XVWzc9/kHYNv0PsoNwkNgNxQsOcUaYA4ATxLlMKgwyF
	ELqroBBs18xpPQnn1plfRy9ETNi/18MP5R8xD8/vnV5rMrylKxhlsOgPbsKelmQXW4UdcyeU1CM
	7tnwK+xzzFEBoBkMPqtA8dI4LyzFKkXWyAriq9QPpbu/XaQ6UTnJS7RELDg=
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312377285a.74.1791363672489;
        Wed, 07 Oct 2026 02:01:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312371785a.74.1791363672016;
        Wed, 07 Oct 2026 02:01:12 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:11 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 07/45] media: qcom: camss: sm8250: add IFE scaler v10x
Date: Wed,  7 Oct 2026 12:00:03 +0300
Message-Id: <20261007090041.3732717-8-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7Qy41GX0ObmZ
 Y7l76M0HffPg9Y0BywK0o6LRHpavSpKnnbf5r5A26d0VBzKVMCR7k/rYCnLOVbHNZdN24CYf2rK
 zZCJbIP1KbjnpooJxJ/VapsciXwU8Ms=
X-Proofpoint-ORIG-GUID: qbNcujCMflcmUyy9GYh0zoJMLx0j-Nk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXxPpt8aShkm64
 Y5Q7447wyr45jdesvDr4xfSY2sR+lOzNjLMPXYviOJU1Kq6d0clqLL/f6M9qc9kH+Sh7GdRxY8P
 p/nmot0zLgMVaOeL+ElmdycVxAzw47zKeqosNYV1QFTsBi7pQFTLMKxY0rHzSVILyp3gc6dVcgF
 c83fV/T1KNCzCakrbaqxCZjXdQnWxCWr6p9x6A46++2Engtmufk9pyIW6vhTJAMUAmz6FQhpoM5
 ruWT1ruI14DlcUY+FF5NKzmUSFJ7klbzcT3HB5zryY5U6E1m7HviVLlLFXtuEk09tiO6JW4Nt4V
 th5MbjPIynKpwkLXISkUbY2tOqLrR1p51bBPAqEkE68kgIZmw4yh3foDsaRltqxjceGf5hm8NQa
 PY60rTTmL/oJsW0T6cOVspn4i/dEBddQgyOJ37Z+3A1pAtffuMACbbPLqvgsk4alQNLW4RKSXmy
 INS2zPw0VcdxxDkRPbQ==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60a59 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=xvU-HC0LZq_kf4miMzMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qbNcujCMflcmUyy9GYh0zoJMLx0j-Nk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the M/N downscaler used by the SM8250 IFE pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-scale-v10x.c         | 148 ++++++++++++++++++
 .../qcom/camss/camss-ife-scale-v10x.h         |  15 ++
 3 files changed, 164 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 2da998444554..dc0f307894d8 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-camif-v10x.o \
+		camss-ife-scale-v10x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
new file mode 100644
index 000000000000..a8939114cb4d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/math.h>
+
+#include "camss-ife.h"
+#include "camss-ife-scale-v10x.h"
+
+/* DS M/N scaler register offsets */
+#define CAMIF_V10X_DS_MN_MODULE_CFG		0x00000060
+#define CAMIF_V10X_DS_MN_CFG			0x00000064
+#define CAMIF_V10X_DS_MN_IMAGE_SIZE_CFG		0x00000068
+#define CAMIF_V10X_DS_MN_H_CFG			0x0000006c
+#define CAMIF_V10X_DS_MN_V_CFG			0x00000074
+#define CAMIF_V10X_DS_MN_CROP_LINE_CFG		0x0000007c
+#define CAMIF_V10X_DS_MN_CROP_PIXEL_CFG		0x00000080
+
+#define PP_V10X_Q21_FORMAT (21)
+
+#define PP_V10X_MODULE_DS_MN_CFG_CROP_EN		BIT(8)
+#define PP_V10X_MODULE_DS_MN_CFG_EN			BIT(0)
+#define PP_V10X_DS_MN_CFG_VERTICAL_SCALE_EN		BIT(10)
+#define PP_V10X_DS_MN_CFG_HORIZONTAL_SCALE_EN		BIT(9)
+#define PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_WIDTH	GENMASK(29, 16)
+#define PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_HEIGHT	GENMASK(13, 0)
+#define PP_V10X_DS_MN_CROP_LINE_CFG_FIRST_LINE		GENMASK(29, 16)
+#define PP_V10X_DS_MN_CROP_LINE_CFG_LAST_LINE		GENMASK(13, 0)
+#define PP_V10X_DS_MN_CROP_PIXEL_CFG_FIRST_PIXEL	GENMASK(29, 16)
+#define PP_V10X_DS_MN_CROP_PIXEL_CFG_LAST_PIXEL		GENMASK(13, 0)
+
+#define PP_V10X_DS_MN_H_CFG_INTERP_RESO	GENMASK(31, 30)
+#define PP_V10X_DS_MN_V_CFG_INTERP_RESO	GENMASK(31, 30)
+
+#define INTERP_RES_Q2_0	(0)	/* 1/128 <= M/N <= 1/16	*/
+#define INTERP_RES_Q2_1	(1)	/* 1/16  <= M/N <= 1/8	*/
+#define INTERP_RES_Q2_2	(2)	/* 1/8   <= M/N <= 1/4	*/
+#define INTERP_RES_Q2_3	(3)	/* 1/4   <= M/N <= 1	*/
+
+static u32 camif_v10x_calc_ds_q2(u32 src_size, u32 dst_size)
+{
+	if ((u64)src_size >= 16 * (u64)dst_size)
+		return INTERP_RES_Q2_0;
+	else if ((u64)src_size >= 8 * (u64)dst_size)
+		return INTERP_RES_Q2_1;
+	else if ((u64)src_size >= 4 * (u64)dst_size)
+		return INTERP_RES_Q2_2;
+
+	return INTERP_RES_Q2_3;
+}
+
+static u32 camif_v10x_calc_ds_q21(u32 src_size, u32 dst_size)
+{
+	u64 rq21;
+
+	rq21 = (u64)src_size << PP_V10X_Q21_FORMAT;
+	do_div(rq21, dst_size);
+
+	return rq21;
+}
+
+static void camif_v10x_crop_config(void __iomem *mod_base, const struct camss_ife_pipeline_cfg *cfg)
+{
+	u32 rval;
+
+	rval = FIELD_PREP(PP_V10X_DS_MN_CROP_PIXEL_CFG_FIRST_PIXEL, cfg->ds_mn_crop->left) |
+	       FIELD_PREP(PP_V10X_DS_MN_CROP_PIXEL_CFG_LAST_PIXEL, cfg->ds_mn_crop->width - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CROP_PIXEL_CFG);
+
+	rval = FIELD_PREP(PP_V10X_DS_MN_CROP_LINE_CFG_FIRST_LINE, cfg->ds_mn_crop->top) |
+	       FIELD_PREP(PP_V10X_DS_MN_CROP_LINE_CFG_LAST_LINE, cfg->ds_mn_crop->height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CROP_LINE_CFG);
+}
+
+void camif_v10x_scale_config(void __iomem *mod_base, const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg)
+{
+	u32 rval, h_q21, v_q21, h_q2, v_q2, width, height;
+
+	if (cfg->ds_mn_crop) {
+		camif_v10x_crop_config(mod_base, cfg);
+		width	= cfg->ds_mn_crop->width;
+		height	= cfg->ds_mn_crop->height;
+
+		rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+		rval |= PP_V10X_MODULE_DS_MN_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+
+	} else {
+		width	= cfg->in_width;
+		height	= cfg->in_height;
+
+		rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+		rval &= ~PP_V10X_MODULE_DS_MN_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+	}
+
+	rval = FIELD_PREP(PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_WIDTH, width - 1) |
+	       FIELD_PREP(PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_HEIGHT, height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_IMAGE_SIZE_CFG);
+
+	h_q2 = camif_v10x_calc_ds_q2(width, wm_cfg->width);
+	h_q21 = camif_v10x_calc_ds_q21(width, wm_cfg->width);
+	rval = FIELD_PREP(PP_V10X_DS_MN_H_CFG_INTERP_RESO, h_q2) | h_q21;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_H_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_CFG);
+	if (wm_cfg->width < width)
+		rval |= PP_V10X_DS_MN_CFG_HORIZONTAL_SCALE_EN;
+	else
+		rval &= ~PP_V10X_DS_MN_CFG_HORIZONTAL_SCALE_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CFG);
+
+	v_q2 = camif_v10x_calc_ds_q2(height, wm_cfg->height);
+	v_q21 = camif_v10x_calc_ds_q21(height, wm_cfg->height);
+	rval = FIELD_PREP(PP_V10X_DS_MN_V_CFG_INTERP_RESO, v_q2) | v_q21;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_V_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_CFG);
+	if (wm_cfg->height < height)
+		rval |= PP_V10X_DS_MN_CFG_VERTICAL_SCALE_EN;
+	else
+		rval &= ~PP_V10X_DS_MN_CFG_VERTICAL_SCALE_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CFG);
+}
+
+int camif_v10x_scale_enable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+	rval |= PP_V10X_MODULE_DS_MN_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+
+	return 0;
+}
+
+int camif_v10x_scale_disable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+	rval &= ~PP_V10X_MODULE_DS_MN_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h
new file mode 100644
index 000000000000..cb548e69f321
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _CAMSS_PP_V10X_SCALE_H_
+#define _CAMSS_PP_V10X_SCALE_H_
+
+void camif_v10x_scale_config(void __iomem *mod_base, const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg);
+
+int camif_v10x_scale_enable(void __iomem *top);
+
+int camif_v10x_scale_disable(void __iomem *top);
+
+#endif /* _CAMSS_PP_V10X_SCALE_H_ */
-- 
2.34.1

