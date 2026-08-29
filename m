Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8E38DC71
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004721; cv=none; b=kRg2CTPWlxnVQaGYWZ2X+to+op1z7Ta0eraBC3gqGJkzV7qVj13WRdc/HYV+giNrsGnVLkWnHjrg0H0cbOBCjMofpnVP/Uu1GMpyZuS3HflM2nwR5PnvhMDV8h5UipHG2BAmUV133bar+fmgjFlIdx8ZOLembKJZpt33Tp1AT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004721; c=relaxed/simple;
	bh=1cnwRuhKTToZ9ufUWqiSd5MU8c6IVjjWd5ft2Wt+dOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDL3hbPsNhAnP0zEJePPrXFzNDMA58SGZsd2HSPnfkrnLzZS3rENPgMe2Osyg1mP/+EIYclEsYu7ukla/URzQlq/kJSEAu3FlwrVw9RNTPq8iMg123TdJoyKwYeKe9+me7lTcX804H4jTU3e7EbasO55WYAypbDg80EMBfmze8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwNIJqur; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwNIJqur"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b9320423cso17548915e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004717; x=1788609517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/d2agzYVHTgJehWwUbDB0I9JGrQnxrsr9OrqjlElBg=;
        b=jwNIJqurUL8lU9JJrudVrHXCRFIWJOVc7NvC5U9C9AOrYnF7Mr7011hOQkM+2kGfBp
         50lcSI53mNzqxByY2WBI2nYfCGAoO41xHNNvgC3KqjuusXKjF8NIIBDimb9fMwyn8usm
         bVPPqA9Nbk68erTa4+qEsIbWgu/9K6Nza9RQcGmYiBwdkjLxhcK0m+Zw+9MDymOGY1x5
         LkZ+dA6g0FsWyG2/fFwfms6jP67bzoZTh5R+JVnKXK/Im/L8ATK+/bGMZxsWbWSXo+fv
         1lYpzmE7GPGcgPnkCyK8gMf1EI2z597DcdkMtKos7VWQgifW/4A7j+MVY5PscuRFIYa4
         k7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004717; x=1788609517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/d2agzYVHTgJehWwUbDB0I9JGrQnxrsr9OrqjlElBg=;
        b=G4nyYOhLUqMAP5R4Rc+ylDBouLtXOQ370+v57i6iX6LmCMr94zQOp20yYbDDnG8swS
         fpGaHf/Nw0PRigsnNpkRYXkQdpn7YXTPojVQ7d+ZHlgVvlmJYC3dzFtO048rbhjldycN
         RyqV0Z6A3qRiSYyAimm8CIJ8zGUoug7OcqScqjDnOBAYQU1FOUbXzQka7E1ChNgK8mvC
         v74zsN/BTW1k+wAlmzNi8g2vMiovCmTZ4jYKMx1SF+ZW/hDtFi7zSI3xLN8CXD5TQAMH
         VKc6DpJiIAyPEq2s4nav8zaV1/9pKFkA4mbVXK3ykjW5B5SiWHJSn6Wdn9KwfJLBoElQ
         tZNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnoR3OHF/ZhxBJZKhuM0ELG96VndFcXpRS2A5NwGXX2yt+RTOcRmaNChDCDZ70XdWobSJjEZ+4qnzkOsE=@vger.kernel.org
X-Gm-Message-State: AFuF++kjW4P9yd2+uQ4DEVSummr6Klh42Y7xZOSKL8+2oXrhJxaKEbM3
	ki7H+vQ7ZW+kMYO5A9OrmSAjUSegPsVx2NFk0/Hz2a0P7+N54Rwpdd1M
X-Gm-Gg: AR+sD11zn45F4PwDhExxZZP6VuAm3OilS5dNNE/IaH90iutOQ+khXP/5w2pYr+u/YEH
	5yE5up3JyjjM8aWcVO9x6Qg7Asyb7KUa4YmQPcaNmlHzmaw6/3rw0stYlaUrMkmf4gRfNnb3UCT
	6Tk7v3y9lylTGc3GaVrl/t24yCoxManVrirnAmg91/ElxseOUKsV6rNFknTbLYCDs3cAw8YYpFf
	aUgiPfq3UDTiBVdSbRiR2EAxG/3RMPHrC6fnUh1LpAo2OwCKsTEcCRYyCNH6d0jXdIzR4pBIaE9
	dM6OcVVPRxTu2ELh0eCN5SRE0LqdTkddk+88hmTm2cYOse8JA5t+nN3AGYxesLb8l/utB5mv/2y
	tmsrrQQbfkppR/QKZvMie/xz2K/AIzJrb7X7BkScfCPIGLVra2PcTsnWOX5pfKSvyrduDZARMQS
	eIMI7p/zIdofKlak2Vg4R3eM5EZwXxUiGvhw9eofM22I2Q4iFpVmoFvDUJbw/nm9H/2GQ49hiWm
	aRhIUt8QRdyq+CR8StTrWN81KbfqVEz42gUDg76h1lucmuFVU/Gl4u6B86//ZVaqxu9/3zxg/S9
	JJISfI7QbfBygqJJ
X-Received: by 2002:a05:600d:13:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49b920547fcmr185064185e9.15.1788004716653;
        Sat, 29 Aug 2026 04:58:36 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm111107945e9.0.2026.08.29.04.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:58:35 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Sat, 29 Aug 2026 13:58:30 +0200
Message-ID: <20260829115832.8749-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829115832.8749-1-robertbozik@gmail.com>
References: <20260829115832.8749-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
and the standard SCCB command interface.

The sensor ships in laptops as an under-display camera, where it is
described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
the closest relative already in tree.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v3:
- No changes to the binding itself; picked up Conor Dooley's Acked-by.

 .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
new file mode 100644
index 000000000..804307cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV32C4 Image Sensor
+
+maintainers:
+  - Robert Bozik <robertbozik@gmail.com>
+
+description:
+  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and clear)
+  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion and
+  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-PHY
+  transmitter and the standard SCCB command interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov32c4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Input clock (XVCLK).
+
+  avdd-supply: true
+
+  dovdd-supply: true
+
+  dvdd-supply: true
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ovti,ov32c4";
+            reg = <0x36>;
+
+            clocks = <&ov32c4_clk>;
+            assigned-clocks = <&ov32c4_clk>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_2p8>;
+            dovdd-supply = <&vreg_1p8>;
+            dvdd-supply = <&vreg_1p1>;
+
+            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+
+            port {
+                ov32c4_ep: endpoint {
+                    remote-endpoint = <&csiphy0_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

