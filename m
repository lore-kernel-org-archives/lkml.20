Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3049B5A9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102706; cv=none; b=gTfCTfIczuAm1z7MfOI9unSm4Vuh9EifYqYnZNsT4rQ+I2SjqTDYi2v/a8vuIcy62+gs8aFEVYILGIpAtONeQVWio2p1047O2noPEL3e5lwI+ih8cEjNursQJ1iFgIUiHwOPBJFzVlWLf6y+Rxf8oRpbaSpT4H0ncmwFO800EVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102706; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbdHQjdo+IkC/kESTYEip8eGhWHAo4KIKwhAVGs1n1vzm8+lp66yG1BuDRk+7JacKz+pR9MfPagFUPbigcIaBhpQ419IsOGxS/PTYEl6K8wx5zzgx3GiOErfR9AwTEZvqkcN+ly5xZSD1rym8yKNdLxBVf7fu7Fk2wP3N8CGl6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcUTCa7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpMbZQfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcUTCa7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpMbZQfR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI79gu1024450
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=GcUTCa7WMBRAxkM02u7jMbe4Gm5
	IpD/y8+Oooxl1hXB3OvclsuIxpkS+ZuCr2dR3eTWIfCS1nBlcXxjtxig/Y3QeknA
	qeOHU1zHot0Q1Iq6Q8lkSa6VjVAhDu48jeMQRjDHTzxZCP650MMS3j6SXJYpgwAK
	N7MgghTXLHbhHDioBHo5XFn6uBbPuzFCekL5oekdzzfTFTE2yTDvkztAoq/fpwB0
	qqycz0BLCXj3x9ZnffoH/Gp0d/ne+kG5q85rEnvlGNZpIVc31+ZAKNJ/eHs42vH6
	xz0EMa2aIbMj2C7fwJf0cqQftcuHgZTuBQuQf5hLlf2xNZptkP25DYXN4Rg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjbuq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:44:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb8d1b032so77543241.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102699; x=1790707499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=bpMbZQfRm4Q2zrH9YFZ3XApmB2i2BrYuL0DgpfjDIIjAkpp5WCwAaEE5+i76AwlOHi
         YZKFyqdrR5W33h9gvnPSD1AuitWQ30rL15aNrddG85BrJcHNAG0fVyYJO05pExBofEfm
         UarZOs2pnS48GqlS/jE6RvTClTlPSGXD9k3nyuE7bKNvU0XInPtB2YBJEOSuVQMkC1Om
         Qq1JXLOFKCxlaxnH3r67XW1WzqbqN8Yo35TieCuZr92+Hw+1+t0kvI6993Vlxhas9XGK
         VQ8zwjtCL0OcGOdDxdV/zZMFGVuXRjyBw1/QTRSLZPclusInkL6CpRbCaTWo/4SdlBzo
         tBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102699; x=1790707499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=s+v5fV3oChoFdAkonNt7pu32TVPgQgBZHFeGzpp9zSUT6JTIz/8JFNC+ZoD0aFxtvw
         xNN4l2DO+JP5lcduWC0xqpmoWB+RK30Pk3Oua28txUkkyykKGJZuYzstP6rED9LLip2k
         hvpZAX8Iddzx1LpgMQEfUdCDucZAPL0BmPvlTSJySN83mwImau4dW07fYXvpMCgpyLjg
         1xDQc26OXYZ+jj36sV0n9iPCPsL8Q8XrsnCMKechVtp9uDMdwYUIZhvR3raCciMK57rc
         62Kmh/y0I0CaO7w7aBpYzYhTPrXxQPASpkFrjkERi2zu77/xXxG3A5Kaj9C/J92au72i
         xglA==
X-Forwarded-Encrypted: i=1; AKwUvBx2pPKXS/+SlV5W1Dnl+ihaPEzRivxfexSbzrglaT/z/UK38zCBUwMD9ByH4qVRmosTskgMi/sBkO6ZMTc=@vger.kernel.org
X-Gm-Message-State: AFuF++lRK9M1S7eHXOeDYQBmVq1LeTlY3dIpRAIVbOy2qZ3PJKYcfCia
	91cayrMkrmLBOnO50/RDuqpdVTVPJiG6PoYYG8X0ynl06a9yPd2TJF7uIrpTptHuwFOn2deQ3MS
	bBfu3CHIZPjMA24H7DHHudDQS2PpRuF8zvUv993ZkZiwJVci/Hn8hrySKAhUwVDtAdvg=
X-Gm-Gg: AYBFou0daNl46fOsFeLaORV2Z5Mj7CXp9SSOF0wBtCM5wRg6+gu+Smu1DgGqteffPFW
	uY78Gfgmh3S+r/izaD/BRIfy5ilPHgsKh2w9lZvDh6EmwKwZT8pm+NHqNjFVK9tZuDBEnpr6aBh
	QW6c2g/wcts9AQxQL8ZpnnoWk7oN/F7zLopdW1oMJRtAsb4/H8k9XRymnlO17/ofc5jR0TKCAbr
	MXHqoIMIFs6APXEhUYvZ+VbfexnuMB5HuxPLu8Z03vBKuZRe3enPnUqDu8eOjnASBShk4qQ33L6
	8m48hsTxQznUXJBAfMDHJ3imgOkwg0R5jpb3dY/3Ntvb+8JVh/NyE51LUl3fWXOoURKDXuzX4gZ
	CAEEZZLhieMsU+W/iGKjxSKMRCE9MWlSZ9s9xphfGzqqemq7yng==
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5c9f1655c76mr762260e0c.15.1790102698777;
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5c9f1655c76mr762241e0c.15.1790102698356;
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Tue, 22 Sep 2026 19:44:22 +0100
Message-ID: <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gX8CvGP_-FQWxtXP53FovtHDmk8XIl--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfXyqbtklTBgT2W
 J9zhv2w1d6k+LB+Xbe0eCc4clKcUP5KdQgzQhr7n6rDbqvLagWcxHH765ttNRX1Y0L0kJAVkny+
 UwMEDSlUZ4ymaeIml3K1ObWLy3srtsEBpjHdX3RZ5rhclBcSAFInJf5X/zDIfY6JoKcCsnCS7E1
 d8RraWHWlqTcIGK+9pOIJZELG8IuvoxZaokeoB+PcmUn2USH0IhDr+NDC5Rc4TGf0DlzXOt8Tei
 oaVo30YhLr4YdzuK2gRce19mP5XeAxpwPmw1EKaSfdJdn25Q73UCii77lmxAgm2SxQYajmkG+s7
 FS68A8GPkA23qzPmzjoFi96J6Hc6IKllsibEF1kRYKUMEu7a+JZ2VK1WVCTXc6k4q+qU03OTZ7F
 h0DaGuVp95pu4iwpm3zv5MV92434XcE8iAHKX8YUWtn6AbcHxiNzFgXHw8I9q2ZmPL5tk/EQNCo
 ZXrPo/F42Ht/t7ekRqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX+1LdpyjB2I+M
 JA51WygcBigFR04DaVybqRRt6RauFHHZJ7VLM/NroFTZ8PyzVxPWdcbE7837lygzyvBhQVbvbMp
 Yh7VQchlp12W7Jx/OEho3wXigxLJdWs=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2ccab cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=TOPH6uDL9cOC6tEoww4z:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: gX8CvGP_-FQWxtXP53FovtHDmk8XIl--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

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

