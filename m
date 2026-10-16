Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3F42E42B;
	Fri, 16 Oct 2026 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137599; cv=none; b=cgDsEcU5Os8di7JSyRd5KiJgrl9T2otpMzSlDmTGXZnbkS9xQMr+3Gt+elP7SdCKqDe/aqaCZ23ucj3OpWHrMWpKHRlEjz6Xr6/D+mXzqVGOsI7Lx11lMWIQ+YcFePkaxr793oplrfny+ZwmAR23o1zFrf7xnayRxAYmJAyfO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137599; c=relaxed/simple;
	bh=MVrRut5QGWHBV1Z+9yYG3/aPvMpahEdN1wElk1ehhfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRHtyEKfdtJa7i8f+nkB+8AiX87zv+EKEOabE3vCjFGCF12aFdwD+uAtV7Jhhtd3cqvQEccIgCDsLHkoBIZJv8oxQFQacaPJr3ws9nDQjD8T6kgJCEHM09+ttuEOnw/R7ExhPkOAxnJYp9kGR7LZrQnm13y/0nFXO5euZcJ6LDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=unknown smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=dq6HTpOO; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="dq6HTpOO"
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4v1Cn2388745;
	Fri, 16 Oct 2026 07:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=p1; bh=D2HMvwmOaIFAB2iNl2
	fz5Rhs/T2htF4tBxEpfNv9fjQ=; b=dq6HTpOOOXUoxFiHpN5nZY/HjK/St1D2Ux
	PazvFxi8XvcOzou0Qcwiy4H4NfV+zJAD8uwkBRQR/ncDF1J2Ks5MUd8v530FCTGu
	W+CdrgVicxAS9gOUwMEXBH/YTT1+ZZyR7pBLklbR9zb6diareh2doVgTzStzByYp
	YyoRiEd2NoxQXTbTG/qXJjg0EgqrvPtqX24zUreBkY432S/SMwjp5zFVqdR7nxgw
	Hcl/KcjnvM3vVdlS00eUGkXOUk1I1Qcl/YOPqLxI+dOojUNvuis1Bz071HxX5syE
	6Bv4UQNo1ylv8LCmBM3pqcJZS4FUWLS9FjI9wVfipZMcWAebmtPQ==
Received: from sgppsea02v.sg.gdce.sony.com.sg ([121.100.43.226])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4h7d9s7f1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 16 Oct 2026 07:59:45 +0000 (GMT)
Received: from pps.filterd (SGPPSEA02v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA02v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69G7folE1453289;
	Fri, 16 Oct 2026 07:59:43 GMT
Received: from sgppsba02v.s.gdce.sony.com.sg ([146.215.113.219])
	by SGPPSEA02v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4h7eejcc15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 07:59:43 +0000 (GMT)
Received: from pps.filterd (SGPPSBA02v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA02v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69G6ijFx2896467;
	Fri, 16 Oct 2026 07:59:43 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA02v.s.gdce.sony.com.sg (PPS) with ESMTP id 4h7eejxknj-2;
	Fri, 16 Oct 2026 07:59:42 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com,
        Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com,
        linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH v4 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Date: Fri, 16 Oct 2026 16:59:17 +0900
Message-ID: <20261016075918.19345-2-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016075918.19345-1-lachlan.michael@sony.com>
References: <20261016075918.19345-1-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: EpMVbvF2WLiHoRu4_MCrBvmqW012phvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: MjNx4-3ks7gYmmCrtIdu6TcKRUZ0TGEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Authority-Analysis: v=2.4 cv=QvTLTlyd c=1 sm=1 tr=0 ts=6ad1d971 cx=c_pps
 a=6mgWUpd4vGE96FGw1JXD8A==:117 a=6mgWUpd4vGE96FGw1JXD8A==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=FGjXJT7Bex8XaPnzAX5M:22 a=gEfo2CItAAAA:8 a=z6gsHLkEAAAA:8 a=pGLkceISAAAA:8
 a=CjxXgO3LAAAA:8 a=2jjaTXmTgyMSI3A5OP0A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Nb6P8PKbRQcCfzakNmia3-njRbLFiDNw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXx2H5plj+TYPR
 6WHmq/WkOZJnKRTCajnhU9DDeFDwF+TBrXDg34xhbvBgiH84hAjqunCT3HdYTQkbwCZ9N1xMNYz
 dDRNdJb6XIhMvIS6A5vtL7j4Ga973uHY5cFZ+2droT30HmVOMKDG
X-Proofpoint-GUID: Nb6P8PKbRQcCfzakNmia3-njRbLFiDNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXzM/p/6x/EFJp
 UCu/Rw3AevBVvLE49eQ4fd+0iWnupm66g6+iKq9xJMGHU3AUnEOlqbqSXRyIupKZ9B4ISy+Q8z8
 ilYehiaINt0J335+6JU7mQFMnrCqc/hqs5eARwQm+R4Kh76orPG86n/Wywl7RWeF7UTodKFx0ap
 2G6pohPeA7HiFCB2ZAaYBzVDrp5smhkhiuxFXjzOgrI8C4t5Dl9eq57AxUoOGd+HnKQwMphEE7l
 bH7pb0+mfRl1PYXTlDXCQWeMqI/Ig0YyqM/11b68oqXQVwaI4AvaCqT+9BqM942CABcXiHd5dmS
 9q4hZ08WwOVA3Nq5Qyfvvu7QcTBnzhdrYXhkJNRfy+9ls5r09wyNN2AUmlHDeYHetT/hR/yQgJh
 SOOV6zjpeJbxVYfKvw/6QiIbdNDXIax5zIwk8oWP0HMNu23gErVGOS/VoCuSma1H9OnOIuE+E1G
 fd48surTRjGZ6cf59TQ==
X-Sony-Outbound-GUID: Nb6P8PKbRQcCfzakNmia3-njRbLFiDNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
over 2 or 4 data lanes.

Add device tree bindings for the sensor.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
No changes in v4 from v3
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

