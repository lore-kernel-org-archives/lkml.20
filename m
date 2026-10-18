Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B53DAAD5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364383; cv=none; b=GgPSZ01Of9mKCeHroLHSs/+Bzt65HSL9JCY2US0xqgXw0peRboVEcM64Fu6d7vnzw2nSzIPCbBcpDGFyF4YamjIyH8FpikfnrP3sLLr6P8wpHm/QTU/Ox2d0XUQW/4AFiubZezZa9JYlEUbvQ/TSsWsCTtMZxRhOHGibIDaEPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364383; c=relaxed/simple;
	bh=j07J2zvz8hG5qOAgfh0vjMLebRhhvRXH1HK8mCL+KIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdM6gFgPuYTbNYp46fQ7Aynrd1IkEwrXkYlYq++UowHNC73MyUhJLRuSIesD2fXPNH9Q/dFYW3Yi+zTJmV7NxQz6g4n3qcob950xjiLLKeSAyxaB+jOgWWz46kkOG/xWWVLt64XbTMpM5rwRdscMg9pqpL26tNkhQX3ggxxhsFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=X4RU3D85; arc=none smtp.client-ip=91.218.175.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="X4RU3D85"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j07J2zvz8hG5qOAgfh0vjMLebRhhvRXH1HK8mCL+KIo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792364378; v=1; x=1792969178;
 b=X4RU3D85grNh2KQGU47+REWPyvyuB96n7o/bYgJHWsAk8SvUIi2xUU4hbMAF0qBaO3rznJEZ
 EFO+ZV0CtViavKZPT6COWZOHgYMVDtk3OCP2JPmjrCKbE2X4vw2uugpM7ahi4egNoGWO6xfdDrz
 5NDhr9nI8tDxDkom5tRJ3CGVZDWrV8UeYhVjoyRXhflhG01SjOLbuR0yarTGdzJBGmpnkpZdNFk
 luhxzKNIaYE6mB2sADFAMd5lS+ArnVMPSt36pDtN4rl8pmwVoki8bKvBsjK3ZtTOEVtoaBdJ/2l
 6apZvdrom+EF7GqW81b9BkMCERvKlrOoU9jPfIa3UjDZw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f71cc591dd1e8204;
	Sun, 18 Oct 2026 22:59:38 +0000
X-Mizu-Trace-ID: f71cc591dd1e8204
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: fsa4480: Add an optional audio port/endpoint
Date: Sun, 18 Oct 2026 19:58:56 -0300
Message-ID: <20261018225906.1265299-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018225906.1265299-1-val@packett.cool>
References: <20261018225906.1265299-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To actually support analog audio output, the fsa4480 driver needs to
deliver the hotplug notifications over the Type-C graph to an audio
codec driver. Describe a second port intended for the codec. Keep it
optional to make sure existing device trees do still validate.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 90 +++++++++++++------
 1 file changed, 63 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index 89b1fb90aeeb..9dfe95b6adf3 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -9,31 +9,11 @@ title: ON Semiconductor Analog Audio Switch
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-properties:
-  compatible:
-    oneOf:
-      - const: fcs,fsa4480
-      - items:
-          - enum:
-              - ocs,ocp96011
-          - const: fcs,fsa4480
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  vcc-supply:
-    description: power supply (2.7V-5.5V)
-
-  mode-switch: true
-  orientation-switch: true
-
-  port:
+$defs:
+  controller-port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     description:
-      A port node to link the FSA4480 to a TypeC controller for the purpose of
+      A port node to link the FSA4480 to a Type-C controller for the purpose of
       handling altmode muxing and orientation switching.
     unevaluatedProperties: false
 
@@ -69,15 +49,56 @@ properties:
                   - AUX+ connected to SBU2
                   - AUX- connected to SBU1
 
+properties:
+  compatible:
+    oneOf:
+      - const: fcs,fsa4480
+      - items:
+          - enum:
+              - ocs,ocp96011
+          - const: fcs,fsa4480
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vcc-supply:
+    description: power supply (2.7V-5.5V)
+
+  mode-switch: true
+  orientation-switch: true
+
+  port:
+    $ref: "#/$defs/controller-port"
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: "#/$defs/controller-port"
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          A port node to link the FSA4480 to an audio codec in order to
+          notify it whenever an analog audio adapter is plugged/unplugged.
+        unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-  - port
 
 allOf:
   - $ref: usb-switch.yaml#
   - $ref: usb-switch-ports.yaml#
 
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
 additionalProperties: false
 
 examples:
@@ -98,9 +119,24 @@ examples:
             mode-switch;
             orientation-switch;
 
-            port {
-                fsa4480_ept: endpoint {
-                    remote-endpoint = <&typec_controller>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    fsa4480_sbu_mux: endpoint {
+                        remote-endpoint = <&typec_controller>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    fsa4480_audio: endpoint {
+                        remote-endpoint = <&audio_codec>;
+                    };
                 };
             };
         };
-- 
2.55.0

