Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955811;
	b=rPrAAjAGn5i5wPJCSU++x1FlTY8zbQELHCsErwQR5kGhL8SoXcqaAeZaAPizzhxRk77e
	 Wnjmg8puav9LUn7WIhwu4o7F1YlnmOu8M2LsV8B0EmskB+0gcEMFf0uGci2ak9SkJDVS1
	 82ylzc5uTOc6X8Tq2J8Ll2GiJAKiYwvEcXpKo1kbz6klvUQds9xfcgJ4zWSALWdZ0Wd2f
	 QiNqEaI5s+/WNAJtGDNF23lsK0Prr7i8hovmN+RjuqqQMoBjIFmfrH92nHQkjptVJsi2S
	 ajUgwokG69Vyvy/rIN6YIC5yZMNAXkibI02pSsH52weY51u2X7F9ol4MQK0CG6x7QbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
	b=WMSOZXn5CuG9v2OP8MGbCm0cXUkOgjj1URzDN/GGPn8yf+EqHi0htBH3Xfw0lsr3S/Is
	 4a0dME30HMK/0naODt+DD/6hnKuul/qf/1Gt1tslycVX7Ufa+X5Hu8prqDPYqCYvSbg/I
	 4XrLK7N+9HJ1L2Faq9XMvn/5SgEHsiBZwtz3zIav3pbmOORVffHe0TMeAMtvINPTYdBPE
	 dTh5Uf40QHfTQXaQFri76ZUjg9bhuA9FHX6TWz8encmunDXLY/AVq149ddXcuObrcry2i
	 O/E7aDHthBSnQM28SeDjdLCOSYSygcD54yCYxAODaJx86DXsANWD64FMxC7J1DB7O6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jLcw8MKE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675C60A2603
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8675C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jLcw8MKE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so3646105e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955804; x=1793560604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=jLcw8MKEECxPP/fvZs+TLnDQ/K2gjaiQqLn+wRBL/sxRPZAPSkkvBZaiay4WV+wvGj
         rk/6sNMK4yf54QbHOLkqaOVXOO7Je7cbuY3UzZ48soEXpYsbEAOxD8iN8JDqt3gZzjHJ
         NgOjQEfOfC9Uhnh/x7fBCzRW7dC0LPsgeF2gy5guiQ6QUYCCgQy+XgYfFKiaaYMQt/4T
         zR2kmAud+Xj6092+odPwAD3Rwfy8BUdKVo1wx6SsNSMv2HX6snwx5TpVtGETvfZ6KBHM
         c4swCNAsbcceUGK7WCWIBKwcGHM1lzH2T5zA6Ak3kfj+LZ6uqAfyh/eQojjbXWFERhxT
         8U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955804; x=1793560604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=ASSBr6l7l0Yz+GCr58BZaDmfPtulNoeBKoyA0s+4aCWIDFgrN/G3ayeUvgXFX5dLRh
         nXtgcjqN+UOQEjSwtQKWJ4PUs/z4SPdrAaHRI8RNhrHJETka6bVxSCOlL5yl/PwgXprl
         n+M/5btzfqxUTbvWe87GFs/pQhedhQ8Dl3sxvSzouLINNyIWsRlO8l1DfnEqECIeUKk7
         4wN6zKhI6gXR4OuJK06+BE6T8T/qsJqbuR1SADnKutif2J+73rgrcz6Yfu4ixBOfE9En
         eySEZa30J0XzfT+F3QTBmm8d4iZ5AMk0klX4Dv11OUVDwnXNLg3LPofBydkAOdXF3Hy9
         eUIw==
X-Forwarded-Encrypted: i=1; AKwUvBwT9zpYn/S2LZQw9CqpQAtD5gFaxHtRsYXIqxGtWD3M+uNmF6TZiAjiTaIWPHKKpRHi0oy4rH1HykfDdzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYISGXEMSHdcSCpyPyUVXB+e4MvW6zAHSW2UtqW4a7SBoSNGaeF7
	eedddI5/IgzL6W4Ff79HCJF3oB8rqUl9MIJkd2AMczDtb1loeT49WyVkSAjNgSwX/xI=
X-Gm-Gg: AYBFou08XOXYlHFJSJkdwOLj6MOSQQa7LT6jfb7TAPXhNCH0o/4zHugT8SAeAsIb51G
	hk9YK50ZrYOQD8ByCFhDim/wph4uXRM2V91rgfaotHhnNtkGQSYO/HF51xQgbm3lbEDhMW6sVIg
	ifzaDoneR8WNlOfNHu8qR7XOyRkdUoywzcMvKUzkGcCnwbJIPWm3FXJqG6J2V8FMgHvK1rLN3ya
	hsyP62XOgGt6hy/31JUfK4HbFUTpXFgeK3PMy5LT0KgTMrtis25YFOWjpRR5mbWabiEYLLuqlG+
	0AuYunNhQatFVZY1MFuO6ImtUpno+/T7InMvvb2qi7smosIuTJSJ7Mh0BZgRXgdHCVmCIXKgbXj
	p/B7JBLurB8OqffXI3LMGumpLVbQkdBETPSmmUyJ7CiMYGrzsVNEBvvL6vJM8Ufq/IF8JOFuSXh
	TpY0pPo6YBkeKkmgjTGbQ9Fx25V3tPEGp+lWlCXxXWBuI+hVmFMOvmt8PrcN3YOM+YtQWBKMmtZ
	YGU3AlETJ2Qnjjb2Wh6nC9k+9qPW2tHLL7p2tuB8u5JYKF9zUbVSftK3YAFSgMk+ZDI+uKJCUDn
	TNBTnvtuKv7d6g==
X-Received: by 2002:a05:600c:5397:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a35ac99b8fmr81985055e9.8.1792955803985;
        Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Sun, 25 Oct 2026 20:16:39 +0100
Message-ID: <20261025191640.13592-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

