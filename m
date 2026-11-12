Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495769;
	b=Ls/np0HPWidLgcYMAz4Jy4ftuR21sobtDMU3Z8txh492xyCHZKmap6H5LF6SgAcgRhE3
	 ReSmCxmngyt4Jj+LQNgnpwcZs33INE9H4V2K1a/pXQn0CmXjXp3FO5wE5uSW7fpcmC0Y5
	 nm3rEjNUSITqs84IweVcpORwdj6VgpWpkcW8w0TFFpsRva4dMMPlArB1NIIwKCAQ/QR/W
	 CyIfUdEMq1LWhrBZsnm+0/a9k74eW/PkrzHqGg1e5MpO+3or4cmPhI8V/8swzUnV25D0F
	 D0UGk2LoV0EqyLiR/0XJgdszwZW7F6EtDdeCR7oKGZj4M5SeC7WwuCfq2Gg1mzXhNMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495769;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4jpLVRFQoNAIkhODHr7p9v0q04cK4RF3HI8eq390V6s=;
	b=tRc0SPCk+SSnJOutlWlCt9jFM/OcBo3kOZ0FuWIAwdBVe4G1BFlOiWh6Wi4Y7brepwv+
	 4BEdSGe7OxfXJwXvnEaZ3j8VFTfSu19ljaY9CDGOth+PaTcK9E44dU9aMZq6cKJuIYp+y
	 RF4LNKqTFA7L5QezaRxXRDNAZKg4BSRa5rL06saAFQWmjxj9CLW+Kv/RSp31aATyBHPdC
	 mJKD228g14Kye0qgkhsR2q/+grlGALH+fBtxiYoZo95tyGVST96IgLL0Ro55KeO0vMjEf
	 GIF/rTUcM0Lmu8W75oshT2c1ODLfwQIjDDJqGUyHFTQTHbvlCEUBiVf2QPGm6JizSlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=nc15KgJy;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B2606A33B;
	Thu, 12 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2B2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=nc15KgJy
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EB0D1231CF;
	Thu, 12 Nov 2026 16:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495767;
	bh=4jpLVRFQoNAIkhODHr7p9v0q04cK4RF3HI8eq390V6s=; h=From:To:Subject;
	b=nc15KgJyc2W4Ajnos0nO/8naGQVob/LefsLMxis0LP2PVxUaVozmHssDQt73bFwrs
	 H3ui8UH7oE06l/Ct/7NIABBQfviJtKBTHuUJNw+qcej/CDCgADZHpw951sQfGNUtL8
	 Vbu01JDxLJQjBmF4HCETiGKjOcaIgMQLdneVuToQYhqqwHm2sobH05fiRA4xjpLAF2
	 B/JFZRa5J41TliAj0YkBYrxOFSBMA0zgpDFUcfH4rqKNGk+ZaX6ij0M47qfUJA5hd+
	 KlAapECDnDK8gJpY/uuHaos5FMG3Ktk28bBNBprEP1eNu5LnR9/GQC4M5vumqhJ6Rv
	 amRvuBI6rmmhw==
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
Subject: [PATCH v1 06/11] arm64: dts: freescale: imx95-toradex-smarc: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:28 +0100
Message-ID: <20261112150236.164850-7-francesco@dolcini.it>
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

The SMARC specification defines the module interfaces and their
numbering, SPI0 and SPI1 being the SPI buses available to the carrier
board, implemented by lpspi6 and lpspi4 on Toradex SMARC iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names match the
SMARC interface numbering.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 671c4dce0a99..82e21986bf95 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -26,6 +26,8 @@ aliases {
 		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 		serial4 = &lpuart5;
+		spi0 = &lpspi6;
+		spi1 = &lpspi4;
 	};
 
 	chosen {
-- 
2.47.3

