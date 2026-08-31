Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F23ABD8F;
	Mon, 31 Aug 2026 05:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788153154; cv=none; b=JjrIgoROMJtT+oCd4301YM1VQoYpuIum0t4hFlwsDW8hcIbgx7rgxemrfAZDB5YCtzl3qQvJstrDaEkLD49xaLcKArnamYuV38B5DJccvQFJM3bbBmY7/1DvtHuFw5LSjtYQJHxp90WSYwoZbs8e0Ot6EU5fNAqCkvh+06DZimM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788153154; c=relaxed/simple;
	bh=HjlOtZdFwg9I/oSnYjgnVnvJi1+nRljsLBVZCvAbE8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K/5yAa2KN1ev6iu2RLK/t8FhYJ6cHfnrg6XbK5bNnH++dZ0Z0nl+pShFasYlYpnL8AYGUNYM5hTzsb35+Vi5O0MueOv8UXFgYIb1G52S63yrqxqdSmuWEALkcNXLpeZ0LLZ/E+Gk2RHTI0zU2BbTnXH7Q4nIbPhEViQUCyvLFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=JjCkre5+; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="JjCkre5+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LNImmFjip9P/lpVaILAS3dMs8hBJA59yRwTTGV2O6BM=; b=JjCkre5+7Ng6EJJDYTNraLsDVS
	ZWR2oLP146b1aJTftdwZbzJiRzw3NqXVEaHSj5JcK7J9STTpsZCxyLXlGhS6Ute/HkFice9+/g6NG
	zLmeqkLjqXY1yskw0atRyN+iGDTONfDyeAi1tVXC3wsdJF0AMdI39x1WmWAZGVk3pXY9FRe+yU0kO
	vwjQYLkdU/JECoX9vqFwbVpThBAd2BKOU3XerpuYAsFv1qZKZafu/79F3sKEz8+u71wgfXqJrezpN
	Y+aIWfXeflSp2XCxtSzagEhNwo38vE7nF7Fk1Le/P0+Xjh2TaNHZkHnOshOwz/oq4F2q+58SpHTJP
	jaVSdfmw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37886 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x0uJl-0000000E3Ph-210B;
	Mon, 31 Aug 2026 07:12:24 +0200
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
Subject: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
Date: Mon, 31 Aug 2026 07:12:22 +0200
Message-Id: <20260831051222.3298730-1-primoz.fiser@norik.com>
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

The dailink_master label was placed on the codec sub-node instead of
the CPU sub-node, configuring the codec as I2S bitclock/frame master
with SAI2 as slave. On this board, BCLK and LRCLK are wired the other
way around: SAI2 must be bus master, with the codec as I2S slave.

Move dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK,
fixing broken audio on the PHYTEC phyBOARD-Pollux-i.MX8MP board with
PEB-AV-10 Audio/Video expansion board. Also remove the spurious clocks
property from the codec sub-node, which had no effect in this topology.

Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit message to avoid topology confusion

Link to v1: https://lore.kernel.org/all/20260827065556.2326079-1-primoz.fiser@norik.com/

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

