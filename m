Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955804;
	b=3agfhEqfiq3PeIhQQJT/yblRMI8fj9DmGXJmxyzJJXcU2Xm9YhUHPVD5XjOJoJ6gJbkX
	 ieyBMl4UJ+1+/Hct568r7AgAIwWVhwcsC5p0G7Vyp21Oa48k/tSJugVsM5ax3q/PwIc+S
	 ATKykD5gr/ewHOc1FCRzMP6QfKepYzx2Pscm+iF4oCyCVmnVCJG3oe90L1VaBbUrAfLw8
	 kjI98grq5XDd18YbuVj3wesWYQYM3O2S0H4fCe7ha3OzCWS4NnhBvQVDf20KKyEScpW/S
	 s6GL9YtKZFSLCvksObk+zSOK1uDTGUHhbm0msFJi2mUq47xmicY3QXRB14iVE9rfmrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
	b=R+xG5hqZFHrUAqOQqDGLrC3FG8xIfSTV3XGW/sHpKMCbVDpLNPbcomIRYyhqJ//fhOsf
	 zz3SbwhQ0tozZQJp2D4a48XAySfk0GsK6Fq9TLGTiavNG41COP30v2TKopdpZhWAOqYba
	 H81EwhxFeh0tV/Xaw1vpsLybuprsy7sfoJ3zl99SB1waJHpvq+2SM/AqaGBNgsa212YYO
	 IghAhWEJ6x6DX4BVPq0fvKNmQ+hsMCIl+iiRdz4WN8voT9yRDj2F3XLL16oOWMScN5yH+
	 gTyNcd8SdY3pjI0PVF1NYTYPn6bfV4Epyz13hOo1LxDua0qOdSX0z1acL+z87Lga9uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qH+MjWg0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36622606A333
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36622606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qH+MjWg0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so3645935e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955802; x=1793560602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=qH+MjWg00AIBXFcs2mMg4P273/BxhHXAGYqkwUn/B3fqqyhCQ/ydPM0Oayoyqlf+Xs
         54A6f+6oWNGqf03RnsnctANOIVNt94e/Xj3CDu8IDNH7a3sGuuzTy4dXIXETNv1qWJIc
         wLlhwEnZi6+gSH25z4YF1ROobcT5i1q/jHIXdZGob2o4OI8140ZcdmnM+21JtAb2HDqZ
         H+bC4vBB8YswKNqQrJBu0hEl1t829aRLyFm9ZuFLG4O+nFKUzAGBgPbp5jsT8NdEzeK+
         XPoOj2eT36dJklXS3bKGFFzvk7SzeiGdd6bNv+x8vcHwA2NQSi+2RCxo7RfQFqtKAcqt
         JsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955802; x=1793560602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=i53GL59TLLGZpYnCCP6zqHBRvGKgSvG6IjQC/ZJeah7sYa7wun+lilJEzzPOBt2DAb
         osb44bF5wd6g0UIE0P885whmt0gSarBpnU3V41UkqxruRV1F2pQ+zcbTzOM6ID4d+xoC
         kFA8Q30Z2UTbfEDZ5J02ZSsxj74MYPMwcPG8PJQysF1aGBF365WHLcwK1vZsOAAmdIHe
         5mBgSXt1miawlfMUYHLFUGsF37z1Orfo+s2ApVa/GcQMxbV48n6YVS1E98AeGPaDgWxH
         tkmtZcjMLoAHtKvi20ubcos9me8ZYIM5oIxIBmcg4DH//522vSOublY5Eq2yQBZp1DZ2
         vHaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH4v4S5sJNdolfIOQn2CF2oUKkmUR/x8TdrsITsAQXx1oMa25EhSLsixAhnLIw3b25uMG+26mUnpWMfk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK33/EnH2fMBse7mBda931NpiV6Njpy8JFzgKspeCZwTGU4QhPy
	8BvYvP9J7nL9RFciAxsdq33DizCHantLCnT9vw3JalCs+hx1BoZDy+SWAr7+2U4zcvo=
X-Gm-Gg: AYBFou08GuKh1by99lvboSTyG9LWao6o8xd3ZhVaQIdQLN6SNOIYWB4T6hXaV/PBP0v
	Z6lfnHUepzLl2EvYTvrY81w8WWX7gzpuADutPBvPCJ0eSiclnM0uuA9Hs4+fGcJdr4W4Ici3Bnk
	KsOZhVEFza56ms4IUdRSDkIY2eBg9G27H6ZDBY3iv1mBeMSKVV95rKiSjliOyIcKYyKyb6UCgYV
	sI/yxb7zLdpfG/9S9o4ZMWzPydp3jvOYB2XUW0x5d8m5iqLi7mp+ebfxFZziOMteNtk9DFa1rzI
	NYGFf0Xdt4lMXkIUlsSE3UpYPm841wI/EjlRoNc+8JU874CKzK/NNOXfnXGP3zzctRGbRHWAuog
	xXRiAqkqaDlcsry9UqeShzFYJToMly4CfMFwG+jV68RV85AoBHE1e88hh4NQgtMyK/3wnYhO1Vr
	TGGWUo73kVWu69HALSz0o5iGVJX4Y7v6L7YHfMlLsw5OV3mwm4c+6l2C3mL2yOPUKND8ihc8aeb
	m+7mli2fo7SXGf/iqTP10dgcR3T71AtT2E336wyhpjX6uljkGAymU2+jP9qLSjwehRD7qtXHdnu
	stpLL+4y2AWMV+Y=
X-Received: by 2002:a05:600c:3e8c:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a35acbcc9cmr72896635e9.25.1792955802524;
        Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Sun, 25 Oct 2026 20:16:37 +0100
Message-ID: <20261025191640.13592-3-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/ingenic,x1600-lcd.yaml   | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
new file mode 100644
index 000000000000..171536c78f4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 LCD controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC. It fetches frames through
+  descriptors in memory and drives a parallel RGB panel or a smart panel;
+  its registers have nothing in common with the controllers described in
+  ingenic,lcd.yaml.
+
+properties:
+  $nodename:
+    pattern: "^lcd-controller@[0-9a-f]+$"
+
+  compatible:
+    const: ingenic,x1600-lcd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The pixel clock, whose gate also gates the controller
+
+  clock-names:
+    items:
+      - const: lcd
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: The output, to the panel or bridge.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    lcd-controller@13050000 {
+        compatible = "ingenic,x1600-lcd";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+        clock-names = "lcd";
+
+        port {
+            lcd_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..98d46b1cc029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12927,6 +12927,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

