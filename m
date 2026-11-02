Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618273;
	b=Ei0/lEef9b4fVIWd5kyQM2T5lOxWhNFwGPqd2RrW0C5YI6RY7Ov4tn5KI26x5R4/KMHl
	 GqPklouxmo8xuhByXP8oQPHbz4o8xc2v8yIPOVH8rLIjxiraNs+bgpmXjXZpJjTxLPKfL
	 +i9gIDPpyIItn4uP5pIps3wmjC3udFwAtC/qYIRrwgfn2RMomJcxtQneuWC0P7D+djpJr
	 xD+Y783GGFkmqZS4PLF3WL0sZhbZoWBz/JzXqHD5nvRttvE/U6LKY+xbQBFSP1rsAdJb9
	 6e5CvKHxurwmUy8Gslg0aii0fKS8k+u/4SD1wpyw3Wr6IvQm4DYzQ29LvJ6vzR2VrOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=Zd8AYL/ggMrsy/mGFMd9Nw2HalwdV0/eEgxU7/yzFvLcIjyyap6XzGn5kkzl92ABD9L4
	 2CVybh1iyzAWSiA8u7p1J5uEyJ16As1cSZacINUH96F/p5KELKRN/CKjdfS0atCXvyjEh
	 jLob04bzWlEs2wrMMBWKjHGmQmAR3IOCWgsk1lr22SCIKxZqfeaD/GkpvsWTDCwJJRwXC
	 G2v8oTYvJNs+idFnCDM8jXvakk/r90L3wGRLpPdkGmTMf7hSd5MF+cpG0+G9Zgc+B+jQY
	 V1UqB2DnKiyF+fKmb34Hw8pkabZXML+9WDoASH0lJerEVng0dApsT8qUwsCwTCMBYFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPpSuRlX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkdvSISR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B97606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B97606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPpSuRlX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkdvSISR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AM2c1821213
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=NPpSuRlXxddOHdI7fttzpZFA9fe
	0M51XwzH1AcMfO9hmt5MFhtqTPjan6HaTaVSykGgZcf8M/3yQeh8WlakFtxhgxtm
	wdzET/aRt/8a4s6AbL6fpQ7sJOJcZw1PBPHpJ5iWkquM8I/7TgvBJ7RH5OpO2uCI
	8MPTErBhYHK1bb8si9IL7K+//Ue/u37N9a2yIGxIh0ggtT+fU8K0K4w1n2R2DIG9
	ahJnUCdDbpP3JQ8IjBNCKNCCmZLHoOCNhIWE331T6tufhZ1ECFbZLhD4Uha84BVX
	Eyt4eC9SROAP8w7PteKHx4J7hyFmhKIaJU0okcLC250xCUpRjXVZj4WmWvg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hdcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:17:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5741660eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618271; x=1794223071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=kkdvSISRCasBYcLoKVAjp5C2F11QyxqaQbGsZNXHUMpiFFKSMnYwryD1l3obVSwife
         pkQsbM5zS4rzO34p354OUmnwueyadMxHCF/6b+EdnM8Pe+RyBEySFnstqPRh3NozFKmf
         zp1lT2Q2X+jz9eJlt8LhpvmBlSE7/mnnzhGVBUUTlYWRz09jcY3Zf2qZEJ71XcAF7Y/e
         xLaVtAc3El76XSLVMF9LWg5QKFA4+3r4PPaiykuuTHNh4azYLUbB66OYNbBB+rrAtckV
         BCbalAEUiyzKLTgH632NA325fSJSaqWCf1mLIejL3skI5KBdfghizsnIcxptFAtcaWMV
         tKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618271; x=1794223071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=g+eYA8Iv03WcA+ns1rVHh70NNTvAovqYfbKoL/Wzl0e4FNNEaS4Gr3MaX5C61zmx0r
         S/Ksm7QiNtn0YGxIOtXUDVEjP4mYBF7yjpA0gCfd539+RE4JeYWrE8ZubdiTlgHx2rNO
         Ul7+C2uBNKHKTEJFe+0VgPzPh7UR72riSQeebjRu0ZtJJvhwe8ZxW+l1zS63wJb5EqJ+
         5BfeKcqznjXVMPfqWtsj7DPC/IDGXtJMrAkCt6BNoxyT928tctvoYvB90k2rzo4PmaMI
         YOhtTgbhd6NEOOjKV8upF4EJrW2UHlhVENzwYuERNHIIxPX+fxEc8W7XwT4RdF6lCHH4
         I7uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMcqByhhGgeALAR/j6jObIpAlanvHltaJK0lV0ULM0yw3YLCFvoql/nsk4Q1Vh1y58Zzf4AKKExUT6hbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uR/Jq9YmVXa5KJtnViGEmLVz3nMVr6dVRSzhJ+rxglauaUrP+
	HRHZf7CrrXO/EtD35AZ0sy91WxVDV0MEqGtC+xTlLv/UVVU3lheo4Rzs6G4VamU92e9RSq9pWtr
	rLp3Ty+OVQVCugbcvaieHikzdM+42OW4ivq/uuzZzHS+0o1N9h5cHEw0N8zXbuRnUQJA=
