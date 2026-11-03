Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679510;
	b=2H3GflkqU4Jota2DTeAc9qerQuIzJFqQJ+d+L9tOwBAcNRsMM9WzGUrtwieNiCVx9uwK
	 sqermePGXrdx3Gu4WriVtsMgJRjkDgoxCJr01iZ/1TdDgJxstzaN8qfoebIi06qp9zus5
	 Z4N4qQO2coza8ODUsy+dtJcAWSOlczk7u+U20YZ6UmvQxHqdCBT7nEowN/xtF2tVK8W6s
	 mbM86A1ICHO4NpPxW7xacvQ+9W4KHJjTsEwz3kzym65HhPHAIB6nvUXtl2LQ+NEE0sapy
	 0zkR+dq6R8CQuTJ3fO8JR9vTRZhJkQFW0R/Ydp2JDCL8jyiuxob+K2vfYrXp43TsO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=FvJvzWRkKz2nJ5ukO3Gg9tWdzkd2XAD78SuAw2wsDCs5YfRx6rcUQ2XZdPswGeNgwcdQ
	 XJwjRw/S96bwWytIPOaKbOFdRyBxV5o2L4mPdOqf3eu9z+gxfOr+0R3Kr4j3PUWVgaqsp
	 tQ3mgTgLzZNNIcLF0FQvaUBR+LL0EVKs588HSC9Ll0OhdfLheZKvt8npYLnoqZLK3fIx+
	 g8nrj0rItZNwoZuBzBzBg2CF9bEX/SjdBFCPJnceZWGVqQPy8b3+WDHIiNjUPQSZrIqiB
	 y8JEoXFygCOqo0bQiw0mZoiSA1X8TUIZSEBOjNQbYSokIECvoJ+IeUXlre///bNXX4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9F606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C9F606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33hq0e1141711
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 04:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=gL1FLBrJsYgHsyZl2GKn2DigmGW
	r2OpLEPVUWDvF3Zg9yWSSqjvV0KVLjsocQCl9suKn2683H3Y0UCEIfitjhMKUZPG
	1Xy3zILY4bbvcWZBsM/JkDSlySrakWs6gVeCCwWs/7uPfGgUUs6TbjmVY2TxnZtK
	h68rNPyL0eLhejZZHFGguDB/114I6XyIYhSI4jvCto2w/TtEtR6btydhSHZwOPd6
	F3iKS0zdwja06+vhMdwAphVWpTZGSOE4u08C0KSyZHHZ9tc+a9ugd+LqpupPQBtZ
	JbqNc2EQnPmD6mAy5TDNIIp8+jIp9ToFuINcID/LT+ie6DULeiCo6E5WcSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycr4fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:18:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so15950274eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679508; x=1794284308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=clvyGhB5TprZZJsZiH+tr+NjrDlQgpCUwuRCPtEr4uCWtl8HMZdhKCMTVyzOy3sgK8
         klpOaNkFhtU2VztLA9I1XeNFvGH0ie0lI69BE3tUKw5miVX/BCePu4M5fupis7BfwI0f
         T0YXI5YeXjZ59+/Ul2sPSxy1p2rpm5hYh4oQ9lJq0OXp20Lv4HRdpwVSTECYOdxl56QO
         bARujjDPFsqSHXZ6KLoyGxBi44NyeQ3eCmgKKkVnkOry1lLboir6fuwx1koaZf8NV1RU
         SY2uzcu8CCfYwy7uE3c3shOKVOAcgwU7hC3sG8LK9PjkgE9vvFjOhdM2MmAmeoRcMxa2
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679508; x=1794284308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=DloDXrljJk29wIUoP2D4sND0tkrM2Hf91nfiUPpF3+IjC9PdSX0Soxjg+EMJPZ6Pyb
         FkOV5T0z7Bp3OTiwgCFeP2y9J3rQmYeO50tOJ314RxIy4ZtPm722+XIKyzQGTIsXt4/w
         iXQ5lz2hlKEYNstuSL4YN1SoaeNsupXjBYtiOf43ESKD3vil8Mg7AyuYMLjIZh/AmN3S
         j5/PfxT9iCv0Mlbq1rgkbwHo0M2coxnh9pEx/33M/slRBqBSpD0enccaT+/iOvPjbED/
         XszK9MYZrHn1A3prrHLk6FzIq+lHnxTxQY/3/xrb2q52W9cQ17DXS1yaTUh3GuuSxr28
         h+lw==
