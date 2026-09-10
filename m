Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07162472B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031891; cv=none; b=CZa7PQdd76OsOJ4DGW0lf3hnsK+VxzLoPXy+bR28s0vkaFF5TviyoXmfIntUrFJjEhAzB9QdzZ21jNEB5S1ghSg7dkU/zVVQwL+HdIBxSC0Qx51zzdftH63tp/f1zVJEMMJAHC0LlIxrqK3p2ecwp+5KZcRSg6vubnliZScmSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031891; c=relaxed/simple;
	bh=uqXaAfYUFhE/LqQ34mcswk141mw9mtdWD/wtSOx2T40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeCFFFFu9Hl0B+55sROkhtwLOEqM0DpN1mr6rXJAxgpmpxd5IUyKzwy4cBuycNDFXxq7EcDvRrx0vyqEo5Zbva0Kct0pz5oS1SpWC3SqzvwUg7GI2v70NtFKmyIxMQl0QMUaHDrFB0CRbnlLtibQkKx1pCaOoXJGgieAdvkPoXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaONKq4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L32Td5LP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaONKq4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L32Td5LP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pv7F3998289
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R7VlR3KIJ7C
	bxcd6Y1OKzAYlMEijNWEnGLFJbn3lQWU=; b=oaONKq4kgSoIWX9DYW6ICey4NDo
	A7Qs9s+p1M0lndLoniYHtYfIDy3DF+m0tyTmiknvJQAEoza0eAURI/SYXOMQyIE3
	YtHfD09oj64vcNbtAdsRoVQ77OfKX6RZU8K+GIIOqnVSJLo23/Hez0PWnFn3z3uO
	sdhlH82sMEFPDT67RDpUquaOeXnVrSgZxm6xhR8HOmIdoZnruKMG64AXyAwRVmnP
	NXYr8aPHWJap1Ye+9HgP4diKPkQZySqNIO0OCOfnAi2cMitwmm87v2KVwNEd7cOF
	rgVwtZUYmtqvtuJaAy2rT7gm4DowDtPzV5oWwg74IZk9TvYbUSmXwnGzrIg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfk598-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:18:04 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so7521531b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031883; x=1789636683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7VlR3KIJ7Cbxcd6Y1OKzAYlMEijNWEnGLFJbn3lQWU=;
        b=L32Td5LP5PfRVJu2Q7y5BmNG63LyzMdWYXD6utNn6oKczkWdxiFwgjm5NwXjVTymq/
         OoFGE/PPIHzWskk/bOOCfWbE849YgAHeKNFMqJDNGuPO5ELiJIUsLBlmvOLL5W63PHRf
         K7z93fP6qWcGSYLwazu5MEtpkNJpJWlomFxfJJ/ih9i2ojIKP7uMstrtDQu/fw7sqbNn
         2NRYjtLpCXgwAdYo1qHtL9emNcTIZ9qnUA0upnJLfr8SR3XKvYodolJam0cJlOjBUNHE
         bdtvTKBg+E6NTO5jH2/W8WVCg+HEjsoGeVoyhAvurDr5D/DCn6lOLCGllVXHGrLCSrDn
         XjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031883; x=1789636683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7VlR3KIJ7Cbxcd6Y1OKzAYlMEijNWEnGLFJbn3lQWU=;
        b=dKr4/Yw3uYWRyoHHtwptB/DLN8howMN5bSw7ZJFIMaaGM4IeZnr1P8s0kcSb8qFSkK
         NtY3VQcF+MqXBjLt057UTwC5lJaDJkurPGcfPMi+dOGSfVTaxp2szdvYwflNWjQJnVl0
         jXXM2tb20Pvh2PctsDjHimisygDxZrH+C+gfJ4uDo5eQOuwnEMf4G4BcOyMkkRtUrmHV
         z9US+7J6asQ0/yLU04MFyBFisSNiZoPlcsr5byeGiO+SLCO58k+zI0ZZJmCQTxFOiE8u
         9WC5e6mhjYGM75+d8zwOCTeHTRYvPKcysCrYiVbmbNciqjlZOjfx6frtmK3QaDKesoXM
         KvdA==
