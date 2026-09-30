Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251E3CFF51;
	Wed, 30 Sep 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763943; cv=none; b=MJL3ABt9l+Y0wnQiQNtpivEJcONTvZyFgGpJnQeoKuVv7yDVyCsjbi9RtJeWnQ10+J5Iqm6bi3WL9YVgEhctOH7eMek3P1GHaZVVhLGnM7j1Jc0BDekD7SEWooW8To2Dixrhiozx/4hjtu5DcR+Icf/rmRPEASWS/4h5ABXFhrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763943; c=relaxed/simple;
	bh=3VwlkVfXDongRWzHmh6c0qgOjW+DzcMwwodeuWayZeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CM2NdK8uuUm1OQUA2j55uNjxn9ygCExCD2HBh99CFFzmkmJ7/sjr7gV8ucg4Tg6/12EVc1eiLgIX+zu2JAidEE5DmKPzocO7UzbbI8TAmL36NrCULF6fkR++cy0ZW8EqJEoqoYeD+DhdhhDnCrSAzwwQktcXvVptbi6Gbz+RyUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=B5BHByRE; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="B5BHByRE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C1mc571TLiruDHFeIi5/cxV7xPy+VTVrA7ofNqEUNcY=; b=B5BHByRE9tD5y/EFk3sMy9yl/9
	LBUEsZgFagBYgyX1p+zjZmNxg0eaCuSshog7eBqhMrj88rl1xDwNGEEiRTp+6YnYKn6xxvk6WuaCV
	x9O7LsfW3CkaDKbXV2jrvciHLIWfuAytZqevypqT6wQc4llSb5wO4405/QAe5/AB5at1X67Ho6qc0
	OEAmiOZepGhF5U87n6ZIqNtH4O59DJyeQ7RwttZa8UALU5Me0BmJ0XH61spdhuGZSG30ePgP9G20q
	1CPqLMUBfkEHJugqCM6YXhrhth75GqBim4X8N4MF2U7ZB7e7nvwWvjZ7AL0QYKLJ93JlFr6HCB1v6
	BK7kcBMA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-31ji;
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
Subject: [PATCH 2/4] ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
Date: Wed, 30 Sep 2026 12:25:30 +0200
Message-Id: <20260930102532.2262700-3-primoz.fiser@norik.com>
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

The i.MX 6Quad with 1.2 GHz needs 1.4-1.5 V supply voltage for the 1.2
GHz operating point. Therefore this patch increases the maximum output
voltage of the PMIC's SOC and ARM core supply regulators to 1.5 V.
Otherwise transition to 1.2 GHz OPP fails (with the 125 mV anatop LDO
dropout taken into account).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 205467fd223e..9070388eecb0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -133,7 +133,7 @@ regulators {
 			vdd_arm: buck1 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <925000>;
-				regulator-max-microvolt = <1380000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
@@ -141,7 +141,7 @@ vdd_arm: buck1 {
 			vdd_soc: buck2 {
 				regulator-name = "vdd_soc";
 				regulator-min-microvolt = <1150000>;
-				regulator-max-microvolt = <1380000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
-- 
2.34.1

