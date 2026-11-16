Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814814;
	b=1/Ho2Eml2hIQaKEVD43DFiTxWjLpFTu1Epi34spBv3AEJYry9ytMbaBZE2iyutMTt2m+
	 kWMzVKPdT8bXNFpyKWNqm1I0S7UVy98ICfDbOsgIQhqV/esXBmlgYZIyhRjqvZ15pCPz3
	 5+J7a/jz+pf3nZpYcoX0mt85fiCgxGiQTFmWwHUBn3y6EHh/rMjAbjkg0ujy+MQcp57u1
	 RxeJGuvJML5txT2iN0WbvBO4BiL1TuS0PXnautrcnzbFrANRJlgoqTtOm609JjtuRCyOM
	 rBSQ90EE33u1K7I89de5PM1sbct2Lyyvk/zShuBNzKlp1pznzHsAdIVUCJuc+0r2rGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mb9rHos8tHcP6+kunMSZSY6J85Jw9A8LptIrsB7iGLc=;
	b=0Rm3j/67hWii/BiUVJ/0pKNXa34Q6HnGIznVo1xHd2l4wiTjBjFo8FMKXwy+mUSZT+53
	 R4KDiNr31KHbSCHVKoOKL/5J42U2pXuSCPvXPWd0uiI1B/PgNxuLoVOjNkUl6W21KlwsJ
	 3tgh7fz3or1Po7KEcdqFYsG+79xsRBiUbDwpM89iGdAOjhj1WD5N83Bnp8Zgm/GcET2Of
	 vIckYfajAsSPRP9yBPZqzWXXQjOkoZCVgvuRBu4DU01MzvucJ8I4MBRRMhSns2prLQmSE
	 fTb9DhSgnNzM+88FHfAo3BG6HIw0Pz/oQlaaSyZMHRf/LrXdakXwyA2cPan7NgfznuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABTcK5PE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E5606A894;
	Mon, 16 Nov 2026 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABTcK5PE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814814;
	b=YoXBuFHPFW8iTe45MvhRr5ADJE1j9KSTALQamE+Y4QqcpXS58SL03yznWLlVoaYiaoAn
	 OIL38iBxaUJbrqyMNA0R4zQkcI5mYQ17Oyc+n6pcH3uF+jSjcq4S9+4C8CFfB2+C4L+48
	 z0qqrLEWGyqvN4u9t1xmxGesM0TpSt9pa7zcha9TxZtsfSsSLPQtEAybdSqTxZrhZt/B9
	 97+uQIJ7ALiIRpTud/kF3bN+GNT/k9sMnjytWqW8nziqG0nho6Yw1seL1jRBtap8yLdCc
	 vkO90lIlkxDyu7++4wnorEBJw6IIpWmWj9yXm3FicRKzucde4XTh14vcop4qeTLSPfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mb9rHos8tHcP6+kunMSZSY6J85Jw9A8LptIrsB7iGLc=;
	b=exTiH+0KWblyQ9ZZh+CVrO2u0ADkzIDizKTN2zz+Pvd/13MBa33g3muJ1akXLP6p09a7
	 UR3qGfcrwp5dQvL4WkkEWSknNM1M+FjUF3XVMrNUnUgbFzafB4yelXtlLSk9n8OLd6rWv
	 INheIUzBhNRwJsQMEaLg1xOSUc4bNhaz18U267AZYjbYKIRYUJYEB4yOCXysbfd0WriWx
	 16vHx03PF1MIycOLdzF20yq0E9Si6j45YoxmmeHSETcSHcMQ+++AZz/BFtp9iEEORFIk/
	 o/ui4KDFGfTKKoxRCnJ5p1GLfNjH9K4BuLxUoLGplmyW3jcuCPhn6r5yfPa7jI0H4YQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 624501F002C2;
	Mon, 16 Nov 2026 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814814;
	bh=mb9rHos8tHcP6+kunMSZSY6J85Jw9A8LptIrsB7iGLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ABTcK5PEz1PaM6P2sfNE+f27Wcmt5wNqyMidRbSLibr5pzsfhM7f0TDCyVHLO9DOM
	 dQ0XcfQGrsVB7VA1hjiswK1q4gafXHFH2FV3wibnSMAA4c0PEjUjJ1PRUg/2c6IF9/
	 OM4k/5VR1g6IFYd2WZvnEg7NDWgPMhDPNhd313dB8znce+bqij5zZ3/O4p3t/eAr41
	 kx2xTHxm4Tm+DfuMhlJlTJb3ghi7gQfqC+0S3JpatyCovCHJ7bAmINz+Hee3o+Enj4
	 K6UpEbY50+kq68Rc6/YN2uzy6d4+HnNW2JaCvYpg4uGTGODl8/q1+TZJwOqI8RYI1+
	 wXpbW2XE3cOMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E70BB4A3AD;
	Mon, 16 Nov 2026 07:40:12 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:12 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Ilitek ILI97680A
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
Message-Id: <20261116-vantage-panel-v2-1-e2ab48645e2c@yahoo.com>
References: <20261116-vantage-panel-v2-0-e2ab48645e2c@yahoo.com>
In-Reply-To: <20261116-vantage-panel-v2-0-e2ab48645e2c@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814811; l=3218;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=/i7bQzzWSOyoUoPNVeSXBs8XdBsv/giMTK78lHZdqTw=;
 b=YxkREBkmEyYZm6u8PpmMZDOLQ7R9WsxC1tLrmerVmm38oeacUVq0/I9pekUa+qgt6iUDeQOeT
 lfipp6EyC5dAE2kG+H3o9obOuIwGkk3nOo/lEvT14OttX0WMBs6EvkZ
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
 .../bindings/display/panel/ilitek,ili97680a.yaml   | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
new file mode 100644
index 000000000000..c098b44fef3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
@@ -0,0 +1,75 @@
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
+  AMOLED panels driven by an Ilitek ILI97680A controller over MIPI DSI in
+  command mode with DSC 1.2 compression. The resolution, DSC settings and
+  initialization sequence depend on the panel, so each panel has its own
+  compatible with the controller as fallback.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # 1264x2780 BOE panel of the Motorola Signature (vantage)
+          - motorola,vantage-boe-ili97680a
+      - const: ilitek,ili97680a
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
+            compatible = "motorola,vantage-boe-ili97680a", "ilitek,ili97680a";
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
2.56.1


