Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966812D3225;
	Mon, 19 Oct 2026 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.183.30.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374483; cv=none; b=WjMHChUoY3vxeoEdKuw4S3SyXRWo7gFDIbKXmrwx8KWNbFKViD31Sw3w/qyuv6SFSQxFvWxe7FvuitAUUTUzGIuY9qNc5SQ8HT8VnspRZ2pNL3quodU+cCmZsyCkSNW9kiUwyV6WaVrTKAkNCyJym/VcDgbjEMtN6WMWlnuzH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374483; c=relaxed/simple;
	bh=CY18gikf4+PMXy2hZsY5td5vLftLKaFgUJb8r380BXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Os2XrvwZiwgF3s6GFQk+rP5P0HOUouPlxJhD0KCoXwz4oAufCW3YkGM8Iv/nwVHSASNwmBFN50ykR3urS8TEyFgejXIkiMG+m7PwgXm0sto1SeCs835oQ5pDODf2hgzJn6fsOdcGGLwLs8cCWQToDhYs3M90u0lCLxgbtNmeQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=kTtBv//4; arc=none smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="kTtBv//4"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1IhKx1330134;
	Mon, 19 Oct 2026 01:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=p1; bh=8YzW0RvIIGQsJ3W7Ep
	CJLmfqANue+4sZ8VWS0fxCcPI=; b=kTtBv//48Arr+6UsuzA0CfAHlMuZ/tHEKq
	mBQHBjDpJ2odYXyagbg3MuVxBSrysb3Ov/UxCZPEBxSRioZbJQqp0Zd8j6u3Kz0X
	eHHBbvnSEEmCurL4DyfCir4akF/8NqtLh2x5FypsBl2OoiNYnzxjDDcagzRak7yY
	5HQ5bbSPoL6HX9oNJthaKlTwg15OfH14rZTjiJmr2/mFCSvRkrNXdRc+MH/yUF9d
	9LodGC7y9tBaqpFWtANevemaM6R+anDiOQXawnPp1Joy/kge89p+5G9Uibzv4uw7
	MqMkA1YoZ95HV49PiEHQq1X2QySwJ5wcT2Rb7Qs+Z0CEI8OvU7Pg==
Received: from sgppsea02v.sg.gdce.sony.com.sg ([121.100.43.226])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hbyk2smha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2026 01:47:40 +0000 (GMT)
Received: from pps.filterd (SGPPSEA02v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA02v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69J1FRo12226497;
	Mon, 19 Oct 2026 01:47:37 GMT
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by SGPPSEA02v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4hc4p088w8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 01:47:37 +0000 (GMT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69J1ISfk3714785;
	Mon, 19 Oct 2026 01:47:37 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTP id 4hc4e862c7-2;
	Mon, 19 Oct 2026 01:47:37 +0000 (GMT)
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
Subject: [PATCH v5 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Date: Mon, 19 Oct 2026 10:47:19 +0900
Message-ID: <20261019014720.2635-2-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019014720.2635-1-lachlan.michael@sony.com>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: JK6xis8VXYoOl7apLsE16yP1joj4kPVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: HHk8grjzShislQnHhCEEO14EBYZC_cQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-GUID: ICTkK758jbs_MuWF8BjiTaLqh77O6xC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwNiBTYWx0ZWRfXwVoWpI248AGC
 wVhUUC6VWXcPd6Pe0uNNccvAAx4rESzfyef1j8TPjiUyD0EBK6TXRYtlVPv/tTcgjswoy7vC4wn
 cGiuJ43R9nLCCA0dR1jW9criMrHwkB+pVPOlOMkFwQUd2h/+WrlEfoJlKK+V6CL8HRxbuYWRgL+
 QTVGAoELI29PurFGKTnOi2+2UjxwAyQCSTxNaun4Szb5SuCfGw4mul18uGZTZBhEz3UThXCUE/4
 miiqcPeZD3kM+75KMiUm6J5UPnpml30UUYTnWWUA/4lrh7KN6hZIilasEhOD4bCEC/v9XTrvOxM
 yWPAurDunLxP83ONrBUn80m4tWIG91JwTUQyBZFxudm2M8hL08PVEI4umEdujqDEV/2G9+9PMmY
 EDMjPkeAvlpuLQOxAn3q/HdgWP2vi+jwCt1YhzHWXm1h8i/gdCY5Zs4cswfc/oOCbE0N7yk/6lh
 2kGVe85rw0BAioH+VVg==
X-Authority-Analysis: v=2.4 cv=XKql2ghE c=1 sm=1 tr=0 ts=6ad576bc cx=c_pps
 a=6mgWUpd4vGE96FGw1JXD8A==:117 a=6mgWUpd4vGE96FGw1JXD8A==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=XGr2FpfLDd2dUKU_94WB:22 a=gEfo2CItAAAA:8 a=z6gsHLkEAAAA:8 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=CjxXgO3LAAAA:8 a=PX5HcJp-5YGQQ3Q42xoA:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: ICTkK758jbs_MuWF8BjiTaLqh77O6xC_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwNiBTYWx0ZWRfX3hiDPY/iRyLX
 8xEyb63HVvzwd9Or/D0lirSI1wjDLNifYZ3s36IFTnrMpaZhWUReF9JjLYcb7BGm2U95BSHnXpQ
 yJQD/coGvut9naQKOsIt7qQOCmqImTW6wOWBhAau1A0OfSrMBr0v
X-Sony-Outbound-GUID: ICTkK758jbs_MuWF8BjiTaLqh77O6xC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
over 2 or 4 data lanes.

Add device tree bindings for the sensor.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor@kernel.org>
---
Changes in v5:
- Add Reviewed-by and Acked-by tags omitted in v4.
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

