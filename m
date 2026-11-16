Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812933;
	b=c3+Ff37Nb/mejoouDc+WCbaAHE2aqSRs88uUwqhSgHRol0TBYb0M+hdiZLrHanvg5Pya
	 o9NFWrgOiompMy4We4X6wThE2vlgjda63zFk1VT91ZLPecOl+o9aBeUhETqgSVqxTuzho
	 8alZRZIafGRXTPZ8eWpUpqemkNLIgliX4rVu/+WV2v9b9WNt9wbXw1iM/R5sAUukpchVW
	 jj3sldRVoD+LI97S8Ea3F42d6JKGSZnPoLvdw1BbxIxelnLmk76ron9bBrnxeH+WHvJWX
	 cDKQW9K77BrxcFgZYRwONzidld/PhAD2GJYoo1Y6eiZqHu83ndH97JQ4+AlTMAQa91g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o3qN5tZBkITol3f6feQbbTIZa9RormwqtNgp1Ia5x6c=;
	b=nCRt/NbjcbZybeUKL8f4NYOnUCsyYM7iDS3zderJW5kr4K21XtkqWsc2Z6NUfAFC9CIh
	 sSm7lrunn07e8/6y7y6u/n9gOSz0OTvBsCPQ3FMpn5bVgeliXg1z/LgA0TbQ8sN6OskFG
	 e8tbi4FUjiRH91s7ReKerr1TO9U4UzLVF4kzb3QpvL4tnPPusfzOuWDLhOTfoavXCgDpG
	 ewQYaU0H+X2qHML6YmN9zxTo4tRUNPCvBtLn3IaK0BgaGPCHSkXsM0O75tY2ej2OPgzM6
	 ptA9a2lWNot8QAIEXlhvuU+EmTKeac0ICJCSw+lqCyYkuU9pHCAFOqRkfyyMUwZwWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CW033N34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbHZ+cnE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BBA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BBA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CW033N34;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbHZ+cnE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LdHW3839227
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3qN5tZBkITol3f6feQbbTIZa9RormwqtNgp1Ia5x6c=; b=CW033N34TCHMbCCq
	fb/UQF7pe68zjqe6SXKueuMXwPbNLsn9AAoGZYY46qATprEf6yu+jKVTIy1I/Qq1
	JYsgg+xMvmuMLewGruS/AQlAJCUPOhQmSbb8+jfHKjIetfsP1Nm8Z02CTMyxrEKt
	AX2wPkY8EHBO3UXmcOKlTlQczSoSSOpKXgGc25Rt8Y3FTcb848e9+1wuegGrCHJl
	GWJxLbs7z4dsRUf6ooJ44XFhDuTJ52jmKtvUW2p2zKdZp4otHqotEKEWCIBWkYLJ
	gqWTQbYvgOPBczxP8VUjhWM9HsShQrCazd9p8WK0vzML2TwXNZoO2VkuLGOW5+b9
	FHDOXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhn75j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so2950340a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812931; x=1795417731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3qN5tZBkITol3f6feQbbTIZa9RormwqtNgp1Ia5x6c=;
        b=VbHZ+cnEX/vmXU29bkSSR8wGZKYYWfe5Yzsf/F7CXjMIVFeuiPmnZ4RyitjBoilFtA
         aouE2HRWEH0FBd8BfIl5NJzK+tg6m2SrUK7iGqk8xEUkWr0AyyBmQqdFzWZ7PZ49708f
         078fcWA5K1nKCAvDBQT4eyU7NQ0DYm4btFOQ4VafUzXuY7UeOuZ1TUjLGJ4X8AhuPW8w
         i2rLI450fBJ89BCMnF24ZXir2IOD4/mFvx9Yv69c3cY/r1vqwbH4dHbgis5DffBpMpIJ
         dPCw4dqg7sJEB6avRDEZ+SKI/FIEA7VFxjd5FWZFWugJwfvemdccsVDT8nuBP9uKSeak
         z+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812931; x=1795417731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3qN5tZBkITol3f6feQbbTIZa9RormwqtNgp1Ia5x6c=;
        b=iF3C1/U3v4TndSXtLqmLKmkSfIoIoTdwlxeZa6RBR+YUH9hU2xcRA3ABuBsVG7VRZi
         eRzqOLOLgK8TcOwK7eQsaNW34sMB1QCaAEQAV4PMRJh0e4auD4XI/5BbD0yrVXM/x+ao
         1h+/oe6qTESxs4kppecdG+J8Q/h4iOChweMQZBto4Ih1mIQryGA9+XvvCcIPQAmhpNmA
         i0wTuoH5rmklA4mUhfkHALdsG1wdkF6m2VyFEhSwliJGUGRUD+nPRWnM7hBjNIbOyXri
         RgxTwtk1LaBOWbAct/OsJCa79ZcvWvbY4mTRuQqgG5pT+h3Ne3l3Rppm0PRxZ2UYtVSJ
         PAFw==
