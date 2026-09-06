Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98E3C4B93;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719827; cv=none; b=azxVbgxGMxX3kim0EReuFvljVFuKZ1pqsUgJVHrvCOhXhzUoWNOgRLqy/V83nj7pvM6Q9OumXql8UiqusJCrLAYlzDxTKDhUsnJlpE1UDBC/dl+dRWIbNGHO6vvoA2fq+YaFNQcYd1JL/Xu0BsUBf1D4Pq5Nxir33y/AZItarg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719827; c=relaxed/simple;
	bh=Lrw4AjJ97p2myBlJOEqJM3QBI7DYQbZi5S0l017NVLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWv1pE5EPwMCUM0jAkVLWplUU8l8ys60AG8YVcHv+m4JqH2XDDb2KKEMu8osVkZbefx9jNNdITjfeTLDCSyoun4Kh/ek5kz0lIja32p2mWsA17YMwsmLcAULWT/mma/GQBrTUX+fgqqOiAHuaorwJBp7bFT+7tQKSLuZ3adu11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B676NGc/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B676NGc/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9507FC32781;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=Lrw4AjJ97p2myBlJOEqJM3QBI7DYQbZi5S0l017NVLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B676NGc/3yk3/GO43PXmKq5N2RlKlj7n4G9LmGll0WmYj+a2m+/RfHplkON+mEq9w
	 /9jNusV+Yz0Xn7hq2pomcPxZVYouEr5rUCueTSK0k4Ls+zFoWhcDa8lRAaRblGqZau
	 c0gi3aP6MD9D/pvwCqCbmTamQwl6HBDhkiBz/YMAPyDjQVtSVfpkQus3Ghh0nD5aVp
	 fJeWMH8zRdRDBAPwP4UduIdlEXtIJdEWq5iB1Q7o8/Ud16d1L1k3koPsMU0Cp0At0u
	 7vNkmUdgOzDo8TKOn+5MlEReSidb8kla3V8W0LzRrUTewSobYMm2V1qOJH2kRr+loh
	 uD7Y6CEZTBP/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82426C79F8C;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:29 +0200
