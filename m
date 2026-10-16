Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7F48DB27;
	Fri, 16 Oct 2026 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176040; cv=none; b=BZiL+B1mgQNlGoVB/v5fBT1n/s4YZ5JfyRk1VwCYOmD16+nZPDjhlvPth03RpjuO6nyTvWjt2lpYEEcOLn8ZVLQ1izPYxaQDc2YYsR3ez7lP0ReldI+3cCKqdIYHXG6TsOBZ7aH94+JQPZvTSZsKjcz2Z4ykppPSMJA2ueJHqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176040; c=relaxed/simple;
	bh=9Eg42LDh4v3hlVQ0F8U/iaYgrtW9tdlZ6EPheDImvjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMfi2Az+/wWW24qePddhknBrTh3d4upZeS1ObTIlFfNG21qiClNUqzs8IvjTHrL5QRm/rQNas+C9vor517HeDVCduhGINPxklvZrosj4Ja8eFGCDBfHnmB0TGZmJ64ZLAAYXmBM0iQOz4tF1mwWwEX7FWc2a7G9gru0FXwWAbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=w2ppnyJF; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="w2ppnyJF"
Received: from francesco-nb.. (93-33-119-6.ip44.fastwebnet.it [93.33.119.6])
	by mail11.truemail.it (Postfix) with ESMTPA id 993AD1F81F;
	Fri, 16 Oct 2026 20:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792176028;
	bh=dhz5odU/pdgYQBlgWm1u3nk3BZVZRJKLgTbbju+m8rg=; h=From:To:Subject;
	b=w2ppnyJFFmMCnalDgb3D0VJPrZbpvkFuJS3v0ZqeyNgaLPmbWNrgN2u38AmxEnKxs
	 xSlFM0002JM7M6VAIQKyuLH2/s+fzT6cQcNw9ZMHlb8+PsHjgZLqaUvfZM40KYAQ1F
	 x+YxXfz2e13QrMlc2YMXt17wKGwt31pJAZW5jYhbBU6cJGIFJqtL3Q2Ksn+5DKqKdc
	 yaVpknB7bwl3703D1yDUEvxM5uX8fAPvjUyZfB6QZnBUCsMmpCJ+ku++WpnQV38B04
	 qogJ8KzxiBbGgSuFSHS0lu12J2mtehrYqVwTQtnbJdBULbSPIAMRpLHVNoo/Omcfgg
	 4K96AlnWaXIwg==
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
Subject: [PATCH v2 0/2] arm64: dts: freescale: Remove Toradex OSM Development Board ETH_A PHY interrupt
Date: Fri, 16 Oct 2026 20:40:17 +0200
Message-ID: <20261016184020.46763-1-francesco@dolcini.it>
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

On the OSM Development Board the PHY interrupt line reaches GPIO_A7 through a
jumper. Boards are shipped with this jumper removed to avoid the strap
conflict, with no change to the board revision, and GPIO_A7 is available in
the jumper area for general-purpose use. A future board revision might drop
the PHY interrupt connection from the schematics altogether.

Since the OSM Development Board is shared across OSM modules, switch the
Ethernet PHY to polling on OSM iMX95, iMX93 and iMX91. Polling works
regardless of whether the jumper is fitted, so this is transparent across
existing and future board revisions.

v2:
 - explain the jumper and board revision situation in the commit messages

v1: https://lore.kernel.org/all/20261014075812.29154-1-francesco@dolcini.it/

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

