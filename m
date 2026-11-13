Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548055;
	b=x8yT3lCfpMtpRh3yaHFVyXH8wE8vi/xC+fHgmCuxAKXld/m0MVR40P2PFp0VvxCtCs4m
	 z1RpbHWInQV40B3JoDWeSehLwzlraLQn6TkW1CJ/5Mm9HN0j7q3u+cUu1qmLAkuJyWHVK
	 5FYfe6HB4Oha++bI25T7aE7MUXnj7m5+jfXMwp3FhfJu1fsyGnW2n5byDeonhQjbGsdlQ
	 81frAFAtFSMijsW2heNSjapRT/w5l5oHHR6+ApBoZfLZWoD2DPH0Lyh+Vgm8/Y0o3S3E5
	 dnCGksL6zAQx4ARed+j9PZfkrtrRqhoMfsEakP0MqxP8HMojwXvx1RSBsGNc2FJHJ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pHGXCMeIzOzJb2KpC2zqe2v127sOnmxPddIeUtwGrCw=;
	b=m1Uaij/XcaAN06ctmIX2lb1uOKrWwETUwsr7Gfhc99Hues2aE2wNRncm2WZ5iF2Gf/K8
	 ED8Ok0SbqKeLvVu20/Nf0DLErFdVhEuINDhJJzGwLMIMpPD9CIY+jdF+SBUd2aWsYx/le
	 rLgkyf6QVlvGUBZDovH5Xe2dh7PGuLduZCMM/JiIoKEF7AdXJ5eM6RfXufxMbQols9yj5
	 8uz29OES2fIEhxBj54n67NduwCmkr+n9W6QzTANuN9OZqkVbZYpPth2kaEafKWr4lW0Wx
	 0I1Ag4uFAU3h61veCINSxSu6JULvjhHwbst9xgJZL/Xogm7kLLMrri1WR4DZAcE1zcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X9qJ/LZ4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbmZwKPJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799660A6F59
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4799660A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X9qJ/LZ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbmZwKPJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57BxB1631358
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHGXCMeIzOzJb2KpC2zqe2v127sOnmxPddIeUtwGrCw=; b=X9qJ/LZ4FGs4u5B/
	ywwGxiwLRQuK3m0RFRCwqfpOCF7rdtSszj5ohIi9cZ3QioBdBXTmyaYlzkVv/QEe
	pOuBLGgXlYFPKYtp5rpzT0FgWQ/MCZr9NcX4Uf1o4W8qFcg5WOrj5QmyzQGRUX2x
	oEMZcWBmh4Ux0PoF4JxdfZxBGyPlw1Po8XOJUCpK5KHmZLX/vZOz3iq2gy67g+/R
	LP0YorB8sUW4BkyaE/6fOZHdW2yAp3n7lAliWUrhrNadUkaYGvv+47Kae84tK/8K
	+A+wScYbQcD2IUzgmeTfcmFaKQt7FrXD3CsS6FeCQ1nL1/b7FlmrudWESZFGW8BW
	Sc+fnA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c8hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:13 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6f4d828b9eeso427670eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548052; x=1795152852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHGXCMeIzOzJb2KpC2zqe2v127sOnmxPddIeUtwGrCw=;
        b=bbmZwKPJMetpboUJynTpr3ru9DSpn943oBkyH0EKZm4WnAe2Le/P5Hl3eMtTfdCQxL
         TvqDoMulMirYGhfEKiU+xlVfQoZWwWlgnrOVmFt+1elg7hZETZ8jhub2hxy1u5JbudiF
         rO54lmLfPqCyebDUTtb8TpzYllxaxF6dBl3p96bkNWXSI4ZqsQzddgERDWO9n9m+zVAy
         r3AJJdgfCEuLTuwZD7/C+SPDZPkjwpTthV6f6fzJ7gt5E2ckIczd8H11cYwOZs/yUPQq
         s7d+RMt1MqsdFAIFnJeT3OrHU/2qEo2npRTypVOKnq6WerJ13U7i0K6K8UxU7WMWEmGO
         /FlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548052; x=1795152852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHGXCMeIzOzJb2KpC2zqe2v127sOnmxPddIeUtwGrCw=;
        b=eDut6n9mnqAH1Ac1AcauOtNJtzGTw4bldxEM7lGeeIdZjalevzvaGmZ5yuhqaND6Io
         Az/7dWo7uL+99WunTmdjCQbokveoUkKzMnobC3eY8HcKu5U8JqwwmTjFlOhbSSsflxLh
         pNZpUFJFAF6a3h9N4hqfUHv9Uwl4+SzunE6VoQim8fR5mI3g+ya94/XVvIKOROc+xVCl
         FAQJaa9Bji/sRoeqTzKcK0uAD/vUK45w8VA9MJQa7F3MGq7RqXiIbULejMCglzjsiQSd
         Drb5DXnUMjZI6E4kYljSM0LlMLkFEVGbQ7ncojljWQ7DNvZ5p8bkWfonfRJQDX8lUjRH
         jD5g==
