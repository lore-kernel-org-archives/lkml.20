Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1847729B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363709; cv=none; b=Df9zrpIV/OfV5GqwwhmTwWUS8wknQBREVnGoGWZuCcnay+vnFVzaMzFiSYAC4YuDpS2xECSs/Cl2rKWzScd7j8XUOtOR722HL7fpJiOhSkIO4FSecl90mbKLzK0/So9EDo8rc9Ypk+pFCIf6xYKWKLnJ7vJqlW8mvpd2L+TFbU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363709; c=relaxed/simple;
	bh=BfWllAMlA7O5HU2TXzoXuy8uj1a6abfiuL+6ufE++uA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gny7rrJ+eZsruLnYh1Vzc4xgM/9m0vQcolAfKXDr57NdZsI5esEdUW2hM/R1sdhS3ujlX2SpfhsDSkZweiUP/52lqRGO0pzJB9rHz6GPJ4BYcMOkw7oI08hfgMkgm/59qcFIKadPxgY+SvS0pSsgkPYkIy0LILReTqgnGnsxn5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA5iCC1l reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA5iCC1l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jm3j3686144
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L/VZ0T6uAEB
	5RrdF6heBACOb9jTomKrTKqst/Nivjr4=; b=YA5iCC1lc83XRzVe9knkgVnJVr4
	w/4zdQdOvSra9wr0D3+mrLGX8aJcRiQ/M+nSK3rdGhCC0Etq+QOP+oiKIVUtIJWY
	xO13F9xULVIGuIk9guzIQmM2GLBrVnW8dZCDG2V4T0SlLJzm/DkBnFncGz5UL7qC
	GpXpu+aetU5a9MPiX/KZGMlW57a2kgu31+aUtI0g1mAoH5D7GZwX0geT68K5LaCP
	t3mMmKNA+UF5pE/qQr17DSMnrL0Q/x8yPWxgsiwYrYMWQXE1eQkWnqkb8ZFjbCnI
	+5fY6GR17sVv2e4PEPcZiMR0gWnEAslRztL6kwFTLe/F3eOpXSqdEphnmiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609c2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so720647385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363684; x=1791968484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/VZ0T6uAEB5RrdF6heBACOb9jTomKrTKqst/Nivjr4=;
        b=I39epQ68T2kdTnXnlkyiqrkwOwWdBrIeNa7lm3EMoD5skOcJ/TkqRbCIadqD5U6Pbf
         i2nGkm2oplxt0N2ZZEXaZencjwROomWIGdCxFD3ZR0I1Dn9bP80YSbieb9dIFum0AGxo
         koUtI/fqYC0xE5tv6U2d1zVKvISbkCwXa3z6/NzrwH0aJW0aWDkO296bQ50jqW/EQukl
         3utNaFx4QlJ7402evIvOD0qTZJeRfsyTx0f24KBqklhB+bpcqxTue7UrG9dKqqkQoPDO
         D7xhMm016j5J6dp8NJefjhqieLuwTW0CiD59Sz73+ct9yMfVALzSrzFXhfpiqYQM7yjl
         hHSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPXRc7qrx5wR5xe/QtFsHHsqS9nkUSlIctY1Ru+q32WkIfPiDtafiAdxcvcOUWjhGmA2vjUokGGzek8nU=@vger.kernel.org
X-Gm-Message-State: AFuF++k9CuIMWd12kSXfdSnbei9gogDmjbLuvPTC2KukJcmQloTGz7fE
	xJUxxLxk1rj++fw8lLg7q4LkCPCNY0kFHFSKVcPtHzEWXRo8MY1xDsT0+UOoYFvuhLjgbudfYXT
	qu0nRPHt6iQ0f30g057hY8VReTg4RWYMsz8hbsoNAvCUdb3qv9Ld9Bg6zqtE1TfEAsfU=
X-Gm-Gg: AYBFou3LxZK39dv4NBdaOSWLJXINSNlmnLI1d+3drmNZopD9ApJxyYcoG65Lfr7xJSL
	gZWS5INksKiqbG+rKZAV6wO9VbooKB5awh6ofcPMLZLyzH4S2qCtCZ8Caeq67QR2cACyL2hUUmC
	tI4C8fiC+UzVqbpOzN3GGsk4tybS1yk3P/LcY9jpSHK3yF8ldxfHsGWx4Eyrnnn1XuubMGJ55yp
	bmkLdFeDCd1qOhP/8xyptyEV6S51j5J9ank+d9CFHNOVbkFiZp17ljRsnxYNvLOCuirJCU2O1KZ
	x+sH2vGwXQocgMlTuDYlYt89OFZyYBLZQNBdRdh/DK8lNo7bygw2G4s78pw=
