Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382309;
	b=RePSIBvPMPeOLT/4LnOIwMLMkxDd3uWlvChm2IVPFNME5TbG37M/ScNJIYam/9/hNDmN
	 XKl7bzTwrAmc0Y204TMqUulDENM32839pfZ8gs2+WcQOK99a6396COwCHtfv3znPLY6eL
	 WxzwvvkqM85r90Xclcp2Y0kw7PKJrayjW1n7hp8eyuRXrCEDGgVAAnbCeUFCTohxTy8on
	 d8ePA7xqRezECqeYQHlh2bHTWohMyJc6Ry6CTCYsL0uA7+ZmBQslUjs/ae+s9vMHXcX/V
	 iNKWeKvhP1rPgGOt2xcW831M/ypVBSVY9CpY5XHtfQlZXUNWcmLpYw/X697HOpkwCAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
	b=cvhTDZJ2f7MB3PEtd2y+ieFdnqsufthwVtdHps4o+EMgslicnpIuamvpumn8erWG/Z6E
	 B5RsyigSJ6Bmcrbj+ON0dG4HGxTPshAcEV3PL/g6d2gJHmUazCyWEDueQg+xzLFGaQe1z
	 4+0pvnvVWWiWgmK5OPqzqRJePHIFbapGsuyWUzcUb/97r8drlFELr4B29onWGIttamOEc
	 L4kHjxGsboCP9zubocW9OwTzjW6E+yCnM4+ZnHNUHG8ZRqfmlVhalDpip0SZz9gB7IoMP
	 er0sydcnaFUaeXHrnMNyBCtfC9snm87m1trDvs4GpA7b7YQqeVvFhdkGkxJnrEFrW+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RfUUt5q/";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C560A2621
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77C560A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RfUUt5q/
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5924733eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382308; x=1794987108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=RfUUt5q/D7/C3thNae+CWtR0BgB7jbfkU8p7uK0ciZpMW9MmyXBEtJ+8RpQXZe8ci+
         Ufykdt5aNVwpeQtFjWQIGP1kG0lvTe7jEwUWXRMQTgIALXnZl1DkwDVg+YKiE4e8c4qc
         PybinaSOcsvmrJ4sgcuB82pTXOEwThfFTCmjpLqesHbOUKvA3g46zy4imxtCacktBZMh
         KjleZ7pNPIwYC00GHxXs8y9lNlpmEUNJe7n4+pVpBHPvW8QcqupGTWKAppX2DKQPXvfv
         y/oNd7Qkl3GlnYN6QqOZzoaRZLHbb2929Qhy4fMdKGRoeenisxRCkP3UCq8tc4DXGHf8
         lmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382308; x=1794987108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=vl/JQtXte+l4DZy7H1JleCXsaRFeAGT2dTmBhHG+kukSP4XV1wGbUORo/MuhRoSw5q
         tD2LOEMpbjjKfsd1nv4XbWBeDi4JeJ8wfDZmj4+ezkKazjsx4Rk3oFdYcI6456hQIDdV
         ISW7EFPTN3v8eFxMVujf0AuZi9Oe3tRhXhdViIkcFDIFPVUyklBKf2ZENgLDOVzm8bqv
         y2n30yxGplrwEjZzfK6p9kD/xkh5uPDRJvYCEnVeV7+nLIZouprNTL6F+/LDN8H5HRhd
         oI8daE3VThJ+xw7/CfAbxL/ZGQxkU46/2ssgX7dX0SKrAFKyp7Wa7XsAerhi89EXdajj
         ZM+A==
X-Forwarded-Encrypted: i=1; AL+hErFypJBFLbBb7owiM/Pt6VGEkZeAXISSYnpcDYGjhVkBFXCP0HjyDA0xG/6ZlqpzwwWMain7u54a3JMpmqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/YnzMKiGsvCdxN4/9xBuoZnshGnWIqPfoqK0nmr/19wCgITrA
	HgzTvT1Q0msRsoAfmWjTZJi4yUyvpYwaG3Vlp4DZQslpeER3R3wjSrkK
X-Gm-Gg: AYBFou0y0bvvNZXoIE7QGN9aiXd7femgi2yQJbVvxhOr/A2Ksmyhsv4UqS3Dexdjv1p
	/jrJzEaDl2xxtw4OSpQP8eUGl83FsubuXY6RXLNONOIC+PGFAMIUE5oaZGhpgLI4CBaOaBcvH+n
	EH84US9C+dzCLm5wY6YnbRaF+rRzEnhkPRrb/4yPdCr0YbKErg1erse3qVuDTRb+dctts0YRSRy
	zyxbWEpRD0+SXIXwhdwrw4Ka8rDXPSkLWhDC+Q5g/MOHI5n/CsN9J8iyca/1vTx3BJoRilZ6x3S
	B/qXS4rXnXxYKlfEGWnMBCpXfxJrHFN5xU6vBR74RftH44pNf8fdmABQKkpxXmRm5hq3ZscJuOi
	BIuxgFPf0xRsBmSpxMIZHoF37KZ5IPjejyaBhjGVqobxlhZm3ogt//DToO+RRbFLagCu1X4Ggpg
	GEJlCKLXY2aa2UdD661BNqKB+omdwi3TFWsvQmNTQ8fCBCb+y5+4OoPcLa6C4mZwR0Ri/czHy+6
	oAg+ejakBtYKistNX0P6OC9WcPl1l118aTC0UGok4qkhVghuvjJyA+1zF6qFA+nypptGf4HwbtG
	qDHYgVq6W7eSMRoa4hWm5AmQfQ0wHF1gTNasf+NTQCAgXgKM2qgLucDeb7GTq6PJJ/PV/tArgpS
	ZtlnO0l4/6eha6EyutQ==
X-Received: by 2002:a05:7300:d198:b0:375:f17a:d691 with SMTP id 5a478bee46e88-37686859024mr1969808eec.38.1794382307362;
        Tue, 10 Nov 2026 23:31:47 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:46 -0800 (PST)
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
Subject: [PATCH v9 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Wed, 11 Nov 2026 15:31:34 +0800
Message-ID: <20261111073137.381966-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
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

