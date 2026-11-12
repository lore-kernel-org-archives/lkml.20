Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495767;
	b=GwncitVAjizDqQmigr40BgkeTAFM+YYO0WMK1F7Dk24G1xAP85TvPNceU90HnfN7wNM+
	 A/ReL7Z251dbkurxbZSROTe0emNg58IC2dLSmEExWfsXgoUqhzVZP/hV6DT7hlCDRyFYL
	 V/vJ2Pm4/tH95naeglMyqjnKdFPBus2xMBA0hHS3P1o2jSlgqVzPPb66tcf4j934UxX94
	 c/0RVBeu9b7njJtEurYj+75pvX6s+bms+Zvy2VnYO3dqug1iZTe8xBME/eJO3/0CtzhpW
	 +9OfDF7hzujhorjYi5KGZpFG9vuMYIm//ckfCApSIcB3eKloIzEDa0xZgDKMHHyf8Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495767;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xmvLJrJyELZb8cY10zo4EC4FD4F0vTo2mGwICJdRtTs=;
	b=pnpAJuwFzXWQ2Jkm9WpCeAR+F2wcYOcrd32rGMcAXsRJEPEehYQQmgZMO19HutwCwu7k
	 uDLO3i3RqWfnHKAy/eoVmoCzbyoQvHMqf6AcbeXf/nIsIZ98WMcErJ3Md4G9WyBkz4Haq
	 WNQpY+WWstPR0udHMuzL/9vCdguelEtRyLNxoWgV/5ffS94JtzbilJBg2ZYA0T0spKWO2
	 Gu5bEcmTyZSn4Xx8B8oy4w1TzAskQNzloDM4rcXr/LDlmP3VWYkne2bS99JgN5u5xeRdR
	 N1fQuHZ3paw8H8YHxEyvR/0DNN9RqMpfj0zBPfs1nm05D4MBMgYxpYnvQQRjIinUFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="c7I/zUH7";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDC606A336;
	Thu, 12 Nov 2026 15:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADDC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=c7I/zUH7
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F57C231B8;
	Thu, 12 Nov 2026 16:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495765;
	bh=xmvLJrJyELZb8cY10zo4EC4FD4F0vTo2mGwICJdRtTs=; h=From:To:Subject;
	b=c7I/zUH7MjMR/q5YU6UvGZnrGGIprzYpeurMv9G7Bap6bMXnKYNs7ZqX0tYpboPlj
	 EibT5JkQWwT5ks/z34vci6AV3xNxzXrrw7F/nLVe+6hIIM9rxFqOQ0oKG1k+3iPBcp
	 XwBdDFhs7NAi+74QpkyQKXGbmJfT0DnSEZKRp45TC34GbTtAL535MZGG32YHJdbvzt
	 VAtZvI9uSmVMeCnSpcnEGsi00S1NUNNvdfSFi6llz3eLm84mId4rpHguwIvZNmxfUS
	 DV77FCj+z6V+WITVZl5W+R+xnk2SLosQhLLOPJCyf3YlM17GknaBywzGy0jlLQe7uy
	 luyHsFpYsKd+g==
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
Subject: [PATCH v1 03/11] arm64: dts: freescale: imx95-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:25 +0100
Message-ID: <20261112150236.164850-4-francesco@dolcini.it>
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

The Verdin family pinout defines the SoM interfaces and their
numbering, SPI_1 being the SPI bus available to the carrier board,
implemented by lpspi6 on Verdin iMX95.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index d13b395e98ca..d239fecd53c5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -32,6 +32,7 @@ aliases {
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
 		serial4 = &lpuart6;
+		spi0 = &lpspi6;
 		usb0 = &usb2;
 		usb1 = &usb3;
 	};
-- 
2.47.3

