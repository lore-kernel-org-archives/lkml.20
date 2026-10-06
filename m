Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3963A963A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326471; cv=none; b=S0QAdtCACWHMZKmDVZg0Hq7x2bg0zFDq6ilbYaCT7lDVL9/XDmAkRfPGKZjxaOTDsIQjQjBMvE9k5zyrOKKt/w0ft0+6MJGPJ+EHqVhTUVqWlvaoPbvscWzN8ZMbXLE4XKWqYsRK8g3/etHLCMYmQS40A1TOlePVe7IhPmgCcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326471; c=relaxed/simple;
	bh=BfWllAMlA7O5HU2TXzoXuy8uj1a6abfiuL+6ufE++uA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kKypGl+GcA40ZVfP7xzRqN3cEPYhw0CaSstWXXf+vPQ/TxmVyezXXAEDp+On10qbScIMAXw595yAOGwz6vfYZcoLkXkRm6lcqOwnFiApXdmO9+OCWffBGM+j1aR/Sy+VppapeB7CBva504oDRPC2+ch7EhCaqjIrTI4Nk3Ylmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVleAwg reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyVleAwg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lea8B1676240
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L/VZ0T6uAEB
	5RrdF6heBACOb9jTomKrTKqst/Nivjr4=; b=iyVleAwgD6rWIUmLgRnzLXBQ7an
	y+Ow9gCkXS8GnWQ6gXqQMFRowCPRE4I4Gv9Q2hKGKquHzi7VAfK8S//HlZbJSrON
	jsBvneJI2nk5m8IO5hV6XYE10vRMEFFmUPjSe3VM9649JQlAI1PP5K0aMQxEa4MG
	4tL9SDpNuqgZCkfa5FVTqhI4d8N/moniwhWmdTBK6IdBNRkAmP3SYDVIQLCgCefe
	uQ2tI6ikn4Be4fnFmLaeJjkmb7fdgoTtRC4wzf/fyWfnOteXsd9F9+gFiqaQpguh
	/6zl+s+7oHaZdk2EATx3PccnfH0DjONInifSwin6XBaIauIY5n/g5Ys9JGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub0yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso658278185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326443; x=1791931243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/VZ0T6uAEB5RrdF6heBACOb9jTomKrTKqst/Nivjr4=;
        b=2OJt/k9SEwkrb+tWo5MxWma1PCkGqe06Yfww/CADASNW2KT1CMBKUJdsaU+lDJ9xc/
         XAg978cC6eUv/ohwvunPhpx5AHVnSWxbsYAS1+h2xl9N3qONaaG6/Hxet/bJM/6Jj9JE
         TnCyTBaRRYUp8imdlKX8lh9j4mez25piyOMWfK16sjcguD9mpEEFAiIP3vFVudrEwmW8
         OxpBiMcVZ/AAztABbflezC48R++YyknT0tExdY0lhLkFyeFQkY0lh4/p+6GKb7s488VL
         HuN1uRN7kgJoC7ivpX7AUiz08TzaWzDJzf1XeUlhpiSNlwsZeGA9jKF8NYgc+SxCsHQO
         hAQw==
X-Forwarded-Encrypted: i=1; AKwUvBx83Xstx9bWxtxUyZvjLU5Hgp2JTY09n9vtqPKlRLKC10VEoZClSuFR3UqWXVdR4B7M/fqgbe9MXUme8hs=@vger.kernel.org
X-Gm-Message-State: AFuF++nGIcHDA9MQWYe25qjCSDxCm5B9c1PHuDNu27NKsyl3LgA99VeA
	OGZqundqvn/181eHLsN9DFurl4+HLQ/qTM/qYpfV2vQ6bUV6cjcjNicnp8CcUUluieaKXu2AHKH
	AHWV8IjDUUEDO4i41tg9Du2fRf5QbKqUIvF7QiQi5ToBeIYRbr3LNjHO4Qvxq4+sXYkU=
X-Gm-Gg: AYBFou3Ava+FjgHBeZ4Lx/mn3qqnB0UrJYLucL0eg5nlXAiDau/F35hDhuK0QXeX1tD
	rhXEuFVIRSLVVU0RwOSslShB93Qptc689gqsQ9yGev9Q9nqyoP3R+XsyFbyGIz8KVEbvCFjTR6K
	TICl1cb1YHgvPwJj5YQbjUSWJrl5BlfrmQlLEN5kOXQSxk9AzfAhL0aZ1cKaty9ElJ3/kjW3u59
	5vi3MihL8TEEn9QUTB2Xzn+bngWjvitil97Kjeb3PU3B6oKpFfGtw/8plekW+66d3KAuvbPQCk9
	Axl9RRfb1RCHfXdSpb2VJZ6rG1luf57Fa/uaGMFdQM9Ashq3dfjQnigyjDs=
X-Received: by 2002:a05:620a:4399:b0:93e:9809:838b with SMTP id af79cd13be357-93e9b8a9d99mr80882785a.75.1791326443005;
        Tue, 06 Oct 2026 15:40:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4399:b0:93e:9809:838b with SMTP id af79cd13be357-93e9b8a9d99mr80877485a.75.1791326442377;
        Tue, 06 Oct 2026 15:40:42 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:41 -0700 (PDT)
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
Subject: [PATCH 12/45] media: qcom: camss: sm8250: add IFE Lite top v10x
Date: Wed,  7 Oct 2026 01:39:20 +0300
Message-Id: <20261006223953.3382273-13-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXwNl+5NzFiXdA
 JQg/7ONw1d1g5eea1oFIlN0oiKE1sm01AnwdFhdnkKy2Pp4QO3AcJduL1GZIXybCf9Q7qFmPEK1
 w17QYWwGtzNLxftI2A3bX+Izk37wzq8=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac578eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=aQGKX1_pSblwAH9i0lwA:9
 a=1Kpc2c5P7VrA9DiO:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HW2jKaIEUfs6hptShQ5b_3rQ1x5TOWok
X-Proofpoint-ORIG-GUID: HW2jKaIEUfs6hptShQ5b_3rQ1x5TOWok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3Pui7sBWBvmh
 oHEYqCSvARKhbvqmh55WS6kZfFwEzNnn0l8PXTaCaNxBvnw9egZ9W2b3DcRNcx5oJAvpZ6D9pXF
 53TnC4VCzu28ZzJw/BKs8uN/koAUL5WkTx60Fse7K4tcQvUwRO9zkf+N9Q+JMnb3FOjVNsajCsG
 rDHfM6XmjRPfEqg/N2Kn2i4zMDrojZouhVXo7ZLataEUNNTcjZEHbZ6EHHE6Wqh/JtFcCHppjzC
 Ca8S09UfuiC67Aja7Jk/9rp1DD5y38mjNDRE7tGbueooRKngic7k5IkC90m4BngJ9tuhfscyJm6
 KM5rO8iNvu8pYEGzK0fj90uEZc8iU3H4YfXjbi9Dt7SzSzCPusZYwteIXzZErmIipeu3qL+XDnS
 Rm5KjHLHplpte0BbiSauOMR3hqul/HW4M7S8dnEcSTfpwOJUR+h87M0FMH6N+Xp/jPFMsD1erg8
 mdfDR9iw/qfgzP/HznA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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

