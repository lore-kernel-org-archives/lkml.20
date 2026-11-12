Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496140;
	b=0OOl24EhvM6/f/dYENIT3j8q4FemNKngtNDHxb986lfBy0+Rc+J2eEAcrDtTiRX9bkVX
	 YlfVQYLHQeQqE/SH8ivpr9AdTTpMaHWhmUhMxvhm7279RfohZy15KtmSCbZMasGJ4a9PK
	 vJ318bFloSSERUWq8yOdmZTQCO8lVrDtTdS0JnmEKXFNyudkSmv4OrWV6n7RK1zY0iNKy
	 32k/Ek+xOF0l/uShhbekAaGTGi9LPbTd3VByRl9X8Nq+zWXDKGt5LjGIgvzUwEFi0K9qH
	 cYvPXLpTrwHOX0GIMLbIPJbL6ZfSyRWYOioP7d5yevxnMqoQc6tyh1oNOB16jNOPQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496140;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8wiql50cDD3qNYqOz1INc0Pqx78ED5IM9pXLG9SklOQ=;
	b=d7Gr3KP+znwPcvZv1/yExBII1/RMvvVKKlFTLoHb+jP3VWaXaLlEkNjFpEzD7TUmsFG8
	 p8Z2erS7hUHrPUXtGZxmSbWGKrzxR9qd39bolY5gmyivJRUBNeEPu9CbrdpKuHycqafet
	 1cETgNmINrqwL7MN8a+G/uyfNjMJi6Rzoh7l9nUFGLGfMTZGq5cm6bXlzT+U8kwYq2dju
	 EjlFiehQIx8tcY198HYoiRI6fE6WR6T1kbrL0e1bCfIvKbtyt9Fa3SH2rEzoQUg3l2jXA
	 t0uAu/CkySh4B5/8P0setAEalzolZNzATSPTjSZGiZaQZS+BIQj6M14HADj1BPMS1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oYHepFWK;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4AB606A323;
	Thu, 12 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oYHepFWK
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3EF0F23161;
	Thu, 12 Nov 2026 16:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496137;
	bh=8wiql50cDD3qNYqOz1INc0Pqx78ED5IM9pXLG9SklOQ=; h=From:To:Subject;
	b=oYHepFWKdUOJ+ttxcB7+HifK5JBgfu/7WJNTO8WVLzOG4OWjNbIO9h7ZzPPlSwo+O
	 QoS3aHp3ldFZIzN0wKRyijYAzCng9DShNGAnkvhPFBO2AKxkNPOAk1xunYmWVfXION
	 M3FjBLOFGeOnhKXoE/fu6tXov4lI+HGid5MmHTARU3hwmDyt41DvTcoxIwqBuZeiF3
	 kbub8KaetEHoq8SjwlJApaBFB1/ItSLVIygJFKtddleQUTyCoiI6HqjEhqFKLLiGgp
	 8qxOxfrfodYVy7N6VObQPmiG7bebwwYWPOVJ6peOhDf7XIA1atp88jIXHUj8PISX7l
	 xPjvC5CAk2kqw==
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
Subject: [PATCH v1 0/4] ARM: dts: imx: Add SPI aliases to Toradex Apalis and Colibri SoMs
Date: Thu, 12 Nov 2026 16:08:44 +0100
Message-ID: <20261112150849.177133-1-francesco@dolcini.it>
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

Toradex SoM families (Apalis, Colibri) define the interfaces available
to the carrier board and their numbering as part of the family pinout.
The i.MX6, i.MX6ULL and i.MX7 SoC dtsi files number the SPI
controllers in SoC order instead, so the Linux bus number in sysfs and
the spidev device name follow the SoC, not the SoM interface.

Add spiN aliases to the SoM dtsi files so the Linux bus number follows
the family interface numbering, zero-based: Apalis SPI1 is spi0 and
SPI2 is spi1, the single Colibri SPI is spi0. Where the SoC dtsi
already gives the same controller another alias, that inherited alias
is deleted so each controller carries a single one. Where the SoC
numbering already matches (Apalis iMX6, Colibri iMX6ULL) the alias
makes the mapping explicit at the SoM level.

Francesco Dolcini (4):
  ARM: dts: imx6qdl-apalis: Add SPI aliases
  ARM: dts: imx6qdl-colibri: Add SPI alias
  ARM: dts: imx6ull-colibri: Add SPI alias
  ARM: dts: imx7-colibri: Add SPI alias

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi    | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.47.3

