Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715641;
	b=Lte6Ocv/0GFzCEYy1Sx44lb8wAFusq6uUotzUkz+329urcomDgJm1pRftAyvTAveJvLV
	 jYCC0+pYaiXugd38BaNKpcP4EDsRalhWxlXEdEO70n2pX2imSJdi/2nrttnbyGH7F5Y1t
	 zjCN8IfPazgN0hsd2EzfrVGAVGf5L6ACJDTXLfhGm1MU5H4rQ+fhGcHe7d+oG0yOlVitj
	 RSmnJcZXV0EV4UKibI0hDypVbN6Vc9EnMmpZyQbsm27nScxZjNbgNxgSOPRsiqFAEUDAb
	 pqdO4VFhTyqjJ9I61alUJHJ8WZuT1HZgUroj+32nWPFZVJdTuVnNQc01/BYwbzZAXqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715641;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=HVDWQILRNpxgUD+65/hwXJDdBNPyWO35184YLecShUk=;
	b=NEvL5BevvoOnROvAV8m2KWnu/vXjxZbFzOaA3tvsguXYYAkvpVFxjNPdB6NKcSbhaVvw
	 iV9SgYtg2pPMcqeitsMfwFM/0X85TUnEV6CJiHjwspDoQ0R252j8OT14RM0oO7THqbZku
	 J9u5u0dyOAiFfIb03hMvc4jSxrJwy6b2XzebN/cCo80rl0hEolxJ8aHn9Yr3KA/jevqID
	 92AU7e8AIzaKCXgdbcJCWKIAKUErXpvXKL3Ql1xTapf9gGNAJbJKiEGjVmxY0S9m6iiA8
	 IUh0Cj4Mn/6SFzkn8HuTXTP0gf6EgrL9YpVR/Unp+7ZLBJt1IAQ7BwyDVDwG69+IXNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=FixmBj2P;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C1606D81F;
	Tue,  3 Nov 2026 14:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6C1606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=FixmBj2P
Received: by chaosmail.tech (Postfix) id 21A441CA44C;
	Tue, 03 Nov 2026 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793715631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVDWQILRNpxgUD+65/hwXJDdBNPyWO35184YLecShUk=;
	b=FixmBj2PhO7nHV4lSI3HWzaq1cm7z/eWuIhh1XerTDsm2ah21RJ6aWQ/0og/+BcIiR+5hn
	+738FdKk8Hh/zMLU9riDGYODGQtPcib5iYyT7+LnRyuFPVf6wBomhhRwSUrSi5e1o6I8fl
	FiOjh5VtlFyHy/PbBxyAyICa4iBxD4Q=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 03 Nov 2026 15:20:23 +0100
Subject: [PATCH v8 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-tipd-ace3-v8-1-770f42421753@chaosmail.tech>
References: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
In-Reply-To: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715630; l=3481;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=FTIeND6mW8/sH2AzpokvwMXi+ZsnBXSt2Qu+7LruQJM=;
 b=8b0QYH2RSO6/PLvHLwoyHtbrSVJB1c1DQdJaBjhbG1s0pEAMF1tdexqBlD7DcRMTBYaVpioDS
 S9KUswg9dZyADSOkQHnbAM82H15s0GLqzmXBszuMRXJ5YkBZL4o9oCJ
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

A variant of tps6598x that is attached to a SPMI bus and is found on
Apple devices starting from the M3 series

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |  1 +
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
new file mode 100644
index 000000000000..133a71bbedb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/apple,sn201202x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments sn201202x Type-C Power Delivery controller
+
+maintainers:
+  - Sasha Finkelstein <k@chaosmail.tech>
+
+description: |
+  Texas Instruments sn201202x Type-C Power Delivery controller
+
+  A variant of tps6598x controller also known as Apple ACE3
+  present on hardware with Apple SoCs starting from the M3.
+
+properties:
+  compatible:
+    enum:
+      - apple,sn201202x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Primary irq used for tps6598x events
+      - description: Logical register selection completed
+      - description: Standby command completed
+      - description: Wakeup command completed
+
+  interrupt-names:
+    items:
+      - const: irq
+      - const: select
+      - const: sleep
+      - const: wake
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        usb-pd@c {
+            compatible = "apple,sn201202x";
+            reg = <0xc SPMI_USID>;
+            interrupts = <11 IRQ_TYPE_EDGE_RISING>,
+                         <13 IRQ_TYPE_EDGE_RISING>,
+                         <17 IRQ_TYPE_EDGE_RISING>,
+                         <19 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "irq", "select", "sleep", "wake";
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+
+                port {
+                    typec_ep: endpoint {
+                        remote-endpoint = <&otg_ep>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..6bf3e8f35095 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2736,6 +2736,7 @@ F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
+F:	Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/

-- 
2.56.0

