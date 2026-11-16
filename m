Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848767;
	b=oXsIqM2YNuL2vGLdlfgiUAYJ4P9dtO8jNPyoSwW5zveHCP9ebOLuQ8+Cc5Z/nXFUanW8
	 phuoWb1sBzrHHIpNCO14DfNKVYrwgtGiBahxOwxQuGKHIGZUzIk5nCAQk3UC6orZj+OT7
	 2pAPuCSqOVlWmrML2XG4poqcEkU/V2kc3P9c050LTS2keJW/IWdM6GM+fGcaoKcZ83sg0
	 v23kfAafqd+oxnFIkcrM5btQbpcI165RLEH8uCjf9YKzRgDDpvV4ffIPjGGxfl6x3Zbef
	 LpKyhqzB4/f0drjEYmCRLuP7TPbtpUftw196CqRvQm4NtHrmPvBkX5PTOFEVqK0kF3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=;
	b=Kng4qFtaVV5Gb+CjVIZAanUfFbSzmfzXCnE5UJjjz9GOD6FfxdunAE9rY7ttq4cnPR3T
	 8svF+vxSmLXQqVFYQmZ4I7ATgEOuzY6gFYueWbbVcFAjItP3zdaEys+8HWBQJjsF9g/bk
	 8TiKq0VKbLcejOG0zlw8vZz5/CHgMXo0gXrmj89OURJaYIjhXX4IflTaGlnpMb/qTHZin
	 X1Be/QLp7BT+LJrlN+9G05aDO7+Mm20IoI8qdkZFqL1PfL2qxbMmpORFuKaRAmOMm9b1F
	 oVnu2XeQF05I3B1LlRPaVhkUdUeCi91VlxWY8NNO4sBCGeF4Xix2Tm521xMv18GaenQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvmyvPJm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hwC1dacx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBC9606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBC9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvmyvPJm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hwC1dacx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIDmj2264138
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=; b=YvmyvPJmHAH4BW/V
	3xoDxdCPicyZKJKr985TmfU/jEQekg435JvA0U+Buc31+I4dMtlKKxq3clbCx1xT
	rw7uQd6eM02D4YRZCwm81BVWkaHDUmiXg7k7ox9/GGMdfCGrtaoMPlVq9OFWJ1Cd
	g8yts6zBldVZPyI6RMjjNxhMxrLljx9QMKtI2/C5SMYKfF7XvUh/PAL0H6zawdYJ
	N2EzGuh+GYEOTZZ/swoyuWD990SF/Na4IEh/xisDlpGX3lwUnoyZyqecLrVegGCr
	x0w6GFugy5P72stPPO5XQZ23q0U4JSAhdbVcOTqQhzS7Vf5Cev28VzuW6M4YPCj7
	yYrEsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc37ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:06:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efa9aea3c0so22941745ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848765; x=1795453565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=;
        b=hwC1dacxrU1Ug4jeUJNwU6BjTFTQvym8ZxSx7KZIAffoZqx8SkZwkNzSWAWGOoCy8b
         E/Wq3kjfAIjj6sbMgzb4ltxjKmTmchzy4WY6uvzLio9Z8Ro6m08z5RazRkjd5z6GZJ33
         MLFrB4y3W91YyJB83RxFKbABxNPE3q5ccpa5H0vOXQ2S5NgCpUPiCIZTlDGC8bSRJ+Gj
         sQRZQKv81RqBx7yjVzKKZcl2gO+Jgbah6YQxAxanVuvKF346DVLdlaJrrG1vTbpGfUCx
         DnJXhMwUSb9zm8zrbQuuohVT8LTIMOQEs6id25InfBBqZ89EbtIwBjJmnjXeVG3vCDZe
         0HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848765; x=1795453565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlwXqUzRRfb3OGnpB2HAjr8KEu2310plJJVrSuvmiKg=;
        b=buagdg028YgIgEfokbd3Ej0xqdQ+gHO7hdF9JsZ9r3xZv0wJFqpTc/SpCl6Q5mR+ps
         nTJLGdff7vDVTw1ByPu5NAP4GlYqavGU8PPspklccMaEg/EEqwHNYJyQkiBGjeN1s/Oq
         3ZN1Cg3mo5hNjMpZDkjUMTyhssCWTNHnAtUF7V1n5cG9MDMg5b4i6rXQdOPKOr2wO0+6
         Z2wkF1tkqHx4W82CxEMdyHZDN1PCYIc99CvshFlZiiAvNMPCo8psnnJwSsHLNYXjiaew
         9pLgSNe9tWZBr1rnxWSXQ2l56RcStkT7yk4031xFb07xAjgiamx33qTlEebu/QOKcGJN
         KP9Q==
