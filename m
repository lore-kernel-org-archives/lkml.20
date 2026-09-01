Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2207833F368
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266388; cv=none; b=f6lKZB2+YQDx3yIcL92BzYquRn0rMSxrWxZka9hPxOLjQlBuzz5beJ7SW4Zru+eoibdgThdbyexPug+Ni9EI+/TZyqs67ta4w0qputd4OT7oQ+afjTV3xiZ6Rk9+Syo2lJHWDTchtIbar99ItcJXa51e+3888+DqxSMlUwDvPb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266388; c=relaxed/simple;
	bh=Y7Jcq8dZWob6t+KlbYyR/PhGdfcnJrT7r5rX1ijtrRs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MI8SMZmAPFtlWLvU0mL0EEhI0MZqPF1OIssUGiF0Gt99P2VS0sNakYyiocURmWzSS2nBdIQiOpOGerunHCfR0Vf4fNbMflaU+0CtakikKU82kXDu43+N1NvAi3kPzbXz/KGycKE2v2j00ZJBljmo+9pgEAdIOhbYfikW+kw+7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sC+l95ns; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sC+l95ns"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso10218175e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266385; x=1788871185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=53RowTVrDzh07Xu8pdx1LUWteAHWJvlkzmcm0Nvqkwg=;
        b=sC+l95ns1GbW0GAQxEagivHUUVaz0/acHSEEwvHA4GWFaw87LJijFVI3vkgdDDzwe7
         Du0pEvUZ0Jx1m/CSLOzKmOys/TWlx4i0scO8buCQudj/W7Lb9M01yBxJhD+ulHDiIAMr
         ZIMVMTbcCi4F3mNprAbTTIma8Gsb2pwCc1N2AzxlgjDmV9HIdHIWW0mzSx+cBSrqFuEH
         TRYJ0C5B2Z9iwmJiIOxl6GasNd5yTds0PZ+v/YxaQsjwe4vAntan5ew3IonKCauyjeK4
         cWLYRP0nh3oR66oDZNZdMfaA/W+US2pXq2L/7OprsKxf37Hl+hw55zDrBXXiL8nsV/Da
         6txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266385; x=1788871185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=53RowTVrDzh07Xu8pdx1LUWteAHWJvlkzmcm0Nvqkwg=;
        b=RB4ZupQUSvt7CdSiXQrrYPlP2jJ5nOiJV0bbq+VjO0N4QpnbChKLdNMXGJiUYbXeCG
         kUX4umcscIIGArfCXgrsV8fNQHLnmPGdXstUip38c7sU+SPdzS5dV4Avxh+Ryg9z3zBl
         0JRv8GwBe4SYqfbyL2IGaaulr9CSOrJ+W3GcnwvPoUaAKFTGKOFWCIOSriJz81yMXpov
         pW9Qepn0HlomPojLZrizuUl/kfBFgOJm6kg+gy+VJwQcD4t6gDy+fGf0A+yZ0bcetht6
         zXEvOdJwPzKZyJPW85su09l6OPW+ljv8IVBJus6iE/Q82Mn2JThga83fBlc+N5ipJLLF
         TvRw==
X-Forwarded-Encrypted: i=1; AHgh+RrFA0l/f43ndz5PsnBkj//YOL6fQnpyy730SDPX8nGzhxdS9aT896psTM+S8KDXi5QseiAKuu7+XW2qqOc=@vger.kernel.org
X-Gm-Message-State: AFuF++mUaramLnggK4iHNAnOYgNBh/reI2OQzhdia955Jlzr+QowWPxT
	3RfcHk5TZGyRj6CF3zD5dIJgZbmQqnCD6vu355F1QRFX7NSDFJh+0u+3
X-Gm-Gg: AR+sD11DBlkutm1TfAGYkADt9YdjzWlxgUNIJ3gjcsdpaNAJPYWz5WEF38yFZEBd2/q
	ybM1SJb7owgoAepZu/Zvn+1ap/2zPG8ptnSYP47HUNuR91drrD+35QsVN1LsvXHiZTPsh2poxhT
	wfxlDSnbnEtmiaBBrzGsZMl2J59XcXPmqkDxs1nISFrFlg/nILYUyqebplJikepF39HZrc6Yh9J
	4VDHHm3SjUooPEkYf3iEI3zYuKHzZpR498RO9BnbnyOg3wgvPM6AFigPw2o0ETZnJoAO1GNA/Qa
	dIDqCk2fDi42gSHSnuOf0UKbnGkYyhDuBU7rpLFhQASt3ex+j6hMqHg0raKAc+L20ar/15MZxT4
	6KI1oHyqmqPd0cpMPI9A0UGfXrw6DEMF6LgTVdflUwk9Mw/Jctdyb8yGZC2kI1PWGThjI1i7qQA
	JZ/TAv+ckOxb7q8YHnGDC9p7uUSVsEuX/VyS4TI7IXtW37Rfft6MaVWtCzZXYA27IGwrVTRLKmw
	zmw6CL9AbIHhxxqer5yVNPvY61FIWupAzYLgokgOa/MAQKUD8z6IQ==
X-Received: by 2002:a05:600c:8011:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49cdc5660bamr157788235e9.12.1788266385067;
        Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm4644130f8f.15.2026.09.01.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:39:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: phy: airoha: Document support for AN7583 USB PHY
Date: Tue,  1 Sep 2026 14:39:31 +0200
Message-ID: <20260901123933.15388-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901123933.15388-1-ansuelsmth@gmail.com>
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
new file mode 100644
index 000000000000..f1a5d83e8968
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
+
+  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  On Airoha AN7583 there is an unified PHY implementation where a single
+  PHY provide support for both the 2 USB 2.0 port and
+  optionally one 3.0 USB.
+
+properties:
+  compatible:
+    const: airoha,an7583-usb-phy
+
+  reg:
+    items:
+      - description: phy register
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: phy
+      - const: ana
+      - const: pma
+      - const: dig
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  usb3-phy:
+    type: object
+
+    properties:
+      phys:
+        items:
+          - description: phandle to Serdes PHY
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - phys
+      - '#phy-cells'
+
+    additionalProperties: false
+
+patternProperties:
+  '^usb2-phy@[0-9a-f]+$':
+    type: object
+
+    properties:
+      reg:
+        enum: [0x0, 0x1000]
+
+      airoha,usb2-monitor-clk-sel:
+        description: Describe what oscillator across the available 4
+          should be selected for USB 2.0 Slew Rate calibration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - reg
+      - airoha,usb2-monitor-clk-sel
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    phy@1fac0000 {
+        compatible = "airoha,an7583-usb-phy";
+        reg = <0x1fac0000 0x1200>,
+              <0x1fa6f000 0x100>,
+              <0x1fa6e000 0x400>,
+              <0x1fa6a000 0x900>;
+        reg-names = "phy", "ana", "pma", "dig";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb2-phy@0 {
+            reg = <0x0>;
+            airoha,usb2-monitor-clk-sel = <0>;
+
+            #phy-cells = <1>;
+        };
+
+        usb2-phy@1000 {
+            reg = <0x1000>;
+            airoha,usb2-monitor-clk-sel = <1>;
+
+            #phy-cells = <1>;
+        };
+
+        usb3-phy {
+            phys = <&serdes_phy>;
+
+            #phy-cells = <1>;
+        };
+    };
-- 
2.53.0

