Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27853F1068;
	Wed, 30 Sep 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763944; cv=none; b=XX+KRlmQiLZfvtRdgPTY7Wz1vMOhuvK/pFAIHQK9uvU2mMkAP3hTE3JjXTciyTghjhqUWj7Tbwn0frjSvnFEabPJn0ScRZUVGd3JedgLroBv/32KtDmZRr42gXO9Wq7ODGa/4nk56uYjpFVdH9OcQi7HA/fZoBChNdvW4E9Wcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763944; c=relaxed/simple;
	bh=8rZzUrOLPBz3XISiGKmxZ0xflFhlc1sMwSxMbiqo6aw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OpIH3qHfK+dCDOQsYD3j6mNIv5l27P4TgUN8h94Cm9INz6QrZ335NIFl9Mbm+PlDDOqtaIv7bTnp06mSl2xf6gt1NeUxUMAlCBAZ+6h3niD9T9uYQQvPqj8fpRHJYbWoLtashii3Gh6Y3Qy/LBOyzgX3pGsWJmQxdlqJ7rdlE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=VpbFpqPe; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="VpbFpqPe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y/vJTXDa5JGao0fg+y7rTxeWlsSvg14wPGOzusE7qgQ=; b=VpbFpqPetZwtqDwMta7zsePbBB
	GMhMPYS6d0aMRz0XlQH3iGAwN68BIsM9J0Lp/9XCVnJEVE6jykDyswuxY3IlmMA1O4vsagjFKuAPr
	4WtVehGuO7fT+B9+9wX8231g4a3GOtoO3V9rdZKjx2wsl9srEHGReeIZiJ9olm1rBHnFDWIHsbtuU
	kp402tzd7xFzZv+zMtEJh4peZxgrKr2LET//+XL+wsYgypqVrThLYxY5T+7lpYnFFgsl3WYoYDTXx
	lPf9jUHGt9ZBUp+E7f43mcRMn1oUBuX9fmXLF4Tui+zaEjZ02b7t3x4Iv+s68mFyqwv5/ht5DiDHO
	9VzgNctg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-41oi;
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
Subject: [PATCH 4/4] ARM: dts: imx6: phycore-som: Add reset-assert-us for PHY reset
Date: Wed, 30 Sep 2026 12:25:32 +0200
Message-Id: <20260930102532.2262700-5-primoz.fiser@norik.com>
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

Without an explicit reset-assert-us, Ethernet PHY probing occasionally
fails. Set it to a 10 ms for a more robust PHY reset pulse.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 88eabc7af6b7..16e00375f474 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -65,6 +65,7 @@ mdio {
 		ethphy: ethernet-phy@3 {
 			reg = <3>;
 			reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
 			txc-skew-ps = <1680>;
 			rxc-skew-ps = <1860>;
 		};
-- 
2.34.1

