Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E3B46F4BD;
	Fri, 11 Sep 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118425; cv=none; b=NJ2WLjOjYJOLViGzRAPHz3UzylvVbhdiFjc6PuV4e45uAWHk+8vgbDHfyV5vRYr3wTefEonWPrOnC2uncj09KAGGab0iuqrxZG5kXrAHxqqSyi1/nPsBZyt/YXGMToqvTbtDYGAa9lYbOYD3FlQYIiqSANHl4BRc7vkI+EmT650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118425; c=relaxed/simple;
	bh=W6l3Qb7BsHgcaUFlO1ypRFSSW2D8VcuscnAh7/PepAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icZgTDbSH7UrGaA7ydO2/gTzQSj4JEsadaX5QHx7KUUeskCjQlC+9yTD8nsM0hUaihJGP7I2IcP85PApleZYUWYaJAH6SesxV8ABjlbLkK1iTwRyDYac303lYDY0T0eLBtE3u554fhXxBqYlGuRpKknmkRf+3t1t0GEDR/5A+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=SsRfaz8Y; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="SsRfaz8Y"
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 2D52622D78;
	Fri, 11 Sep 2026 11:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118419;
	bh=2INZCyybt+SGf2xAekMXkwCGx4/CTlSaJfaZ9ipywCc=; h=From:To:Subject;
	b=SsRfaz8YqnHARrQTsawjEerB/oHOLekb2FqpoK1twxlykYEkm15Ppmrq00WtaxkHr
	 zuIMZsyaTs35lBXRVNZtj/I/qjzX9eyrrm1HAUO3qXMdZX2ZiSvPOFpUuF0mmKL2aB
	 MSJJbVyVh6Qjui4QxRErlIz2dTEeZFYybZE6PtmtrcGAixHKgD+wxoIOGg4ghHlSSY
	 WUO3XIOZ8QM2X2dvdVW2RgTLroxn7lVzXyYXwdCRSF7QN49ldpsIgRdnrtuwf+enBp
	 k6L9HRLErhrn3W2pxBuZtHnqjBroT7kqgvENndONhU819i2AnltjQH+2/0Joe+Z/9r
	 WXXcAYfmDgkrA==
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
Subject: [PATCH v2 0/7] arm64: dts: freescale: Add Toradex Lino and OSM iMX91/iMX93
Date: Fri, 11 Sep 2026 11:19:43 +0200
Message-ID: <20260911091952.96233-1-francesco@dolcini.it>
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

v2:
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

