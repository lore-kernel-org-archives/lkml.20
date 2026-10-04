Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722193C4176
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132740; cv=none; b=ULgB1uKAClfW1C+RVh/XAKGBKDMDdb5MFSIFr+bzBKP6Y63Cvk5L0d2UgZieS1JslBhJZQ6Nm1Xpd5wQE0msQPiF35LT0bafoWOuD+1p0NC+EO/CybQw6V4J29bdUtaDyJulwDi/sLN4fQRbIQ8dUAFHgfVZH6Suuwf+cg0ECb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132740; c=relaxed/simple;
	bh=v+ePETCe8wPnxEXXhds1CDCZkr+Y5xOzkRoCEoyMHko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfoYzEbzsmHI9PhKy/+RZ/Jp0YtNaIK3fz4LWXg+SfJvPAUDCAz4NrWuijqMBt3s09t5sTn/oWiilDyabUyXBGyCmJ5ArnLDu/z9tJNQTL0fVzljZ4nlR1ozWmDE0cqGaYcgTAR1CDYCGxz8u5ZCYCpI58ZM9aALajCPytWiXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXCQnjFe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXCQnjFe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso8803895e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132736; x=1791737536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjq6OWraU4ksP0g6/oSpn1onbvhCPh/gZN+ZtPInBtY=;
        b=cXCQnjFe4rH8z+fFtFKJ9cImKMpKfZCgTlT9qfs1/Xf79ANiEtTiF7pImzSnJHcrti
         8olG0kPGfuPnnUbpF3DmIEV3CAafnYxImuPizwYQ+g1eKrqsbDQE8QhdAAC68NywtylX
         QMsmvwVe9fCCAPAJtI7IgtA0rUVuHBAG+Q0xoJRpv87SV+dDMNIGWPcw38K+afhg3FWK
         j6eC/U3js+I3oVdGUaBRGEUgI5YR049tZaMhB+h67vZ0SkhkTpGx3yd42YRsP29aJrde
         cbkuw5imFUqWz536jZxyAQJV+g/YvmotkREhnRpGk7Ww5y4raGIqL4akEDgCkwGHhDaH
         XHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132736; x=1791737536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjq6OWraU4ksP0g6/oSpn1onbvhCPh/gZN+ZtPInBtY=;
        b=uK+yHSVY4JdhaRvT/gIdRv5O6EQqS7LliOymmd0KsvDJO7HLF+NFwa8DqGIN/mdOOe
         jgSDCb2pOEpxAhsrBKUIWTxGBXtLFqkWDTt4fAmnx5PIpslsq3IbMTSjuQtwp7iN9jE0
         VTfaCAW8FtI1j9aWN/ZCuJxjmDBLKZUpzSeSvseFTWKcazQAH6Otd0c8qzFCyCj1sbBi
         7vSf91b5oxpdZT4C4kbW8m/q2+FRYVvqBHWlFTVkF7hDufDQsXsHWUieUC77vkhRYL3A
         yYN3AIOal100I+vFQj6Kr0TreQCw/B+NE594qCxcRWnX6hSpLnOEklrXC03PvkW8z/ky
         i3xA==
X-Forwarded-Encrypted: i=1; AKwUvBxYCG4Hdoh1z2HbYO/v+JDeXvZcWabBsgicYI5rLw9iIs9QC7Gm2BEeFpuBUqcaD6Gpdj8m+pE6gawB+Vw=@vger.kernel.org
X-Gm-Message-State: AFuF++nX8VZuKq50C48au5/VEb7/30g16DLIYVoz315OCXmz2jWqsTFT
	cfVS5owy1VT6Q+fG0HXhLXv/FNBj/Z+ex02kAr/BvYTFzUPap9NIMIqH
