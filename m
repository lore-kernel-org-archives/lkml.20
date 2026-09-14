Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685D3446AD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355973; cv=none; b=A8lFxWdbRY0Vz652GSf8+rR8c7FEFjFSJY2Pkq4dgOCUVuSXEpzipvys0GjkD33LTf1h40fxMdCg/rTwHH/n5KjmAtMBpfyZUIVNJ4XCyVLhJpk3Ps0xAl/hbmf5vdioCAKMaAAiU4eD9OTiABCnpfHuwO/70bmHWmTHoDy5ouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355973; c=relaxed/simple;
	bh=cIwC0oC0HqkbdEbqtI2pH3Cw4jfxhvxzji3+pSjEakI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9Gsg18JkVe5lG+Mjc1H5kc1w3EGfoMLpNLvtddTHOiHB8INGZVd8qJbvJ0ub6NrDyBGWnMyUZZm1+8F5AyiKiyPSTGPvGFUhXVKoalNPWtEJpZ3fX6HsgXpEAehGg2qjbYfvE7+R5YYdgRE3sfxNPWiXinkWjgi3/mZUENMRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqoWb/NR; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqoWb/NR"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so9446585ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355950; x=1789960750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=VqoWb/NRL7mXUIeoFo5okq2TrDHUV3QeXS9v3DhInvgRFOdpFho7AB21v1M4Nfg9uw
         yfIFhARQE2QkwpdnOy357OZKV8Tg5XN10QBpwCjlfWU1mBaXO+Sm91lt04yXtkCGsH9j
         gCqTC6zksN6Z8C9o5bT2+WkZj8jS6eWa9g7NMcySjHzFZ8v3yzJxVO4ZQL2UPgRb7zX4
         mS+fbDffl7EBF7dfo/1HRT9rkuP6+dyVzFpifFnOeJPs32/wkMnGhx0w3Kza5DJSn1vv
         4myqmFttFOIYNg4pZt3Z3M+c8Y1GvgBCljumG8+sTQQ7WDFVfj8eS1o2ZtWUy3PlZZJf
         BwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355950; x=1789960750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=pdWVmNwV9dQCBqw+qQUWi15U5bhjHZfBT23h22i8R4552McBgNAHBZe4DjkF3t8/ku
         ijMYjDgMJmWK9t+Mp+vLxsYFlpb2LhPRiHmebkjzr5emY3XKWuJKIVi5jeOB3Nf8UIYQ
         +Ot33zRZDWmvt/0k0uxoGi+uFCjtxx5JCJg71pRt4IQS1dotXk4WFd3b0DPTKnzpgMTY
         08Bt6d7rsILmOQ3TlSh9syBBjmqads93D/Un7r8wXIhnM6AKAf8Zdw4vwwaXBh7CRHsW
         lO+LrJYVQ/KZrjSbWixdvQTIqHnQUtMiTVjfZ/ZCy7KdB1Ekg4asDas6jbhTzf3mq3z4
         jdiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw88u8MJyUACl0XZFmWQyUb7BEvh4EFVSuCghYIhlGPhFnEgAjxK0qwxvcHo01jM73awN+Yl6b0yT83ZQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nmy1Ej5Tc98Adsa3oFN9MjfWV1fO4XzXMv6o1a3oHm4d2VnNYl
	D1DF9siROOrlRRWcDTglJDJ4Z4zVqyx1SK5OVMsVpKsCQpmeZcHGIezT
X-Gm-Gg: AYBFou0WPQnwVEwLD7xZTkezfuVOT9GVuvDucvoAV+5t4KtD4sC6/FSCVFmvFpmgax4
	Tz/rDrLfOHh5eVCB6KgRVwg1rxyCh7uNBsqr6d8NZ1D9fmbOv4Q3opuGOY7b6SxPiI6S0IbYvp3
	pikR0wsGkW40PUAp4lbU6+8l218ytRR7LomZD11mPnR8/QpHK5fwizcwZI/5JQzm2sS139jFE7Y
	ypwjbQ9rlxXD/gIQVx2OddGhQz5QVNYyh0Uy2QpPYmHEUP0j0PXNhKIcfgOVV6zcKxsM+wCDOZy
	3YZ3m3MOINWUDNHIb0lX3C/HthH8fnxnWiX7OFEh0fhTPjIqLR3p0JlpX9Kd3DcNJYYdt4dXQvO
	1QIp87JiXLMQllxxWpYAuu/urrjNou5iEdA3JZHa6PauAxcJknpEuXO7NMTd16E3DcSJ6J6pIAV
	Wuz2R8IsgPlvN4ERJxlRMIEguiHJlgNg4/qBhul6ORMXMuAMzBQcx2hvEZ/sxZIWI/tFqExWivJ
	fyEvAKaXHzl1FntcAim8zWxta+L+tftzYjEXXwjVb22w87cV9CbCUe44Bisf6E=
X-Received: by 2002:a17:902:d582:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2dd6c6db2e8mr18390955ad.12.1789355949721;
        Sun, 13 Sep 2026 20:19:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:09 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon, 14 Sep 2026 11:18:57 +0800
Message-ID: <20260914031859.385224-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031859.385224-1-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
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
    board design time to match the PCB trace impedance.
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

