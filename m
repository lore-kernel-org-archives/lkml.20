Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886D348C4B;
	Thu, 24 Sep 2026 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233086; cv=none; b=FYQedlxSshAZ0GXhM6AZUf3AdB/EkT2Jy81EBDgdtOLUNvaqAw6zrJc0QA2xoBmbcREsnq6okQmotwHx3WijQ7PYV8g9Ejir0RTff6eFOOv7N0peuN2PteMkT6yJaIEU9Qea3Lo7FWTRtPNSrRdTS49Ci7OGxP/CXMfSLoNB/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233086; c=relaxed/simple;
	bh=e58mUOVDCabTEIsJagv5irkFEBq/0GqVPRrdO5QEnM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KMGGzkpwYhLs018xJGzAWmxNWWdz3+MKGqhhPR3tn57zEUbyrC0+sq5LwFuVADxm4YA1N6/fmO2hiEr8dHFrOjJY1tFudg9njDk87T/kubZG1m4FJrWMMG4pD3qtdDhU/0Ih5Uf+yHaSFnKoiPkwFgXgq6oFXgq/UrCX5MxOouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=PApm8qyd; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="PApm8qyd"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D93361FD0E;
	Thu, 24 Sep 2026 08:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233066;
	bh=bn1dZXSQxo3TxF9c+QnQNZubE0Jo2jc+fNGwUMxBLbE=; h=From:To:Subject;
	b=PApm8qyd8MxaKY6+SeOgpxPyK3BSRyuzKzFnyOjDVU++4T0x/P4j9b2pGPAh1idj/
	 nu9PlpjD1cjWw4IKWZZKjQRMsHIgOtilCuU8TLD2X+CWbtf4vGP+I7pBiMxt7yzOsa
	 Kh0cqDB3RUdvoZS1SSkqNwg9Hqc9Be2XxINdBEzHAXOWsxs02asfiL5GVPK1GJ9nix
	 P7yM1maqKZAyV1owEUCG74XLOYcDIdQJnSYB7Y3O8F7qHIFaoAw/5ctCBXqZ3KCoyC
	 CjJu8qMF5+wn5p5OAOicmUOeajcxlIsOoUEH9yMMsEnkYi4h6tORY8QYrs0npgUCjD
	 jOYuuRu5nx2LQ==
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
Subject: [PATCH v3 0/7] arm64: dts: freescale: Add Toradex Lino and OSM iMX91/iMX93
Date: Thu, 24 Sep 2026 08:57:26 +0200
Message-ID: <20260924065735.17678-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Device Tree support for the Toradex Lino and OSM SoM families,
based on the NXP i.MX91 and i.MX93 SoCs.

Both families are available with either i.MX91 or i.MX93 on the same
PCB. Since the two SoCs are pin compatible, common Device Tree files
are used to share the hardware description between the two variants.

For the Lino family, add support for the Lino-Verdin Adapter, which
allows Lino modules to be used with Verdin-compatible carrier boards.
This series supports the Verdin Development Board and Dahlia carrier
board.

For the OSM family, add support for the OSM Development Board.

v3:
 - rebased onto commit bf184a29ad1b ("Merge branches 'imx/drivers', 'imx/dt', 'imx/dt64', 'imx/ele', 'imx/fixes' and 'imx/soc' into for-next")
v2: https://lore.kernel.org/all/20260911091952.96233-1-francesco@dolcini.it/
 - add acked-by
 - removed #.*cells properties that are already set in the soc dtsi
v1: https://lore.kernel.org/all/20260910101616.139270-1-francesco@dolcini.it/

Francesco Dolcini (7):
  dt-bindings: arm: fsl: Add Lino iMX91/iMX93
  dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
  arm64: dts: freescale: Add Lino iMX93
  arm64: dts: freescale: imx93-lino: Add dahlia
  arm64: dts: freescale: Add Lino iMX91
  arm64: dts: freescale: Add Toradex OSM iMX93
  arm64: dts: freescale: Add Toradex OSM iMX91

 .../devicetree/bindings/arm/fsl.yaml          |  30 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 .../freescale/imx91-lino-verdin-dahlia.dts    |  24 +
 .../dts/freescale/imx91-lino-verdin-dev.dts   |  24 +
 arch/arm64/boot/dts/freescale/imx91-lino.dtsi | 305 ++++++++++
 .../dts/freescale/imx91-toradex-osm-dev.dts   |  22 +
 .../boot/dts/freescale/imx91-toradex-osm.dtsi | 303 ++++++++++
 .../freescale/imx93-imx91-lino-common.dtsi    | 536 ++++++++++++++++++
 .../imx93-imx91-lino-verdin-common.dtsi       | 175 ++++++
 ...imx93-imx91-lino-verdin-dahlia-common.dtsi | 198 +++++++
 .../imx93-imx91-lino-verdin-dev-common.dtsi   | 216 +++++++
 .../imx93-imx91-toradex-osm-common.dtsi       | 526 +++++++++++++++++
 .../imx93-imx91-toradex-osm-dev-common.dtsi   | 324 +++++++++++
 .../freescale/imx93-lino-verdin-dahlia.dts    |  24 +
 .../dts/freescale/imx93-lino-verdin-dev.dts   |  24 +
 arch/arm64/boot/dts/freescale/imx93-lino.dtsi | 359 ++++++++++++
 .../dts/freescale/imx93-toradex-osm-dev.dts   |  22 +
 .../boot/dts/freescale/imx93-toradex-osm.dtsi | 357 ++++++++++++
 18 files changed, 3477 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi

-- 
2.47.3