X-Gm-Gg: AYBFou0+jcltnXr3ZHm4AsHxQPhWFZexWwMiQ/L2mQbdG5CgpocjnKlwwN/ceesFyF4
	kadf9QpDqqg+/x/zRB8vsShqPRREFs/ka/QRzWSz/v5TTa1EExDDqC7Ajd3EHzBcTDJ/U6sa3Uh
	8JE2itKdxe2GOuGt/8QHFSGQC/0HUSrbzjllq5msUBF966fix/Xso/Ei21ZKqlIRGVExYRxm2i4
	vLg1Khb6RHEn72gnFAaHCY4Yfkqo/VB9ZYTu2UeKKemEL6mYs/raKySLSWtnUMhiFH4hDGYbx5/
	xSNutbDKfZzmTUtn3pmto6gl1RkohV+pBosh9IaH5iSL/pjNTEXZCDP8lMf2qGEe/G6CtaCoT5S
	6H6e9RQmXdXUOFq5m9as7Lgsul2Oot/H1ZVw02nY8pk8sbmF25Fq1c0PFFMSlccFQAshcQUZwDc
	2hNAVcLKl9UgxFg9AIasBvZCnGSg4DAWFR
X-Received: by 2002:a05:7300:4f24:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a422224d1mr13572830eec.2.1793618271195;
        Mon, 02 Nov 2026 03:17:51 -0800 (PST)
X-Received: by 2002:a05:7300:4f24:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a422224d1mr13572778eec.2.1793618270533;
        Mon, 02 Nov 2026 03:17:50 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:50 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Mon,  2 Nov 2026 19:17:30 +0800
Message-ID: <20261102111732.1678646-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
References: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CUmQKRp3GH6Jo3J-xJjhc2hFy2kz9CO0
X-Proofpoint-GUID: CUmQKRp3GH6Jo3J-xJjhc2hFy2kz9CO0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX17DpNzKNmPe0
 jZRZQ1ikvwsMT2g7ff3fF93rUmQv+aIxCatJyjuRk5ePCsQ/+5XZZtJHMkwCzjYiPlHSYsSFoOk
 ZALnrKQlUXbcg6R3s/+WMRbFMF6sFXQ=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae87160 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX2KmQUGDewRZl
 kTOfxE4n86lAQsKHJ33E+vSAQmt7IiYnESh3g5dzY5QpKBlzV1uxAgD9CSFw1VoM4O77F6L3MFs
 gQTm4cf+P2idDhA8g3erta7BocU2t6QEhvUnokrrz6RWnA8NrfWIAolisKZLMrKrjh75EKjSoCe
 BskBmB4KuUxK+aAs+e8RojQWEg+oqJ/N0sL7mG7BhC9pAHTzT7vCUqTdTKwwyIR1b+OCs8YKtGW
 UmFHCcmvR2Re2w9Kup734cWRpIvufE3EhlqWfgxzVo04HtbemhtsT7U0nwQ2pNHo6QJd82GUAh1
 0w//Jlr3NmN9gUoRA44HFFK/hxz7g+me4eoEGlOYlRdi3EAaQDWticZRfM6ETGM/rqlTMNa2dlj
 +JSYh0tcz2lCANpCIcUUy+riAx4S2ddxqWmp/ZEVdG/4vZAd4fX4PyLB2KTZL4FJTfpvYp24TTe
 dAIh5he5h0p7C7ahiLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
new file mode 100644
index 000000000000..09f2e964d3ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb15201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi FUSB15201 dual-port Type-C and Power Delivery controller
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
+  controller. It runs the Type-C state machine and the Power Delivery policy
+  engine on an integrated microcontroller, so the host is not involved in
+  Power Delivery messaging. Over I2C it reports the attach state, CC
+  orientation, data and power roles, faults and the VBUS voltage of each of
+  its two ports, and accepts commands to initiate data and power role swaps.
+
+  The two ports are described as connector child nodes, addressed 0 for port A
+  and 1 for port B. A board that wires up only one of the two ports describes
+  only the corresponding connector.
+
+properties:
+  compatible:
+    const: onnn,fusb15201
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line shared by both ports, driven by the I2C_INT pin. The pin
+      is active low and stays asserted until every pending interrupt has been
+      cleared, so it has to be described as level triggered.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      reg:
+        maximum: 1
+        description:
+          0 for port A, 1 for port B.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required: [connector@0]
+  - required: [connector@1]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@50 {
+            compatible = "onnn,fusb15201";
+            reg = <0x50>;
+            interrupts-extended = <&pmic_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C0";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C1";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

