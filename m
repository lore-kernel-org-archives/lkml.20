Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64264477F4;
	Fri,  2 Oct 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931760; cv=none; b=trQNME69gUj2yci9Sh+0gUyj6JIGDbbPiYf+7i3w2jleqdQO+GnbHccDoKLxYA9tptqckKHfvG0ADPTLkKpr8LsPjil95VmDMwpaktjfA9EXiI6maGeu91eMX9npwVxCkmiqc8vVcstlQGWFeGVnhywDZTzj0ABoE1PTAL8nhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931760; c=relaxed/simple;
	bh=McE9YnorQBQgu7XJjTQ1zhUZtE5g4ZLOGfzXTBBV5Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQTz+OPSDTnuoJjXQrIOFNqiz9+1mUN5siSFiQigIN7lM54JPt1eTHrmbPNfQBAFA/Bv2zVZ5KqEDwNFw2a7UXqX5Ijn6ZfFgSsD8QpPz8dnwTkEc3kN/ekqiA80CtkV8pKy55fjTO/dj2EnyQCU2gvYi/0nA1cuduaK/Pc9AMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=HD0syKCx; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="HD0syKCx"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4365D1FA8F;
	Fri,  2 Oct 2026 11:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790931755;
	bh=OfgMEUF+Fw0qOI2z3NuCRJaeDMkJbrHyQvlbCPr4av4=; h=From:To:Subject;
	b=HD0syKCxyO7pI/3K1fG+TXZMhYEcypAIjoZCL3siMyKIONN2VO6xeYJmdn6zhzsny
	 DYgpcRHZWwbi7M5c/s0RTFY6Nz8BGRabzH88jkBZUlUxcMwvhSNBHbG5syd8OMooyi
	 GgRd9I61fTQ6CijkphkJZdtbk4xGnZROwS8zQSsjc7R0N8Ww2JIXgNiHQHCyjB6lm6
	 fxeAiTfHkvxQrsWkshN20MP4WIunj6ZrtnvWPN2xexwFfqJCSeDrKvFaBTVY9MMNIi
	 urXgT7KCYO2Ri4cMyrhm36i2IaYcRi3V9rKnOxz6xAuoLcmTbog0prIccHleMaOTux
	 FZUL37p2123vw==
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
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-aquila: fix i3c2 pinctrl group node name
Date: Fri,  2 Oct 2026 11:02:27 +0200
Message-ID: <20261002090228.41445-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002090228.41445-1-francesco@dolcini.it>
References: <20261002090228.41445-1-francesco@dolcini.it>
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

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..287b7bcebc73 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -932,7 +932,7 @@ pinctrl_ctrl_gpio_exp_int: gpioexpintgrp {
 	};
 
 	/* Aquila I2C_2 */
-	pinctrl_i3c2: i3c2cgrp {
+	pinctrl_i3c2: i3c2grp {
 		fsl,pins = <IMX95_PAD_ENET1_MDC__I3C2_SCL	0x40001186>, /* Aquila C17 */
 			   <IMX95_PAD_ENET1_MDIO__I3C2_SDA	0x40001186>; /* Aquila C16 */
 	};
-- 
2.47.3

