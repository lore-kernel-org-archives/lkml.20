Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CC2DCBFA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999347; cv=none; b=giYv8mVqOkZlVjSxeooT6URW9ytxwrbuiy2Oj1FXeqPa+Fb9YLPKYraIaOwbFLCNkvhgOKzudXBjPFicj5ZdA23p9nD288Ekqlensiv+l18E9JVuWOWPOtNNooBNP/La6szsMNnum+/O26/n9JTJr8HY4sktVZCYOLAiytKohU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999347; c=relaxed/simple;
	bh=xLPiA0DBmtmDhP4JFN6i0AdhaVLCSoeCypLXVz9mbq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qt5ROWJ7VXJjKMMo+2TLTC0HqS+dWgKE+SFdpXOyNVsxXGmU0XQn6YvW+xBFq6qcZbuDm0r13f1r114SIw8q9MgxPFvQLaavJaAXstvncYzfMi5otQbbl5WtU7L6Z6o/wKz1KkmZKS+qOsLVTBvK78pBa/uuMwdinfuLEdmJ8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdyCsRjS; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdyCsRjS"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f4e729368fso5825703a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999344; x=1789604144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHq53JNthhgN14GwB6JcJHW5rTqBpPDjiEjix8XiDJU=;
        b=HdyCsRjS7f+Pefnlxqq8fACHYBSruRE/XfiUqm2+gf074p/Cyi7iGrCu8jwBE5mRvm
         Kmkl3o1D9zll3TxFlyQKraqoA8FW0nvRhNkfqmQKBm0S+MSkImdVQgCr/spX1xBbKfT5
         k1lIiHbuFawj92zAtAQ1bVKZHnd2gHHLBqqyFqq1lbGqZB1bJ71/XnyGvoiHJTWdBfnx
         3eEyHakkMVQJ3as65qgq3cZeVM19rmTSYI0XFt79o5ClvuIs6drwzBlIrFExiVLPfeI6
         MwyGVmEHYVjJHr98a51BTKddPqGgjkj2lf5WVfARLDPYOO5aiaSBJHruqfoFNsiL44iX
         MiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999344; x=1789604144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHq53JNthhgN14GwB6JcJHW5rTqBpPDjiEjix8XiDJU=;
        b=E0I4hMn+zJisFp2MZnM/mEWAXNRg+VERoNJb1fTYJYQg20y52mylLDVk3LLFE2mf/n
         vW2e6GHipdHk9hjgzQ2Dtmy+Rk91NQNh0zE1xEuALmKVJwXoWuWJV6f784QtVBEFD3nm
         ajnPrnoOXERGxwAn29iZRkU6SNM1rnTpmJCtO6ublCT3YBCxTvwab+ab2ey1sRcO4Mlc
         ZN31bI1Ug4uIygPXq6idR6b38LviBsQxryfeb7AdyPXQmRXsA+H3M9W0qDRi3Dh3FwD/
         TgLfWYoTw35pusflMUWUvQR9tTY3yAm2IBqCxCDMhPvIb9F6rlmZ3jfaQbI2+Rkve5pU
         rpyA==
X-Forwarded-Encrypted: i=1; AKwUvBwsX7829qIiOLxlb4WVCgduzG/JtrSlMieKt5edq821JzIoorNav8gwADSVWqaOFo8LqKQmvrnXWzX3Wu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nuwQH434y7nwaW3BbQIBjNnQZ/EX8PRbqcJjP2W91J9TAud45b
	rAfZUJpI7SMB2fOyVLc3x55uddWPz/v+JJPOMQNIKfOsJ9EVMYESukVB
X-Gm-Gg: AYBFou0Pnv1zzcXKAPfngcdAvnimsDY5VG8BOQzXEWE9zVnqw9o5s78kwbXxF8qFn9y
	JkvcnHLn0fFhr6E9jvSiIq6KjFGzh+CF8h+yb5Z9XNlYRNR7RGaTqg8flvmDY4h3V99dqnmKcKk
	sZtqaOmgr2GhN+QjnDK+X4m29g3ncUfyOBtI+H+JvQc5MPk02urXyBXta94ZyvnPySETOu9ONil
	rkTOZ6vzZhDVzukmeQWDQNQdhTKM/jTUaP8GfXn28lIw9gz/xYKIKXUzO5fJiwqyNzUO5RKroUI
	v3+ObbxXm48ZGTKtjrA/foIFXPth/xdC9Bws5yH0wyv5BvxDEQgHfElSvjUWj4aTPAN3kIzXlco
	vden/wZuImEg81JUAk5RFY2EIYy1DALFKO5QLt7g6Pho2QhRhWULoGWBqyZ64GAjxK0EWmPWj6V
	uUTmyctK+B0rFJzn48tjCARyKDMcDxt6KZwJE3v1pLO0zSv4Vc7C0Qra0OnW91D3u2OjjhvbtDK
	iO9HkQJyaWKaXPqi+5l69NxEt+zUMJQ7psSbYzjw6OSYRWrwbfKVegSt7xbYZZT8RmJYtlzFUoj
	tCgBRRH07kwavBdXg4PcGnzuSn3q6W+kfRhDCduDcbhRwXxa4sp/oLJVw4KCqazRV9m75aT4Y6V
	Exyr2gIddYiyZOQHokFTzNcnlxmeEfg==
