Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A48539E9C8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296492; cv=none; b=WOY8tAXLCcNjlau9GoOb0MbU4ncYFx9x+7GPQ1v3nbTorfxxTmj/kC8Kwqcso20huoUy0EtRl9m1CnEwwnxCVUWfudvmtpf1+gN3+qBVXbsfdAXFFXNWUY1BtQsRsMcPqFkwrrWGfa3MxByKmcYvhM19Re8GcjD6UXxKyY+RygM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296492; c=relaxed/simple;
	bh=F12YGNngU8++lSPfjWLoCmx2bsw4chooVhiqlq6aSkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Si2WcLBYJPFW4IG4epB3lil9PBL/hbPU7/h2KbVcvUos7XPV04E4vD3NkDkSB0lGg6+dWTSU/xy216FKnmXONh0m4BNzv2kej761WYq+iuQLOFNaxVK2hdNDzj+ttV2Il5zcY0gZMfgTo5j1z+ZK6SsbPGd9nSgr2HILKJxIV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0P6u/Ej; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0P6u/Ej"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso2221889e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789296488; x=1789901288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdPThSAhbTSR0ZmBcNyrmtWAhkiVdoKg+0FqMkNRyls=;
        b=e0P6u/Ejge7erZ1VMh8TQhBxYVCGQECLbSgSdtderJ5O220QcWkJ3TVOxWeq33IbBX
         1DyGohuafSxWDXO88S80XrQXT5k1tEbKgIGQlp9dYzTMmZ3HROyPrIIajDiHy05EDK1O
         OAmRHZZph82DpbC5NA4Go1DhKg2gBnPq4lA8HxcdfSbzF/LJWz3WLpeGMYKySyCTaMUH
         m4Czd5sDAKL8w/1XOizcHZXfflGpwXRNvZNSW8fNfX1YHqBm4pQNP3L9jJvTopcb+DLL
         qToLBfhgqrXugDXidiILz5qtFWw5ydY32GLOfONbDos8qALSIwaO0ip2+xmOtMxPCOdh
         5Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789296488; x=1789901288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdPThSAhbTSR0ZmBcNyrmtWAhkiVdoKg+0FqMkNRyls=;
        b=lewYC7OaM+QCEgO5E8M9r2mXbAny6CAvb4JCX6KBEGQUoMYpyt0nBn44/oXhycI4S2
         3twcF9aw7m2aSSt0T/gmjD2OUT2/59oK3GMMX08qZpgXwWvz2FPrGQl/wHyJc3HTVrWt
         KugoQUnkRmktO9STMPvax7jCUzds3TjD+IMCfUcF576AK8FLzlPMzfSqx2nXVCu6yJOR
         +aOZiczgckmKrdHQ4RSTgTux/xKO2Ios6HqxdfzkPTrkRbUqrx1tadlHUOmmAV66muxo
         hYdJEnclaf6jlL+k7dWzMyR+MflWuHTQ0HaAI5gllSM6IyaNQniAbwThUxZVIoKyW462
         AQbA==
X-Forwarded-Encrypted: i=1; AKwUvBzhUVg7YN6sA6nJPP8o52gZw26D1cDvOLgAllF5m4NdhxT59tEodf4RNU32Zgfams3S74xo0ICeiVoHSEM=@vger.kernel.org
X-Gm-Message-State: AFuF++nIn2qDFKqRrRcKO57IDtKQoW36T4sTGUW+8Rz3DBhSUen0Awym
	B7uluPrSM6kQysYgmuRmrY3aLl5831c4V+vCQaDW3QfzqCYfKJkxzNz8