X-Forwarded-Encrypted: i=1; AL+hErGGVapaw/PjuKcCQSfmZZNASRXNFeAglLrSuYf/SOKlSAtFiDGX72eBkXoSYTUiRSR2lE/CBn/bD/a2Qk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PHxubDpplOA9Ih5eHQXOm11u0oaBPvx24XU1LE3vV9w21q9hI
	lL80YiWfCckjoJEtVlLeQwFL9EjYX+tjPFeyz2W6BaYTysZdPZFiJsWCOU/VgApEkqPCNR+qoXw
	oEm8FCEVUiK5jD2NViEHL6cJJgqyVJDrjz1y0BqMhSYraUSNf9sgi6e+k9tIMdPAA0ls=
X-Gm-Gg: AZFdTZe/NNsGHPpVAfDwC10Hce5Nh7wq3z5AV55KMSUdwWIBkIL4OWAZKiz+kUNTJcB
	/En3pX0Cz+O0L3Zcdo5AKUULf+fibmInWsyWDdlQPybXPXgEMJbIk+anDgNK7lgHsaZr96EDZ21
	nNP/bDw6y4934mE/Mg6OTZZsX17GH/vTuvEcNfVxRu/R1VzJWjnru5BuYf+9QF/97doAaTpk/I3
	RYbhn+FAai7510fAmaa2aB1RGi9EC/W85pRbq79wXuWiBaxpj0pSmkE01G2a8heferNlRzqhW9o
	3DJkcdCtBOezvn3STeQ9HyKs7Y2pg9YHDM3rffunRsGVX+ee58ff3bfIkf4VA7IhCYEJ/qnGJAX
	Hoy8mEWLNYI7GDpj6Dp/Tq3mrFs1bPiNUafb00KxQg0UmxbF+ck3dnm9D6IzTY5lsClAyy8hNqw
	==
X-Received: by 2002:a17:90b:4c05:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3b1b0a47cf5mr9564404a91.41.1794812931247;
        Sun, 15 Nov 2026 23:08:51 -0800 (PST)
X-Received: by 2002:a17:90b:4c05:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3b1b0a47cf5mr9564376a91.41.1794812930764;
        Sun, 15 Nov 2026 23:08:50 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:08:50 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:29:48 +0530
