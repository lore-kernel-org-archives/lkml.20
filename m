Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495767;
	b=bZ2Eoe0MqJEIe+TBaGZBL+6kP2MLSnQm47aAPOdqBaC78lZ9KIiNgEZw0zAQSAER3/H2
	 71yWr5pifaCxABIEo8lTjBstdMWX3MBN0W2VRH6CBu+mvyjvTr1qKpfCRdMfKC1GHFRHt
	 0OWG3NOuVJy95oaIZAA1Rjgx1O/BMt48J/bs7ULqyBF27bPMPVJa2NQ/rVtw53vLJQVKp
	 yBUjOVzxX7iSvcWlutigMwGiwu8nso7dz1HwYfJKD8qgMYTk108/nWjhTswE8blDG7uVW
	 7dyl0F9CGQBIzs1ft3c5ojP6bIt3C+Du8PpWLB9hTl74+2cuPsfIFcwDcIB5Uc/a/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495767;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VmOEUIJPJDASl4ZFrq/9SlrqtTD/ZswAL2tmbUhdyxc=;
	b=lsA038edU6Bdb+4aGx/8gfHoHtb0d6CXymJZtWNyGosLrK3E9R7ChwM9WiRxNyW0ip0L
	 CkQuRgAD2t5JkmFPqnIU4wunrx4TauLI0cTPLQCk6OTjcvJi/CXalUvVrgPLjCEeaLkeO
	 crzhqriZLmHuSCLX9skQ+TZKOYsBWO1+/RIxTFCcK7ko0dKEhFaeJtv4cnWAVQul5l3/G
	 vMQ3bVCmiVJYvA/TAgDpGuzEyxHn9Sp3iJCDJXjPB/fLBh777RWmbXdkZTowS4McDjTcY
	 dX5O57Hfu32qYRM48fY9olxIiw79vTSyQ4EhqgvxxwGbggoXbmpxcrNkMiNsr4yui1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=X7LVK5kk;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42F5606A323;
	Thu, 12 Nov 2026 15:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=X7LVK5kk
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5964523134;
	Thu, 12 Nov 2026 16:02:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495762;
	bh=VmOEUIJPJDASl4ZFrq/9SlrqtTD/ZswAL2tmbUhdyxc=; h=From:To:Subject;
	b=X7LVK5kkEba8xp4QvzDBuhojZAndEQ8oFOJo4ksiuKn1rg1QnLjZODWtY6IpBMFeF
	 Ii51fNppyR6A1HxUjzIsp23pJhZ4oJ8hJ7dtVZOiwjNg4oepVTq5X75SfkEND9h+Us
	 scF7N4sEN/f2dUgDPtJjGxCNlV9EY2fa5WWARA5fwk+h99s7R74GH67zW0AlcS6nWA
	 rs9TLh8KS7hBt3rnL53j753v9CAXo2S4SQzz48qiiOWSBNBczUCmLmP3f5EDhrNQDb
	 PSBJs/tsKBqOlOXrHrj1e7saDBAMa4CpVryP7BbRVGFoABZERECp8wG3QL0GXdTOg/
	 Rpnr1BH7EPlNw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/11] arm64: dts: freescale: Add SPI aliases to Toradex SoMs
Date: Thu, 12 Nov 2026 16:02:22 +0100
Message-ID: <20261112150236.164850-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Toradex SoM families (Verdin, Apalis, Colibri, Aquila, Lino) and the
SMARC and OSM standards define the interfaces available to the carrier
board and their numbering or naming as part of the module pinout. The
Linux SPI bus number instead follows the SoC dtsi aliases where they
exist (i.MX8MM, i.MX8MP, i.MX8QM, i.MX8QXP) or is assigned dynamically
(i.MX91, i.MX93, i.MX95), so the bus number in sysfs and the spidev
device name do not match the module interface.

Add spiN aliases to the SoM dtsi files so the Linux bus number follows
the module interface numbering, zero-based like the existing
serial and can aliases: SPI_1 is spi0 and SPI_2 is spi1, SMARC SPI0 and
SPI1 map directly, OSM SPI_A is spi0 and SPI_B is spi1, the single
Colibri SPI is spi0. Where the SoC dtsi already gives the same
controller another alias, that inherited alias is deleted so each
controller carries a single one. SPI controllers that are not part of
the module pinout get no alias of their own.

Francesco Dolcini (11):
  arm64: dts: freescale: imx8mm-verdin: Add SPI alias
  arm64: dts: freescale: imx8mp-verdin: Add SPI alias
  arm64: dts: freescale: imx95-verdin: Add SPI alias
  arm64: dts: freescale: imx8x-colibri: Add SPI alias
  arm64: dts: freescale: imx8mp-toradex-smarc: Add SPI aliases
  arm64: dts: freescale: imx95-toradex-smarc: Add SPI aliases
  arm64: dts: freescale: imx95-aquila: Add SPI aliases
  arm64: dts: freescale: imx8-apalis: Add SPI aliases
  arm64: dts: freescale: imx93-imx91-lino-common: Add SPI aliases
  arm64: dts: freescale: imx93-imx91-toradex-osm-common: Add SPI aliases
  arm64: dts: freescale: imx95-toradex-osm: Add SPI aliases

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi          | 3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi             | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi      | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi             | 1 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi             | 5 +++++
 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi   | 2 ++
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi   | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi              | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi         | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi       | 2 ++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi              | 1 +
 11 files changed, 24 insertions(+)

-- 
2.47.3

