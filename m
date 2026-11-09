Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207382;
	b=V7C5HkZLLYAoIWOP3DSZtofqlRF1MBF7/B8sqmkq10edt4D0fo/MLv0a6lz/4zg5+jYX
	 jHUF9fU7OfttDcL9nCKZOUrEeBz5gdtmFhrgbHp0P5ZYtUf6pDFiOWmzrCZLUd5fUCZpu
	 mOZnKDEoXiab7pOKOJdnhod3k9owaZrTbVoe+v3q0aBqBevWqTAHtNARDfXCK9jLcaXRL
	 SBQBa7X66I28tpFJQXd/E8omyWFA63hevJtcKGh97CtWaGrXD2nEF9Tk+C7isBFcdN0sw
	 b4kZGQA2usoUQQRDtKTXpu1Bl7BdVSuWVSsBUb9kwy0zhJGIV97tDZy+2O7v8vTcSKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
	b=i6Bwe4Rw2o2RDQSLiSoioPUYWkQC97Ee85lWJXSXGszlNu+X1MaZP3s0FbAn8qIZWaL4
	 /Z0vS14sGqG9ru7YepQUG81oSIuzcA4pZzabZCn+5U69fs/vHKBiQSNKYakg2/pTc4Q5l
	 24L4Zx9mXJRmyki3IVzLQFOgp0gx9hdfqmhDJZ9diIBMCFQn2WIuSJIJy1GK/YC5I+Awd
	 UpAIRTevyCJraN9FIaYGyBTbZoofWsvDINB/VVkwFp2MRfesPfUkPTV9ZokLP/+t86vBU
	 GU57KYj3UYVyhD6XWuYVRn7emcmBbREImyaf1hqb/WqNYRnbWX3wV7bkMcRrYGUT1qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJ1J5TpS;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E863606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E863606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJ1J5TpS
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so962073eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207380; x=1794812180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=NJ1J5TpSsfBjPBpOSA+ef3OIsEvIcjmImv703VOn+zmfhywF5u3fauGphFugqVGf1P
         19zdzpy7fsSd87keJd4F8Kzb0EaO3DlDFGba5ISAZ6Gk+eNMH4m6B5yHFLLWvaGakLh+
         D8UZ5m8N5oh7BtMGSEnnJ/u9R9UFSeWeaO6pTWVeR7SvzQb8HU5jstuM69X0dbCBZOFL
         fswKu4Ha8iiUtVruH9kV5+pIk7IlgoyDcX6hqM+EnE8y2WuUSCNxCMgPTP+FRK7DArg4
         60jgerlb7nfQ5KTdyIBYmhHFpkBRVmcQIDLU+Rks6nRX/+7un7tSdnIAzyfGJTJKUwgv
         VVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207380; x=1794812180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=TMFLYDqiddaqCNXDunhqJ2p49G1SX/RUiJTAZYZr2QOP6eJqdrPmw+MxRfbDZzf0nh
         rv60eMxSzVrNorhPSsyHs84QyfImFcrELP032ke9n5nTUh43rfIQ0ds8fyEaX/2pSmbq
         CNH/bFDFZ4FmP0Dvz+S5w1fgvamMxXRpy/2d6m0d1mLL2P/X+SdBs2Pi2EnZ+gxxjF78
         VJ8kG7MSotLmOWbNmhL5hy5mwdVgymmgCZ99zaPKO0ElHGwIeqZ0klaNR8RLFk7PZ7dH
         jXd0vrsNVZJWmJsuwlg79lDsxJH9EX3tf2gYFt6SkN4zD3xHM5L3CIUxb+ma5ngEA67X
         Qf4Q==
X-Forwarded-Encrypted: i=1; AL+hErG4rqI9zmnbnEKqgK+dEESezmQ+qk5sf/3nV6lKbkYzYACr7vGobGbRryNmW5wSTS/FOGx7KJckpbHVE18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jQs4Ex/2pJJF5RH5VRcZqK7g+bn9Y5BQohmYWmnt3EWUKgcrV
	nt1iiiDX7Dr40LmImLG0i7em5Vwwl+Ilnt77dGG7etbdj7YogfqTMA+A
X-Gm-Gg: AYBFou0nOHLVi8cT09+5MltyCe1EZP15vnL14Eau3BQNIpLuL81LY+yn7E5tkZe2o44
	BBQONnl9rhGb16zN/V8gP+9KAyVRns7UJhvH6BPfqClolOWmBy6XbMr5bovskESqh4Ha5nq/WNC
	frfjjEeG1ZqOuCLrzjmJ8lu0PrxQ/14YS904SspxeGLX7e0JF5iNg3dkVGiX9fNYG1ZVvtHLMT0
	06GrEGgzUSDK4pHX7OrrozWHyJAY0S/7QLeunuPKCQvzpSKW1lR+Di/hB4NQFmb22/SM+2pAhoY
	RprlNfEE/3YqmzAo4Xweb4mJxv5x5cRfxU1krH4t10NFHruvnBJhCSlj6L6SkHoE4eBKxUFCGdF
	Ji2SKhvUbAY5DJ1IvZMUTRTvjKL8XJGHIOQmwjcy9ZWGT6gVpFUWtGWmckO0ReOtLrAPwnixel0
	0xuwbGM7JBv5Sq+8qN2JqpMRGYZponFhJOi/noME+0093h6wYTUwwWQGR8XFaZ1ASUWOyFr5p9i
	GlDW6wyhkkBOgESt/P27zJ1z6rDn32IOWv/qqgkb36hHls/q9dydx5wQ3UuZvlObZTIYuuMIk40
	5r/3ecW69XKR7psLSn2rnDRrBVorFU/uyQ+IrVHmLxN7rR3TIVUcqexEQ4ExKL0eC9Lnf3cohMT
	AGbQecqWYo0B7qb+lbg==
X-Received: by 2002:a05:701b:465f:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b39fef4183mr4962866c88.33.1794207380042;
        Sun, 08 Nov 2026 22:56:20 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:19 -0800 (PST)
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
Subject: [PATCH v8 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon,  9 Nov 2026 14:56:03 +0800
Message-ID: <20261109065606.62641-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

