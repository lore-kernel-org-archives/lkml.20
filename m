Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABE28505E;
	Fri, 11 Sep 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121916; cv=none; b=tEqn0jptYLrU9FxmG7HwrLcqvsZyL3hlK/IoDU+5K97IaFzz172FQwU7CM+4Fkyqh+U5f8RlBEanNIIaFbPWKK8arW5a4Dkv/o6g8CqkDO089yNjSFGAF3r/X1RTtJJQcFvcw0PmSlO2s/QrzNkLjxpzqbZiWCqyi0Aa3+qL8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121916; c=relaxed/simple;
	bh=EZFgjzmIkXKtBiVBR5kDiTZvhm0BWlSah60eYrztaZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7NRa7Sl54IDRJYPoBlbslmV3IM7XqeAP4ZSxB5L24k/L2OCx32Y3IEmtfoPfLME8004BgUOkZElqNE293zTgk/UZ15XISN0z24a1roLkhARPrihEAokyRzAYKAs0btA3UZT1ZrCtGNsVz6KCG9NAiDGNeFaA2bdNo48P+02ko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=Fqwlyw3A; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="Fqwlyw3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oHvNl5rUJ3iJJdtBUPTK1GIxlFixSOtnW5yXY3TOxLk=;
  b=Fqwlyw3AwS1lZ5qS1YO/T2QU4of37Q2jEWB3YBDLxBzlNXOhhOrfxHJ5
   nGhTWEmkmJpjaRT7vSF4GrV40y4/gsbpyvRvWZXv7+uKlhrlJzuQRpy4y
   2pCouBCRuHsxQHxvtFTF1Swr/gKqktqFU9AVLngbQYTqvMg0vzuJ+wnb9
   dt4DXdO/M+TIK9QSGZ3RM1JltZLrBH2umDKeSOPpLdDvnLkDx2QdKhQ6B
   YY+JibqemAxUubpmXR1262m/tNgot/qXHz8zDMWk0LF66dIXEDetUM9y1
   vnqipsvLQ2XNaottEBxPYMpG1CC+j0ruQKtogCfGy4bIw1eIlqHp2vsyr
   Q==;
X-CSE-ConnectionGUID: 7drFANLVSYGdQwkq9b8wyw==
X-CSE-MsgGUID: mCOKXzzqQf+SLLc0IAe7GQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 11 Sep 2026 18:17:20 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68BAHGM7037146;
	Fri, 11 Sep 2026 18:17:16 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id 7C62E2D59;
	Fri, 11 Sep 2026 18:17:16 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Fri, 11 Sep 2026 18:17:57 +0800
Subject: [PATCH 1/2] dt-bindings: usb: ite,it8851: Add IT5271 series
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ucsi-itepd-it527x-v1-1-14c8041afb53@ite.com.tw>
References: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
In-Reply-To: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 68BAHGM7037146

Add compatible strings for the ITE IT5271 series USB Type-C Power
Delivery controllers. The IT5272 and IT5274 are the two-port variants,
and the IT5273 and IT5274 additionally support EPR (Extended Power
Range). All of them share the IT5271 programming interface.

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
 .../devicetree/bindings/usb/ite,it8851.yaml        | 72 +++++++++++++++++++---
 1 file changed, 65 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ite,it8851.yaml b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
index defd431aba97..e2e50507f573 100644
--- a/Documentation/devicetree/bindings/usb/ite,it8851.yaml
+++ b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
@@ -4,23 +4,33 @@
 $id: http://devicetree.org/schemas/usb/ite,it8851.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ITE IT8851/IT8853 USB Type-C Power Delivery Controller
+title: ITE USB Type-C Power Delivery Controllers
 
 maintainers:
   - Jeson Yang <jeson.yang@ite.com.tw>
-  - Amber Kao <amber.kao@ite.com.tw>
+
 description:
-  The ITE IT8851 is an I2C-based USB Type-C Power Delivery (PD) controller
-  supporting one Type-C port.
-  The IT8853 is the two-port variant sharing the same programming interface.
+  I2C-based USB Type-C Power Delivery (PD) controllers sharing the same
+  programming interface. The IT8853, IT5272 and IT5274 drive two Type-C
+  connectors, the other variants drive one.
 
 properties:
   compatible:
     oneOf:
-      - const: ite,it8851
+      - enum:
+          - ite,it5271
+          - ite,it8851
+      - items:
+          - enum:
+              - ite,it5272
+              - ite,it5273
+              - ite,it5274
+          - const: ite,it5271
       - items:
           - const: ite,it8853
           - const: ite,it8851
+    description:
+      IT5273 and IT5274 support EPR (Extended Power Range).
 
   reg:
     maxItems: 1
@@ -63,7 +73,10 @@ allOf:
         properties:
           compatible:
             contains:
-              const: ite,it8853
+              enum:
+                - ite,it5272
+                - ite,it5274
+                - ite,it8853
     then:
       properties:
         connector@1: false
@@ -154,3 +167,48 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@26 {
+            compatible = "ite,it5271";
+            reg = <0x26>;
+            interrupts-extended = <&tlmm 130 IRQ_TYPE_EDGE_FALLING>;
+            wakeup-source;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C";
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
+                            remote-endpoint = <&usb_hs_con>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        endpoint {
+                            remote-endpoint = <&usb_ss_con>;
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.53.0

