Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309113D566F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647746; cv=none; b=FHv4vHterr0Jktd/tRCpn7891sxyFaAMHdUgZ640x7g0VN2i+r5EIL7P5+aWxdnbIewXXCmJaQHYNzuatBN+tOT/XlOwTE2UsMgUNx7S0bEW9prk4kkbNnEdPgUa5suqOg/dM/nywuBlHCLuhB/7PhHbwle80D/tuCN7joGRk80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647746; c=relaxed/simple;
	bh=UesWAnvidu5V+vT7hnQQOomMWRZS3pnTvN95fJQ+MW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD43u2mDAcpyGQLeg8U1+n+e/CIYCVByvrUf6aQvXj0X72Ik44+L2ifZolphVghflxyKSsgS/jvOWC0F74dfnkksxtjja/QhhFyIvdnjlwLs+2grJvP7m2waa5EBLBMwGHgbNQsrIUCngJt4M4lLS+d5mhHyHtKwq2jeixO7OZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggvkrC7j; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggvkrC7j"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a856865so1747607b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647744; x=1791252544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=ggvkrC7jQ3d7do5Y3WTVRcytrz1+hDRlxvVCurwqdoFTuxA2Jh6G4fY6dwEbuMA2ud
         BRlFnkmRzcP+gc+5/nZYYgglJAsz/r/k7LDcdYN8BbJDH6AQ3yo0QcS/7aRVxVflw5NJ
         K5L5Y4pbwNm8qw4mE6UWfb+ihgQoybuYb7H7r4jv1lAccrmaE1G1ZpI4NTGhitukhMpJ
         Vxevqej0jzpYQ8T9vIFKN/IcESMGc25a1x7TRz13l7GSZP7niLiEsz2GiYHqqfCCQgQc
         s9eozCpSkvfQ4yASBuDovw8WUUQtDRwSuaa0WCvbGW09kO+2zHsVRasPbaQtgErZ680t
         f9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647744; x=1791252544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=tZuOIIIdihPhTaZFjHPCLUaJxZz8Ko5xXwaZX7OvGSyTdzujix4rOaQRV1Px3VCQHY
         rxDx5agWVGcv4VtPbaEwb+Daz6DkSXJzmz00bdL53Z8S+6R2HHvpexMCG4gkDQAdKMOA
         rfJGsWwaUdscsaCq8403Y3gDv5Rort7iHbAZETEzQtnnHUwYmFZEwJ9mBMhShSVEQe9x
         KzPUyQjWh5r98eRbd3X3EnvAbyIJcZmGG3Fe1Y2GgWRGmXa5NldO1Ukl4EfU1FhLvZx7
         rRuccrjGb7u9qVwn1B9Sht6yHNONA+ndRuRfq3F384ysM9oJJEqlBDUh0uWT9bZ5EsdS
         Drow==
X-Forwarded-Encrypted: i=1; AKwUvBzwiqChwcIzTrZiufmIjngL2a3/Hik4AmNuOTI/byTY0VN+kENH5L4ZhX6h1O/i4kbO1+VRr1GG6NRgXho=@vger.kernel.org
X-Gm-Message-State: AFuF++l5KOmJheR78aul/Huzmqk0fGmKmBaDgdgavllwgsWPXzpHQvHm
	YhK2sH4XkiPuJNRFbztchodJ9hqMomt+E+7pWe/eI/LjLKAu8AVRCylJ
X-Gm-Gg: AYBFou0If2hRQbQE+2KJmcw0orfgiYJtX3D/3eUcgpbYTm/dqz/2JeJirIN40gzfe1e
	TIYNrRWisXq6btDUA0dlHc5hnrqEVaVymj+IgN9AIb4h7ypl5xh/OUBy0yY+rn1Hy9Sgv0+6ndw
	1rbkWZf5FzulheVb2HSNFIDv1CJmlSePgQE3JlT/lh11jDbtQzuXgV3vEXJOGOSEozUqRTA/rEr
	/Z6lhAjOgZExVSWn9nvQR+zyREFlwk+9bifdUZ714ex2lopTxMK1d4P0oznhPc2dx3Vv3PnSwE/
	NvtzKuoGuIADt2tXN851qlCXK4bFlWqpW2wwz00PO0GVnR+BYWPGuuDkvzvtLaAl2JBz9vTomRI
	B8A8mK5snSBbWMRcD3uSAhd7cLlV3oDwiG28RPPTg5+GtRPJKYyJt9fjuyF3F8MNafXgdQY9EYj
	qndJ/fXEZ15M99sfcg021LbsmL8AR/G0f727D/EblhxUEnNVHuHGyuu2Ud+eFr5ZFh1IS26ZBqj
	WF6mJdmQQXG/lnthxWSUKsjkiMpPMOZxVEpXuYKYPCdT8qbBQnsLno7FsRTrsmP
X-Received: by 2002:a05:6a21:e104:b0:3dd:a197:cf1b with SMTP id adf61e73a8af0-3de0e8e18ccmr13432494637.63.1790647744404;
        Mon, 28 Sep 2026 19:09:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:04 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Tue, 29 Sep 2026 10:08:52 +0800
Message-ID: <20260929020854.1282339-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929020854.1282339-1-a0987203069@gmail.com>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 exposes two USB PHY ports (PHY0 and PHY1) managed by the
same hardware block (USBPMISCR register in the system-management syscon).
PHY0 is shared between the DWC2 gadget controller and EHCI0/OHCI0
through an automatic hardware mux that follows the USB ID pin; PHY1 is
dedicated to EHCI1/OHCI1.  Because both ports share the same register
topology a single binding and driver should cover both.

Changing '#phy-cells' from const: 0 to enum: [0, 1] lets consumers name
the port they need while preserving backward compatibility: boards already
using '#phy-cells = <0>' continue to validate and function unchanged.

The two new optional properties:
  - nuvoton,rcalcode: the resistor calibration trim code is determined at
    board design time to match the PCB trace impedance.  Both PHY0 and
    PHY1 values must be supplied together when the property is present.
  - nuvoton,oc-active-high: the over-current detect polarity depends on
    the choice of VBUS power switch.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..1bd22dd0e5fc 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,6 +8,18 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a standalone
+  platform device that accesses the USB PHY control registers inside the
+  system-management syscon block via the nuvoton,sys phandle.
+
+  PHY0 is the OTG port whose signals are routed to either the DWC2 gadget
+  controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
@@ -15,7 +27,12 @@ properties:
       - nuvoton,ma35d1-usb2-phy
 
   "#phy-cells":
-    const: 0
+    enum: [0, 1]
+    description:
+      When 0, the node exposes PHY0 only and consumers reference it
+      with no cell argument. When 1, the single cell selects the port,
+      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
+      and 1 for the host-only port (USB1).
 
   clocks:
     maxItems: 1
@@ -23,7 +40,29 @@ properties:
   nuvoton,sys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      phandle to syscon for checking the PHY clock status.
+      Phandle to the system-management syscon node providing access to the
+      USB PHY control registers.
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries must
+      be supplied when this property is present; when absent the hardware
+      reset default is used for each port.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
@@ -42,4 +81,5 @@ examples:
         clocks = <&clk USBD_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
+        nuvoton,rcalcode = <7 7>;
     };
-- 
2.43.0