Subject: [PATCH 1/3] dt-bindings: pwm: qcom: add Shikra PWM controller
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
Message-Id: <20261116-pwm_qcom_shikra-v1-1-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: M_lW4aAj92z_uwskBWBOqinigvZ_swfd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfXx9dKkZoGzlc8
 aaSKuneLNbzShtFlRPLQzbRqUzSeq0Pv+TBZ9hilCiIueXDIKrJFz4wYtw0EwSgAkjVu5T2Q9sz
 LAqhwlML/gDzIuLZGWFdl1rv58LCPPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX7KJfoNA9kIUu
 vpBOyGlE+qhbfoM1WzDoYnItAGbe1FFxS7smBlfLRPkSl3R9Q/SOC4vsbq25mnWlMtALX4HO0bS
 /NRrDYWj8EKugJUUSus5IThZwJX9eZKUBkcKiwnViEKe+wl6iN61nhfUaoSKkDANZGjbq3s2sGp
 KM2XV2U10eoOQQfLnB4sEyPr1GYg1MzL2OJbYTKX5Cl7sGtr5SnzfXfUBTmG+hzf9dWnAm7jpTp
 vQxZf8Ou9CKDwxnFkSJjDO/R+ke5+m2fxl/7NZGnE8EuhvaMxHXABdGZo5v7iVSXegMHQDJoqjM
 hBXKUrBE5RCBOcFSiiT/NLfpTfbYysijFa4KoQINGKeV8Kg6h5zeMH9UKVMG4ccWbMhOLVAI/+g
 faXJ9Ovect8ouO7C9DKZ4ZJG0iWgoPdFz3qaXx/LVqEqE0kMrza8PQ+oi32n/AmhvHd4a86aJRh
 klLDBL6uu6JThMt9Flg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afaac03 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VyN_33r0_AOcASJYCIQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: M_lW4aAj92z_uwskBWBOqinigvZ_swfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Document the Pulse Width Modulation (PWM) controller on Qualcomm Shikra
SoCs. The controller has a shared enable register, ten independently
addressed frame blocks, and shared AHB and PWM core clocks.

Describe the frame child-node address mapping and the consumer PWM
specifier needed to select each hardware frame.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/pwm/qcom,shikra-pwm.yaml   | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/qcom,shikra-pwm.yaml b/Documentation/devicetree/bindings/pwm/qcom,shikra-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d7f2bdab68f68b822fc93ecabd628ab53d408249
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/qcom,shikra-pwm.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/qcom,shikra-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra PWM controller
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Qualcomm PWM (Pulse Width Modulation) block on Shikra contains
+  up to 10 independent PWM frame channels. Each frame is a child node of
+  the PWM controller node and owns its own register range. All frames
+  share a single PWM core clock owned by the parent node. Child frame reg
+  properties use the parent SoC address space through an empty identity
+  ranges mapping.
+
+  The PWM source input clock, pwm_core, is given by:
+
+    F_PWM_CLK = 19.2 MHz / N
+
+  where N is an integer from 1 through 512. The output frequency range
+  for a given PWM source clock is:
+
+    f_out(max) = F_PWM_CLK / 2
+    f_out(min) = F_PWM_CLK / 65536
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: qcom,shikra-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB bus clock for the PWM block.
+      - description: Gate clock shared by every frame (pwm_core).
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: core
+
+  "#pwm-cells":
+    const: 3
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^pwm@[0-9a-f]+$":
+    type: object
+    description: Per-frame PWM channel sub-node.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: This frame's own absolute register range.
+
+      qcom,frame-index:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Hardware frame index within the PWM block. It is the PWM index
+          used in the first cell of a consumer PWM specifier and selects
+          the corresponding enable bit in PWM_TOPCTL0.
+        maximum: 9
+
+    required:
+      - reg
+      - qcom,frame-index
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#pwm-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pwm: pwm@4700000 {
+            compatible = "qcom,shikra-pwm";
+            reg = <0x0 0x04700000 0x0 0x10>;
+            clocks = <&gcc GCC_PDM_AHB_CLK>, <&gcc GCC_PWM0_XO512_CLK>;
+            clock-names = "ahb", "core";
+            assigned-clocks = <&gcc GCC_PWM0_XO512_CLK>;
+            assigned-clock-rates = <9600000>;
+            #pwm-cells = <3>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            pwm@4701000 {
+                reg = <0x0 0x04701000 0x0 0x1c>;
+                qcom,frame-index = <0>;
+            };
+
+            pwm@4702000 {
+                reg = <0x0 0x04702000 0x0 0x1c>;
+                qcom,frame-index = <1>;
+            };
+        };
+    };

-- 
2.34.1

