Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7A451981;
	Thu, 17 Sep 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640427; cv=none; b=CiccuJwNweWZSEiZFxYal8NyAyw2/+ISzMAIn7k9QarZa1gEykacVDS+xDthZX1mkzK6GTiH4JXrNqNzRNyFbokRoE5FLhkowR4PP0uCky5yyEGJUB4n4DJ8v6/vC4fpn7hZUD6//eDlU4iE1Lu2AiRfoYktt1h2oceMt+zuyxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640427; c=relaxed/simple;
	bh=IvVVh5ss67jUSieEBPqB03zf8pdERi6kswll7GgbRXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BETjMADsN3XDmry7HLsZUGo64oltEHUrTH6sQno/ArUyImABxET62SFI4WuSYwVCpMp6CYU71ZiMQrccbE2pv+g+H+D3Vry3XazE3ozd3bHpNSDj0QvNLzgnVEMX6WSW5nP8Gf2HVsBCeOb+psCWDDsl23rf5jsDGpeUypDfM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=gqF3j6uK; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="gqF3j6uK"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id CD76E22814;
	Thu, 17 Sep 2026 12:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640419;
	bh=jnTw1ry++C6kkEUqeK5mZKwrgCH94f2NvHop25VWd5I=; h=From:To:Subject;
	b=gqF3j6uKvuytPqHp60/HVrumoniVz8lSmy0zlnm19In44ZM0soW6vIxIh/Can/h1t
	 OxjmEQzoeW34HAFOmso4ggxaqqCBUFDPI9AVW74TtHo4OPM//lTD0GrBS3jXBPV7Bg
	 tbKKPYaQHngSn1eJ93wKsWITqpQ/1pOgcRQYdjEqduOc7teD5mcv9aHgFLVPoEhE7e
	 vpwaioyyIvNlR7bAeKPbTf1jrIRVaYy43YngkRI+mUQTOb/qSkN1IrYYHoQgIQMK4T
	 WV/QiDcHWhQbEf30lEKc6VmaK+tllYfK+HFYjkyey9SZI44pVtWse+8dJA2mlsZd4E
	 17W7Z5LBSsxog==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 12:20:07 +0200
Message-ID: <20260917102011.69071-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This patch series adds support for the Toradex OSM iMX95 SoM and its OSM
Development Board.

The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
from SGET, based on the NXP i.MX95 SoC and available in Size L
(45x45 mm).

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/osm-development-board

v2: removed unused pinctrl_pcie_wake from PCIe nodes
v1: https://lore.kernel.org/all/20260917094217.59508-1-francesco@dolcini.it/

Antoine Gouby (2):
  dt-bindings: arm: fsl: Add Toradex OSM iMX95
  arm64: dts: freescale: Add Toradex OSM iMX95

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../dts/freescale/imx95-toradex-osm-dev.dts   |  404 +++++++
 .../boot/dts/freescale/imx95-toradex-osm.dtsi | 1032 +++++++++++++++++
 4 files changed, 1443 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi

-- 
2.47.3