X-Gm-Gg: AYBFou1j6F7+yLUMmzsgd/CAdzQqzvXwu3LXrUo37mYJvx5A1VXWgUrt33W6okimR8J
	xJgJ99l+eWcB17ELFEU98R0BnGN04Gxrxxt7pDOU5fYpg2Ppi2aVaog+bPExav9x11j2qEExinB
	x9R455CUBT776Au6zWsoi5B2c7jf9yde09eqh+glpOEZXvjoVMM5HeAVzE54WvJxGstofEG56H4
	vb1WAbvM30bLVPxfaSJH35y2XLFruJcssYt4DCvj2k0BOgGp7rSZd3/nTg7CCmiEQAUiXYukbSG
	6+eduzqXYSSVN0r1NLb0Z+tE/uscsgCggEBpWs8VszjJbofQcvdiPvlgUhpOVZvdPy6lFyCZclz
	uEGqLJIDeI58oB96P6ikpoxmEJFLIuHaBW3qqcWly7zQuznrl7zrQuQsky9yCItWsddN+IRswne
	O1ag9u6GRF2nuUsVH5thBeGaUS5qkCASp2bmx9kifnQ4bAoI7EDwyzMITEeBl7XAov/ZLynOPpG
	F4yYRMfg/JGB3j2ZRrbnunVNcPZDyEQHkp0cn0g2malEGzkWQg3JnRcjTr3yfu2Dp5sq9pWvOIZ
	dvWp7ZAjSTbMPYsIFvA=
X-Received: by 2002:a05:6512:130b:b0:5b4:c00d:23f3 with SMTP id 2adb3069b0e04-5b8a02de3aamr2372765e87.14.1789296488236;
        Sun, 13 Sep 2026 03:48:08 -0700 (PDT)
Received: from Shofiq.home (87-92-212-6.rev.dnainternet.fi. [87.92.212.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04600a2sm1689154e87.36.2026.09.13.03.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:48:07 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@intel.com,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v11 1/2] dt-bindings: iio: health: add adi,max86150
Date: Sun, 13 Sep 2026 13:46:55 +0300
Message-ID: <20260913104658.230422-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913104658.230422-1-shofiqtest@gmail.com>
References: <20260913104658.230422-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree binding schema for the Analog Devices MAX86150
integrated biosensor, which combines two photoplethysmography (PPG)
channels (Red LED and IR LED) and one electrocardiogram (ECG) channel
in a single I2C device.

The device requires four independent supply rails per the datasheet
power tree: digital core (vdd), analog core (avdd), ECG reference
(vref), and LED anode (leds).

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 .../bindings/iio/health/adi,max86150.yaml     | 77 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml

diff --git a/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
new file mode 100644
index 000000000000..8392d08edd1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/health/adi,max86150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX86150 ECG and PPG Biosensor
+
+maintainers:
+  - Md Shofiqul Islam <shofiqtest@gmail.com>
+
+description: |
+  The MAX86150 is an integrated biosensor SoC that combines:
+    - Two PPG (photoplethysmography) channels: Red LED and IR LED,
+      for heart rate and blood-oxygen saturation (SpO2) measurement.
+    - One ECG (electrocardiogram) channel for biopotential recording.
+
+  The device communicates over I2C at up to 400 kHz.
+
+  Datasheet:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX86150.pdf
+
+properties:
+  compatible:
+    const: adi,max86150
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Active-low interrupt line, asserted when the 32-entry hardware
+      FIFO reaches its configurable almost-full threshold, or when a
+      new PPG sample is ready.
+
+  vdd-supply:
+    description: Digital core power supply (1.8 V).
+
+  avdd-supply:
+    description: Analog core power supply (1.8 V).
+
+  vref-supply:
+    description: ECG reference voltage supply.
+
+  leds-supply:
+    description: LED anode supply, typically 3.3 V.
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - vref-supply
+  - leds-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        heart-rate@5e {
+            compatible = "adi,max86150";
+            reg = <0x5e>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&vdd_1v8>;
+            avdd-supply = <&vdd_1v8>;
+            vref-supply = <&vdd_1v8>;
+            leds-supply = <&vdd_3v3>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3115538ce829..189385966de8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15705,6 +15705,12 @@ S:	Orphan
 F:	Documentation/hwmon/max6650.rst
 F:	drivers/hwmon/max6650.c
 
+MAX86150 ECG AND PPG BIOSENSOR DRIVER
+M:	Md Shofiqul Islam <shofiqtest@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
+
 MAX9286 QUAD GMSL DESERIALIZER DRIVER
 M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
-- 
2.55.0

