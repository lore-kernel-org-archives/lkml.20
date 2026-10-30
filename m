Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367195;
	b=Z8/Y7zb1nO4sv4qXlW8o3ga1yrDhx9rRhDbIVqluNA1zihZpl4AVQq/daAAeljGxi+Yp
	 0fUqzkyOaejuuvIk1NujUCo+Wq+iBg0GqwetT/6D4NCBb5mwdvj0qnrwnToX/YBOER8l+
	 yrkHo5quXp0YhKHEsp1NQ6sfVJYreEDPz+OGdYYuP5XbNnGO4zgTSlDnY4Zu+vcZS9fbm
	 E2HCiO8eQb7Fsa5q1Oy2Hi9pMtExO7fCv4g4aU8YFEmG1KiSxZFXXA4zvfMmFCVhbGPEg
	 OdYkiK2V03+nQbsnNfP6w60pnO0+4Uw/cWlWskYSqaLiY1L/hfskgRojc1h0UHTGZzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367195;
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
	bh=+C1Nn1QSoib6U+V/NcsM9hVWBYZIQF1Cy/AMuB1gWWM=;
	b=3+eIHlQsIyUmB2zfPMp2YNtfUBAgzNnHoe8qDDyGqCI+Sca9jWfLCLJ/ISRz+xf2y3Wq
	 oSDPJ0keCxgWSd6F5sMayrBWJEHaIaMReQm45EDgbJV0Rndg6GVJro4D0XCns0EwdZYqw
	 JM8MZmQS3D9yjwX0T9scOm0F/G46X2zJzjbZ3XrEWnTN7mXdhSyPSXx8rz9Gi8BUlUzDR
	 b3gVD5BINVyEqlIqJ+QPK6ncHIS8D2FXDzeTOeZo26zf6hdhT1V539TgHsJqRaQ0nkWs9
	 4oZOzI5EL+a+3SZhVvnGJUjQQT/64XUAqu8SnvEV4NGiFdDiVNjMZBBApQNCKafpztw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=dCF3kMHk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.119
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023119.outbound.protection.outlook.com [40.107.159.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93702606A31D;
	Fri, 30 Oct 2026 13:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93702606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=dCF3kMHk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw5nO1Kdl1CJXxGVrHKma69ZUT8LapAJxF8uGdyB1V3klT9hqzWTwp2sAAc2J1H5+HO9k8mpbtUUPe2ezqTKcolSCSO0YehPhU5mqdIjdZKh69nR47a2jKrQpVIxCjfSpCcRTMVJSHdLRymOusRVLxEiF7YiWCaKSo3ueJWM/llya3ipuG6Ne+5DaqZ+01WkhJc/3G6A69yTmFq8ImGQQjd59WN9hzCi9LJasaNPGmVhRSFJn06v8sJtgUw5sq12B9vUzl5zqlWfF2N7md4KdEa4oKFmrBVs+xtdzZMMAJOwkys3+iuGt7JffiWgMb/SwidRWnHpYwoDcwAfuv/OyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C1Nn1QSoib6U+V/NcsM9hVWBYZIQF1Cy/AMuB1gWWM=;
 b=LzX7BBebkSSYBlyP67aumCNyJAJ+HNj10COMyCDrtIliwZWItcHCGFTx+QMBmcp+stmzSyk1hRbyt7vqSA6npIlFXsxQ/WbGZTg7rQ1yuAGHiYuf51NbV2IYAbU5Yh5TRvdhioXLt5AF8q2FuNpUaFJTjGN7KlQS4jkmaeDjhmwut6GKjsdo2z3YZFEByehdXFd2R2iibANoPtLNhy7aDaz1a2NftFtbswAqabWlltu/XzCwqyDRbyToCcAOKkn5d+NQPQR/8xlS2yThfMJJiAxUQ15CQMQzD4MzC+KfTlTxboN8WpWJh6GAmtpewlg9sZ10bc0sWhRbY46Ia70RSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C1Nn1QSoib6U+V/NcsM9hVWBYZIQF1Cy/AMuB1gWWM=;
 b=dCF3kMHk8mSX4RMtWX1OcIaDNnyW31e0x7PdEIynXPl8fNlwibe2izcAk0I0sVg3FQObJrEnEAZkB2ECe6Obpyw165EdFbLv6SHcCAlcD1NRpYdkzArix2YywUEPCUkNDjvEQqVoz9R6XTWZrUOanJTD9RLmUKP9LVERiIuNoVdK4m/NVtfADh9yTHKLWoGZPxpvOIaVSPxj2pKz9N5Bm++eYrrkON4t1Xse2TuCSKslxWqg4kD1vmkOBnvyq/fFk2k1YEkFhCLiBTG0QohJy3Ar8yajSzIsD8zgtGj0eJYFkXWUiwrjXKHwFyNAnl7lok1leKwwGdbAeDGw2zi92A==
Received: from DUZPR01CA0310.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::10) by GVXP195MB2480.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:1b6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 13:33:07 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::16) by DUZPR01CA0310.outlook.office365.com
 (2603:10a6:10:4ba::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 13:33:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:33:06 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 30 Oct
 2026 14:33:05 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Subject: [PATCH 0/5] dts: update imx95 Libra devicetree for the newest
 hardware version
Date: Fri, 30 Oct 2026 14:32:42 +0100
Message-ID: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqDMBAA0KvIrB1IRC3Tq5Qikzo1szANiT8Q7
 97g8m3eCVmSSoZndUKSTbP+QoGtK/h4DpOgjsXQmKY3ZC3uGtF59gF1Pqgb1piXJDxrmJCI2od
 zHQsbKENM8tXj3l/v6/oDznF/xG0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367177; l=1712;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=eVURJ+4S7jIhxGam9W+SKTrpioc7vyOjEHfJgu1kY/E=;
 b=pyVJ0ZmsSJLd2dJ8+bzyBu2f8SMH5sBB3VpDryeJTGQJ6L+jOqmkhjTggrPzMzwkHrYo7OUmM
 zva5b3GNAp8Ds7zvNeF/vb4KBHuG9Zqt/5NCKPc1XgJAC2B9nE7dxPP
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|GVXP195MB2480:EE_
X-MS-Office365-Filtering-Correlation-Id: 135316ae-20d4-401b-f731-08df368a54a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oP4cMW1UugdQH1ombgS8DFGth25d+JpqIz1XZm68EIG2NvH31cqlpk8xdc15kNbhztjN/sXealcXnC+GUHG0RtXlkpmGUzxGoEB7/eQa6dawJ4mf6vTfBxST8U1vXB+kQPKqDVNC3sQhPnC5QN5pQCOvepQauNcI/mcMPqp6a/H1xQ/iPsQeDw9p0IyY4+WpMFc0m9+1htUr+pskQCXN7dSV3nJDYPtcr6jPa40GmEs700DLGCZEtviiBLDmeOwNcOwtLYNB+gOwil/VdJrcBB5+KUtyBg+oxvQtzbMoyBUaPGbTkj1Mgnu9xoo/aOTIeK3rwkrhIkQ55h1n6WGHgHYhBFTc6Oo/TkPCFuXI4PoHnuCkIF2aALdr8B5LbI/y4DIDgHWH1q3rZMIvpnnLNdffQVcW1OZ6N63B+jfPWZ/M2zz7twqC4aclpXKcST2hnYJRLUG3Cd/iQFMl/gg5+N3PPSorfEbndYaWdyt4p8eNYilKQX32OoHl/cAIsc2XhZXQj+6NgBEQs6qgwRN3R7X4S9fT8nm+h7WJEQ5Op8v+v+onqs+hO7E4oPAmmCRFG5Cn88yknTGCRTwq5Mr32ww+kYNDWrI29Npg5xCxfiBQxeo8Janhyqcg7248pteijvhzd7eG+8rbmNJNuuuycHTX82beyDaBzH3btmEsmgIkDqluSqdPs4TuRUgnVREpkZpGg+nopvF2HXIncIaUtA==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uwS+ZzREonjj4r2ngyGj6y2+Ie2XFrTUrqc76aNoOACr5KU4jixDncIOpUbEGtTX1LbqFC6lCreVKwjEnSkjKaK7PYn6gIbI3lE29zmK5F0uYxwfM+VCk1eiGm0POJRmw7nG9UA3+mbJRgWT0DpYn91Z1ROOsBAmdQ2C/BdQDxtphk0lr9KV6Ma8g+8Bvi9Db5h7xG9ma7j7K9yCFi+8VrW6iLzpHvx9tk5yloyalV/brmQ0jT4efpupsqdh6d41e7UxnA4NM0gMUevUGZ4SZ8VLlwsj2VDxhHOr6oKN/ilsSHQQoCk9RmnfYHqx0poAWE7ZFcd4qN8AXhJWPz3ZkUYCXDq1a5HjWEPpkoYYMfbzCE/rZ9wqPkt+v6XOzeeWbLj33wGOQuP5hnuruDrMUVdbnweDEggAz1Qnw+CpxySYUwZ7JGMYppWMqyuuPIsk
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:06.2544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135316ae-20d4-401b-f731-08df368a54a4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB2480

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
Benjamin Hahn (5):
      bindings: Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK
      dts: imx95-phyflex-libra-rdk: Add dts for phyFLEX-i.MX 95 Libra RDK
      dts: imx95-phyflex-libra-rdk: Add overlays
      dts: imx95-libra-rdk-fpsc: remove devicetree for old Libra
      bindings: remove unused binding from old Libra version

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +-
 arch/arm64/boot/dts/freescale/Makefile             |  12 +-
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ------------
 .../imx95-phyflex-fpsc-g-som-temperature.dtso      |  23 +
 ...ore-fpsc.dtsi => imx95-phyflex-fpsc-g-som.dtsi} | 204 +++++---
 .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso |  24 +
 .../boot/dts/freescale/imx95-phyflex-libra-rdk.dts | 558 +++++++++++++++++++++
 7 files changed, 761 insertions(+), 384 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260911-wip-bhahn-imx95_upstreaming-99947bb5aea0

Best regards,
--  
Benjamin Hahn <B.Hahn@phytec.de>

