Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B823CDBA4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326552; cv=none; b=Bc1ZMnBhP4uGXz35JdStw1H4aYexlFxDxkuHv//ywL10PMnJX+t1B9Fq8JS2rv3jme3cO9PnedSbhVs5STlJ5Ohkz/zMwuxtNjxoFPBuZvrg/FWdxPz3OE/ywEifUq5GBqv5MiOgNVf4AZdjiC/OwKW/GlndmtPAtagcXYpue9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326552; c=relaxed/simple;
	bh=kjltewf3p25O0QdNGh9QL0x8USPS9bQsDmhxEPsMrnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rD/klsxQOD/xC1DFX+GPM022gca9xd0h5Jch8iWNddPcVwrNx5068nP+UIsCBG4F13XWPI2Cwpl9glUFmJDEX1fE6lWvMAWYr+o/i/lvN3Vu3rMPWbRJAquq5aUQcqhVUXvLokukV8DJSV56+LbcAVxB8o4PeR9w/k6Fkft/HmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJtJskPw reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJtJskPw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeV5Z2514039
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l5irNuWk56D
	wClzVXyAZkYCwcaT2zOLgGVOIv2t/w1s=; b=VJtJskPwXQZs2zVR9EbIOLK2IJw
	v1fGQNVWuJHy9MsbUrJb6xC5hDTU8GsQvZLTkS07AgIiBzCIGO1aCDYsPxsEoVut
	68nPoRsFXDtzJzq33aUbq+1KNbiQMuowUiKQfGDnQPG3oUaQ/5T/MBKPKmAwH0Za
	8NLW5cYmi5CjmOJowsrUUso5ylfms0YI1wqDeMNALLXgboIedbbDRjW+NNnZs+iv
	l61b91StbmbsnbHj0UDWE9/A3Iqq8nsq04mfx/uygulONq742U0Ilf0uZ1ZlKFs5
	laJHUSyp8PoRhEjNPeyUcul7GFILV6pxpINSRJrIxLLTW+Hu7kBuqh8PdIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtwdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so600315685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326494; x=1791931294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5irNuWk56DwClzVXyAZkYCwcaT2zOLgGVOIv2t/w1s=;
        b=l5IN/P6HcZZ4CkcZWzxO0P1vEhovPErFibrQ5PDkw6eNPRyie9Kqy0tNYRIALPub0C
         7IuwEv3B8d3LEMnlHHuYXreqO2XXYEN6uVtuMkafkwWt8BnGaeFBAhEnZkEpSOtikBHZ
         0dwAIxsAjIxS2gcKP0Sebg0SilXpbWe7B3mvhTknpx5LYJEWWYduHfWgKnYA6S3Si3rs
         TkJAxZTKXqbEs9X5KGCaWeMLDEMtS8kXgSo/59PR+KjrtuOQ68kSAk6idR/79SFm32BR
         h+0E97OL4rR1CBGdSd7ahn/6oUlC4+U9EvZqnLCmtaAPKRgMZxWc0F2BNjmutr8q43e5
         m01w==
X-Forwarded-Encrypted: i=1; AKwUvBzYdYwaKAjxUUEH0p8OvT2f+76ulr3KcKtb6zTMMGm/L8YeKWoSeKrPjMDwZnJ7+5ygUb4FkN3Q4d15+z0=@vger.kernel.org
X-Gm-Message-State: AFuF++ksVtR1bylro1Rokdv+95F9JeRED1qe6tVLJvAr5rFwHx2lCEuD
	ZeTB09tXyfc1jEmBMgsoh6Z30ml5hOnGKai0i057wfidyoaIXymh5rEwm+COk4r915k7FuFb0ej
	8BTauwqWCSrYPvOxSgYNid26f00VjLKncuAbikiliw+x4BF9i5hgKcnnfLuzilBv0Tb4=
X-Gm-Gg: AYBFou0MDE22e3jRmXn6W9UvZ8M9Nyl5Lx4Eh/NWzR0sSBzhvDyLaTCY41Sy7RTu2/h
	uszIa6UaOrkrcW2tMpzqJwMV1YwVmE2QOgsOXu3gMfeOF/xRwpP/zjRxSTetvBHcBkbK9gec6xH
	cgM8YjTXnbN8atfNyPi/yDMDi2El8Qok5S/3c0Vrbu0Zh5Re7ePRNIqbwVx4W6CEjGUMZzJ7IgN
	BtZrhnmZwWRVTXT1nW4iuT4vuHkIc2pbBmwER73PwDsfLzYgd7SSyhMy6Rd38XKGYnNZhJklulk
	AqYwoId4hvhmka/TcFPArgvNeFaYZgukfZXSms3CbKV4TSOgs36nSlAd+0g=