X-Forwarded-Encrypted: i=1; AKwUvBxBrtMsNLRaJ1UG5EDxLfSa0JsHQ+b/NH70K6Bx1yZgMRAPN9i3Q+2ucNwRq/LmnGOuhPCo1eX2TWbNVDM=@vger.kernel.org
X-Gm-Message-State: AFuF++l6TfgCifmuObcCJjfDEFy4u2V8YtggUsxojpesdoHo0QkOWkIH
	igbjTbajIuo+Dw7lYAwH6NLq5dROCdYmdiUDZ/k9pzsQvZqYPsUooDlc6WP3NjHRKBKcRx3HwTr
	r0yg74sf7xnE3Wbb0/tIYyD7ZvhNehJmxweniqTYYU63eJztjHdbJZgRNS7OKzO2wn6Y=
X-Gm-Gg: AYBFou3Rrvcyle6yivlbB+tA3v3DIO6GLbRJrYB1bl921u4ZK7x1cdoDASjxejSyR06
	/s2xi7T7dawNo8s0yCuPAADAtnjj+zjklVOZHLucFU3R88vj1b4gZrpAooiSGNIi1esgWs7/4gZ
	VNkaDedewdXK7SWaTcKr73QB+3/3rh5pLYGq55V5mwkwwgXQED01KgZuvlqlaF6J4QBVUGrvhDL
	kZ0EItTY5ecv7MvBMuxwQWUJHUuVYZU2r+7mXtz6etY565y5q3IBXYxiuwU5cdacvBp9bPN+b98
	cimH1Engs7eFhUzS3QN4UhDwu4aJfKGUg9XbJ84YZi+pZbNmLbUIuhL2WhsoCk0tpYAKOW40ykY
	JTO2EAZJmjFr99ExdpMBdo8nEW3eG/doxUaJ3zmr/XU4HWOkVVJJwiwNkFJZ0
X-Received: by 2002:a05:6808:f8c:b0:4b9:a829:f018 with SMTP id 5614622812f47-4b9a829f8f4mr21445248b6e.36.1789031883381;
        Thu, 10 Sep 2026 02:18:03 -0700 (PDT)
X-Received: by 2002:a05:6808:f8c:b0:4b9:a829:f018 with SMTP id 5614622812f47-4b9a829f8f4mr21445217b6e.36.1789031882907;
        Thu, 10 Sep 2026 02:18:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm57395988c88.12.2026.09.10.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:18:02 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Thu, 10 Sep 2026 17:17:50 +0800
Message-ID: <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
References: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX1OVVJJSDoZBq
 v1RFYIzfjR4gne/dlBW6krZi/wdxPBRytoEOtfPuLlQJRbFvJxMdVJIeAC2A+gCike/AJTs1sAs
 tagTpfxeP7gBjmn0n2gwYSZF/T025QA=
X-Proofpoint-ORIG-GUID: 6gPc8DoD-vo7BzEVjtFCdgrU1lnaAO8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX/jNKZ/nWWLrX
 uM/a+OuvNFuMPYNhH7RNRbyW/6JMl/UQzqHX2dEqMuHW3nnfECz3gzuUbN5kQKfHUKUCTCzIxRh
 ovoVdKn953OdmNmlpS7WLRujtdf2TtWFRIl7HQlv0jyV/unkv3yBfzDqZhN9znjQVbPmlFg3qae
 DTTAGu8Ad3fqq6t/BFT3sl6FNiRlKBkvzez22qiYfnJ9NeqKCZxwaLw2SsmxXxmrgr7tap2xAuC
 6VEQa2VSzYKV8af+Hxm2vEGQnBEblvX29ikDEtjz+uLguhLSeIomGpfcmNKrvdATFYTTFI8YWuX
 kYabyaZ9ULyy24XrQdIrvSmZ0izjhsk14a1UkZeytUuo3YHNQ5Uhao0MoE3n2+ifTyALLrIWkW4
 l0z2lPgGAuDptLNHsQI76x3/QiwxGeVWo2gNb8sNYbcbsqH3sArcS26prWwb7Hds1f+i+tyv5H8
 zNxRzcvMxHKx4K67pfQ==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa275cc cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=pw356RtDBc5WmomScbsA:9
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 6gPc8DoD-vo7BzEVjtFCdgrU1lnaAO8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100104

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260902045938.184221-2-shengchao.guo@oss.qualcomm.com
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

