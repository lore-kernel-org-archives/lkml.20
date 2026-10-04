Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7F3B95F0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131499; cv=none; b=hbdgIWAvi2vve7ZF3/dxB/aHFsrqG3canUBjOvjPLUr5UZIJmM9r89wQlhyszX1+DiUMORqT11ndXkU5yoce+ukGsoi+2rzYeA5E+lmbllKJlplJfxyE3Be4clYXXB4uZxOwT0aeATUipbJIeZfuN2D7JMcMpOTI8G9DpY1WzK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131499; c=relaxed/simple;
	bh=6ZupL0yXoeDOJ3IbAEcyHUmrN0HUODbkzAMB3V5q9AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIv242wP1ejAII32ll3ffigIvnCC4ujlL5vn5hYSTXg46onQGirxDU61eRukxeTCGOY74JJP3jqij5L94t/lGjfMNDmYv7/sEzmFCyPHe8ghEatrFwHdhz8VkUXuE8EaaCT/DbcCIGu0zLk6VNF2qjbAmAhtXm0/d0Mt3t4sBHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1ynIrvn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1ynIrvn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso9232925e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131493; x=1791736293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rEldcoYDtpK/NBb1peZdgxu6IPeXXpzbTPYe4T4o64=;
        b=Z1ynIrvnO1dfkwSc0wOhUenGwdxx2thWNyvIyC2jW/0oxPWWTAERXcCXXVN4TpLwF6
         hrMKSOOvri0zn+xduwr5RfBvWauaAbiht2nzchbu/5r698IZTLjl9mALyxg94xbwJ6pV
         rZ3KN7InIJQo1kIqQmG0HcjGrdaX+lWVd4v3ABrJ+XCY5+CyCeqrIxNb4R3kCKGoWvwp
         gC5yhB4KHOPhtSPiEsX9fxdcb+Vq2tTRDonVc89pdGReoIXlO3y9RgPPBuKvxui4lDXm
         fjBH8JiY8DBxw64MC0bnyPTI8Cmzaecvlr2XluZYsk5JIA4uLTq4FzcvzumA388kS6jb
         RZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131493; x=1791736293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rEldcoYDtpK/NBb1peZdgxu6IPeXXpzbTPYe4T4o64=;
        b=Sp9gLHZAo55xj4q7kGYlovFGdwHHv3exnhppp+51BOcNR9Btqk7eY65v9kDWhh/i/1
         FcPs6BpJuMkXw2LneHw5rTvO5ssjsZmcKNhrW6y0RIYYF3jAJCGRo79tbIpeia0yjyMy
         iZAhnqaRuC4AbWIzWKX9AZcyLDUK3HAyR9AuDVhiLb2qOecQX6bdzxaMRnu6QPFrggez
         GlGDGgvCQoSmxBlV6+1XxjNkd5+rRFZ3iS8s974jZovC8AGicy2NFO86I+/JAhGVq/vG
         uHxqoGBNjB+RM2NIcA8LuoCggvBkNaYVNB4sWLpHzqAKO27fXFl5jHJa4ZnSbIBNYxFe
         jBZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPU413ZTUDf6eaFv5WbJ7TGEFoBWlKI7dhciHO3FzTtlc1Ovm1QAgCfMPYXnn0VQUOptuMOEAO3VR2sNU=@vger.kernel.org
X-Gm-Message-State: AFuF++lNpzuFjQI+fy6DZJ1VWUpeIxp9ogNdQizgqGRSKm5mpK4ixo+J
	B3vUpnfE6c3c8bXItjJHTC/DjVHkBB0yJQhgsYML5JNybmurRxtwm8K6
