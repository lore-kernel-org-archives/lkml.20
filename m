Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838501;
	b=LyvcvSUYybza+k4GmhPxmcUWql/PamYb4OMSks37ykN/rrfcnDjW2P2868RjNQ/Dbepl
	 33YVblK338oVIga7qT1z0H6pS3VWFl5/FpxcBU88vEkLW7k2dZiOGa3fBKtBzhHeztFzq
	 nkBfpWNfe5bAnohF+eUkArNrfEvSO/Ar3kacVQmxEqvpGu/ZSu++Wu1TcaZ5MglENWIam
	 inaA3yy/6Rs9OWfRc0mIq1k1Lr2F63vP7BEXTiNIzuQNZWe63J75Ag8hOAOEl55WkSiNP
	 WO6yDMVFvTL1BgeM6c1EeaVg7NZRbe3VRPF8877lTZuCMJL60xbOqZ6hFLtKKKHCTGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838501;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=de0OenvYtC9EcJ6k97P7EWscdeX36hwem4HnssW40LQ=;
	b=gW5KwH4oLyQDJc8+6EVFhmLAhhP+kG6ch0LS5+ldL/y4W5VuQ6WCf5M0AEkQwie3RMZL
	 2qnF//3LI2m88saXBCLOrWj5q5W8lIao4jyRRxR2X0xm178k6jMhAhagX6oJ/rILWumuQ
	 nXcrIguHlNVXd7O+AO5JcheT2rI61rV5OP8WKNUO1G2MrV7DCVBj2Jb7W+Z+fG5WVZv32
	 j/xMMyyY9TMVbHwocD4B4qkWxQpJZD5D3PKK9eFFj3yJUp7sXZDF1elhmmyh8RK9tgDwx
	 L0C/6wmMLGgN3+nuZCWJXmuQw1n1XiYb2jx+KgIV6cw9hbKDOcYBABBOkQh+BXm6msA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chrI8hpd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1B606A329;
	Mon, 16 Nov 2026 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chrI8hpd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17031F000C4;
	Mon, 16 Nov 2026 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838501;
	bh=de0OenvYtC9EcJ6k97P7EWscdeX36hwem4HnssW40LQ=;
	h=From:To:Cc:Subject:Date;
	b=chrI8hpdPn4zacL284Mok86ddOiXlRj+ZeHafq0jBQxh7o4Ge8ML0ezRTdSYbZiI2
	 93N8LqkbT+QJDLfGiyLTKc8OTqYPYh6JSFDQC/tzoyDx6Ql7SYPla8cvqRXre1xtAZ
	 4JRCDb3Lre+6jaFArguhmWWr+Q1/3alrlKZm9X/ND3FFKsQDnLY1tTuCZVp1enfWpa
	 Y8gXE+Yr8nqYr+RQOlAhV/deipLXorAf7cAkChPiXd3mF+lj8Js77XOC7tfiwqspeb
	 vqkrCa+MhTjnX/+xY+wBZ4b5kGVpoqEmdATsZmmPGlzuZE2EKgkBMAqBSfmnrcMBVT
	 9RbijJuWsEU4Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] net: stmmac: add SL2610 ethernet support
Date: Mon, 16 Nov 2026 21:54:34 +0800
Message-ID: <20261116135442.4827-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add SL2610 ethernet support. First of all, introduce
the mdio demultiplexer, then add the stmmac glue layer, finally
touch dts.

NOTE: this series depends on the sl2610 SoC support series which
is still under review:
https://lore.kernel.org/linux-arm-kernel/20261115102401.3520-1-jszhang@kernel.org/

Jisheng Zhang (8):
  dt-bindings: net: Add MDIO demultiplexer
  net: mdio: Add MDIO demultiplexer driver
  dt-bindings: net: Add Synaptics SL2610 DWMAC
  net: stmmac: Add glue layer for Synaptics SL2610 SoC
  dt-bindings: soc: synaptics: Allow SL2610 mux controller children
  soc: synaptics: Populate SL2610 system controller DT children
  arm64: dts: synaptics: Add SL2610 Ethernet nodes
  arm64: dts: synaptics: Enable Ethernet on SL2619 RDK

 .../devicetree/bindings/net/mdio-demux.yaml   | 102 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../bindings/net/syna,sl2610-dwmac.yaml       |  75 +++++
 .../soc/synaptics/syna,sl2610-soc-syscon.yaml |  10 +
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/synaptics/sl2611.dtsi     |  41 +++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  77 +++++
 arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  36 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-syna.c  | 116 +++++++
 drivers/net/mdio/Kconfig                      |  12 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-demux.c                 | 298 ++++++++++++++++++
 drivers/soc/synaptics/sl2610-syscon.c         |  10 +-
 15 files changed, 791 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-demux.yaml
 create mode 100644 Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
 create mode 100644 drivers/net/mdio/mdio-demux.c

-- 
2.55.0

