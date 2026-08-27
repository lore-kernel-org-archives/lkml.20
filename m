Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997526E71E;
	Thu, 27 Aug 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815104; cv=none; b=HquZA2Zfi23H90NwFqnxIT0BgeMGLFqZ3LW17TAogX/Nntn/Lw91R7anegLtSMHRQWPrlmDfhwLpYXNKI0C/LQo84MHLtDdh2q2u85c+Up9l4sDHnHKY6QglXKXAYKEsMvRbsK2xLB8crSKQzO+NC7R5kIlR0R64FyYLkS3G6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815104; c=relaxed/simple;
	bh=wfPH8b2ub7LGcWqPqeq8mzhJNh2hMhovKdgizfshpQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DwJaBGjgC7JNMjNwd5gvKgzataO8+JQ/W+3Ha3s/2zkTj79pzyiurz7VVoJpDOkCO2dhpaJ5fEu9IijBfMr59COI3h1mch1QkrNReoO1qrMS9f2GZ/B095g/W2OwVCk9HEmqhMjkP7ctqWqvGgLjl3vyz9mYn0GWwOIcHoIIRa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=McafAhuu; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="McafAhuu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1Azb2WKUqoTIadzU7GK4R2kpQQWV3Vb3gLyKN+DoTNE=; b=McafAhuuQ3FOYd+iCpMjqfCit2
	Zzw7S3zRylNjg7AoVP5b43tXcHBsBul4zs4Tm+f+L9ikCKG48E3xKkwtYfCw4bnyzXC+l1s6Dlaav
	EnpHhSmq7e4B0TOc+ZFBcC0f9c5SL1jopRSr9yaF7YTF7vov2ycURmpqNw5bFy1anaeETuxmcyhf4
	CZGEJfCjBiMfAUi5mZnH4tnwE4apqVUxtapr2oE0827pD9UAEF13iRY8oAYkzQi8AHf1RL69oFLDc
	rbXM81xgJUwezYScBRxBkm2/JDvVvxhGfRGbNXGw1YpBM04lOUramc2BrVzlbNDM/WEfKZNLqtjcJ
	PiGtgwJQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52078 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wzU1n-00000007k6I-3E2L;
	Thu, 27 Aug 2026 08:55:59 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Yannic Moog <y.moog@phytec.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
Date: Thu, 27 Aug 2026 08:55:56 +0200
Message-Id: <20260827065556.2326079-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The dailink_master label was incorrectly placed on the codec sub-node,
causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
and frame master with SAI2 in consumer mode. This contradicts the SAI2
node configuration (assigned-clock-parents, assigned-clock-rates,
fsl,sai-mclk-direction-output) which requires provider/master mode.

Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
with the codec operating as I2S slave. Also remove the spurious clocks
property from the codec sub-node which had no effect in this topology.

This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
PEB-AV-10 Audio/Video expansion board.

Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
index bb740f845855..8957b24a7ad2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
@@ -77,13 +77,12 @@ sound {
 			"MIC3R", "Microphone Jack",
 			"Microphone Jack", "Mic Bias";
 
-		simple-audio-card,cpu {
+		dailink_master: simple-audio-card,cpu {
 			sound-dai = <&sai2>;
 		};
 
-		dailink_master: simple-audio-card,codec {
+		simple-audio-card,codec {
 			sound-dai = <&codec>;
-			clocks = <&clk IMX8MP_CLK_SAI2>;
 		};
 	};
 };
-- 
2.34.1

