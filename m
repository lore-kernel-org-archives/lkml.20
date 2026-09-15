Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6E41685A;
	Tue, 15 Sep 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480204; cv=none; b=tM/bkqs3p+2vbkm20zwrRYxrRDIkjzhX/s2AluYbhNi4haAd6VweqbqBQRNhC9Z06u/BHxYYxe7jkkdW7LNFMWDwsZWJtku2NSV5l2B/bna6c482rpJdxTL+XSXgBzIaeRRj8ANgHEIirJUGU3mdxwz5FMiGfr/su1BTMGWqh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480204; c=relaxed/simple;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bh5apcG9Ycsh1dd/tdqZTgh7rUUJ/T8FaKZCpGmx7D7fRHg1pG8AHDvth6BqdZ8xlnHd27t59ehV5AdWRQQQ6C4ZqovYBGq2M4OAI2lTOLYpjYCyZuJJSN/8t+B37IoSfmqz31fxbcPWXKV2Njt2Ue0mtZmQ9oF/Ve7/stDswNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EnAL1Dhb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EnAL1Dhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EnAL1Dhb1QyTkoK34wxMfwzTVUu74Ge2/RKjukyaLOn6xVS8EGeBBQpitJx9+et87
	 NPw4aEet9zjs2XyDtDdLGUKo+DgBFDdW3busuvrWulXvGno3sa7ccOnZL/d/XspzV6
	 V9vqrtEBsyO794ZFdtLZxHf3O+uyjEsuOMuWzWBWkQpsBBDAAIKKCxaVnKbBqNBj1b
	 Ns5y+PbS7GFVQ/f5I5xI52IqAVTheEjqKOB6IsalLbIxF3Xu61THvpdRoNbKAQ/mjs
	 ilBBsd4vN09Rd5ss4/kjB7wikao0sA+xuRaoCQUcn8JbTnOER7MvG6MRn2mQXARsK/
	 a9huxOi1/22Zw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C6C017E01C5;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2AE15480029; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:48 +0200
Subject: [PATCH v15 01/16] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-1-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQXF/0wYZI+OBSxd+3t4gR+Wdcl/41J1H
 RPFjo2xbxeHs4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaMDAP/2exTSnnkOwoMbX8hPdWiGWpGk/uwF0bAJK9Wg6COb+CiEdRcUhdndG/mctCN2ZIzfP
 97FSYciQXNVOVeyXCMvCuLOeeIhwD8JjWy7S6OdS/dnOvMmhuQ0ApWWSwBbakFs2ElfAxeY1/A7
 zor8gg5g5doNDH7rquKvj+0KmfcE1QSo7myHcVaenjJCIqOluASXNzXo7s4zKEyyZjB4YUivm8U
 fY7cRwGDVHOt+OBKvEM+aVPYspobbQXAP6xJv7LA9kkuXkVczq3JTNPRsZZkUBS7/dn+TiZEULH
 K1CD6zwERx7oiE/KbhTYcVCmnkEMEsMxEEEsXYCn0uIbsh+99aWurkG+2eXwaUDqJy+hSUHQZ+4
 VUr8U5uh4nPj9A8x8SFICgIDMZdPh2C/0I9xSkypwzUvIKvb3ac+TdQfe9ybn2X+XFzIVnPFBaz
 j0mXrgvp/IX90s8aXbD+IM7XPSPpnYJv1TrEsfaDNhEKikLDGxkmx7rSOKJZYntIAvLpEPovvXi
 THlFK4GDBc3QTQB0GN84jqEYZs0m7RY2EGjSV9aW6qIIs6ZEqbOkulJguxy+lFc4TtH4QxiCm7D
 gj5RJjHGU6ElDPl8hgjCyrRN7pN7phsDG2RfGzXSbFxN/kxOkY5WjY++rCwz4+T5vNZ4N/YM7SD
 0oiILF1sg4u4lMUJyROYouQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..89efaf005a7b 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -110,10 +110,34 @@ properties:
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
+    deprecated: true
     description:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP Auxiliary, which should either point to
+          the SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0