X-Forwarded-Encrypted: i=1; AL+hErHK5GfEcSxn6Wx9UH4NEN/3xiGDNGjsIoxhT57WdyyMG1MpezeXLDTZt67tssxZzNjGKrc8TY/krxJ/7w0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IF8EHSvULjTSg2ES2ooFAVJLUgnLir/uj7tfyoSoOv1DbN8BP
	BcihDu0IMLYAeAP4w+xx6m4HnEzDzNtuLXQXe/uuXx9tHtq8nyWnBuM6az8RgGHAfk4z635ddYt
	d4gDXbLfvqDnOZQnV6drucZcnf48a9Tdq3o9Jyuqv7kS9dsJFObJfi4E2HoBG4hs7Prc=
X-Gm-Gg: AZFdTZfXvIy0R2xBk+OZpW/lVvewvdFdSUjWCDck89SsmPx9sKSWrFcrtlw7yR8yK6s
	E8tEJyX6MTxwyaHqPYjndCzM0HHx62oY1sIXMuono79MXZFDBgxkA1rVFunsgBTLuiSibmc3Eem
	8FMFaOhIiQSMgRoqE6VjRZ2ox1Hh6F5ADcTgmJP1exeMwFHC6GVOMbp6HA76HqRBfN7r0slDMPn
	nmhIuPcLgftkULn6xMhZ73jyjFXHcU3KsFK0nAtcgHNkAW5fMwc+hWXeA23v+CErzql9uRRifD6
	HJ/mqhUSA3vnCu8aI6CATzpyEbkbiTRI/OeUIXOou/wHmqHGKfdLxD5ARVQMcg2eKsEH5kYyfAs
	JrIFRriw3aaDFQJoxF9tzLmWQ4OJl4C7Pwt9a0slTZM1G9XLFHfC5168HoHf9jtC4uy4XrSWS0b
	HvAmPS
X-Received: by 2002:a17:903:32c6:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2ee0da98d1cmr111893225ad.16.1794848765082;
        Mon, 16 Nov 2026 09:06:05 -0800 (PST)
X-Received: by 2002:a17:903:32c6:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2ee0da98d1cmr111892905ad.16.1794848764618;
        Mon, 16 Nov 2026 09:06:04 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:06:04 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:35:52 +0530
Subject: [PATCH v4 2/3] media: uapi: Add Qualcomm iris MBR rate control
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-b4-add_sc7280_mbr-v4-2-636fb6bc8772@oss.qualcomm.com>
References: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
In-Reply-To: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=3597;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=MUVQ3bz9IM6JPszLI1kBbzmCcPvTX8QFrtQh1MrfGAU=;
 b=0nAeaN5Do3G5JmFFS78nNwBTss83PQbbgGMRpFZ4YWwUu8/hJ0bwxlzOcK/fX7Jvjo7Ry6l5y
 XeyStTY/HCpASbcAWOEhKRXqKSLFvFQb/UELd6aHMi0DuRg7dhq1U0t
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX877d4NCsSK4M
 6sQ3f+52pIWb2aTd14tOVY3Vyn3J3mIN2LgcDkSo66i6iwhF2PHEOjRz8ShZSYFSLO5/CuWZjdz
 0szA1RpKMB4rTdKRwqHlTkO+2A4EQ4w=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb37fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hlx5QhHZQzrwP0BnnOAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: CQXnabF4zkrj1W4g0n83NkvFge3vtn9L
