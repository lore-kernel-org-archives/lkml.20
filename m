Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050262F7EF3;
	Thu,  1 Oct 2026 01:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817164; cv=none; b=pr332Xk8i6y3S7JtLc1xYxt2qLV0Nmtf+TGweuD7xAf8bv4rlaWxlLgm7sVhJ9Y/aJaHTh0AgPlP9sGO6Dh+s5TpljuIEk+iHIzpNrxIGasYrl3rkA9jYBbYhB2+XKMRKnalFFGmpiyceSrJd6ywo+yLtcX6zpkwZ0BiYiBfAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817164; c=relaxed/simple;
	bh=IPlLuP1Jfv/shZSUodew6ZvCNc2dBputZy09P4vmYaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBSHsheBAAfrVxOQ7ofKzudwDm+f8PkLu34Es2u/iJ+wrYYaXaUKz3n5weqVCy+hbQLYy5u5arCOx9Z0pGcxBGiu3WXw22pnxj6slHW25SuP9SrzWKKF1bgT197MGxwH7qFmBXI6wCWXAL/wItb2jgJTvgrSGH8Gp43as15anh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM6RGH2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM6RGH2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42F71F000FF;
	Thu,  1 Oct 2026 01:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790817161;
	bh=acsKLoL715zw971OMSfoId5cJwr49Nq1L5jIBYkpQCQ=;
	h=From:To:Cc:Subject:Date;
	b=nM6RGH2vwmTbwEmc10UCR5TMq+4WNGGj7M05aBTv4oByfBZTWitBqvq04JEkawpY7
	 3Qvl9qmdRiJDCWXxPs/zdeRiDEZTIJO/jJ041/I/XOvOtV36sDttLhT5RULskbQMyd
	 w5rm4xHd2Gb90L/L3f1cfZp6SSS/Tt18jOqTt2J2Nc3OcKL/8/S8V4r59RecFNZ0gP
	 EJ+HiljYDteOdTGaS/S5cCCbUe8HR26lGK5u5oS0QYbwCHfWnj5IjgNjeVTZaeyzfN
	 oTN20rE355CWL7GpX+LJdr1/Lpxaaza7WQehyzuXUrdXVYjLHWZFXq0eIJa832g6o4
	 G9rNZLfCY5MOQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: Drop undocumented "hardware" root node properties
Date: Wed, 30 Sep 2026 20:12:31 -0500
Message-ID: <20261001011233.1306251-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "hardware" property in the root node on some NXP i.MX8 boards is not
documented. We already have both compatible and model property to
describe the platform.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts    | 1 -
 .../boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts    | 1 -
 .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
index 6cc04aa90f21..d15297a42d8f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
@@ -12,7 +12,6 @@
 / {
 	chassis-type = "embedded";
 	compatible = "gocontroll,moduline-iv-306-d", "karo,tx8m-1610", "fsl,imx8mm";
-	hardware = "Moduline IV V3.06-D";
 	model = "GOcontroll Moduline IV";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
index 39b7d9077e8e..9148ea7c6609 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
@@ -12,7 +12,6 @@
 / {
 	chassis-type = "embedded";
 	compatible = "gocontroll,moduline-mini-111", "karo,tx8m-1610", "fsl,imx8mm";
-	hardware = "Moduline Mini V1.11";
 	model = "GOcontroll Moduline Mini";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
index 87b20b856458..206992ff9640 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
@@ -11,7 +11,6 @@
 / {
 	compatible = "gocontroll,moduline-display-106", "karo,tx8p-ml81", "fsl,imx8mp";
 	chassis-type = "embedded";
-	hardware = "Moduline Display V1.06";
 	model = "GOcontroll Moduline Display baseboard";
 
 	aliases {
-- 
2.53.0

