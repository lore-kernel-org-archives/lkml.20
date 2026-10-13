Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208E4F055E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892626; cv=none; b=Eh7LRUNqkJ5LEyGm6Ot3PLSHgghQh3timN8B5An/ADxjTAdnr2xoBRacwajipTwrWVDPtc8arXEyD95SssetzNRNObC2+L5Cmsxf2bFnyi/bqtN3029qaRLEsC4iRfm07k2jaqFFP6Nej+LmW8rvKnTH2TDbNvA5kcvbNx5Rvac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892626; c=relaxed/simple;
	bh=X5ZU7JNnypfrB8yv3CiSgtsjeTv0kMCAa5OOfmHUqfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Biwa3c2A1mSIb3Vja5no2NtLO0u2p3zQVWIPRK4MC1Vna6MggD8qHhaD5og963SpGQm9+ucNaQVtW1Pjfc5kkWgHFypGvsEY94JrKDPuRBcVtzNtIosz37tbkBnuhTk/zS9MSFzVuZcCTdmhi3DIm5hKqLpjgKAN2CAC3/6pNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYKfOAWy; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYKfOAWy"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so259801c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892623; x=1792497423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kunHk2WNZFU02yT2wiYv/FHONgL2+rn9vP7+0p544w=;
        b=fYKfOAWyyndwCTkjHI1Rh7MDthkgkkZCFkETE6GE0C8FfLwwcI3q034NJO0tst2DnY
         e2uyywnpH6R2/+EcH0kDCgo8QRHGAJNHzUeGyodK3d82HjzRQPfWN/qjpscJGDpIDO97
         kjpasT7l+FtMqD0hUuOB/axfDcVbpNv8ZQEImJRFHKP3OADxXdnMcMDCOv9dD+5DdoqV
         TS+SPbZGR1PajpIDPn8hII8nOwk6cVIR7mct8fHzmV2C/r3Aj9n7NEDvYijdOy/eMDat
         EZWrFdfBGm8vPXAst5YOlOv5fuiaumc0BeKo5ZAVnGOFjdwslKr6e1pqXqwXmVigShZb
         pzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892623; x=1792497423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4kunHk2WNZFU02yT2wiYv/FHONgL2+rn9vP7+0p544w=;
        b=fNaSiQGJrlFwqpreI3PAL0uOKHNulTIAk0zbMP705SvtiJYe9nZFyFUuC/HIe+Lmwe
         rp+WAwJXUyttiJAZihfcu8E3JOXjCsQxKs4pbkmUkBZGrlm6LYF6F0RTXR/bH7Iy40Iy
         7B8nqXOAV7c/qtLMiL6mIiB/494y6FbEVsW74fPxAuK2VC23iTnzKUshHVoylIKotxsd
         sRTRNtKpD7uM3csTNsfVYeYlUD6pdfqHE4ya8jbrwsBDbNdovh2bbjnjpWtvt1tuCdix
         0dCfKUKxkN4K2pfbsUytLBkx2079M39qBUv2RygsAf4SMAC3QGdB2uGeWdrrmZRWlRjo
         R9Ug==
X-Forwarded-Encrypted: i=1; AKwUvBy8nXcqLYZJq+tquF9GGFx8x/B3dfIsMXt5PKzvbmY4+tcmuiwndZSN2GpdOlGKygEmNXkEck91B7oNXvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHNE60rF+dFsJzWuNl3Gdrj/gUj1ZI9pNCrMM/qOcae5hjI6Xd
	/D71Agx2IYtwuvCsLEPs6eUc2bFpOSUKHaxbP7nQ1FtbbMeVHTJPrZ+F
X-Gm-Gg: AYBFou042nfjIX/sBvBecgOdTvNGLuWayhUxVN/EpbBOssH6Z09hjewYGNTwYSfWqBZ
	Xi+yMsnoWjILYXhMJynXdesh5bN/8qWyGfgzAQ6JEbeWJwcabArYQN6Q6myI4aEhubc8dlZoEsT
	0MkFSjlbBM3v7i9orM1fm+H+cksdarZgcu7BqYxG3RON4MFKuW+JeoJplHSC1BGaSFMUhJP6EBP
	qHiRbZEMd0J+JV6DkjbvnUOa8oZYPQ/D+dJRBOc1lD+ExeLiz5pYOLQamMzZBKCW//RzMNwADan
	arqpA0Vwar3QO9LHl/Qaju8R0YJKfffYs96oqzCLvvV/lJsMjQN7DqyfLs8KZG9RN9OIMkchU/X
	qkz8DsO67xeyBDlGmj+fOAEJ6+eGLLl/yfu3AoKO/bfp7kFB0hb11t6vfzUqlh46vJ7JLLHUNKh
	upqGXs+Zz4xIAMAP8DauMmJyoiWIQZLHSlDOh/AACu/wNhpItn2LAJkF10IUFN96r6EKkkN5uX
X-Received: by 2002:a05:701b:205c:10b0:149:49c:233 with SMTP id a92af1059eb24-16a60811394mr17959201c88.27.1791892623397;
        Tue, 13 Oct 2026 04:57:03 -0700 (PDT)
Received: from localhost ([104.156.230.40])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3595e0858c6sm30250575eec.22.2026.10.13.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:02 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: iio: light: add as7343
Date: Tue, 13 Oct 2026 19:56:38 +0800
Message-ID: <20261013115639.167433-2-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013115639.167433-1-marcus.yu.56@gmail.com>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
with i2c address of 0x39.

The GPIO pin is not described because the datasheet does not document
how to use it for hardware synchronization at all. The GPIO register
also has no mode-select bit to isolate the pin from the chip's
internal control logic. Exposing it as a generic GPIO could result
in kernel writes being overwritten by internal logic.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v6:
 - Add a ref to leds/common.yaml for the LDR pin.

Changes in v5:
 - Remove the GPIO pin.

Changes in v4:
 - Fix led-max-microamp property name.

Changes in v3:
 - Add missing include for gpio.
 - Expand GPIO descrption to include hardware synchronization.
 - Use led-max-microamp instead of led-current-microamp for the LDR pin.

Changes in v2:
 - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
 - Fix node name and unit address mismatch.
 - Include MAINTAINERS changes.

 .../bindings/iio/light/ams,as7343.yaml        | 66 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
new file mode 100644
index 000000000000..7fb10b0d4843
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/ams,as7343.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS AS7343 14-Channel Multi-Spectral Sensor
+
+maintainers:
+  - Chang Yu <marcus.yu.56@gmail.com>
+
+description: |
+  The AMS AS7343 is a 14-channel multi-spectral sensor with i2c address of 0x39.
+  https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
+
+properties:
+  compatible:
+    enum:
+      - ams,as7343
+
+  reg:
+    description:
+      I2C address of the device (0x39).
+    maxItems: 1
+
+  interrupts:
+    description:
+      Open drain output active low interrupt pin.
+    maxItems: 1
+
+  vdd-supply: true
+
+  led-max-microamp:
+    description:
+      The driver current for the external LED connected to the LDR pin.
+    minimum: 4000
+    maximum: 258000
+    multipleOf: 2000
+    default: 12000
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        multispectral-sensor@39 {
+            compatible = "ams,as7343";
+            reg = <0x39>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&vdd_regulator>;
+            led-max-microamp = <14000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 04fa5322d9f7..8cf4e1635053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1430,6 +1430,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS AS7343 DRIVER
+M:	Chang Yu <marcus.yu.56@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.56.0

