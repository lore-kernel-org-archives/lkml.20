Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774022;
	b=IKqg5hfd2o1XQAYGJEE7t4OKGQHShnXc3qIJCGO/KCFL9X+5RNHyOwGrndoSHwCGfKkF
	 xNhLOMeH3SO5QH5hioFMVmVLmil44m7TnAqAqQR+beyRldkB0Gq6x96/UmJFWSkShXWN/
	 ks4fWUtTI6Wlpx2IZF2kTFwwmGSfcrTiQXGVxuwCXAsCUwxhTKpQUS1ZqSwaYpQIKAIqJ
	 df9jxtU6tZho00BEoDsWm06NcPEWI8fnmbLflWymoul5X8IHZf5PEleneOGP089LgW6XT
	 opGhdw9IxAzzpG0sZUhodqwLq12IcUkJ6BgpjUS17aHNFrsRlL4NrAHBXglMlPeJZmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774022;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3CXCMpydwqSfptURogOs1CG7yd8JU7mfoC3YSnzjoGI=;
	b=pLcPNTHgGEDJNqZAEtYGW7zg5D/l4RAkaSKHLdPoDfdMcCq3KSSRRRPccbrUUZHhOZw5
	 PH8edzAOFYBsVW7hE6ZIkcmkwM6zwnihNWa1j0h2SqJ2kILQsx0BcFT6CQxdKUSi7URGI
	 2rlABqkBVxIQK+ceup5H10sDpUf2Wq9h1arGPwU3+4gi75+UhHimvJcMhCLAiwDOBCH/o
	 V1h4e84LYmcowDW0kXwDRn4RxPym9+DtEJpCDxRihoTC7SOEuJAb7SNK28PhyKDAsZMju
	 iuyZKkugEwECjwdvN4tFsCkCspYRhy0azBKK9Ac9gcfv36mUmmGmdgHR6L/zTXvjZzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFsfkRfD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDCF606A8A5;
	Sun, 15 Nov 2026 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFsfkRfD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774022;
	b=V7a82TcnlcwVkxgadnUDIOH3smAMm/OrqAn/XVsJCYu8D4EMob7ceTCMiVJK+pFHilzQ
	 tDgsj4BJnJTDDhhdKpffpkVH5FY74vRoCfga0Xx7ltOTN6vvhL/UoSe1JVv9HS1UInuq4
	 AfhB/bcxSlVUn78vHQ+ZuxdASlPP+8SkIda8s0pKBQHGS2+XyHcZisRilG0ub0PhUGBkp
	 YL7lVOivzPce0m4YNSf6gUPexSA6BMJ1TvhItLmd9VMf3rbjzrYZ4I9MslvOKDE54lKpE
	 Hyt3V2oyNbzKU63c0hA9s4cb+oeYlyca1jQieU0dkhFsnUxMr2K86Jhryr/G5R0ovJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774022;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3CXCMpydwqSfptURogOs1CG7yd8JU7mfoC3YSnzjoGI=;
	b=atbOCtc6xn4spkQpHQtoxD2yOzOysUYzqXDpqjyevTJ16NvisbpX1dRezeumfSNLfbi2
	 Iwcp9hzcsu4n6hMXfFKxF0aaf71QVUMXPbcBzkiLpPkYgnoBToTjHLEcqaz0b6rCuMnoT
	 2a/JLKfwN1g+nog9MUE4bJFi5EekgR04K8hO4ld5WFuWmLzpDoPjtnRs5spfb9E8FYJNG
	 uhM9y3pupKU5baxIIhpxmscOgs2vrk2jtJTT7FPmIF7iMiEGunIg5LwJJZB17CId3cs/Y
	 uWX9R08WB4XfwPiR3ksD15w0Jw1zDYBo0Q2tvXmlZT3hbgV47rpsUPwG6z9ChFRI2kQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EDBD1F000C6;
	Sun, 15 Nov 2026 20:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774022;
	bh=3CXCMpydwqSfptURogOs1CG7yd8JU7mfoC3YSnzjoGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aFsfkRfDKNkSDGSHfyNikMvXfZUaUSyqS1clQRoSx3cvmXOrBrSfCIQswp37guamv
	 Iu8XYtSoFP6crBRDiWP/TkCDK/aJw2xuLkTUBCdo1BrE7wAw9vR+IqdIb5ljtA1xSH
	 qI24SiRx/uH0SbjcEP3x3lm7qqiOe1xXScn8JsjpjwHXcuQiJ8LjXkcJQdHcNCyhLr
	 jmchKaCk7LOYofuILfpph/jvPy17N6cTZckhQMx3dTQ76kNpzjJGxFCsIpnxsXPfTL
	 VfcFJgN7QX2iaqEZQsfV5smIxKqWftvYJbSBy0JewXryTh9fHK38YRUketrc4IwBbl
	 gSlseLOVR6hyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B41734A1B7;
	Sun, 15 Nov 2026 20:20:21 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:21 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Ilitek ILI97680A
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
Message-Id: <20261116-vantage-panel-v1-1-30b95bd49216@yahoo.com>
References: <20261116-vantage-panel-v1-0-30b95bd49216@yahoo.com>
In-Reply-To: <20261116-vantage-panel-v1-0-30b95bd49216@yahoo.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774020; l=2944;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=NHqAvGOGAdVLM5YYlEmL7m/RTijzbvnCh01U3Ae0TvE=;
 b=uHcNVJY60ykGdCj6sB64Wq24TjIarK94/qHRx3Jx/y57Rv6wnt9VzlIa+9eiUnisRCtYhtdci
 3qHek8DkyLSC3q9rYKeuyWMdRhRQdDbrqyEGlp7VnEDb46wFWjmqG+J
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Ilitek ILI97680A based 1264x2780 AMOLED panel by BOE, a
MIPI DSI command mode panel with DSC 1.2 compression found in the
Motorola Signature.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 .../bindings/display/panel/ilitek,ili97680a.yaml   | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
new file mode 100644
index 000000000000..f3323fbd587f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili97680a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI97680A based AMOLED DSI command mode panel
+
+maintainers:
+  - Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+
+description:
+  1264x2780 BOE AMOLED panel driven by an Ilitek ILI97680A controller over
+  four MIPI DSI lanes in command mode with DSC 1.2 compression, as found in
+  the Motorola Signature.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ilitek,ili97680a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vci-supply: true
+  vdd-supply: true
+  vddio-supply: true
+  port: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vdd-supply
+  - vddio-supply
+  - port
+  - reset-gpios
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
+            compatible = "ilitek,ili97680a";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13b_3p1>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l10b_1p8>;
+
+            reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi1_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c4f4e48774d0..e2a8093c328a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13040,6 +13040,12 @@ M:	Stanislaw Gruszka <stf_xl@wp.pl>
 S:	Maintained
 F:	drivers/usb/atm/ueagle-atm.c
 
+ILITEK ILI97680A PANEL DRIVER
+M:	Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
+F:	drivers/gpu/drm/panel/panel-ilitek-ili97680a.c
+
 IMAGIS TOUCHSCREEN DRIVER
 M:	Markuss Broks <markuss.broks@gmail.com>
 S:	Maintained

-- 
2.56.0


