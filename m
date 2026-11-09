Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246482;
	b=VuSpI4QOeDlCrG5lvx/WqvI3dlvslm04oizD3WsKaYhmdoyabr1ofB/S4BJKagsFl9iz
	 N+8819jYdPytCb0ff6pC9empYQr6lQEKHg7hWun60J6zqljZhRL0bocPSLy2GzKA9RNpG
	 8S0MNuzNDe1FukJTN2vg0rGG81T7fRhmiREEbuKJdScDKiUZWyJRj4ly0KFdvhm/kse7T
	 1tO+G1DcZnqXX0HMUQije50Ah3P2NBjvqjs9Kb2nJgiDw33JfqPlwIjy2tesAh7F6qWCQ
	 bl3fdMXkiIqFpvCQwtmjoe4IYeYjyN+fixb2N2+zXRa93jV0SiurZlfPmkX8iwdoJsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
	b=RJXQe1JVCqZ4L0CLcBipSdY9o8u5wHj7vk+ruJWY9rH18m52B0WSnX6dddtXVYFFe3BH
	 dh8l983MSKdlJIXj/E6lLyQU8IKyTB3gAiZRQgn9Nl2Y+RdztSOE08ykaPjxAlUfO92EH
	 YHboU9Bi42VORxKU01YMVpAw/wn0NDQgL4XhF6phDlfzUia3woUoV/t8L7ztjIv32Ssw+
	 KaM67BeaQT/BAjNalBX5VAhQ+/E4XkXxgtpuyo+q/gV3Ac2edw9SO489+SxIiHTfJSYYr
	 OpCpzVjrQkpzR0clj7+R7LRdj+CYne2tsNaisbJPaK8y9vBpSoTUOCWJNOeG3wCRY8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=VyphT7RR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55260A261F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A55260A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=VyphT7RR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8141905e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246480; x=1794851280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
        b=VyphT7RRWxe3Nb1j+alPv1dFVOBnnwvEQPNnZN2sFTR8QsulknKhLeTyqfbw9gW9+a
         9Xq7JqSTvF5dBdNVk3prQv9Y7ONFhmZ8B3gnBULlkZApqHaw/z9zfEc1itHBIsFQkuB1
         hf8S3ZiaT0v9xdzx8SrZprURp9Sbl4tuVF7UzubtEd2BAGQ569RQmFygxzTvNzk1G3UQ
         Km+Edbqsq0Yf0Av6+MPgPZssJmufla0V3Zq6RSF9U67PNnInd3WPyUVYg3ky59iILhcB
         kRYaoAulGxYaPwoYWLUKJZ7IURSzvgN+XcSBOIiXPt0ALFryznT8mFshQrFTDKx22jY7
         DpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246480; x=1794851280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
        b=dhtG11B9oDmgXTjEjOZzcHoxHKHgwfpcMWopC4iY3o1Ji6v/VO5Noanne0yO4uNuxs
         Pej64SFnlkuWe7zTk0vRiYkVcVjhJlDcW4f1HtIqgmOJ25EAKL2GT+Zv/r6r8jrFAIT2
         lxXDRO3Sgkvx+rZE2W1bXYSSzD6JhRJcfh3t3dPHrsT2gwBRS82o3k9vHfpfVaeCByhZ
         mQqm8OETti3fkZkt4AVj4637hfn41KaLboHN9xcf8binsTsL134TqwBd4W6zmGrZ4PmE
         icTc3cmz8VrZtZerPagFq6NnMQg8B42PCWIn83b+Wr3H3ykYAZZZ3Tp7EXOBPg+FjVuW
         hpOg==
X-Forwarded-Encrypted: i=1; AL+hErHplEJtosTMHR4EOjwJyGtLkeul6+3Jt5tWQEBwTb8WEPpMSztTVZXlY8r+HcBoZ6+lIao6D20IQLqLaYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sa/B3GUAgRI6YyewHL+XND/YKR8WDd2jQlg398xPOc3fHw67D
	Z4IM/A8UC5HniEJixlgmpn97El4VTuWnBt5KJXYuDrbfic79Mg+Y2VosnScBiksRk6I=
X-Gm-Gg: AYBFou05j9raXmcVqcH4P+Tmo+LNObJKW23O9dAkdfcqUXyqHCfuxInY/Eu0QQ1+sth
	sUznFpM5V5WHei9/uOn5ZutBFSnc5aA79+ycfj8zF+4QDaQ8IGN2OdVu4XqtYAx9srRQasT44DR
	k+DpVbd8HBatEknXVI+hdd499rr2oZpTflCndsWVoBfcT5SvKQLgCHoCerEY5/6ZTYCmJ/Pvk7U
	+comtEe9IQeEFfnZLGkAof7KBjKc39MYKyV0blWD5Gk+vgkODZgAnF42cVGN9mC0EVoTA9ISgW9
	vuY6WVMcza3VMpv07u4TFoSGl7Z3K7UosnleGd4+w7sxQFz/u7V84YsmUlK2MXIZ2KP+PjvLsRS
	iIVyrriY20AdiHgRESfhi4y0r7Hz4f4NfxXgYpptMgOrvetE+jUWubnfyKI4Q2xPJBiibRNZTN+
	sUCPX28s4DEcp+pqaB3BGZN2BMfHvgv4ix+PE/B/iHqjglmr65nKBsDl/LBzP6kXXZx68ykOz/J
	je/qcDNrHm1UvYInqkOMroi1JvTix8LgQhr9xrItE2u4CVgfefEmNcTUBSRsHG2fRwtsGCfVtgh
	ShUBk39eCiObP0yJoOyBjwTzDRfmnqOowHuF4/fc+NnKzZTgo638QT6B+jFkW/o=
X-Received: by 2002:a05:600c:314f:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4b963c73aa2mr94357825e9.25.1794246479866;
        Mon, 09 Nov 2026 09:47:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:59 -0800 (PST)
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Mon,  9 Nov 2026 18:46:39 +0100
Message-ID: <20261109174640.96951-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/panel/hiby,lg35583.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
new file mode 100644
index 000000000000..efdaf6241e60
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
@@ -0,0 +1,67 @@
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
+                    remote-endpoint = <&dpu_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c3e8d1a55d28..ddc559cac674 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8346,6 +8346,11 @@ S:	Maintained
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

