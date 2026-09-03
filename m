Received: from ironport.ite.com.tw (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F221F411FB4;
	Thu,  3 Sep 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430595; cv=none; b=p8i8/4WMMcJ8c0MRPbgxDnfQhspaY+uHrmXw/LivHPqbYKhZfcKRFY/f9oBFFpfYkKFCSclouCnNaQ+U0aiKSnMiKQ7pnBuODo3XxAeIjGuN8kEjt9cVWUsrvWNsWzt7VijpMfuhoOt5+JbrsasPGA9B9wDKklCkKv3zUsIXuDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430595; c=relaxed/simple;
	bh=ldipukv9pusXhp9hjPoYFCaQL2MpzifOv0fcA7Ty/os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fk6N1w5FViUwBa6esb4Tw3ezK5LPvAIGYSb3OXXi8obo6vw/7h64mQ5zdWCP3Ej9pczhv7HCmmn+N3ow7TTPp9Ih8K9mg0umHK1D1P9qe6JBp5BDERQiIMaeLVacRg0zbKn/MIGryGl7+aPd0beeUiG+fe1R+u0JfBf2GSUAdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=XFGn+v+2; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="XFGn+v+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=76WSQpuQ/Dm4bFaRITCmBuN1RDkcqDthNRxUFzeBojA=;
  b=XFGn+v+2g4nntFm0q/DEhAYCmfl4ZnD9BSeROhy9Hhn3XV6ORQN5vbei
   +JqxHlvADT3aASEcf4cOdHbTxZf8OBeodNuHA/ACumCjmPk9k0z8jeGq4
   cfYpgX74tq709u22Q1BnJh/xsaDKcmE3L68uzYgO7n0AgE0cDDdPB7hUK
   TLYVhvYVQDzjuV6ZPdgzhSaymFfJ6KodE2e63MFr46A3DYBVGq2+fFAJv
   S/XOzDuNrhL75M0l25A4PN9IsY2vNd290P85Mz4mITM0us1RSc4ohPAby
   1CnYDJYlBjSpd4r6Hwq9to+Ljr+zjgc5TLtkTVvm6bBWooJLw3ngwk4fk
   A==;
X-CSE-ConnectionGUID: 0Vdxsr9sQzS3Zh9W1mtSig==
X-CSE-MsgGUID: 8JRtMXdkRryh2McOQCveuw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 03 Sep 2026 18:15:07 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 683AF3hR042979;
	Thu, 3 Sep 2026 18:15:03 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id B180D2D58;
	Thu,  3 Sep 2026 18:15:02 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Thu, 03 Sep 2026 18:15:43 +0800
Subject: [PATCH] dt-bindings: usb: Add ITE IT5271/IT5272/IT5273/IT5274
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-it5271-binding-v1-1-1abd2c8cea85@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXpDxWuIhbKtMaipEUk4u6K5
 bd474KIgTBCk10Q8KBIi08QeQbD1HuHjMZkkFxqXnPFaCtlJZghP5J3rFC9qrTlphYWUrQGtHR
 +w7b7HXcz47C9F7jvB3PNnsFyAAAA
X-Change-ID: 20260903-it5271-binding-43a376f0b91f
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 683AF3hR042979

Add device tree binding documentation for the ITE IT527x series
(IT5271, IT5272, IT5273, and IT5274) I2C-based USB Type-C Power
Delivery (PD) controllers.

The series comprises four variants differing by port count and
Power Range support:
- IT5271: single-port, SPR (Standard Power Range)
- IT5272: two-port, SPR
- IT5273: single-port, EPR (Extended Power Range)
- IT5274: two-port, EPR

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
The driver for this device family is shared with ITE IT8851/IT8853,
currently under review as a separate series:
https://patchwork.kernel.org/project/linux-usb/patch/20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw/

This binding is submitted independently so it can be reviewed on
its own; once the driver series lands, IT527x support will be
wired into it there.
---
 .../devicetree/bindings/usb/ite,it5271.yaml        | 176 +++++++++++++++++++++
 MAINTAINERS                                        |   8 +
 2 files changed, 184 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ite,it5271.yaml b/Documentation/devicetree/bindings/usb/ite,it5271.yaml
new file mode 100644
index 000000000000..29cd7add9bde
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ite,it5271.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ite,it5271.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT5271/IT5272/IT5273/IT5274 USB Type-C Power Delivery Controller
+
+maintainers:
+  - Amber Kao <amber.kao@ite.com.tw>
+
+description: |
+  The ITE IT527x series are I2C-based USB Type-C Power Delivery (PD)
+  controllers.
+  All variants support DFP/UFP/DRP roles, USB PD 3.1, Fast Role Swap,
+  USB4, and TBT3/TBT4 alternate modes.
+
+  The series comprises four ordering part numbers built on identical
+  silicon; port count and PD power range support are configured via
+  firmware/OTP rather than differing in the register interface itself:
+    - IT5271: single-port variant, SPR
+    - IT5272: two-port variant, SPR
+    - IT5273: single-port variant, EPR
+    - IT5274: two-port variant, EPR
+
+properties:
+  compatible:
+    oneOf:
+      - const: ite,it5271
+      - items:
+          - const: ite,it5272
+          - const: ite,it5271
+      - items:
+          - const: ite,it5273
+          - const: ite,it5271
+      - items:
+          - const: ite,it5274
+          - const: ite,it5271
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    properties:
+      reg:
+        maxItems: 1
+    required:
+      - reg
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ite,it5272
+                - ite,it5274
+    then:
+      properties:
+        connector@1: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* IT5274: two-port, EPR variant */
+        typec@26 {
+            compatible = "ite,it5274", "ite,it5271";
+            reg = <0x26>;
+            interrupts-extended = <&tlmm 129 IRQ_TYPE_EDGE_FALLING>;
+            wakeup-source;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C-0";
+                power-role = "dual";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        endpoint {
+                            remote-endpoint = <&eud_con>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        endpoint {
+                            remote-endpoint = <&redriver_ss_out>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        endpoint {
+                            remote-endpoint = <&dp_phy_out>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C-1";
+                power-role = "dual";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        endpoint {
+                            remote-endpoint = <&usb1_hs_con>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        endpoint {
+                            remote-endpoint = <&redriver1_ss_out>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        endpoint {
+                            remote-endpoint = <&dp_phy1_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4dfc1fb14ef7..1a35242257fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13940,6 +13940,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 F:	drivers/gpu/drm/bridge/ite-it66121.c
 
+ITE IT5271 TYPE-C PD CONTROLLER DRIVER
+M:	Amber Kao <amber.kao@ite.com.tw>
+M:	ITE PD TEAM <ite_pd@ite.com.tw>
+R:	Yaode Fang <Yaode.Fang@ite.com.tw>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/ite,it5271.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260903-it5271-binding-43a376f0b91f

Best regards,
--  
Amber Kao <ite_pd@ite.com.tw>

