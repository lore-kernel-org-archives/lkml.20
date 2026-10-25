Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918702;
	b=QNh2KXn9n4XEeT22yTgVI7KPbVzRt4D+tHOrYVSrTVT19cOjG9drk92q0gzjcz/QMHNG
	 cfEZt3fxCC7yXOXLPSLVpPFMHPPMV9g4/AAZY0Vaxi4CFn+Sc8yUK698//Z+sl15hcv1V
	 0loznE/Hth0elr741zVp/ALzdc5s8AMb4bGwuLBiSt8Y3Auvt0xByyDncq+4xwMQbGIlf
	 1bTMFnLct2PVlIQ1w1l0bTXgdIkvUDGtbCaHXA/Y3Aw1cRW5q6YrK8ACmXGYRgEx2yUKk
	 8tTrU1AxMAKca+uCS5iiA1CyWFS+A+e5Iaf7m+TICDj3azV8vGIB3/iAWl8S/UXBcLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
	b=r0m9/jElJuxMBp+E9+Ku1JKiWSWdhQmumgwMqQBEgfwOt/+0l4qVAhmAsVF1KhODQ5u9
	 dfJyyS9lcL0ZszRotEeksvPJwjrN0Hfub7kpWU2z2I8xQYiKR1qoC0wGfGlC7HcSp+Umv
	 iJj8mBTcp/6vsUr5D6wmvBvYNBSdyzdW/lf71BKg4K85ASjaUXYZQNvrHyUBlkdWeOTsl
	 dqEvBqHbn+2dxwCUjLujR8eHoeIto6wY9lHrBkvvDmASEe//mXEMOIciojDTq0D8emcFM
	 EkeMxPHzlgnZjRnznhPZkCcBef8jcWpWtiE1mSM0j2YSr0pokvglxwHDjzDTStDoCEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WCYC2F1e;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E130606A338
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E130606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WCYC2F1e
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1038604f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918701; x=1793523501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=WCYC2F1eL7PSTWTewswlPoV+s/3gV54ijZwZdUij9tzdzSwuD4nnatlbxCrf81nbEk
         oIJ1zjY9a1cDZOeow9P71jiNwROIRl+li5gpaOIiLJi0oniTVzlR9HoAFJVhtBoLb5Pn
         YpeU8U2oL+HtPzoWnIKREM1gvua4fvpBQyrRmpt3L8z4VEzp1XYixHT7My0eFUBDzCSd
         zJwa4SdBL5Z/iU6fc4CcMtp3aEBHE7K3ZBFuYbz9kIneycZGlp2nbzR3f0zV3H0VJOIf
         AKX1CdPahbGqTRh99OIi5cJ1O/owNP0wKyMT53HVMZFBd22fwXeCu26pRB1j9ehisTBh
         TFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918701; x=1793523501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=ubvjn+JVi3GqdcVlD4/uFxgCO3BchP1xc7lhbIPn0bTtBexkREgZjAZF1tDWIBcwdR
         ZR/a2xdeKpglN5kPsNv2vmVgRj/VJ/7uZ0qhlpDEtaAp9POW4Q9aa7vmGcxkJ7W67u/8
         aEbVbemsfrQXZXAunzxahWg0Nbz3+CWrxnDsQSiZx0d8xPnecLLcytznpMGzbVcouOky
         o6nhVpTvFG0MPOqSklkHkTS6kIvrm+47L14+h2GCQDT9d0vDsjqfcIqyOkMZaI9LC4Cb
         w06EnBEggZlECB479HBwDt1joAciFD+dSRH7zNDbwRbA8CNFtImh3WmKLWFq8vwnFZz/
         W6Fg==
X-Forwarded-Encrypted: i=1; AKwUvBybJYDw3jsIQ2/yo8b4SVlK4RWOlVm9GiNNIiSxkaDVE78IkQuddeh7pL36vvxBzDrJqxDbGBtf+XZRuao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkpiFuc/supBXWoR1Nb5PBHfw/q4MZPqL4Ape9tBGvOxtHyNHL
	cwGRcgboYRHaQgI9+/LoEKOvEQAuuRNFT8O5CmTA4RadHHR4Jz+DOcwODq4OUFtS14E=
X-Gm-Gg: AYBFou0Prh16kwJ7Pd0XlWqvoDTWE7uN4nQhqkki2OJABJTL0ktT7DVc3dacxgL3uXT
	Fb5P3xKbNX2tFVcqYLB3rFPHsLdIsJ9Oy9jbplKOIrEImIvVLVibIEKh5vAXC32BGXzRs9shW78
	EAteb8S1cK17PORsqFeAr9W0LoU2+T6oSPOqTFekjUO162GVHefkW0QU/88qiybvXbc4xgYzV5d
	TqwZXC5jZccMb2gE0I4qkpSn7cqR1rjHVCpGHssdkMrRYIH1MqDpNEkYP1+49F2kaoj0WDhlSy3
	ZFxmgl6YmADkTRRbx32MWcpbDbV8kNxXMYPrvqgAOg61S26yq2cnjBJN/fs38vU74jN1L9ZKwPq
	AOPxF+2yqQdDp2EubIx3ogwC4B96cRmqdu0re2LbG36bGVXHyQsDW/1anr62NlZohWHiYXuRODt
	ALI/Mt8enBR77zbad8vO5eYmaFnrDyLRSFvjWN+SL0HC+00oC39CYcPu76/tM7gJ6lYjk5XYTja
	AqPmZTLge5bbrDLAXdYcewLKXn2ZWE+s2vd9r96O5KE+lQR9sHk7KLflGwI3lTSMXnGeryTQ+pd
	mvEhu9DClaqHraApkzB4BYock4B46hnPeYfNOifPjqkbVRB42If0RqadyNjc/3jQdvNNR1uKgA=
	=
X-Received: by 2002:a05:6000:4a0a:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e3eac8e4bmr6815931f8f.0.1792918701100;
        Sun, 25 Oct 2026 01:58:21 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Sun, 25 Oct 2026 09:58:15 +0100
Message-ID: <20261025085816.60405-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 480x800 parallel RGB panel of the HiBy R1, set up over a 3-wire SPI
bus with 16-bit words.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/panel/hiby,lg35583.yaml  | 71 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
new file mode 100644
index 000000000000..19498910629c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hiby,lg35583.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiBy LG35583 480x800 panel
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The 480x800 parallel RGB panel of the HiBy R1, which HiBy calls the
+  LG35583. It is set up over a 3-wire SPI bus with 16-bit words.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: hiby,lg35583
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Panel power supply
+
+  vccio-supply:
+    description: I/O power supply
+
+  reset-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - vccio-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "hiby,lg35583";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+
+            vcc-supply = <&vcc_lcd>;
+            vccio-supply = <&vccio_lcd>;
+            reset-gpios = <&gpa 31 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&lcd_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 57313163e59e..e65500a70c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8152,6 +8152,11 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
+DRM DRIVER FOR HIBY LG35583 PANEL
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
+
 DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
 M:	Ondrej Jirman <megi@xff.cz>
 M:	Javier Martinez Canillas <javierm@redhat.com>
-- 
2.39.5

