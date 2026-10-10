Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6994519A1;
	Sat, 10 Oct 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625429; cv=none; b=lg7ms+3QROQd2T6m4Tx1/t7LFhoM9WrbO+hJfccHyAxLmCy+pJ3A5654Z0bd8/Rfl7aOh8GpkJeueHqDXppOFKVmwvgqV63WP4EQ28eHrxqljqDGqc/vgYw4bm1P4qhVBOmgZWGvIpvumyso4qZ9eN987CUarSaJzeTF/fuGJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625429; c=relaxed/simple;
	bh=hSa4L+QWc2uDvx/tqmkiTHw4LQoP2Kt3Eb1meqwGiAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hM0nJW6MJrTd5PIyULNzmDit8C1+08ED99mJFOnGJhGC+/je5Gj9KJbJ9JG1cGR9R7suQ90sTm7RzVJ1m0IGpc2FYfGZblq7VvQjtcDf04Vhjy8oeFnfGBJi5My2P1H6gHNDy2u2tCxmhOziDYR6nTRTVFB+VaXKA8ZrjA1kVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=HC+LZM4d; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="HC+LZM4d"
Received: by chaosmail.tech (Postfix) id 94BD91CC3B9;
	Sat, 10 Oct 2026 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1791625086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkRk1b0acKcNtNb5LGbx/EpjtFCkjlQU51LIog+QBM0=;
	b=HC+LZM4dYfGd8D6lih2rnmfy5ULP2O+7DJZgB4ZBrZgihlv6WLp+LWN9Eo8OZsfXpdSMsN
	D1H8q3YSEmzS+pzJiZ+5FrqOGERGxpowIYj/5RCMVJfC1rFLmBA3MQ/xjtBiO8z1Ezv5dG
	nh7sXDOEGzjzkihUqKDDkqEghXG9kBk=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 10 Oct 2026 11:37:55 +0200
Subject: [PATCH RESEND v7 1/3] dt-bindings: usb: tps6598x: Add
 sn201202x/ACE3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-tipd-ace3-v7-1-317218a96c01@chaosmail.tech>
References: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
In-Reply-To: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791625084; l=3481;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=hSa4L+QWc2uDvx/tqmkiTHw4LQoP2Kt3Eb1meqwGiAc=;
 b=3sE9VFqok7hPqDR4glc4T5rxGsoKkGlSnB9Cs6TXcXoEDRpSdUgRpNouzw7cWZWUzUeLmajyK
 uoYJd+TUSuiBf4Fl0TE8H0nqc2aTw22Td9jmByEmm0cevMWJ34pshL2
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
index 6215fcb07770..ba4274ed9c79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2659,6 +2659,7 @@ F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
+F:	Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/

-- 
2.56.0

