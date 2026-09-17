Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C024F4025
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677854; cv=none; b=PeIWSS/asfiVBiAyoCYg6llx7eIi0AyLYGFZCy9AoeeggRdUPnDiRT0O7sPoi6ocYuiFlEzdgRRDZCZ6L3wsGqLbQ7of3Ll15rZey4+f/mikwJl3ebTtWV0VvMqJZ4UOj5FfrqMckjDggCpOoaZCjnPfj4pFMX4WR87WFvCzVLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677854; c=relaxed/simple;
	bh=7n3EKdPTyeJ3fng5n2NU2Jsl5vOG5evW8rwiIQjnCNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jm2mQkap65DAJF7TQDp1T2UVX/qjAqwBl/Wlv8tKq/xu8dpW7e8rbrvmPjkt9wiYO2HTw4MLdfMs3Kway2jQgr7pho2O//heKIIeOvBJbhbvDxQ2r+hVfF4mpcxPapn1VEhJUWedoIocMpYnmXnDjD4gNk9nzZ0iCaUdYfmSA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqsecCjF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqsecCjF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so364455e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677843; x=1790282643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+azRImqFeLmJHvmrcTLLoRlF37aB5bzWoKnNKv00IsU=;
        b=SqsecCjFYdzat9lXBaSRN/dnAvBIjPWnCPaZJViG9/0Lkrm28KsJgDfT4mTwTKd9hZ
         a8fENg3OLgivOZgJ9y7YenF7SGVqQHBXiCKjwjlSZugWdobEvgcnWd73vhT2dUeKnte3
         0Z3sByn+zZqN1ure9VtMPAjd2IbXfLw8drLw/Yb/ma7atOU6mOXmtvvZW5JxJJ3Pf87A
         6rNHTz+G/o9V7Ixfw6sEHlo+gSYF2YSQs5Vb2lmf8Y16vBgIc7Z+2FODo/2nmt4rz6qH
         cVwJgWHR/jsNDBkHh1UFGMB7D/aX1KA5DFDv2XESdoTPaWjNwJU6+FOaqdvgcfIZTOWj
         EeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677843; x=1790282643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+azRImqFeLmJHvmrcTLLoRlF37aB5bzWoKnNKv00IsU=;
        b=fmotQPvDCVFHaM/qPZ+7lf+k7OuMN1nEPBPVKbSAeKDDo3/BmAc35ZgWTUYJsZKP/u
         9+bMU1M53y4IqkRJ5RIaxP1NtIBj3vYEuAyf54gvvqt1c7VASwwAZgxvSuAFC67gc3sQ
         OrsWgHaq6pRjqBJfPZKRrc0N1NaAZafY8n7t+B1DepZB3pLkT6lrHUdKv0uK56xG2xbb
         KmO163oO3VRFPo5Snx5EvxwPxsv8oijZG+5aL4CwM9lXOLSogJQNcVqhkDxWE3Ui1Uig
         LQoJqb5opsqzNhX3q82t0wC5Zn+oPHQNkr9gT+5hriqCy2SJR6ZE67aoDY3s9AVR2n9N
         CpwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqJfdQMEdyfabPY1AiddidpOG5+Qrs1WpBOaQJ0FfdjOkuwU7FODdMeoC7WSs2/V8MG4sZcGJAD12qzXY=@vger.kernel.org
X-Gm-Message-State: AFuF++m0OILVtjkVNDMYgVlDcDpSRXlPrKexQvWfBj4FYUtTrh317CmB
	1afOzvx77oTfMD8i09dOBrdmS6KDDOf/5w6uuv1fpXcRhOI5zxJiLfHo
X-Gm-Gg: AYBFou0sYPMkn/61RqpLYjBpEHHAhRogx86iMNoE4HxqEHMjJ9kQE+VcKAgg1IcoUIM
	UoF+8FEErfR5c3ApKtwuWo910gYYyzXtXFNfxFdYh4PiAdPt4aBaAvUJjW3kwT72FyjZ+08bzcQ
	t8XmBB7W2SwYj+G2HCDGyU+7QGbIjg+r1CzqeJQmqnXIuREd6wqQGD++PmpDDtg1lUnLUMkOu5V
	MJIWlS3Jjql3Z//iH7xxkngM8a38Kjqx8AvGoFnGOnPqO63ryUY/bggvQNwoFW2w2ogBw+Be0A2
	j+7dFe7g92Z1Bfu2htq/qkQ4MNqDrYLRnK0fDBJiV04owS+yRf4GKkorPsw8m696WTualhzODgZ
	xQIG9XNEBePGKh+vlSUtlObeASiC0/LNTwCMDlvSrg81E34gabz4LtdaiUbuufkOJYoCk99cynO
	vC2RTNDqOZxa4Z5hoSVenSac0QQ8kfxsB3TmTAlW9c8x/iv2GvHD8WT9WzlJwbQfD0Womip0cNu
	3e9FM1MBNbndOWVPO7RhtdOcdmzTItPbuvXl0QxL1+JbWoIWQ==
