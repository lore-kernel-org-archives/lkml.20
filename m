Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168B483811;
	Wed, 14 Oct 2026 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964713; cv=none; b=HTr342s+/qM/rC0ZEwEUTArhp02kxHT170/ug+0cjygNZG/K9t0OZ5VVNjEPOY0ec1X1Ph09KMbNsaWv2kfdpv9N07YC/vjSIoexqF2Ghfd6ctTVJUtqGjUeil4yprKOqQ867na8R/t+BvTxW4L7e+WCXkbsqRuDt6c6t+kk82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964713; c=relaxed/simple;
	bh=zZkaNhMeyWvsOyp3RwtHHvZXYxTdhPKOL6ptWxLjJSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXItYH7bA856uYYESK28v0znrVhn+/jLCGbE9NgOcXEj7z7kF3+ZO0JSlf3GwbbBROUV1WWgkYArma7OlLwpH0TGnv0DacPEspMfwj1Atc2GuFWfkwLfdjN3CCAD45ANlffUpF3yUkNxZAWNeEkprtz9MrXmPdmjtnV9TqTFLFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=IIMSMLfB; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="IIMSMLfB"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8F98A22925;
	Wed, 14 Oct 2026 09:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791964708;
	bh=1yC2vfl11Uvz+rPgJVGzarEqP1vrhE7ym9xxRH2Eha0=; h=From:To:Subject;
	b=IIMSMLfBZLhPlC9dzthw9/IeIr8yB0aT2jxjCI7A+Gy3afeV+bD+lDTo2g5tr9Ue8
	 ybqG0Wc4TAkAhBJpOAXQFAA/bdhzOhgAsgkagm6oMw+sCI3nwkbF6/ME+yRjao+lFk
	 1bHGhonHW3ASGuaPt76ML1D49go1ojvrvVRQqMUPxbqddsi/ZvUbLW6GnILSWtUJR6
	 Y2sc+Ft2qkgaofzz+oDcN/83CK7o2Uezmi2Wj8BNxCXQmIIeZ+aG18GKcJmKl51sWO
	 fDN4DsTyoqZvGL03h437HN/Y8S8vVO5yyqI625d/ZQx8EaQni4hJsH5dF4QzgD2Ev8
	 RZ+ES7r3g9phQ==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: Remove Toradex OSM Development Board ETH_A PHY interrupt
Date: Wed, 14 Oct 2026 09:58:08 +0200
Message-ID: <20261014075812.29154-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
Development Board Ethernet PHY interrupt line causes the module to enter USB
loader mode instead of booting normally when the reset button is held for more
than 0.5 seconds.

To resolve this issue, the PHY interrupt connection has been removed from the
carrier board, and GPIO_A7 is now exposed in the jumper area for
general-purpose use.

Since the OSM Development Board is shared across OSM modules, update the Device
Trees for OSM iMX95, iMX93 and iMX91 accordingly. The Ethernet PHY now operates
in polling mode on all three modules.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY
    interrupt
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY
    interrupt

 .../freescale/imx93-imx91-toradex-osm-dev-common.dtsi    | 6 +-----
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts  | 9 +++++----
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.47.3

