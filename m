Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4547606D;
	Mon, 14 Sep 2026 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393628; cv=none; b=n0SPu/YItEWwaBdQ/xOW4aa+mNwKv3s9XqgaRqaT6j9CQ4kilZctVXS6Ks+e7lT4ptEBOsOlZYrMSB4DyxxJvpOz6SBGsEX60yd+ZRMXlWO13lhU6IBv87ESIAcWwCimfA5RpvPR1r5moivpDdqCuQ4nyhEIyk10N5vXgedLaWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393628; c=relaxed/simple;
	bh=Qt4VL555vxac3fty5lZYyB5ZOkzD3p3mOdywTwgxECU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfY0dqEis4QOaq/2OJ+Y5F/V8G+Maq8ErZbMejAgd4kgtHVIy1oN2Ylchy4i2d6CUlutFojTW3bZvcOsymmj5dvmXl1AZUro7ojgfUU3Oe7jnopqBlCt0DBWjnXU5z2xjixVksOLCs99Wt7qsQiU4VLrWaoyMERtpeccvb3TvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=r3QkOTPW; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="r3QkOTPW"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=;
	b=r3QkOTPWyE013mnNLKuquYTC3vqSQci0rbYLNlpDomAOoKpLmC9d2l2aMkZPDYiznWwTLq
	uEObAtBt+nM7hjw7cU+1HpjzabeyJVrpppgw+pjRCE0c7I8XBIHXx5bdpughqMYD5EnUWm
	N+SReJuMnFxVwV/0/a6++77CV+MX44gCmGb/0TXQLM7y+McUgUfG3sXQdHgneXnfBnqYfp
	S8UFgJzw+V/uWlnPnpy06Bm0ybkRKQq3GItHe6s+elEqy4KQvIXg6dGv1A46oZG7a7dAyg
	ivWRB7U3Lqy57Gak3C9CvJRfeUBdS7RmgiKiLYffURrfSkrqTmMwJeS816LMNw==
Date: Mon, 14 Sep 2026 15:46:14 +0200
Subject: [PATCH v2 6/9] arm64: dts: imx8mm-kontron: Describe the ethernet
 PHY LEDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-6-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=3o8FkH+94Gp91Ts9hc9WE4bcbXn8u9fadCMq2uRk+Xc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1NLJsp9KN+q4FaZcPo2E6sG9xWdwzHHjxx98GXj/
 HrulwLnO0pZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACYiOIWRYc5lA1mB6veGe5en
 uy+9v/10Z1349NDX8bM/1ciqFxs69zH8FZv56l2w9WOlX+aKGz4qmC3c9KBP2OXVv08TGsqt2m/
 e4QMA
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

