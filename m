Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964082;
	b=CtxaOIsfr+lw7sD9NY764Dq7SaZDUJ7Sbd8LPSoQCqFnZ/WIrmAeVuZkeZ+R6wMoGk/3
	 cD4PSp0cxFIJCXL/Q33cgDbEVOMYocO7ineiZETXxkYfx2+FO6IsvRuPhBGs7vX+IlUcr
	 fHa/fhl4/ntZzRZBRWkRrAIsQ9FbxoyYBUSXtJDnlAMlFZsXJpP1roqeDVrV53a8VqGnO
	 AIzQAi6hZ9Pv1h9WlBw83Lwr85NIX1WFS/4FWmeN20/urq+o00dkoegMsCNl6f+z3Q+r7
	 W01RPmljXSKkH47tfUSlpv/7/1sdsUUbuw18oQkgWRM5y6of5HdeIhK5nJx4uZ+aiMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uzrxba9r6cfMWSMaU1sgfqwYz4SAWiJlh1jtjdSz0cQ=;
	b=I0xg+PwcnjiktXOyosEVk84ryBx0/gEqF3HzRxWaTtUMogQTBADidH7QGHH4BXqbAvXW
	 1OsZy5+jEroIWIdh2Lz0+KCk7/5unwV04KzeyGVRHZYF7tz5ZVHfkn8H08Ub/BneL7yE7
	 BJcyn7FHXiuAEV97832IuiqAw99OJIN2uOX+goYsYtiC9txN9fIsdkufUA3nOlco159Hi
	 rtKOz3oN8oT7qBbbkFDaTJkJrHGwo8j0wfoyMjhqSZLwoiHvOUCK8lwp7IEFE+Ez/6765
	 ckkdJeR0Fsi+8ZNODfGdya/wQAtky3dBFRHunzEEWJlovN4iVW33uWneoJnOdf8DlhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y3uOXXJt;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B79A606D814
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B79A606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y3uOXXJt
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso5707395e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964080; x=1794568880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uzrxba9r6cfMWSMaU1sgfqwYz4SAWiJlh1jtjdSz0cQ=;
        b=Y3uOXXJt6+tH3QGp3g6r8xYvBOJniVgX2cbEOoMDsbIbVBvHRzjbXXE/r6+F1Yn1kh
         A/sFnKr8lqQZrz5LfOs+bS5HMwJdqJvTA+9pix82d90eff40rCL3MSViMsC+cjWdrl2x
         3WlslaRNATiW2QFb9HnVSO+ApMLqaOlKjCqnNUTJZG2PCPXGgNOEk6AhMOiYF4eHLX3S
         RzJZRKo2/BmJOHmAYZm991LP5xW9BzqDEkLUtHTe5zySxY4SMxlm7H0PTTx0HaoPBh9B
         g9wJ33+GKh5eWrsteKvsf9JW2QSsStz6ZnhS2wlU1YkXrjnsFMcFR45w9ZBRNybsYgEg
         OJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964080; x=1794568880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uzrxba9r6cfMWSMaU1sgfqwYz4SAWiJlh1jtjdSz0cQ=;
        b=wkOa4OZgru6r78OP0vdyaisDMCu8TNbfKSo+VTEfn0DNUNMMk3U5L1LSlxd9yauvoE
         9KDJI5iDYdBVrF8yfLkK2SmDD0a3YyDtz/DlMGVhIpXgJWTFxXTc9Hp41NEt+nfEtkaD
         DLZtSfJdTMp12Na9h+lOrOZIUBVbRj8qjDJINwRvGw4fYylTlnbW8KK8N24jXvb33OKC
         NNWYjb5rfOeMhSIX5YhgpmCsg8+GCsV8wrVUMk/O8cD8m0GAtsXLWq6HBPoOqHZJ4oqc
         F6jPbLcxQ5CFE1VyXiEIBbkJJnfz8T3mYGnkju4BdTTMz02S2tEW2OtmNZtmqoF3E6D4
         HifA==
X-Forwarded-Encrypted: i=1; AKwUvByTthZ+SdmFp3WGcP7eLgv5TCxmWKOAIfGVrgCVD8KKkKqY+tp8Kixnyf6uUMnxOd38uMIjENNRgwVxhQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nnh6DQKYAH5eXNkzxOfrDEgd0m6qqds4w/3N8aCTFnVcP3Bem
	+T5MnR+/ggYdZvido+Iq2W6g9RXCnxBITyO6HmqzOUlRdw4jsTb6WhJRZ2hsnuRinQE=
X-Gm-Gg: AYBFou3ZQEBL2tMmUeVzpEAGKvzgSeMfXxzHvVDPfxhh7ZOc9xEFa/nx9/Wkx/Qlqc5
	ksJqHIAcY+MfvfkjVOeRcdauwJ2vPn/uWe+acu7byY8QSkeghMwcEIqgudBg0T9dhaiglbEFCrg
	rJ8Qfrebg1J8OxjVM32BUy68f0nyvaEiZnVwSLF2Psp2spdm/0Wc4+d+6zPEMpiK1+6pSzPFVo+
	m+WGSOwXkpZRFowbPTRoKVL/JRNEyUGYekUYMVnjg5rGU6HxUWH4gQjNPtGqNqSn4rLJPFQI1M+
	NjtwnIVgqK/w+jE2SyKrss+bLI/pBCexG3PHtIabqMSg0VfimlS0NSf1mEYoPwBaH/oDcbPNimk
	5MzRnkG0UuIfe1rQ4kwDDZRZqjtExk1CVbTsAujvTAILMN6Ia9o6OSiI2fDEmAMCjRQE35a0Aq5
	/BrcYv6obPBmEOH+PiJOS9Gy+n4XYTWGHfY8cxL3+pKAiO1Q0J+2T2lebNHBTI45U3nMTKuGy9v
	PktJxkLYOQQ9TdQrC7215grsIJWfdQxiHuqbTsoq/HCzSEyaLgMN9z7hgy9pgL8wZHenoU9BAZo
	3zU3OGjExWE3DQdqt0nYk69htB6i+Yg15Fsn0rcWEqhp1dlXpzAmaq/QlSZ/4hpJ
X-Received: by 2002:a05:600c:4455:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4b6de6916b3mr36874875e9.24.1793964080642;
        Fri, 06 Nov 2026 03:21:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:20 -0800 (PST)
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
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Fri,  6 Nov 2026 12:19:59 +0100
Message-ID: <20261106112000.1612-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106112000.1612-1-olivier@mgcrea.io>
References: <20261106112000.1612-1-olivier@mgcrea.io>
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
v3:
- reset-gpios, backlight and port dropped: panel-common has them
  (Krzysztof).
- The example's endpoint points at dpu_out.

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
index 5d992133e0d5..474d8a597e1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8343,6 +8343,11 @@ S:	Maintained
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

