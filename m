Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59414C14E5;
	Fri,  9 Oct 2026 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552363; cv=none; b=NIPy6NkpD0anI1O1mlELOgeDRH0CQ6wtRwYeAEQ3imgP6xCNgiKjkZQJCr7G73+b+pdqD8Asz30/b5Py3j9IGAJD3xRwz23b3snaMHxiX/03Vow7fvnHJdpOpfxbnkNlOIqvsHIoZiG3XzFy+icawpbseI2mlxIzliL18oyiK88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552363; c=relaxed/simple;
	bh=9y4Qy7nr+YNJyTSxvOFc+GX0O6YjvToJfnBspewMO3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0wZ5v7+FV6VgRAq6tIBbmhHEqkcbG37Xrdm3gMS64Q4O0SZ3Uzg5aXlotSkd1y1PWdPG1kdO6odoi+4Rw2LPdBT6tIZCDJQ7avl8dWQSooiQcPbwDL9PaceHou0VEf+py2ynztH6oltLpjm7qNkvOWJtHQBlzPoJa0NO6J9FTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=lIGo8bBr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="lIGo8bBr"
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id C63E01FCCB;
	Fri,  9 Oct 2026 15:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791552359;
	bh=agWwGHXgK3UuChHnrrojdFSSW6O1V9Ukr8rkgt6PGR4=; h=From:To:Subject;
	b=lIGo8bBrCKTKfhfYSf9QZ/9JZOIAKXtPCe68uTxF7jbjoLY1kme2FGOsaARonQXZ6
	 Wig0yuePcKbwCFw5w5cUBBwElBhdnWx2cyzJ6n2va04xUocr4rRAaqW0k7Ei96k0vo
	 vrAr5RK09si7iygjrulqTxIburt8T0YfK5dr7fTg+iNitVfFN0fbRftgEG9CkkcjBM
	 qDpIkwWs11eZOPm4udyXc/5yIJqXQdzTYiqdg9Ob5gJLzQYFy8cI2IIyKXva76NE45
	 U5JNuHVHx5y5gTF1vKDsL1B7e57DMbP9Rg342sjg7uEps8Lv2ckjh5cn25m3IU6Ph0
	 uVqBNeq7K7yHw==
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
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Fri,  9 Oct 2026 15:25:48 +0200
Message-ID: <20261009132550.20793-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009132550.20793-1-francesco@dolcini.it>
References: <20261009132550.20793-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct USB_A source PDO from 3A to 900mA.

The USB_A Type-C port on the Toradex OSM development board can source
only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 566671b32308..8bebe4d8afa9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -207,7 +207,7 @@ connector {
 			power-role = "dual";
 			try-power-role = "sink";
 			self-powered;
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 900, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
 			op-sink-microwatt = <0>;
 
-- 
2.47.3

