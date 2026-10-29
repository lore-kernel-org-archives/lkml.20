Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.183.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250036;
	b=19EXzls3znrvQ9DEDrpKcFaWabTr3ckNCodIpKsvbRXEzokoYfEC2tadYOHBV8jM5AlQ
	 DOtwPjUVQ7aZOzfWltIWwrb6bLSfqJw8E9Gkc2CnRkmEb0v35/zqIPWVDkCxyr9U+KZeo
	 wn6NK4vTXbpKxx2q3JaIRuLpEr1KuWalRrW6tA2o4mxYC425D8GVyncNpz7B4mYka0J0C
	 USD5Ry3d1O0D741wokHtT8aYabI6OpDaiXL7V+frKSzmJQNtbTJh1jf0uCJWLct1eQYeb
	 LnsSpJMktrvn4kfAlcYo3FS+xMj5ERROYZy6gZ2sTXINURNX5VDo8JlC/87DhPLBooQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-Sony-BusinessRelay-GUID:
	 X-Proofpoint-Virus-Version:X-Sony-EdgeRelay-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Sony-Outbound-GUID:
	 X-Proofpoint-Virus-Version;
	bh=G114mY7zeouD/coYG3dnUhZJ95VWXi4H5iiRVPw/5to=;
	b=OJNZyVwjQzCyBk/ecHnKSIYOtvgc0eqEuuxHsBihdZTUJVrBXqlvh86U6NQJabHsMv6z
	 x/W5a0wZx5t2P6LODjAVF1vKxyXwNBfr1ISrZduJH6ChWzJqup1PqP93Ky9keIni3w3Ee
	 b0x0xmx/uDgzIizKeWpt1k8HJZIVnsxjtP3rv3bRHoG9igT5L8lOHAweH01Ok94WrGJG1
	 EPL6+65+wbfezV+3CJAfyozBmlLwFjCOqpvLAh5BYLaxujIkuVy54ad9y53H+OHdyGV6H
	 LwHzTpyGSuUH6AbzzXnAwP+XGUNBJwlsnB+dVc+Che9k40z7mCNaS7QhXySV3+s+JhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=pass smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=sdpjJi5Y;
	arc=none smtp.remote-ip=185.132.183.11
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C52606A31A;
	Thu, 29 Oct 2026 05:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=sdpjJi5Y
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T2PBiU1982673;
	Thu, 29 Oct 2026 05:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=p1; bh=G114mY7zeouD/coYG3
	dnUhZJ95VWXi4H5iiRVPw/5to=; b=sdpjJi5YlwVD71ZR3MTXnfxBnlvEndZ7pb
	bWtWUTc3UtNYypAFPksi2iu4EGruTmVdtPV/Wae2xLdZ0apE9mO1agaVjjLrOUTV
	D12HyVJnmvY2hR/AjXhvdpdEW58+wPuaNNcYc/bssfQlDvK+p7aeumFKaFbKKdjt
	4iEJfW0dr0nmildE8AkF6VIwpkyupZXYBeq8DchtFrG4trLQVdb5DY8mz7lypJGm
	VbsQBtfLkKidPP7RQf3gnZ/cMwD2jUhGMP+cubphYWUSm/nAw1/HFtPBC07LIick
	9yN+5N7GjgVHGxxvz/6Z0bjXsWJjgefBGpZsIdmhkCmFFZ+U/n5w==