X-Gm-Gg: AYBFou1VrOBgiTO0NcIFG+DqrAcQkdtfr16A3nNi28J9vZxRfRGst02geutIFvdqvCU
	zSiyGtdlaMT3WTZrCc6QdPfJUkZGtCjTlbE+DeBffBbUGeZMwJ95G1hchWhJyE2hAhlmN4oXf6w
	+Odf0OXFeuq1hSuePRxMR/ZgLRTCF1dLyyup4XeK7THIDpxVNUIidYXQHZDZwjB7pVNbmfslWYz
	SliQlV2jCA1W0TPTvWWf7FRY8agcJ2aT8ERnoNxpgePmE6Rz2xU8/iuOgiDmLUbkxegcKqRRxzD
	TENfNm5l4ohKuh7LsAjwNWve4vl/cPDFiL21BMF6GRddrwKvtNQdujAoAbuAejT5KH433uet5hi
	BPJBa5EERU02gw0AqsZwVr6QQAr4coUjrAO5LjJfuJBnrdJRM2i+S6dnNbmjNjibyS2OhmZGBG8
	uaRvzdZKlonaLh0ka+dhkm9vmWVeGSb4P0CchYUqZtUxs2xAbt/kmVtsa5aJcSXsJcT9GAagyEe
	1XuUI/bjL6XotMLtRU=
X-Received: by 2002:a05:600c:1d0a:b0:4a1:6ff4:886a with SMTP id 5b1f17b1804b1-4a16ff48af5mr31663835e9.16.1791132736286;
        Sun, 04 Oct 2026 09:52:16 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm20902213f8f.37.2026.10.04.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:52:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a dedicated schema
Date: Sun,  4 Oct 2026 19:52:03 +0300
Message-ID: <20261004165204.205660-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004165204.205660-1-clamor95@gmail.com>
References: <20261004165204.205660-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all Tegra-specific Chipidea devices and their properties into a
dedicated schema file, by analogy with i.MX.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 2 files changed, 88 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
new file mode 100644
index 0000000000000..78046f8a63ad5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/chipidea,usb2-tegra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra USB2 ChipIdea USB controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-ehci
+          - nvidia,tegra20-udc
+          - nvidia,tegra30-ehci
+          - nvidia,tegra30-udc
+          - nvidia,tegra114-udc
+          - nvidia,tegra124-udc
+      - items:
+          - enum:
+              - nvidia,tegra114-ehci
+              - nvidia,tegra124-ehci
+              - nvidia,tegra210-ehci
+          - const: nvidia,tegra30-ehci
+
+  operating-points-v2:
+    description: A phandle to the OPP table containing the performance states.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  nvidia,phy:
+    description: phandle of usb phy that connects to the port. Use "phys" instead.
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+
+  nvidia,needs-double-reset:
+    description: Indicates double reset or not.
+    type: boolean
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+allOf:
+  - $ref: chipidea,usb2-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra30-udc";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA30_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        phys = <&phy1>;
+        power-domains = <&pd_core>;
+        operating-points-v2 = <&usbd_dvfs_opp_table>;
+
+        dr_mode = "otg";
+
+        hnp-disable;
+        srp-disable;
+        adp-disable;
+
+        usb-role-switch;
+        extcon = <&charger>, <&extcon>; /* vbus, id */
+        vbus-supply = <&usb_otg_vbus>;
+
+        port {
+            usb_in: endpoint {
+                remote-endpoint = <&connector_out>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d43..b73bea61dcac0 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -17,20 +17,8 @@ properties:
           - chipidea,usb2
           - lsi,zevio-usb
           - nuvoton,npcm750-udc
-          - nvidia,tegra20-ehci
-          - nvidia,tegra20-udc
-          - nvidia,tegra30-ehci
-          - nvidia,tegra30-udc
-          - nvidia,tegra114-udc
-          - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
-      - items:
-          - enum:
-              - nvidia,tegra114-ehci
-              - nvidia,tegra124-ehci
-              - nvidia,tegra210-ehci
-          - const: nvidia,tegra30-ehci
       - items:
           - const: xlnx,zynq-usb-2.20a
           - const: chipidea,usb2
@@ -66,16 +54,6 @@ properties:
           - description: register offset
           - description: phy index
 
-  nvidia,phy:
-    description: phandle of usb phy that connects to the port. Use "phys" instead.
-    $ref: /schemas/types.yaml#/definitions/phandle
-    deprecated: true
-
-  nvidia,needs-double-reset:
-    description: Indicates double reset or not.
-    type: boolean
-    deprecated: true
-
   ulpi:
     type: object
     additionalProperties: false
-- 
2.53.0

