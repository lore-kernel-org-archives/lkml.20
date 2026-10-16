Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA327556BA7;
	Fri, 16 Oct 2026 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176040; cv=none; b=pKEmdCr+sH3ahlVS3etZoDX1UQlmalJQfw2NdL1CsCw7xKjhiJ8ufErbsG6+rdtGyDlOjtj45whrv1VyuX9JcdfliMT08aqDZ8Atk5AKh9Di9xnosr1qLrCCnFrW8M4cHDOR1Ump8yEJ4VLf9sFq1ZZVY4UQxqQPcarbGAhVp44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176040; c=relaxed/simple;
	bh=9LMV74fjQdWBQqOV4k9uNQo6WLTjeAWmWJpG/8qu2ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIu+qTVLwCoJgS4MBYpbNdDjRc2Wkb2nq/XLcRnqkyFI2/rULq5mwZFFexkxjaOvZneRjy0Qnv8LjlJgtOBJm+nvCMdn2Jgx5e3CW1hsfqX5QCMCJ/0D6vG+aMWlukbioyV+utJDzfqA2Vmn8B0GcVBuWIIcurCdbXzTgKb8X6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=p67Y5djG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="p67Y5djG"
Received: from francesco-nb.. (93-33-119-6.ip44.fastwebnet.it [93.33.119.6])
	by mail11.truemail.it (Postfix) with ESMTPA id 53CCE1FAA9;
	Fri, 16 Oct 2026 20:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792176029;
	bh=xCo5Z7bS7mkeqjfSouZzs+qx9hT0+GW/Gdoe9SuvPmQ=; h=From:To:Subject;
	b=p67Y5djGUePOMWx4tpZmF3GTxzYdoh/RO/QctyXj/jWDmyKrTiSI3f0mcwf23M1Js
	 FW4nm7oUhk/YUKNji87MtilPIHCdQbTPB89Fdf2vKI/zibgruJBaog/6bB6ymLOINe
	 hfcZa9XdF1xmrecQmleGiITcfKE+a+ZBdE3w+ZKJ2UlGQicHTv1I2+0daZqZVenGUs
	 M/v8VDCoFV5CbnGIBBj2x8O1AmRo3E38KYjKlz6dANQNC2xQbF+hhMoSkqz5IY9kgN
	 dbA2CU6Td+TZxXXxJZJpdEC6Bd+EuFTFu1ok/r6Z0EtHzyKJHY/DOJRa8r1YRzLb6l
	 4L23aDc8pUQGg==
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
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Fri, 16 Oct 2026 20:40:18 +0200
Message-ID: <20261016184020.46763-2-francesco@dolcini.it>
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

GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
Development Board Ethernet PHY interrupt line causes the module to enter
USB loader mode instead of booting normally when the reset button is
held for more than 0.5 seconds.

On the OSM Development Board the PHY interrupt line reaches GPIO_A7
through a jumper. Boards are shipped with this jumper removed to avoid
the strap conflict, with no change to the board revision, and GPIO_A7
is available in the jumper area for general-purpose use. A future board
revision might drop the PHY interrupt connection from the schematics
altogether.

Switch the PHY to polling and move the GPIO_A7 pinctrl configuration to
the GPIO controller. Polling works regardless of whether the jumper is
fitted, so this is transparent across existing and future board
revisions.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: explain the jumper and board revision situation in the commit message
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

