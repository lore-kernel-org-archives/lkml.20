Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287777;
	b=vGw3N3hfL/1Zz12yZOzFngTeBcG30AF8DhwTrcE1eHaEEXIQoQ3uu4SnQozrs43K9fgq
	 UCCPAAXCTfUh5aM2ODNFBTTFBw3H70UJpRPrACt9oCT9550xD3PBSh9iuzoKFxS1miMWN
	 RaX+S00CrvKES5qt5LtkkNcR3YJMT2/CHndByLQox8X4/UKcGEOK1NoAqJHwEDM1VfbZk
	 uSl2w/tUAf2j6yUmq5I48tTmV/pFh3r0PhDyt5O3C2Q8SnmhK1JnYZh7U1X4F6ethZsCU
	 TIW9byQP2V9d0K+9ppp5d5NeL4Qbq2NAVlq6/yMkVnWQrRHZWcvdpC6RmiWgTDx/KVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
	b=VYWK9penyqqpI4kEm9J6isOCrnRicHgkwGA3KLSjvu3vVHgcZvuK2wxNqYabBiG0oO8h
	 9njN9It3eNpRlpTskGUv4/fOW6lzYhw1ZTLY1zg/5wwW7CYI8wxVFW3R8cFF2o+G0SFWp
	 Y3MGT7clertkTa1uxm29uxb04oGxdnqdepi1LI/4B1wExjcq5pEX94CdkpU0v27/Jxi5Q
	 w1LJ5Qx/RsNcgs0doLcIP7wUZdS0uJk4TUa5908cIiAdlan2LA56IZrfyQI2owbY0A1Q0
	 RKl4HJ28mjOHO1YKT+m+NehH00H+p9nfhG3KPRFM6SKrobX+RZVd3pLx/hiZlV3HWBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTkI1T0;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A98606A332
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A98606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTkI1T0
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c46822eefb6so294804766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287775; x=1793892575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=ZJTkI1T0FWKnoCCvIKAt80JZM78wIiwL3ZlTTnaOegxkGtq3PBa/KPsLh3bFnEX/xM
         dE6pHqkgeDepM7OIBtdjDyjoHytijTq25QTrFg4XnoD9DOHt7/aPi3Wua94feaPcFxl5
         2KuQhb7RLHiOjdLFPvzsWM+6g1jguedkNjQP7jgHOSnjin20sOH8EmEvsZy/8NtBaFEV
         FdYoLyKNz3QG+VfFXEnhbBNCPJ84LpBcLeIL6J43UY27+8GnSq8NpQ8VPCePNqJtOYts
         x4GwTXOyV+GXLzQCS+l/T7keiMU9abGJN443LNf5X+JmYNNNv8fnXwK4PtUWY0ps+KKG
         oLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287775; x=1793892575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=oI2RvutoP2MAHtDjSrnt/ZyYmmKT6bCL2ihmKWzEptBYrI29s05h4V9Xva1oPU9SDl
         XaV5CIx8CR0Xxh7zhHBdQDR4AB/A8Z1R9UxVWPX+m9iaMbdzQVHTJq2cjtDabUvm3qdp
         qeRLx8KD1tbeK6BJ9wzZ6zZo2EXcGnjgGQIgXwXHitc33pco6Vt+iSCwWId5gNOYSr2M
         oO+Xf1rzcVli/lACu/Jlmc8rWvGCtF6GmVBdPLWITiuHsu2HpNA6KYSNBZ4pdKVCv12k
         oq41lRez2sI9kPoFBTtId5/bxZOpawAQ3Xw/yKBx11buP7wVw1nid769Lc8Trv7532gL
         llxA==
X-Forwarded-Encrypted: i=1; AKwUvBxqZlz6PD7qDP1GI/LYZ2pzlcZkFshOzq+3ZPQeeVOoZvlmeLFn7VXhdv1yy3fuS+mZW0xfN5fy0WwZWc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHjxoHTA/oAofnb4MXjHHqhSctylAO7E0ojFoA9lXdQGq7kOk5
	MOuNSTA0urn3CHjMFxQwp5FVIIb/frphQ91rVUFKTxHsFfGBdfpTY39+
X-Gm-Gg: AYBFou3i6gdVXTBnLeu2n82pdcKXHoH8l6mnWojleCTjo4yVnCfPmNrPkVSvAo9m+VT
	4y553GLlO2y93/Fr3pmQLhEfEqMWzTa0MN/Zlkglokn/bQ0UrJHSG5j2tUBB5MPbgUk6LMYwZRI
	7LR1mORrIzyeh2c6MxVPeLDD6RNY8ck5l9OlPs5k+B0eyTTEwccwBsqFWfj5wqWv7aEGvFFtQNz
	3hyIylucdWSTmkm1M84jAZAaFCbYU2fkyAYZIYD1CIeY+m8PtPGewNBjz6ObvCegmxy4V2u0/oB
	cgrVIHcNasdrc3DFnq7cTb/0+4Bo3uEd81pPWURQ/es3K0oz3F2jCmhD4xXdQvc0uKsfQtxuh4H
	WIRmsgvOGpDd2iibRAHhMsbW2Hf74bN13MSkGX209rP5ibxj9pzd9jabkabAebfL4t0djVM/6jp
	sgAxXYudouJ8d3fr7/GtJ0ORywg1oawm16H34rVORjBFtMpPVjbUgCrNoRkdawj/MtyHxRtt91p
	6oFu+1VOOBaPg0+Ql7NAPoSVrfJKkAZXaW/ldetl7RAiRT3QxmQO6cttIeoiOhmkTqJNjyaxFHZ
	gIDf70JEm46qBK4qR5fs79ylemZBcjFAmIfpo6GU9a0t7fc1vg==
X-Received: by 2002:a17:907:6e8f:b0:c46:7645:86c with SMTP id a640c23a62f3a-c49bdff352emr527006466b.47.1793287774682;
        Thu, 29 Oct 2026 08:29:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 02/11] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Thu, 29 Oct 2026 17:29:00 +0200
Message-ID: <20261029152909.234584-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..4642dc14c42eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx10d07vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi/LG 4" WVGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hit,tx10d07vm0baa
+          - lg,lh400wv3-sd04
+
+  avci-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "lg,lh400wv3-sd04";
+
+        reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+        avci-supply = <&vcc_2v8_lcd>;
+        iovcc-supply = <&iovcc_1v8_lcd>;
+
+        backlight = <&backlight>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dbi_out>;
+            };
+        };
+    };
+...
-- 
2.53.0