X-Received: by 2002:a05:620a:890c:b0:93e:5b69:fa8 with SMTP id af79cd13be357-93e9b80d367mr73367285a.66.1791326494268;
        Tue, 06 Oct 2026 15:41:34 -0700 (PDT)
X-Received: by 2002:a05:620a:890c:b0:93e:5b69:fa8 with SMTP id af79cd13be357-93e9b80d367mr73360685a.66.1791326493528;
        Tue, 06 Oct 2026 15:41:33 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:32 -0700 (PDT)
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
Subject: [PATCH 34/45] media: qcom: camss: sa8775p: add IFE modules v4.1x
Date: Wed,  7 Oct 2026 01:39:42 +0300
Message-Id: <20261006223953.3382273-35-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9vbZvmhkxJdx
 qxAfdIP4O38FJtuMgfyYCgPyg/r/bpO4+Ijq4+35nQr1aYylAkH6mtJJAOPPokl2VPCAQJLHXPR
 ZKGz0e7Z9z2boRfIu+5COMj3v5BkftMMSrr88dpG2+dnT9B+OYiD0rskaqOCzHzzYjfXCwoB2L+
 eeOomshAvnAGPIWNGc+fYwFOVmrOjSktCaFWsIQ6Q18lR1ilwzp0YlQgYCa46DB7OHgL/OpUJq9
 A8mh8aNx9mDyq4C4JRouyri0HrEcqdEkodPGzGKemwDo20XNXdb/aN21Qg6rrsiRdS9nheWRnZ3
 QzORrSVtaNBNnW3BioG12ugPbWiHPkuC4a2hIqntlTBdXFIZs9MAh3DxcJeru+ys2iISh3ll+Bh
 NeYbCe56Cb4OdsbGnk0a6jtp95xWrMVv2maUEqZmcKd+2jbRRiByloxJkTZSEFCgZbNu0BFrrRd
 AmjAC3CO+WIWzT8b7Ew==
X-Proofpoint-ORIG-GUID: DKy81KYfMKh8t1wA2n91ypwGv0Or-Mcj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/97M+40SR9Yv
 zQYigqxXzXLlQsczV9YBMt2PQLya62hgqSS3iQ8QA4IS+wLH579He1PzK86fst1RnFb/uIKh782
 7u5iWq9VwHJwzRbHM1dcJ2WzUiV01KA=
X-Proofpoint-GUID: DKy81KYfMKh8t1wA2n91ypwGv0Or-Mcj
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac5791f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Xwbn_vlQFOu4UPbQhHoA:9
 a=8GFvXUyn-dLsZM-V:21 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the module backend used by the SA8775P IFE pixel path. It
configures the default white balance, demosaic, color transform,
and AWB BG blocks.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 328 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 330 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 695924e0c03b..2e4c07fda524 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -21,6 +21,7 @@ qcom-camss-objs += \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
+		camss-ife-mod-v41x.o \
 		camss-ife-params.o \
 		camss-ife-scale-v10x.o \
 		camss-ife-scale-v23x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