Received: from sgppsea01v.sg.gdce.sony.com.sg ([121.100.43.225])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hghwvpd64-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 29 Oct 2026 05:00:12 +0000 (GMT)
Received: from pps.filterd (SGPPSEA01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA01v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69T4muKm1272018;
	Thu, 29 Oct 2026 05:00:11 GMT
Received: from sgppsbm01v.s.gdce.sony.com.sg ([146.215.113.217])
	by SGPPSEA01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4hgnrhpnnx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 05:00:11 +0000 (GMT)
Received: from pps.filterd (SGPPSBM01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBM01v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69T3hSTi1070511;
	Thu, 29 Oct 2026 05:00:10 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBM01v.s.gdce.sony.com.sg (PPS) with ESMTP id 4hgnrk1g2n-2;
	Thu, 29 Oct 2026 05:00:10 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com,
        Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com,
        linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>,
        Conor Dooley <conor@kernel.org>
Subject: [PATCH v6 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Date: Thu, 29 Oct 2026 14:00:01 +0900
Message-ID: <20261029050002.3880-2-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029050002.3880-1-lachlan.michael@sony.com>
References: <20261029050002.3880-1-lachlan.michael@sony.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: aa5uurz6SAiVfgVwaHDLSYZwC9WGof9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: bvD6LGc7-7CkNsOtO0HfX6b4EcawJH1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-GUID: o8v14snD6GilfJhpQ4GLqN8MkukKEoaN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxOCBTYWx0ZWRfX+7fJgF3oA+W+
 26TiQsp4jYbb/19LKIHApiKGlEbC/t/sDNfcUS5N+wQTaSBuxrP1BHrdj4gF2eFRyJBPlj4+em0
 6GWkw5Jl2WQQACAIEu9PfnwtZzy26HPArk1z2QPMdEwd/jPmaJiZ
X-Authority-Analysis: v=2.4 cv=AMzCycPh c=1 sm=1 tr=0 ts=6ae2d2dd cx=c_pps
 a=XNW8778QP6juiAqijDMnrw==:117 a=XNW8778QP6juiAqijDMnrw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=FGjXJT7Bex8XaPnzAX5M:22 a=gEfo2CItAAAA:8 a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8
 a=z6gsHLkEAAAA:8 a=pGLkceISAAAA:8 a=CjxXgO3LAAAA:8 a=l1DErWBwqTL5L6UNyDoA:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxOCBTYWx0ZWRfX4TUYESxNzHic
 bRyAgfltGAtrOWDdkroZ4hGqS2rKLUmwVepsenmQRzOyxQaslKQULngzU3kDYCUO+w5pylJR9Qv
 niy6oOwpHDniuIWOdxijgEoTBWH6JALDeq+ISQBZi9he5pNPAz0fQaGSxoOjnX7xedgmjDa5w5v
 MsKU87GPeHPLkaQPeupDCpLRyJ29WgWvetbzS7Zd1HAO80VSHVT1gjcRRsa3QTbZ9RAH+D2qZ2x
 5S6I61WHhlScAXEPCRcDYHgU17pIG87WnMyZ9QL2GclQv/0/Kwf8Yu6Vffb8jJPHF332hXtAOLz
 5epsbhlmNwpAUCRdwM9Ll7LiUPuulqc5yn6YcybuS+Fs/k2HNnxbHWSspW+wR3UnferysHqrClm
 G0KNu4ggxQ14smntVCZi08+vQmPpIPLxVhEXAPKPmh/E5ougIOZDwfF79MVBQrvnUxgDnwQkv4O
 peMpRptw8ppYVijhZgg==
X-Proofpoint-ORIG-GUID: o8v14snD6GilfJhpQ4GLqN8MkukKEoaN
X-Sony-Outbound-GUID: o8v14snD6GilfJhpQ4GLqN8MkukKEoaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
over 2 or 4 data lanes.

Add device tree bindings for the sensor.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
Changes in v6:
- Use unevaluatedProperties instead of additionalProperties to correctly
  handle properties evaluated by referenced schemas.
---
 .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
new file mode 100644
index 000000000000..3957872abda0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 Sony Semiconductor Solutions
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX908 CMOS Image Sensor
+
+maintainers:
+  - Lachlan Michael <Lachlan.Michael@sony.com>
+
+description:
+  Sony IMX908 diagonal 6.42 mm (Type 1/2.8) CMOS active pixel type
+  solid-state image sensor with a square pixel array and 8.39 M
+  (3856x2176) pixels, supporting MIPI CSI-2 output with
+  RAW10 and RAW12 formats, configured as either 2 or 4 data lanes.
+  The I2C target address is selected by the SLAMODE0 and SLAMODE1 pins.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx908
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (24 MHz, 27 MHz, 37.125 MHz, 72 MHz or 74.25 MHz)
+    maxItems: 1
+
+  dvdd-supply:
+    description: Digital supply voltage (1.1V)
+
+  ovdd-supply:
+    description: Interface supply voltage (1.8V)
+
+  avdd-supply:
+    description: Analog supply voltage (3.3V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO. Active low.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - dvdd-supply
+  - ovdd-supply
+  - avdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+         camera@1a {
+            compatible = "sony,imx908";
+            reg = <0x1a>;
+            clocks = <&cdce913_cam0 0>;
+            dvdd-supply = <&cam_dvdd_1r1v>;
+            ovdd-supply = <&cam_ovdd_1r8v>;
+            avdd-supply = <&cam_avdd_3r3v>;
+            reset-gpios = <&tca6416_cam0 5 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx908_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                    remote-endpoint = <&csi0_in>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d39ec6feb03..91aaba2cf764 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25578,6 +25578,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
 F:	drivers/media/i2c/imx678.c
 
+SONY IMX908 SENSOR DRIVER
+M:	Lachlan Michael <lachlan.michael@sony.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.47.3

