Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C22365A14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325194; cv=none; b=ESXd77fDYVimLdGruynP6MUZtG34wvPn4aYTguxexuTvEwnL48wzoDz4yGjy9LXH7/wVSyuPrbACENo3+6DonPiGXU6HbS7aRVg8ZISbUjgTznuM8S9SSDiruczjDSWAzTRpS3lrZS64XF8mYVoyzyYtEvJCdPIFPypvQ4Ehd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325194; c=relaxed/simple;
	bh=mL4UmJWXh0YmJ40NhOn8YczxVlIF2tdm50qSEcaXgfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G41fDA9riraOWpeMMcN42LCravx/rn7HZ3lVt3Lu4HzlcHPZ+bh1jsemz/5qatMVWgis0go53Q8jgQ3sn8dYuV2trE9el8vj9E81hU12+kF13y+1PRWCcphLouzzd4sR537tbc8iZm1QOLsnG9y1BIjxBidkYoSW4FBHK4GdGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6sa23My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI4mXQTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6sa23My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI4mXQTB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTNA24097970
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 04:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yScyxKkUm3X
	/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=; b=G6sa23MyqnoTp8bEBtj5fnUYjXX
	RVkShYrP8Qfpl8rt/xNYaho8TIO9aBqPEiXpipHddEfGexOYRLue9LplRku0XH8G
	Vf1+n/3zN99FsWUZKjU8OQdk/0/yCV7kCW/9OSn2qj6RReNj8I4pDHFHS5gXQRuy
	hAQGs7XW209GjZAiPpNMP275tSwTLFaz7Tngf2S74OiCvQsCsoWanMnxMAuBk1Jf
	heqpjDKYyzsBRQxKX4HBbFijy7uHS+IeKg/r5tkdrTiES9dmgyATpixF3ALrxwxW
	JxpHuCWlskRSrdS/k2p3lg7UL4eNIDiMPX2Jf9FKB4zbw2pZpVa7rAE1KQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt3h2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:59:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso987891a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325190; x=1788929990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yScyxKkUm3X/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=;
        b=RI4mXQTB6pqFBIU9VkOq7QTlkaW2Cr+iVSS4Sg7rgN7Anp5r/IdRXVrPd8Lifp08SQ
         NLDpXT/6PCehHAmfWDkWW8laSYgE0VQhogOmLdyTHUhhmWta658oCRK6Y+/93qVfYsff
         y8rAGKGEcQIhEiys50ZSNFp3DhvmS1/Hgn0NkAxY2jf+Zas5SBa6M4pUVwEA8CMynJ8l
         8iOHW1Wz6fMpc7UW5VHT5BnNZumKJXZ1qi5TItkjdldJYqhgWHIO3WYFETlVcaXWilPT
         6sTmEkmsawDrvX7svY+WXRYiALLlgjODoeGO52YcEVnLPSgIu6zDFkHcWHWMtBYfwoy1
         DjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325190; x=1788929990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yScyxKkUm3X/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=;
        b=VEZzUAGzHSFMfNLQHmyRSIBn9aW4rcbCwMgB16uid0QKpZBZjXDpcpSUQc3gt7iHc5
         BVoDwCRzyJwQ5rUJR5vUladlQA32d1JjyG26W7ECI2V9DtL4QgHiv3ho3TFBmmoupAfV
         QnIB6o6ZdNf0t+H9P36uANYTL/vXhu+5m2PITnvGbpibgLKLL5V2wjYy/uwLhPHCT++9
         SztAdwlgP/f/qHqSJ/KRYSAFCkrpsEI417rgelf0dLGs/D+GMU0U7zYPPLTya9+sk0lk
         WKz3mV+kiZZMsYe6NoON7x4rddscWlsfFq+Oyrq0/xTHhlVJxECE48UjFIAIAtLSCuQK
         vY+w==