X-Received: by 2002:a05:620a:4385:b0:93a:34e2:b7b4 with SMTP id af79cd13be357-93e9b76c7afmr254742285a.15.1791363683796;
        Wed, 07 Oct 2026 02:01:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93a:34e2:b7b4 with SMTP id af79cd13be357-93e9b76c7afmr254733085a.15.1791363683056;
        Wed, 07 Oct 2026 02:01:23 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:20 -0700 (PDT)
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
Subject: [PATCH RESEND 10/45] media: qcom: camss: sm8250: add IFE Lite top v10x
Date: Wed,  7 Oct 2026 12:00:06 +0300
Message-Id: <20261007090041.3732717-11-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: w5FPFd0T_C-yPrqZizdURvzK7hXRVHyE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4cIuhBLi0S+Q
 hTG7RlQqq2SiEIsOycspSEB2id2Jh/28cksxMhJ9W4IF4lfvZhDvf57Z1nPJqhn1fFCWvuRjG7p
 W6bMaUbUtnPJvkxt5j9J1Nja5i7j0HM=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac60a64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=aQGKX1_pSblwAH9i0lwA:9
 a=1Kpc2c5P7VrA9DiO:21 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: w5FPFd0T_C-yPrqZizdURvzK7hXRVHyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXyPzZVGVl84y0
 rr9lKYkUKpVjlh++45rkg6Q91w+aKHUcMFsvByBTlFEzRQw9CVtSsLzteFXj2YiAcF2VP/wabEG
 NN7F0LWSG0+3yeIWNB0qtehtBUUcNlXMidqED8kbjWvHqv9eqaOlDyg5W6V3dno2GdUp+od6D9e
 tG2fG+VBf/i7xcJVD7wPfHoszfw4FGLx4dAV+AjiMzi2ewEK4TgMbjurKiHdDXmsfQwBbBW1nTA
 fDunAhY5A+e54Jkf1HHELZdphiKHiWdimHuZOrm/srVmLMEGq53hHL/R4xGVaWKGZrYZPa8V+pK
 8/h7nRtyMB6c7VF3x+ie8GP+qAXomKz7DDXKlvohYadv/Qziw1+N5h6Ekrd1HuyUK5Cmf0KfBeQ
 SK6mC6Khd5CRXB3HrBgMnWOZeAXa/6vMY1G9Z0r/OmWi4GoeNNSxViB8Zc5KvuZZwVZJHmZV2Ea
 MnfdxlhY+A6fwKgfwtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE top controller used by the SM8250 lite pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-lite-top-v10x.c      | 387 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 3 files changed, 390 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-lite-top-v10x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index f26806c69e14..22df889656ba 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-camif-v10x.o \
+		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
 		camss-ife-scale-v10x.o \
 		camss-ife-top-v20x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-lite-top-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v10x.c
