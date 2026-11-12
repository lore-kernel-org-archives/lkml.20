Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495770;
	b=yvuxk7p6X9OCMT1RL7FBFFmiBb/8SGLwzE0we1asTAfkss8iZgTDcY2Ekooxffqw3LDt
	 S/z4Q210aaVsUUYbyxOsraQLpmjEP9oO/+8FsBUDYhZ3ALncIQ8erzLp0gE5SNbIusGyO
	 z0Q2eFTQY9A7rl5mVs04pbB4DI8cucR6rkl3QD8ZbR1wg9zcsSEBLtKmoCu3iWIovBCSc
	 fH3fsTJFDy3nptdVqaX6yImP8p9Y2wNaBUIkGE4B4NN5TBoRTfYSljHsQXtcwXyQiDL3u
	 CRwrtJpeh1f5foovosTX8KPi/87f1+OtluOKPPtNL9dH8R3sNpumTOorE/hrfgFXrlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495770;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2uOiyb+Q8M216uUXx952IJn6ffOrIl5bI86rzJ70cYk=;
	b=cfZfq0I4suELXyKfF87uLfXXUnJ2noBjKiRh4ZIJjyL/ZxcW5GGUxUpgMviDCRTDujAx
	 bT869JSnD5BI5U66FdN8ub+7TWQ3fS1mTm88kMX/n48dUA5Fs6YuWGthBmIg+k8lXyNQJ
	 Pf1+wwIXDYmSofvVfP2VU7k7KAzL1G6LkbtlPiJ+MHInxOUN2aYlzDztY0ODQIFu+M0hE
	 KIb4o7jL3SYFNJ5HMKz429gYBD65w/0QiFOGUVJbLM31dUtIlVgSbcTWzZifG8wlKumMu
	 EzQCZx1GoT9n4d1ZMrfenwkthvQh9BFc4P9tid6XP8x4lBN25LfNppAOAJ+I/LpmtWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oJRTTFCJ;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB260A2618;
	Thu, 12 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CB260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oJRTTFCJ
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AA0AA231D8;
	Thu, 12 Nov 2026 16:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495768;
	bh=2uOiyb+Q8M216uUXx952IJn6ffOrIl5bI86rzJ70cYk=; h=From:To:Subject;
	b=oJRTTFCJ6ymHL57mF0t61n2pua8y/wVHTmyEMXPEHHX7I5kmswZOYVGWFkPjELho5
	 YVRa/DhbTS9ujQm3TbWT2JDlUWVZItbRhBfVMecxXZ3Dw+bdrfCCF5yM+WARy2tJZg
	 ceK2ZDk0jtQghiz2IWNmxQ7RL5P7Wj9r2uCs8DCKwSxavfDRp8+VaQ3hOBAvCdEW8M
	 7Q0EzYvQRImUbpHo/fPT14OPTQAM13dKEr7/7tLq1S0E0N6nXQBMzUvnPH4ulvgLr5
	 aMuGb4un+s8R5B6Jcc26UwDH/cdUAZPsLiryFlt5NfMx+gycheEJy/gUkkyI3xv94o
	 8XzoTBLMBTqGg==
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
Subject: [PATCH v1 07/11] arm64: dts: freescale: imx95-aquila: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:29 +0100
Message-ID: <20261112150236.164850-8-francesco@dolcini.it>
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

The Aquila family pinout defines the SoM interfaces and their
numbering, SPI_1 and SPI_2 being the SPI buses available to the carrier
board, implemented by lpspi6 and lpspi4 on Aquila iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
Aquila interface numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..e7c20dfffd34 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -31,6 +31,8 @@ aliases {
 		serial1 = &lpuart7;
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
+		spi0 = &lpspi6;
+		spi1 = &lpspi4;
 		usb0 = &usb3;
 		usb1 = &usb2;
 	};
-- 
2.47.3

