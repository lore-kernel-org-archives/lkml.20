Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585624;
	b=QTN+YZqtDn/ESfTFEqiyGd9S0aeT7C1R10lvFaBWUfl2g22ofBk0yzN0fNHHawlEGzIf
	 UMjm+oql+qUbc2U/6idKjp3lziwPf8UsHIOqy6WIMfFLNEoWrGmyXTxeftg0kjkHHgXfs
	 ZOxiatnJs85/aYp9ff4T3cbmTdtjAZ96eONLazNfH1mauHUAiYBfQkrYSF6JWNs/lyLIw
	 mNS/LIBFmnyIW9omSAHG5WPbEsNpaQcrqPrwACk1CAWFGmvKeBzoB01J6xMIvNFMfZqjg
	 khkfX/v7k4Hme8TZdIr99vvVaLGYNvFB17cDJKQw2pmnEhxMAA8ZVfxJQUKZL2t++1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585624;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QCj8y4VHIKw6dTlV8U6lwzV86M0xvXKgPFWsRHO4VGE=;
	b=DQViAO3/DnsHvU+oc04G2WJ7EMIUYulS1tCahtGF9q70w6xBC/pzk+DVZoooWryjJIBT
	 4K5ibwE26GhAcn6LUUaKRmAov+zEbpnbZJrzieMJzNuD0aDl+8iq4TprEOOPJGwDoiQqY
	 aLLlnZ8xGeXROUVNoAIrdXgtpMJyzYTdiyBZMoW9ZPgTJwttlwy2HuI/R5fFj+fThj4ZI
	 JV7fcYXeMVWRALzflykD4WEQ+bqxgOgaoKvkGMFzh3V7BtQfwCvqUZTmGKYu5AO51hZH1
	 rSqUnU+K/Vpo+O3WgFk/BF5Vle3k3jb0Ob7ZWj6+RWTqUBQJrcYIFfn4ooie/mIawSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IV6Hsk2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.115
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023115.outbound.protection.outlook.com [52.101.83.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F7606A896;
	Fri, 13 Nov 2026 16:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71F7606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IV6Hsk2E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCvoyAN9qk6aARsmfnw7hSceFxRZRM9P5fSAYu4WERM5+K20O6AwNbTIY7E/riTiAAgge8KNY4gI4OCTQE/SPJY/C2gUlG2RCnBEQqgJJN08Rw0Rx1dzybFOwgcyfUcGUnTB276U24tLqgoHSo6IpfIzKMqcMqxDk4OR8aA6sSZaCT03wBQN/uhEKKCQUddfmq42dXQmNmZxLfVrVahPEG23xczd0FX8c5bhUNCe7j+tVEKs7cThf4hoTgBx8yBZHqVLzgFjd0tU4HMRX1knW6E5wZ2Xr0lLdiWHiRoVlDoxShdU1LEAU/OqenAaEXpjnKGRh6MzXOD7YLPAdyIcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCj8y4VHIKw6dTlV8U6lwzV86M0xvXKgPFWsRHO4VGE=;
 b=ZlUsfMYaxWkHdcDrPzEe4DjtmbTO1Kom7QQoIU4J1uN2ZTDf7F0/W32XN98TVLtKFqqPNWhVfLJZqBqSvms+W9VkZdJh+fwjiY2f75AEHdiQZVtv8L+kcBmN5TAFaYks4Q7J4mZP2O0u/ZECG5nthIZP6A755TbazrltSAw89CQshKsYS4KV9lxfkP9TY6qkFdnRy5FFy47Nzk1YixFBAbBGoHXnz9BrObkL9vbJwJXrqjoeMWDNzDiZHjEnLsS6xyYAQHUwXWwpANu8fTRfdgvG6QPUjC6HP/nLxyqXG3Qc3OXMgxPrzbssaYWT+bC55EvocYOhty1FukeUhUSiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCj8y4VHIKw6dTlV8U6lwzV86M0xvXKgPFWsRHO4VGE=;
 b=IV6Hsk2EncMmSYqq7bZPjZswhk2dRFiO5AWB8X92tYZwmNzxGY3dCWTg4xRS4AqNRqHTIqRM6SkXYJIzCvByJvJWtq5zWlPgdNw5G84waL70xhf1JwSn6LhF07hTnUd0MLcerE1ryMcLGfOKxReM+Cdu65B+ZKiZlZx5ucX26/WyrYIGtMnWNQq9s8u+WW2hVUPzlvxzSWzCStsHGR8R0TB9U+hG2QgVk9bFMT3lxWsUyA+YKPdWhhaFyOEdl8BpsC4CRogB/2TQe1zUv1W21cwLm79KOeRAs4WRlyFJ+0rk8cJbf5XZrgCzPBFDSJg1s2BwucF1lXmHP2AOmihkyQ==
Received: from ZR1PEPF000077FA.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::44f)
 by DB9P195MB1777.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:399::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:00:16 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com (2603:10a6:918::154)
 by ZR1PEPF000077FA.outlook.office365.com (2603:10a6:918::44f) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10
 via Frontend Transport; Fri, 13 Nov 2026 16:00:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:00:13 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 13 Nov
 2026 17:00:10 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Subject: [PATCH v2 0/5] arm64: dts: update imx95 Libra for the newest
 hardware version
Date: Fri, 13 Nov 2026 17:00:02 +0100
Message-ID: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrh3TqaKpK+9hiGnLSGdBaVpEC
 OHuVg7g8n+L760iU2LK4latItHEmYdQQh0q4bwJHQG3pYWS6iI1Inw4gvXGB+B+1vXzHfOYyPQ
 cOtBan6/W1oaMFEWIiV487/qjKe05j0Na9rMJf+vuojzJv+6EIAEdOiq4Ja3v0S8juWNLotm27
 QsjrqyzxgAAAA==
