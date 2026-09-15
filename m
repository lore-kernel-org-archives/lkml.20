Received: from ironport.ite.com.tw (itemail.ite.com.tw [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF175468C15;
	Tue, 15 Sep 2026 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457243; cv=none; b=S0iYFTj5V/IWA+LkSn0N25H/+KAlS1JF1t9O5tl7RIrUqDiLOkNKLC8FL5db2AvP7JhAbbiwUSG9fgdLlvuU89R5T9z/tjHHK7JYyO6tQhJtQsYkI4aoVUTqvMFp9/ftpqVUV8wFEGM0JUv9KRAQXsNfiGOnoHwniSUu+SuHQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457243; c=relaxed/simple;
	bh=tlP1iJ85UQy5tBsvpGCCKZ3NqJo96uZlobIIxZUIMS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qrND5434gfozeamoipzdO9BWJtR5zXfS3TZxwph1l1bPxKKlI1/AWG6iMZieh8HbVIFavvmchN+RMGy/UXXZVF9KR5JI6arcdKkYnmlIpyGwVqw23NfE1kg3npGzmQqQEJdXl24yNOzn79tzBePANaTLr0XSMSZkDErt6G6CFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=qs4l0y74; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="qs4l0y74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=BcH1NykmoVX/ILfQGa0dzRnEacmBWjFL+KKNCDWQNsY=;
  b=qs4l0y74ZR6joqvo/1GT8P8kX0Dfh4cGbLjtSpcLXoYXUp03hmGsuVlT
   0gzSiDIJEjCnCdl5n70KvrhzptY7T5BwOvbRg31zB9ckDws2VbRFIMl9E
   +KmQNBmcP+FffKSYQ6a4fkwQAbVS/sm/4p58S8HickhidsOxZ0LJ3zt3I
   ybghp0OXFDk1vyiltc941bxWJmySxJSh0A3JMasatjKCRdBfo7eq0gNBC
   pqVN0gbNsGWPofGaV1l0amrUacLGrmmvsMT+qwHU8gCPZA9vAabP50xue
   ROFNOLQF2dCWzG4YzQwmUGsBRIdFKkxnEd/ljuZVCNweUj6mA0c4Fx1RX
   A==;
X-CSE-ConnectionGUID: Hhs19nw5QsqGbtS+PtHYzA==
X-CSE-MsgGUID: deZWQAVrTHmwyZZKsti9Xg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 15 Sep 2026 15:27:06 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw [192.168.65.58])
	by mse.ite.com.tw with ESMTP id 68F7R0Mk029947;
	Tue, 15 Sep 2026 15:27:00 +0800 (+08)
	(envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.40) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 15:26:59 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Date: Tue, 15 Sep 2026 15:26:29 +0800
Subject: [PATCH v10 1/2] dt-bindings: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260915-it61620-0714-v10-1-738e2a662c06@ite.com.tw>
References: <20260915-it61620-0714-v10-0-738e2a662c06@ite.com.tw>
In-Reply-To: <20260915-it61620-0714-v10-0-738e2a662c06@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca
 Ceresoli <luca.ceresoli@bootlin.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.Wu@ite.com.tw>,
        Kenneth
 Hung <kenneth.Hung@ite.com.tw>,
        Pet Weng <pet.weng@ite.com.tw>,
        Jau-chih
 Tseng <jau-chih.tseng@ite.com.tw>,
        Pin-yen Lin <treapking@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789457258; l=5468;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=tlP1iJ85UQy5tBsvpGCCKZ3NqJo96uZlobIIxZUIMS0=;
 b=j4mP8jqMjv/HMuWygHwiQQof3C/sz9t8kg6Wz6GAqiOl4ROiS21M0AceCgbsSYIBe9X3YsFvI
 W0/YAru06FtC+fDQy5xMxm9iyVNVrpRFkrSDxe9LYAMXe/4+XPOy85f
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP:
	737AC342BC878933FA1D5F451F525F8EE88D56CB8DB0AB654419F866C97CE8A82002:8
X-MAIL:mse.ite.com.tw 68F7R0Mk029947

This chip receives MIPI DSI input and outputs HDMI, and is commonly
connected to SoCs via I2C and DSI.

IT61620 is a variant of IT6162.
The main differences are listed below
- IT61620 supports only a single MIPI DSI input port, while
  IT6162 supports dual MIPI DSI ports.
- IT61620 does not include the internal MCU present in IT6162.

Because of these architectural differences, IT61620 uses a separate
compatible string even though the external interfaces and bindings
are largely similar.

Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml | 152 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d4f0edeecd0e22f3fa92c9f8e276ce0806c24790
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it61620.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT61620 MIPI DSI to HDMI Bridge
+
+maintainers:
+  - Pet Weng <pet.weng@ite.com.tw>
+
+description: |
+  The ITE IT61620 is a high-performance, low-power HDMI bridge that converts
+  MIPI DSI input to HDMI 1.4b TMDS output. It supports up to 4 lanes of MIPI
+  D-PHY 2.0 input at 2.5Gbps per lane (10Gbps total), compatible with DSI-2
+  v2.0.
+
+  The HDMI transmitter side supports up to 4Kx2K@30Hz resolutions, and is
+  compliant with HDMI 1.4b and HDCP 1.4.
+
+  For audio, the IT61620 supports up to 8-channel LPCM via I2S (multi-line or
+  TDM mode), with optional S/PDIF or DSD (for SACD). It supports audio
+  sampling rates up to 192kHz.
+
+  IT61620 is a variant of IT6162.
+  The main differences are listed below
+  - IT61620 supports only a single MIPI DSI input port, while IT6162 supports
+    dual MIPI DSI ports.
+  - IT61620 does not include the internal MCU present in IT6162.
+
+  Because of these architectural differences, IT61620 uses a separate
+  compatible string even though the external interfaces and bindings are
+  largely similar.
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    const: ite,it61620
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  ivdd-supply:
+    description: core voltage
+
+  ovdd-supply:
+    description: I/O voltage
+
+  ovdd1833-supply:
+    description: flexible I/O voltage
+
+  "#sound-dai-cells":
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port for MIPI DSI
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port for HDMI output
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Audio input port (I2S)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - ivdd-supply
+  - ovdd-supply
+  - ovdd1833-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@58 {
+            compatible = "ite,it61620";
+            reg = <0x58>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&pio>;
+            interrupts = <128 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it61620_pins>;
+            reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&pp1000_hdmi_x>;
+            ovdd-supply = <&pp3300_vio28_x>;
+            ovdd1833-supply = <&pp1800_vcamio_x>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    it61620_dsi_in: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&dsi_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    it61620_hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    it61620_audio_in: endpoint {
+                        remote-endpoint = <&i2s0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

