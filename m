Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071049552C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784164; cv=none; b=ILe4YhMf6EOINOjgqt9sxgdE2yseVkGIIl3U/N5DduXVqlyI2mr4evupHIqzwB1QqATOwcdS/WZ4ixONV5mfI1aPbE566CA9tAEigKRwzWBmjJ/PPJThgT37cdORXl3I87t2vOi1dWRIbCG9KdEgvSc9XshBU+THEoUfyzNchmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784164; c=relaxed/simple;
	bh=Ot25WLyqVRhsBXv9+FeXxetochqDJHUpqUPvyel2wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q2aAbPxWFf0B9ZOt3udMEm4Cse+SZMOmoxaMo5t9NljjNI+EbxYlJl/KJCnDEWGWMYrOrcL/eOIV5+BxMqOhq1tqwSfQHDeI2GSxxD1zP2J+OhpItrjjewLAiCoTRiNyJSofqdD+lxB9/jhlm5OpLzVusLhH2Xw8QRtjgSNa7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sn+yLEwg; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sn+yLEwg"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8726acc5eadso22306387b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784158; x=1789388958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=Sn+yLEwgWmdhSx7HuDYyyh3JG3XfyR3YL5z76XD0N7mow0r2y+FxosGcND0dRQcQnC
         MIUKVA+JXIOH5qMlhHRP4jXZr2bjIgo9Dy7TWUABo1KOmn9T8UkQ5O3qURvbjW3rFutJ
         loMZEZ6uZGU5lJfQrDkcuqw4PJ8G0arDg4QokLCX2DC2SYfDABCIw45EnvSU027swpAP
         Lvxt5SaIPqMd8xF/dfVrP2LioUJfACguN0PJRSmIOfTl7eA2Zp58l/lhS+WhYS4oWPNv
         QA3bU279XXckipIQIfMZwQwH2nW1kgWB5NPvk+460KuLfelYoIJi2swDJ4HIPOwiy/so
         oIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784158; x=1789388958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=Stop8VfZ01nbj4wMntt+g94kEAERPiPUKICsadLuh+VSStXzs4Zwxnnr8d8m2gQpo/
         kvrgyDLaRiWb31j9kMnQxxmzCu0smJid69m75+D+kDXwdSODX92Jum1uMq2wMij/6pMS
         OJLg3DXzxR7/NGVV9tUgiNw969gYOQnxJgd98Y6D851+UhpB7D4b87QALoEqjGwmYs8I
         /UAmnlRw95RSJZAtl9cC1WIFR0bzMyNiR7fp+z3onbhC/3ioHp/AoC/vPfY8nrPYbcPD
         CeWrbDebu6OnDWoAWrj8w3IW92aT7IvSgVTVUqsPaM+eWcM63P4kzzrXbpHdl9UbS5HW
         v9xA==
X-Forwarded-Encrypted: i=1; AKwUvBzoESJ8eHIEg79oKR72lp1ZIho6JdNpGNmLRGyY5hzToCuNKJ6wExnC2210xhPQvNSnGW6xQ9oGRyf71HA=@vger.kernel.org
X-Gm-Message-State: AFuF++lVX6yg498O5lSn2WodLo5T+k/7V4S5WYKIp9TBTfPxnBqnOcNE
	HAtNEL6F27a5q/UZu6PbIwExPE/J2UIYSYocFB/zidtfd1je7Q+8NzrS1X5dYfM=
X-Gm-Gg: AYBFou3eE2196NCfE465N09N3UIIBcRKb3D3rAtFbsJPWSmg4cfvWrmGzELUP9WMRwu
	SDJyTpuIH9w5f4lbrIv8p0JzbsNmNoS6YiWkvaN7rBm/15kKGyengxRCxVM7/f3013cHC3iMR5a
	sn48CyHTJmLvHfE2eWAC0yi9sFlv2E9ta+fgTpT0VSi6A4Ej+Bm9gwngXrknB8ut0oYEz9J+rR9
	1mzX6CrnGDYxUkSAyuTyhOO8fmmTTv3RH561muC2R79hFGuPlbIAeUg0LA0t+77xrazib9tloEe
	tgixbcbth3qWXPS0k+uif/Ktn5Lz4Fn6WyEauPOTnXZgLZspiVPiZLKbiw996IM95fkFu6lH9Wz
	cYOafAUQEk7BP/aqCg5XPt0wyYfy0AgzNPnBTP7BlJD1hMmrimJGKI8t/NVoWgHYlcZ3xFWWh2A
	XAdCa6/kmxidtZNQXNmTLMR7pkoJtbs0Vlv1mnJSl8k2h+Bh2zVq/hXGqTWNvbB73xyMk/Ofzqc
	d9uQu8Bo1Rk+3/4/5Gh2Sfxo441sapwRDViCQ4=
X-Received: by 2002:a05:690c:e18c:10b0:858:6dab:206f with SMTP id 00721157ae682-87124c827c4mr65766617b3.5.1788784157765;
        Mon, 07 Sep 2026 05:29:17 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:16 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Mon,  7 Sep 2026 09:23:29 -0300
Message-ID: <b961c25f0b67968b6ef891f2dd3527508a374261.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788711082.git.nico.antinori.7@gmail.com>
References: <cover.1788711082.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Notes:
- Patch series based on 7.3-rc1
- Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since this
  patch did not change.

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 73acf72c01f6..16a4a7a158ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -331,6 +331,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology, Ltd.
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
--
2.47.3