X-Forwarded-Encrypted: i=1; AKwUvBwJVv/tdy8jj4CnMzySMPA5yGmZ/y1z1k23e+gZLGMx33dI0JONb/FYROTh7EeI1R2nwdRID6amgHLODvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZYdzxPQTuw1/ziU3lolXMKDo/RTXVi6Xs46gkLCSsnXLrzGmk
	kaOxOJxx6Nw/sZBpotGU0t7rzRiNwCvpr2jzRb0t0LT3XSXybkM8Oh1LJbjcis/UF8mM2O0qm2u
	MOnca2byCoY6vf51/VGN3TexsOnzoVy9hjvX3UvPW+EMhnpnlRRkifQ1Zt3NrJ1z6mjI=
X-Gm-Gg: AYBFou0D3vGIOBDISoc9eidI9sVBsOij/bYZPqjB37rGMLGAao0LJFo6vkMMhQm61lK
	iXKQ38yFv94GSxjxB/boLdA60AsJGHEwyTv2beHSR0OVZQS/X493MqxZ6EuyRkLzk9glO1Bp5sf
	vnpGo6SHf/jjhiL+x6Lv/OrUtORx6PPIsoEpgwwzkK9vsAv2FmfN7/ccu9lB7iN7KUcUjKFuJmX
	Sc+k9L14+TDPFwrZBmEDkpBNKCc4DZavvE8wHscy0Qq8LiWCgT0X8NJxkrvytFY9y35vG104jAC
	WEOqZkMOUkrB/CN0yc0dmNAVH8gwHi2qA8uruM0+QLiWgf4D4tHp5upSZndAwO0vjPsndgQNB+A
	EL9yMb9arauJe5OsqoXN6dR7IMYo5+9efPt1Iw38W7CoRgb/aI4nLwN06SWxqPkPrDU4iASYtKI
	RDsaT5Do3g15I0omOZPXNQgdY+D5D4POmN
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594667c88.38.1793679508211;
        Mon, 02 Nov 2026 20:18:28 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594623c88.38.1793679507479;
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Tue,  3 Nov 2026 12:18:05 +0800
Message-ID: <20261103041806.1885974-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae96095 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: lgzmXnaXBrl_ykBrMAAdeLr_fQ2SmykT
X-Proofpoint-GUID: lgzmXnaXBrl_ykBrMAAdeLr_fQ2SmykT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfXxTWM6muBeQ2M
 WUF2FT87k+SbTbGNg74ufcVpb/TVG9OuLTmu5AIB9rpIqa5/k1MRyWC+ZhGpDt8qhsrJoNWYu7u
 cEDWeamR3vnV0ai15ej9TFvb+xq+wzPwoQKv6IhThWlzu2MSMUF5xh0HZLvcg6T161VBn9l9GWC
 dJD2j8QFTBQERjSFAyeTWH/w6ou/PgLUYJqTCT8qiHEJW3RweAcMCgkNnXxxcaxXzF7N6/flIpP
 evKfLEbxKUm63NCNxYAr+z+8K1P7mVLoGQ+fICZ2D9JWiJNQQIdWA+o4PoL47IQ5PgtQ9xngk1B
 TsKngrjjtz/4CBQGr8Z/VfVxhe3dFXZrSpDtj3su3Qcg/lLu+TQhATFNjX/ww7nBjDBX0swAOda
 ONUc7Q6p5VTAM1ReZAQDqSiW3f0b1neb4NEDpiwURyOCex58h4tiKz4/+Wx8DhErrtbgNREyybm
 TS2mbl4ZAEGOYmalwBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfXz7m3gfkVm4/L
 43eyNLmNWSIG9cDIpFf+k2SRnZZM3Q8syjng9ibtsA+4IGWOH44DzKoeMuYoETDQIp2cQT1BGGW
 ENDN6dSoAJn4yriDFrLfD7UEvU9Jq+4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030016

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