X-Forwarded-Encrypted: i=1; AL+hErHG0ezbMlJ5/JVd2VdkyPGSd8s1d4yPY8np8GdFVB1p+oWNzB4DY7BaQM9aRMex/h6ii+lBI739kE17/Kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bE/dNBTvuQ5XTFK8gr7Iu89A5wm04q4TH/6iOQflLEw5G3p4m
	51aDOPr8Dn+7TzfqUg8xVSi6oTdn33VfPKY5WKjNkRf7MpZVr5gWBfTW2SjIBiZzxGwk1+i0YOC
	a0ppmaX7J2Td4GSEOVkCV++dToO/ZKyLV1y0QDYk1gQjesFod3Fva4dQL19dhzpfjbkU=
X-Gm-Gg: AYBFou1ZhDMDTjR+eGUQLTF3Xk0IahobZOafX8uL5YEz7MWgmCE+gCf1sJYAM9xcI+B
	LAqKPHjuaUD51ytNDq1UB3GGPnEHEDcN59yfvK8EgEL4DJyMVyqYUeMR9qsla8klQ7c3FjCXT8R
	yC8kgGGffOlL0Q5al0+eY0S+bajgRu8eudN9XDsRrEmrqlzy8kOGkl7mXwSw3fvRQNb8ME7XQvj
	8HPTwchO/TVQttjQRiwyr+ozyZIWN3vl+HWcGq7kEZ1VWpzcON3Ir/tQHDbgrJSNpAe/7FvtR01
	Fhc76CkuLw0rl+WGPApPhLHJP2uxBD+Tot0a49bRRS1WnskJIanta2G60wnMFqH18O6vd4+4EWY
	I4lAGjVJyrmqM2CT7MurJ+Kj8jQV6uCMLSwSXpABumXHfYhNrHncLeSq5sGTrGSKVc4x58j9jRd
	vQRzCPjeXHLsTlAuexhZFQs7qxK3OxIEuseN+7KHzjDeKzCrnpJUwKYwbwP4bO
X-Received: by 2002:a05:6820:3386:10b0:702:f890:e11b with SMTP id 006d021491bc7-71ab504094fmr611431eaf.16.1794548052182;
        Thu, 12 Nov 2026 21:34:12 -0800 (PST)
X-Received: by 2002:a05:6820:3386:10b0:702:f890:e11b with SMTP id 006d021491bc7-71ab504094fmr611411eaf.16.1794548051626;
        Thu, 12 Nov 2026 21:34:11 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:10 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:41 -0800