X-Gm-Gg: AYBFou1V4e7vgbP4WCFiECCEmtoZLMuqCQ+1QeR94AlIKmduX61qcqweiWNW19RuJTu
	L5Lyl9y/k7kGZxySwtQpuM288mBbgFaxMZ7C6GpWCUN+I/gJTJgCXmDYP3NfpRxXxPJuOgg+zE9
	JZnpunjBG/E2m4Al34EKGRwB8cGhujki8gDP3SwcBJj+PenKqVoAHVyRcN+rqozjvfqcTQ2n/7Q
	j8/+8/e4NDFJuNn7ALZnZd4sP0UD+NauJ9C5vewWNV/4DMxmuxs8Ck8QCKllh2ZYYmWhLjFiOrI
	xfu+H8PNMfMLpxXpCuAP2QSsnK5m+cnZFCqBdfPSQVAlQkhmsl7PdOOWeo6yjwPJ8q8OUNkq26K
	ohski58lfFd6ZZpvTNxWs3/Hf4X2dUzTXW8KeghTV4e6kZ7gkA5JEn+xFSXc9MpsFYqIRSQGEZK
	lnyo8qB3AH89xDxvdL9m5Epykmsz8FVzq6BWH0R7v6nczE1FzoU69xwCwdceYgWrWywB4W76p2C
	QgMJWTzBGPOMYY7XjU=
X-Received: by 2002:a05:600c:3490:b0:4a0:1723:2d90 with SMTP id 5b1f17b1804b1-4a02751934dmr142272115e9.4.1791131492912;
        Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Sun,  4 Oct 2026 19:31:10 +0300
Message-ID: <20261004163114.181800-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra-dbi.yaml       | 143 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |   3 +
 2 files changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
new file mode 100644
index 0000000000000..184c33d436308
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra DC based MIPI DBI Type B interface
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: The display controller in Tegra20/30 SoCs features an
+  8-bit SPI interface that closely resembles the MIPI DBI Type B
+  protocol and is referred to as '8-bit CPU'. Each display controller
+  provides two such interfaces, which can be used to send MIPI DCS
+  commands to initialize and control the panel while image data is
+  transmitted via 16/18/24-line RGB.
+
+properties:
+  dc-gpios:
+    description: Data/command selection pin.
+    maxItems: 1
+
+  rw-gpios:
+    description: Read/write pin.
+    maxItems: 1
+
+  cs-gpios:
+    description: Chip select pin.
+    maxItems: 1
+
+  data-gpios:
+    description: Specifies a set of 8 gpio pins used to transfer data.
+    minItems: 8
+    maxItems: 8
+
+  nvidia,init-sequence:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Device specific set of values used in DC DISP_SPI_INIT_SEQ registers.
+    minItems: 4
+    maxItems: 4
+
+  panel:
+    type: object
+    description: Node of supported panel driven by the bridge.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for RGB input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DBI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - dc-gpios
+  - rw-gpios
+  - cs-gpios
+  - data-gpios
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dc@54200000 {
+        reg = <0x54200000 0x00040000>;
+
+        dbi {
+            dc-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+            rw-gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+            cs-gpios = <&gpio 108 GPIO_ACTIVE_HIGH>;
+
+            data-gpios = <&gpio 32 GPIO_ACTIVE_HIGH>, <&gpio 33 GPIO_ACTIVE_HIGH>,
+                         <&gpio 34 GPIO_ACTIVE_HIGH>, <&gpio 35 GPIO_ACTIVE_HIGH>,
+                         <&gpio 36 GPIO_ACTIVE_HIGH>, <&gpio 37 GPIO_ACTIVE_HIGH>,
+                         <&gpio 38 GPIO_ACTIVE_HIGH>, <&gpio 39 GPIO_ACTIVE_HIGH>;
+
+            nvidia,init-sequence = <0x0000002c 0x0 0x0 0x00005000>;
+
+            panel {
+                compatible = "hit,tx10d07vm0baa";
+
+                reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+                avci-supply = <&vcc_2v8_lcd>;
+                iovcc-supply = <&iovcc_1v8_lcd>;
+
+                backlight = <&backlight>;
+
+                port {
+                    panel_input: endpoint {
+                        remote-endpoint = <&bridge_output>;
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..bb280f8dbfc7c 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra-dbi.yaml#
+
   rgb:
     type: object
 
-- 
2.53.0

