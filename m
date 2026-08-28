Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C953D093F;
	Fri, 28 Aug 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899765; cv=none; b=VAS/4udrucPqVubjjJMogeYsy+kGe5P7qYEJwRxu8IW6cXbFWFoWWxJ6T4GEhutvbvuhsmX+h0Bzx1WPOUIEKsGp/Xb8m8jkb9K+lBbUNnX25n9tWu0CxKUuxpyqv0VqzK3so/QW1w536sqdcmOQWYQQKHU1yyy7+rVJLJxuJSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899765; c=relaxed/simple;
	bh=5wHJ6bn2SgT4x0kTY3Dtn3nVv3zbsLFYseVqYpdAMXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLe+oZ+rCjfd4Fdtlh2thVbTiuxEujVaFANmXAccXZH51Hn+YJhFi9hLJ+XdblBmQgSjrptxJoX5ZGWbMAAWidZh7m6f2koctPLOerSbL8LtcGq4HDGldM0Enw5UgfyBhNkL4DHr9Vlb34TJ2NRWPzKz8YNbhQxqhMlTIT9gwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=hg+FhoCa; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="hg+FhoCa"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S670jF1981553;
	Fri, 28 Aug 2026 06:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=p1; bh=Pp7tKcgANBDdpJngru
	B39N9VvH5ba3sQFbZWx0CjFFk=; b=hg+FhoCazveNunu+U7yyTQMRYLftaqEmyh
	WNvLujCv2kwQuzqn1Dp9dLDcyMQ67Jaj+lmI9pWepLgcrrSCBWhls22g4m3hdJVg
	z1sXzYZ30EPc+q7+LCFS5+t6f7KiO8huAmB3wVaMA8dU25uL72+xwlguu4AjOxWV
	LP6aImBm+0xCiyeiM2ufzW2nyGlyxzxRPMERXTSMmrnNch5i3TmSF8FDeTGpI1d1
	xsyUJxyZ+JY0LIcgfa9JEAkQZukm9BmOf5sFcUUo0KvDySeS3PEencLVPylSGxq3
	an3WXIef0YObAMz/4il0s4zmR0tWFccSLrQ0qyHie3xxmXfUG5pQ==
Received: from usculxsnt03v.am.sony.com ([160.33.194.235])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g70x37mbk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 28 Aug 2026 06:49:08 +0000 (GMT)
Received: from pps.filterd (usculxsnt03v.am.sony.com [127.0.0.1])
	by usculxsnt03v.am.sony.com (8.18.1.11/8.18.1.11) with ESMTP id 67S65Hr0497648;
	Thu, 27 Aug 2026 23:49:07 -0700
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by usculxsnt03v.am.sony.com (PPS) with ESMTPS id 4g9h4rc6m0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 23:49:07 -0700 (PDT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 67S661um3766270;
	Fri, 28 Aug 2026 06:49:05 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTP id 4g7amfpntm-2;
	Fri, 28 Aug 2026 06:49:04 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
        Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com,
        linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH v3 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Date: Fri, 28 Aug 2026 15:48:42 +0900
Message-ID: <20260828064843.65047-2-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828064843.65047-1-lachlan.michael@sony.com>
References: <20260828064843.65047-1-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: JeUVuVj86iFRaqATSDX89M4WtCDMgoHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: KJ1pJhWtf7k8tRDZfKPy7YbrAUDSz3u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA1NiBTYWx0ZWRfX4V/zhZShGT5t
 QGwWJnx8Uoip79u9lKPhzb19CbQSbuPIWpje9o1kLafbmbXlNciFWBBizJrsUBmq7dUZrkrb3O5
 fK83ceJ+axCjXz8Xa9fhWCYQk/ONp4V424tG2oKDEzv+8AXjH1S9
X-Proofpoint-GUID: 2uF8-pcFjYlcQo_6hnhTFXL6SVh-RelZ
X-Proofpoint-ORIG-GUID: 2uF8-pcFjYlcQo_6hnhTFXL6SVh-RelZ
X-Authority-Analysis: v=2.4 cv=C/rZDwP+ c=1 sm=1 tr=0 ts=6a912f64 cx=c_pps
 a=Ycsf2/9e4zkPkE23zi987Q==:117 a=Ycsf2/9e4zkPkE23zi987Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=I_Y4LlEPCAdqsIK1J1Zo:22 a=gEfo2CItAAAA:8 a=z6gsHLkEAAAA:8 a=pGLkceISAAAA:8
 a=CjxXgO3LAAAA:8 a=x5w7hrDbV7sG-I-XlQgA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA1NiBTYWx0ZWRfX2aA8FYdhNUlM
 y4vrkY53dWq53c2qR6s/qwjtOmvg7S8v4JTTbAzch7UD7zyh03YlB+h8Ta2YxBnmd+2pIF8CRle
 BgwQqYF/Cj2rDiXtbX/Pj2ApydOsgSJv0r+LVm4VsiNFtTWxxCCkwCcldnmV1G1nsfJJjdw6PCa
 j8WY0kiEmaGShIws1OEXZjyNEs9QxSgqMGtxf0LlQMOyZWvQje5vHABzaxt40I4Goe88XwnWpIa
 P9xf5WrYf8RXs0Zw1SthZ+ZjK1oMWu9/A/xtdXRiazUj7acQ3MQhIYhkd1pez133rE21aBx7IuZ
 LThZv8HM9AdkNpO72gefVD2wZuo1pJbLBSE90afLgwKqvvhXb2g2yh2oTWwsBJS8IuVdL5fFTqu
 jViGEbp+F8Z8WfhhVndJMlaBAHaI3EaUtMvzJJ4zcmwJwFBRTdAQHtVE52ezkhiGGmS84CLqgds
 5RLJZX4A7k1PHyNuuDA==
X-Sony-Outbound-GUID: 2uF8-pcFjYlcQo_6hnhTFXL6SVh-RelZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
over 2 or 4 data lanes.

Add device tree bindings for the sensor.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
Changes in v3:
-  Adjust the binding description to match the actual hardware: the I2C
   target address is selected by the SLAMODE pins, not fixed to 0x1A.
-  Add the standard video-interface schema reference so the endpoint and
   remote-endpoint validation match the media DT conventions.
---
 .../bindings/media/i2c/sony,imx908.yaml       | 108 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
new file mode 100644
index 000000000000..828db1175e2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
@@ -0,0 +1,108 @@
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
+additionalProperties: false
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
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 55b3c2d7a78a..bb7adcfd4767 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25538,6 +25538,11 @@ S:	Maintained
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