Subject: [PATCH v25 09/15] media: qcom: camss: csid: Add support for CSID
 1080
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
Message-Id: <20261112-kaanapali-camss-v25-9-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX8jXL88F1sxFP
 Qz9asEsxpgQ5pJoz8hfcFNT2EOWGfgsK7EoAsZITdu/aqF4Z1T5+8ARdheyordMskm4L9eMchBZ
 QJ1J7T/XKETgVCXTeloqdptrj2PyMs4mEzQMzNx2LKLgx+v/UC0UiIaaN6XespD7BOWiB7QFC6b
 0OQNdx2GOwXEzUM64fe5fbbYpxnwI0y2UVgqDntOSo1acWhakfByp15hT/JWKZX2xe4sB5nQKEa
 Enzek0HkLNv/JBO7KK5AtIXTFTqrpV/ay3PsTCZXL1rIy4Tuyo2SHblLxKK+z9G2Y1C/XkqnLxM
 x3sxYN2yPnv0Dzhvq8mbdWYL/cKzC1dKn/43OgKCikVHNvqaDqNGcq3PW7+lprxEUecaV7O9/YV
 q1j6TLE3nT3qE5+/7lj60VtVCY5O0By6En8Y+Mu/4DPqHjTvu0pd+Q7CNfVQHv8/8XQXw7vqyVl
 16qAov0UMN7A7EAjt9A==
X-Proofpoint-GUID: Zj_SCWdFRsHnwDxWedlQLzvlt2m6vvFU
X-Proofpoint-ORIG-GUID: Zj_SCWdFRsHnwDxWedlQLzvlt2m6vvFU
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6a155 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V5uz4Rz8kk7wrr954LsA:9
 a=4Q4zU7iZy6iiv8wZ:21 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX2CW9PXR4d7ET
 XaNCglDObGKcMh29r3yxDp/Zmh10gZMX0S4bAnvGbLi+u1DZP2H+KGzkSn1vPDbECTlK6ittrwU
 OJEEKcmIY6S54EJVx1FjWocs2Cjv6Rc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add support for the CSID 1080 hardware found on the Kaanapali SoC.

Introduce the CSID 1080 hardware resource descriptions and implement
the hardware-specific register programming, reset sequence, and
BUF_DONE interrupt handling.

CSID 1080 uses separate registers for RUP and AUP updates, with a SET
register used to commit them. Extend the CSID interface to support this
scheme while retaining the legacy combined reg_update mechanism.

Also define the INFO_INPUT_EOF and INFO_CAMIF_EOF bits in the per-RDI
IRQ status register alongside the existing SOF bits, as well as
TOP_IRQ_STATUS_RDI_OFFSET for RDI0 in the top-level IRQ registers.
These definitions are added for completeness and don't enable SOF or
EOF interrupts.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 402 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  72 ++++
 4 files changed, 477 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 27898b3cc7d3..218ba3a95939 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -8,6 +8,7 @@ qcom-camss-objs += \
 		camss-csid-4-7.o \
 		camss-csid-340.o \
 		camss-csid-680.o \
+		camss-csid-1080.o \
 		camss-csid-gen2.o \
 		camss-csid-gen3.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