new file mode 100644
index 000000000000..9f4c8ae9667e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * IFE pixel-path post-processing modules for the v41x register layout.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+
+#include "camss-ife.h"
+
+/* Module base offsets */
+#define IFE_MOD_V41X_WB_GAIN_OFFSET		0x4000
+#define IFE_MOD_V41X_DEMOSAIC_OFFSET		0x5580
+#define IFE_MOD_V41X_XFORM_OFFSET		0x6200
+#define IFE_MOD_V41X_AWB_BG_OFFSET		0x6800
+
+/* WB gain registers */
+#define IFE_MOD_V41X_WB_GAIN_MODULE_CFG		0x60
+#define IFE_MOD_V41X_WB_GAIN_CFG_0		0x68
+#define IFE_MOD_V41X_WB_GAIN_CFG_1		0x6c
+#define IFE_MOD_V41X_WB_GAIN_CFG_2		0x70
+
+/* Demosaic registers */
+#define IFE_MOD_V41X_DEMOSAIC_MODULE_CFG		0x60
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_0	0x68
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_1	0x6c
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_0	0x70
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_1	0x74
+
+/* Color transform (XFORM) registers, 3 channels */
+#define IFE_MOD_V41X_XFORM_MODULE_CFG		0x60
+#define IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_0	0x68
+#define IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_1	0x6c
+#define IFE_MOD_V41X_XFORM_CH0_ADDOFFSET_CFG	0x70
+#define IFE_MOD_V41X_XFORM_CH0_SUBOFFSET_CFG	0x74
+#define IFE_MOD_V41X_XFORM_CH0_CLAMP0_CFG	0x78
+#define IFE_MOD_V41X_XFORM_CH0_CLAMP1_CFG	0x7c
+#define IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_0	0x80
+#define IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_1	0x84
+#define IFE_MOD_V41X_XFORM_CH1_ADDOFFSET_CFG	0x88
+#define IFE_MOD_V41X_XFORM_CH1_SUBOFFSET_CFG	0x8c
+#define IFE_MOD_V41X_XFORM_CH1_CLAMP0_CFG	0x90
+#define IFE_MOD_V41X_XFORM_CH1_CLAMP1_CFG	0x94
+#define IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_0	0x98
+#define IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_1	0x9c
+#define IFE_MOD_V41X_XFORM_CH2_ADDOFFSET_CFG	0xa0
+#define IFE_MOD_V41X_XFORM_CH2_SUBOFFSET_CFG	0xa4
+#define IFE_MOD_V41X_XFORM_CH2_CLAMP0_CFG	0xa8
+#define IFE_MOD_V41X_XFORM_CH2_CLAMP1_CFG	0xac
+
+/* AWB-BG registers */
+#define IFE_MOD_V41X_AWB_BG_MODULE_CFG		0x60
+#define IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_0	0x6c
+#define IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_1	0x70
+#define IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_0	0x74
+#define IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_1	0x78
+#define IFE_MOD_V41X_AWB_BG_RGN_WIDTH_CFG	0x7c
+#define IFE_MOD_V41X_AWB_BG_HI_THRESHOLD_CFG_0	0x80
+#define IFE_MOD_V41X_AWB_BG_LO_THRESHOLD_CFG_0	0x94
+
+/* WB gain bitfields */
+#define IFE_MOD_V41X_WB_GAIN_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_WB_GAIN_VALUE		GENMASK(31, 17)
+
+/* Demosaic bitfields */
+#define IFE_MOD_V41X_DEMOSAIC_CFG_EN			BIT(0)
+#define IFE_MOD_V41X_DEMOSAIC_CFG_DYN_G_CLAMP_EN	BIT(14)
+#define IFE_MOD_V41X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN	BIT(15)
+
+/* Color transform bitfields */
+#define IFE_MOD_V41X_XFORM_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_XFORM_MATRIX_M0		GENMASK(12, 0)
+#define IFE_MOD_V41X_XFORM_MATRIX_M1		GENMASK(28, 16)
+#define IFE_MOD_V41X_XFORM_OFFSET_VALUE		GENMASK(31, 17)
+#define IFE_MOD_V41X_XFORM_CLAMP_VALUE		GENMASK(31, 18)
+
+/* AWB-BG bitfields */
+#define IFE_MOD_V41X_AWB_BG_MODULE_CFG_EN	BIT(0)
+#define IFE_MOD_V41X_AWB_BG_RGN_SAMPLE_PATTERN	GENMASK(31, 16)
+#define IFE_MOD_V41X_AWB_BG_HORZ_CFG0_H_NUM	GENMASK(21, 16)
+#define IFE_MOD_V41X_AWB_BG_HORZ_CFG1_WIDTH	GENMASK(8, 0)
+#define IFE_MOD_V41X_AWB_BG_VERT_CFG0_V_NUM	GENMASK(21, 16)
+#define IFE_MOD_V41X_AWB_BG_VERT_CFG1_HEIGHT	GENMASK(8, 0)
+#define IFE_MOD_V41X_AWB_BG_RGN_WIDTH_LAST	GENMASK(24, 16)
+#define IFE_MOD_V41X_AWB_BG_RGN_WIDTH_FIRST	GENMASK(8, 0)
+#define IFE_MOD_V41X_AWB_BG_HI_THRESHOLD	GENMASK(31, 8)
+
+/* WB gain default */
+#define IFE_MOD_V41X_WB_GAIN_UNITY		0x400
+
+/* Demosaic defaults */
+#define IFE_MOD_V41X_DEMOSAIC_LAMBDA_G		0x80
+#define IFE_MOD_V41X_DEMOSAIC_LAMBDA_RB		0
+#define IFE_MOD_V41X_DEMOSAIC_A_K_DEFAULT	0x08000000
+#define IFE_MOD_V41X_DEMOSAIC_W_K_DEFAULT	0x66
+
+/* Color transform defaults */
+#define IFE_MOD_V41X_XFORM_MSB_SHIFT		4
+#define IFE_MOD_V41X_XFORM_CHROMA_OFFSET	0x200
+#define IFE_MOD_V41X_XFORM_CLAMP_MAX		0x3ff
+
+/* AWB-BG defaults */
+#define IFE_MOD_V41X_AWB_BG_MAX_H_NUM		64
+#define IFE_MOD_V41X_AWB_BG_MAX_V_NUM		48
+#define IFE_MOD_V41X_AWB_BG_SAMPLE_PATTERN	GENMASK(15, 0)
+#define IFE_MOD_V41X_AWB_BG_THRESHOLD		0x3ffff
+#define IFE_MOD_V41X_AWB_BG_NUM_THRESHOLDS	5
+
+static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value = FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE,
+			       IFE_MOD_V41X_WB_GAIN_UNITY);
+
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_0);
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_1);
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_2);
+}
+
+static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
+
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_LAMBDA_RB,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_0);
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_LAMBDA_G,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_1);
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_A_K_DEFAULT,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_0);
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_W_K_DEFAULT,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_1);
+}
+
+static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
+				   const struct camss_pp_cfg *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_AWB_BG_OFFSET;
+	unsigned int i;
+	u32 height = (cfg->height / IFE_MOD_V41X_AWB_BG_MAX_V_NUM) & ~3u;
+	u32 width = (cfg->width / IFE_MOD_V41X_AWB_BG_MAX_H_NUM) & ~3u;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_AWB_BG_RGN_SAMPLE_PATTERN;
+	value |= FIELD_PREP(IFE_MOD_V41X_AWB_BG_RGN_SAMPLE_PATTERN,
+			    IFE_MOD_V41X_AWB_BG_SAMPLE_PATTERN);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_HORZ_CFG0_H_NUM,
+			   IFE_MOD_V41X_AWB_BG_MAX_H_NUM - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_0);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_HORZ_CFG1_WIDTH, width - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_VERT_CFG0_V_NUM,
+			   IFE_MOD_V41X_AWB_BG_MAX_V_NUM - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_0);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_VERT_CFG1_HEIGHT, height - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_RGN_WIDTH_FIRST, width - 1) |
+		FIELD_PREP(IFE_MOD_V41X_AWB_BG_RGN_WIDTH_LAST, width - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_RGN_WIDTH_CFG);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_HI_THRESHOLD,
+			   IFE_MOD_V41X_AWB_BG_THRESHOLD);
+	for (i = 0; i < IFE_MOD_V41X_AWB_BG_NUM_THRESHOLDS; i++) {
+		writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_HI_THRESHOLD_CFG_0 + i * 4);
+		writel_relaxed(0, base + IFE_MOD_V41X_AWB_BG_LO_THRESHOLD_CFG_0 + i * 4);
+	}
+}
+
+static void mod_v41x_awb_bg_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_AWB_BG_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+	value |= IFE_MOD_V41X_AWB_BG_MODULE_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+}
+
+static void mod_v41x_awb_bg_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_AWB_BG_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_AWB_BG_MODULE_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+}
+
+static void mod_v41x_xform_write_coeff(void __iomem *base, u32 offset,
+				       u32 m0, u32 m1)
+{
+	u32 value;
+
+	value = FIELD_PREP(IFE_MOD_V41X_XFORM_MATRIX_M0, m0) |
+		FIELD_PREP(IFE_MOD_V41X_XFORM_MATRIX_M1, m1);
+	writel_relaxed(value, base + offset);
+}
+
+static void mod_v41x_xform_write_channel(void __iomem *base, u32 coeff0,
+					 u32 coeff1, u32 add_offset,
+					 u32 sub_offset, u32 clamp0,
+					 u32 clamp1, u32 m0, u32 m1,
+					 u32 m2, u32 offset)
+{
+	mod_v41x_xform_write_coeff(base, coeff0, m0, m1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_MATRIX_M0, m2), base + coeff1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_OFFSET_VALUE,
+				  offset << IFE_MOD_V41X_XFORM_MSB_SHIFT),
+		       base + add_offset);
+	writel_relaxed(0, base + sub_offset);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_CLAMP_VALUE, 0), base + clamp0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_CLAMP_VALUE,
+				  IFE_MOD_V41X_XFORM_CLAMP_MAX <<
+				    IFE_MOD_V41X_XFORM_MSB_SHIFT),
+		       base + clamp1);
+}
+
+static void mod_v41x_modules_acquire(struct ife_device *ife, struct ife_pp_ctx *ctx,
+				     void __iomem *base)
+{
+	ctx->base = base;
+}
+
+static void mod_v41x_modules_release(struct ife_pp_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void mod_v41x_modules_config(struct ife_pp_ctx *ctx,
+				    const struct camss_pp_cfg *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_XFORM_OFFSET;
+
+	ctx->in_width = cfg->width;
+	ctx->in_height = cfg->height;
+
+	mod_v41x_wb_gain_config(ctx);
+	mod_v41x_demosaic_config(ctx);
+	mod_v41x_awb_bg_config(ctx, cfg);
+
+	mod_v41x_xform_write_channel(base, IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_0,
+				     IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_1,
+				     IFE_MOD_V41X_XFORM_CH0_ADDOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH0_SUBOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH0_CLAMP0_CFG,
+				     IFE_MOD_V41X_XFORM_CH0_CLAMP1_CFG,
+				     0x259, 0x75, 0x132, 0);
+	mod_v41x_xform_write_channel(base, IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_0,
+				     IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_1,
+				     IFE_MOD_V41X_XFORM_CH1_ADDOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH1_SUBOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH1_CLAMP0_CFG,
+				     IFE_MOD_V41X_XFORM_CH1_CLAMP1_CFG,
+				     0x1eae, 0x1fe, 0x1f54,
+				     IFE_MOD_V41X_XFORM_CHROMA_OFFSET);
+	mod_v41x_xform_write_channel(base, IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_0,
+				     IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_1,
+				     IFE_MOD_V41X_XFORM_CH2_ADDOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH2_SUBOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH2_CLAMP0_CFG,
+				     IFE_MOD_V41X_XFORM_CH2_CLAMP1_CFG,
+				     0x1e55, 0x1fad, 0x1fe,
+				     IFE_MOD_V41X_XFORM_CHROMA_OFFSET);
+}
+
+static void mod_v41x_modules_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	value |= IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+	value |= IFE_MOD_V41X_DEMOSAIC_CFG_DYN_G_CLAMP_EN |
+		 IFE_MOD_V41X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN |
+		 IFE_MOD_V41X_DEMOSAIC_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_XFORM_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+	value |= IFE_MOD_V41X_XFORM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+
+	mod_v41x_awb_bg_enable(ctx);
+}
+
+static void mod_v41x_modules_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	mod_v41x_awb_bg_disable(ctx);
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+	value &= ~(IFE_MOD_V41X_DEMOSAIC_CFG_DYN_G_CLAMP_EN |
+		   IFE_MOD_V41X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN |
+		   IFE_MOD_V41X_DEMOSAIC_CFG_EN);
+	writel_relaxed(value, base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_XFORM_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_XFORM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+}
+
+const struct camss_mod_ops ife_mod_v41x_ops = {
+	.acquire	= mod_v41x_modules_acquire,
+	.release	= mod_v41x_modules_release,
+	.config		= mod_v41x_modules_config,
+	.enable		= mod_v41x_modules_enable,
+	.disable	= mod_v41x_modules_disable,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 3d35c17fca7f..c38b96076a1f 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -403,6 +403,7 @@ extern const struct ife_hw_top_ops ife_top_v41x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
+extern const struct camss_mod_ops ife_mod_v41x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
 extern const struct ife_pads_descriptors ife_lite_pads_v30x;
-- 
2.34.1

