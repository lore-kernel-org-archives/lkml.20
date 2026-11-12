Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495773;
	b=uG2L23IYUiLXrC4D6a54t1vGURlse4qX2X9Xk6QFT1um7343SAZnCYFsVQhNF3zyoNJK
	 5z3M4rEcTXwShFShl70335Gak4o2CFDgZIHIiVF3fxGyTsuucnsQJl6SrKWb+a5PG/gF9
	 IfOGn5W5DogXE9CjMJJo9wAcePmgaP2zekoJRwc6ajE6UYX+4wY/N+QWbhlSSmIvzOMel
	 /4IwKMGqX90MCQ+vFpNYeCvBKIKkf61zA60UKEBzf4uQzEFJWxP3WlH6GLEW1iHkThP9P
	 T3vby7RghUP3X437q66ZIhq4r/D72Jmck73TRes+lrQAS4W0SeAbAO9w62GWFYk4R4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495773;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ixcj6PNq9GxugAmLZbG5bwGiWeCce+wGaPCQOB8zgAE=;
	b=JlLDQsqa9nRey1ybH6rupsvQERqkRu21ursB/CmlIXkYIYAZE9r7/KDZux42TXvCsDhk
	 8WvvfW5qU96P+oqTGydtnLpSaNR72BEdrAPR/C9cleFqCnoV1/mRA6SMm0A6ssJCXCTt2
	 X8iZ2U5VWTSd+hG4P3315QUrY7FJXUTjgi8PFFz1sNL+N7UBsLdvLgzWmLS7pJ8XLTIl3
	 x19uOC0A4mvXJJ1s4Qh8jNH30bP2jxUK0SCpTpDQRHHxdMbCuG41J6pbRYPFiSkrlB9aQ
	 Wcpf5ZyHmY4a0F33KWTPf5Jd3aUDB3HeYn+DzxaZOXZBw3hp23sbZYclg/sEcPcwnCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EzyZIlwT;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A5360A3837;
	Thu, 12 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A5360A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EzyZIlwT
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B91E423217;
	Thu, 12 Nov 2026 16:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495771;
	bh=Ixcj6PNq9GxugAmLZbG5bwGiWeCce+wGaPCQOB8zgAE=; h=From:To:Subject;
	b=EzyZIlwT/mow0+EAlGqUhjrokW4rsCObajWVJXNA2QkM/m+z0BFHrRzVGYlxdikMp
	 hBmQHsu6uUZtEM27h4mrO07vWglFckUbcimpKBDm7UYXCIQOmEOV7AREUkcrcSuHSo
	 3wN7d1VEtLxOrUfll1iJDxNpylABcPMKDyUsExdn/aA0E3tDZrTiaCzqFAdQwCDjz9
	 U5fKxDKf4RxwaJM+GtLfCpMl7xhP4dvugByup3BOogf84IGz0Lc/OCZIpU2ZyHaOA1
	 KuH0Hr4ef12gZ3m4/e3b+qVnC+TI4/Af37mOXtkInNh72EQm4I+kUF5lJIfQ+p0X4n
	 gWavjqiGVrdGw==
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
Subject: [PATCH v1 11/11] arm64: dts: freescale: imx95-toradex-osm: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:33 +0100
Message-ID: <20261112150236.164850-12-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
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

The OSM specification defines the module interfaces and their naming,
SPI_A and SPI_B being the SPI buses available to the carrier board,
implemented by lpspi4 and lpspi1 on Toradex OSM iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
OSM interface order, SPI_A being spi0 and SPI_B spi1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
index 8eb7ea4ed9ee..dc2ef7035246 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
@@ -30,6 +30,8 @@ aliases {
 		serial2 = &lpuart5;
 		serial3 = &lpuart3;
 		serial4 = &lpuart2;
+		spi0 = &lpspi4;
+		spi1 = &lpspi1;
 		usb0 = &usb2;
 		usb1 = &usb3;
 	};
-- 
2.47.3

