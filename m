Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08593E0226;
	Thu,  1 Oct 2026 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838595; cv=none; b=iSffoPtHdRFGV16sozGgkionLn4IANRiTR0GGe5aLvbfeoZRDOwaeVTx4Dzgq9+7mRs5hi4r2bpeKiepbWIKW6MbCpMwRYFTXK37vQHt7Up8nGmHvXJ2J1Jj1UOkECTsSeUSaEBoKCe2RwLrljHhtF5eKf9UJ6Y6g/+V/IuBado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838595; c=relaxed/simple;
	bh=CIpA8+WZKJEv1+WslyjE4xU69DpHqMzHgp98kIIc13I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bHI3K5wnTUDOMit7hHa2rUQ74uhLJBs34v725W50GebUBh/hd6DWpiH7+IJnDa0RrCeUQQMEx/sifBxTxT+auYuYG9qTztVB9AdKO8G/fOMJAU6chAL8y7NaF04sDzFyqgr08nqLes2n0vxIoa6U0QTrM5ceGDrcmT9IzPL2WOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-0zR9;
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
Subject: [PATCH v2 1/3] ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
Date: Thu,  1 Oct 2026 09:09:45 +0200
Message-Id: <20261001070947.1815279-2-primoz.fiser@norik.com>
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

Pin the da9062 PMIC watchdog to /dev/watchdog0 via a DT alias, instead
of leaving it to be assigned dynamically by probe order. This SOM
already relies on the PMIC for reset (see commit aa4f48a4e06c ("ARM:
dts: imx6: phycore: Rely on PMIC reboot/reset handler")), so this
makes that the predictable, fixed watchdog device node.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index ddbfecd591f5..205467fd223e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -11,6 +11,7 @@ / {
 	aliases {
 		rtc1 = &da9062_rtc;
 		rtc2 = &snvs_rtc;
+		watchdog0 = &da9062_wdog;
 	};
 
 	/*
@@ -112,7 +113,7 @@ da9062_onkey: onkey {
 			compatible = "dlg,da9062-onkey";
 		};
 
-		watchdog {
+		da9062_wdog: watchdog {
 			compatible = "dlg,da9062-watchdog";
 			dlg,use-sw-pm;
 			dlg,wdt-sd = <1>;
-- 
2.34.1