X-Proofpoint-GUID: CQXnabF4zkrj1W4g0n83NkvFge3vtn9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX2U3qNxPTIccl
 D433ewGrUu3xQAD5VuqhNa27Cs9Qh87wL6QQE21amOf8EyhXaIvdty2D6306KlVWTTnsm8VuLjm
 Qm9A8VYF7Tq4OSvJt6F0ce28Pg3V5VJZ5jJd39ga5eL+pmz+HrhaThnTCAZFr8yhDTw4bmTzL+u
 yCSuZkRTJmU62IF5FNyptu5HxzM8aE4JMO824K4qo/YrJyRI0vv8wMHd3TS/gwcPeRJ0Xn32eZt
 Zl4cWLo+TIFNL6ZFUQlxQQf6JG3qdZHbO8RqV6i6qVANQ4pFj7a1j84b9MjAnYhwS6ridWa0Xv5
 eNVTD4wfISJrrqj7O8G6MN9enGDo2eKuR79IQfxJFLASAaUow6iJ5eluxAd0Tofz9ksLKvzzj/v
 k7oLsePIMCXlV99dVSSvaPAMr+mlHsCbKsslFw9/CUWZllbcIfKZgJSsphbm76bh7k5jIYQj0MI
 rNSP+OHGVzdlteaDS2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160068

Add include/uapi/linux/media/qcom/iris-config.h defining
V4L2_CID_QCOM_MBR_RATE_CONTROL, the first control in the
V4L2_CID_USER_QCOM_IRIS_BASE range, so that userspace can use it.

Document the control in
Documentation/userspace-api/media/drivers/qcom-iris.rst and add both
files to the Qualcomm iris MAINTAINERS entry.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/qcom-iris.rst      | 28 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 ++
 include/uapi/linux/media/qcom/iris-config.h        | 15 ++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 8d2c489b8453..66cb9773bd4b 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -37,6 +37,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	max2175
 	npcm-video
 	omap3isp-uapi
+	qcom-iris
 	thp7312
 	uvcvideo
 	vgxy61
diff --git a/Documentation/userspace-api/media/drivers/qcom-iris.rst b/Documentation/userspace-api/media/drivers/qcom-iris.rst
new file mode 100644
index 000000000000..49f70ef49d6c
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/qcom-iris.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Qualcomm Iris video driver
+==========================
+
+The Qualcomm Iris video driver implements the following driver-specific
+control.
+
+Driver-specific Controls
+------------------------
+
+``V4L2_CID_QCOM_MBR_RATE_CONTROL (boolean)``
+    MBR Rate Control is a VBR Rate Control mode optimized for
+    surveillance video content, which has high temporal correlation
+    due to static camera positions. This Rate Control smartly identifies
+    key-frames in the scene, and allocates more bits to them to improve
+    the coding efficiency by taking advantage of high temporal
+    correlation in surveillance videos.
+
+    .. flat-table::
+        :header-rows:  0
+        :stub-columns: 0
+        :widths:       1 4
+
+        * - ``0``
+          - MBR Rate Control is disabled (default).
+        * - ``1``
+          - MBR Rate Control is enabled.
diff --git a/MAINTAINERS b/MAINTAINERS
index 760791e3635f..f28f235f5cb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22599,7 +22599,9 @@ L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
+F:	Documentation/userspace-api/media/drivers/qcom-iris.rst
 F:	drivers/media/platform/qcom/iris/
+F:	include/uapi/linux/media/qcom/iris-config.h
 
 QUALCOMM MIPI CSI2 PHY DRIVER
 M:	Bryan O'Donoghue <bod@kernel.org>
diff --git a/include/uapi/linux/media/qcom/iris-config.h b/include/uapi/linux/media/qcom/iris-config.h
new file mode 100644
index 000000000000..0551b61aa06c
--- /dev/null
+++ b/include/uapi/linux/media/qcom/iris-config.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm Iris Video Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __UAPI_QCOM_IRIS_CONFIG_H
+#define __UAPI_QCOM_IRIS_CONFIG_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_QCOM_MBR_RATE_CONTROL	(V4L2_CID_USER_QCOM_IRIS_BASE + 0x0)
+
+#endif /* __UAPI_QCOM_IRIS_CONFIG_H */

-- 
2.34.1

