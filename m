Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC941DE11;
	Tue,  8 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875611; cv=none; b=dFqwGpGy2x2uXv4UMyHQ5K9o2BzQSgCe1O7HP4epdbhMCZhU1lqDfdWmK0u4iBjiYh8/T4EPH0xwEbs1SEU7q423wKXgw740+ZXQqp1tu3goZGZ0W37qYtTOhq1QoG2tFj1U7tN86H/Jo7+gbYAlqMVkWdnsmLOiIjOnLlgt2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875611; c=relaxed/simple;
	bh=BuSi3lmhT77jdjyv0iyH89J76a7EbR1uQ5po35ac4pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AadyRjyRtR/7oFLuFjhX49oBIUo4yuC1l3vhSc8EcpQBxWWdkEbEquKySyk3GqXWrxXzkBfoe+wjlaoCCBimxNi+GXzTTwHyd0JMTRHDAcW/GIddlEjOpwakWGpkG9lMFxGBXbPx+61QQZ75EOZB8d4ToFUh5EpsT/U2/ubgyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=2i6Kxo8z; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="2i6Kxo8z"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4r9BLRd4S6GyCmxX0tVaI1kJc+BhsFxD4BdobYPRrc=;
	b=2i6Kxo8z8T2mdCvSKqHiA31Ycex2ZF5Ha/q/hx2Ncf5lpzInAwIyv64YdEpZUg43fb70ag
	J72pupOgdSl6laI1wskBdQ3xQZ4Ul+ZAxCVWYiMwfMx12e53OJ2N7fZyUCGdwQOLwxG55V
	gbjzgAn4RhuLhfpsdcAoiJRPFjdmtGkGcjlI53PLBSOT97bOdEKc0cLB3+VJ9CoOwfgonI
	5BKbf7dHRhwbQsluNGxMXmTyuBlFwWXYQL3OqqX001cDYEOyleTK3/WGfuPRYsveigWUf5
	ojeSKuXeAWburAwKlbdltrzvaiYLixm1Gjx/t0UehdxLsZO7HHjiW22QFE8XPQ==
Date: Tue, 08 Sep 2026 15:51:55 +0200
Subject: [PATCH 8/9] arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-8-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=wxmv+3IKiPf8etyakSY8wg6YcKR53nL3E6fskoVc0yE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsLPQ1Uku1u0CUitZGAtNns2a4fXtx9+Dq2cXXl4t5
 a8ouT6to5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJf1RgZZm+/4bj0oG3bO/Ht
 kQvWr2Je+LzU80tq87evjpV+3k8uajL8lba07Pfa/q/sn1ahUQZnEc/ft9cvRtTPXJ+XZT79R1s
 JEwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Recent board revisions have an EERAM chip populated. Add support
for it.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index 72588af057d2..27bfad56dbe8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -123,6 +123,12 @@ &ecspi3 {
 	pinctrl-0 = <&pinctrl_ecspi3>;
 	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	eeram@0 {
+		compatible = "microchip,48l640";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 /* ETH0 */

-- 
2.55.0

