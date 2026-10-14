Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11728485926;
	Wed, 14 Oct 2026 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964714; cv=none; b=QkQORUUiPWWb5W1hOZ7yH8cXM5gnsvcMbvtccXaWZw8MTNMUfrehNPMsshQ1pwLvexVTDzViuHIcoR1f/couoe0jAJHMLSmMWMvy2yA7yeLYmiynwZ/uGwNs5quAVoVjQqSfYStUQB8peEhoZkh+H7rCHhBL7VXn4br/l/xbhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964714; c=relaxed/simple;
	bh=wvihMDM/JyiCgIYwYLwnC9f8ft+XH9aYsBIvW0CS9Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CX0ZgdbA07pe1fUAH6jAccaChOdcbsojOtpfUxiP1Vc8qgmrYQ6L2IUZlbgvfCHBLe/gypJpHzlWlbn5K3w//tQGft3xZN6m2xKK3V++B8+eyYF2FDrcrFfwBq7uaPven3FEV+dl08MOrrnDhGi+w4V2xK/489M0Axfgxwy/GSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=xKthjOOb; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="xKthjOOb"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6DC2222B63;
	Wed, 14 Oct 2026 09:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791964709;
	bh=GboN9DUCZqNahO4XvXD5zPpQKdGt2Yc6N+rShIKk0XM=; h=From:To:Subject;
	b=xKthjOObolv5rS1NFfb00J2+i5NzwS0n+icBxXzUz7wOx2vAg5ZXVZdDuCV8I16fs
	 1RT/PsX9XmefNPGDllWTTUt+3kswDwNdNJXtZ3xCkLQazu4pIwZdC3ONn+ssDEbA7q
	 fbLEhcq1A/I7JxfzOPwCoBOb0Of3WknmI9nZ8+23ygPshc7EaBc5niDvwWqt5ydoAk
	 qwxGG/39e0tYwOzsIpYEh+ltVQ81LPN7ph7SaWp181xxju/RjbQx7CWnDAe6lHCr6k
	 c0w+b3mAW7ZS3dFFMqYTuJ4GQto6gLMKpkXTh9OVVPyEfQzNVequbqDgzBgVKb0TRu
	 DSoz5SAHe1zxA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Wed, 14 Oct 2026 09:58:09 +0200
Message-ID: <20261014075812.29154-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014075812.29154-1-francesco@dolcini.it>
References: <20261014075812.29154-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
Development Board Ethernet PHY interrupt line causes the module to enter
USB loader mode instead of booting normally when the reset button is
held for more than 0.5 seconds.

The PHY interrupt connection has been removed from the carrier board,
and GPIO_A7 is now available in the jumper area for general-purpose use.

Remove the PHY interrupt configuration to use polling, and move the
GPIO_A7 pinctrl configuration to the GPIO controller.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
index b3d54be07c43..8f56c2bafb66 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
@@ -115,6 +115,11 @@ &flexcan3 {
 	status = "okay";
 };
 
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_a7>;
+};
+
 &gpio5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_a1>, <&pinctrl_gpio_a2>, <&pinctrl_gpio_a3>,
@@ -317,10 +322,6 @@ &netc_emdio {
 
 	ethphy_a: ethernet-phy@2 {
 		reg = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_a7>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.47.3