X-Forwarded-Encrypted: i=1; AHgh+Rp3UHZBSkQtaQIM2VxUBVt6xawIuvsKNdZoibfCr3l65DVs/uYF7uHrAPuI9sXIJRM9tcX0ZURGCNRM0Pw=@vger.kernel.org
X-Gm-Message-State: AFuF++kHjpLbXoVHy2v+xqynUtchVkTkpJ03h8/C0UPxZvkXsh8VNdkg
	XRrHWJkAbmpo00S1+ZeG3C1j0OYA3Ru0Y3dVyjUlARgKCudwlOnVuurd3+nmg1p/y2N/kD3Qp26
	cU1Yt5FEAiawah+LPTsQCy3Fb/EVr2XBcee55k4Hr7yEbi0eDvjMK6gV+86wc5gISQDU=
X-Gm-Gg: AR+sD13VdwM0Oe2GHLvoWiDKrf1utq4IniL3U+MiSWO4yoIMoxGCInogFFJ0+bLVo36
	W+/AnJUSrsp2haIE4Rx60teMzu5hNhD6OSYPuSqGauCDil/Fk52YpqkvqK3JhFptLup+X77hDzx
	m5DNWJURYa2iyxoP26F6PRt62w9+01aAK6eBbGDBHSTdodMHTLCgt4iDsts7m+PAYWsVALLZKw9
	nh6br+61LPt0QmJJP+AgxuxMZ3JROQo2M71/IzeiCXRSgYKRhCqSs6XGFzs8Hrbioe1J6KTcpZx
	iin3Xv+C05k2WYBRzW/KpFsJdprRxUzUwn6g0S2cylc3aAK1svNLah+Nf1hZGwh7mgp8kJm8F6u
	aq9I0ub4AqKOac3sXuMQq8tqkNbhq9t6WLm06TZgLmLupeMMSxpsmU0oE/CXo
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr3457131637.1.1788325190373;
        Tue, 01 Sep 2026 21:59:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr3457086637.1.1788325189953;
        Tue, 01 Sep 2026 21:59:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm2782639c88.8.2026.09.01.21.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:59:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Wed,  2 Sep 2026 12:59:37 +0800
Message-ID: <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX1RmgDh0BAarC
 uwx2ABYyWGgfNzBN4P3mw9Cs8FiJqfKXBXMD6tTg6DobzSDUMguKHxFsx3bDOGbJ2dqHbFdtRgR
 zIScSa+qFhyN8JnmMjeYx6I7ya4ZPPP6tUZBW8Y7jtfCBqNe8sAwGYuRFHVv5ig+hFym3qDkWfW
 JCptRJ9pS6c50manrzyk/+x7KEMwsbuer15hWQwleHnlBxhksrXPu3eLFoNdi4WlTJ3TnJAX7fS
 FOQf9EiJUJso2avTEDo8IftCVKClFYU1F61hxl6/zyY2piJfLnKfET2dCpCYlfWGTPknC9lSyU0
 gosxKrSl4f1sNcpVo11uPqk2uMLVHDvkzb6EtUnzqTOXIudm3Z/EbOyhG6D2a1ruDnljLO15rTk
 4zr0mBhxVpkbTR84vCVd5/PTSzFU8m5NrGhy0/Yxd1amYq1yPVym+DNARlQAEPZwAG4TfaTtAIh
 d9kLmqHHIXFEp2llzZw==
X-Proofpoint-ORIG-GUID: KZNoodcSq8_Brja0KdUOw8W05-WPaiGT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX2XKO9g7SO5tl
 MeGvemH9DC3L2bgdhLV5Jq7HoNk733DeM8nHf9Lb0vutqQlDTwaaM5IuUExnwpZmJoZaB6MLtIl
 jejBH+yA3l1gRKf8XzyvahMj+Ms4jpc=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97ad47 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: KZNoodcSq8_Brja0KdUOw8W05-WPaiGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020042

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
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

