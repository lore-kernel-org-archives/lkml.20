Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABD486E78
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363766; cv=none; b=JWeyxNN3VIy+DSMAmJ4o3rtQS3a6v4jCxIjF9qMv8RcDrINuWoDdeSTI43fYXnSmS/li+jhjvcflzQO+JjZ4OSxmRNh2+dXOA6sW5jmfdIrrqpLrT8d62gljSPoCm0HukEjxhtlPppcAzH7IX90ldgtZgShZEqb0QPm3M/ZEBuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363766; c=relaxed/simple;
	bh=eETLtS1y+09rSsKgIoEfVzyI+wrByEWBrjQSFtk7Tvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eEgl6mcgFI3G9XV5dcXRZjl5wWHuCv23zX/TNxOrNfyZPlsNokTRFAx83o3aMzgD07pOrLZJpdzPirXSvF5TaLgdGGDME/0qpHKnrbujFT9L46vweBro2kgAjxiaBbSm6DtKWj5qBB4PZxIcAV72gZ1dSfizF1vHwJQN8vJV360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz+VaZyV reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz+VaZyV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jhaG3298365
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ou5z7UnbrbP
	u0IqbcdGKx4n7S2K2B29+Vj3gXC092lQ=; b=Wz+VaZyVXV1dvCepR3EhWtfjwY4
	v1t4A1WUM3iJhe1PFvyu4v5LaRCm4Wz05gvMjdTG1Pt3UsBWZFU/v7ccUODZO0uC
	eFUJP7yDMnwEPCMusacTIS65oPcMvpBY3EmFdBOaaa3Jg7GKM3lzqaOm8I32Aq5c
	q6UpeZJPKbHZ5pms4pFmxpKA/76PngR6emdWDYEnrXE+uWAc6uiCg32yTMqbRMCL
	E/soI+8lynEkFkg2kY+SkWHy5jJXovEQm3aS86farcZ9PKE0vyCzubjvFX3GbhdJ
	3LA+N8w0PX1bUBoh1s7LZY1dYRFnmbyIdIy/60IW+v3sGffaX4WbuG39q7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1035924185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363730; x=1791968530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ou5z7UnbrbPu0IqbcdGKx4n7S2K2B29+Vj3gXC092lQ=;
        b=jdK0gaacOcy9LK7/XH1UV/mfOMlpza/9/n3RCSps8qwHnTrKkbh4+lnjPLmmxwaEFn
         lNay3tPb+nASA+M1GVKhPeptMwAWO6zWFqpO6+E3cFJDRFf6tYCzJ52L5NQE0RWPSaV8
         Di1aAdQQiNuNCSRYPTPY/AdFr6X95g7CqwSemGLQ3MGwEQhXsV04kfsi6RtslJPK05pS
         jaZse6Od0AH4n5293yxNCuj/23HR4E0O4u79omvhroYPxnjMX1J+9bfSbwqW7k/HT5nJ
         ylRdzzXgdLiGhfnuY5qoSrkgzNdXhsgs8DvgIMyklcepTRIWbaYE5Vypeffoz9UQcBrM
         F0kA==
X-Forwarded-Encrypted: i=1; AKwUvBxQoXfNtzILZ8trzJdT57aivsorwN5WPcl5U+r1BJm+fxDckbipmCGCZam/UnSU/pydoDCUBmpZyoAjPSU=@vger.kernel.org
X-Gm-Message-State: AFuF++lxmkJMDxhDzsS/iut95uA3rokjnZBCr8VLi1qNSTWlPCfRtFb0
	cG4jQ470tINpatrphavYQO1ZJbcEXQTETECBrd0x9Oq5INBH1urw5f1Dkgk/NbLQDerpAxXAzQ2
	rGNNLwH+NPgfCqvOkNYgjabbabHKus95prLQQqAraGam8EMSz9fRMxmYTBb4xdcaIF/U=
X-Gm-Gg: AYBFou1v0C9Jpu3h+qrCmz8YEThEDEW2ZTMJBdkTMG5Dw8Oz92/ZI+PxwbCR1I3j1ks
	LWLejKhPHWevlyqULuVFGgY5coz89Mt3GlcIMITJYaRddp5IdJlC+wG1Oiyhwg/3N/dg1xd5VQ7
	9iJd5hJiykk4bOwS+Wf4Y280jpxCdnk2o682IQ33+wW2LU9dPJrIa1RLP3WLSpIJ8vf/4iQ99/v
	gOruCtNIUCRgCBj3zUQ1hBnnWXC9+TGgdjqlsHBDm+vqh/5/7HBY9ACc1J9rvcWbo8ITt8/ZdCM
	XmfPUucnCQuPY2Cygy61Nle+MFwMb+EFSNypEdJi6s2LEsg4eJ4ttRwC1N0=
X-Received: by 2002:a05:620a:6890:b0:93e:9809:26e with SMTP id af79cd13be357-93e9b84e58fmr272111585a.70.1791363729001;
        Wed, 07 Oct 2026 02:02:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6890:b0:93e:9809:26e with SMTP id af79cd13be357-93e9b84e58fmr272105185a.70.1791363728246;
        Wed, 07 Oct 2026 02:02:08 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:06 -0700 (PDT)
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
Subject: [PATCH RESEND 23/45] media: qcom: camss: sm8250: apply IFE parameters
Date: Wed,  7 Oct 2026 12:00:19 +0300
Message-Id: <20261007090041.3732717-24-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1890UDs34OagPGmxBNZScgvdC4LazRgB
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=4Dn5kSfQbkdGGECuhqgA:9
 a=eGBxxdLn-1n2gD-C:21 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5OTUGa16ewCM
 7QKnyGa7QW1Ti/RJOtRpRwLzFl5BAo2dTUb/cvuPFXHwW4/BFkLpFlXVsf9/usc3WBsLMfNgSZm
 U3EZlXQeZPesxeIXmH6FHR3rp08FY5k=