new file mode 100644
index 000000000000..3d90d31201fa
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-1080.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen3.h"
+
+/* Reset and Command Registers */
+#define CSID_RST_CFG				0x108
+#define		RST_MODE				BIT(0)
+#define		RST_LOCATION				BIT(4)
+
+/* Reset and Command Registers */
+#define CSID_RST_CMD				0x10C
+#define		SELECT_HW_RST				BIT(0)
+#define		SELECT_IRQ_RST				BIT(2)
+#define CSID_IRQ_CMD				0x110
+#define		IRQ_CMD_CLEAR				BIT(0)
+
+/* Register Update Commands, RUP/AUP */
+#define CSID_RUP_CMD				0x114
+#define CSID_AUP_CMD				0x118
+#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
+#define CSID_RUP_AUP_CMD			0x11C
+#define		RUP_SET					BIT(0)
+#define		MUP					BIT(4)
+
+/* Top level interrupt registers */
+#define CSID_TOP_IRQ_STATUS			0x180
+#define CSID_TOP_IRQ_MASK			0x184
+#define CSID_TOP_IRQ_CLEAR			0x188
+#define		INFO_RST_DONE				BIT(0)
+#define		CSI2_RX_IRQ_STATUS			BIT(2)
+#define		BUF_DONE_IRQ_STATUS			BIT(3)
+#define		TOP_IRQ_STATUS_RDI_OFFSET		16
+
+/* Buffer done interrupt registers */
+#define CSID_BUF_DONE_IRQ_STATUS		0x1A0
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		16
+#define CSID_BUF_DONE_IRQ_MASK			0x1A4
+#define CSID_BUF_DONE_IRQ_CLEAR			0x1A8
+#define CSID_BUF_DONE_IRQ_SET			0x1AC
+
+/* CSI2 RX interrupt registers */
+#define CSID_CSI2_RX_IRQ_STATUS			0x1B0
+#define CSID_CSI2_RX_IRQ_MASK			0x1B4
+#define CSID_CSI2_RX_IRQ_CLEAR			0x1B8
+#define CSID_CSI2_RX_IRQ_SET			0x1BC
+
+/* CSI2 RX Configuration */
+#define CSID_CSI2_RX_CFG0			0x880
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
+#define CSID_CSI2_RX_CFG1			0x884
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
+#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
+
+#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)
+
+/* RDI Configuration */
+#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\
+					(0x3080 + 0x200 * (rdi)) :\
+					(0x5480 + 0x200 * (rdi)))
+#define		RDI_CFG0_RETIME_BS			BIT(5)
+#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
+#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
+#define		RDI_CFG0_DECODE_FORMAT			12
+#define		RDI_CFG0_DT				16
+#define		RDI_CFG0_VC				22
+#define		RDI_CFG0_EN				BIT(31)
+
+/* RDI Control and Configuration */
+#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) ?\
+					(0x3088 + 0x200 * (rdi)) :\
+					(0x5488 + 0x200 * (rdi)))
+#define		RDI_CTRL_START_CMD			BIT(0)
+
+#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) ?\
+					(0x3094 + 0x200 * (rdi)) :\
+					(0x5494 + 0x200 * (rdi)))
+#define		RDI_CFG1_DROP_H_EN			BIT(5)
+#define		RDI_CFG1_DROP_V_EN			BIT(6)
+#define		RDI_CFG1_CROP_H_EN			BIT(7)
+#define		RDI_CFG1_CROP_V_EN			BIT(8)
+#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
+
+/* RDI Pixel Store Configuration */
+#define CSID_RDI_PIX_STORE_CFG0(rdi)	(0x5498 + 0x200 * (rdi))
+#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
+#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
+
+/* RDI IRQ Status in wrapper */
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0x224 + (0x10 * (rdi)))
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0x228 + (0x10 * (rdi)))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0x22C + (0x10 * (rdi)))
+#define		INFO_RUP_DONE				BIT(23)
+#define		INFO_INPUT_SOF				BIT(12)
+#define		INFO_INPUT_EOF				BIT(9)
+#define		INFO_CAMIF_SOF				BIT(4)
+#define		INFO_CAMIF_EOF				BIT(3)
+
+static void __csid_aup_rup_trigger(struct csid_device *csid)
+{
+	/* trigger SET in combined register */
+	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
+}
+
+static void __csid_addr_update(struct csid_device *csid, int port_id)
+{
+	csid->addr_update |= CSID_RUP_AUP_RDI(port_id);
+	writel(csid->addr_update, csid->base + CSID_AUP_CMD);
+
+	__csid_aup_rup_trigger(csid);
+}
+
+static void __csid_addr_update_clear(struct csid_device *csid, int port_id)
+{
+	csid->addr_update &= ~CSID_RUP_AUP_RDI(port_id);
+}
+
+static void __csid_reg_update(struct csid_device *csid, int port_id)
+{
+	csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
+	writel(csid->reg_update, csid->base + CSID_RUP_CMD);
+
+	__csid_aup_rup_trigger(csid);
+}
+
+static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
+{
+	csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
+}
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy)
+{
+	u8 lane_cnt = phy->lane_cnt;
+	int val;
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
+{
+	int val;
+
+	if (vc > 3) {
+		val = readl(csid->base + CSID_CSI2_RX_CFG1);
+		val |= CSI2_RX_CFG1_VC_MODE;
+		writel(val, csid->base + CSID_CSI2_RX_CFG1);
+	}
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+
+	if (enable)
+		val = RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
+{
+	u32 val;
+
+	/*
+	 * Configure pixel store to allow absorption of hblanking or idle time.
+	 * This helps with horizontal crop and prevents line buffer conflicts.
+	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
+	 * and just enable the pixel store functionality.
+	 */
+	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+{
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u32 val;
+
+	/* Source pads matching RDI channels on hardware.
+	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
+	 */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = RDI_CFG0_TIMESTAMP_EN;
+	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
+	val |= RDI_CFG0_RETIME_BS;
+
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI;
+	writel(val, csid->base + CSID_RDI_CFG1(port));
+
+	/* Configure pixel store using dedicated register in 1080 */
+	if (!csid_is_lite(csid))
+		__csid_configure_rdi_pix_store(csid, port);
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_CTRL(port));
+
+	val = readl(csid->base + CSID_RDI_CFG0(port));
+
+	if (enable)
+		val |= RDI_CFG0_EN;
+
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i, k;
+
+	__csid_configure_rx(csid, &csid->phy);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rx_vc(csid, 0);
+
+			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
+				__csid_addr_update(csid, i);
+
+			__csid_reg_update(csid, i);
+
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	return 0;
+}
+
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear)
+{
+	if (is_clear)
+		__csid_reg_update_clear(csid, port_id);
+	else
+		__csid_reg_update(csid, port_id);
+}
+
+static void csid_subdev_addr_update(struct csid_device *csid, int port_id, bool is_clear)
+{
+	if (is_clear)
+		__csid_addr_update_clear(csid, port_id);
+	else
+		__csid_addr_update(csid, port_id);
+}
+
+/**
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val, buf_done_val;
+	u8 reset_done;
+	int i;
+
+	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+
+	reset_done = val & INFO_RST_DONE;
+
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (val & INFO_RUP_DONE) {
+				__csid_addr_update_clear(csid, i);
+				__csid_reg_update_clear(csid, i);
+			}
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+				camss_buf_done(csid->camss, csid->id, i);
+		}
+	}
+
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+
+	val = 0;
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			/*
+			 * Only need to clear buf done IRQ status here,
+			 * RUP done IRQ status will be cleared once isr
+			 * strobe generated by CSID_RST_CMD
+			 */
+			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
+		}
+	}
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	/* Clear all IRQ status with CLEAR bits set */
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	val = RST_LOCATION | RST_MODE;
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = SELECT_HW_RST | SELECT_IRQ_RST;
+	writel(val, csid->base + CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
+}
+
+const struct csid_hw_ops csid_ops_1080 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+	.addr_update = csid_subdev_addr_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 2f7e593defed..a3ab2a384bb4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -163,6 +163,7 @@ struct csid_device {
 	u32 irq;
 	char irq_name[30];
 	u32 reg_update;
+	u32 addr_update;
 	struct camss_clock *clock;
 	int nclocks;
 	struct regulator_bulk_data *supplies;
@@ -224,6 +225,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
+extern const struct csid_hw_ops csid_ops_1080;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_gen3;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 508fcecadb79..8a275d946f9c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,76 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csid_res_kaanapali[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5607,11 +5677,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csid_res = csid_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = 6,
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

