Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7035E1C3;
	Tue,  8 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875611; cv=none; b=gHAGRRmDjeuvaUKoBvrm0xYvvZEvem53ximblpfvyVyAgYdKuqzth0vkAR7Ht1nwPzHCs+q9D/R0nrXL3LVVilS/nVuAN679sm79ptrVVSXwehgAstrZv+uzStPi/PJbTYS/wB6L8usoK2hWqhs9PutFQk+Yqj/njr6lNRi95oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875611; c=relaxed/simple;
	bh=Qt4VL555vxac3fty5lZYyB5ZOkzD3p3mOdywTwgxECU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxMmka2UFDa9BVxr3OcNRrphaZNBsWGXSsyDthBJfV7nXacvcC1HEAhmGk5oozzjsSMhzO0b8QCCKz7YpdMBUCKqG2LCiUcPR1zczfHB8zXXf4Noex3Ze5LVZNJXaor6hwFNkTzyc+nGXG99BOxTOBn3BJYthCoRy24sB5Ud2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=JYywOxZn; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="JYywOxZn"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=;
	b=JYywOxZn+lQrLPd4OsfmpUNsMQby7MUQSp/GpiQyj0y4E5OBX8nmIJWx/UdaFcb88uZUXb
	GOaUf6F6mfa3/1+lQuDwlmUZJpbSlKL+SR64lIFx/xZ1+ONCHWAAHZUkKu+e4GOE1nz+oH
	1zBMXZl9iizoUcqp0KrXUwQNw9FCArfqXiMeeKYRDDV2AnTtA6totfnPyA/tmud2z3P4Zu
	SImkvoG/pXzyxPxB0YNjnhBJKgVBoIzMsk4ql/artKHKYcGe0M9lwAPfv7DMdG5vKHP91K
	0XH/KVZqNafV9NPVyanrWjZNnltSqQDSnsGWzlXtlobFQt9RmffnwftFabRgUQ==
Date: Tue, 08 Sep 2026 15:51:53 +0200
Subject: [PATCH 6/9] arm64: dts: imx8mm-kontron: Describe the ethernet PHY
 LEDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-6-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=3o8FkH+94Gp91Ts9hc9WE4bcbXn8u9fadCMq2uRk+Xc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsPMMRY1UhZwj/g4vdVV3RW2NDjliL8SU08Mwd8uua
 p7K+3IdpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAEzl/kJFh0e0OHx3fXFm7zOfz
 ne47Lrimp1BYoaF0sz74Um7Uv7fbGBl+a+5tdJK3m3p+yx2WmROzeq5NVTfY3Lxj1b7wwza/Lgj
 xAgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The RJ45 of the BL i.MX8MM has two LEDs wired to LED0 and LED1 of
the VSC8531 PHY. Describe them using the standard LED subnodes of
the ethernet PHY binding, so that they show up as LED class devices
and can be driven by the netdev trigger.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index dd59af0ebaae..1f3d0577f10c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm-kontron-sl.dtsi"
 
 / {
@@ -139,6 +140,25 @@ ethphy: ethernet-phy@0 {
 			reset-assert-us = <1>;
 			reset-deassert-us = <15000>;
 			reset-gpios = <&gpio4 27 GPIO_ACTIVE_LOW>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };

-- 
2.55.0

