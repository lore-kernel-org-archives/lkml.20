Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76663CBE79
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022309; cv=none; b=rnPwcfqqLjv4lnHqa7/ZcPFBP24SGsyf5HQ8RxUcq5kIYarT6ZlGBwExxsAUHpa5zKsYWPE458PQbP9Y27HG6Nz8UiIOGRrQpkNCAoROFerX5YyZwzKxWLw5rMysogk9jJZ1b8OaPei0nLA7gH/kPpIhpNHGY7q+C5hnMMEPSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022309; c=relaxed/simple;
	bh=i5nr9zlL7n42aeFEwV94X9Ky6UzQbINjUj5sTjC4cII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVsbG/k1IVWcn3MENwn49dnOp/1SAaMqvVj9oDDPVFzdJycVVSjf7pQdwrLdf17jfwyGR/b6O3msMuPdjGvz+ZjTFcLtTxGgw+zA8gu6EuEHxqD7Eb1dURunKkFCFN91jgloqdyW4iv1+1Hl+WxsQ+y1REAzTEoApIf0a4AESj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hec/4zfi; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hec/4zfi"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-857ff9fef54so65952347b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022307; x=1789627107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa7WS57WkiG8wdPJazdCMEUZZmALuhoGF9iK21huDkw=;
        b=Hec/4zfi6cl9bABDzFxv8hVQUZvTXKzc3rnVt23NBUG8TVs8O4Guy0gxzTBerBYqkO
         L1WLKe3zO6kGfsOU5KzpgTUVmc7dSE9nAR/Wpj0YKTxtK3nq102iBrpQ69Cke6D1PozK
         R3Evu3J0uRMor/XDR23JBabt6rNSmNB9Ciy2FE8tE5NIKJpz5I2FZ6fLDPhmm7JGbmqD
         7kcKbEHL6IwQ9wTMqidpIfDoiV4Rx0LFDZPA3zM4wAkgrZCElmdVl2q8wRLwUm6DWmwy
         oJ9yGdDDrj2fhaCU4VRih7E/QC+yRwrTidqF/BcST4SRGldnFMhoWnV3EKVWbltjxzJb
         ud9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022307; x=1789627107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa7WS57WkiG8wdPJazdCMEUZZmALuhoGF9iK21huDkw=;
        b=BSR42J2VOaYlYXSTyQQDK5ilXCDMgnKeeWf0y1rgqIsyYnF/f6eAfhM6uXHp5WCHIH
         xOR+yJ1Ae9/kxaKDxvpKLmprz+FS7e2A4pr5Rd7d3j9Yoe3PSqMfkpDxkTh5RF4eEicD
         aVYaYUe0nDOFmAjAyAG24vkJEUY0Y0uqqQxepqUsJxqnWAaGfMn7ifdQ+OvcsA9Yp1ry
         CixeUplueA+ZC9Tst35xuzJ+nIbm3aPw55j3C9EN9/NZk1P//0+Gss/As6X6A9CDw9w8
         CZLGSmkpzskYsJy1MbJH3xGonxcoGl1xDMPVrZy4HU2GJaEUrDJ4XNSwgoRLpzwnku9M
         I3dg==
X-Forwarded-Encrypted: i=1; AKwUvBzMHoIplOn8ZDgk/vXIXLny78iB/U5CWJqZAeE51/Ts0yDTYBvhPsT4/Ct0TH3a8ELF12oQcLtIYnDYXoY=@vger.kernel.org
X-Gm-Message-State: AFuF++ljN7qPcSKmvgDiEMC9oWhIvghQ6yObjOkntZlm1crQAmXR64dI
	2NgdKXXv4cmznx5aqFiGlCmTf9TeoaCWA0ErXGftO9gEsrmXvygOzGI2
X-Gm-Gg: AYBFou01CwuKIwtYRCtgHW53I8uIO2v6B6yXZ97/MhHeNsccYsGrhzWG3FGm7XRWFGF
	UxFHa8rPKWNbERqPCovCHZpPt3K4Ks9ffHEycYTCnYkrclPxqPr7x2yRcjIO+lfxk5wIh4o1Acd
	6BCol8YIA+gL4sRGO0JWmSjM6S57CQE+no9DgwqJZ4dY2/1lU6Mrs84GKiNZetYfgcZjyGxh2P4
	q7hlXUBqHEsGE/S5HXnX5PolymIf/rK3Bi9j9Q3mTOU940llwUVVAqG3LZWRPo28oVyd1LHHa01
	MfC9lPp0pY7/dDkI5qXYZDhSsbXAAwSE2XnHoYaukY8tUsyB5DiwYqkF3lIHVRGhMNTS/JI6BAx
	Jq3Q2+y70q05hfVz/D5Fc0Jz/d8c88gqaULIgdYoC+QprSxpKVXrqvLcCrmwxb69BXN7neyAOdk
	IcoO7HXOjZByBbZmleMXHU5ZGoXzaVaSqrzyoOkoKFvaHm6fKkANehqFS7H8hazRHl
X-Received: by 2002:a05:690c:7685:b0:873:5bb2:6c09 with SMTP id 00721157ae682-8735bb26f9cmr92220467b3.51.1789022306735;
        Wed, 09 Sep 2026 23:38:26 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714af5581bsm119455507b3.36.2026.09.09.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:24 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: light: add as7343
Date: Wed,  9 Sep 2026 23:38:12 -0700
Message-ID: <20260910063813.56419-2-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063813.56419-1-marcus.yu.56@gmail.com>
References: <20260910063813.56419-1-marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
with i2c address of 0x39.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v3:
 - Add missing include for gpio.
 - Expand GPIO descrption to include hardware synchronization.
 - Use led-max-microamp instead of led-current-microamp for the LDR pin.

Changes in v2:
 - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
 - Fix node name and unit address mismatch.
 - Include MAINTAINERS changes.

 .../bindings/iio/light/ams,as7343.yaml        | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
new file mode 100644
index 000000000000..6b8a05be0043
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
@@ -0,0 +1,72 @@
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
+  ams,led-max-microamp:
+    description:
+      The driver current for the external LED connected to the LDR pin.
+    minimum: 4000
+    maximum: 258000
+    multipleOf: 2000
+    default: 12000
+
+  sync-gpios:
+    description: |
+      Optional GPIO pin that can be used either as a synchronization input to
+      start/stop measurement or as an external start/stop signal for
+      synchronizing with the connected LED.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
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
+            ams,led-max-microamp = <14000>;
+            sync-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
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
2.55.0

