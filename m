Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964081;
	b=TcEgLn2Q4bn1YBpiwtb686cysOVsHEFbvtlqOue0qPum7E+3ULHEmOrj5RDvmIrlWnsz
	 loI0jcRxsO7o9HpuXyBV6ZDuvjyAT3SKhEaYyvkhsaRPAev9z5usf7aq1UeJ3vGoskNyb
	 ZXEc2IDFBQpcEsPppH+Bi3Ns4RYpKzaY269cEQZb3aBsdYnw06qnaZv05dGcOI3LQn174
	 bJ+0wJKUWAry6Cstl8iv2q4oLGttNyIwhsr5CthzkHSa+iyFY9Ebzr7BFwlvdIh+1vWC1
	 +MpftwaRgWdOMiGuY4SFDqDrtAWqnF47C7c+dw0k/DSruyhE+fjNnFbsWNGSFkx0hAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uXU0cGie9RgBAnl9s8QiGJKFP3ILXbj0HPLmva/mBOw=;
	b=frKdlHWoFZDhQbEGXvFS5C9Q7KP0+b2nwSF8cW4WgNVjX3gXMtCZrhfBKfU47Oyg8+uE
	 iNGv4Md6nZh3sRUa5fgrXvVKIVjeWajfN1xgx52HZ6lE0iojthGe5qmagEnZYiId3ml65
	 WcUupl2pS3yf8u5Fm1LlYiU+RCGeBb4t4pWZ4KxAUMfOE7lKza4pJepXmP02O7Mm9lJvO
	 4+7UXgSeEk/FBM0j/V0wD3URyLtY4GdmMJ0Wn9oOXj//yROMIBSWFqwt1Cvs2huyAyOmd
	 pJtdMrdxSh9ch3GSY7QDWUsOSJctOrf85b5wXTJ+8ZuuDEKGnEXFQN2QR5KD8BtczHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m+dGSZY8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFB606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBFB606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m+dGSZY8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso3429875e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964079; x=1794568879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXU0cGie9RgBAnl9s8QiGJKFP3ILXbj0HPLmva/mBOw=;
        b=m+dGSZY8I7BFHE9ZqLrBdaji+3TUwf2E5oxwOjMXV3vQw6gBmFHgHkX5RMiUPTOQJp
         aligg5TaGhgbBl/eEUJCSmnZs3Pa813OCUNLwvGhU4y7UwiDDxxObJ4Grte4uUnAuFfO
         udvGdfgXID2U0oFAhDhS57IlLal/Rg/kQx1B7KtnBcNXQeMW1YGsN/u9oFYC5968jNFy
         ZxQkiLwa8oZ5kVM3iUuLUNRqP2S+2Z3s84XG5JtHg6vz3AaqS20tu+rafvVH7UmEAirL
         J7jNcX+/98pfrWcfATNKcvfj8vSPOnGH0D7AGOXQblVdeEvlA7CDazpm4jaoNolF4I5a
         W6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964079; x=1794568879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXU0cGie9RgBAnl9s8QiGJKFP3ILXbj0HPLmva/mBOw=;
        b=VyRrpdJ/oeWhvDlZAEYrGpgjsUHHuBg1P5Cp71ipk+q+kdVV3G4TPoJrIQvHCLY60V
         ELRTXA0nr+5/W3JyQCicsU0b8qgdZQinG4yT+aQGsdxOMTVZZ6gtadE4hHz9RFjv9+32
         wen+RVzkQV5f6elSmltdTvR8TiPhMoeQGzs9hJwKRs0bSAWQglyIqIrz3Ad+UFUSEUC3
         HKU/K/YSTe9Rc++UFBLnqmwJoYSB19qiVGX5vUenu+w4d07m4//O66ieC4xEgULQOIRA
         rPVr7GgcjH+QWkN+hD5JoOaWKfxQoBpdnYrP6e9ut2/OjwNjguepxF6dhDNHP/49g/Xm
         kpuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOpBEYIzelnjWncc2q4VK67JNHT7iz/9wbQzD/a/PBfLUGvy3b54I+KjjuNtvrTLvcQnlt8JTsCkImOb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yAgKfIP+BH2a2ZsCs1cXF3UJ+KaYN/MQhZcW6RL6ZNKa9ToMq
	3Yjqv2IECn9YnZxRDqbX5DcQaHMrDi31obCE5KvqE0ev7Y+Rjk/E99VopTQLwSbc1q4=
X-Gm-Gg: AYBFou3/NuGIXLnKFgmAosz3c6xH+KO2yDlJ6UAjnaOrXhGxruOWsFZVKfleab6tV3L
	Wz2Etag1n7qpjFEYfIol8zpqL0+T79NbHHmV+eVP8hW1kPs8lqMSRRp+Z6kLyZws0TdGAKsFBta
	c+n34VHgv/u/drAqppTiQ8TjOYSV0Dqjljmy18z1Gzo3GHFUssAgtze4O7Ob0W7M80W9wT6Z1Jl
	dCYxBBemuGY6FyOdyuwg9Mx/skXBXLG6QDKIszYNpLdt+QiANrE87TppLuARIxsVy+7FpGlFhyu
	q/ncs63Jipv/w66DTbiOvW/bnp3Dy0XAhBsy53Z1jrJyjqlyRR7R7tZdrhWP4LaejIfbLar7CiL
	ztDmWsSgMCWpQ1ejF1syZm17GXoIMsjiiWr4+uTgQrTDHFR+Mrl/IL0ergGTO6Ldnz5+TypooQq
	1rbeqxJIJScPi1d1TtvX6T8qOwzn2Co1F6znYpUdx8TiFvGn85HlanSaGZNNq4EGOdSDL30E35P
	3QGxvFzmi59AoQvp3HAwBOToe4PRYDId4ruh/oP3aVP324OdG8SYhpGvfAf94ldRudPMM+c8Ak+
	PvOjFqPRMrlFAqJv0tCuvDk65+w6ql9Sh6DWDkOHRZ/Owu81mVcbIqWScYduR7U=
X-Received: by 2002:a05:600c:530d:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4b6dd82ab4bmr29802925e9.5.1793964078897;
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
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
Subject: [PATCH v3 2/5] dt-bindings: display: Add the Ingenic X1600 display controller
Date: Fri,  6 Nov 2026 12:19:57 +0100
Message-ID: <20261106112000.1612-3-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer, which the X2000 and
X2600 manuals call the DPU, as the X1600 manual does in its register and
clock names: hence ingenic,x1600-dpu, which an X2000 binding can extend.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
v3:
- ingenic,x1600-dpu, titled "display controller (DPU)" (Nikolaus).
- No $nodename, no clock-names (Krzysztof); example node
  display-controller@.

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
index c10342aa32f3..a5160860ae26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13176,6 +13176,11 @@ F:	include/linux/mfd/ingenic-tcu.h
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