X-Change-ID: 20260911-wip-bhahn-imx95_upstreaming-99947bb5aea0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585609; l=2117;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=A2Yf9Z57q7DB17ewbgxLUvPgx5MichkCSUPtETLeUcM=;
 b=hXpB5Y24fv3J0Qhgf6qXuBfKNkTviMZZLNgoG4BUeam8tapUOJabc1ozbO4tSqN3yIzgVsqIZ
 Y4FRQSxfsVIB0wtzrkEg2pY1l/1Q1OnD0lg/6ODSqpxCrWCnQ4pWyKx
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|DB9P195MB1777:EE_
X-MS-Office365-Filtering-Correlation-Id: f180e3c0-11cb-47ca-d3c6-08df419f33d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|10067099003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	RxP+DEyK5odbQCvRCRGCli3NORlA/nE7Yk/semAdH8boq7dwkR6U7NvIWKFdJa/SkGniONeyCsvwNKCjYLcr0HEMRqH3lTroH1yihFHlOAdSZ8qnyLVjKmItEP9kxDcfSbeu/biYa+MmNSlWtRwmmZaW5NYW/GnTfX+BOCuIYwb43CBWiufEniOi7xB7xxE9fKBswpTq5xjGraO7fJFBPx/0nfjd7/xvEnaj49te2KDVEZ14g45s9mIDtkRDC166nKJ9jfv03lPWuf7ScwOTojWBuOKhKy2si/iSK61hJE+ubxC5eKnyNzq5It1nojbBTu4l1h9KvNWOozjgr49OfTZzcunu4JbPzyqY7xk6Ubrwt0h6i0UMef56jaGIynjW08iA/Gxs9wHyDBemr4XAjHiDRVJqs0F0q/7ckd8/Y8ee73ZXwqJ5GbRFrHJOS+MlsgSZmK6bWS3d9YTWD1HUbD57w3ob4D8XrCUsIZqaXL8A0mGSWaUOAI3258sy/quftpzhO62X8jwHPlhm2zUcG+U3M0ClgSi2MODlVQruodfLLumxNW+S6Il693N/+wihTlSZ1wBBp2pSSA3xHRskH8zTfJFBFzveN0t/IqZQlKv+tcvIG4ITHLOPh0YiS2Z0trh+yma9+9xD9QEbQHF/ag==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uWcMG8tKSagsJqle82Q+AYmEl8z/ajwUAlVDCvMvqYGjylPwG/dgKEpPeA2aMxyI5LPh9e7l5KApHtCFJGWlyTAXbhRq67psviAnklFPlsvvhC+JKuWhmv+K3w+IpWNizpZHsutJhwdnGgYttkWBXddx5rKzFBjoDrwWuDtxe1jbKPNOpvRV8h55UJf6Vxbgtsxg63ZezHmyCWKhVxVKQZ3WxLCy8DLkJhgFTxOCmdf0iJeU2PF+33beH9qHcaCCxYTWLFKEOOk8vz0wVIErfvqAU6WKS0gFGSjRCAtg/x+FQS+UiJwGZss0tyQ93JRuro4J5K+p2DugqUI2NbFkV9aSOAvASLW/hQOolGiKYMDH0PDuosc5jyx7H0flEmDCERjhVhKweg35tHaUT5JZtr1Vh+BDICzaLEcsmfyf1SqBiiqbGTmMC64S/vRCMec1
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:00:13.3334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f180e3c0-11cb-47ca-d3c6-08df419f33d7
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1777

The Libra RDK and i.MX95 FPSC SoM have been updated with new hardware
revisions 1618.2 and 1620.3. With these new hardware revisions they also
got renamed slightly, as they have been integrated in the phyFLEX
series. The baseboard is now named phyFLEX Libra RDK and the SoM is now
named phyFLEX-i.MX 95 FPSC Gamma. Add the new devicetrees and bindings
and remove the old versions. The old versions of the baseboard (1618.0)
and SoM (1620.1) were only ALPHA hardware and are not longer supported
or manufactured, as they were based on the i.MX95 silicon revision A1,
which is no longer available.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
Changes in v2:
- fix indentation for new dt binding
- updated commit description for removing old dt binding
- fix naming for pinctrl_usdhc3_200mhz node
- fix misplaced external-facing and wake-gpios on pcie0/pcie1
- fix gpio2 gpio-line-names
- updated prefixes in commit descriptions
- Link to v1: https://patch.msgid.link/20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de

---
Benjamin Hahn (5):
      dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra RDK
      arm64: dts: imx95-phyflex-libra-rdk: Add phyFLEX-i.MX 95 Libra RDK
      arm64: dts: imx95-phyflex-libra-rdk: Add overlays
      arm64: dts: imx95-libra-rdk-fpsc: remove devicetree for old Libra
      dt-bindings: arm: fsl: remove outdated PHYTEC i.MX95 FPSC

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +-
 arch/arm64/boot/dts/freescale/Makefile             |  12 +-
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ------------
 .../imx95-phyflex-fpsc-g-som-temperature.dtso      |  23 +
 ...ore-fpsc.dtsi => imx95-phyflex-fpsc-g-som.dtsi} | 210 +++++---
 .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso |  24 +
 .../boot/dts/freescale/imx95-phyflex-libra-rdk.dts | 550 +++++++++++++++++++++
 7 files changed, 756 insertions(+), 387 deletions(-)
---
base-commit: 7c590854a7fbdeb6049a1e8bb6eb958c79b4b45b
change-id: 20260911-wip-bhahn-imx95_upstreaming-99947bb5aea0

Best regards,
--  
Benjamin Hahn <B.Hahn@phytec.de>

