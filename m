Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246480;
	b=JE+Yq5w/CNDBiAgzjXJ1yAi7YKjb0Mo2/Wv85jsGNJUput6xqkXjYGwzEr0mNO6SRU4i
	 1IhBq/YpoTaGCzOy5zVmzGiJN2fq36oJ2s9pKe/y1VCovttVOv2oj26+txLemBQCREVhF
	 OU3U9EEvMii4QH+27nOHDjGzqEkOGVZitjP7qrTYqUDnacgiTsa3Fy8+PKoX3JF657k4p
	 8DRGoBOWAz9wpqO3m5QGACgM6lRDpU5JcWDmhInsQ7IHPMl5TAenKiYtrH3VSsfu9AEwX
	 IH1oCT9ZLdYqNhk1VuR3dhm0obfkfEc5+UPdgGx+1hDlvKiqcT7Mcd4oC9Zib74QmuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
	b=ShpMFKPiUpxZhQpzAWK8ZRBK1m8JMqDiVgkb5mP64GTAoVHUSWnZQbMTAUNMGG3kNfHv
	 AXsGkSeeVpQvXl6bUWnn8Z0x6l3/VoQ+vbCuSGVZcgCrzFzRDqLekVi471gHAKpbX5O6I
	 Uet/W7//dFJtbdB/JFuZLvPhR8GTIM+UC5YsiPwSivzOR96BMIiZ12/fyDwrHefsKvFjb
	 H4g4EHONYBZkG8Fo+CWJkC6mA4iGWy6XabO+LZw6NlurhacElJ2+61TnigXbHfmS/8EMl
	 6nCK3D/7mUvrVS7ldlg6l/PK3WEjPLQSo2nkfJ5RaRzXSq13hxSNrBWeB5qOcCYkjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b="Lkus6vZ/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC056606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC056606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Lkus6vZ/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so1580105e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246478; x=1794851278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
        b=Lkus6vZ/PEW5s/E5sett25uDWAFCHeq199L2QKvptiDfvqImhdPNi81hCSE+NGbwFC
         3RLkM0dI2rwntuKSisFIEGQ0qXBg2S85ZS7HJY3bY8WG8s22NZ/eSmbhkhhab5z6WC4Z
         7l1z0jGTTADnpXP/56YtGk51e31DxQYJYd1R/TYrAM46sxskGSDsbyPeh42opCk2cAej
         z1HlIFi0YWh54hWy7tj6d3MCRpmbx/HBawHxOjcnBm6TU+Ob7NFdEWN6CBRBu6n2T2B1
         G1aErT/W3snaseiTZx5oTL4I/crEkVmCarFOwp7PckxGxGoG440QxcaV0sPU0qqhHsKv
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246478; x=1794851278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
        b=hRb5i4DZ9CHsqFQfWDHGWOYijOhY53wpmnmefsofWpZzBA3Dm5ChNYcRNNAoTmjKmZ
         kmS0+Beno/CsKXeH9Sz4fpeBj42IaFBpAft7ytNMsbnCoKzvZ7CIEgPZ6UnQqFdblEIs
         1Wl/Bh4I3ZKX0yQPpOt3x/1Jt8fTXj7UHCa74wDn4wZVDGqOJL1YfLmGlAd2pHwYpNIo
         qa1+p/Qt32z/Q2KTr+RaeKfN5PRnq8AAeVGT41jRO79JjoBKytRFelBYQapC/ezUwK1V
         FEuvgFplQ1+XXcWkTSHMvOJPi/PcBC9uoP8CaUSYLQYpSy68UvswgeBw+j123E+jdeFD
         U2sQ==
X-Forwarded-Encrypted: i=1; AL+hErHIWlItAoba/hy1DGI5kriVlipFMIiGC/8v1EQjl8wluaDv8faRnxik7/O19z6Ro7ZuL+BcqpMzMLwsF74=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kOw5uVYMl+FlkjWZLR9mjFFcC2NNpmoiu7tlHdnG8Bwce14GU
	aae6qiJQNwkGhn2gt5ruJtOTpBuQGoG+aUDUHKXLlb7l4FDJPKhnYdHriankXIRnmSA=
X-Gm-Gg: AYBFou2LFyRARmKgVO/4EygyjOSi+7sh2CLkd94uXMZYxshkgQTy8WcaKoJ7ZqYufS/
	u/ZKNEV7wIzHoaYzF++zvj8Dh4jKGw2xW68ScCl549dW/F9es/A9Ozv/fMBlRBpkR9ohKqLEfSF
	0ohHTzFROSYuoZP9wE1RAmPv2fco+ztqxOgj7xtel8PP9aQujOlICJhJ646DV+g0xh2dcOoNSGf
	uwGcpEotCijO9V7QQF7+eCxmOn1nUWQ4BHWwy1kRxwwRnm0lGhjDKrzazcJFNP1y4l9h5mhoXgH
	dpzNCej1zfGONexZGWOh3VMEiEEHYbGQi0muPCBAVlVKHE6iZetb7AxUt/UAnWe4ilk/piaq13i
	LTGOTVQgFAqc92adnG3pesGGHjMQaxEOrnxrSX7sa3UjTnPP/7aFhILSZP/k7d4yK9Siup+TILX
	6WGImtYk4hyJoizWA+DRLWD3CQED96o7LJ49iCi52+r+cBVlwe9+QnLOJNXcstLTdHqFVCa+wYx
	LzSk47298Eal/dY/SiZ+EpvTUuUeBI3B/Wxf7/jlOkkRRRX6qXIWXWOiRXeA/YvH6POQgSyx89y
	9Xi7qtd4LQHM8NBxDxtfsvTVBbguDtV7ja5PfAL1nnXJTcJjbe2zWa8cB/rwXkIovqYdO5S5/Cn
	wIkJQbm9m
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr134995e9.4.1794246478209;
        Mon, 09 Nov 2026 09:47:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
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
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 2/5] dt-bindings: display: Add the Ingenic X1600 display controller
Date: Mon,  9 Nov 2026 18:46:37 +0100
Message-ID: <20261109174640.96951-3-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer, which the X2000 and
X2600 manuals call the DPU, as the X1600 manual does in its register and
clock names: hence ingenic,x1600-dpu, which an X2000 binding can extend.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/ingenic,x1600-dpu.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
new file mode 100644
index 000000000000..0e9f4442e4b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 display controller (DPU)
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC, the DPU of the X2000
+  without its composer. It fetches frames through descriptors in memory
+  and drives a parallel RGB panel or a smart panel; its registers have
+  nothing in common with the controllers described in ingenic,lcd.yaml.
+
+properties:
+  compatible:
+    const: ingenic,x1600-dpu
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
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: The output, to the panel or bridge.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@13050000 {
+        compatible = "ingenic,x1600-dpu";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+
+        port {
+            dpu_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3aec082b0a..ca3f1a4bbd3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13182,6 +13182,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

