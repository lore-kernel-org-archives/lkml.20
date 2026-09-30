Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23673BFAD4;
	Wed, 30 Sep 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763945; cv=none; b=ksFoZahvfSpUtpz6/aBmEhYj0w0oOtW2IAG/n+tyeutT7WOGCPXs3+pvRoityisHIDgh2Oaq+8mMIc9A99JEX9Qg9Dq3eCsW7ZfPAupHR8Qo9Ks2ZC7jKNKjmXvgIWuENkHzXWG+f62f6kWVKm1q6iW8+M47Qpw5GfZmXCb/mN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763945; c=relaxed/simple;
	bh=b9Twd+DTcDUxfW6TX5RTkTpVDTwzMfueRKdSIJk+Orc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G5skiYkUiq6z+loJaN82DCl6k+ffghMmWsQiYPr8f2eNe4BmLZkXCIobNfe8FqEmcRdbMPhjoq1uTnbgwNTAN2X2ENngbDOHkJZ5bxk1gHp9/VKMevMPcFJheEaX3ONLBqVLzTlftxcNyGKq6jCaCGPK4oIkUSLrwGe4okFvK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Ob04HhE0; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Ob04HhE0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GBD5tDwi1mEbd9vZcLrEc6TULIMEtPFMOaUFiSR7U5k=; b=Ob04HhE0NSKubgWXAtZ6SpRi98
	pxC67BD3FI1eow5BoD/6CogFu56m8JacHt7fZPOsqJzweO+eeJAxgIEbt11e1nLyjIEd9kQhr6tjr
	T/BEnuHO96HGETgUbp+3Bv3icYBv+VmKy2FM7XEMM05vEA98375NosxW7pzSqLKx5aoMvSmBOCcX4
	NFwPr+0MbW3envG3XndA/zcg7/ywZT10sKGakMl6cWKLo/wH2d3eA30BRSzRWBdbCAW4jM4ah9ZvL
	bZNnTAmzGIKsuTbhcSvzLxB5KOylwtaSbaYbh2rnaOVH7rO6iODmkjCN8pFcOK3h9Ne1SnewXzk+a
	ZEf3mdHQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-3b9H;
	Wed, 30 Sep 2026 12:25:34 +0200
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
Subject: [PATCH 3/4] ARM: dts: imx6: phycore-som: Convert to generic PHY reset binding
Date: Wed, 30 Sep 2026 12:25:31 +0200
Message-Id: <20260930102532.2262700-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930102532.2262700-1-primoz.fiser@norik.com>
References: <20260930102532.2262700-1-primoz.fiser@norik.com>
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

The phy-reset-gpios property on the FEC node is deprecated by the
Documentation/devicetree/bindings/net/fsl,fec.yaml in favour of the
generic reset binding on the PHY node itself, described by the
Documentation/devicetree/bindings/net/ethernet-phy.yaml.

Move the reset GPIO from &fec to the ethphy child node as reset-gpios.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 9070388eecb0..88eabc7af6b7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -56,7 +56,6 @@ &fec {
 	phy-handle = <&ethphy>;
 	phy-mode = "rgmii";
 	phy-supply = <&vdd_eth_io>;
-	phy-reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 
 	mdio {
@@ -65,6 +64,7 @@ mdio {
 
 		ethphy: ethernet-phy@3 {
 			reg = <3>;
+			reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 			txc-skew-ps = <1680>;
 			rxc-skew-ps = <1860>;
 		};
-- 
2.34.1

