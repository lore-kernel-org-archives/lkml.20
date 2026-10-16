Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B30D582BA0;
	Fri, 16 Oct 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176040; cv=none; b=YhRYvJBI27ZU5mYP5GeMl/jl65Q+csHMwgnUi116qBjDTOfQqo7p/3Hw+D8ABBQFvNhyMMqucZKXSeYVATnlZC5WTix+tIn8hr+12+ggTi3Bve0bO4/Isnp8C6e0zh3+VaOuTp40OjjC/ncMHsGUNOjdd5nPrvbkCJtX0h2sckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176040; c=relaxed/simple;
	bh=EF72CgHdOXLnmh/mpSOx62aTsle3MCEHx9TlZcDnN8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juEQxsPGE99/RY3xhddTSKFVh7ths+E3Dy1AYC9DrFcH9h/RVQxrzOTWFFQl3+N7XwokwMfAeRD5SF8A1nJRcIVuBGHlOKPaietrycA/2bHZM5WL1tqzs1PJIKGiTK9wXOzFPTTHrH2lPXtMgheNF4uDMA8RaLD0w94JgL9e+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ZWGFy9Hw; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ZWGFy9Hw"
Received: from francesco-nb.. (93-33-119-6.ip44.fastwebnet.it [93.33.119.6])
	by mail11.truemail.it (Postfix) with ESMTPA id AE6D41FB49;
	Fri, 16 Oct 2026 20:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792176030;
	bh=E7Nc8Mvd7NrUs/gWx3FaCKJorqSwr6trCvvoTs/mlio=; h=From:To:Subject;
	b=ZWGFy9Hwb5NYNwRADPCHYGGZUNKUGmr4Ar1YSd8anfwhCJ3iesNyNUTrq/J0vz7Pi
	 c0pZ4rjMd6JsTRchbN9hhdenKE76u4zyDOZPvAoednawuGIjEpqKZhUgDfQyuzfkIS
	 fu7O2CncaVocTuuO5BPBBD52cVrEncQlt0HDOlRiIySKRo6Ku/kQBMAzTK2RngB2V3
	 jHNe0EefY6XVGjbie7HS12rQFMFJPT10nZq99FAeLhwGI1NyX8WB6imDrJSa1FH8kt
	 q1yatLz1Ogph4JlBC1MqPIa/3GadGTvtCbLC7YYyYmEff6NStpewHxf+HARuakEDn4
	 Nqjaotkev5yAw==
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
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Fri, 16 Oct 2026 20:40:19 +0200
Message-ID: <20261016184020.46763-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016184020.46763-1-francesco@dolcini.it>
References: <20261016184020.46763-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The OSM Development Board is shared across OSM modules. GPIO_A7 is a
boot strap on the OSM iMX95 module, and the pull-up on the carrier board
Ethernet PHY interrupt line connected to it breaks the reset sequence.

On the OSM Development Board the PHY interrupt line reaches GPIO_A7
through a jumper. Boards are shipped with this jumper removed to avoid
the strap conflict, with no change to the board revision, and GPIO_A7
is available in the jumper area for general-purpose use. A future board
revision might drop the PHY interrupt connection from the schematics
altogether.

Update the OSM iMX93 and iMX91 Device Trees accordingly. Switch the PHY
to polling and move the GPIO_A7 pinctrl configuration to the GPIO
controller. Polling works regardless of whether the jumper is fitted, so
this is transparent across existing and future board revisions.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: explain the jumper and board revision situation in the commit message
---
 .../dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 566671b32308..24b4bf579835 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -93,7 +93,7 @@ &gpio2 {
 
 &gpio4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio_a6>;
+	pinctrl-0 = <&pinctrl_gpio_a6>, <&pinctrl_gpio_a7>;
 };
 
 /* OSM I2C_B */
@@ -262,10 +262,6 @@ &mdio {
 
 	ethphy_a: ethernet-phy@2 {
 		reg = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_a7>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.47.3