Subject: [PATCH v2 06/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt ACIO block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-6-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9043; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Lrw4AjJ97p2myBlJOEqJM3QBI7DYQbZi5S0l017NVLM=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTXttWH5+EHMIZJlVcvJ8lVbye1auNz52yX+2ld6zm
 Mb8+0NmRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAikgUM/z13brGW3GcdkpBx
 T8bb+nJFfbf7noJ1xYUz+MO8c8t2aTP8D85x7T457cGM/dHVG3pMDtvd2hHV7rtTIjg/b6XY2wn
 /WQE=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Each Type-C port with USB4/Thunderbolt support on Apple Silicon SoCs
comes with block called ACIO ("Apple Converged I/O"). It contains a
Cortex-M3 co-processor, the hardware blocks implementing the USB4 host
router, the Native Host Interface (NHI) and a DART IOMMU. The
co-processor exposes the NHI and its DART to the main SoC bus while it
is running.

ACIO can only be powered on after the Type-C PHY has been switched to
USB4/Thunderbolt mode. The Type-C PD controller publishes the negotiated
mode and cable information through the Type-C class. ACIO finds the
corresponding Type-C port through the OF graph connection.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../thunderbolt/apple,t8103-usb4-acio.yaml         | 213 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 214 insertions(+)

diff --git a/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-acio.yaml b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-acio.yaml
new file mode 100644
index 000000000000..5bfe7a66923e
--- /dev/null
+++ b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-acio.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thunderbolt/apple,t8103-usb4-acio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon USB4/Thunderbolt Host Router (ACIO)
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description: |
+  Each Type-C port with USB4/Thunderbolt support on Apple Silicon SoCs has a
+  host router complex called ACIO (Apple Converged I/O). It contains a
+  Cortex-M3 co-processor, the hardware blocks implementing the USB4 router
+  and its PCIe, USB3 and DisplayPort adapters.
+
+  The co-processor exposes the Native Host Interface (NHI) and its DART IOMMU
+  to the main SoC bus once it is running. They are therefore represented as
+  child nodes. All child registers are located in a single 16 MiB MMIO window
+  and use addresses relative to this window.
+
+  ACIO can only be powered on after the Type-C PHY has been switched to
+  USB4/Thunderbolt mode. Before the connection to the remote device can be
+  established the Type-C PD controller has to publish the negotiated mode and
+  cable information through the Type-C class. ACIO finds the corresponding
+  Type-C port through the OF graph connection.
+
+properties:
+  compatible:
+    oneOf:
+      - const: apple,t8103-usb4-acio
+      - items:
+          - enum:
+              - apple,t6000-usb4-acio
+              - apple,t6020-usb4-acio
+              - apple,t6030-usb4-acio
+              - apple,t6031-usb4-acio
+              - apple,t8112-usb4-acio
+              - apple,t8122-usb4-acio
+          - const: apple,t8103-usb4-acio
+
+  reg:
+    items:
+      - description: Root complex and co-processor control registers
+      - description: SRAM used for communication with the co-processor
+
+  reg-names:
+    items:
+      - const: rc
+      - const: sram
+
+  mboxes:
+    maxItems: 1
+    description: Mailbox used for RTKit communication with the co-processor
+
+  resets:
+    maxItems: 1
+    description: Reset used to start the ACIO block before booting the
+      co-processor
+
+  power-domains:
+    maxItems: 3
+
+  apple,tunable-rc:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Register offset
+        - description: Mask of bits to clear
+        - description: Bits to set
+    description: |
+      List of (register offset, mask, value) tuples copied from Apple's Device
+      Tree, converted by the bootloader and used to configure the root complex
+      after the co-processor has booted.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges:
+    maxItems: 1
+    description: Single 16 MiB MMIO window containing all child registers
+
+  nonposted-mmio: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      OF graph ports for the USB4 router. The port numbers correspond to the
+      USB4 router adapter numbers.
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Lane 0 adapter of the connector-facing USB4 port
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Lane 1 adapter of the connector-facing USB4 port
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: PCIe adapter
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB3 adapter
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: First DP IN adapter
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Second DP IN adapter
+
+    required:
+      - port@1
+
+  iommu@a80000:
+    $ref: /schemas/iommu/apple,dart.yaml#
+    description: DART IOMMU exposed by ACIO and used for DMA from the NHI
+
+  nhi@f00000:
+    $ref: /schemas/thunderbolt/apple,t8103-usb4-nhi.yaml#
+    description: Native Host Interface exposed by ACIO
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - mboxes
+  - power-domains
+  - resets
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - nonposted-mmio
+  - ports
+  - iommu@a80000
+  - nhi@f00000
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cio@501ac0000 {
+            compatible = "apple,t8103-usb4-acio";
+            reg = <0x5 0x01ac0000 0x0 0xc000>,
+                  <0x5 0x01080000 0x0 0x20000>;
+            reg-names = "rc", "sram";
+            ranges = <0x0 0x5 0x01000000 0x1000000>;
+            #address-cells = <1>;
+            mboxes = <&usb4_1_mbox>;
+            nonposted-mmio;
+            pinctrl-0 = <&acio1_pins>;
+            pinctrl-names = "default";
+            power-domains = <&ps_atc1_cio>,
+                            <&ps_atc1_cio_pcie>,
+                            <&ps_atc1_cio_usb>;
+            resets = <&cio_reset 1>;
+            #size-cells = <1>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&typec1_con_tbt>;
+                    };
+                };
+            };
+
+            usb4_1_dart: iommu@a80000 {
+                compatible = "apple,t8103-dart";
+                reg = <0xa80000 0x4000>;
+                interrupt-parent = <&aic>;
+                interrupts = <1 890 4>;
+                #iommu-cells = <1>;
+            };
+
+            nhi@f00000 {
+                compatible = "apple,t8103-usb4-nhi";
+                reg = <0xf00000 0x100000>,
+                      <0xdb0000 0x30004>;
+                reg-names = "nhi", "pdf";
+                interrupt-parent = <&aic>;
+                interrupts = <1 863 4>, <1 864 4>, <1 865 4>, <1 866 4>,
+                             <1 867 4>, <1 868 4>, <1 869 4>, <1 870 4>,
+                             <1 871 4>, <1 872 4>, <1 873 4>, <1 874 4>,
+                             <1 875 4>, <1 876 4>, <1 877 4>, <1 878 4>,
+                             <1 879 4>, <1 880 4>, <1 881 4>, <1 882 4>,
+                             <1 883 4>, <1 884 4>, <1 885 4>, <1 886 4>;
+                interrupt-names = "txring0", "txring1", "txring2", "txring3",
+                                  "txring4", "txring5", "txring6", "txring7",
+                                  "txring8", "txring9", "txring10", "txring11",
+                                  "rxring0", "rxring1", "rxring2", "rxring3",
+                                  "rxring4", "rxring5", "rxring6", "rxring7",
+                                  "rxring8", "rxring9", "rxring10", "rxring11";
+                iommus = <&usb4_1_dart 1>;
+                /* To be filled by the loader */
+                apple,thunderbolt-drom = [00];
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a9d2e2a914c2..406cf664dedc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2659,6 +2659,7 @@ F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+F:	Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-acio.yaml
 F:	Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.55.0