X-Proofpoint-ORIG-GUID: 1890UDs34OagPGmxBNZScgvdC4LazRgB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0HYU9iDPdMmV
 ddd7X+kzkxDdZ6NSy2Ue/6PcxhDWn58Br04HjsQfgwnAJE7CG1H3QVQxaEgw8sdQKT4DS8ADaGo
 PgYWPXuvazqVIHQqi+J4fGJ7kk0bfYj1SX+FKInw3D//Mjgd+6DWZfeuETaHq/XvBgo+vWFrT/C
 gHg7tjJuKMsLfIDROLYbLJTzgWGN6qr7XQvsqDu4U7PICC5kEyzlJM1vPfs4lfzGvSb1JnGn7O/
 lEku90I02BTc0GQd4CoE4txOcNoR6vYPjq1x6GgFB05OL+Ve/o/bqJzzy7ySnDZ0pF9rZ7gt0WB
 tH+P8n9K5ePABg7t5OPp5/QRU4WcjOevh254N7CaJIwwEPISzrCNm+rklxlpWhk0UbqR+6Ekta9
 iG1fUA9xSyNjdgK3m9uKt5IV41vWb1GkqWmFkb97Y+rvwmkWllfKH39b/DY56wY1KA5JAHVEz9G
 5QA5k759HK5qsWW3q+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Apply per-frame WB, CCM, LSC, gamma, and Bayer grid settings in
the SM8250 IFE module backend.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig     |   1 +
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-mod-v10x.c  | 340 ++++++++++++++++++
 .../platform/qcom/camss/camss-ife-pads.c      |  20 ++
 .../platform/qcom/camss/camss-ife-params.c    |  74 ++++
 .../platform/qcom/camss/camss-ife-params.h    |  75 ++++
 drivers/media/platform/qcom/camss/camss-ife.c | 129 ++++++-
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 .../media/platform/qcom/camss/camss-video.c   |  73 +++-
 .../media/platform/qcom/camss/camss-video.h   |   1 +
 10 files changed, 701 insertions(+), 15 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-params.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-params.h

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 414dfd3d0ece..d8353b449738 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,5 +7,6 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+	select V4L2_ISP
 
 source "drivers/media/platform/qcom/camss/ope/Kconfig"
diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 057c171e08b9..500b056a906c 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -19,6 +19,7 @@ qcom-camss-objs += \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
+		camss-ife-params.o \
 		camss-ife-scale-v10x.o \
 		camss-ife-top-v20x.o \
 		camss-ife-pads.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c
index ebc97203595f..ecbd8b23faf8 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c
@@ -5,19 +5,40 @@
 
 #include <linux/bitfield.h>
 #include <linux/io.h>
+#include <linux/slab.h>
 
+#include <linux/qcom-camss-config.h>
+#include <media/v4l2-isp.h>
+
+#include "camss.h"
 #include "camss-ife.h"
+#include "camss-ife-params.h"
 
 /* Module base offsets and register offsets */
 #define IFE_MOD_V10X_DEMOSAIC_OFFSET	(0x0ACB7800 - 0x0ACB4000)
 #define IFE_MOD_V10X_XFORM_OFFSET	(0x0ACB8000 - 0x0ACB4000)
 #define IFE_MOD_V10X_AWB_BG_OFFSET	0x8400
+#define IFE_MOD_V10X_LSC_OFFSET		0x3600
+#define IFE_MOD_V10X_GLUT_OFFSET	0x3e00
+#define IFE_MOD_V10X_CCM_OFFSET		0x3a00
 
 /* Demosaic registers */
 #define IFE_MOD_V10X_DEM_MODULE_CFG	0x00000060
 #define IFE_MOD_V10X_DEM_WB_GAIN_CFG_0	0x00000068
 #define IFE_MOD_V10X_DEM_WB_GAIN_CFG_1	0x0000006c
 
+/* CCM registers */
+#define IFE_MOD_V10X_CCM_MODULE_CFG	0x00000060
+#define IFE_MOD_V10X_CCM_COEFF_A_CFG_0	0x00000068
+#define IFE_MOD_V10X_CCM_COEFF_A_CFG_1	0x0000006c
+#define IFE_MOD_V10X_CCM_COEFF_B_CFG_0	0x00000070
+#define IFE_MOD_V10X_CCM_COEFF_B_CFG_1	0x00000074
+#define IFE_MOD_V10X_CCM_COEFF_C_CFG_0	0x00000078
+#define IFE_MOD_V10X_CCM_COEFF_C_CFG_1	0x0000007c
+#define IFE_MOD_V10X_CCM_OFFSET_K_CFG_0	0x00000080
+#define IFE_MOD_V10X_CCM_OFFSET_K_CFG_1	0x00000084
+#define IFE_MOD_V10X_CCM_SHIFT_M_CFG		0x00000088
+
 /* Color transform register */
 #define IFE_MOD_V10X_XFORM_MODULE_CFG	0x00000060
 
@@ -32,6 +53,52 @@
 #define IFE_MOD_V10X_AWB_BG_LO_THRESH_CFG_0	0x00000088
 #define IFE_MOD_V10X_AWB_BG_LO_THRESH_CFG_1	0x0000008c
 
