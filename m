Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918701;
	b=lOhpLT5LKF+ngL3brvLdOnGt3mGJM85Obw6ZixV2R8bxPDuXVvF9PlnXeu5BYpF0nnIW
	 lSCi0uTMVUVlKdt/2Z63IkQAId0qZJUwUVgIDf7vC+hVAatymUUMJDF4WKL4a7VlER7xg
	 W5Wq12vtMFK619WIW6LRQoQFzLMIP/aqc/ZxsYyzIQU+zpTHTlb4adUwn4WK7oAw1rQK2
	 YjtD7N9UfkbNBrh6B4oFtrjTw8Tk/MC68BJaO9fSjDYyBqU625eCWPzP+ZGDKkDZBWK6R
	 CdO2CQpTHvrsvxeNo65LUPZ4b2jVZj09is6w9W0mHGC+ZmCaJ6ebKglaYzmI1Idy92g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
	b=X45aGVaPRaGx/LoA4q1HB3MOqSuufy73W3CpxTs9UGA/vq8uV7AByE4TAhHtsXFhiKO7
	 mupUvIzsY5KFRDq9sXOgbkXmigl5xvouhzFsE0FjAfZ9DQOnHcMSfpIqguXEftqW1N1zI
	 jM05/tcFIBAzJlyQ+WKqQ9ThoHqXuLgwSsy+K5R5ctp3p1PWVoxMBwG0q0ZCJjaHIYC6B
	 b7fF5rIJcB8HMPV4jtaAJLnEH2cUoH04Ayto0jb7w4LeQiGkMURjw7GR0uXlpsLW1Kr0T
	 krPBgg/rvNgg35+Hnbv5wHxuxaDEvRtX06QMwHcpXrUSPCbgWFq5iG0+gE18I/ckSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SpVtkEgL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1E606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D1E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SpVtkEgL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21723325e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918699; x=1793523499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=SpVtkEgLwsKWjd8xlLQt5CauSzkH6wiHgZrnTUaPZZvxNrIukHFF9mWlTN+AcpV2rx
         FBF8XdhUzRnsqg6nPtI4Zp3Khdpo+dIxseGUovNb+waniNlPSHjjJtaVEZXCm5Y7J/az
         d1z6NgLk2aglswfdYPdUegKgUC/54DeK3Za72zSZAauo5cTSKhUIvBbwi/UIQX6f85Oe
         R6NLDVdyyYO1I1+sJPUav74rPpNiUwXCmcY9ClJxIKO8caRu5+n0/WgaaWgJai+9oFiI
         fxbpqjHveQOnEeQirp9SQrw0BOFjZYU1ZKW4zqXjz1Ia5zFmvf72Q46iOP5Ulxpl7VJN
         737Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918699; x=1793523499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=duFLRR4mEHsxBzYBBvtj0HGJN+fqRcWBbvJLID0LbXMK0Z0oEozHcomFav0MOxqN8H
         dDQzKSyvzbi2fP1J3xiLThNgJj7rIQNUMtejnGrxMP1bMJfpxk+IcaqpQwi3XTZvDxe2
         xT+up/geTPMxAR7ACenjspf60c1YZ3tnaqAXgadZUsBp63nnlfWt7+7XHBqkMG3VSytg
         lO7DL3Mgt+VPxXtTiM+cXngfsaEpto5dm6pq6xofuHO9gQa7hUh+WY+lIQBHe3ssQ4cc
         DGERmMeSf4QdjdejN8RC6VLIUKXAFBSa4Z/Gvck+4zzMWk6Xc/v/2wVh6MNf4Ak2aoKl
         PUmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpnFuoCm/9nhYNPmO36hWZfsbGOO/bR1yQ2lLdpV9lBQ66wK5GQ2QsFV+DcSDA/Yah7VD7dxlWHcv/UJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUbwrH9p7DmjbrbmjdZZgXA2fSVxE/jxsiluqehYMTbHaq8dKD
	1gRReTd30lqzHwigSy6551n4We7wgs8djXuY9G/plKRWwtEIkyWF7AOHxmx5YnttNk8=
X-Gm-Gg: AYBFou0+7jNg8XCmALRs9VG0FwxzVirAgZ4/P7Pw82RUIKBWKVVVhkxE2kIGIyk7r2P
	lGqqB3moB2+8cJDIiDS941D9YpoOWypqW4+i9tHwOEaUXarXv5wck6W8a0PyBW2Oa/1PJno6N2a
	TBUkq6c3UFWkvuxEicTy1SICnaYePw7TVP65L/E1j/aAR6ChJrwuYY0GniKuO+51DCjgkfJjJXZ
	U8fW16oUoLT15+ve4KBJn7k+Ptyb6Pe3PmJMotQHT71Rk2ePK4tDJD3NKLneGEJN5O9sVw/i3Uy
	pawRFipo3hldHNyh2aauBpULi/4t795/HSwL8jC7HRaZcy+LTmAe4R5AZ0deZr+xMtF8PeXmvn/
	ZH9IgsKFbVmK5Z6SGi8gZjyeQst3T9kaJs7cVBZosmzYSDB1+WkN8keh9iogWGg/UmKP85PfggR
	7ZEW8fTiDGxCivZJ0PdYyA6FYIAq9KUNIAI8+lON/VbMQgc/STD9CL04snakOKOAFnl2TgBg2Dw
	UkI5+omxgLTZZCh7Eh/4ZkxYOCxgr/8BA4Qa+OcxuwtvAHS91UC1dmK/lyggzmyCg55mGF29oLe
	A9uBEA6Z9AJiFwAy0ETPPfheF+PqNn3od6EVORpsPGobK1HVYz5oFqAGqirbFUdjABdhxab0hg=
	=
X-Received: by 2002:a05:600d:c:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4a373be2a9emr37807865e9.16.1792918699556;
        Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
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
Subject: [PATCH 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Sun, 25 Oct 2026 09:58:13 +0100
Message-ID: <20261025085816.60405-3-olivier@mgcrea.io>
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

