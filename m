Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328767;
	b=S1wGZmmuPros7nXpSqMx0KSPww4PX9ecKM8KWaKfAIdqh+I5v5ENaY6tHnS29g1uKicf
	 7Ge2UmDFc5kN0E7nuRhDxiS76h1K+vALxe6kE+OokSsqhVUKIP9u27MhYqJkAM1et3zVf
	 mJZ3QWkgmE3q8aGafXg8OLGMTT04rtFLH4PyTmpFSpnQfPS9wZ84ayATcKXqRx2T6N5CU
	 WrkaQpCO31V/6UUNqVDUIrvWpnVj44V8hR/uSybjpOeuiaM3PBeWjgwVJTVYqGd5i7ihq
	 941QYaQUNpUc7IEsm7RoDdWvsF5bUlY29rIY+XNgVUguU6tuSA3m2pR7U74WzVTu8rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FYlkZGGBer+mrWkLM4Bvpp7vny+iX43T97WuwO2l3/0=;
	b=V/CkHktizgEY6ZkfHjCJrc6iQvG06OTotC7xZkDWc22g6k41DYYwoC7oCZhx/pGsX/ic
	 mrS85YuMBHye1jgOJ3ISh7PP25ZOAcsvRDC8pUkeNhFU/rLVQAjD22WBRiE+1eWJNnvbx
	 sfhaKrNnUvDAlyd/CHlhOTFBijjtYWKaIBmyyH7fNUo+l5xB3gOReZ3tcFu6XSu3wRCYU
	 1OEG4S+CW9hjKnqYqcbyYXo1NKExRhMCWMJxKDYdfWs1R5Wm4HYLsKBqdQDUs/gTb4oQ4
	 bUPze1KLwzILlvjZIjDjAS/dyd+pU3mqlQ72w8pICIlHwOxanQ8txQVvIm+Y6OuWK7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ibLeOqrX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ip2tcM1t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3F606BAF1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB3F606BAF1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ibLeOqrX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ip2tcM1t
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Ftk151587
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FYlkZGGBer+
	mrWkLM4Bvpp7vny+iX43T97WuwO2l3/0=; b=ibLeOqrXytmUMFzmTYcLne/ZPQ6
	XitC4O1HK89pXQ/uteG9riT8mOoyBSv/Qz3lHMPC90DFma6/EMJNx8oi7Y24AjwA
	4dod5OORu3GCKBjrHwknX91KLlDXobhP+b36LZuLQ29PAjIqotZDXNcD0qVUYSmf
	QpexbaEHxk4/rQX1IhPEfhy9d2J+nUtQyoTMDPyc4RycuIMFJnUES0ZPrIePZkjw
	DZe5+RG7D2Rk/8ImCDCDmUsLI80GbQJg9QOzCDy8yDz+J4c6+P9TidY7+joseoFg
	vXZxHSXAEd1BDFWD+uf5dq6Ijip102FvAhYYr6YiMR0KIVQ+L7DHuTM4INA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8nr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99064f8c7efso1486127241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328764; x=1794933564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYlkZGGBer+mrWkLM4Bvpp7vny+iX43T97WuwO2l3/0=;
        b=Ip2tcM1tLhM60vFUcm0DP87vbMk/wJEyUyvyP2j45BgK4vQRMFEtvRdiYkwKRJ0dgn
         BDRxCXZMtQZrSkvIAu9tUp6hU3TafQA+R2cLPnk/4KAfXngRPA6pIQ7rD4cWfoQJM5um
         Y6ammDthqFdiWs1c1qtp1XKU05osMdOY+XE19As5tXWDN/MmLgMXAJPu7fdDbEFl4EQG
         kB+8oRfL0bYkIEnbNk1eciEvjXDCYtVzPZxotWAAFl02wRULzOitOb1Kcc1673dUCTL9
         mcQLBmwzCYNflT9aZy19b0aqlYQbrIJIqCpPWMWCvbqkvW/44nQSkvaF6zfY2hJS8dRs
         YEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328764; x=1794933564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYlkZGGBer+mrWkLM4Bvpp7vny+iX43T97WuwO2l3/0=;
        b=LpYBwxdNFLhf2BQwla9kRhyv+epMjzytJu/8EEOCSH/9VbyTLdZOrVIUjk9tlu97dH
         QrYfdJ3RIHxE+xUD3eYRBt1VrewRpp6eqIrLCGJDqR5ciwMMpMpT5c57xNS0Qj3xE1WC
         cnDK/yDwoeJOIb9GIfijhxW31KlwWWYXebKh6P6MpQcLowg5qkVwKsRX0z+gFYyhzhEr
         +RzL5gh0eGzz4dVPSHjdGQaAmt0/yzUGYNSr62HPpYRuQTXFD/HQnpmnslOgOwheYmGb
         WQdWX3+asWZkgwQN9P/OGGXDBwKdVKpBLLBZ4r2wR3wdCXn2Gj8KF01rKgKbZt5Rt/hR
         s41g==
X-Forwarded-Encrypted: i=1; AL+hErFPdjS1/bgbDYgGq8X4E5tcdmRIOfClJVXhwO/D95maKlwV6lmytDE0CINApCjmDDAv1bccugPVeD1xiII=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j04jmWjDkiHx2iGn7TKMOuL/bitBwHWK4KQjfBrT31djKQ8rS
	GoJ4Fak87rCen32GyyLUpiL0cixxc2UORR+KFcxQ/IQ6uvjn8FCiTOoQ9t47cE+ktWhh0LANgT4
	AqFPPtpqFyH6plzrJdrS0g0aUTgWZPK9xrYyHOf4PmccN2KAdskmKQb+vt0Yrs1fZVF8=
X-Gm-Gg: AYBFou24m4Wn12hBVCI3rw8drY4G0GSmR/whKtU8mdYzM6Tlm8Z+saEbX69fPwCw3aU
	BLxq76OKSqoXnDUaVC8ge3U6L4qPZkMwaTr96mNiMODncQ5hf62mqU0eo7xUQQgO4delhqbhfhp
	A6Q5L3AqDoEQpiiqgjOdNbj0+9hVMILe/sQgtC4ZAiSxYoOdUFdbCweuidvM5cDTNGlYLnZK+F9
	dHzCHlxPvjBrYmgisfHYJhgDJq1HRU3huiNeRPlzUqw/m3X2Z+7WD7J37MCbogx7DmQJxREMQ/y
	+3MiDmP8XCobnGHBAhWEFos/c9TgPhFSUrIm3cEXqxFWAhO9jn53tYEJzmsXtW5C2VoX/hsHzjJ
	q5NMu2AAKWgmygBKjU8NO+oeT8Pc2FxU0zXYisNTzFuOqkBVukOuxlC3aAal6dCZpcsazGk8+aQ
	==
X-Received: by 2002:a05:6102:f98:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7d301b822a1mr1369870137.11.1794328762770;
        Tue, 10 Nov 2026 08:39:22 -0800 (PST)
X-Received: by 2002:a05:6102:f98:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7d301b822a1mr1369851137.11.1794328761785;
        Tue, 10 Nov 2026 08:39:21 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:20 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 4/8] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Date: Tue, 10 Nov 2026 18:39:05 +0200
Message-Id: <20261110163909.78085-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af348bd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rEr2slAisyVxdNO4sqIA:9 a=O8hF6Hzn-FEA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: K-TwwhggIMEc4xvUsE86Pzp-CFe6FVKw
X-Proofpoint-GUID: K-TwwhggIMEc4xvUsE86Pzp-CFe6FVKw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXzkHOoy1hsJ1M
 w1BEuRdpqNBb1ZUtK3qpWHHFoopmpuVBRiqFHPWkzYGwTNdoxFuNCxEo/DyV/x8YxTmKmrGKrV8
 IctkZu2ax6pbbJUahHnFXaxShs6eoU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX0aaF+kCYCo6b
 4cqNf7SEhIgr/wmhb2bHH9bvq0FL3/CjMlZHNQSWmSrIM3v3S7g4JPoI+1/yw4J3l83dgmR0q/E
 c3Ky4CQnrAs8lBr3SRuCCdgLfzkdP72q53876LbHkTPvRvn5Qr2cyoca5ZxopOEY1U+Wj9+tt+N
 5cHniYv9JV/HpXDLwfndiXqCUqRYi3tjUQucCVXjaLwHmXfaXQRXBA76QOc87s6XOBMvLC4kq2v
 GobU7Pa8sx526wLqVOUb0MTVvOrcNEh+xY/n1B2etpHDFB6yyfNR3T85Pfunyaz8GStE1Zskh7/
 TKFdC1HTZlhT0mFQV/809eraYNOBbPNTYD3nqGKYuWMU3rtP+VqD+Ja8UUV+EHmHP8S5MY3WMBf
 zMkRVQGt+Itc6D6kgEu4VzduNfrcyxOEEeNHp5ivQnDRKOwYqxaj7n/vqUpl5CUR/TRiqmle/PS
 FYB+IL5z/KlpPneLzVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add a Qualcomm JPEG encoder driver implemented on top of the
V4L2 mem2mem framework.

The driver wires vb2 queue handling, format negotiation, JPEG header
handling, interrupt-driven job completion, and runtime PM/clock/ICC
integration for the standalone JPEG encode hardware block.

This series targets SM8250 (Kona) and SC7280 (Kodiak) platforms.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    7 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  379 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  122 ++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.c | 1541 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.h |   45 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  215 +++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1175 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   13 +
 11 files changed, 3514 insertions(+)
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h

diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index 4f4d3a68e6e5f..3efae2bcae7a9 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -4,4 +4,5 @@ comment "Qualcomm media platform drivers"
 
 source "drivers/media/platform/qcom/camss/Kconfig"
 source "drivers/media/platform/qcom/iris/Kconfig"
+source "drivers/media/platform/qcom/jpeg/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
index ea2221a202c09..011b5d2371931 100644
--- a/drivers/media/platform/qcom/Makefile
+++ b/drivers/media/platform/qcom/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += camss/
 obj-y += iris/
+obj-y += jpeg/
 obj-y += venus/
diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/platform/qcom/jpeg/Kconfig
new file mode 100644
index 0000000000000..d1949d277d2ba
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_QCOM_JENC
+	tristate "Qualcomm V4L2 JPEG Encoder driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on VIDEO_DEV
+	select VIDEOBUF2_DMA_SG
+	select V4L2_JPEG_HELPER
+	select V4L2_MEM2MEM_DEV
+	help
+	  V4L2 mem2mem driver for the Qualcomm JPEG encoder hardware
+	  found in Snapdragon SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qcom-jenc.
diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/platform/qcom/jpeg/Makefile
new file mode 100644
index 0000000000000..e702475245708
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_QCOM_JENC) += qcom-jenc.o
+
+qcom-jenc-objs += \
+	qcom_jenc_dev.o \
+	qcom_jenc_v4l2.o \
+	qcom_jenc_v420.o
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
new file mode 100644
index 0000000000000..dd2200665a1c3
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <media/v4l2-mem2mem.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_v420.h"
+#include "qcom_jenc_v4l2.h"
+
+struct qcom_jpeg_data {
+	const struct dev_pm_domain_attach_data *opp_pd_data;
+	unsigned long camnoc_axi_min_rate;
+};
+
+static const char * const qcom_jpeg_pd_names[] = { "titan_top" };
+
+static const struct dev_pm_domain_attach_data qcom_jpeg_pd_data = {
+	.pd_names = qcom_jpeg_pd_names,
+	.num_pd_names = ARRAY_SIZE(qcom_jpeg_pd_names),
+};
+
+static const char * const sc7280_opp_pd_names[] = { "cx" };
+
+static const struct dev_pm_domain_attach_data sc7280_opp_pd_data = {
+	.pd_names = sc7280_opp_pd_names,
+	.num_pd_names = ARRAY_SIZE(sc7280_opp_pd_names),
+	.pd_flags = PD_FLAG_REQUIRED_OPP,
+};
+
+static const struct qcom_jpeg_data sc7280_data = {
+	.opp_pd_data = &sc7280_opp_pd_data,
+	.camnoc_axi_min_rate = 150000000,
+};
+
+static const char * const sm8250_opp_pd_names[] = { "mx", "mmcx" };
+
+static const struct dev_pm_domain_attach_data sm8250_opp_pd_data = {
+	.pd_names = sm8250_opp_pd_names,
+	.num_pd_names = ARRAY_SIZE(sm8250_opp_pd_names),
+	.pd_flags = PD_FLAG_REQUIRED_OPP,
+};
+
+static const struct qcom_jpeg_data sm8250_data = {
+	.opp_pd_data = &sm8250_opp_pd_data,
+	.camnoc_axi_min_rate = 300000000,
+};
+
+/*
+ * qcom_jpeg_pd_init - attach the power domains of the JPEG encoder
+ *
+ * TITAN_TOP_GDSC powers the block. The OPP table votes the performance
+ * levels of the SoC domains through required-opps, in the order of
+ * the opp_pd_data names.
+ */
+static int qcom_jpeg_pd_init(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_data *data = device_get_match_data(jenc->dev);
+	int rc;
+
+	rc = devm_pm_domain_attach_list(jenc->dev, &qcom_jpeg_pd_data, &jenc->pd_list);
+	if (rc < 0)
+		return rc;
+
+	rc = devm_pm_domain_attach_list(jenc->dev, data->opp_pd_data, &jenc->opp_pd_list);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+
+static int qcom_jpeg_opp_init(struct qcom_jenc_dev *jenc)
+{
+	struct dev_pm_opp *opp;
+	int rc;
+
+	rc = devm_pm_opp_set_clkname(jenc->dev, "core");
+	if (rc)
+		return rc;
+
+	rc = devm_pm_opp_of_add_table(jenc->dev);
+	if (rc)
+		return rc;
+
+	/* initialize the maximum available frequency for the JPEG core */
+	jenc->max_freq = ULONG_MAX;
+	opp = dev_pm_opp_find_freq_floor_indexed(jenc->dev, &jenc->max_freq, 0);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	dev_pm_opp_put(opp);
+
+	/* initialize the default optimized frequency for the JPEG core */
+	jenc->opt_freq = jenc->max_freq;
+
+	return 0;
+}
+
+static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_data *data = device_get_match_data(jenc->dev);
+	int i;
+
+	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
+	if (jenc->num_clks < 0)
+		return jenc->num_clks;
+
+	for (i = 0; i < jenc->num_clks; i++) {
+		if (!strcmp(jenc->clks[i].id, "camnoc_axi"))
+			jenc->camnoc_axi_src = clk_get_parent(jenc->clks[i].clk);
+	}
+
+	if (!jenc->camnoc_axi_src)
+		return -ENOENT;
+
+	jenc->camnoc_axi_min_rate = data->camnoc_axi_min_rate;
+
+	return 0;
+}
+
+int qcom_jpeg_clk_retune(struct qcom_jenc_dev *jenc, unsigned long *freq)
+{
+	struct dev_pm_opp *opp;
+	int rc;
+
+	/* setup the OPP according to the calculated optimal frequency */
+	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, freq, 0);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	rc = dev_pm_opp_set_opp(jenc->dev, opp);
+	if (rc) {
+		dev_pm_opp_put(opp);
+		return rc;
+	}
+
+	dev_pm_opp_put(opp);
+
+	return 0;
+}
+
+static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
+{
+	int rc;
+
+	rc = clk_bulk_prepare(jenc->num_clks, jenc->clks);
+	if (rc)
+		return rc;
+
+	rc = clk_set_rate_range(jenc->camnoc_axi_src, jenc->camnoc_axi_min_rate, ULONG_MAX);
+	if (rc)
+		goto err_clk_unprepare;
+
+	rc = qcom_jpeg_clk_retune(jenc, &jenc->opt_freq);
+	if (rc)
+		goto err_camnoc_release;
+
+	rc = clk_bulk_enable(jenc->num_clks, jenc->clks);
+	if (rc)
+		goto err_opp_clear;
+
+	return 0;
+
+err_opp_clear:
+	dev_pm_opp_set_opp(jenc->dev, NULL);
+err_camnoc_release:
+	clk_set_rate_range(jenc->camnoc_axi_src, 0, ULONG_MAX);
+err_clk_unprepare:
+	clk_bulk_unprepare(jenc->num_clks, jenc->clks);
+
+	return rc;
+}
+
+static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
+{
+	clk_bulk_disable(jenc->num_clks, jenc->clks);
+	dev_pm_opp_set_opp(jenc->dev, NULL);
+	clk_set_rate_range(jenc->camnoc_axi_src, 0, ULONG_MAX);
+	clk_bulk_unprepare(jenc->num_clks, jenc->clks);
+	jenc->opt_freq = jenc->max_freq;
+}
+
+static int qcom_jpeg_pm_suspend(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+
+	qcom_jpeg_clk_off(jenc);
+
+	return 0;
+}
+
+static int qcom_jpeg_pm_resume(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	rc = qcom_jpeg_clk_on(jenc);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int qcom_jpeg_pm_system_suspend(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	v4l2_m2m_suspend(jenc->m2m_dev);
+
+	rc = pm_runtime_force_suspend(dev);
+	if (rc)
+		v4l2_m2m_resume(jenc->m2m_dev);
+
+	return rc;
+}
+
+static int qcom_jpeg_pm_system_resume(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_resume(dev);
+	if (rc)
+		return rc;
+
+	rc = qcom_jenc_v420_resume(jenc);
+	if (rc)
+		return rc;
+
+	v4l2_m2m_resume(jenc->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops qcom_jpeg_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(qcom_jpeg_pm_system_suspend, qcom_jpeg_pm_system_resume)
+	RUNTIME_PM_OPS(qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL)
+};
+
+static void qcom_jpeg_v4l2_dev_unregister(void *data)
+{
+	v4l2_device_unregister(data);
+}
+
+static int qcom_jpeg_probe(struct platform_device *pdev)
+{
+	struct qcom_jenc_dev *jenc;
+	int rc;
+
+	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
+	if (!jenc)
+		return -ENOMEM;
+
+	jenc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, jenc);
+
+	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
+	if (rc)
+		goto err_free_jenc;
+	rc = devm_mutex_init(&pdev->dev, &jenc->hw_ref_lock);
+	if (rc)
+		goto err_free_jenc;
+	spin_lock_init(&jenc->hw_lock);
+	init_completion(&jenc->reset_complete);
+	init_completion(&jenc->stop_complete);
+
+	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
+		goto err_free_jenc;
+	}
+
+	dma_set_max_seg_size(jenc->dev, UINT_MAX);
+
+	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jenc->jpeg_base)) {
+		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
+				   "failed to map JPEG resource\n");
+		goto err_free_jenc;
+	}
+
+	rc = qcom_jpeg_pd_init(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to attach power domains\n");
+		goto err_free_jenc;
+	}
+
+	rc = qcom_jpeg_opp_init(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to init OPP\n");
+		goto err_free_jenc;
+	}
+
+	rc = qcom_jpeg_clk_init(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to init clocks\n");
+		goto err_free_jenc;
+	}
+
+	jenc->irq = platform_get_irq(pdev, 0);
+	if (jenc->irq < 0) {
+		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
+		goto err_free_jenc;
+	}
+
+	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
+				       qcom_jenc_v420_irq_top,
+				       qcom_jenc_v420_irq_bot,
+				       IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(jenc->dev), jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
+		goto err_free_jenc;
+	}
+
+	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
+		goto err_free_jenc;
+	}
+
+	rc = devm_add_action_or_reset(jenc->dev, qcom_jpeg_v4l2_dev_unregister, &jenc->v4l2_dev);
+	if (rc)
+		goto err_free_jenc;
+
+	rc = devm_pm_runtime_enable(jenc->dev);
+	if (rc)
+		goto err_free_jenc;
+
+	rc = qcom_jpeg_v4l2_register(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
+		goto err_free_jenc;
+	}
+
+	return 0;
+
+err_free_jenc:
+	return rc;
+}
+
+static const struct of_device_id qcom_jpeg_of_match[] = {
+	{
+		.compatible	= "qcom,sc7280-jpeg-enc",
+		.data		= &sc7280_data
+	},
+	{
+		.compatible	= "qcom,sm8250-jpeg-enc",
+		.data		= &sm8250_data
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
+
+static struct platform_driver qcom_jpeg_platform_driver = {
+	.probe  = qcom_jpeg_probe,
+	.driver = {
+		.name = QCOM_JPEG_ENC_NAME,
+		.of_match_table = qcom_jpeg_of_match,
+		.pm             = pm_ptr(&qcom_jpeg_pm_ops),
+	},
+};
+
+module_platform_driver(qcom_jpeg_platform_driver);
+
+MODULE_DESCRIPTION("QCOM JPEG mem2mem V4L2 encoder");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
new file mode 100644
index 0000000000000..c7e4da0310d99
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_DEV_H
+#define QCOM_JENC_DEV_H
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-jpeg.h>
+#include <media/videobuf2-core.h>
+
+#define QCOM_JPEG_ENC_NAME "qcom-jpeg-enc"
+
+#define JPEG_HEADER_MAX	1024
+
+/* JPEG header built once per source format, copied into every output buffer */
+struct qcom_jenc_header {
+	u8				data[JPEG_HEADER_MAX];
+	struct v4l2_jpeg_hdr_layout	layout;
+};
+
+#define QCOM_JPEG_MAX_PLANES	3
+
+#define QCOM_JPEG_QUALITY_MIN	1
+#define QCOM_JPEG_QUALITY_DEF	98
+#define QCOM_JPEG_QUALITY_MAX	100
+#define QCOM_JPEG_QUALITY_UNT	1
+
+#define TYPE2QID(t) \
+	(V4L2_TYPE_IS_OUTPUT(t) ? JENC_SRC_QUEUE : JENC_DST_QUEUE)
+
+enum qcom_enc_qid {
+	JENC_SRC_QUEUE = 0,
+	JENC_DST_QUEUE,
+	JENC_QUEUE_MAX
+};
+
+struct jenc_enc_format {
+	u32 type;
+	u32 fourcc;
+};
+
+struct qcom_jpeg_buff {
+	struct {
+		struct sg_table		*sgt;
+		dma_addr_t		dma;
+		unsigned long		size;
+
+	} plns[QCOM_JPEG_MAX_PLANES];
+};
+
+struct qcom_jenc_queue {
+	struct v4l2_pix_format_mplane	vf;
+	u32				sequence;
+	struct qcom_jpeg_buff		buff[VB2_MAX_FRAME];
+	int				buff_id;
+};
+
+struct qcom_jenc_dev {
+	struct device			*dev;
+	struct v4l2_device		v4l2_dev;
+	struct v4l2_m2m_dev		*m2m_dev;
+	struct video_device		*vdev;
+	int				irq;
+	void __iomem			*jpeg_base;
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+	struct clk			*camnoc_axi_src;
+	unsigned long			camnoc_axi_min_rate;
+	struct dev_pm_domain_list	*pd_list;
+	struct dev_pm_domain_list	*opp_pd_list;
+	unsigned long			max_freq;
+	unsigned long			opt_freq;
+	/* device mutex lock */
+	struct mutex			dev_mutex;
+	/* hardware reference count lock */
+	struct mutex			hw_ref_lock;
+	unsigned int			ref_count;
+	struct completion		reset_complete;
+	struct completion		stop_complete;
+	/* encoder hardware lock */
+	spinlock_t			hw_lock;
+	struct jenc_context		*actx;
+
+	u32				pending_irq_status;
+
+	void (*enc_hw_irq_cb)
+		(void *data, enum vb2_buffer_state ev, size_t out_size);
+};
+
+int qcom_jpeg_clk_retune(struct qcom_jenc_dev *jenc, unsigned long *freq);
+
+struct jenc_context {
+	struct device		 *dev;
+	struct qcom_jenc_dev	 *jenc;
+	struct v4l2_fh		 fh;
+
+	/* quality update lock */
+	struct mutex		 quality_mutex;
+	struct v4l2_ctrl	 *quality_ctl;
+	u32			 quality_requested;
+	u32			 quality_programmed;
+	struct v4l2_ctrl_handler ctrl_hdl;
+
+	/* session context lock */
+	struct mutex		 ctx_lock;
+
+	bool			 hw_acquired;
+
+	struct qcom_jenc_queue	bufq[JENC_QUEUE_MAX];
+	struct qcom_jenc_header	hdr_cache;
+
+	struct work_struct finish_work;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c
new file mode 100644
index 0000000000000..9e1933957d101
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c
@@ -0,0 +1,1541 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/math64.h>
+#include <linux/pm_runtime.h>
+#include <linux/scatterlist.h>
+#include <linux/string.h>
+
+#include <media/jpeg.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-jpeg.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_v420.h"
+#include "qcom_jenc_v420_hw_info.h"
+
+/* JPEG quality constants */
+#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
+
+/* Per-plane register offset lookup arrays (indexed by plane number 0..2) */
+static const u32 jpeg_v420_fe_pntr[] = {
+	JPEG_V420_REG_FE_PNTR_0,
+	JPEG_V420_REG_FE_PNTR_1,
+	JPEG_V420_REG_FE_PNTR_2,
+};
+
+static const u32 jpeg_v420_fe_offs[] = {
+	JPEG_V420_REG_FE_OFFS_0,
+	JPEG_V420_REG_FE_OFFS_1,
+	JPEG_V420_REG_FE_OFFS_2,
+};
+
+static const u32 jpeg_v420_fe_bsize[] = {
+	JPEG_V420_REG_FE_BSIZE_0,
+	JPEG_V420_REG_FE_BSIZE_1,
+	JPEG_V420_REG_FE_BSIZE_2,
+};
+
+static const u32 jpeg_v420_fe_stride[] = {
+	JPEG_V420_REG_FE_STRIDE_0,
+	JPEG_V420_REG_FE_STRIDE_1,
+	JPEG_V420_REG_FE_STRIDE_2,
+};
+
+static const u32 jpeg_v420_fe_hinit[] = {
+	JPEG_V420_REG_FE_HINIT_0,
+	JPEG_V420_REG_FE_HINIT_1,
+	JPEG_V420_REG_FE_HINIT_2,
+};
+
+static const u32 jpeg_v420_fe_vinit[] = {
+	JPEG_V420_REG_FE_VINIT_0,
+	JPEG_V420_REG_FE_VINIT_1,
+	JPEG_V420_REG_FE_VINIT_2,
+};
+
+static const u32 jpeg_v420_we_pntr[] = {
+	JPEG_V420_REG_WE_PNTR_0,
+	JPEG_V420_REG_WE_PNTR_1,
+	JPEG_V420_REG_WE_PNTR_2,
+};
+
+static const u32 jpeg_v420_we_stride[] = {
+	JPEG_V420_REG_WE_STRIDE_0,
+	JPEG_V420_REG_WE_STRIDE_1,
+	JPEG_V420_REG_WE_STRIDE_2,
+};
+
+static const u32 jpeg_v420_we_hinit[] = {
+	JPEG_V420_REG_WE_HINIT_0,
+	JPEG_V420_REG_WE_HINIT_1,
+	JPEG_V420_REG_WE_HINIT_2,
+};
+
+static const u32 jpeg_v420_we_hstep[] = {
+	JPEG_V420_REG_WE_HSTEP_0,
+	JPEG_V420_REG_WE_HSTEP_1,
+	JPEG_V420_REG_WE_HSTEP_2,
+};
+
+static const u32 jpeg_v420_we_vinit[] = {
+	JPEG_V420_REG_WE_VINIT_0,
+	JPEG_V420_REG_WE_VINIT_1,
+	JPEG_V420_REG_WE_VINIT_2,
+};
+
+static const u32 jpeg_v420_we_vstep[] = {
+	JPEG_V420_REG_WE_VSTEP_0,
+	JPEG_V420_REG_WE_VSTEP_1,
+	JPEG_V420_REG_WE_VSTEP_2,
+};
+
+static const u32 jpeg_v420_scale_hstep[] = {
+	JPEG_V420_REG_SCALE_HSTEP_0,
+	JPEG_V420_REG_SCALE_HSTEP_1,
+	JPEG_V420_REG_SCALE_HSTEP_2,
+};
+
+static const u32 jpeg_v420_scale_vstep[] = {
+	JPEG_V420_REG_SCALE_VSTEP_0,
+	JPEG_V420_REG_SCALE_VSTEP_1,
+	JPEG_V420_REG_SCALE_VSTEP_2,
+};
+
+static const u32 jpeg_v420_scale_out_cfg[] = {
+	JPEG_V420_REG_SCALE_OUT_CFG_0,
+	JPEG_V420_REG_SCALE_OUT_CFG_1,
+	JPEG_V420_REG_SCALE_OUT_CFG_2,
+};
+
+#define JPEG_RESET_TIMEOUT_MS	300
+#define JPEG_STOP_TIMEOUT_MS	200
+
+#define JPEG_DQT_SHIFT		20
+
+#define JPEG_MCU_BLOCK_8	8
+#define JPEG_MCU_BLOCK_16	16
+
+#define JPEG_DEFAULT_SCALE_STEP	0x200000
+
+/* The core encodes 430 Mpixel/s at 600 MHz; the clock is scaled for 60 fps */
+#define JPEG_REF_CLK_HZ			600000000UL
+#define JPEG_REF_THROUGHPUT_MPPS	430UL
+#define JPEG_REF_FPS			60UL
+
+enum qcom_jpeg_encode_fmt {
+	JPEG_ENCODE_H1V1 = 0,
+	JPEG_ENCODE_H1V2,
+	JPEG_ENCODE_H2V1,
+	JPEG_ENCODE_H2V2,
+	JPEG_ENCODE_MONO,
+};
+
+enum qcom_jpeg_memory_fmt {
+	JPEG_MEM_FMT_PLANAR	 = 0x0,
+	JPEG_MEM_FMT_PPLANAR	 = 0x1,
+	JPEG_MEM_FMT_MONO	 = 0x2,
+	JPEG_MEM_FMT_COEFFICIENT = 0x3
+};
+
+enum jpeg_mal_bounds {
+	JPEG_CFG_MAL_BOUND_32_BYTES	= 0x0,
+	JPEG_CFG_MAL_BOUND_64_BYTES	= 0x1,
+	JPEG_CFG_MAL_BOUND_128_BYTES	= 0x2,
+	JPEG_CFG_MAL_BOUND_256_BYTES	= 0x3,
+	JPEG_CFG_MAL_BOUND_512_BYTES	= 0x4,
+	JPEG_CFG_MAL_BOUND_1K_BYTES	= 0x5,
+	JPEG_CFG_MAL_BOUND_2K_BYTES	= 0x6,
+	JPEG_CFG_MAL_BOUND_4K_BYTES	= 0x7
+};
+
+struct qcom_jpeg_scale_blocks {
+	u8 w_block[QCOM_JPEG_MAX_PLANES];
+	u8 h_block[QCOM_JPEG_MAX_PLANES];
+};
+
+struct qcom_jpeg_mal_boundary {
+	u32 bytes;
+	int boundary;
+};
+
+struct qcom_jpeg_formats {
+	enum qcom_jpeg_encode_fmt encode;
+	enum qcom_jpeg_memory_fmt memory;
+	u32 fourcc;
+};
+
+static const struct qcom_jpeg_formats jpeg_encode_fmt[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.encode = JPEG_ENCODE_MONO,
+		.memory = JPEG_MEM_FMT_MONO
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.encode = JPEG_ENCODE_H1V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.encode = JPEG_ENCODE_H2V2,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.encode = JPEG_ENCODE_H2V2,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	}
+};
+
+static const struct qcom_jpeg_mal_boundary jpeg_mal_bounds[] = {
+	{ .bytes =   32, .boundary = JPEG_CFG_MAL_BOUND_32_BYTES  },
+	{ .bytes =   64, .boundary = JPEG_CFG_MAL_BOUND_64_BYTES  },
+	{ .bytes =  128, .boundary = JPEG_CFG_MAL_BOUND_128_BYTES },
+	{ .bytes =  256, .boundary = JPEG_CFG_MAL_BOUND_256_BYTES },
+	{ .bytes =  512, .boundary = JPEG_CFG_MAL_BOUND_512_BYTES },
+	{ .bytes = 1024, .boundary = JPEG_CFG_MAL_BOUND_1K_BYTES  },
+	{ .bytes = 2048, .boundary = JPEG_CFG_MAL_BOUND_2K_BYTES  },
+	{ .bytes = 4096, .boundary = JPEG_CFG_MAL_BOUND_4K_BYTES  }
+};
+
+static const struct qcom_jpeg_scale_blocks jpeg_mcu_blocks[] = {
+	[JPEG_ENCODE_H1V1] = {
+		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_H1V2] = {
+		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
+		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_H2V1] = {
+		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
+	},
+	[JPEG_ENCODE_H2V2] = {
+		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_MONO] = {
+		.w_block = { JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8 }
+	},
+};
+
+static inline int jpeg_get_memory_fmt(u32 fourcc)
+{
+	u32 fi;
+
+	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
+		if (jpeg_encode_fmt[fi].fourcc == fourcc)
+			return jpeg_encode_fmt[fi].memory;
+	}
+
+	return -EINVAL;
+}
+
+static inline int jpeg_get_encode_fmt(u32 fourcc)
+{
+	u32 fi;
+
+	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
+		if (jpeg_encode_fmt[fi].fourcc == fourcc)
+			return jpeg_encode_fmt[fi].encode;
+	}
+
+	return -EINVAL;
+}
+
+static inline int jpeg_get_mal_boundary(u32 width, const struct qcom_jpeg_mal_boundary *table,
+					u32 count)
+{
+	u32 bi;
+
+	for (bi = 0; bi < count; bi++) {
+		if (table[bi].bytes > width)
+			break;
+	}
+
+	if (!bi)
+		return table[0].boundary;
+
+	if (bi >= count)
+		return table[count - 1].boundary;
+
+	return table[bi - 1].boundary;
+}
+
+static inline int jpeg_get_mcu_geometry(enum qcom_jpeg_encode_fmt fmt, u32 width, u32 height,
+					u32 *blk_w, u32 *blk_h, u32 *mcu_cols, u32 *mcu_rows)
+{
+	const struct qcom_jpeg_scale_blocks *blks;
+	u32 bw = 0, bh = 0;
+	u8 pln;
+
+	blks = &jpeg_mcu_blocks[fmt];
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		bw = max(bw, blks->w_block[pln]);
+		bh = max(bh, blks->h_block[pln]);
+	}
+
+	if (!bw || !bh)
+		return -EINVAL;
+
+	if (blk_w)
+		*blk_w = bw;
+	if (blk_h)
+		*blk_h = bh;
+
+	if (mcu_cols)
+		*mcu_cols = ALIGN(width, bw) / bw;
+
+	if (mcu_rows)
+		*mcu_rows = ALIGN(height, bh) / bh;
+
+	return 0;
+}
+
+static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
+{
+	return readl(jenc->jpeg_base + offset);
+}
+
+static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
+{
+	writel(value, jenc->jpeg_base + offset);
+}
+
+static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask)
+{
+	u32 reg = jpeg_io_read(jenc, offs);
+
+	return field_get(mask, reg);
+}
+
+/*
+ * Read-modify-write (for R/W registers)
+ */
+static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
+{
+	u32 reg = jpeg_io_read(jenc, offs);
+
+	reg &= ~mask;
+	reg |= field_prep(mask, val);
+
+	jpeg_io_write(jenc, offs, reg);
+}
+
+static u8 jpeg_calculate_dqt(struct jenc_context *ectx, u8 dqt_value)
+{
+	u64 calc_val;
+	u64 ratio;
+
+	ratio = (QCOM_JPEG_QUALITY_MAX - ectx->quality_requested) << JPEG_DQT_SHIFT;
+	ratio = max_t(u64, 1, ratio);
+	do_div(ratio, QCOM_JPEG_QUALITY_MID);
+
+	calc_val = DIV64_U64_ROUND_CLOSEST(ratio * dqt_value, 1LU << JPEG_DQT_SHIFT);
+
+	return clamp_t(u64, calc_val, 1, U8_MAX);
+}
+
+/*
+ * jpeg_update_dqt_cache - compute scaled DQT coefficients and store them in
+ * the software JPEG header cache (hdr_cache).  Safe to call before the
+ * hardware is powered on; no MMIO access is performed here. The DQT segment
+ * lists coefficients in zigzag order, so each zigzag position is mapped back
+ * to the natural position of the reference table.
+ */
+static void jpeg_update_dqt_cache(struct jenc_context *ectx)
+{
+	u8 *base;
+	u8 dqt_val, nat;
+	int zz;
+
+	/* Luma DQT cache update */
+	if (ectx->hdr_cache.layout.dqt_offset[0]) {
+		base = &ectx->hdr_cache.data[ectx->hdr_cache.layout.dqt_offset[0]];
+		for (zz = 0; zz < V4L2_JPEG_PIXELS_IN_BLOCK; zz++) {
+			nat = v4l2_jpeg_zigzag_scan_index[zz];
+			dqt_val = jpeg_calculate_dqt(ectx, v4l2_jpeg_ref_table_luma_qt[nat]);
+			base[zz] = dqt_val;
+		}
+	}
+
+	/* Chroma DQT cache update */
+	if (ectx->hdr_cache.layout.dqt_offset[1]) {
+		base = &ectx->hdr_cache.data[ectx->hdr_cache.layout.dqt_offset[1]];
+		for (zz = 0; zz < V4L2_JPEG_PIXELS_IN_BLOCK; zz++) {
+			nat = v4l2_jpeg_zigzag_scan_index[zz];
+			dqt_val = jpeg_calculate_dqt(ectx, v4l2_jpeg_ref_table_chroma_qt[nat]);
+			base[zz] = dqt_val;
+		}
+	}
+}
+
+/*
+ * jpeg_dqt_to_natural - reorder one DQT table from the zigzag order of the
+ * JPEG header to the natural (raster) order taken by the hardware DMI.
+ */
+static void jpeg_dqt_to_natural(const u8 *zz_qt, u8 *nat_qt)
+{
+	int zz;
+
+	for (zz = 0; zz < V4L2_JPEG_PIXELS_IN_BLOCK; zz++)
+		nat_qt[v4l2_jpeg_zigzag_scan_index[zz]] = zz_qt[zz];
+}
+
+/*
+ * jpeg_upload_dmi_table - write the scaled DQT coefficients to the hardware
+ * DMI registers.  Must only be called from the job execution path where
+ * runtime PM has already been acquired (pm_runtime_resume_and_get).
+ *
+ * Reads precomputed values from hdr_cache (populated by jpeg_update_dqt_cache)
+ * to avoid redundant per-coefficient recalculation on the hot encode path.
+ * The hardware takes them in natural order, as 65536 / q reciprocals.
+ */
+static void jpeg_upload_dmi_table(struct jenc_context *ectx)
+{
+	const u8 *luma_qt = &ectx->hdr_cache.data[ectx->hdr_cache.layout.dqt_offset[0]];
+	u8 nat_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
+	u32 pcfg = JPEG_DMI_ENABLE_UPLOAD;
+	u32 addr = 0x00000000;
+	u32 reg_val;
+	int i;
+
+	/* DMI upload start sequence */
+	jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_ADDR, addr);
+	jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_CFG, pcfg);
+
+	/* DMI Luma upload - values are stored in zigzag order in hdr_cache */
+	jpeg_dqt_to_natural(luma_qt, nat_qt);
+	for (i = 0; i < V4L2_JPEG_PIXELS_IN_BLOCK; i++) {
+		reg_val = div_u64(U16_MAX + 1U, nat_qt[i]);
+		reg_val = clamp_t(u32, reg_val, 0, U16_MAX);
+		jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_DATA, reg_val);
+	}
+
+	/* DMI Chroma upload - only present for color formats */
+	if (ectx->hdr_cache.layout.dqt_offset[1]) {
+		const u8 *chroma_qt = &ectx->hdr_cache.data[ectx->hdr_cache.layout.dqt_offset[1]];
+
+		jpeg_dqt_to_natural(chroma_qt, nat_qt);
+		for (i = 0; i < V4L2_JPEG_PIXELS_IN_BLOCK; i++) {
+			reg_val = div_u64(U16_MAX + 1U, nat_qt[i]);
+			reg_val = clamp_t(u32, reg_val, 0, U16_MAX);
+			jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_DATA, reg_val);
+		}
+	}
+
+	/* DMI upload end sequence */
+	jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_CFG, addr);
+
+	ectx->quality_programmed = ectx->quality_requested;
+
+	dev_dbg(ectx->dev, "quality_programmed=%d\n", ectx->quality_programmed);
+}
+
+static void jpeg_sync_sg(struct device *dev,
+			 struct qcom_jpeg_buff *frame,
+			 enum dma_data_direction direction, bool for_device)
+{
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		struct sg_table *sgt = frame->plns[pln].sgt;
+
+		if (!frame->plns[pln].dma || !sgt)
+			break;
+
+		if (for_device)
+			dma_sync_sgtable_for_device(dev, sgt, direction);
+		else
+			dma_sync_sgtable_for_cpu(dev, sgt, direction);
+	}
+}
+
+/*
+ * Only an explicit CLEAR_RD/WR_PLNS_QUEUE command drains the FE/WE hardware
+ * pointer queues; a core reset or HW_STOP does not.
+ */
+static void jpeg_clear_planes_queues(struct qcom_jenc_dev *jenc)
+{
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_RD_PLNS_QUEUE_MSK);
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, 0);
+
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_WR_PLNS_QUEUE_MSK);
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, 0);
+}
+
+static int jpeg_init(struct qcom_jenc_dev *jenc)
+{
+	unsigned long rtime;
+	u32 hw_ver;
+
+	if (WARN_ON_ONCE(!jenc || !jenc->dev || !jenc->jpeg_base))
+		return -EINVAL;
+
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS);
+
+	reinit_completion(&jenc->reset_complete);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_RESET_ACK, 1);
+
+	jpeg_io_write(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_ALL_BITS);
+
+	rtime = wait_for_completion_timeout(&jenc->reset_complete,
+					    msecs_to_jiffies(JPEG_RESET_TIMEOUT_MS));
+	if (!rtime) {
+		dev_err(jenc->dev, "encoder HW reset timeout\n");
+		return -ETIME;
+	}
+
+	hw_ver = jpeg_io_read(jenc, JPEG_V420_REG_HW_VERSION);
+	dev_dbg(jenc->dev, "JPEG HW encoder version %lu.%lu.%lu\n",
+		FIELD_GET(JPEG_V420_HW_VER_MAJOR_MSK, hw_ver),
+		FIELD_GET(JPEG_V420_HW_VER_MINOR_MSK, hw_ver),
+		FIELD_GET(JPEG_V420_HW_VER_STEP_MSK, hw_ver));
+
+	jpeg_clear_planes_queues(jenc);
+
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS);
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_ALL_BITS);
+
+	return 0;
+}
+
+static void jpeg_exec(struct qcom_jenc_dev *jenc)
+{
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, FIELD_PREP(JPEG_V420_CMD_HW_START, 1));
+}
+
+static void jpeg_stop(struct qcom_jenc_dev *jenc)
+{
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, FIELD_PREP(JPEG_V420_CMD_HW_START, 0));
+
+	jpeg_clear_planes_queues(jenc);
+}
+
+static int jpeg_deinit(struct qcom_jenc_dev *jenc)
+{
+	unsigned long rtime;
+
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS);
+
+	reinit_completion(&jenc->stop_complete);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_STOP_ACK, 1);
+
+	jpeg_io_write(jenc, JPEG_V420_REG_HW_CMD, FIELD_PREP(JPEG_V420_CMD_HW_STOP, 1));
+
+	rtime = wait_for_completion_timeout(&jenc->stop_complete,
+					    msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_MASK, 0);
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS);
+
+	if (!rtime) {
+		dev_err(jenc->dev, "encoder HW stop timeout\n");
+		return -ETIME;
+	}
+
+	/*
+	 * Only after STOP_ACK: drop the addresses an aborted job left in the
+	 * FE/WE queues. A completed job clears them in jpeg_stop().
+	 */
+	jpeg_clear_planes_queues(jenc);
+
+	return 0;
+}
+
+static void jpeg_apply_fe_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
+			       struct vb2_buffer *vb)
+{
+	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
+	struct v4l2_pix_format_mplane *fmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < fmt->num_planes; pln++) {
+		if (!frame->plns[pln].sgt || !frame->plns[pln].sgt->sgl)
+			break;
+
+		jpeg_io_write(jenc, jpeg_v420_fe_pntr[pln], frame->plns[pln].dma);
+		jpeg_io_write(jenc, jpeg_v420_fe_offs[pln], 0);
+
+		dev_dbg(jenc->dev, "FE pln=%d addr=%pad idx:%d\n",
+			pln, &frame->plns[pln].dma, vb->index);
+	}
+}
+
+static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
+	struct qcom_jpeg_buff *buff = &q->buff[vb2->index];
+	u8 pln;
+
+	for (pln = 0; pln < q->vf.num_planes; pln++) {
+		buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
+		if (!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl)
+			return -EINVAL;
+
+		buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
+		if (!buff->plns[pln].dma)
+			return -EINVAL;
+
+		buff->plns[pln].size = vb2_plane_size(vb2, pln);
+		if (!buff->plns[pln].size)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void jpeg_setup_fe_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln],
+			     JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln],
+			     JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_stride[pln], JPEG_V420_PLN_RD_STRIDE_MSK, 0);
+	}
+
+	for (pln = 0; pln < sfmt->num_planes; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln], JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK,
+			     sfmt->width - 1);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln], JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
+			     sfmt->height - 1);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_stride[pln], JPEG_V420_PLN_RD_STRIDE_MSK,
+			     sfmt->plane_fmt[pln].bytesperline);
+
+		dev_dbg(ectx->dev, "FE pln=%d width=%d height=%d stride=%d\n",
+			pln,
+			jpeg_rd_bits(jenc, jpeg_v420_fe_bsize[pln],
+				     JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK),
+			jpeg_rd_bits(jenc, jpeg_v420_fe_bsize[pln],
+				     JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK),
+			jpeg_rd_bits(jenc, jpeg_v420_fe_stride[pln],
+				     JPEG_V420_PLN_RD_STRIDE_MSK));
+	}
+}
+
+static void jpeg_setup_fe_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_io_write(jenc, jpeg_v420_fe_hinit[pln], 0);
+}
+
+static void jpeg_setup_fe_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_io_write(jenc, jpeg_v420_fe_vinit[pln], 0);
+}
+
+static int jpeg_setup_fe_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 expected_planes, pln;
+	int rval;
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MAL_EN, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_BOTTOM_VPAD_EN, 1);
+
+	rval = jpeg_get_memory_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid memory format for v4l2 format: %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	switch (rval) {
+	case JPEG_MEM_FMT_MONO:
+		expected_planes = 1;
+		break;
+	case JPEG_MEM_FMT_PPLANAR:
+		expected_planes = 2;
+		break;
+	case JPEG_MEM_FMT_PLANAR:
+		expected_planes = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sfmt->num_planes != expected_planes) {
+		dev_err(ectx->dev, "plane mismatch fmt=%u expected=%u got=%u\n",
+			rval, expected_planes, sfmt->num_planes);
+		return -EINVAL;
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK, rval);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_PLNS_EN_MSK, 0);
+
+	/* Scaling is not supported; always configure for 1:1 */
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_SIXTEEN_MCU_EN, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MCUS_PER_BLOCK, 0);
+
+	dev_dbg(ectx->dev, "sixteen MCU enabled=%d, %d MCU per blocks\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_SIXTEEN_MCU_EN),
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MCUS_PER_BLOCK));
+
+	rval = jpeg_get_mal_boundary(sfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
+	if (rval < 0) {
+		dev_err(ectx->dev, "failed to get FE mal boundary width=%u\n",
+			sfmt->width);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MAL_BOUNDARY, rval);
+
+	dev_dbg(ectx->dev, "optimal FE mal boundary=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MAL_BOUNDARY));
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	switch (rval) {
+	case JPEG_ENCODE_MONO:
+	case JPEG_ENCODE_H1V1:
+	case JPEG_ENCODE_H2V1:
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_VBPAD_CFG, JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_8));
+		break;
+	case JPEG_ENCODE_H1V2:
+	case JPEG_ENCODE_H2V2:
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_VBPAD_CFG, JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_16));
+		break;
+	default:
+		dev_err(ectx->dev, "unsupported encode format: %d\n", rval);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "FE vpad config=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_VBPAD_CFG,
+			     JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK));
+
+	if (sfmt->pixelformat == V4L2_PIX_FMT_NV21M)
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_CBCR_ORDER, 1);
+	else
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_CBCR_ORDER, 0);
+
+	for (pln = 0; pln < sfmt->num_planes; pln++) {
+		if (sfmt->width && sfmt->height) {
+			switch (pln) {
+			case 0:
+				jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG,
+					     JPEG_V420_FE_CFG_PLN0_EN, 1);
+				break;
+			case 1:
+				jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG,
+					     JPEG_V420_FE_CFG_PLN1_EN, 1);
+				break;
+			case 2:
+				jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG,
+					     JPEG_V420_FE_CFG_PLN2_EN, 1);
+				break;
+			}
+		}
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_FE_ENABLE, 1);
+
+	return 0;
+}
+
+static int jpeg_setup_fe(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	int rc;
+
+	jpeg_setup_fe_size(ectx, q);
+	jpeg_setup_fe_hinit(ectx, q);
+	jpeg_setup_fe_vinit(ectx, q);
+
+	rc = jpeg_setup_fe_params(ectx, q);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/*
+ * jpeg_header_init - build the JPEG header for a source format: one component
+ * for GREY, otherwise YCbCr with 2x2 luma sampling.
+ */
+static int jpeg_header_init(struct qcom_jenc_header *hdr, u32 fourcc)
+{
+	bool mono = fourcc == V4L2_PIX_FMT_GREY;
+	struct v4l2_jpeg_hdr_params params = {
+		.num_components = mono ? JPEG_COMP_MONO : JPEG_COMP_COLOR,
+		.luma_sampling = mono ? JPEG_SAMPLING_H1V1 : JPEG_SAMPLING_H2V2,
+		.jfif = true,
+	};
+
+	return v4l2_jpeg_write_header(hdr->data, sizeof(hdr->data), &params, &hdr->layout);
+}
+
+static int jpeg_ensure_header_cache(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	int rc;
+
+	if (ectx->hdr_cache.layout.size)
+		return 0;
+
+	rc = jpeg_header_init(&ectx->hdr_cache, sq->vf.pixelformat);
+	if (rc) {
+		dev_err(ectx->dev, "JFIF header lazy init failed\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
+			      struct vb2_buffer *vb)
+{
+	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	void *mptr = vb2_plane_vaddr(vb, 0);
+	dma_addr_t dma = frame->plns[0].dma;
+	size_t header_size;
+	u8 pln = 0;
+	int rc;
+
+	if (WARN_ON_ONCE(!dma))
+		return -EPERM;
+
+	if (WARN_ON_ONCE(!mptr))
+		return -EPERM;
+
+	rc = jpeg_ensure_header_cache(ectx);
+	if (rc)
+		return rc;
+
+	/* Update DQT cache if quality changed, then upload to HW DMI. */
+	mutex_lock(&ectx->quality_mutex);
+	if (!ectx->hdr_cache.layout.size || ectx->quality_programmed != ectx->quality_requested)
+		jpeg_update_dqt_cache(ectx);
+	jpeg_upload_dmi_table(ectx);
+	mutex_unlock(&ectx->quality_mutex);
+
+	header_size = ectx->hdr_cache.layout.size;
+	if (vb->planes[0].length < header_size)
+		return -EINVAL;
+
+	memcpy(mptr, ectx->hdr_cache.data, header_size);
+	v4l2_jpeg_hdr_set_size(mptr, &ectx->hdr_cache.layout, q->vf.width, q->vf.height);
+
+	dma += header_size;
+
+	/*
+	 * Flush CPU writes to the header before handing the buffer to the
+	 * hardware DMA engine.
+	 */
+	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);
+
+	jpeg_io_write(jenc, jpeg_v420_we_pntr[pln], dma);
+
+	dev_dbg(jenc->dev, "WE pln=%d addr=%pad idx:%d\n",
+		pln, &dma, vb->index);
+
+	q->buff_id = vb->index;
+
+	return 0;
+}
+
+static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
+	struct qcom_jpeg_buff *frame = &q->buff[vb2->index];
+	struct sg_table *sgt;
+	dma_addr_t dma;
+
+	sgt = vb2_dma_sg_plane_desc(vb2, 0);
+	if (!sgt || !sgt->sgl)
+		return -EINVAL;
+
+	dma = sg_dma_address(sgt->sgl);
+	if (!dma)
+		return -EINVAL;
+
+	if (!vb2_plane_vaddr(vb2, 0))
+		return -EINVAL;
+
+	frame->plns[0].sgt = sgt;
+	frame->plns[0].dma = dma;
+	frame->plns[0].size = vb2_plane_size(vb2, 0);
+
+	return 0;
+}
+
+static void jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_rw_bits(jenc, jpeg_v420_we_stride[pln], JPEG_V420_PLN_WR_STRIDE_MSK, 0);
+
+	jpeg_io_write(jenc, JPEG_V420_REG_WE_BSIZE_0, dfmt->plane_fmt[0].sizeimage);
+
+	dev_dbg(ectx->dev, "WE size=%u\n", dfmt->plane_fmt[0].sizeimage);
+}
+
+static int jpeg_setup_we_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	if (!dfmt->width) {
+		dev_err(ectx->dev, "invalid destination width=%d\n", dfmt->width);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_we_hinit[pln], JPEG_V420_PLN_WR_HINIT_INTEGER_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_we_hstep[pln], JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK, 0);
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_HSTEP_0,
+		     JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK, dfmt->width);
+
+	dev_dbg(ectx->dev, "WE hstep=%u\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_WE_HSTEP_0, JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK));
+
+	return 0;
+}
+
+static int jpeg_setup_we_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	if (!dfmt->height) {
+		dev_err(ectx->dev, "invalid destination height=%d\n", dfmt->height);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_we_vinit[pln], JPEG_V420_PLN_WR_VINIT_INTEGER_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_we_vstep[pln], JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK, 0);
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_VSTEP_0,
+		     JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK, dfmt->height);
+
+	dev_dbg(ectx->dev, "WE vstep=%u\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_WE_VSTEP_0, JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK));
+
+	return 0;
+}
+
+static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
+	int rval;
+
+	rval = jpeg_get_memory_fmt(dfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid memory format for v4l2 format: %p4cc\n",
+			&dfmt->pixelformat);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK, rval);
+
+	rval = jpeg_get_mal_boundary(dfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
+	if (rval < 0) {
+		dev_err(ectx->dev, "failed to get WE mal boundary width=%u\n",
+			dfmt->width);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MAL_BOUNDARY, rval);
+
+	dev_dbg(ectx->dev, "optimal WE mal boundary=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MAL_BOUNDARY));
+
+	rval = jpeg_get_encode_fmt(dfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&dfmt->pixelformat);
+		return rval;
+	}
+
+	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
+			mcu_cols, mcu_rows);
+		return rval;
+	}
+
+	dev_dbg(ectx->dev, "WE blk_w=%u blk_h=%u cols=%u rows=%u\n",
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_BLOCKS_0,
+		     JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK, mcu_rows - 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_BLOCKS_0,
+		     JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK, mcu_cols - 1);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_CBCR_ORDER, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MAL_EN, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_POP_BUFF_ON_EOS, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_PLN0_EN, 1);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_MODE, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_WE_ENABLE, 1);
+
+	return 0;
+}
+
+static int jpeg_setup_we(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	int rc;
+
+	jpeg_setup_we_size(ectx, q);
+
+	rc = jpeg_setup_we_hinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_we_vinit(ectx, q);
+	if (rc)
+		return rc;
+
+	return jpeg_setup_we_params(ectx, q);
+}
+
+static int jpeg_setup_scale(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
+	struct v4l2_pix_format_mplane *dfmt = &dq->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
+	int rval;
+	u8 pln;
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_SCALE_RESET, 1);
+
+	/* explicit no scaling */
+	jpeg_rw_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_HSCALE_ENABLE, 0);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_VSCALE_ENABLE, 0);
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_io_write(jenc, jpeg_v420_scale_hstep[pln], JPEG_DEFAULT_SCALE_STEP);
+		jpeg_io_write(jenc, jpeg_v420_scale_vstep[pln], JPEG_DEFAULT_SCALE_STEP);
+	}
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid MCU geometry blk_w=%d blk_h=%d\n",
+			blk_w, blk_h);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "scale blk_w=%u blk_h=%u cols=%u rows=%u\n",
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	for (pln = 0; pln < sq->vf.num_planes; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_scale_out_cfg[pln],
+			     JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK, blk_w - 1);
+		jpeg_rw_bits(jenc, jpeg_v420_scale_out_cfg[pln],
+			     JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK, blk_h - 1);
+	}
+
+	dev_dbg(ectx->dev, "scale src=%ux%u dst=%ux%u enable=%d/%d\n",
+		sfmt->width, sfmt->height, dfmt->width, dfmt->height,
+		jpeg_rd_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_HSCALE_ENABLE),
+		jpeg_rd_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_VSCALE_ENABLE));
+
+	/* Disabled, but must be configured */
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_SCALE_ENABLE, 0);
+
+	return 0;
+}
+
+static int jpeg_setup_encode(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
+	int rval;
+
+	if (!sfmt->width || !sfmt->height)
+		return -EINVAL;
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_ENCODER_RESET, 1);
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_CFG, JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK, rval);
+
+	rval = jpeg_get_mcu_geometry(rval, sfmt->width, sfmt->height, &blk_w, &blk_h,
+				     NULL, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid MCU geometry mcu_rows=%d\n", mcu_rows);
+		return -EINVAL;
+	}
+
+	mcu_cols = sfmt->width / blk_w;
+
+	dev_dbg(ectx->dev, "encode blk_w=%u blk_h=%u cols=%u rows=%u\n",
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+		     JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK, mcu_cols - 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+		     JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK, mcu_rows - 1);
+
+	dev_dbg(ectx->dev, "encode width=%d height=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+			     JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK),
+		jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+			     JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK));
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_CFG, JPEG_V420_ENC_CFG_APPLY_EOI, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_ENC_ENABLE, 1);
+
+	return 0;
+}
+
+irqreturn_t qcom_jenc_v420_irq_bot(int irq, void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+	unsigned long flags;
+	u32 irq_status;
+
+	irq_status = READ_ONCE(jenc->pending_irq_status);
+
+	if (FIELD_GET(JPEG_V420_IRQ_STATUS_SESSION_DONE, irq_status)) {
+		struct jenc_context *ctx;
+
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		ctx = jenc->actx;
+		jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >= 0) {
+			struct qcom_jenc_queue *dq = &ctx->bufq[JENC_DST_QUEUE];
+			struct qcom_jpeg_buff *frame = &dq->buff[dq->buff_id];
+			size_t out_size = jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_OUT_SIZE,
+						       JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK);
+
+			dev_dbg(jenc->dev, "complete idx:%d addr=%pad size=%zu\n",
+				dq->buff_id, &frame->plns[0].dma, out_size);
+
+			/*
+			 * Stop the hardware before enc_hw_irq_cb(): it leads to
+			 * v4l2_m2m_job_finish(), which can start the next job's device_run().
+			 */
+			jpeg_stop(jenc);
+			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
+					    out_size + ctx->hdr_cache.layout.size);
+		} else {
+			jpeg_stop(jenc);
+		}
+	}
+
+	if (FIELD_GET(JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK, irq_status)) {
+		struct jenc_context *ctx;
+
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		ctx = jenc->actx;
+		jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		dev_err(jenc->dev, "encoder hardware failure=0x%lx\n",
+			FIELD_GET(JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK, irq_status));
+
+		jpeg_stop(jenc);
+		if (ctx)
+			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
+	}
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t qcom_jenc_v420_irq_top(int irq, void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+	unsigned long flags;
+	u32 irq_status;
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+
+	irq_status = jpeg_io_read(jenc, JPEG_V420_REG_INT_STATUS);
+	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, irq_status & JPEG_V420_IRQ_STATUS_ALL_BITS);
+
+	if (FIELD_GET(JPEG_V420_IRQ_STATUS_RESET_ACK, irq_status))
+		complete(&jenc->reset_complete);
+
+	if (FIELD_GET(JPEG_V420_IRQ_STATUS_STOP_ACK, irq_status)) {
+		complete(&jenc->stop_complete);
+		dev_dbg(jenc->dev, "hardware stop acknowledged\n");
+	}
+
+	/* The ACKs are handled above; wake the threaded handler only for the rest */
+	irq_status &= ~(JPEG_V420_IRQ_STATUS_RESET_ACK | JPEG_V420_IRQ_STATUS_STOP_ACK);
+	if (!irq_status) {
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	WRITE_ONCE(jenc->pending_irq_status, irq_status);
+
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return IRQ_WAKE_THREAD;
+}
+
+void qcom_jenc_v420_get_hw_caps(struct qcom_jenc_dev *jenc, u32 *caps)
+{
+	u32 hw_caps;
+
+	hw_caps = jpeg_io_read(jenc, JPEG_V420_REG_HW_CAPABILITY);
+	dev_dbg(jenc->dev, "CAPS: encode=%lu decode=%lu upscale=%lu downscale=%lu\n",
+		FIELD_GET(JPEG_V420_HW_CAP_ENCODE, hw_caps),
+		FIELD_GET(JPEG_V420_HW_CAP_DECODE, hw_caps),
+		FIELD_GET(JPEG_V420_HW_CAP_UPSCALE_MSK, hw_caps),
+		FIELD_GET(JPEG_V420_HW_CAP_DOWNSCALE_MSK, hw_caps));
+
+	*caps = hw_caps;
+}
+
+int qcom_jenc_v420_get_block_width(u32 fourcc, u32 *blk_w)
+{
+	int fmt = jpeg_get_encode_fmt(fourcc);
+
+	if (fmt < 0)
+		return fmt;
+
+	return jpeg_get_mcu_geometry(fmt, 0, 0, blk_w, NULL, NULL, NULL);
+}
+
+int qcom_jenc_v420_get_block_height(u32 fourcc, u32 *blk_h)
+{
+	int fmt = jpeg_get_encode_fmt(fourcc);
+
+	if (fmt < 0)
+		return fmt;
+
+	return jpeg_get_mcu_geometry(fmt, 0, 0, NULL, blk_h, NULL, NULL);
+}
+
+struct qcom_jenc_queue *qcom_jenc_v420_get_buff_queue(struct jenc_context *ectx,
+						      enum qcom_enc_qid id)
+{
+	return &ectx->bufq[id];
+}
+
+int qcom_jenc_v420_queue_setup(struct jenc_context *ectx, enum qcom_enc_qid id)
+{
+	struct qcom_jenc_queue *q = &ectx->bufq[id];
+	int rc;
+
+	/*
+	 * REQBUFS has freed the previous buffers: drop their cached sg_table
+	 * and DMA addresses.
+	 */
+	memset(q->buff, 0, sizeof(q->buff));
+
+	if (id == JENC_SRC_QUEUE) {
+		rc = jpeg_header_init(&ectx->hdr_cache, q->vf.pixelformat);
+		if (rc) {
+			dev_err(ectx->dev, "JFIF header init failed\n");
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+int qcom_jenc_v420_src_fmt_update(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc)
+{
+	bool old_is_mono = (old_fourcc == V4L2_PIX_FMT_GREY);
+	bool new_is_mono = (new_fourcc == V4L2_PIX_FMT_GREY);
+	int rc;
+
+	/* header layout changes only for mono <-> color source format switch */
+	if (old_is_mono == new_is_mono)
+		return 0;
+
+	rc = jpeg_header_init(&ectx->hdr_cache, new_fourcc);
+	if (rc) {
+		dev_err(ectx->dev, "JFIF header reinit failed\n");
+		return rc;
+	}
+
+	/* force DQT upload after source profile switch */
+	mutex_lock(&ectx->quality_mutex);
+	ectx->quality_programmed = 0;
+	mutex_unlock(&ectx->quality_mutex);
+
+	return 0;
+}
+
+int qcom_jenc_v420_buffer_prepare(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	int rc;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb2->type)) {
+		rc = jpeg_store_fe_next(ectx, vb2);
+		if (rc)
+			dev_err(ectx->dev, "cannot set up fetch engine address\n");
+	} else {
+		rc = jpeg_store_we_next(ectx, vb2);
+		if (rc)
+			dev_err(ectx->dev, "cannot set up write engine address\n");
+	}
+
+	return rc;
+}
+
+int qcom_jenc_v420_process_exec(struct qcom_jenc_dev *jenc, struct jenc_context *ectx,
+				struct vb2_buffer *vb)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	jenc->actx = ectx;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		rc = jpeg_setup_fe(ectx, sq);
+		if (rc)
+			goto err_clear_ctx;
+
+		jpeg_apply_fe_addr(ectx, sq, vb);
+	} else {
+		rc = jpeg_setup_we(ectx, dq);
+		if (rc)
+			goto err_clear_ctx;
+
+		rc = jpeg_apply_we_addr(ectx, dq, vb);
+		if (rc)
+			goto err_clear_ctx;
+	}
+
+	/* Both src and dst buffers queued for this frame - trigger encode. */
+	if (sq->sequence == dq->sequence) {
+		rc = jpeg_setup_scale(ectx);
+		if (rc)
+			goto err_clear_ctx;
+
+		rc = jpeg_setup_encode(ectx);
+		if (rc)
+			goto err_clear_ctx;
+
+		jpeg_exec(jenc);
+	}
+
+	return 0;
+
+err_clear_ctx:
+	/* HW_START was not issued: drop the addresses already queued for this job */
+	jpeg_stop(jenc);
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	if (jenc->actx == ectx)
+		jenc->actx = NULL;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return rc;
+}
+
+void qcom_jenc_v420_prepare(struct qcom_jenc_dev *jenc)
+{
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_ENCODER_RESET, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_CORE_RESET, 1);
+}
+
+static unsigned long jpeg_calc_optimal_clk(struct qcom_jenc_dev *jenc,
+					   u32 width, u32 height, u32 fps)
+{
+	unsigned long ref_pixel_rate;
+	unsigned long optimal_clk;
+	unsigned long pixel_rate;
+
+	if (!width || !height || !fps)
+		return jenc->max_freq;
+
+	ref_pixel_rate = JPEG_REF_THROUGHPUT_MPPS * 1000000UL;
+	pixel_rate = (unsigned long)width * height * fps;
+
+	optimal_clk = DIV_ROUND_UP_ULL((u64)pixel_rate * JPEG_REF_CLK_HZ, ref_pixel_rate);
+
+	return min_t(unsigned long, jenc->max_freq, optimal_clk);
+}
+
+int qcom_jenc_v420_retune_clk(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	unsigned long freq;
+	int rc;
+
+	freq = jpeg_calc_optimal_clk(jenc, sq->vf.width, sq->vf.height, JPEG_REF_FPS);
+
+	rc = qcom_jpeg_clk_retune(jenc, &freq);
+	if (rc)
+		return rc;
+
+	jenc->opt_freq = freq;
+
+	return 0;
+}
+
+int qcom_jenc_v420_acquire(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	int rc = 0;
+
+	/* reset per-context stream state for each (re)acquire */
+	sq->sequence = 0;
+	dq->sequence = 0;
+	dq->buff_id = -1;
+	/*
+	 * Recreate JPEG header lazily per destination buffer to tolerate
+	 * different valid V4L2 call orders (e.g. STREAMON before first QBUF).
+	 */
+	ectx->hdr_cache.layout.size = 0;
+	/* force DQT upload on first frame after (re)acquire */
+	mutex_lock(&ectx->quality_mutex);
+	ectx->quality_programmed = 0;
+	mutex_unlock(&ectx->quality_mutex);
+
+	mutex_lock(&jenc->hw_ref_lock);
+
+	if (!jenc->ref_count) {
+		jenc->opt_freq = jpeg_calc_optimal_clk(jenc, sq->vf.width, sq->vf.height,
+						       JPEG_REF_FPS);
+
+		dev_dbg(jenc->dev, "freq=%lu src=%ux%u\n", jenc->opt_freq,
+			sq->vf.width, sq->vf.height);
+
+		rc = pm_runtime_resume_and_get(jenc->dev);
+		if (rc < 0) {
+			dev_err(jenc->dev, "PM runtime get failed\n");
+			goto out_unlock;
+		}
+
+		enable_irq(jenc->irq);
+
+		rc = jpeg_init(jenc);
+		if (rc) {
+			dev_err(jenc->dev, "hardware init failed\n");
+			disable_irq(jenc->irq);
+			pm_runtime_put_sync(jenc->dev);
+			goto out_unlock;
+		}
+	}
+
+	jenc->ref_count++;
+
+out_unlock:
+	mutex_unlock(&jenc->hw_ref_lock);
+
+	return rc;
+}
+
+int qcom_jenc_v420_release(struct jenc_context *ectx)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	unsigned long flags;
+	int rc = 0;
+	int pm_rc;
+
+	mutex_lock(&jenc->hw_ref_lock);
+
+	if (WARN_ON_ONCE(!jenc->ref_count))
+		goto out_unlock;
+
+	jenc->ref_count--;
+	if (!jenc->ref_count) {
+		rc = jpeg_deinit(jenc);
+		if (rc)
+			dev_err(jenc->dev, "hardware exit failed\n");
+
+		/*
+		 * A job aborted by HW_STOP raises no SESSION_DONE: drop its
+		 * active context reference here.
+		 */
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		if (jenc->actx == ectx)
+			jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		disable_irq(jenc->irq);
+
+		pm_rc = pm_runtime_put_sync(jenc->dev);
+		if (pm_rc < 0) {
+			dev_err(jenc->dev, "PM runtime put failed\n");
+			if (!rc)
+				rc = pm_rc;
+		}
+
+		dev_dbg(jenc->dev, "JPEG HW encoder released\n");
+	}
+
+out_unlock:
+	mutex_unlock(&jenc->hw_ref_lock);
+
+	return rc;
+}
+
+int qcom_jenc_v420_resume(struct qcom_jenc_dev *jenc)
+{
+	int rc = 0;
+
+	mutex_lock(&jenc->hw_ref_lock);
+
+	if (jenc->ref_count)
+		rc = jpeg_init(jenc);
+
+	mutex_unlock(&jenc->hw_ref_lock);
+
+	return rc;
+}
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.h
new file mode 100644
index 0000000000000..17f304b19748b
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_V420_H
+#define QCOM_JENC_V420_H
+
+#include <linux/irqreturn.h>
+#include <linux/types.h>
+
+#include "qcom_jenc_dev.h"
+
+void qcom_jenc_v420_get_hw_caps(struct qcom_jenc_dev *jenc, u32 *caps);
+
+int qcom_jenc_v420_get_block_width(u32 fourcc, u32 *blk_w);
+
+int qcom_jenc_v420_get_block_height(u32 fourcc, u32 *blk_h);
+
+int qcom_jenc_v420_acquire(struct jenc_context *ectx);
+
+int qcom_jenc_v420_release(struct jenc_context *ectx);
+
+int qcom_jenc_v420_resume(struct qcom_jenc_dev *jenc);
+
+void qcom_jenc_v420_prepare(struct qcom_jenc_dev *jenc);
+
+struct qcom_jenc_queue *qcom_jenc_v420_get_buff_queue(struct jenc_context *ectx,
+						      enum qcom_enc_qid id);
+
+int qcom_jenc_v420_queue_setup(struct jenc_context *ectx, enum qcom_enc_qid id);
+
+int qcom_jenc_v420_src_fmt_update(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
+
+int qcom_jenc_v420_retune_clk(struct jenc_context *ectx);
+
+int qcom_jenc_v420_buffer_prepare(struct jenc_context *ectx, struct vb2_buffer *vb2);
+
+int qcom_jenc_v420_process_exec(struct qcom_jenc_dev *jenc, struct jenc_context *ectx,
+				struct vb2_buffer *vb);
+
+irqreturn_t qcom_jenc_v420_irq_top(int irq_num, void *data);
+irqreturn_t qcom_jenc_v420_irq_bot(int irq_num, void *data);
+
+#endif /* QCOM_JENC_V420_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
new file mode 100644
index 0000000000000..d39fbae3b9d94
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_V420_HW_INFO_H
+#define QCOM_JENC_V420_HW_INFO_H
+
+#include <linux/bits.h>
+
+/* HW_VERSION fields */
+#define JPEG_V420_HW_VER_STEP_MSK	GENMASK(15, 0)
+#define JPEG_V420_HW_VER_MINOR_MSK	GENMASK(27, 16)
+#define JPEG_V420_HW_VER_MAJOR_MSK	GENMASK(31, 28)
+
+/* HW_CAPABILITY fields */
+#define JPEG_V420_HW_CAP_ENCODE		BIT(0)
+#define JPEG_V420_HW_CAP_DECODE		BIT(1)
+#define JPEG_V420_HW_CAP_UPSCALE_MSK	GENMASK(6, 4)
+#define JPEG_V420_HW_CAP_DOWNSCALE_MSK	GENMASK(10, 8)
+
+/* RESET_CMD fields */
+#define JPEG_V420_RST_CMD_FE_RESET			BIT(0)
+#define JPEG_V420_RST_CMD_WE_RESET			BIT(1)
+#define JPEG_V420_RST_CMD_ENCODER_RESET			BIT(4)
+#define JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST		BIT(6)
+#define JPEG_V420_RST_CMD_SCALE_RESET			BIT(7)
+#define JPEG_V420_RST_CMD_REGISTER_RESET		BIT(13)
+#define JPEG_V420_RST_CMD_MISR_RESET			BIT(16)
+#define JPEG_V420_RST_CMD_CORE_RESET			BIT(17)
+#define JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET	BIT(29)
+#define	JPEG_V420_RST_CMD_ALL_BITS \
+	(JPEG_V420_RST_CMD_FE_RESET			| \
+	 JPEG_V420_RST_CMD_WE_RESET			| \
+	 JPEG_V420_RST_CMD_ENCODER_RESET		| \
+	 JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST		| \
+	 JPEG_V420_RST_CMD_SCALE_RESET			| \
+	 JPEG_V420_RST_CMD_REGISTER_RESET		| \
+	 JPEG_V420_RST_CMD_MISR_RESET			| \
+	 JPEG_V420_RST_CMD_CORE_RESET			| \
+	 JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET)
+
+/* CORE_CFG fields */
+#define JPEG_V420_CORE_CFG_FE_ENABLE		BIT(0)
+#define JPEG_V420_CORE_CFG_WE_ENABLE		BIT(1)
+#define JPEG_V420_CORE_CFG_ENC_ENABLE		BIT(4)
+#define JPEG_V420_CORE_CFG_SCALE_ENABLE		BIT(7)
+#define JPEG_V420_CORE_CFG_MODE			BIT(24)
+
+/* HW_CMD fields */
+#define JPEG_V420_CMD_HW_START			BIT(0)
+#define JPEG_V420_CMD_HW_STOP			BIT(1)
+#define	JPEG_V420_CMD_CLR_RD_PLNS_QUEUE_MSK	GENMASK(6, 4)
+#define	JPEG_V420_CMD_CLR_WR_PLNS_QUEUE_MSK	GENMASK(10, 8)
+
+/* FE_CFG fields */
+#define JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK	GENMASK(9, 8)
+#define JPEG_V420_FE_CFG_CBCR_ORDER		BIT(12)
+#define JPEG_V420_FE_CFG_BOTTOM_VPAD_EN		BIT(13)
+#define JPEG_V420_FE_CFG_PLN0_EN		BIT(16)
+#define JPEG_V420_FE_CFG_PLN1_EN		BIT(17)
+#define JPEG_V420_FE_CFG_PLN2_EN		BIT(18)
+#define JPEG_V420_FE_CFG_SIXTEEN_MCU_EN		BIT(21)
+#define JPEG_V420_FE_CFG_MCUS_PER_BLOCK		BIT(22)
+#define JPEG_V420_FE_CFG_MAL_BOUNDARY		GENMASK(26, 24)
+#define JPEG_V420_FE_CFG_MAL_EN			BIT(27)
+#define	JPEG_V420_FE_CFG_PLNS_EN_MSK		GENMASK(18, 16)
+
+/* FE per-plane BSIZE/STRIDE fields */
+#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK	GENMASK(15, 0)
+#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK	GENMASK(31, 16)
+#define JPEG_V420_PLN_RD_STRIDE_MSK		GENMASK(15, 0)
+
+/* WE_CFG fields */
+#define JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK	GENMASK(9, 8)
+#define JPEG_V420_WE_CFG_CBCR_ORDER		BIT(12)
+#define JPEG_V420_WE_CFG_PLN0_EN		BIT(16)
+#define JPEG_V420_WE_CFG_MAL_BOUNDARY		GENMASK(26, 24)
+#define JPEG_V420_WE_CFG_MAL_EN			BIT(27)
+#define JPEG_V420_WE_CFG_POP_BUFF_ON_EOS	BIT(28)
+
+/* WE per-plane STRIDE/HINIT/VINIT/HSTEP/VSTEP/BLOCKS fields */
+#define JPEG_V420_PLN_WR_STRIDE_MSK			GENMASK(15, 0)
+#define JPEG_V420_PLN_WR_HINIT_INTEGER_MSK		GENMASK(15, 0)
+#define JPEG_V420_PLN_WR_VINIT_INTEGER_MSK		GENMASK(15, 0)
+#define JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK		GENMASK(16, 0)
+#define JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK		GENMASK(16, 0)
+#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK	GENMASK(15, 0)
+#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK	GENMASK(31, 16)
+
+/* ENC_CFG fields */
+#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK	GENMASK(2, 0)
+#define JPEG_V420_ENC_CFG_APPLY_EOI		BIT(7)
+
+/* ENC_IMG_SIZE fields */
+#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK		GENMASK(12, 0)
+#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK	GENMASK(28, 16)
+
+/* ENC_OUT_SIZE field */
+#define JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK	GENMASK(28, 0)
+
+/* SCALE_CFG fields */
+#define JPEG_V420_SCALE_CFG_HSCALE_ENABLE	BIT(4)
+#define JPEG_V420_SCALE_CFG_VSCALE_ENABLE	BIT(5)
+
+/* SCALE_OUT_CFG fields */
+#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK		GENMASK(7, 0)
+#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK	GENMASK(19, 16)
+
+/* DMI_CFG field */
+#define JPEG_V420_DMI_CFG_AUTO_INC_EN	BIT(4)
+
+/* DMI_CFG value to select quantization table memory and enable auto-increment */
+#define JPEG_DMI_ENABLE_UPLOAD	(JPEG_V420_DMI_CFG_AUTO_INC_EN | 0x1u)
+
+/* FE_VBPAD_CFG field */
+#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK GENMASK(12, 0)
+
+/* INT_STATUS/INT_MASK/INT_CLR fields */
+#define JPEG_V420_IRQ_STATUS_SESSION_DONE		BIT(0)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE		BIT(10)
+#define JPEG_V420_IRQ_STATUS_STOP_ACK			BIT(27)
+#define JPEG_V420_IRQ_STATUS_RESET_ACK			BIT(28)
+#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK	GENMASK(6, 4)
+#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK	GENMASK(9, 7)
+#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK	GENMASK(15, 13)
+#define	JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK		GENMASK(26, 19)
+#define JPEG_V420_IRQ_STATUS_ALL_BITS \
+	(JPEG_V420_IRQ_STATUS_SESSION_DONE		| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE		| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK		| \
+	 JPEG_V420_IRQ_STATUS_STOP_ACK			| \
+	 JPEG_V420_IRQ_STATUS_RESET_ACK)
+
+/* Register offsets for JPEG v4.2.0 hardware */
+#define JPEG_V420_REG_HW_VERSION	0x000
+#define JPEG_V420_REG_HW_CAPABILITY	0x004
+#define JPEG_V420_REG_RESET_CMD		0x008
+#define JPEG_V420_REG_CORE_CFG		0x00c
+#define JPEG_V420_REG_HW_CMD		0x010
+#define JPEG_V420_REG_INT_MASK		0x018
+#define JPEG_V420_REG_INT_CLR		0x01c
+#define JPEG_V420_REG_INT_STATUS	0x020
+#define JPEG_V420_REG_FE_CFG		0x024
+
+/* FE (fetch engine) plane registers */
+#define JPEG_V420_REG_FE_PNTR_0		0x038
+#define JPEG_V420_REG_FE_PNTR_1		0x044
+#define JPEG_V420_REG_FE_PNTR_2		0x050
+#define JPEG_V420_REG_FE_OFFS_0		0x03c
+#define JPEG_V420_REG_FE_OFFS_1		0x048
+#define JPEG_V420_REG_FE_OFFS_2		0x054
+#define JPEG_V420_REG_FE_BSIZE_0	0x060
+#define JPEG_V420_REG_FE_BSIZE_1	0x068
+#define JPEG_V420_REG_FE_BSIZE_2	0x070
+#define JPEG_V420_REG_FE_STRIDE_0	0x064
+#define JPEG_V420_REG_FE_STRIDE_1	0x06c
+#define JPEG_V420_REG_FE_STRIDE_2	0x08c
+#define JPEG_V420_REG_FE_HINIT_0	0x074
+#define JPEG_V420_REG_FE_HINIT_1	0x078
+#define JPEG_V420_REG_FE_HINIT_2	0x07c
+#define JPEG_V420_REG_FE_VINIT_0	0x080
+#define JPEG_V420_REG_FE_VINIT_1	0x084
+#define JPEG_V420_REG_FE_VINIT_2	0x088
+#define JPEG_V420_REG_FE_VBPAD_CFG	0x2e8
+
+/* WE (write engine) plane registers */
+#define JPEG_V420_REG_WE_CFG		0x0c0
+#define JPEG_V420_REG_WE_PNTR_0		0x0cc
+#define JPEG_V420_REG_WE_PNTR_1		0x0d0
+#define JPEG_V420_REG_WE_PNTR_2		0x0d4
+#define JPEG_V420_REG_WE_BSIZE_0	0x0e8
+#define JPEG_V420_REG_WE_STRIDE_0	0x0f4
+#define JPEG_V420_REG_WE_STRIDE_1	0x0f8
+#define JPEG_V420_REG_WE_STRIDE_2	0x0fc
+#define JPEG_V420_REG_WE_HINIT_0	0x100
+#define JPEG_V420_REG_WE_HINIT_1	0x104
+#define JPEG_V420_REG_WE_HINIT_2	0x108
+#define JPEG_V420_REG_WE_VINIT_0	0x10c
+#define JPEG_V420_REG_WE_VINIT_1	0x110
+#define JPEG_V420_REG_WE_VINIT_2	0x114
+#define JPEG_V420_REG_WE_HSTEP_0	0x118
+#define JPEG_V420_REG_WE_HSTEP_1	0x11c
+#define JPEG_V420_REG_WE_HSTEP_2	0x120
+#define JPEG_V420_REG_WE_VSTEP_0	0x124
+#define JPEG_V420_REG_WE_VSTEP_1	0x128
+#define JPEG_V420_REG_WE_VSTEP_2	0x12c
+#define JPEG_V420_REG_WE_BLOCKS_0	0x130
+
+/* Encoder registers */
+#define JPEG_V420_REG_ENC_CFG		0x13c
+#define JPEG_V420_REG_ENC_IMG_SIZE	0x140
+#define JPEG_V420_REG_ENC_OUT_SIZE	0x180
+
+/* Scaler registers */
+#define JPEG_V420_REG_SCALE_CFG		0x26c
+#define JPEG_V420_REG_SCALE_OUT_CFG_0	0x270
+#define JPEG_V420_REG_SCALE_OUT_CFG_1	0x274
+#define JPEG_V420_REG_SCALE_OUT_CFG_2	0x278
+#define JPEG_V420_REG_SCALE_HSTEP_0	0x27c
+#define JPEG_V420_REG_SCALE_HSTEP_1	0x280
+#define JPEG_V420_REG_SCALE_HSTEP_2	0x284
+#define JPEG_V420_REG_SCALE_VSTEP_0	0x28c
+#define JPEG_V420_REG_SCALE_VSTEP_1	0x290
+#define JPEG_V420_REG_SCALE_VSTEP_2	0x294
+
+/* DMI registers */
+#define JPEG_V420_REG_DMI_CFG		0x298
+#define JPEG_V420_REG_DMI_ADDR		0x29c
+#define JPEG_V420_REG_DMI_DATA		0x2a0
+
+#endif /* QCOM_JENC_V420_HW_INFO_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
new file mode 100644
index 0000000000000..380008cfcb442
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
@@ -0,0 +1,1175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_v420.h"
+#include "qcom_jenc_v4l2.h"
+
+/* JPEG hardware constraints */
+#define QCOM_JPEG_HW_MAX_WIDTH	8192
+#define QCOM_JPEG_HW_MAX_HEIGHT	8192
+#define QCOM_JPEG_HW_MIN_WIDTH	256
+#define QCOM_JPEG_HW_MIN_HEIGHT	256
+#define QCOM_JPEG_HW_DEF_HSTEP	8
+#define QCOM_JPEG_HW_DEF_VSTEP	1
+#define QCOM_JPEG_HW_DEF_WIDTH	1920
+#define QCOM_JPEG_HW_DEF_HEIGHT	1088
+
+static const struct v4l2_frmsizeenum jpeg_def_frmsize = {
+	.stepwise = {
+		.min_width	= QCOM_JPEG_HW_MIN_WIDTH,
+		.max_width	= QCOM_JPEG_HW_MAX_WIDTH,
+		.step_width	= QCOM_JPEG_HW_DEF_HSTEP,
+		.min_height	= QCOM_JPEG_HW_MIN_HEIGHT,
+		.max_height	= QCOM_JPEG_HW_MAX_HEIGHT,
+		.step_height	= QCOM_JPEG_HW_DEF_VSTEP,
+	},
+	.type = V4L2_FRMSIZE_TYPE_STEPWISE
+};
+
+static const struct jenc_enc_format jpeg_src_formats[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_NV12M,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_NV21M,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_GREY,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+#define JPEG_SRC_FMT_COUNT ARRAY_SIZE(jpeg_src_formats)
+
+static const struct jenc_enc_format jpeg_dst_formats[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_JPEG,
+		.type	= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	}
+};
+
+#define JPEG_DST_FMT_COUNT ARRAY_SIZE(jpeg_dst_formats)
+
+static inline struct jenc_context *jpeg_file2ctx(struct file *file)
+{
+	return container_of(file_to_v4l2_fh(file), struct jenc_context, fh);
+}
+
+static struct qcom_jenc_queue *jpeg_get_bufq(struct jenc_context *ectx, enum qcom_enc_qid id)
+{
+	return &ectx->bufq[id];
+}
+
+static bool jpeg_v4l2_queues_busy(struct jenc_context *ctx)
+{
+	struct vb2_queue *out_q;
+	struct vb2_queue *cap_q;
+
+	out_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	cap_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	return vb2_is_busy(out_q) || vb2_is_busy(cap_q);
+}
+
+static bool jpeg_is_invalid_src(struct jenc_context *ectx, u32 type)
+{
+	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	if (is_invalid)
+		dev_dbg(ectx->dev, "invalid src type or format\n");
+
+	return is_invalid;
+}
+
+static bool jpeg_is_invalid_dst(struct jenc_context *ectx, u32 type)
+{
+	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	if (is_invalid)
+		dev_dbg(ectx->dev, "invalid dst type or format\n");
+
+	return is_invalid;
+}
+
+static const struct jenc_enc_format *jpeg_find_pix_format(enum qcom_enc_qid id, u32 fourcc)
+{
+	const struct jenc_enc_format *efmt;
+	unsigned int i, count;
+
+	if (id == JENC_SRC_QUEUE) {
+		count = JPEG_SRC_FMT_COUNT;
+		efmt = &jpeg_src_formats[0];
+	} else {
+		count = JPEG_DST_FMT_COUNT;
+		efmt = &jpeg_dst_formats[0];
+	}
+
+	for (i = 0; i < count; i++) {
+		if (efmt[i].fourcc == fourcc)
+			return &efmt[i];
+	}
+
+	return NULL;
+}
+
+static const struct jenc_enc_format *jpeg_get_format(struct jenc_context *ectx,
+						     enum qcom_enc_qid qid, u32 pixelformat)
+{
+	const struct jenc_enc_format *efmt = jpeg_find_pix_format(qid, pixelformat);
+
+	if (!efmt)
+		efmt = (qid == JENC_SRC_QUEUE) ? &jpeg_src_formats[0] : &jpeg_dst_formats[0];
+
+	return efmt;
+}
+
+static int jpeg_update_src_planes(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
+{
+	const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
+	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
+	u32 blk_w, blk_h, height, buf_height;
+	int rc;
+
+	if (!info)
+		return -EINVAL;
+
+	f->pixelformat = ef->fourcc;
+
+	f->field	= V4L2_FIELD_NONE;
+	f->colorspace	= V4L2_COLORSPACE_SRGB;
+	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
+	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
+	f->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
+					      f->colorspace, f->ycbcr_enc);
+
+	rc = qcom_jenc_v420_get_block_width(ef->fourcc, &blk_w);
+	if (rc)
+		return rc;
+
+	rc = qcom_jenc_v420_get_block_height(ef->fourcc, &blk_h);
+	if (rc)
+		return rc;
+
+	/*
+	 * Width crops down to the nearest full MCU block instead of
+	 * rounding up: the fetch engine has no horizontal pad register.
+	 */
+	f->width  = clamp_t(u32, f->width,  QCOM_JPEG_HW_MIN_WIDTH,  QCOM_JPEG_HW_MAX_WIDTH);
+	f->width  = ALIGN_DOWN(f->width, blk_w);
+
+	/*
+	 * FE_VBPAD_CFG pads the last partial block row of the encoded image,
+	 * but the fetch engine still reads whole block rows from memory, so
+	 * the planes are sized for the height rounded up to the block.
+	 */
+	height = clamp_t(u32, f->height, QCOM_JPEG_HW_MIN_HEIGHT, QCOM_JPEG_HW_MAX_HEIGHT);
+	height = round_up(height, info->vdiv);
+	buf_height = round_up(height, blk_h);
+
+	rc = v4l2_fill_pixfmt_mp(f, ef->fourcc, f->width, buf_height);
+	if (rc)
+		return rc;
+
+	f->height = height;
+
+	return 0;
+}
+
+static void jpeg_update_dst_plane(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
+{
+	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
+	u32 nbx, nby;
+	u64 size;
+
+	f->pixelformat  = ef->fourcc;
+	f->field	= V4L2_FIELD_NONE;
+	f->colorspace	= V4L2_COLORSPACE_SRGB;
+	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
+	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
+	f->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
+					      f->colorspace, f->ycbcr_enc);
+
+	f->width  = clamp_t(u32, f->width,  QCOM_JPEG_HW_MIN_WIDTH,  QCOM_JPEG_HW_MAX_WIDTH);
+	f->width  = ALIGN_DOWN(f->width, QCOM_JPEG_HW_DEF_HSTEP);
+
+	f->height = clamp_t(u32, f->height, QCOM_JPEG_HW_MIN_HEIGHT, QCOM_JPEG_HW_MAX_HEIGHT);
+
+	/*
+	 * JPEG is a variable-size format. The output size cannot be derived
+	 * from bits per point or line stride.
+	 *
+	 * Provide a conservative upper bound based on worst-case entropy
+	 * coding of 8x8 DCT blocks:
+	 *
+	 * - Each 8x8 block has 64 coefficients (1 DC + 63 AC).
+	 * - In worst-case (high-entropy input, low quantization), all
+	 *   coefficients may be non-zero.
+	 * - Huffman coding then emits (code + magnitude bits) per coefficient,
+	 *   which can approach ~2 bytes per coefficient in the worst case.
+	 *
+	 * => Worst-case is 64 coefficients * 2 bytes = 128 bytes per 8x8 block
+	 * => approximately 2 bytes per point
+	 *
+	 * This bound implicitly covers byte stuffing (0xFF escaping) and is
+	 * conservative with respect to subsampled formats (e.g. 4:2:0).
+	 *
+	 * Additional margin is added for headers and alignment.
+	 *
+	 * Note: This is a conservative upper bound, not an exact size.
+	 */
+
+	nbx = DIV_ROUND_UP(f->width,  8);
+	nby = DIV_ROUND_UP(f->height, 8);
+
+	size = nbx * nby * 128;
+	size += JPEG_HEADER_MAX; /* JPEG header written by CPU before HW DMA */
+	size += SZ_4K;           /* safety margin and alignment */
+
+	f->plane_fmt[0].bytesperline = 0;
+	f->plane_fmt[0].sizeimage    = ALIGN(size, SZ_4K);
+}
+
+static int jpeg_enum_fmt_src(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= JPEG_SRC_FMT_COUNT)
+		return -EINVAL;
+
+	f->pixelformat = jpeg_src_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int jpeg_enum_fmt_dst(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= JPEG_DST_FMT_COUNT)
+		return -EINVAL;
+
+	f->pixelformat = jpeg_dst_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int jpeg_v4l2_try_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
+	const struct jenc_enc_format *ef;
+	int rc;
+
+	/* The function always returns valid driver format */
+	ef = jpeg_get_format(ectx, TYPE2QID(f->type), pm->pixelformat);
+
+	dev_dbg(ectx->dev, "type=%d %p4cc\n",
+		TYPE2QID(f->type), &ef->fourcc);
+
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		f->fmt.pix_mp.num_planes = 1;
+
+		jpeg_update_dst_plane(ef, f);
+
+		dev_dbg(ectx->dev, "\tImage: %dx%d Size:%9d\n", f->fmt.pix_mp.width,
+			f->fmt.pix_mp.height, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+	} else {
+		const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
+		u8 pln = 0;
+
+		if (!info)
+			return -EINVAL;
+
+		f->fmt.pix_mp.num_planes = info->comp_planes;
+
+		rc = jpeg_update_src_planes(ef, f);
+		if (rc)
+			return rc;
+
+		for (pln = 0; pln < f->fmt.pix_mp.num_planes; pln++)
+			dev_dbg(ectx->dev, "\tImage: %dx%d BPL:%5d Size:%9d\n",
+				pm->width, pm->height, pm->plane_fmt[pln].bytesperline,
+				pm->plane_fmt[pln].sizeimage);
+	}
+
+	return 0;
+}
+
+static int jpeg_v4l2_set_defaults(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+	struct v4l2_format f = {0};
+	int rc;
+
+	f.type			 = jpeg_src_formats->type;
+	f.fmt.pix_mp.pixelformat = jpeg_src_formats->fourcc;
+	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
+	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
+
+	rc = jpeg_v4l2_try_format(ectx, &f);
+	if (rc)
+		return rc;
+
+	sq->vf = f.fmt.pix_mp;
+
+	f.type			 = jpeg_dst_formats->type;
+	f.fmt.pix_mp.pixelformat = jpeg_dst_formats->fourcc;
+	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
+	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
+
+	rc = jpeg_v4l2_try_format(ectx, &f);
+	if (rc)
+		return rc;
+
+	dq->vf = f.fmt.pix_mp;
+
+	return 0;
+}
+
+static int jpeg_v4l2_set_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
+	u32 old_src_fourcc = sq->vf.pixelformat;
+	int rc;
+
+	if (jpeg_v4l2_queues_busy(ectx))
+		return -EBUSY;
+
+	if (!v4l2_m2m_get_vq(ectx->fh.m2m_ctx, f->type)) {
+		dev_err(ectx->dev, "cannot get video queue\n");
+		return -EINVAL;
+	}
+
+	rc = jpeg_v4l2_try_format(ectx, f);
+	if (rc)
+		return rc;
+
+	/*
+	 * Because scaling is not supported, source and destination image
+	 * sizes must be equal.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		/* Adjust source size to match capture size */
+		if (pm->width != sq->vf.width || pm->height != sq->vf.height) {
+			struct v4l2_format nf = {0};
+
+			nf.type			  = jpeg_src_formats->type;
+			nf.fmt.pix_mp.pixelformat = sq->vf.pixelformat;
+			nf.fmt.pix_mp.width	  = pm->width;
+			nf.fmt.pix_mp.height	  = pm->height;
+
+			rc = jpeg_v4l2_try_format(ectx, &nf);
+			if (rc)
+				return rc;
+
+			sq->vf = nf.fmt.pix_mp;
+
+			/*
+			 * OUTPUT TRY_FMT may crop the width to the block size; keep the
+			 * CAPTURE size equal to the negotiated OUTPUT size.
+			 */
+			if (pm->width != nf.fmt.pix_mp.width ||
+			    pm->height != nf.fmt.pix_mp.height) {
+				pm->width  = nf.fmt.pix_mp.width;
+				pm->height = nf.fmt.pix_mp.height;
+			}
+		}
+
+	} else {
+		struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+		struct v4l2_format nf = {0};
+
+		/* Adjust destination size to match source size */
+		if (pm->width != dq->vf.width || pm->height != dq->vf.height) {
+			nf.type			  = jpeg_dst_formats->type;
+			nf.fmt.pix_mp.pixelformat = dq->vf.pixelformat;
+			nf.fmt.pix_mp.width	  = pm->width;
+			nf.fmt.pix_mp.height	  = pm->height;
+
+			rc = jpeg_v4l2_try_format(ectx, &nf);
+			if (rc)
+				return rc;
+
+			dq->vf = nf.fmt.pix_mp;
+		}
+	}
+
+	q->vf = *pm;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		rc = qcom_jenc_v420_src_fmt_update(ectx, old_src_fourcc, q->vf.pixelformat);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static void jpeg_v4l2_get_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
+
+	f->fmt.pix_mp = q->vf;
+}
+
+static void jpeg_finish_work(struct work_struct *work)
+{
+	struct jenc_context *ctx = container_of(work, struct jenc_context, finish_work);
+
+	v4l2_m2m_job_finish(ctx->jenc->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void jpeg_v4l2_work_done(struct jenc_context *ctx, size_t out_size)
+{
+	struct vb2_v4l2_buffer *vb;
+	bool last = false;
+
+	vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	if (vb) {
+		last = v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, vb);
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+	}
+
+	vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	if (vb) {
+		vb2_set_plane_payload(&vb->vb2_buf, 0, out_size);
+		if (last) {
+			vb->flags |= V4L2_BUF_FLAG_LAST;
+			v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+		}
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+	}
+
+	schedule_work(&ctx->finish_work);
+}
+
+static void jpeg_v4l2_return_bufs(struct jenc_context *ctx, enum vb2_buffer_state buff_state)
+{
+	bool draining = ctx->fh.m2m_ctx->is_draining;
+	struct vb2_v4l2_buffer *vb;
+
+	/* Drain CAPTURE queue; signal EOS on last buffer if V4L2_ENC_CMD_STOP. */
+	while ((vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
+		if (draining && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
+			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
+			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
+		} else {
+			v4l2_m2m_buf_done(vb, buff_state);
+		}
+	}
+
+	while ((vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vb, buff_state);
+}
+
+static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffer_state buff_state)
+{
+	jpeg_v4l2_return_bufs(ctx, buff_state);
+
+	/* Always call job_finish to let m2m schedule the next job. */
+	schedule_work(&ctx->finish_work);
+}
+
+static void jpeg_v4l2_process_cb(void *priv, enum vb2_buffer_state ev, size_t out_size)
+{
+	struct jenc_context *ctx = priv;
+	struct qcom_jenc_dev *jenc = ctx->jenc;
+
+	/* threaded IRQ path */
+	mutex_lock(&jenc->dev_mutex);
+
+	if (ev == VB2_BUF_STATE_DONE && out_size)
+		jpeg_v4l2_work_done(ctx, out_size);
+	else
+		jpeg_v4l2_work_stop(ctx, ev);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static int jpeg_v4l2_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct jenc_context *ectx = container_of(ctrl->handler, struct jenc_context, ctrl_hdl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		mutex_lock(&ectx->quality_mutex);
+		ectx->quality_requested = ctrl->val;
+		mutex_unlock(&ectx->quality_mutex);
+		break;
+	default:
+		dev_err(ectx->dev, "invalid control id=%#x\n", ctrl->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops qcom_jpeg_v4l2_ctrl_ops = {
+	.s_ctrl = jpeg_v4l2_s_ctrl,
+};
+
+static int bop_jpeg_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				    unsigned int *plns_per_buff, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vq);
+	struct qcom_jenc_queue *q;
+	int pln;
+
+	q = qcom_jenc_v420_get_buff_queue(ectx, TYPE2QID(vq->type));
+	if (!q || !q->vf.num_planes)
+		return -EINVAL;
+
+	if (*plns_per_buff) {
+		if (*plns_per_buff != q->vf.num_planes)
+			return -EINVAL;
+
+		for (pln = 0; pln < q->vf.num_planes; ++pln) {
+			if (sizes[pln] < q->vf.plane_fmt[pln].sizeimage)
+				return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	*plns_per_buff = q->vf.num_planes;
+	for (pln = 0; pln < q->vf.num_planes; ++pln) {
+		sizes[pln] = q->vf.plane_fmt[pln].sizeimage;
+		dev_dbg(ectx->dev, "queue=%d size[%d]=%d\n", TYPE2QID(vq->type),
+			pln, sizes[pln]);
+	}
+
+	return qcom_jenc_v420_queue_setup(ectx, TYPE2QID(vq->type));
+}
+
+static int bop_jpeg_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (vbuf->field == V4L2_FIELD_ANY)
+		vbuf->field = V4L2_FIELD_NONE;
+
+	if (vbuf->field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int bop_jpeg_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb->type)];
+	int pln;
+	int rc;
+
+	if (vb->num_planes != q->vf.num_planes)
+		return -EINVAL;
+
+	for (pln = 0; pln < q->vf.num_planes; pln++) {
+		if (q->vf.plane_fmt[pln].sizeimage == 0)
+			return -EINVAL;
+
+		if (vb2_plane_size(vb, pln) < q->vf.plane_fmt[pln].sizeimage)
+			return -EINVAL;
+
+		if (vb->planes[pln].data_offset)
+			return -EINVAL;
+	}
+
+	rc = qcom_jenc_v420_buffer_prepare(ectx, vb);
+	if (rc) {
+		dev_err_ratelimited(ectx->dev, "buffer prepare failed\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static void bop_jpeg_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	/* Drain pending with no CAPTURE buffer: return this one empty as LAST */
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) && vb2_is_streaming(vb->vb2_queue) &&
+	    v4l2_m2m_dst_buf_is_last(ectx->fh.m2m_ctx)) {
+		vb2_set_plane_payload(vb, 0, 0);
+		v4l2_m2m_last_buffer_done(ectx->fh.m2m_ctx, vbuf);
+		return;
+	}
+
+	v4l2_m2m_buf_queue(ectx->fh.m2m_ctx, vbuf);
+}
+
+static void jpeg_v4l2_buffers_done(struct jenc_context *ectx, u32 type, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vb;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		while ((vb = v4l2_m2m_src_buf_remove(ectx->fh.m2m_ctx)))
+			v4l2_m2m_buf_done(vb, state);
+	} else {
+		while ((vb = v4l2_m2m_dst_buf_remove(ectx->fh.m2m_ctx)))
+			v4l2_m2m_buf_done(vb, state);
+	}
+}
+
+static int bop_jpeg_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(q);
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 hw_caps;
+	u8 pln;
+	int rc;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		dev_dbg(ectx->dev, "%p4cc %dx%d\n",
+			&sq->vf.pixelformat, sq->vf.width, sq->vf.height);
+
+		for (pln = 0; pln < sq->vf.num_planes; pln++) {
+			dev_dbg(ectx->dev, "\tpln=%d %dx%d bpl:%d size:%d\n", pln,
+				sq->vf.width, sq->vf.height,
+				sq->vf.plane_fmt[pln].bytesperline,
+				sq->vf.plane_fmt[pln].sizeimage);
+		}
+	} else {
+		dev_dbg(ectx->dev, "%p4cc %dx%d\n",
+			&dq->vf.pixelformat,
+			dq->vf.width, dq->vf.height);
+	}
+
+	mutex_lock(&jenc->dev_mutex);
+
+	v4l2_m2m_update_start_streaming_state(ectx->fh.m2m_ctx, q);
+	mutex_unlock(&jenc->dev_mutex);
+
+	/*
+	 * Header cache is initialized lazily when the first job runs, so valid V4L2
+	 * orders like STREAMON before first QBUF still get a proper JPEG header.
+	 */
+	if (!ectx->hw_acquired) {
+		rc = qcom_jenc_v420_acquire(ectx);
+		if (!rc) {
+			ectx->hw_acquired = true;
+			qcom_jenc_v420_get_hw_caps(jenc, &hw_caps);
+			dev_dbg(ectx->dev, "hw_caps=0x%x\n", hw_caps);
+		}
+	} else {
+		rc = 0;
+	}
+
+	if (rc)
+		jpeg_v4l2_buffers_done(ectx, q->type, VB2_BUF_STATE_QUEUED);
+
+	return rc;
+}
+
+static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(q);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	bool do_release;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	do_release = ectx->hw_acquired;
+	ectx->hw_acquired = false;
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	/*
+	 * qcom_jenc_v420_release() calls jpeg_deinit() which issues HW_STOP and
+	 * waits for the STOP_ACK interrupt completion. It runs before any buffer
+	 * is returned below and outside dev_mutex: the threaded IRQ handler takes
+	 * dev_mutex, and with IRQF_ONESHOT the STOP_ACK interrupt stays masked
+	 * until that handler returns.
+	 */
+	if (do_release)
+		qcom_jenc_v420_release(ectx);
+
+	mutex_lock(&jenc->dev_mutex);
+	jpeg_v4l2_buffers_done(ectx, q->type, VB2_BUF_STATE_ERROR);
+	v4l2_m2m_update_stop_streaming_state(ectx->fh.m2m_ctx, q);
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static const struct vb2_ops qcom_jpeg_v4l2_vb2_ops = {
+	.queue_setup		= bop_jpeg_vb2_queue_setup,
+	.buf_out_validate	= bop_jpeg_vb2_buf_out_validate,
+	.buf_prepare		= bop_jpeg_vb2_buf_prepare,
+	.buf_queue		= bop_jpeg_vb2_buf_queue,
+	.start_streaming	= bop_jpeg_vb2_start_streaming,
+	.stop_streaming		= bop_jpeg_vb2_stop_streaming,
+};
+
+static void mop_jpeg_m2m_job_run(void *priv)
+{
+	struct jenc_context *ectx = priv;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	struct qcom_jenc_queue *sq, *dq;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	src_vb = v4l2_m2m_next_src_buf(ectx->fh.m2m_ctx);
+	dst_vb = v4l2_m2m_next_dst_buf(ectx->fh.m2m_ctx);
+
+	if (!src_vb || !dst_vb)
+		goto err_stop;
+
+	if (qcom_jenc_v420_retune_clk(ectx))
+		goto err_stop;
+
+	qcom_jenc_v420_prepare(jenc);
+
+	sq = qcom_jenc_v420_get_buff_queue(ectx, TYPE2QID(src_vb->vb2_buf.type));
+	src_vb->sequence = sq->sequence++;
+	if (qcom_jenc_v420_process_exec(jenc, ectx, &src_vb->vb2_buf))
+		goto err_stop;
+
+	dq = qcom_jenc_v420_get_buff_queue(ectx, TYPE2QID(dst_vb->vb2_buf.type));
+	dst_vb->sequence = dq->sequence++;
+	if (qcom_jenc_v420_process_exec(jenc, ectx, &dst_vb->vb2_buf))
+		goto err_stop;
+
+	v4l2_m2m_buf_copy_metadata(src_vb, dst_vb);
+
+	mutex_unlock(&jenc->dev_mutex);
+	return;
+
+err_stop:
+	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static const struct v4l2_m2m_ops qcom_jpeg_v4l2_m2m_ops = {
+	.device_run	= mop_jpeg_m2m_job_run,
+};
+
+static int iop_jpeg_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, QCOM_JPEG_ENC_NAME, sizeof(cap->driver));
+	strscpy(cap->card, QCOM_JPEG_ENC_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", QCOM_JPEG_ENC_NAME);
+
+	return 0;
+}
+
+static int iop_jpeg_enum_fmt_vid_dst(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_enum_fmt_dst(f);
+}
+
+static int iop_jpeg_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize)
+{
+	const struct v4l2_format_info *info;
+	const struct jenc_enc_format *efmt;
+	u32 blk_w;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	efmt = jpeg_find_pix_format(JENC_SRC_QUEUE, fsize->pixel_format);
+	if (efmt) {
+		info = v4l2_format_info(efmt->fourcc);
+		if (!info || qcom_jenc_v420_get_block_width(efmt->fourcc, &blk_w))
+			return -EINVAL;
+
+		fsize->type	= jpeg_def_frmsize.type;
+		fsize->stepwise	= jpeg_def_frmsize.stepwise;
+		fsize->stepwise.step_width = blk_w;
+		fsize->stepwise.step_height = info->vdiv;
+		return 0;
+	}
+
+	efmt = jpeg_find_pix_format(JENC_DST_QUEUE, fsize->pixel_format);
+	if (efmt) {
+		fsize->type	= jpeg_def_frmsize.type;
+		fsize->stepwise	= jpeg_def_frmsize.stepwise;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int iop_jpeg_enum_fmt_vid_src(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_enum_fmt_src(f);
+}
+
+static int iop_jpeg_get_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	jpeg_v4l2_get_format(ectx, f);
+
+	return 0;
+}
+
+static int iop_jpeg_try_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_try_format(ectx, f);
+}
+
+static int iop_jpeg_set_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_set_format(ectx, f);
+}
+
+static int iop_jpeg_get_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	jpeg_v4l2_get_format(ectx, f);
+
+	return 0;
+}
+
+static int iop_jpeg_try_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_try_format(ectx, f);
+}
+
+static int iop_jpeg_set_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_set_format(ectx, f);
+}
+
+static int iop_jpeg_encoder_command(struct file *file, void *priv, struct v4l2_encoder_cmd *ec)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+	struct vb2_queue *vq;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP) {
+		vq = v4l2_m2m_get_src_vq(ectx->fh.m2m_ctx);
+		if (!vb2_is_streaming(vq))
+			return 0;
+
+		vq = v4l2_m2m_get_dst_vq(ectx->fh.m2m_ctx);
+		if (!vb2_is_streaming(vq))
+			return 0;
+	}
+
+	return v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+}
+
+static const struct v4l2_ioctl_ops qcom_jpeg_v4l2_ioctl_ops = {
+	.vidioc_querycap		= iop_jpeg_querycap,
+	.vidioc_enum_fmt_vid_cap	= iop_jpeg_enum_fmt_vid_dst,
+	.vidioc_enum_fmt_vid_out	= iop_jpeg_enum_fmt_vid_src,
+	.vidioc_enum_framesizes		= iop_jpeg_enum_framesizes,
+
+	.vidioc_g_fmt_vid_cap_mplane	= iop_jpeg_get_fmt_vid_dst,
+	.vidioc_try_fmt_vid_cap_mplane	= iop_jpeg_try_fmt_vid_dst,
+	.vidioc_s_fmt_vid_cap_mplane	= iop_jpeg_set_fmt_vid_dst,
+	.vidioc_g_fmt_vid_out_mplane	= iop_jpeg_get_fmt_vid_src,
+	.vidioc_try_fmt_vid_out_mplane	= iop_jpeg_try_fmt_vid_src,
+	.vidioc_s_fmt_vid_out_mplane	= iop_jpeg_set_fmt_vid_src,
+
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+
+	.vidioc_encoder_cmd		= iop_jpeg_encoder_command,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
+};
+
+static int jpeg_v4l2_init_queue(void *priv, struct vb2_queue *sq, struct vb2_queue *dq)
+{
+	struct jenc_context *ectx = priv;
+	int rc;
+
+	sq->drv_priv		= ectx;
+	sq->dev			= ectx->dev;
+	sq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	sq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	sq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
+	sq->ops			= &qcom_jpeg_v4l2_vb2_ops;
+	sq->mem_ops		= &vb2_dma_sg_memops;
+	sq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	sq->lock		= &ectx->ctx_lock;
+	sq->min_queued_buffers	= 1;
+
+	rc = vb2_queue_init(sq);
+	if (rc)
+		return rc;
+
+	dq->drv_priv		= ectx;
+	dq->dev			= ectx->dev;
+	dq->type		= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	dq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
+	dq->ops			= &qcom_jpeg_v4l2_vb2_ops;
+	dq->mem_ops		= &vb2_dma_sg_memops;
+	dq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	/* The CPU writes the JPEG header, the hardware the bitstream */
+	dq->bidirectional	= true;
+	dq->lock		= &ectx->ctx_lock;
+	dq->min_queued_buffers	= 1;
+
+	rc = vb2_queue_init(dq);
+	if (rc) {
+		vb2_queue_release(sq);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int fop_jpeg_file_open(struct file *file)
+{
+	struct qcom_jenc_dev *jenc = video_drvdata(file);
+	struct video_device *vdev = video_devdata(file);
+	struct jenc_context *ectx;
+	int rc;
+
+	ectx = kzalloc_obj(*ectx, GFP_KERNEL);
+	if (!ectx)
+		return -ENOMEM;
+
+	ectx->dev  = jenc->dev;
+	ectx->jenc = jenc;
+
+	/* default quality if userspace does not set the control explicitly */
+	ectx->quality_requested = QCOM_JPEG_QUALITY_DEF;
+	ectx->quality_programmed = 0;
+
+	mutex_init(&ectx->ctx_lock);
+	mutex_init(&ectx->quality_mutex);
+
+	INIT_WORK(&ectx->finish_work, jpeg_finish_work);
+
+	rc = jpeg_v4l2_set_defaults(ectx);
+	if (rc)
+		goto err_unlock_free;
+
+	v4l2_fh_init(&ectx->fh, vdev);
+	v4l2_fh_add(&ectx->fh, file);
+
+	v4l2_ctrl_handler_init(&ectx->ctrl_hdl, 1);
+	ectx->quality_ctl = v4l2_ctrl_new_std(&ectx->ctrl_hdl,
+					      &qcom_jpeg_v4l2_ctrl_ops,
+					      V4L2_CID_JPEG_COMPRESSION_QUALITY,
+					      QCOM_JPEG_QUALITY_MIN,
+					      QCOM_JPEG_QUALITY_MAX,
+					      QCOM_JPEG_QUALITY_UNT,
+					      QCOM_JPEG_QUALITY_DEF);
+	if (ectx->ctrl_hdl.error) {
+		rc = ectx->ctrl_hdl.error;
+		goto err_ctrl_handler_free;
+	}
+
+	ectx->fh.ctrl_handler = &ectx->ctrl_hdl;
+
+	rc = v4l2_ctrl_handler_setup(&ectx->ctrl_hdl);
+	if (rc)
+		goto err_ctrl_handler_free;
+
+	v4l2_m2m_get(jenc->m2m_dev);
+	ectx->fh.m2m_ctx = v4l2_m2m_ctx_init(jenc->m2m_dev, ectx, &jpeg_v4l2_init_queue);
+	if (IS_ERR(ectx->fh.m2m_ctx)) {
+		rc = PTR_ERR(ectx->fh.m2m_ctx);
+		v4l2_m2m_put(jenc->m2m_dev);
+		goto err_ctrl_handler_free;
+	}
+
+	return 0;
+
+err_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
+	v4l2_fh_del(&ectx->fh, file);
+	v4l2_fh_exit(&ectx->fh);
+err_unlock_free:
+	mutex_destroy(&ectx->quality_mutex);
+	mutex_destroy(&ectx->ctx_lock);
+	kfree(ectx);
+
+	return rc;
+}
+
+static int fop_jpeg_file_release(struct file *file)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+	struct v4l2_m2m_dev *m2m_dev = ectx->fh.m2m_ctx->m2m_dev;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	unsigned long flags;
+
+	/*
+	 * Waits until a running job of this context completes: its
+	 * SESSION_DONE interrupt needs jenc->actx, and finish_work must not
+	 * be cancelled before, as it calls v4l2_m2m_job_finish().
+	 */
+	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);
+
+	/*
+	 * Ensure the threaded IRQ handler cannot dereference this context
+	 * after it is freed.  Clear jenc->actx under hw_lock before
+	 * cancelling work.
+	 */
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	if (jenc->actx == ectx)
+		jenc->actx = NULL;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	cancel_work_sync(&ectx->finish_work);
+
+	v4l2_m2m_put(m2m_dev);
+	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
+	v4l2_fh_del(&ectx->fh, file);
+	v4l2_fh_exit(&ectx->fh);
+	mutex_destroy(&ectx->quality_mutex);
+	mutex_destroy(&ectx->ctx_lock);
+	kfree(ectx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations qcom_jpeg_v4l2_file_ops = {
+	.owner		= THIS_MODULE,
+	.open		= fop_jpeg_file_open,
+	.release	= fop_jpeg_file_release,
+	.poll		= v4l2_m2m_fop_poll,
+	.mmap		= v4l2_m2m_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+};
+
+static void qcom_jpeg_m2m_put(void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+
+	v4l2_m2m_put(jenc->m2m_dev);
+}
+
+static void qcom_jpeg_video_unregister(void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+
+	video_unregister_device(jenc->vdev);
+}
+
+int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc)
+{
+	int rc;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jenc->enc_hw_irq_cb = jpeg_v4l2_process_cb;
+
+	jenc->m2m_dev = v4l2_m2m_init(&qcom_jpeg_v4l2_m2m_ops);
+	if (IS_ERR(jenc->m2m_dev)) {
+		dev_err(jenc->dev, "failed to init mem2mem device\n");
+		rc = PTR_ERR(jenc->m2m_dev);
+		goto err_mutex_unlock;
+	}
+
+	rc = devm_add_action_or_reset(jenc->dev, qcom_jpeg_m2m_put, jenc);
+	if (rc)
+		goto err_mutex_unlock;
+
+	jenc->vdev = video_device_alloc();
+	if (!jenc->vdev) {
+		rc = -ENOMEM;
+		goto err_mutex_unlock;
+	}
+
+	snprintf(jenc->vdev->name, sizeof(jenc->vdev->name), "%s", QCOM_JPEG_ENC_NAME);
+	jenc->vdev->fops	= &qcom_jpeg_v4l2_file_ops;
+	jenc->vdev->ioctl_ops	= &qcom_jpeg_v4l2_ioctl_ops;
+	jenc->vdev->minor	= -1;
+	jenc->vdev->release	= video_device_release;
+	jenc->vdev->lock	= &jenc->dev_mutex;
+	jenc->vdev->v4l2_dev	= &jenc->v4l2_dev;
+	jenc->vdev->vfl_dir	= VFL_DIR_M2M;
+	jenc->vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+	video_set_drvdata(jenc->vdev, jenc);
+
+	rc = video_register_device(jenc->vdev, VFL_TYPE_VIDEO, -1);
+	if (rc) {
+		dev_err(jenc->dev, "failed to register video device\n");
+		goto err_video_device_release;
+	}
+
+	rc = devm_add_action_or_reset(jenc->dev, qcom_jpeg_video_unregister, jenc);
+	if (rc)
+		goto err_mutex_unlock;
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	dev_dbg(jenc->dev, "device registered as /dev/video%d\n", jenc->vdev->num);
+
+	return 0;
+
+err_video_device_release:
+	video_device_release(jenc->vdev);
+err_mutex_unlock:
+	mutex_unlock(&jenc->dev_mutex);
+
+	return rc;
+}
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
new file mode 100644
index 0000000000000..75af7e265c0d4
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_V4L2_H
+#define QCOM_JENC_V4L2_H
+
+struct qcom_jenc_dev;
+
+int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc);
+
+#endif /* QCOM_JENC_V4L2_H */
-- 
2.34.1