+/* LSC registers */
+#define IFE_MOD_V10X_LSC_MODULE_CFG	0x00000060
+#define IFE_MOD_V10X_LSC_DMI_CFG	0x00000008
+#define IFE_MOD_V10X_LSC_CFG_0		0x00000068
+#define IFE_MOD_V10X_LSC_CFG_1		0x0000006c
+#define IFE_MOD_V10X_LSC_CFG_2		0x00000070
+#define IFE_MOD_V10X_LSC_CFG_3		0x00000074
+
+/* Gamma LUT (GLUT) registers */
+#define IFE_MOD_V10X_GLUT_MODULE_CFG	0x00000060
+#define IFE_MOD_V10X_GLUT_DMI_CFG	0x00000008
+
+/* Module configuration bitfields */
+#define IFE_MOD_V10X_CCM_CFG_EN		BIT(0)
+#define IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_1		GENMASK(27, 16)
+#define IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_0		GENMASK(11, 0)
+#define IFE_MOD_V10X_CCM_COEFF_CFG1_MATRIX_2		GENMASK(11, 0)
+#define IFE_MOD_V10X_CCM_OFFSET_CFG0_K1		GENMASK(28, 16)
+#define IFE_MOD_V10X_CCM_OFFSET_CFG0_K0		GENMASK(12, 0)
+#define IFE_MOD_V10X_CCM_OFFSET_CFG1_K2		GENMASK(12, 0)
+#define IFE_MOD_V10X_CCM_SHIFT_M_PARAM			GENMASK(1, 0)
+/* M_PARAM select: 0=Q7, 1=Q8, 2=Q9, 3=Q10. UAPI documents S12Q8. */
+#define IFE_MOD_V10X_CCM_SHIFT_M_PARAM_Q8		1
+
+/* LSC bitfields */
+#define IFE_MOD_V10X_LSC_LUT_SEL_NONE		0x0
+#define IFE_MOD_V10X_LSC_LUT_SEL_RED		0x1
+#define IFE_MOD_V10X_LSC_LUT_SEL_BLUE		0x2
+#define IFE_MOD_V10X_LSC_NUM_BLOCKS_H		GENMASK(3, 0)
+#define IFE_MOD_V10X_LSC_NUM_BLOCKS_V		GENMASK(7, 4)
+#define IFE_MOD_V10X_LSC_BLOCK_WIDTH		GENMASK(10, 0)
+#define IFE_MOD_V10X_LSC_BLOCK_HEIGHT		GENMASK(25, 16)
+#define IFE_MOD_V10X_LSC_INV_SUBBLOCK_Q20	20
+#define IFE_MOD_V10X_LSC_INV_SUBBLOCK		GENMASK(28, 12)
+#define IFE_MOD_V10X_LSC_INIT_SUBBLOCK_Y	GENMASK(30, 28)
+#define IFE_MOD_V10X_LSC_NUM_SUBBLOCKS		GENMASK(13, 12)
+#define IFE_MOD_V10X_LSC_CFG_EN			BIT(0)
+#define IFE_MOD_V10X_LSC_INTP_FACTOR		1
+
+/* Gamma LUT (GLUT) bitfields */
+#define IFE_MOD_V10X_GLUT_LUT_SEL_R		0x3
+#define IFE_MOD_V10X_GLUT_LUT_SEL_G		0x1
+#define IFE_MOD_V10X_GLUT_LUT_SEL_B		0x2
+#define IFE_MOD_V10X_GLUT_LUT_SEL_NONE		0x0
+#define IFE_MOD_V10X_GLUT_CFG_EN		BIT(0)
+
 /* Demosaic bitfields */
 #define IFE_MOD_V10X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN	BIT(15)
 #define IFE_MOD_V10X_DEMOSAIC_CFG_DYN_G_CLAMP_EN	BIT(14)
@@ -211,16 +278,288 @@ static void mod_v10x_awb_bg_disable(void __iomem *base)
 	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_MODULE_CFG);
 }
 
