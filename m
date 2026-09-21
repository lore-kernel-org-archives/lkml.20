Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D74A2623;
	Mon, 21 Sep 2026 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033186; cv=none; b=AilTcEotO4ivBKwshq2Kh8/t/qbBZWuWw+Tq7f7DO8WM5cZf4WsIYway8YOrvBHNj5wXZeCfgkhK5NTUsPumGBHt+lFCauIc02foQEnzjalAjuJF9c7ZCm7+cAkIcTOecak3tv+oO7y1NCOni+p7NC6Pz9PGXSQ2yNQ7mhkcDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033186; c=relaxed/simple;
	bh=lxy9kStig+ySX+aadtqeOPWViVaN8W2Om+yIlqJQ7w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcUIOH28QCQxnYEKWcnIEDDAUBkrxrId4ipDmEyDiVwVP6PpZ0yWnnWth4bVNSQEVPiKPSFHOP5XargDIz4HaT/+36LJtjEJ+1jhEUW0zglguTZO6CRT/Cn3tw9PT7WLDGKFjmvA0x++3cYnFF+FWAGQ92pJBqXKh638KxdCZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnV8D0Z+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnV8D0Z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33641F00898;
	Mon, 21 Sep 2026 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033174;
	bh=kAaueitIRkAlVPBg6q6ULVMDQjf8wlHc5SAIk4+u1Sc=;
	h=From:To:Cc:Subject:Date;
	b=CnV8D0Z+EJn4NWuVNsrXLFoCmL1d7SI6UBY1BJyk95AoMemP1JQDz85G0cn3qp3gR
	 +FOTkHGZAHfUBK3RFgLrKSvgH0ASGuMId5gKuIqVgL96vyb8Yni/8K4U8JR9WpUqY7
	 V5GqwS9A2RbL3MmUldBfIs2ivl/KhWxX5hcAirAvVDh1FBF7nIGG9UavmS3YlyJ/a/
	 NI0KSESCFg9Y4mku5ZjsmrM/uLNHmy+6D0RB6Rsxo3/R4ahX8pmzAPNSHKMz12ikwe
	 9prQve1zSORjq5kNu4AgDePR7vQ0TyGkv61dagb2lG4a5bzoiqYRogBmTgrUn6ZWpm
	 ux/q+YUDfMHlQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Molly Sophia <mollysophia379@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: panel: Add JDI NT35596S
Date: Mon, 21 Sep 2026 18:26:08 -0500
Message-ID: <20260921232609.3130272-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a schema for the JDI FHD NT35596S MIPI-DSI panel used by
the Xiaomi Mi Mix 2S. The schema documents the DSI reg value,
reset GPIO, backlight, graph port, and vddio, vddpos, and vddneg
supplies present in the DTS.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/panel/jdi,fhd-nt35596s.yaml       | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596s.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596s.yaml
new file mode 100644
index 000000000000..aefc9ae5d8ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596s.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jdi,fhd-nt35596s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: JDI FHD NT35596S MIPI-DSI Panel
+
+maintainers:
+  - Molly Sophia <mollysophia379@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: jdi,fhd-nt35596s
+
+  reg:
+    maxItems: 1
+
+  backlight: true
+  reset-gpios: true
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  vddneg-supply:
+    description: Negative source voltage rail
+
+  vddpos-supply:
+    description: Positive source voltage rail
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - vddneg-supply
+  - vddpos-supply
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
+            compatible = "jdi,fhd-nt35596s";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            vddio-supply = <&vreg_l14a_1p8>;
+            backlight = <&pmi8998_wled>;
+            vddpos-supply = <&lab>;
+            vddneg-supply = <&ibb>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.53.0

