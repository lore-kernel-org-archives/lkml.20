Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362AE440A2A;
	Fri,  2 Oct 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931759; cv=none; b=Q1ZOeuAHMN6QK1KgllcibuFvpbAjj3EtPXfKAGHOrqbSlvMPlLC6Ld68QKz8BOHAYRmni9EuDtsZyQ5ajmb8DpoUxY+o0G5AYB1v0OFNDDReFmViMtoXTFDEL1V9RKNqa8i35d7r/SVyfrIoHe8YNU9uSb7Q+g1N78ZM8M1pXi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931759; c=relaxed/simple;
	bh=EUZMzeE8aTGLPVvmApzI0LJn0d3PcyE3HLOkhnFnpWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+lJZj4f1cguFAbb/h5mgxjKPZg61JpIKxJnZUIOAym/+rBBRwTjjKzAS8k08dm+upr/M6zsZNDZM7wYkBB10eecA0eSFgNaFBe6LEUBHMgCNi/SmecW8DNZTEaPuRovC0YaBXT4YC24ZCiWimLJsR5aypbzoGYO1cOvgLN09i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=sDAMM/9N; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="sDAMM/9N"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 823361F9DF;
	Fri,  2 Oct 2026 11:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790931755;
	bh=vTrPIy7aWRXBUbeHijtecr12Tf1n8LqaX94Hrd0A9tc=; h=From:To:Subject;
	b=sDAMM/9N2/6bghZkVkdlySyRz9p204424Lf5rncE4Cvyn/D4qoHTnDIRudno363dE
	 Y5gwgoSPqPwoiOfSS1/Sp2zFSt33GlQTVWB8DNVjnHXWWX9qXYOXXPEyKT9VkUD3Jv
	 T90I6aKSc0f9oWrvof2FoAsOgLvDUuhOO4CAjtA38JzQAgJU5km0xChb4HxYaak71I
	 JsxQeV7kTWtAPJW7u3qMzrJ+2y2DuY7jF936AQ5ldYCkDjMj1ywpcI1cSAKVggJash
	 uAn6Ekb6j7JH9sJmcQvOVeapymO1NF2Mku2wau6mJ/n2BXubCrJR7s514K2yFSkczc
	 X+gWeiDN74mEg==
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-verdin: fix i3c2 pinctrl group node name
Date: Fri,  2 Oct 2026 11:02:26 +0200
Message-ID: <20261002090228.41445-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The pinctrl group node for I3C2 is named "i3c2cgrp", with a stray "c".
Rename it to "i3c2grp" to match the label and the usual naming convention.

Fixes: 676d7ce22f00 ("arm64: dts: freescale: Add Verdin iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..3176765a1472 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -892,7 +892,7 @@ pinctrl_i2s_2_sync_gpio: i2s2syncgpiogrp {
 	};
 
 	/* Verdin I2C_3_HDMI */
-	pinctrl_i3c2: i3c2cgrp {
+	pinctrl_i3c2: i3c2grp {
 		fsl,pins = <IMX95_PAD_ENET1_MDC__I3C2_SCL	0x40001186>, /* SODIMM 59 */
 			   <IMX95_PAD_ENET1_MDIO__I3C2_SDA	0x40001186>; /* SODIMM 57 */
 	};
-- 
2.47.3