+static void mod_v10x_dmi_write(void __iomem *dmi_base, u32 sel,
+			       const u32 *table, size_t count)
+{
+	size_t i;
+
+	writel_relaxed(sel, dmi_base + 4);
+	/* The DMI port advances its LUT index after each write. */
+	for (i = 0; i < count; i++)
+		writel_relaxed(table[i], dmi_base + 8);
+}
+
+static int mod_v10x_lsc_apply(struct ife_pp_ctx *ctx,
+			      const struct camss_ife_params_lsc *cfg, bool enable)
+{
+	void __iomem *top = ctx->base;
+	void __iomem *base = top + IFE_MOD_V10X_LSC_OFFSET;
+	void __iomem *dmi = top + IFE_MOD_V10X_LSC_OFFSET + IFE_MOD_V10X_LSC_DMI_CFG;
+	u32 subblock_w;
+	u32 subblock_h;
+	u32 num_h = cfg->num_hor_blocks;
+	u32 num_v = cfg->num_ver_blocks;
+	u32 val;
+
+	if (enable && (num_h < 2 || num_h > 17 || num_v < 2 || num_v > 13))
+		return -EINVAL;
+
+	val = readl_relaxed(base + IFE_MOD_V10X_LSC_MODULE_CFG);
+	if (enable)
+		val |= IFE_MOD_V10X_LSC_CFG_EN |
+		       FIELD_PREP(IFE_MOD_V10X_LSC_INIT_SUBBLOCK_Y, 0) |
+		       FIELD_PREP(IFE_MOD_V10X_LSC_NUM_SUBBLOCKS,
+				  IFE_MOD_V10X_LSC_INTP_FACTOR);
+	else
+		val &= ~IFE_MOD_V10X_LSC_CFG_EN;
+	writel_relaxed(val, base + IFE_MOD_V10X_LSC_MODULE_CFG);
+
+	if (!enable)
+		return 0;
+
+	val = FIELD_PREP(IFE_MOD_V10X_LSC_NUM_BLOCKS_H, num_h - 2) |
+	      FIELD_PREP(IFE_MOD_V10X_LSC_NUM_BLOCKS_V, num_v - 2);
+	writel_relaxed(val, base + IFE_MOD_V10X_LSC_CFG_0);
+
+	val = FIELD_PREP(IFE_MOD_V10X_LSC_BLOCK_WIDTH, (ctx->in_width / num_h) - 1) |
+	      FIELD_PREP(IFE_MOD_V10X_LSC_BLOCK_HEIGHT, (ctx->in_height / num_v) - 1);
+	writel_relaxed(val, base + IFE_MOD_V10X_LSC_CFG_1);
+
+	/* Inverse subblock width, Q20 */
+	subblock_w = (ctx->in_width / 4) / (num_h / 2);
+	val = subblock_w |
+	      FIELD_PREP(IFE_MOD_V10X_LSC_INV_SUBBLOCK,
+			 (1 << IFE_MOD_V10X_LSC_INV_SUBBLOCK_Q20) / (subblock_w + 1));
+	writel_relaxed(val, base + IFE_MOD_V10X_LSC_CFG_2);
+
+	/* Inverse subblock height, Q20 */
+	subblock_h = (ctx->in_height / 4) / (num_v / 2);
+	val = subblock_h |
+	      FIELD_PREP(IFE_MOD_V10X_LSC_INV_SUBBLOCK,
+			 (1 << IFE_MOD_V10X_LSC_INV_SUBBLOCK_Q20) / (subblock_h + 1));
+	writel_relaxed(val, base + IFE_MOD_V10X_LSC_CFG_3);
+
+	mod_v10x_dmi_write(dmi, IFE_MOD_V10X_LSC_LUT_SEL_RED,
+			   cfg->table_r, CAMSS_IFE_MAX_LSC_BLOCKS);
+	mod_v10x_dmi_write(dmi, IFE_MOD_V10X_LSC_LUT_SEL_BLUE,
+			   cfg->table_b, CAMSS_IFE_MAX_LSC_BLOCKS);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the Blue LUT silently never commits.
+	 */
+	writel_relaxed(IFE_MOD_V10X_LSC_LUT_SEL_NONE, dmi + 4);
+
+	return 0;
+}
+
+static void mod_v10x_gamma_apply(void __iomem *top,
+				 const struct camss_ife_params_gamma_64 *cfg, bool enable)
+{
+	void __iomem *base = top + IFE_MOD_V10X_GLUT_OFFSET;
+	void __iomem *dmi = top + IFE_MOD_V10X_GLUT_OFFSET + IFE_MOD_V10X_GLUT_DMI_CFG;
+	u32 val;
+
+	val = readl_relaxed(base + IFE_MOD_V10X_GLUT_MODULE_CFG);
+	if (enable)
+		val |= IFE_MOD_V10X_GLUT_CFG_EN;
+	else
+		val &= ~IFE_MOD_V10X_GLUT_CFG_EN;
+	writel_relaxed(val, base + IFE_MOD_V10X_GLUT_MODULE_CFG);
+
+	if (!enable)
+		return;
+
+	mod_v10x_dmi_write(dmi, IFE_MOD_V10X_GLUT_LUT_SEL_R,
+			   cfg->table_r, CAMSS_IFE_GAMMA_64_SIZE);
+	mod_v10x_dmi_write(dmi, IFE_MOD_V10X_GLUT_LUT_SEL_G,
+			   cfg->table_g, CAMSS_IFE_GAMMA_64_SIZE);
+	mod_v10x_dmi_write(dmi, IFE_MOD_V10X_GLUT_LUT_SEL_B,
+			   cfg->table_b, CAMSS_IFE_GAMMA_64_SIZE);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the final (B) table silently never commits and GLUT reads back
+	 * black on that channel. Deselect the LUT once more to flush it.
+	 */
+	writel_relaxed(IFE_MOD_V10X_GLUT_LUT_SEL_NONE, dmi + 4);
+}
+
+static void mod_v10x_wb_apply(void __iomem *top,
+			      const struct camss_ife_params_wb_gain *cfg)
+{
+	void __iomem *base = top + IFE_MOD_V10X_DEMOSAIC_OFFSET;
+	u32 val;
+
+	val = FIELD_PREP(IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG0_B_GAIN, cfg->b) |
+	      FIELD_PREP(IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG0_G_GAIN, cfg->g);
+	writel_relaxed(val, base + IFE_MOD_V10X_DEM_WB_GAIN_CFG_0);
+
+	val = FIELD_PREP(IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG1_R_GAIN, cfg->r);
+	writel_relaxed(val, base + IFE_MOD_V10X_DEM_WB_GAIN_CFG_1);
+}
+
+static void mod_v10x_ccm_apply(void __iomem *top,
+			       const struct camss_ife_params_color_correct *cfg, bool enable)
+{
+	void __iomem *base = top + IFE_MOD_V10X_CCM_OFFSET;
+	u32 val;
+
+	val = readl_relaxed(base + IFE_MOD_V10X_CCM_MODULE_CFG);
+	if (enable)
+		val |= IFE_MOD_V10X_CCM_CFG_EN;
+	else
+		val &= ~IFE_MOD_V10X_CCM_CFG_EN;
+	writel_relaxed(val, base + IFE_MOD_V10X_CCM_MODULE_CFG);
+
+	if (enable) {
+		/*
+		 * Hardware coefficients/offsets are Q-format selectable via
+		 * SHIFT_M_CFG.M_PARAM (0=Q7, 1=Q8, 2=Q9, 3=Q10); the UAPI
+		 * documents S12Q8, so force Q8 here to match.
+		 */
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_SHIFT_M_PARAM,
+					  IFE_MOD_V10X_CCM_SHIFT_M_PARAM_Q8),
+			       base + IFE_MOD_V10X_CCM_SHIFT_M_CFG);
+
+		/*
+		 * HW banks A/B/C each multiply one fixed input channel
+		 * (A=G_in, B=B_in, C=R_in), and HW output indices 0/1/2 are
+		 * also G/B/R, not R/G/B (confirmed via TEST_BUS_CTRL.
+		 * TEST_BUS_SEL, which taps "G-channel"/"B-channel"/
+		 * "R-channel" at indices 0/1/2): "Out_ch0(G)=A0*G_in+B0*B_in
+		 * +C0*R_in+K0; Out_ch1(B)=A1*G_in+B1*B_in+C1*R_in+K1;
+		 * Out_ch2(R)=A2*G_in+B2*B_in+C2*R_in+K2". The UAPI's
+		 * coeff[out][in]/offset[out] are R,G,B-indexed on both axes
+		 * (0=R,1=G,2=B). Solving for A/B/C/K from the UAPI matrix:
+		 * bank X's slot N must take UAPI row (N+1)%3 (G,B,R output
+		 * order) and the column matching that bank's input channel.
+		 */
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_0, cfg->coeff[1][1]) |
+			       FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_1, cfg->coeff[2][1]),
+			       base + IFE_MOD_V10X_CCM_COEFF_A_CFG_0);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG1_MATRIX_2, cfg->coeff[0][1]),
+			       base + IFE_MOD_V10X_CCM_COEFF_A_CFG_1);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_0, cfg->coeff[1][2]) |
+			       FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_1, cfg->coeff[2][2]),
+			       base + IFE_MOD_V10X_CCM_COEFF_B_CFG_0);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG1_MATRIX_2, cfg->coeff[0][2]),
+			       base + IFE_MOD_V10X_CCM_COEFF_B_CFG_1);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_0, cfg->coeff[1][0]) |
+			       FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG0_MATRIX_1, cfg->coeff[2][0]),
+			       base + IFE_MOD_V10X_CCM_COEFF_C_CFG_0);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_COEFF_CFG1_MATRIX_2, cfg->coeff[0][0]),
+			       base + IFE_MOD_V10X_CCM_COEFF_C_CFG_1);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_OFFSET_CFG0_K0, cfg->offset[1]) |
+			       FIELD_PREP(IFE_MOD_V10X_CCM_OFFSET_CFG0_K1, cfg->offset[2]),
+			       base + IFE_MOD_V10X_CCM_OFFSET_K_CFG_0);
+		writel_relaxed(FIELD_PREP(IFE_MOD_V10X_CCM_OFFSET_CFG1_K2, cfg->offset[0]),
+			       base + IFE_MOD_V10X_CCM_OFFSET_K_CFG_1);
+	}
+}
+
+static void mod_v10x_params_apply_wb(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+
+	mod_v10x_wb_apply(ctx->base, &block->wb_gain);
+}
+
+static void mod_v10x_params_apply_ccm(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v10x_ccm_apply(ctx->base, &block->color_correct, enable);
+}
+
+static void mod_v10x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v10x_gamma_apply(ctx->base, &block->gamma_64, enable);
+}
+
+static void mod_v10x_params_apply_lsc(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	int ret;
+
+	ret = mod_v10x_lsc_apply(ctx, &block->lsc, enable);
+	if (ret)
+		dev_dbg(ctx->dev, "LSC apply failed: %d\n", ret);
+}
+
+static void mod_v10x_params_apply_bg_stats(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	if (enable)
+		mod_v10x_awb_bg_enable(ctx->base);
+	else
+		mod_v10x_awb_bg_disable(ctx->base);
+}
+
+static const struct v4l2_isp_params_block_type_info mod_v10x_params_type_info[] = {
+	[CAMSS_IFE_PARAMS_WB_GAIN] = {
+		.size = sizeof(struct camss_ife_params_wb_gain),
+	},
+	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
+		.size = sizeof(struct camss_ife_params_color_correct),
+	},
+	[CAMSS_IFE_PARAMS_GAMMA_64] = {
+		.size = sizeof(struct camss_ife_params_gamma_64),
+	},
+	[CAMSS_IFE_PARAMS_LSC] = {
+		.size = sizeof(struct camss_ife_params_lsc),
+	},
+	[CAMSS_IFE_PARAMS_BG_STATS] = {
+		.size = sizeof(struct camss_ife_params_bg_stats),
+	},
+};
+
+static const camss_ife_params_handler_fn mod_v10x_params_handlers[] = {
+	[CAMSS_IFE_PARAMS_WB_GAIN]       = mod_v10x_params_apply_wb,
+	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v10x_params_apply_ccm,
+	[CAMSS_IFE_PARAMS_GAMMA_64]      = mod_v10x_params_apply_gamma,
+	[CAMSS_IFE_PARAMS_LSC]           = mod_v10x_params_apply_lsc,
+	[CAMSS_IFE_PARAMS_BG_STATS]      = mod_v10x_params_apply_bg_stats,
+};
+
+static_assert(ARRAY_SIZE(mod_v10x_params_handlers) ==
+	      ARRAY_SIZE(mod_v10x_params_type_info));
+
+static int mod_v10x_modules_apply_params(struct ife_pp_ctx *ctx,
+					 struct vb2_buffer *vb)
+{
+	return camss_ife_params_apply(ctx->dev, vb, ctx->params_scratch,
+				      CAMSS_IFE_PARAMS_MAX_PAYLOAD,
+				      mod_v10x_params_type_info,
+				      mod_v10x_params_handlers,
+				      ARRAY_SIZE(mod_v10x_params_handlers),
+				      ctx);
+}
+
 static void mod_v10x_modules_acquire(struct ife_device *ife,
 				     struct ife_pp_ctx *ctx,
 				     void __iomem *base)
 {
+	ctx->dev = ife->camss->dev;
 	ctx->base = base;
+	ctx->params_scratch = devm_kzalloc(ctx->dev,
+					   v4l2_isp_buffer_size(CAMSS_IFE_PARAMS_MAX_PAYLOAD),
+					   GFP_KERNEL);
 }
 
 static void mod_v10x_modules_release(struct ife_pp_ctx *ctx)
 {
 	ctx->base = NULL;
+	ctx->params_scratch = NULL;
 }
 
 static void mod_v10x_modules_config(struct ife_pp_ctx *ctx,
@@ -260,4 +599,5 @@ const struct camss_mod_ops ife_mod_v10x_ops = {
 	.config		= mod_v10x_modules_config,
 	.enable		= mod_v10x_modules_enable,
 	.disable	= mod_v10x_modules_disable,
+	.apply_params	= mod_v10x_modules_apply_params,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-ife-pads.c b/drivers/media/platform/qcom/camss/camss-ife-pads.c
index bd9ac1a91d73..7a4e41c9660b 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-pads.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-pads.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2023 Qualcomm Technologies, Inc.
  */
 
+#include <linux/qcom-camss-config.h>
 #include <linux/qcom-camss-stats.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-isp.h>
 #include <media/v4l2-mediabus.h>
 
 #include "camss-format.h"
@@ -69,6 +71,11 @@ static const struct camss_format_info ife_stats_fmts_v20x[] = {
 	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
 };
 
+static const struct camss_format_info ife_params_fmts_v20x[] = {
+	{ MEDIA_BUS_FMT_METADATA_FIXED, 8, V4L2_META_FMT_QC_IFE_PARAMS, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+};
+
 static const struct ife_pad_limits ife_vid_limits_v20x = {
 	.min_width	= 320,
 	.min_height	= 240,
@@ -327,6 +334,19 @@ static const struct ife_pad_desc ife_pad_desc_v20x[] = {
 		.num_wms = 1,
 		.wm[0] = 15,
 	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_params_fmts_v20x),
+			.formats = ife_params_fmts_v20x,
+		},
+		.limits = &ife_meta_limits_v20x,
+		.video_name = "params",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.meta_dataformat = V4L2_META_FMT_QC_IFE_PARAMS,
+		.meta_buffersize = PAGE_ALIGN(v4l2_isp_buffer_size(CAMSS_IFE_PARAMS_MAX_PAYLOAD)),
+	},
 };
 
 const struct ife_pads_descriptors ife_lite_pads_v20x = {
diff --git a/drivers/media/platform/qcom/camss/camss-ife-params.c b/drivers/media/platform/qcom/camss/camss-ife-params.c
new file mode 100644
index 000000000000..ddd2911761fb
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-params.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * camss-ife-params.c
+ *
+ * Qualcomm MSM Camera Subsystem - IFE ISP parameter buffer parser
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-core.h>
+
+#include "camss-ife-params.h"
+
+int camss_ife_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   struct v4l2_isp_params_buffer *scratch,
+			   size_t max_size,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_ife_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv)
+{
+	const struct v4l2_isp_params_buffer *buf = scratch;
+	const void *src;
+	unsigned int remaining;
+	unsigned int offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(dev, vb, v4l2_isp_buffer_size(max_size));
+	if (ret)
+		return ret;
+
+	src = vb2_plane_vaddr(vb, 0);
+	if (!src) {
+		dev_dbg(dev, "params: buffer has no kernel mapping\n");
+		return -EFAULT;
+	}
+
+	/*
+	 * The payload stays mapped to userspace while the buffer is queued,
+	 * so it must not be validated in place: copy it into kernel-only
+	 * memory first, then work exclusively on the copy. See the
+	 * v4l2_isp_params_validate_buffer() documentation.
+	 */
+	memcpy(scratch, src, vb2_get_plane_payload(vb, 0));
+
+	ret = v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_handlers);
+	if (ret)
+		return ret;
+
+	remaining = buf->data_size;
+
+	while (remaining >= sizeof(struct v4l2_isp_params_block_header)) {
+		const union camss_ife_params_block *block =
+			(const union camss_ife_params_block *)&buf->data[offset];
+		u16 type = block->header.type;
+		u32 bsize = block->header.size;
+
+		if (type < num_handlers && handlers[type])
+			handlers[type](priv, block);
+		else
+			dev_dbg(dev, "params: no handler for block type %u\n", type);
+
+		offset += bsize;
+		remaining -= bsize;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-ife-params.h b/drivers/media/platform/qcom/camss/camss-ife-params.h
new file mode 100644
index 000000000000..50277ec01056
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-params.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * camss-ife-params.h
+ *
+ * Qualcomm MSM Camera Subsystem - IFE ISP parameter buffer parser
+ *
+ * Wraps the generic v4l2_isp_params_validate_buffer() validation and adds a
+ * dispatch layer: after validation each block is forwarded to a
+ * backend-supplied handler.
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _CAMSS_IFE_PARAMS_H_
+#define _CAMSS_IFE_PARAMS_H_
+
+#include <linux/types.h>
+#include <media/v4l2-isp.h>
+
+#include <linux/qcom-camss-config.h>
+
+struct device;
+struct vb2_buffer;
+
+/**
+ * union camss_ife_params_block - Generalisation of an IFE parameter block
+ *
+ * Lets handlers access the shared header first, check its type, then read
+ * the block-specific fields through the matching union member without an
+ * explicit cast.
+ */
+union camss_ife_params_block {
+	struct v4l2_isp_params_block_header header;
+	struct camss_ife_params_wb_gain wb_gain;
+	struct camss_ife_params_color_correct color_correct;
+	struct camss_ife_params_gamma_64 gamma_64;
+	struct camss_ife_params_gamma_256 gamma_256;
+	struct camss_ife_params_lsc lsc;
+	struct camss_ife_params_bg_stats bg_stats;
+};
+
+typedef void (*camss_ife_params_handler_fn)(void *priv,
+					    const union camss_ife_params_block *block);
+
+/**
+ * camss_ife_params_apply - validate and dispatch an IFE params buffer
+ *
+ * @dev:          device for error logging
+ * @vb:           the vb2 buffer holding the params payload
+ * @scratch:      kernel-only bounce buffer, at least
+ *                v4l2_isp_buffer_size(@max_size) bytes
+ * @max_size:     maximum total size of the params blocks (excluding the
+ *                buffer header), e.g. CAMSS_IFE_PARAMS_MAX_PAYLOAD
+ * @type_info:    per-block-type validation info, indexed by block type
+ * @handlers:     per-block-type handlers, indexed by block type
+ * @num_handlers: number of entries in @type_info and @handlers
+ * @priv:         opaque pointer forwarded to each handler
+ *
+ * Copies the buffer payload into @scratch, validates it with
+ * v4l2_isp_params_validate_buffer_size() and v4l2_isp_params_validate_buffer(),
+ * then walks the validated block stream dispatching each block to its
+ * handler. Validation and dispatch operate only on @scratch, never on the
+ * userspace-visible mapping.
+ *
+ * Returns 0 on success, negative errno on validation failure.
+ */
+int camss_ife_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   struct v4l2_isp_params_buffer *scratch,
+			   size_t max_size,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_ife_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv);
+
+#endif /* _CAMSS_IFE_PARAMS_H_ */
diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index f7ec86fb7f02..cc5cebfd0862 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -71,9 +71,19 @@ static bool is_ife_video_stats(const struct camss_video *video)
 	return video->type == V4L2_BUF_TYPE_META_CAPTURE;
 }
 
