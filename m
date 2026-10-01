Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E03BC664;
	Thu,  1 Oct 2026 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838594; cv=none; b=L/M+X8tRqcIYvKCxodog2QO+jVPOshg2Xw73JYFKN/tIkiaFWkD8CKWEarAnFfLMBntkP0GoZD9Jru8ruAeXVdUaECCsmefrsFEDEMo+ZtHh5MsGBR2+4/xvmsGSen5JDqpa+9yu83mFJcDMITOAkyy34El42fNJduIRpEItULQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838594; c=relaxed/simple;
	bh=5o+hBo82AXMsmbB9/qTYl6Iy4YtkrOVHHDAbRo7gAGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UTzFFB6fVtwbVKZbIk0AlsQ5bJNmd0juyVc5tiuN1nPJDZzUmZfhmuIJHFLvsmIXXQsSFdZVo1MLaWTWDnIkx6o3kjRaTflZlRIXRnymsAvf3YigmLu0CoksH65TkN4a39lyN2iwJaVEqyvVVsrPzJldpMHo79LpvxYp8Me5cgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-1s4Q;
	Thu, 01 Oct 2026 09:09:50 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 3/3] ARM: dts: imx6: phycore-som: Add phy-reset-duration
Date: Thu,  1 Oct 2026 09:09:47 +0200
Message-Id: <20261001070947.1815279-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001070947.1815279-1-primoz.fiser@norik.com>
References: <20261001070947.1815279-1-primoz.fiser@norik.com>
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

Without an explicit phy-reset-duration, fec_reset_phy() defaults the
phy-reset-gpios assertion to 1 ms. Extend it to 10 ms for a more robust
PHY reset pulse as otherwise Ethernet PHY probing occasionally fails.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- drop patch #3 from v1
- convert patch #4 from v1 to phy-reset-duration instead

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 9070388eecb0..977cf7825e78 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -57,6 +57,7 @@ &fec {
 	phy-mode = "rgmii";
 	phy-supply = <&vdd_eth_io>;
 	phy-reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <10>; /* in msecs */
 	status = "disabled";
 
 	mdio {
-- 
2.34.1

