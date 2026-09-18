Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1945358372
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753487; cv=none; b=EOQImQoMDxz+AUP6jxbHsdxRRtkOmCszTNAoMgbFsMmExWSh6QG3tlFNCKCxCOcmvZCJxNdYzYJcX57uUeLHneeBdYdNFx884m9lMSnXDuxNoZdtAWZ+aADUwhFOYsIMG/5WfGGZThhduiCJtSDE91AqvTAdbv0Xddjt7C8pTOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753487; c=relaxed/simple;
	bh=OUN+pfzR5anohMB5Jqn5sg8VfCunB66oixWjJ/x8nhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRpMrX0hV8pKUWrQFBboKvKCfmK3SwWVG8Lk4cCo/hsc2qqJbZ4XDYRP0kuI1n1adR58K8WBfdxfYAQWDeVOJzrz4U9JDa5553Kw67L55cBGRphk/jnKiDv1LgMv7cdyl8rRoQQLqWcwytNnA3PChZmos3ioMXDwyB89LSyfq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CV+2IlBd; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV+2IlBd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso6282745e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753480; x=1790358280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kDUreuc76Q9stUrtsT2uw4I0y03Sjd0Pb3pKM1mRunI=;
        b=CV+2IlBd+00rYH7F5QmtiS2IlbEzysADWXhg0oiEk4YvASLiLILWa9Dy06aDyN/6YZ
         NC1ykjjKaIuTGFm+UqLbOG8n9DM0rnCyClnaS/42P1Qe40d1B0/yM086O48uhTs1fzxr
         fuLwQKHnvPXOvbrovjGUEvqDWpJHJwMw1zTvfK6bYRWGkldDwuAB23q7ahzW6OjfE9hE
         qI/55z0sJzq8Q+OMzIIHttubc+v62HKanLYIjA+Ic7EXQP8HnJpLqh9HzzZ85UUK0lqU
         3GBbs9SLj+Xbmf5RALlu1wzEwSaDsPZPKULs9sNULkTzLn2EPzEVXsCe0nPVjaQLc/GP
         Y50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753480; x=1790358280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDUreuc76Q9stUrtsT2uw4I0y03Sjd0Pb3pKM1mRunI=;
        b=NSzUoq2oIop9qBEHzKcU3Rrl9wA0Rg7Zt8jSZLioyjhLqBOQH6n9OZQJVFipYqTzPp
         bgoKOL3ZKgcWaGiJ7YSeZU1Qo5kOW71kpROI7kHPzuG9kc4fakXmBOYEylmMCOI7M+yJ
         p6Kc0Qy0/+PjvPYvMGUThl2kpenISlH8YeZmAEwc8gyeKjtJBHhxIEhFbKBZtkPbssdS
         vhIdKHNHpx/GwI8/0odtnLbwO0FbM9k2D+vK03iiY5CZFTi2JrwZAQP7VqPX7GHrrsK8
         M7U+Ooz9HNmNeo0+Dr+RzXGT90gNqA3RLoCoEzCVWLZP8EvuIUuMceuLo6XTtAODtv8p
         fSzg==
X-Forwarded-Encrypted: i=1; AKwUvByQAnwABaxW2t9vfRvbqfFWURfLOSOuBdO/s1yxRlwrx6LlAcvebCZGaVl+DMTbF++/QlVU2TXrVp0V2vg=@vger.kernel.org
X-Gm-Message-State: AFuF++m1Vvgbxwk0DEOu7rS7I/QX/KoWC+WBrwPX5BE8qzPuYS+WE9PS
	b+ewsPtWPDhHn6yfBbj7oXVtfwMpsNwCHlHq3SMwGbPlmb33C1dzZxK3
X-Gm-Gg: AYBFou07nHvqlR1rv5wJa3CCjjB0C9mH4BYH1II43lEZWFROPIu81QUsVKKgrxRoxof
	4DCQtAOIWEDaNF9QXCChf5cTRGOj0Byka6QFiSqAvYGzQI591uDbLhp3JRgvJteX2Xf5j1jPheW
	jd36V40GGiVJqC75a0UMGFGnpsA6areK2C1GI850CF+qq2GsWubJytkvBscl+FjDxGuf+1wgBWB
	/n6FqOvNxMhN+NwuwmLwWNgEpPpj0kr3gjyk4otzyW7Ou2idY/ItStLGSNoNd55l6UB0tDeyzTm
	x1ZLiSseSMYMGiqNrxHaJXTtgJ/Ako3SNwwwGGgKBMnE12O8/nhJByqk7armuS3q3ZLJS8wmIN+
	bJMSyQ7GrpsO6bYyW0kCB3n3uSwx424mtlkZNxQT7tw8lKHg6UNw4duzBwBNUdRBsjiLM3gjqVJ
	/5S4CPdDfHyPg0GRD/mqXrpLFtkU++sdgOCyjCBsVvLLL7P6GXHkemSQduwdD5EjVCTjjZKz3qc
	mVsfj5noI6jzxhBL8WSZi33IAAoxNigOGYmGVIVZWpO4UM=
