Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656A13E7BBD;
	Thu,  1 Oct 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842212; cv=none; b=a2tJWURXEnWVkYsJp/qVhdIjP4w1wK+4FFaOZVpwbxhPfBdJsKFdR1mgDtpiSmj/VorxMgACU8jkaLjrqa+quKY9VWHsb7LtOKBefOen76tD7/4LSBb6VZTiLEMfC2rr1W8codA7O4qyyG2FOIUVa7uNQzAhqZBdo2TIiI18b0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842212; c=relaxed/simple;
	bh=oPCQm3bMTGZeW4Ovp2baqeevgstICerM/N3fQbcGCWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DWBRH2fXVfRwjC3wk2aJ1OKbeDBiLTlTT66nQUqIO4YB+rAKWp1fOp8YD0QaaX0Usj2KpNr71CrFHRFOBclef1GKPiRiHBqdrB15TPD2mTCtwWQvbDD8HTCzmkbZ5rPLuq1oPOpiKjR/PLm5aDSb9k2ly6WwRdIXCsIApyixS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:34824 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCBrn-00000001der-05gk;
	Thu, 01 Oct 2026 10:10:07 +0200
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
Subject: [PATCH v2 1/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
Date: Thu,  1 Oct 2026 10:10:04 +0200
Message-Id: <20261001081005.2209755-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
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

Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
swapping capability") we can handle touchscreen x- and y-axis inversion
directly in the kernel instead of user-space on phyBOARD-Mira-i.MX6.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..a7d6af162731 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -164,6 +164,8 @@ stmpe: touchctrl@44 {
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
+			touchscreen-inverted-x;
+			touchscreen-inverted-y;
 			st,sample-time = <4>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.34.1

