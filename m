Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBD33FF1D0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326022; cv=none; b=tuGiPrpzl/4a+1Nf+H0DpmO06N/GMBGiz/pemNe5pPypjvsrwwa2zt2cnZqbwqn7HUY0l/8a7MMuXfIdC0H1yQJR2Wlh/dejI8HSTCoNvcYRpSUV83D+YwKOeM8ydlXn3Zu2PphHbDEJDNxWJfNJIxI81Ce5VfP8gey+0uSqcJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326022; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7fPVdma8wLTZuqZwrBZ1yX65QCYqDq7ssg5R3BvBfLRhi3o3s8aF6tVOLUSi/NDmjVNnluewW5ZstO9ATOA5wO7YZEPKBqrACM5ZeKeizCRqk4htzPVhz84fx8oYCi24lanqDYoJvLwaToqtogI1MEIugph2ifdvXtcMvrcVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ox+TPQ4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua0mOtIi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ox+TPQ4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua0mOtIi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YVYL3736790
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=Ox+TPQ4Ic/Vkj/LiIilebPImI2s
	OCUTYvJLAE/64M6JYrWbQOyLJ7eFI/03p9DjfB1ibi7Z68F9ShjHa5MRlE5va0a9
	3jpYrph1daX1rC9NcawOYbfTY2NYG23rBYcmC+Wue9Ci9oLXL0smkJlbYGGkopYe
	hsHaMbCB8qt76k9RuPnzcx4RYYTXfnvZlFk3BpXvDzaGyRv107CobCbybUKzh9rC
	PQ9uOQURmJx/uQ8pAw76bWb5pj6uwfk0/zXHP33t0L6mUAbbKVUJl50bp5L3dGA2
	Gy2qJ3FkvO2Izxpa+F1U5ZOASyjyX/GvxJT8VtEqAiu/wvVSHfmEAMTQeUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e3d63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so123305285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326008; x=1790930808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=Ua0mOtIiZPvM3YgLgGpi8pZ3NTRuXLJ+BOgiI0mdCugxV3M6i6Osi3SgbxXjPw+me9
         4W8cJzI8+rLSGPomAlorxgOjkadtJ/sok0upb4F+4uLnWbqBuO7HjvEPjm+/L2KY5O2m
         P5vXLUeGOXF1n82J4YrkY+JX8GO3hy1zrWhBjGjaLtlneXECOijdXjAeqfosZRiW/U69
         gaLlV3w7mwJQzzJXNrhk3njd48zBkBGa9zUx87GoZOjuI9kVhi4jJR+JMnwLh6hCkKT9
         hP0qNvrgq+RPV1X5L4XmbUv14fteRBLF/BG8ihP0g2gaFsYBNKgacrsooGBEcfWzdwao
         FuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326008; x=1790930808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=g/uumkmqIh5RNX2c++31YQTSnG4IRdksI8Fkp4+xUYUbuozHsmLMo2Y+WayAGwAGw2
         YNIknMVM15swi5BBeRs4VtFd17utYlwHHemErdE4ItEj9gPlDR3dGidNOHwWsxmKDMLp
         BK6NIm9UghlH6bQ46aautndaUy3tbD1f0pJwV86vQ5SWft9XoS9IWJKa/yTaU3B6kslF
         mBuY4KbaP9bWBa3zjWe8og51jdOcVNNrmyF7dNTGjXESe+NiumllNkFnU5abZ1LPuddf
         VgaTUDHAKF2HjZzw3YNt5KazR7T5yN2G7PRobkhNbvZk0exdk5ZulcIQzeSCgTy/K+to
         vxlw==
X-Forwarded-Encrypted: i=1; AKwUvByzg6Rd/Dpei7aKPGhxHd54FFtg6SBYzpKAyBMA3gRACO9+2zE5i6GFbXmOBZlexUn5u/VaT0MFq+kkZGw=@vger.kernel.org
X-Gm-Message-State: AFuF++n8tvDK6vriw+nu7MYQTWgEebNMuyIe4RYonoV7Vy5EyxQVhlsH
	kBtixveSXsKRL0uhh1QX03Pf6zBM45I3QlDvMrt6Du+fc0tmJGI3nDqpHf9ypQZAZX8368MNLI5
	cd+BL5hnj10zBeqiTe+/HsTXJSoCycM3jQmQ+AVpu+9W8anavuTL+vBvofrnx8/cHcJg=
X-Gm-Gg: AYBFou3fF/W5IYlWJkM0zEiD8PmVaYF2/5tOxfXPJqyF8fPi5TZAvFrx8xJ95GWScJb
	fPSU1ZdUo9f4lSZS3bZR/hSWy53zpDaH2mAdRM1HYDhwXPU+ahcV3XCNvSqtyjp8pDTzZ/lZrCR
	CtX0Ph1nRbDv4hlxl+tMYz/jv678emwLAfL5bNzNN4w/9uRVZX1LRjarISOiUnqPRYuLkZGt1Y7
	8MFYWxpIYCCKFP8bvFDuFHb68+w1KeJddo0DzHUFBxB1+2J1GtGS+zZXkZYP2Q8YuzFuX/D7Zqe
	BpnxKguS9/QRwmrYq0XSFnTa6J/1QKD/+J/YNEOtwEeK7+lgeX2XOtFWyVIALbRopZ11N4qpPjb
	eEPN54gfc/Zxm
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325646685a.15.1790326008341;
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325644585a.15.1790326007881;
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:32 +0100
Message-ID: <20260925084635.112399-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX2fcNcoJ4OOpy
 OyNMBNQEHdmKd/5PWMBgTpEsp3nvi+uxyoLgUiTxtr/S9gl5NJ10FRW6IgmPYSO9y0APljCpGav
 AKSxr3rfH1+D9s+rew8DLSDJjmCJX9UelYJdVB+tsICLF1N0OYLsLkd/E5IvLIkYMSSAPFSXF3v
 vPjQHT+soYUNGwWdFFOj5Sv38JwY0i5onwevmqCoj9JoGDhUNKG+4OotgUMyDhhB+e02LtmsmqB
 9pIY7Q46RFkuRPwF1kY/FFoFDUkiEaXOTDTpSc8VccK4MkP1wwD1UwdT1zhWLoGzPbdRqK1zMPk
 rggFWGJbDhJRxanU5+CXQ+tJcguzNcdQqSLo2ui2ZN31GXJSFJFBHjKhZXzd99s6WEGuFoy1taG
 VdjIFKMcQb++HyAP7ZiGwj3ZLYmTMY7kMJyhKicnBNZko4nAas5A6MhdsQRbSuGzDPWfzBrR9jL
 P4ckAyjaspDabyE8nGQ==
X-Proofpoint-GUID: Nid7uQQAsbkbgmNYMLxfy3ZzupQkQ5U_
X-Proofpoint-ORIG-GUID: Nid7uQQAsbkbgmNYMLxfy3ZzupQkQ5U_
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab634f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX8IXbJjZ6AxTp
 CTKTcGT4yxkoAZQN9BLWmtlFpng32X0wsOOsCdGlfYnYeEcL6TlSnB/R5U2S9xOm4ghDWZz7n5Q
 X9cZ4WFqQsIaLPqPthZUB+5A1lmOHnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 50 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 16 ++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
new file mode 100644
index 000000000000..c047c0174a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on Glymur
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on Glymur.
+
+  See also:
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-lpassaudiocc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,glymur-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