X-Received: by 2002:a05:600c:a013:b0:49e:6891:27a8 with SMTP id 5b1f17b1804b1-49fc574a9bcmr37517585e9.25.1789753479422;
        Fri, 18 Sep 2026 10:44:39 -0700 (PDT)
Received: from localhost.localdomain ([176.220.123.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7e05sm8166525e9.4.2026.09.18.10.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:44:39 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Date: Fri, 18 Sep 2026 20:44:13 +0300
Message-ID: <20260918174413.17155-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add yaml devicetree binding for xlnx,zynq-xadc-1.00.a,
xlnx,axi-xadc-1.00.a and xlnx,system-management-wiz-1.3 from
xilinx-xadc.txt file.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 Changes in v2:
 - Fix logic in xlnx,channels node by adding missing required properties
   (#address-cells and #size-cells).
 - Update conditional logic in allOf section to enforce required properties
   for 'single' and 'dual' external-mux modes.
 - Add SPDX license identifier header at top of schema file.

.../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
 .../bindings/iio/adc/xlnx,xadc.yaml           | 185 ++++++++++++++++++
 2 files changed, 185 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
deleted file mode 100644
index f42e18078..000000000
--- a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-Xilinx XADC device driver
-
-This binding document describes the bindings for the Xilinx 7 Series XADC as well
-as the UltraScale/UltraScale+ System Monitor.
-
-The Xilinx XADC is an ADC that can be found in the Series 7 FPGAs from Xilinx.
-The XADC has a DRP interface for communication. Currently two different
-frontends for the DRP interface exist. One that is only available on the ZYNQ
-family as a hardmacro in the SoC portion of the ZYNQ. The other one is available
-on all series 7 platforms and is a softmacro with a AXI interface. This binding
-document describes the bindings for both of them since the bindings are very
-similar.
-
-The Xilinx System Monitor is an ADC that is found in the UltraScale and
-UltraScale+ FPGAs from Xilinx. The System Monitor provides a DRP interface for
-communication. Xilinx provides a standard IP core that can be used to access the
-System Monitor through an AXI interface in the FPGA fabric. This IP core is
-called the Xilinx System Management Wizard. This document describes the bindings
-for this IP.
-
-Required properties:
-	- compatible: Should be one of
-		* "xlnx,zynq-xadc-1.00.a": When using the ZYNQ device
-		  configuration interface to interface to the XADC hardmacro.
-		* "xlnx,axi-xadc-1.00.a": When using the axi-xadc pcore to
-		  interface to the XADC hardmacro.
-		* "xlnx,system-management-wiz-1.3": When using the
-		  Xilinx System Management Wizard fabric IP core to access the
-		  UltraScale and UltraScale+ System Monitor.
-	- reg: Address and length of the register set for the device
-	- interrupts: Interrupt for the XADC control interface.
-	- clocks: When using the ZYNQ this must be the ZYNQ PCAP clock,
-	  when using the axi-xadc or the axi-system-management-wizard this must be
-	  the clock that provides the clock to the AXI bus interface of the core.
-
-Optional properties:
-	- xlnx,external-mux:
-		* "none": No external multiplexer is used, this is the default
-		  if the property is omitted.
-		* "single": External multiplexer mode is used with one
-		   multiplexer.
-		* "dual": External multiplexer mode is used with two
-		  multiplexers for simultaneous sampling.
-	- xlnx,external-mux-channel: Configures which pair of pins is used to
-	  sample data in external mux mode.
-	  Valid values for single external multiplexer mode are:
-		0: VP/VN
-		1: VAUXP[0]/VAUXN[0]
-		2: VAUXP[1]/VAUXN[1]
-		...
-		16: VAUXP[15]/VAUXN[15]
-	  Valid values for dual external multiplexer mode are:
-		1: VAUXP[0]/VAUXN[0] - VAUXP[8]/VAUXN[8]
-		2: VAUXP[1]/VAUXN[1] - VAUXP[9]/VAUXN[9]
-		...
-		8: VAUXP[7]/VAUXN[7] - VAUXP[15]/VAUXN[15]
-
-	  This property needs to be present if the device is configured for
-	  external multiplexer mode (either single or dual). If the device is
-	  not using external multiplexer mode the property is ignored.
-	- xnlx,channels: List of external channels that are connected to the ADC
-	  Required properties:
-		* #address-cells: Should be 1.
-		* #size-cells: Should be 0.
-
-	  The child nodes of this node represent the external channels which are
-	  connected to the ADC. If the property is no present no external
-	  channels will be assumed to be connected.
-
-	  Each child node represents one channel and has the following
-	  properties:
-		Required properties:
-			* reg: Pair of pins the channel is connected to.
-				0: VP/VN
-				1: VAUXP[0]/VAUXN[0]
-				2: VAUXP[1]/VAUXN[1]
-				...
-				16: VAUXP[15]/VAUXN[15]
-			  Note each channel number should only be used at most
-			  once.
-		Optional properties:
-			* xlnx,bipolar: If set the channel is used in bipolar
-			  mode.
-
-
-Examples:
-	xadc@f8007100 {
-		compatible = "xlnx,zynq-xadc-1.00.a";
-		reg = <0xf8007100 0x20>;
-		interrupts = <0 7 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&pcap_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-			};
-			channel@1 {
-				reg = <1>;
-			};
-			channel@8 {
-				reg = <8>;
-			};
-		};
-	};
-
-	xadc@43200000 {
-		compatible = "xlnx,axi-xadc-1.00.a";
-		reg = <0x43200000 0x1000>;
-		interrupts = <0 53 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&fpga1_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-				xlnx,bipolar;
-			};
-		};
-	};
-
-	adc@80000000 {
-		compatible = "xlnx,system-management-wiz-1.3";
-		reg = <0x80000000 0x1000>;
-		interrupts = <0 81 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&fpga1_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-				xlnx,bipolar;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
new file mode 100644
index 000000000..f9b717c29
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/xlnx,xadc.yaml#
+$schema: http://devicetree.org/schemas/meta-schema.yaml#
+
+title: Xilinx XADC device driver
+
+maintainers:
+  - Omer PALA <palaomer100@gmail.com>
+
+description: |
+  This binding document describes the bindings for the Xilinx 7 Series XADC as well
+  as the UltraScale/UltraScale+ System Monitor.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,zynq-xadc-1.00.a
+      - xlnx,axi-xadc-1.00.a
+      - xlnx,system-management-wiz-1.3
+
+  reg:
+    description: Address and length of the register set for the device
+    maxItems: 1
+
+  interrupts:
+    description: Interrupt for the XADC control interface.
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-parent: true
+
+  xlnx,external-mux:
+    description: Selects the external mux mode.
+    enum: [none, single, dual]
+    default: none
+
+  xlnx,external-mux-channel:
+    description: >
+      Configures which pair of pins is used to sample data in
+      external mux mode.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,channels:
+    type: object
+    description: List of external channels that are connected to the ADC.
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+    required:
+      - "#address-cells"
+      - "#size-cells"
+    patternProperties:
+      "^channel@[0-9a-f]+$":
+        type: object
+        properties:
+          reg:
+            description: Pair of pins the channel is connected to
+            minimum: 0
+            maximum: 16
+          xlnx,bipolar:
+            description: If set the channel is used in bipolar mode.
+            $ref: /schemas/types.yaml#/definitions/flag
+        required:
+          - reg
+        additionalProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: none
+    then:
+      properties:
+        xlnx,external-mux-channel: false
+
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: single
+    then:
+      properties:
+        xlnx,external-mux-channel:
+          minimum: 0
+          maximum: 16
+      required:
+        - xlnx,external-mux-channel
+
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: dual
+    then:
+      properties:
+        xlnx,external-mux-channel:
+          minimum: 1
+          maximum: 8
+      required:
+        - xlnx,external-mux-channel
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      xadc@f8007100 {
+        compatible = "xlnx,zynq-xadc-1.00.a";
+        reg = <0xf8007100 0x20>;
+        interrupts = <0 7 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&pcap_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          channel@0 {
+            reg = <0>;
+          };
+          channel@1 {
+            reg = <1>;
+          };
+          channel@8 {
+            reg = <8>;
+          };
+        };
+      };
+      xadc@43200000 {
+        compatible = "xlnx,axi-xadc-1.00.a";
+        reg = <0x43200000 0x1000>;
+        interrupts = <0 53 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@0 {
+            reg = <0>;
+            xlnx,bipolar;
+          };
+        };
+      };
+      adc@80000000 {
+        compatible = "xlnx,system-management-wiz-1.3";
+        reg = <0x80000000 0x1000>;
+        interrupts = <0 81 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@0 {
+            reg = <0>;
+            xlnx,bipolar;
+          };
+        };
+      };
+    };
-- 
2.55.0