+static bool is_params_type(const struct ife_pad_desc *pad)
+{
+	return pad->buf_type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
 static bool is_meta_type(const struct ife_pad_desc *pad)
 {
-	return is_stats_type(pad);
+	return is_stats_type(pad) || is_params_type(pad);
+}
+
+static bool is_ife_video_params(const struct camss_video *video)
+{
+	return video->type == V4L2_BUF_TYPE_META_OUTPUT;
 }
 
 static void ife_pp_notify_sof_event(struct ife_device *ife, u32 seq_number)
@@ -272,6 +282,53 @@ static void ife_hw_isr_wm_done(struct ife_device *ife, struct ife_video_pad *vid
 		ife_hw_reg_update(vid_pad);
 }
 
+static void ife_hw_isr_pp_epoch0(struct ife_device *ife)
+{
+	const struct ife_pad_desc *pp_dsc = NULL;
+	enum vb2_buffer_state state = VB2_BUF_STATE_ERROR;
+	struct camss_buffer *params_buf;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&ife->bufs_lock, flags);
+
+	params_buf = ife->pending_params;
+	ife->pending_params = NULL;
+
+	for (i = 0; i < ife->npads; i++) {
+		struct ife_video_pad *vid_pad = ife->pads[i].vid_pad;
+
+		if (!vid_pad || !vid_pad->streaming)
+			continue;
+
+		if (is_pix_hw_pipe(ife->pads[i].desc->hw_pipe)) {
+			pp_dsc = ife->pads[i].desc;
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&ife->bufs_lock, flags);
+
+	if (!params_buf)
+		return;
+
+	if (ife->res->mod_ops && ife->res->mod_ops->apply_params) {
+		int ret = ife->res->mod_ops->apply_params(&ife->pp_ctx, &params_buf->vb.vb2_buf);
+
+		if (ret) {
+			dev_err_ratelimited(ife->camss->dev,
+					    "Failed to apply IFE params: %d\n", ret);
+		} else {
+			state = VB2_BUF_STATE_DONE;
+		}
+	}
+
+	ife->res->top_ops->reg_update(&ife->top_ctx, pp_dsc);
+
+	params_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	vb2_buffer_done(&params_buf->vb.vb2_buf, state);
+}
+
 static void ife_hw_isr_buswr(struct ife_device *ife, u32 bus_status)
 {
 	unsigned long flags;
@@ -324,6 +381,9 @@ static irqreturn_t ife_hw_top_isr(int irq, void *dev)
 		ife->camif_data[CAMSS_IFE_HW_PIPE_PP].next_seq++;
 	}
 
+	if (status[IFE_TOP_STATUS_ID1] & IFE_HW_TOP_IRQ1_PP_EPOCH0)
+		ife_hw_isr_pp_epoch0(ife);
+
 	if (status[IFE_TOP_STATUS_ID0] & IFE_HW_TOP_IRQ0_BUSWR) {
 		u32 bus_status = ife->res->buswr_ops->irq_status(&ife->buswr_ctx);
 
@@ -718,7 +778,7 @@ static int ife_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *stat
 	for (i = 0; i < ife->npads; i++) {
 		struct ife_video_pad *vpad = ife->pads[i].vid_pad;
 
-		if (vpad)
+		if (vpad && !is_ife_video_params(&vpad->video))
 			routing.num_routes++;
 	}
 
@@ -739,6 +799,9 @@ static int ife_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *stat
 		if (!vpad)
 			continue;
 
+		if (is_ife_video_params(&vpad->video))
+			continue;
+
 		sid = camss_ife_stream_id_for_pipe(res->num_sink_streams, res->sink_streams,
 						   ife->pads[i].desc->hw_pipe);
 
@@ -1029,12 +1092,11 @@ static int ife_pad_enum_framesizes(struct v4l2_subdev *sd, struct v4l2_subdev_st
 
 	pad = &ife->pads[fse->pad];
 
-	if (is_meta_type(pad->desc)) {
-		if (is_stats_type(pad->desc))
-			return -ENOTTY;
-
+	if (is_params_type(pad->desc))
 		return -EINVAL;
-	}
+
+	if (is_stats_type(pad->desc))
+		return -ENOTTY;
 
 	for (i = 0; i < pad->desc->sup_fmts.nformats; i++) {
 		if (pad->desc->sup_fmts.formats[i].code == fse->code)
@@ -1233,6 +1295,9 @@ static int ife_video_start_streaming(struct camss_video *vid,
 {
 	struct media_pad *src_pad;
 
+	if (is_ife_video_params(vid))
+		return 0;
+
 	src_pad = media_pad_remote_pad_first(&vid->vdev.entity.pads[0]);
 	if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->entity))
 		return -ENOLINK;
@@ -1248,6 +1313,11 @@ static void ife_video_stop_streaming(struct camss_video *vid)
 	struct media_pad *src_pad;
 	int ret;
 
+	if (is_ife_video_params(vid)) {
+		vid->ops->flush_buffers(vid, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
 	src_pad = media_pad_remote_pad_first(&vid->vdev.entity.pads[0]);
 	if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->entity))
 		return;
@@ -1263,6 +1333,22 @@ static int ife_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 {
 	struct ife_video_pad *vid_pad =
 		container_of(vid, struct ife_video_pad, video);
+	struct ife_device *ife = vid_pad->ife;
+
+	if (is_ife_video_params(vid)) {
+		struct camss_buffer *old_buf;
+		unsigned long flags;
+
+		spin_lock_irqsave(&ife->bufs_lock, flags);
+		old_buf = ife->pending_params;
+		ife->pending_params = buf;
+		spin_unlock_irqrestore(&ife->bufs_lock, flags);
+
+		if (old_buf)
+			vb2_buffer_done(&old_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+
+		return 0;
+	}
 
 	ife_hw_wm_add_pending_buf(vid_pad, buf);
 
@@ -1274,6 +1360,22 @@ static int ife_flush_buffers(struct camss_video *vid, enum vb2_buffer_state stat
 	struct ife_video_pad *vid_pad =
 		container_of(vid, struct ife_video_pad, video);
 
+	if (is_ife_video_params(vid)) {
+		struct ife_device *ife = vid_pad->ife;
+		struct camss_buffer *buf;
+		unsigned long flags;
+
+		spin_lock_irqsave(&ife->bufs_lock, flags);
+		buf = ife->pending_params;
+		ife->pending_params = NULL;
+		spin_unlock_irqrestore(&ife->bufs_lock, flags);
+
+		if (buf)
+			vb2_buffer_done(&buf->vb.vb2_buf, state);
+
+		return 0;
+	}
+
 	if (is_ife_vid_pad_streaming(vid_pad))
 		return -EINVAL;
 
@@ -1610,9 +1712,16 @@ int ife_register_entities(struct ife_device *ife, struct v4l2_device *v4l2_dev)
 		if (!vpad)
 			continue;
 
-		ret = media_create_pad_link(&sd->entity, vpad->pad_index,
-					    &vpad->video.vdev.entity, 0,
-					    pad->desc->link_flags);
+		if (is_ife_video_params(&vpad->video)) {
+			ret = media_create_pad_link(&vpad->video.vdev.entity, 0,
+						    &sd->entity, vpad->pad_index,
+						    pad->desc->link_flags);
+		} else {
+			ret = media_create_pad_link(&sd->entity, vpad->pad_index,
+						    &vpad->video.vdev.entity, 0,
+						    pad->desc->link_flags);
+		}
+
 		if (ret < 0) {
 			dev_err(dev, "Failed to link '%s' and '%s' entities\n", sd->entity.name,
 				vpad->video.vdev.entity.name);
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 168d26d0664b..c163c336fcc3 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -367,6 +367,8 @@ struct ife_device {
 
 	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
 
+	struct camss_buffer *pending_params;
+
 	struct v4l2_subdev sd;
 	struct device *genpd;
 	struct device_link *genpd_link;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index b5d78f84d6a1..2d203dc2e4be 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -255,6 +255,20 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+static bool video_is_meta_output(const struct camss_video *video)
+{
+	return video->type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+static int video_meta_output_link_validate(struct media_link *link)
+{
+	return 0;
+}
+
+static const struct media_entity_operations video_meta_output_media_ops = {
+	.link_validate = video_meta_output_link_validate,
+};
+
 /*
  * video_start_streaming_legacy - Start a legacy subdev pipeline
  * @sink_pad: Video device's own (single) pad
@@ -456,6 +470,7 @@ static int meta_buf_init(struct vb2_buffer *vb)
 		return -EFAULT;
 
 	buffer->addr[0] = sg_dma_address(sgt->sgl);
+	buffer->vaddr = vb2_plane_vaddr(vb, 0);
 
 	return 0;
 }
@@ -475,19 +490,53 @@ static int meta_buf_prepare(struct vb2_buffer *vb)
 	if (vb2_plane_size(vb, 0) < video->active_fmt.fmt.meta.buffersize)
 		return -EINVAL;
 
-	vb2_set_plane_payload(vb, 0, video->active_fmt.fmt.meta.buffersize);
+	/*
+	 * For META_CAPTURE (stats) the hardware always fills the whole
+	 * fixed-size buffer, so force the payload to the full buffersize.
+	 * For META_OUTPUT (params) the payload is a variable-length
+	 * block-list and userspace has already set the correct bytesused
+	 * via VIDIOC_QBUF; don't clobber it.
+	 */
+	if (!video_is_meta_output(video))
+		vb2_set_plane_payload(vb, 0, video->active_fmt.fmt.meta.buffersize);
 
 	return 0;
 }
 
+static int meta_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+
+	if (!video_is_meta_output(video))
+		return video_start_streaming(q, count);
+
+	if (!video->ops->start_streaming)
+		return 0;
+
+	return video->ops->start_streaming(video, count);
+}
+
+static void meta_stop_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+
+	if (!video_is_meta_output(video)) {
+		video_stop_streaming(q);
+		return;
+	}
+
+	if (video->ops->stop_streaming)
+		video->ops->stop_streaming(video);
+}
+
 static const struct vb2_ops msm_meta_vb2_q_ops = {
 	.queue_setup     = meta_queue_setup,
 	.buf_init        = meta_buf_init,
 	.buf_prepare     = meta_buf_prepare,
 	.buf_queue       = video_buf_queue,
 	.prepare_streaming = video_prepare_streaming,
-	.start_streaming = video_start_streaming,
-	.stop_streaming  = video_stop_streaming,
+	.start_streaming = meta_start_streaming,
+	.stop_streaming  = meta_stop_streaming,
 	.unprepare_streaming = video_unprepare_streaming,
 };
 
@@ -795,9 +844,13 @@ static int meta_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 static const struct v4l2_ioctl_ops msm_meta_ioctl_ops = {
 	.vidioc_querycap		= video_querycap,
 	.vidioc_enum_fmt_meta_cap	= meta_enum_fmt,
+	.vidioc_enum_fmt_meta_out	= meta_enum_fmt,
 	.vidioc_g_fmt_meta_cap		= meta_try_fmt,
+	.vidioc_g_fmt_meta_out		= meta_try_fmt,
 	.vidioc_s_fmt_meta_cap		= meta_try_fmt,
+	.vidioc_s_fmt_meta_out		= meta_try_fmt,
 	.vidioc_try_fmt_meta_cap	= meta_try_fmt,
+	.vidioc_try_fmt_meta_out	= meta_try_fmt,
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
 	.vidioc_qbuf			= vb2_ioctl_qbuf,
@@ -916,20 +969,24 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->dev = video->camss->dev;
 	q->lock = &video->q_lock;
 
-	if (video->type == V4L2_BUF_TYPE_META_CAPTURE) {
+	if (video->type == V4L2_BUF_TYPE_META_CAPTURE || video_is_meta_output(video)) {
 		q->ops = &msm_meta_vb2_q_ops;
 		q->io_modes = VB2_DMABUF | VB2_MMAP;
 	} else if (video->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		dev_err(v4l2_dev->dev, "Invalid format type\n");
 		goto error_vb2_init;
 	}
+
 	ret = vb2_queue_init(q);
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to init vb2 queue: %d\n", ret);
 		goto error_vb2_init;
 	}
 
-	pad->flags = MEDIA_PAD_FL_SINK;
+	pad->flags = video_is_meta_output(video) ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	if (video_is_meta_output(video))
+		vdev->entity.ops = &video_meta_output_media_ops;
+
 	ret = media_entity_pads_init(&vdev->entity, 1, pad);
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
@@ -957,6 +1014,12 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	vdev->release = msm_video_release;
 	vdev->v4l2_dev = v4l2_dev;
 	vdev->vfl_dir = VFL_DIR_RX;
+	if (video_is_meta_output(video)) {
+		vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
+				    V4L2_CAP_IO_MC;
+		vdev->ioctl_ops = &msm_meta_ioctl_ops;
+		vdev->vfl_dir = VFL_DIR_TX;
+	}
 	vdev->queue = &video->vb2_q;
 	vdev->lock = &video->lock;
 	strscpy(vdev->name, name, sizeof(vdev->name));
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index cfee619973ef..a2be135bee24 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -22,6 +22,7 @@
 struct camss_buffer {
 	struct vb2_v4l2_buffer vb;
 	dma_addr_t addr[3];
+	void *vaddr;
 	struct list_head queue;
 };
 
-- 
2.34.1

