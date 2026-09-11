Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA744C673
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112076; cv=none; b=f+8zvFH3sDS8J16uO9TGwFzjKM9yuqY/Z4FTwah1dW8ZnASQWMn/DoZ4ezIE1tFsCHkiDC2qjdSlYjti6spljeNrAPfrhNiaWjdsVeUm9MuANwVYsaik4wHTQdNTbgRqV5ybxMRhVBhb4KTOy/lbdkXow2TUROvF9hA1FjjU4h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112076; c=relaxed/simple;
	bh=dNlCiFXswF1Fr7PLA3aiv3UeITCFkH2J/BpCPdFze04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USvTASSp0WIeUAFti6LtEr/DP9Jdmqifz8uhPUceLfikXSHp6h0yBMMdmu7szGAFEIxF4uRysjL4qj1yB8AwTPGr7GshduGsdLy5ToFiIxBOt2v3Tniix+yyrna7l6uvMz2weEIcIlao3nai5YccWnq0RtnjEO8NiuLZ9PmT5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPbK9oO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwVqKgaH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPbK9oO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwVqKgaH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kHA72879330
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vfNW1OxUfVz
	0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=; b=aPbK9oO1d0Km4gxFf1hGuf0UYo0
	0ct4QlfUk1t3Zk7zVYR67PehKlLuEWvoZwJYehxvtZygEuOd22Q8rgdrZ0Pvo82w
	aXgDywtCT2WLMUANu09ydHXYmyPVBJQHTi/++cHG2sbU1JwovrsKcJ6bl+Vv24gk
	k6w93oPMavVT7IZ1CS/u8QR+cE8bwdur94a4wxNeNWu0NV8ExV6V2zgMkfyqYOrO
	wORPmFbTWmno08UK4d+SqgVx5xR6732bbSACfJBpU6CC+WR0AAff+xR5/c0+sjdC
	3J0Ai1VLEUSImvztkW/CkoAs157nEx+0OH5YqmWcLjY+P/ah4J7S9U6iVtg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx41n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso883302a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789112070; x=1789716870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=hwVqKgaH5VY5/PmnAcYG7rLyefBHYkMs/BvHd/KTNbvRW6XBEMBzuR7nmvLbuNiMoh
         xQkpe4bsdXzOZk8FZGjdGzZtV0ngwk5CC1z72xNy8y2iKDj2JSdeDMZdcWlP6oF/xv84
         CFR79T8HUM1KxAsOta8sxss/6gBhq7pOLD0GN7dZfVlTfDGA1WDOVVig7iZXa1+6Nxfb
         KQTXCGlEcZV8C+iDelQuVJ1nvGQ08ux1ed83jKLSgvi/nW1g4Iw41BRAwcFNQVKfK5Fn
         bbRgZE/739Rks+UE6OhXWKb4ESvpj5s7D71W++XA96WpGx81nCgJGqbOxQ58nwuz8+w1
         Skrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112070; x=1789716870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=sCgm4dMZ4JTSWkR3PxXUOWW6dkxw08FNl5l6U9v4ahGFK1fEZTcsk6jrmBzihz7QSg
         10d1eaxZPu6W4ODGtfx4A6UfeT+/324fwObXNgmSPni4gOM0Z/eQ7aaNRFKYVtpDwdxc
         sRn9/XtDUKLJLabAeIJJASYFAWY+qUIGOjbgq/XoNyKXM4paaCsnKjcMi6TWOiAREzBA
         8rWz4GJAVPjbhBzST+lfh9JMOYDOaV5y5my3IxkYogFMyzrYgavZlrb0J7uCgoFaz6qd
         CT5BTc/61Q3plBGlUpWvtlaUELNFnRcRPjMMXFFkN2SLdLWJ8cj/mEazpr3JHK+V/3to
         nQ0g==