X-Received: by 2002:a05:600c:4f09:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49fc56692c6mr1407605e9.2.1789677843097;
        Thu, 17 Sep 2026 13:44:03 -0700 (PDT)
Received: from localhost.localdomain ([82.77.79.112])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm122333395e9.2.2026.09.17.13.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:44:02 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: net: wireless: Convert WL1251 to DT schema
Date: Thu, 17 Sep 2026 20:43:54 +0000
Message-ID: <20260917204354.3017427-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments WL1251 Wireless LAN Controller bindings to DT
schema.

During the conversion, the following updates were made:
- Added the 'clocks' property. It was missing from the txt binding but
  is used in device trees (omap3-n900.dts).
- Added 'spi-cpol' and 'spi-cpha'. These were present in the original
  txt binding's example but missing from its property list.
- 'vio-supply' and 'spi-max-frequency' are no longer required. The txt
  binding listed them as required, but they are only applicable when
  the chip is connected via SPI.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Rename the example WLAN node from wl1251@0 to the generic node name
  wifi@0, as requested in review.

Link to v2: https://lore.kernel.org/all/20260905201108.415713-1-egbostina@gmail.com/
Link to v1: https://lore.kernel.org/all/20260815083326.2146602-1-egbostina@gmail.com/

 .../bindings/net/wireless/ti,wl1251.txt       | 64 --------------
 .../bindings/net/wireless/ti,wl1251.yaml      | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
deleted file mode 100644
index 88fd28d15eac..000000000000
--- a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* Texas Instruments wl1251 wireless lan controller
-
-The wl1251 chip can be connected via SPI or via SDIO. This
-document describes the binding for the SPI connected chip.
-
-Required properties:
-- compatible :        Should be "ti,wl1251"
-- reg :               Chip select address of device
-- spi-max-frequency : Maximum SPI clocking speed of device in Hz
-- interrupts :        Should contain interrupt line
-- vio-supply :        phandle to regulator providing VIO
-
-Optional properties:
-- ti,wl1251-has-eeprom : boolean, the wl1251 has an eeprom connected, which
-                         provides configuration data (calibration, MAC, ...)
-- ti,power-gpio :	 GPIO connected to chip's PMEN pin if operated in
-			 SPI mode
-- Please consult Documentation/devicetree/bindings/spi/spi-bus.txt
-  for optional SPI connection related properties,
-
-Examples:
-
-&spi1 {
-	wl1251@0 {
-		compatible = "ti,wl1251";
-
-		reg = <0>;
-		spi-max-frequency = <48000000>;
-		spi-cpol;
-		spi-cpha;
-
-		interrupt-parent = <&gpio2>;
-		interrupts = <10 IRQ_TYPE_NONE>; /* gpio line 42 */
-
-		vio-supply = <&vio>;
-		ti,power-gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>; /* 87 */
-	};
-};
-
-&mmc3 {
-	vmmc-supply = <&wlan_en>;
-
-	bus-width = <4>;
-	non-removable;
-	ti,non-removable;
-	cap-power-off-card;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc3_pins>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	wlan: wifi@1 {
-		compatible = "ti,wl1251";
-
-		reg = <1>;
-
-		interrupt-parent = <&gpio1>;
-		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;	/* GPIO_21 */
-
-		ti,wl1251-has-eeprom;
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml
new file mode 100644
index 000000000000..6ce82c4a2c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/ti,wl1251.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments WL1251 Wireless LAN Controller
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,wl1251
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vio-supply:
+    description:
+      Phandle to the regulator providing VIO. Required when connected via SPI.
+
+  ti,power-gpio:
+    maxItems: 1
+    description:
+      GPIO connected to chip's PMEN pin if operated in SPI mode.
+
+  ti,wl1251-has-eeprom:
+    type: boolean
+    description:
+      The wl1251 has an EEPROM connected, which provides configuration
+      data (calibration, MAC, ...).
+
+  clocks:
+    maxItems: 1
+
+  spi-max-frequency: true
+  spi-cpol: true
+  spi-cpha: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        wifi@0 {
+            compatible = "ti,wl1251";
+            reg = <0>;
+            spi-max-frequency = <48000000>;
+            spi-cpol;
+            spi-cpha;
+            interrupt-parent = <&gpio2>;
+            interrupts = <10 IRQ_TYPE_NONE>;
+            vio-supply = <&vio>;
+            ti,power-gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        wifi@1 {
+            compatible = "ti,wl1251";
+            reg = <1>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+            ti,wl1251-has-eeprom;
+        };
+    };
-- 
2.43.0

