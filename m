Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=145.131.90.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935525;
	b=eh3BhT2XVMOqGuDUCELkua+sK44G8dFb41OL2sy3GqXSGSdyNjtarXyJbUuCIoUQTj/F
	 v8OtGyjKDk9u66c6ieKrGQN8DE3RxhAh1/5HjRKxzY63muRcHNGxCaQB6tE+HTOhq18YM
	 hNAJtrk9kdFxiBqHxR840d7OdI1YYKdBFu/caDgh67eWLzlwrQiJee8f/TMD3/xKd9lZy
	 tiFWXyqVpslGkFtS9q2HE1OuaYICYYpacPlTPrjGLpiPO/l+0qfL2ILbRuSQkcVC+BK6S
	 PpKE6Fp1zeZ0SnVA84UxGKW0q57Jk0u7T2tuP3oH7QgPBULn4662o5vGgbVmdEd1i0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935525;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Mime-Version:Content-Transfer-Encoding;
	bh=RMftgAUp5cONeZ2SOkSnUtb3aJRq1ym02GWaJFoUPeM=;
	b=NaalarKpOkiRS7KXbngeMw17cG5oHmgH7UqcDH0EDeILLuz653oec2kRP78sn0EaZQGM
	 SYy56tK6dpuQySOALZqo7c6bzharebW26LOss1cbJxeMQWrMAOrckiLWBxxShzoyHzbyV
	 Wm/JsxM898drg+8aLfKsUCvcWvNQJXVwiytU9vC0DYlA7xbjwZP2i4aXU4ydWUifMNCgJ
	 FXHE/XoEx0hrA8jDLOeKIXpPt5O/P/4mr6s6FHcUEnpT12OmVyv0UCgxBxwJvGETVR5yC
	 9Wf9PgrkpLUclPFg6/UXnHF1mWL7m/2799blWZyVIzK/TTUHNMjh4L1VA9zvwGh12Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pyk.ee;
	spf=pass smtp.mailfrom=pyk.ee;
	dkim=pass header.d=startmail.com header.i=@startmail.com header.a=rsa-sha256 header.s=2020-07 header.b=EriZjacy;
	arc=none smtp.remote-ip=145.131.90.139
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25C606A325;
	Sun, 25 Oct 2026 13:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E25C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pyk.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pyk.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=startmail.com header.i=@startmail.com header.a=rsa-sha256 header.s=2020-07 header.b=EriZjacy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1792935517;
	bh=RMftgAUp5cONeZ2SOkSnUtb3aJRq1ym02GWaJFoUPeM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Transfer-Encoding:From:Subject:To:Date:Sender:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=EriZjacynyZoQOitbldrxZwmdVVNaB9896vzSOG+Gu3b564D7AW9cuDN1mLeDNI4y
	 ziUFHAFrvGGSKv25o9oMiNpVNCpshw5TxxY7evHQZ0EXWKQcegC360HxxFqL3/c+97
	 GfkKcDSnrhV0Oe6avSL2dAZDVbJdpo54hsgBKib8APw+G6xQdGiV+ETFHXwCmtsl9R
	 lTofqMNTvGjFCeiEES/NHWjNsceqSOWFwXwfZd+riupu73F3mpeFbv21bsrxFdmvUX
	 guKryvEzr8OXNWAkad2TVnvMJfKT+r2TXWpznTemE4l8bM4RbLrrKx7sHzSRrM6rED
	 rllBvbuJ++DJA==
From: Jacob Pyke <jacob@pyk.ee>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	teguh@sobir.in,
	Andrew.liu@moorechip.net,
	Jacob Pyke <jacob@pyk.ee>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Retroid Pocket IL97680A panels
Date: Sun, 25 Oct 2026 23:37:40 +1000
Message-ID: <20261025133741.100490-2-jacob@pyk.ee>
In-Reply-To: <20261025133741.100490-1-jacob@pyk.ee>
References: <20261025133741.100490-1-jacob@pyk.ee>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teguh Sobirin <teguh@sobir.in>

Document the Ilitek IL97680A panels in the Retroid Pocket Nova and the
bottom display of the Retroid Pocket Duo. Both are 1280x960 MIPI DSI
command-mode panels, with different supply configurations.

Link: https://github.com/RetroidPocket/linux/commit/9bfe85be2179d03338d09b8900f3b1916999ef15
Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Assisted-by: LLM
Signed-off-by: Jacob Pyke <jacob@pyk.ee>
---
 .../display/panel/ilitek,il97680a.yaml        | 121 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..70a1bdccef75ea3ee6335304ede771ff711991de
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,il97680a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek IL97680A based DSI panels
+
+maintainers:
+  - Teguh Sobirin <teguh@sobir.in>
+  - Jacob Pyke <jacob@pyk.ee>
+
+description:
+  The Ilitek IL97680A is a DSI display driver IC driving the 1280x960
+  command mode panels of the RetroidPocket handhelds.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: retroidpocket,rpnova-panel
+    then:
+      required:
+        - vdd18-supply
+        - vdd28-supply
+    else:
+      properties:
+        vdd18-supply: false
+        vdd28-supply: false
+
+properties:
+  compatible:
+    enum:
+      - retroidpocket,rpduo-panel-bottom
+      - retroidpocket,rpnova-panel
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Core voltage supply
+
+  vddio-supply:
+    description: I/O voltage supply
+
+  vci-supply:
+    description: Analog voltage supply
+
+  vdd18-supply:
+    description: 1.8V supply of the panel module
+
+  vdd28-supply:
+    description: 2.8V supply of the panel module
+
+  reset-gpios: true
+  rotation: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+  - vci-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "retroidpocket,rpnova-panel";
+            reg = <0>;
+
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l12b_1p8>;
+            vci-supply = <&vreg_l13b_3p0>;
+            vdd18-supply = <&vdd_disp_1v8>;
+            vdd28-supply = <&vdd_disp_2v8>;
+
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "retroidpocket,rpduo-panel-bottom";
+            reg = <0>;
+
+            vdd-supply = <&vreg_l1g>;
+            vddio-supply = <&vdd_disp_s_1v8>;
+            vci-supply = <&vdd_disp_s_3v0>;
+            reset-gpios = <&tlmm 73 GPIO_ACTIVE_LOW>;
+
+            port {
+                duo_panel_in: endpoint {
+                    remote-endpoint = <&dsi1_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b9424b630ac34ae6b1774416ef4cb3ef1a8ebe63..d1be1cf2b93c4fa57ffcb6a17aaf2e14dad0deed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8235,6 +8235,12 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/hyperv
 
+DRM DRIVER FOR ILITEK IL97680A PANELS
+M:	Jacob Pyke <jacob@pyk.ee>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
+
 DRM DRIVER FOR ILITEK ILI9225 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
