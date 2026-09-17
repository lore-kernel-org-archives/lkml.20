Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD024B1CE8;
	Thu, 17 Sep 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638197; cv=none; b=d+q44DJZpYRPJAMSsmL5JsOChuE08TH/NNQrdzprwn/J2VkZFUAA7YdchiytsGAebMZjo/BKnIi/+kMUYma83gWioQvGp+2Eo9M2oB7pdYqcMkW/aukDdyqkVfDY12Lc0A0nMU2LhDcAAklZH31Jx6kH+K4q4wc27+UeiojSWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638197; c=relaxed/simple;
	bh=DaB5zuAPaemeoO6Zw0IM5AV7dY/kS+zsYeI+JxbPowY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vf0VRr06QDZefYewinguQMr/0nGLb8vQF3st+UUXVjiQgJlYuQ7niJm5HyRFO7u0+YCS6kEGPg3o/VPNEfhcto1dax3M+FmFVuNky53MyDqKv+MDdt5F5nT+3VMf/QgXb0XpvWUsu55h7UK4OWiyW9fbjEuMuQewwwH3jjnlDPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=EEE1jeZr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="EEE1jeZr"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id AD9B11F8D0;
	Thu, 17 Sep 2026 11:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789638144;
	bh=GrKwQSnBM5TlJwrXeIy0ESWxGzkPY7jGMX9Hplkjm+I=; h=From:To:Subject;
	b=EEE1jeZrGpYBbkm7jBaZiYUVn3vsNzRXoUuZhAf67BVk3zc5f9yRT5a8E/Y2PUF/c
	 he/WR0tgGu6vRr6nutCipM6oltnj0DBJGkCJrWiyKJUdCPNDLZJmBc0nUaT5PKhJwi
	 gVDukL/i1IFT7q1lcdTTs++m54HtxP9w9geGUHGYbYzhpJaEGnPaisMIoSID4DU1Dm
	 KiKLuDXtbTJkPWU4duiRl/tO+bgAQrr7aYqW8nAp1SrmH4V/1duZ5+GVwfTkpuBfqX
	 Vm5Kw+9dztp+nvB6kk0H3WiOybZcPIX12ZTfUIzKANJ7wlOBKb2OtWQ63m6RmdfseZ
	 JJvaEhK/jFNZg==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 11:42:13 +0200
Message-ID: <20260917094217.59508-1-francesco@dolcini.it>
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

Antoine Gouby (2):
  dt-bindings: arm: fsl: Add Toradex OSM iMX95
  arm64: dts: freescale: Add Toradex OSM iMX95

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../dts/freescale/imx95-toradex-osm-dev.dts   |  404 +++++++
 .../boot/dts/freescale/imx95-toradex-osm.dtsi | 1036 +++++++++++++++++
 4 files changed, 1447 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi

-- 
2.47.3

