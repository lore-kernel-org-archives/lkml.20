Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A3037CD52
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439602; cv=none; b=ECNceQIcY9sKNTF74HjDtwlJJIrzQbe2FKji4+icayaNrJxPYAhy5LHAK0m8N9OjdZVT+OOUeMJeZHD4VTiLR4M32TZd5hvmY6JpAys7Sjzvpm48Rrm288UnhUZ/Lrbv/j6rHm7SxiiDQDmfqMyaVGOh+SMyYBmN67I+0A51/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439602; c=relaxed/simple;
	bh=UesWAnvidu5V+vT7hnQQOomMWRZS3pnTvN95fJQ+MW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrwd8Z5XNOm+NejwgoSNi0Lumj4hyFGXg33PTeo9Ew5DOrNiA4XrzdUqK4Ep6HPmHXtUJ9ByMZqNDsBFpx+Pjf5p5tei6tcxGBUykD2n0gHG34OH3jB/9NNX28cIfG3oQhUOo0Gnf3ueHMgIQuiIwwZaN9SQAHfo2spJTUWDBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LO1uIhOh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LO1uIhOh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a80e169311so1929436a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439601; x=1792044401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=LO1uIhOh4wVLy5iD65EsQ1S6CJcudj5SKFmzyFEbfPsNhAMMk8EbZ5WWFgMkrq3fz+
         vg9snVpD4WRASbEEHFJqm/3EYzf8AWKf0wBNAHXFNKWLtFUbkF5vliWYx/6oWr1qPBhw
         gDEbX0Xdea5tqN8trxmmwHY4zkPidpBpHj5itFxrgigfFTHpiKxOzietGNaxh1gmkriu
         3g8WajHr5lcf32n9GvCJqXvQWab4TPWlopS/xSwjaMRYh/NDfh0jP0J/z4Trylc7u3Fk
         RxABPLYucUnPISM5NUhLQibToJ/dceMHmb4+xikOzjG6hhubTTGJ/fGll+3PbGwcjvJh
         wKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439601; x=1792044401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=S7OujXigUcPxxTSBtz8gkT/XYjm7CuPDpIGC94jC+ilCvADem29hdsIYQXHbWnS/6P
         Of9P29oc/KgVvsR5lG9jMZSPIErBEZkoppf+E5Oaa/Lqq7VAivC2zmCT+arPqnsWOhLl
         Yzx9WVdEyFgw9goTsXgs98WT4T+X7vCfIEyCE0JoayUL/NLwAq8HwxlIoYaS1ybyWZz8
         foPziXHYIFFTcdKImOUQivljGE4mWdHJBwE8hdelJGdzQDixwlvO7v9dTE2+j2QL002T
         XpnnluGoXLSD5glVdB5mfyRYGHKB78KjLY9rll7VnfGNU/glU7tW7avy5xY/Kt1SdLP/
         iFzw==
X-Forwarded-Encrypted: i=1; AKwUvByRXGqbSq/xmXXODo/DwzHdUHAroix1Vo2Y9hXcEk+IqJEPRIsrwbXsNojg4p+vEE+GHw6EBBoM9bWBbcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVVowhKJFJFlVrs+tI9p15u1RKzhCQTbIwu18iQJoun5xzTwRF
	Q0CTSljey2BmcqZXyhNDyKKvfmwZTYIGupjxFF3VIhw29r/2cqxR+9vR
X-Gm-Gg: AYBFou2JCb4hctdMM0gejIsTGMFsXurJlPRqWOU+C+nx9mryH9YF0SwVyPvBsnFiAYt
	kn/QOH13GdEeGYaqVXxVaQ+5Ae/Vu0HN3xBzNauBDWyXzc7Urt/gZI2r5iyWQ1yUKOBvnOcNmhT
	iUSpvHRRvB5TONAdX0OcxjUHBmRLrt4J4nNUCBHIR0xQxX/aEJO71qxtVUngU4txm+8PdBZE6j0
	7FIS0YpP3JRRB1rz+qh916RQi0kjpOGuljmljxNhc1Un4cXMEFFlIXMZeV3i5netaIZMdavii26
	Eo2F0eW2FvvdVk/wEzAsI5F+g7JBzBeCqBlRvcpfjQEXRgLKko9cQgyc+NIn/ZQfGT45HaXlFcb
	SZP0b7JvP8GfsNvC7zqHyd7EvME/9FgeZNFSbi3TfcPDlEJ7vRaLSOZsygB6UwI0lbsAe3d3lQW
	MIMGMrDANKSKwb4WebXSP0RbxlZEAcp8yue/IAQlVmTmlbczRev6BUZ5nkl3fd4E64wwPg1HVGq
	S8UYN5HLesJgdAaISKhm0zaWMoqrAMkQCmcY+GMHlnlDYcQ3H2r8I2yg75vkfZ1
X-Received: by 2002:a17:90b:2241:b0:3aa:fdad:7d73 with SMTP id 98e67ed59e1d1-3aafdad8873mr755187a91.55.1791439600648;
        Wed, 07 Oct 2026 23:06:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:40 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
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
Subject: [PATCH v7 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Thu,  8 Oct 2026 14:06:26 +0800
Message-ID: <20261008060629.2736806-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
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

