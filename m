Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495767;
	b=oJcLlWp6/bsUjbqAKkNrdFQUBQwWxTOqk2Zqh9QDnJPpv5Nq0qOPIvhiuyJ6CK7Fwfur
	 NJo9YIiVdWlyNHV7Jj1NRrrG+4pxUgip8Nmk8LT722Is54CG6Xzi7gCR4ZeeCf8Q+jBAr
	 eFzhHTcp6T6zA8k1NRQBdVIfUTpLlPZS04dzrTZ775/icb6KGpAHYe+kZfLZ7V2DSWjiL
	 6/cHvFoeiKSSkJz9bM3kTuOD2XbFlgPKpK2zI0zgRAsF/SLXAFqeZHbqj5gjYKYVL7NMO
	 8T72rI/SJFK1aoGc1aeNyZ7Dbre3Jqj1tbZzsLOL8qnDdXYAxqYaMhydwtUQyLvDgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495767;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0o7zFUtmx81DYiw+KDuH3A0I0uPdMX8JtapZZwc/7S4=;
	b=2vGecXThtmW+FdclIXYiwtk3i4TbdQ8a0SB1m6RCRkRy5wSuYlflDJNMXbNjSVpDuUV4
	 Dd1awgBkFFLxq3ChF5oku4LQM5AYBMqHV2q79ebIBf4rsAyE5keGlGIv/66COJMWTaXYh
	 pEy+9XS095iHoJswq+12bMaNI40nRmKr9xewrGUI1Ou4YBDvBVUl9AXSJ8YzQQ4tYROT1
	 2whcJS4XEnsQDyL1tgDOtCs4Nc6fmHftJdOaXfu+r5coD6en4WBAZ+Fb9rW6qa4AhoQuy
	 zKdQmX74w3cvYLLmMaKbvo/CrkxijOFJ8PxiBDhe03ZZDdxmBNDxg8VKvr85KMH4nSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BL3AKPo9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4358606A327;
	Thu, 12 Nov 2026 15:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4358606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BL3AKPo9
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 14D6523185;
	Thu, 12 Nov 2026 16:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495763;
	bh=0o7zFUtmx81DYiw+KDuH3A0I0uPdMX8JtapZZwc/7S4=; h=From:To:Subject;
	b=BL3AKPo9yMyryBCX5BhmzfxiCyir9kfaobAaCP6Amp0Pxm+qNowYw+erMJ/59z+O0
	 rLSkJCbNhEOm3xca0cxc70ej/O0nihAygVT1pPKS/6bJONEWEx/2zCV8XDHWXRdlxh
	 Wjz5Ocn+HyPRArQV4z0pUU4VM88tilo6FhSE8HVeMcU0R+hwfXClPqoGbwXYv88NWQ
	 x7FJaMKST0ODaKsPfklZu6E5HfagLojO+xzOwgPHJML9oDcPRnnTc/QfoN+KEMeG6z
	 BiyuLsst0dFc04/575NpLgUdEkkunEg8J14LPFRKhpMw1tAHCM/+yXmUDrXsPXcdh2
	 N1xaS1nLN54uw==
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
Subject: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:23 +0100
Message-ID: <20261112150236.164850-2-francesco@dolcini.it>
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
implemented by ecspi2 on Verdin iMX8MM.

imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
and the spidev name do not match the Verdin interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
the spi2 alias inherited from the SoC.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1ac9d000d415..0369803a4d46 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -16,6 +16,8 @@ chosen {
 	aliases {
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi2;
+		/delete-property/ spi1;
 	};
 
 	/* Fixed clock dedicated to SPI CAN controller */
-- 
2.47.3

