Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8BC4E3245;
	Mon,  5 Oct 2026 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221194; cv=none; b=bU6UYlZI2nj8VW2Y/YGpbeVPxYdFANC35XeWerKP0YsnBVTEayliPhY/VVllaiT3ryg6Zod25UrL56Qj26p+epYUSsX8rmdKkIdIV2zfw4ZbpR+YpWswJFNy95Ew169NSmYGGAS/kGp66X3vZvvkOpqo7EfQSYHnwKnrR5WdXVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221194; c=relaxed/simple;
	bh=AxQ6T0ZhjiMUCwi95ktpW0dqw9L2u7jvJeT6sJk8hI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7PYo8zjlBpEqlxjYascFJkbza7LVaccQkiaWXNays6BpWnu0jhlnGl5qZveruz/5ZvknpMLBF1A576aA4W3Di1eaMn1A0UchEb1/38l9MpCkPVmeKiUpcom1fxpfbJEzsGphe/05rDWH4loJHCe9CdOfFTYRWURatH8NfhXWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WZA4Jqe4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WZA4Jqe4"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9A6222291E;
	Mon,  5 Oct 2026 19:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791221189;
	bh=Vo3/R/UpUzh6/sfdwtuW9Y23N0AJmticKut7jC50Xqw=; h=From:To:Subject;
	b=WZA4Jqe4L2sP4O+dt2hMr3GY0I9p+xGwrYYBVRk8c0bdZzNQ4QCP04V77ybzIM2bp
	 aPQ7H81Oo8qL22pZ42aEY03qts2TDxUF7v+hGRQZ1aYY/mLBQPRveMYBIs1ioYoLks
	 Im2LQAiL9LPFn6X3PwHCWcXVkgKVrHlyEsI8FbYWGxuuy56Is4m0M+MQlFoHpnt/gO
	 JckwQZLRpRjenfwtCT1xJ8B5hW9Xx0prAaWld0PIPgNjysbS8AauSpCC+0WwMOGl1h
	 Ygy0uvweR8fpgTWLtl3MhtapP1ZUKhNdI3NetyJQH/XwrvUYzJKVbINiaQhFR97aDK
	 6FBjU5gI+5PEw==
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
Subject: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Date: Mon,  5 Oct 2026 19:26:21 +0200
Message-ID: <20261005172622.135725-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
33.3.2.184-186).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h | 6 ++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi      | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
index debe6ede2d70..72cfe7893af8 100644
--- a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
@@ -307,6 +307,12 @@
 #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPUART7_RX                0x00A4 0x02D4 0x05B0 0x02 0x01
 #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPSPI4_SCK                0x00A4 0x02D4 0x0568 0x04 0x01
 
+#define IMX952_PAD_GPIO_IO38__WAKEUPMIX_TOP_GPIO5_IO_18               0x00A8 0x02D8 0x0000 0x00 0x00
+
+#define IMX952_PAD_GPIO_IO39__WAKEUPMIX_TOP_GPIO5_IO_19               0x00AC 0x02DC 0x0000 0x00 0x00
+
+#define IMX952_PAD_GPIO_IO40__WAKEUPMIX_TOP_GPIO5_IO_20               0x00B0 0x02E0 0x0000 0x00 0x00
+
 #define IMX952_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1                 0x00D4 0x0304 0x0000 0x00 0x00
 #define IMX952_PAD_CCM_CLKO1__NETCMIX_TOP_NETC_TMR_1588_TRIG1         0x00D4 0x0304 0x0494 0x01 0x00
 #define IMX952_PAD_CCM_CLKO1__WAKEUPMIX_TOP_FLEXIO1_FLEXIO_26         0x00D4 0x0304 0x04AC 0x04 0x00
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 1154b66dadb2..4930e09e0206 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1076,8 +1076,8 @@ gpio5: gpio@43850000 {
 			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
 				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
-			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 6>;
-			ngpios = <18>;
+			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 9>;
+			ngpios = <21>;
 		};
 
 		aips1: bus@44000000 {
-- 
2.47.3