X-Forwarded-Encrypted: i=1; AKwUvBzo0f3R/onFj7MuE3V4ikdjaabpdgbHQK9dvZ9YmGsa8H64FZ2mSz7sDZgLVdixjyqwbnoNaKJWccItIK0=@vger.kernel.org
X-Gm-Message-State: AFuF++lsRsXATSVchzUhHGpV8h4eOnh5Iun+HZX8znvZOuPgzCzlDQmi
	iPgGPs2yMcCMUEHx0/xe+05eGMiRp3NQN+b1rTTXi/CL3xTiwA37NYiN8Vto2r6S0Ghd5lRUf3q
	UlRy7YoRRhaAajhPX5EB/5KSagKpH3zAZrVOYNjARgQinvDixp3mgysMVqUMFRyWDogE=
X-Gm-Gg: AYBFou2ZqLGLiQjlWum7IKmvxfc4Uoh9SMUupO25vIiSNNaDm8y4skKN4zoAdpTeAig
	N3q/gA02LRqYUROLW+9AjIpY4nZBShnhUAiXx+mMufwmlS1a9sUWdi8yuLc9fho1h90DcbbVxqI
	KBpGTj5bmaOvWFfPDgjo9kFkYv+TGrgr9QGKqnxCSeb0HnDsS+ga0lJ8DUUOwSMr6qKrIq2Vkzp
	isfQROxsLdAC75phS/RBsjRZItOaBg6b7u03G5R+A7CVcxATmi7r+tNVRdv9yGLW6ZbCcBon8rA
	WrzYBcBNGokJr4O6ATOeeDUoCysmlcqYRF582Wxys/xMXuHxBlhpI9k5Fb+qd0oiwW14cHD31pv
	24v3CGyZuL78jQe2R2uewwb3qWC6Qh6FehvPeDMlzWCsRJOEB+0cy0RJaMUoN
X-Received: by 2002:a17:90b:5605:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39d9bbc9177mr4679383a91.4.1789112070407;
        Fri, 11 Sep 2026 00:34:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5605:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39d9bbc9177mr4679322a91.4.1789112069869;
        Fri, 11 Sep 2026 00:34:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm6163058c88.14.2026.09.11.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:34:29 -0700 (PDT)
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
Subject: [PATCH v2 RESEND 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Fri, 11 Sep 2026 15:34:13 +0800
Message-ID: <20260911073414.16711-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX8OyppHeNOYgB
 c+RE2SVQz1dNXAF/juH4SU5WrVRVloV1DaWuQhNoBNWxE/36q5Ip73jNDzM4mBhKLSAhKIqWALK
 6xWQRk2A0qz8y/Pv51MH7Qz2oJ5kfNFi4RK4+IrHPlJrB56QjSqJo7g6NqrJLxV94aKW2+fqL2L
 SNNvoNRtKKTf5L8VQzND/1qxgQeN/Ewisvd7v00ZnRm9Jsi80w5w5JEWPpHTTZaL8TqUORSWYjF
 HAf08TAT3He/wSYqDdW06J3t+kRgKX8cSMJjLa/qstrKnMzcAJFUpBHK14SyzaGVRHeFlDnIRBN
 su4a8Yx4+A2m1qPVZq7oIUjcgeA67Qm/OiALmqzWszsJbzjhloNHMlAPptQpHyimci+I/RbNU+5
 o+ldeCQX2BJVxHo1LyP0D7zYfShiQ2lNDZP9uBVrO300ULigUrjym7Z54eCw92fSX5hV1z9bwGe
 FB3yfEdscctU+L6koWw==
X-Proofpoint-ORIG-GUID: 6jJOTMn4lF0Ocp3A7ykAZYJ8txTEhLzR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX0txcE+kAMaxU
 eZ5fKVJyAYIFBbO8FGX3z/wL3jq4sx0IEFvbcw3A3hnUSPL+qJeWIhodc9ef6o6aRMxBq/uUa72
 o/rVG1k5UscVCRLePkAoc7jCs/esuDo=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3af07 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 6jJOTMn4lF0Ocp3A7ykAZYJ8txTEhLzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110104

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
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