X-Received: by 2002:a05:6830:348f:b0:7fa:ac4f:78e with SMTP id 46e09a7af769-7faac4f0e60mr20603797a34.26.1788999344089;
        Wed, 09 Sep 2026 17:15:44 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fc68d5ae2bsm12468402a34.3.2026.09.09.17.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:15:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 18:15:37 -0600
Subject: [PATCH net-next v11 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-acx00-of-dynamic-v1-v11-1-eb45e89ef918@gmail.com>
References: <20260909-submit-acx00-of-dynamic-v1-v11-0-eb45e89ef918@gmail.com>
In-Reply-To: <20260909-submit-acx00-of-dynamic-v1-v11-0-eb45e89ef918@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. Their package control paths differ: AC200 control registers are
accessed through the I2C register interface of the companion IC, while
the AC300 control range is at a second Clause 22 address fixed at 16 plus
the link address.

Describe both variants as Ethernet PHY packages. The package reg value is
the link PHY base address and the child supplies the documented PHY ID,
because the identification registers cannot be read until package setup
has completed. The AC300 driver reaches its control range with the PHY
package offset helpers. The AC200 package instead references the companion
IC described by the separately submitted x-powers,ac200 MFD binding. Its
I2C interface provides access to the package controls.

Give fixed hardware variant-specific compatibles. Also provide an ACx00
compatible for systems which can contain either package, with one packed
NVMEM field containing calibration in bits 3 through 0, the AC300 selector
in bit 8 and its low-calibration selector in bit 9. Such a description
contains the potential resources for both backends; the driver consumes
only those selected by the configuration field.

Document the little-endian encoding and two-byte full configuration,
while allowing a one-byte calibration value for fixed AC200 packages.

Describe the package clock, supply and optional xMII receive-clock
inversion needed by some integrations. A fixed AC200 package may omit the
NVMEM field and use its internal calibration copy. Limit both the package
and child link-PHY addresses in AC300-capable descriptions to 0 through 7
so the control address remains in the documented range 16 through 23.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..781695d9d9f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY packages
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 contain compatible Fast Ethernet PHY blocks which report
+  the same Clause 22 PHY ID and use the same link-side register layout. The
+  package control paths differ. AC200 package control registers are accessed
+  through the companion IC's I2C register interface, while AC300 control
+  registers occupy a second Clause 22 address fixed at 16 plus the link PHY
+  address.
+
+  Systems with a known package use the corresponding AC200 or AC300 compatible.
+  Systems which can contain either package use the ACx00 compatible and a
+  packed NVMEM configuration field to select the backend at runtime.
+
+  The link PHY cannot report its ID until the package control sequence has
+  completed, so its child node supplies the documented PHY ID. The package and
+  child use the same base address. The AC200 driver programs that address into
+  the package, while the AC300 driver derives its control address from it.
+
+properties:
+  compatible:
+    enum:
+      - x-powers,ac200-ephy-package
+      - x-powers,ac300-ephy-package
+      - x-powers,acx00-ephy-package
+
+  reg:
+    maximum: 31
+
+  clocks:
+    maxItems: 1
+    description: AC300 input clock, running at 24, 25, or 27 MHz
+
+  vcc-supply:
+    description:
+      3.3 V package supply. This is connected to EPHY_VCC on AC200 and VCC1
+      on AC300.
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Packed little-endian EPHY configuration value, with the least-significant
+      byte first. Bits 3 through 0 contain the analog calibration code, bits 7
+      through 4 are reserved, bit 8 selects AC300 when set and AC200 when clear,
+      and bit 9 requests the AC300 low-calibration tuning sequence. Bits 15
+      through 10 are reserved.
+
+      AC300 and selectable ACx00 packages require the full configuration
+      field, including bits 8 and 9 even when their values are zero, returned
+      as two bytes. A fixed AC200 package may provide a one-byte calibration
+      value or a two-byte configuration with bit 8 clear, or omit the cell
+      and use its internal eFuse calibration copy.
+
+  nvmem-cell-names:
+    const: configuration
+
+  x-powers,ac200:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the AC200 companion IC described by the x-powers,ac200 MFD
+      binding. Its I2C interface provides access to the package control
+      registers used to power and configure the Ethernet PHY.
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+patternProperties:
+  ^ethernet-phy@[a-f0-9]+$:
+    $ref: ethernet-phy.yaml#
+    properties:
+      compatible:
+        const: ethernet-phy-id0044.1400
+    required:
+      - compatible
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - vcc-supply
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+allOf:
+  - $ref: ethernet-phy-package.yaml#
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac200-ephy-package
+    then:
+      properties:
+        clocks: false
+      required:
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac300-ephy-package
+    then:
+      properties:
+        x-powers,ac200: false
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+  - if:
+      properties:
+        compatible:
+          const: x-powers,acx00-ephy-package
+    then:
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          enum:
+            - x-powers,ac300-ephy-package
+            - x-powers,acx00-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+      patternProperties:
+        ^ethernet-phy@[a-f0-9]+$:
+          properties:
+            reg:
+              maximum: 7
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            compatible = "x-powers,acx00-ephy-package";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clocks = <&pwm 5>;
+            vcc-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac200 = <&ac200>;
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id0044.1400";
+                reg = <0>;
+            };
+        };
+    };
+
+...

-- 
2.53.0