new file mode 100644
index 000000000000..79b270b3a712
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v10x.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss-ife-camif-v10x.h"
+#include "camss-ife.h"
+#include "camss.h"
+
+#define IFE_LT_V10X_TOP_OFFS		0x0000
+#define IFE_LT_V10X_CAMIF_RDI_OFFSET	(IFE_LT_V10X_TOP_OFFS + 0x1200)
+
+#define IFE_LT_V10X_MOD_VER_MAJOR		GENMASK(31, 28)
+#define IFE_LT_V10X_MOD_VER_MINOR		GENMASK(27, 16)
+#define IFE_LT_V10X_MOD_VER_STEPS		GENMASK(15, 0)
+#define IFE_LT_V10X_MOD_MAJOR_VERSION(val)	FIELD_GET(IFE_LT_V10X_MOD_VER_MAJOR, val)
+#define IFE_LT_V10X_MOD_MINOR_VERSION(val)	FIELD_GET(IFE_LT_V10X_MOD_VER_MINOR, val)
+#define IFE_LT_V10X_MOD_STEPS_VERSION(val)	FIELD_GET(IFE_LT_V10X_MOD_VER_STEPS, val)
+
+/* CSID-level reset and register-update (via csid_base) */
+#define IFE_LT_V10X_TOP_RST_CMD_CORE_SW_RST	BIT(1)
+#define IFE_LT_V10X_IIF_IRQ_RUPD_GROUP0	BIT(0)
+#define IFE_LT_V10X_IIF_IRQ_RUPD_GROUP1	BIT(1)
+#define IFE_LT_V10X_IIF_IRQ_RUPD_GROUP2	BIT(2)
+#define IFE_LT_V10X_IIF_IRQ_RUPD_GROUP3	BIT(3)
+#define IFE_LT_V10X_TOP_IRQ_CMD_CLEAR	BIT(0)
+#define IFE_LT_V10X_TOP_IRQ_S0_RST_DONE		BIT(17)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI3_FRAME_DROP	BIT(8)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI2_FRAME_DROP	BIT(7)
+
+/* TOP functional IRQ registers */
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI1_FRAME_DROP	BIT(6)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI0_FRAME_DROP	BIT(5)
+#define IFE_LT_V10X_TOP_IRQ_S0_BUSWR		BIT(4)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI3_OVERFLOW	BIT(3)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI2_OVERFLOW	BIT(2)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI1_OVERFLOW	BIT(1)
+#define IFE_LT_V10X_TOP_IRQ_S0_RDI0_OVERFLOW	BIT(0)
+
+#define	IFE_LT_V10X_TOP_IRQ_S0_ERRORS_MASK	\
+	(IFE_LT_V10X_TOP_IRQ_S0_RDI3_FRAME_DROP	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI2_FRAME_DROP	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI1_FRAME_DROP	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI0_FRAME_DROP	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI3_OVERFLOW	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI2_OVERFLOW	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI1_OVERFLOW	| \
+	 IFE_LT_V10X_TOP_IRQ_S0_RDI0_OVERFLOW)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_EPOCH1	BIT(15)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_EPOCH0	BIT(14)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_EOF		BIT(13)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_SOF		BIT(12)
+
+/* IRQ_STATUS_1 bits - per-RDI SOF/EOF/EPOCH */
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH1	BIT(11)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH0	BIT(10)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_EOF		BIT(9)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_SOF		BIT(8)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH1	BIT(7)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH0	BIT(6)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_EOF		BIT(5)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_SOF		BIT(4)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH1	BIT(3)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH0	BIT(2)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_EOF		BIT(1)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_SOF		BIT(0)
+
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI0 \
+	(IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH1	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH0	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_EOF		| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_SOF)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI1 \
+	(IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH1	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH0	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_EOF		| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_SOF)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI2 \
+	(IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH1	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH0	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_EOF		| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_SOF)
+#define IFE_LT_V10X_TOP_IRQ_S1_RDI3 \
+	(IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_EPOCH1	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_EPOCH0	| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_EOF		| \
+	 IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_SOF)
+
+#define IFE_LT_V10X_TOP_IRQ_S2_DIAG_VIOLATION_IRQ	BIT(12)
+#define IFE_LT_V10X_TOP_IRQ_S2_RDI3_CAMIF_VIOLATION	BIT(11)
+#define IFE_LT_V10X_TOP_IRQ_S2_RDI2_CAMIF_VIOLATION	BIT(10)
+#define IFE_LT_V10X_TOP_IRQ_S2_RDI1_CAMIF_VIOLATION	BIT(9)
+#define IFE_LT_V10X_TOP_IRQ_S2_RDI0_CAMIF_VIOLATION	BIT(8)
+
+#define	IFE_LT_V10X_TOP_IRQ_S2_ERRORS_MASK	\
+	(IFE_LT_V10X_TOP_IRQ_S2_DIAG_VIOLATION_IRQ	| \
+	 IFE_LT_V10X_TOP_IRQ_S2_RDI3_CAMIF_VIOLATION	| \
+	 IFE_LT_V10X_TOP_IRQ_S2_RDI2_CAMIF_VIOLATION	| \
+	 IFE_LT_V10X_TOP_IRQ_S2_RDI1_CAMIF_VIOLATION	| \
+	 IFE_LT_V10X_TOP_IRQ_S2_RDI0_CAMIF_VIOLATION)
+
+#define IFE_LT_V10X_HW_VERSION		0x00000000
+#define IFE_LT_V10X_RST_CMD		0x0000000c
+#define IFE_LT_V10X_REG_UPDATE_CMD	0x00000020
+#define IFE_LT_V10X_IRQ_CMD		0x00000024
+#define IFE_LT_V10X_IRQ_MASK_S0		0x00000028
+#define IFE_LT_V10X_IRQ_MASK_S1		0x0000002c
+#define IFE_LT_V10X_IRQ_MASK_S2		0x00000030
+#define IFE_LT_V10X_IRQ_CLEAR_S0	0x00000034
+#define IFE_LT_V10X_IRQ_CLEAR_S1	0x00000038
+#define IFE_LT_V10X_IRQ_CLEAR_S2	0x0000003c
+#define IFE_LT_V10X_IRQ_STATUS_S0	0x00000040
+#define IFE_LT_V10X_IRQ_STATUS_S1	0x00000044
+#define IFE_LT_V10X_IRQ_STATUS_S2	0x00000048
+
+static int ife_lite_top_10x_acquire(struct ife_device *ife, void __iomem *base,
+				    void __iomem *csid_base)
+{
+	struct ife_top_ctx *ctx = &ife->top_ctx;
+
+	ctx->base	= base + IFE_LT_V10X_TOP_OFFS;
+	ctx->rdi_base	= base + IFE_LT_V10X_CAMIF_RDI_OFFSET;
+	ctx->camif_ops	= ife->res->camif_ops;
+	ctx->dev	= ife->camss->dev;
+
+	return 0;
+}
+
+static void ife_lite_top_10x_release(struct ife_top_ctx *ctx)
+{
+	ctx->base      = NULL;
+	ctx->camif_ops = NULL;
+}
+
+static int ife_lite_top_10x_pipe_config(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc,
+					const struct camss_ife_pipeline_cfg *pipeline_cfg,
+					const struct camss_ife_wm_config *wm_cfg)
+{
+	const struct ife_hw_camif_ops *camif_ops = ctx->camif_ops;
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		camif_ops->config(ctx->rdi_base +
+				  IFE_CAMIF_V10X_RDIX_OFFS(hw_pipe), hw_pipe, pipeline_cfg);
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ife_lite_top_10x_pipe_enable(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc)
+{
+	const struct ife_hw_camif_ops *camif_ops = ctx->camif_ops;
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		camif_ops->enable(ctx->rdi_base + IFE_CAMIF_V10X_RDIX_OFFS(hw_pipe),
+				  hw_pipe);
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ife_lite_top_10x_pipe_disable(struct ife_top_ctx *ctx,
+					 const struct ife_pad_desc *desc)
+{
+	const struct ife_hw_camif_ops *camif_ops = ctx->camif_ops;
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		camif_ops->disable(ctx->rdi_base + IFE_CAMIF_V10X_RDIX_OFFS(hw_pipe),
+				   hw_pipe);
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static u32 ife_lite_top_10x_version(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 reg = readl_relaxed(base + IFE_LT_V10X_HW_VERSION);
+	struct camss_hw_version hw_ver;
+
+	hw_ver.ids.major = IFE_LT_V10X_MOD_MAJOR_VERSION(reg);
+	hw_ver.ids.minor = IFE_LT_V10X_MOD_MINOR_VERSION(reg);
+	hw_ver.ids.steps = IFE_LT_V10X_MOD_STEPS_VERSION(reg);
+
+	return hw_ver.hw_version;
+}
+
+static void ife_lite_top_10x_reset(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(~0, base + IFE_LT_V10X_IRQ_CLEAR_S0);
+	writel_relaxed(~0, base + IFE_LT_V10X_IRQ_CLEAR_S1);
+	writel_relaxed(~0, base + IFE_LT_V10X_IRQ_CLEAR_S2);
+	writel_relaxed(IFE_LT_V10X_TOP_IRQ_S0_RST_DONE,
+		       base + IFE_LT_V10X_IRQ_MASK_S0);
+	writel_relaxed(IFE_LT_V10X_TOP_RST_CMD_CORE_SW_RST, base + IFE_LT_V10X_RST_CMD);
+}
+
+static void ife_lite_top_10x_reg_update(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *dsc)
+{
+	void __iomem *base = ctx->base;
+
+	switch (dsc->hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		writel_relaxed(IFE_LT_V10X_IIF_IRQ_RUPD_GROUP0, base + IFE_LT_V10X_REG_UPDATE_CMD);
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		writel_relaxed(IFE_LT_V10X_IIF_IRQ_RUPD_GROUP1, base + IFE_LT_V10X_REG_UPDATE_CMD);
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		writel_relaxed(IFE_LT_V10X_IIF_IRQ_RUPD_GROUP2, base + IFE_LT_V10X_REG_UPDATE_CMD);
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		writel_relaxed(IFE_LT_V10X_IIF_IRQ_RUPD_GROUP3, base + IFE_LT_V10X_REG_UPDATE_CMD);
+		break;
+	default:
+		dev_warn(ctx->dev, "The requested RUP is invalid: 0x%x\n", dsc->hw_pipe);
+	}
+}
+
+static void ife_lite_top_10x_prepare(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	/* Clear pending interrupts */
+	writel_relaxed(~0, base + IFE_LT_V10X_IRQ_CLEAR_S0);
+	writel_relaxed(~0, base + IFE_LT_V10X_IRQ_CLEAR_S1);
+	writel_relaxed(~0, base + IFE_LT_V10X_IRQ_CLEAR_S2);
+	writel_relaxed(IFE_LT_V10X_TOP_IRQ_CMD_CLEAR, base + IFE_LT_V10X_IRQ_CMD);
+
+	/* Enable common, frame drops and overflow interrupts */
+	rval = IFE_LT_V10X_TOP_IRQ_S0_BUSWR | IFE_LT_V10X_TOP_IRQ_S0_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_LT_V10X_IRQ_MASK_S0);
+
+	/* Enable violation error interrupts */
+	rval = IFE_LT_V10X_TOP_IRQ_S2_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_LT_V10X_IRQ_MASK_S2);
+}
+
+static void ife_lite_top_10x_enable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 mask;
+	u32 rval;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI3;
+		break;
+	default:
+		WARN_ONCE(true, "The hw_pipe is invalid: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	rval = readl_relaxed(base + IFE_LT_V10X_IRQ_MASK_S1);
+	writel_relaxed(rval | mask, base + IFE_LT_V10X_IRQ_MASK_S1);
+}
+
+static void ife_lite_top_10x_disable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 mask;
+	u32 rval;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		mask = IFE_LT_V10X_TOP_IRQ_S1_RDI3;
+		break;
+	default:
+		WARN_ONCE(true, "The hw_pipe is invalid: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	rval = readl_relaxed(base + IFE_LT_V10X_IRQ_MASK_S1);
+	writel_relaxed(rval & ~mask, base + IFE_LT_V10X_IRQ_MASK_S1);
+}
+
+static void ife_lite_top_10x_irq_status(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX])
+{
+	void __iomem *base = ctx->base;
+	u32 top_stat;
+
+	top_stat = readl_relaxed(base + IFE_LT_V10X_IRQ_STATUS_S0);
+	writel_relaxed(top_stat, base + IFE_LT_V10X_IRQ_CLEAR_S0);
+
+	isr_stat[IFE_TOP_STATUS_ID0] = 0;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S0_RST_DONE)
+		isr_stat[IFE_TOP_STATUS_ID0] = IFE_HW_TOP_IRQ0_RST_DONE;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S0_BUSWR)
+		isr_stat[IFE_TOP_STATUS_ID0] |= IFE_HW_TOP_IRQ0_BUSWR;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S0_ERRORS_MASK)
+		isr_stat[IFE_TOP_STATUS_ID0] |= top_stat & IFE_LT_V10X_TOP_IRQ_S0_ERRORS_MASK;
+
+	top_stat = readl_relaxed(base + IFE_LT_V10X_IRQ_STATUS_S1);
+	writel_relaxed(top_stat, base + IFE_LT_V10X_IRQ_CLEAR_S1);
+
+	isr_stat[IFE_TOP_STATUS_ID1] = 0;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S1_RDI0_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_SOF;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S1_RDI1_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_SOF;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S1_RDI2_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_SOF;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S1_RDI3_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI3_SOF;
+
+	top_stat = readl_relaxed(base + IFE_LT_V10X_IRQ_STATUS_S2);
+	writel_relaxed(top_stat, base + IFE_LT_V10X_IRQ_CLEAR_S2);
+
+	isr_stat[IFE_TOP_STATUS_ID2] = 0;
+
+	if (top_stat & IFE_LT_V10X_TOP_IRQ_S2_ERRORS_MASK)
+		isr_stat[IFE_TOP_STATUS_ID2] |= top_stat & IFE_LT_V10X_TOP_IRQ_S2_ERRORS_MASK;
+
+	writel_relaxed(IFE_LT_V10X_TOP_IRQ_CMD_CLEAR, base + IFE_LT_V10X_IRQ_CMD);
+}
+
+const struct ife_hw_top_ops ife_lite_top_10x_ops = {
+	.acquire	= ife_lite_top_10x_acquire,
+	.release	= ife_lite_top_10x_release,
+	.version	= ife_lite_top_10x_version,
+	.prepare	= ife_lite_top_10x_prepare,
+	.enable		= ife_lite_top_10x_enable,
+	.disable	= ife_lite_top_10x_disable,
+	.pipe_config	= ife_lite_top_10x_pipe_config,
+	.pipe_enable	= ife_lite_top_10x_pipe_enable,
+	.pipe_disable	= ife_lite_top_10x_pipe_disable,
+	.reg_update	= ife_lite_top_10x_reg_update,
+	.reset		= ife_lite_top_10x_reset,
+	.irq_status	= ife_lite_top_10x_irq_status,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 258af76c94ea..a36efd8a6352 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -393,4 +393,6 @@ extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
+extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
+
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

