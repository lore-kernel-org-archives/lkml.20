Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209047;
	b=LPD6bg+Lyje7GzvUDox//+RNxS/NPvp3mgezy2iF9d5JhdOK3m+G00daSI7k1GoFtvvs
	 FXs4u9OX9xkZQQW8Aeq2rxCx8LmbxAG9cuLFzrvc1y0CUQz8zITPUoV7cU0qbhrTWaNDQ
	 /H1z4Ron+jLkiTMT/xy0qZDMrGiFs2/COTDQGfV/cr+SFCG5ozoXZzvOYbT6mgUa7QSde
	 1pDPTvCxAyNAt/ennbaWEBIWNW74h+tznV2rQPsCbQ1Xb7EiTv+uTQvdrFB8nkscNZmaf
	 twswkNQ5LWBiLqMxeqrqgExhYshTyxDSeUxfpIzB6YsmeSbp/yjOO3JTcSgxEM/fJSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209047;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=VRp6He+df6jnk4yVbTrWOHfgNaPmnw08rHN3iaNftp8=;
	b=olAQRrFuCtH1I/98I3q6NuRNyEVDgtpr/DzVbSMbRNJkSzHkNzt3TR5OVfsd7vbhMGsT
	 k7j1bqMPfy6iqvQm1mK9gCIvwKuW0q/SzyUc/71OYz4KdoOoEwhkgNHlHp+cJNvxoHEGa
	 XAgCAo9xsfNrP8kCish62BA1+Vzm6ad1mJXnOmmuDcuhiUHRH/lOnmw5xU7qA9p8TZeSd
	 1q+WXDwMXMv4Oeza3HLJF7TyvvMR2J8f5ZTADjNgZ2X+ZVLlKFheGa2WKpqQc7n9Cdgqq
	 phdo0Unx2l99GcAQiSkM7WWdGLjJhflBpE6lHGPmRbSaWq1NAkhHDXr76Seuf5k8k7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dZ83+HfF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.12
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0059E606A33E;
	Wed, 28 Oct 2026 17:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0059E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dZ83+HfF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3MQZr9tK6oIOeJHReyq20lkKvK6dN+KWW9YoHqryb4i3WVCsmUtaCGignzit9EvbNeR3VrZmIxcmSQ1GWDqVQMYDopppEaiw+UpMnyrQtUj1rIm8+o5M2c3rlDMk4ugi2mHBk6XlxYBSkeRte4CucSnH+k6IzlMtIw1z121dGBxFIsCRgzIz9lNoOnLo6DNNgG5OOLpv9hNhUvvDPSpaRuCc51TNXb04BDITAx4Il0LHmmSi6MCevNrUkDfxeGF7dyxPHTG6o4dVsSh3YaQ+7QsX0wq/eqYOneyduBxByR9Xqblg9Nheev4n7o3bqlgL2BOOqKwoa5Wn61FF58VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRp6He+df6jnk4yVbTrWOHfgNaPmnw08rHN3iaNftp8=;
 b=RbYzQ6HVFO6S/iQZEVWEqBLmAEyrUUBGGBv1Nq4WpnfBtJ4J4NHW+nykfXicyIGejNxm8X1tnPZL3C7bPK9h5OJfFwCGy9fI+dfJ4MnERsXASiUDVvLN/uMZsWy/1WpE29IOzvOPQWC0ZMRxjQxe+4xe5/XnDn0AeXCx4bIHTe4Ppg2+rMbuJ2xUVfkr0HaEfx1fTPTGRX8MrcDkqqtI7Ptu+YLR2Y4FXqzjBxdiJxexpxQCYvrgHYtXi4htKPXD6umtXRFSMlysNN6hkUZcbG+tZjkC013cWnPu1bHxCXB4iSD4iH3eNsrpghZ3QGy86uH63s2pJLr0R9B0QRsYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRp6He+df6jnk4yVbTrWOHfgNaPmnw08rHN3iaNftp8=;
 b=dZ83+HfFYdjIWIkPoZ8Rj5CWLEmIcIGhmIq9buwGeIK7a3u693OT0u5Xsf7anhWOQoCluK+GRHEZ4lc+uMTd+84GlwjaqjdpTvGX0rLvgU1mWDgjap8mSOeWQx9S+ypQWHtvt1fOL6LfpPiHX8aFd3kvLHS6Zr/Wp33qhE9aSHZuRYzogS0DKdAnYRnz1cvWHaJ/rZUIN6SsF6q3hSC9hLSGZ4bH3nVugDiBBW/v9T3ZL6Qz/0cAzVL44YVIC/hHDHvwLtbC4VabBAC+fOcsAS/XvUSkyQRtHgKDfX+J/qGwVpHHwTgXFDMRgKezM+4uEyk4cU2oH6KtLCzUBBbAcw==
Received: from DS7PR03CA0207.namprd03.prod.outlook.com (2603:10b6:5:3b6::32)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 17:37:18 +0000
Received: from CY8PEPF00000052.namprd05.prod.outlook.com
 (2603:10b6:5:3b6:cafe::9c) by DS7PR03CA0207.outlook.office365.com
 (2603:10b6:5:3b6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:37:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY8PEPF00000052.mail.protection.outlook.com (10.167.247.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:37:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:55 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:53 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 8/8] ARM: dts: aspeed: g6: Remove board-level flash stubs
Date: Thu, 29 Oct 2026 02:36:15 +0900
Message-ID: <9a5af3be251d15aef269cc6c2c92eef1668f7cec.1793179064.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793179064.git.jackyhuang@nvidia.com>
References: <cover.1793179064.git.jackyhuang@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000052:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: ce970946-6939-4cee-ea17-08df351a1c59
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|261021123027099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 Notg6GY3uFGSggBIdES02flPqO1QndcYuaWxtlNAF1GcH62zR0UAiyFzog6ioXbWmHMrE7FZSfNmsReGMR5qG0HMS2XpSxdyh1KOarFVMlZwS+O9BZwRAG1cmn5zy4TFq5M5tRRKpup3kQrMUCt6Njiw8U5P+BaN4wSi1477LxMDb+fuqWyjfmp9uCTq+LMrFcgwTu/EpGs0YkmeVUS+no98xEj0B6Q7MUUPiIhq9OHWZOgfVrE3Tw4bF7IfhN1MDPfEoD4f+P9tdSlqc6xcKSCE7DJLJSVHBOzmt6tm0jMRUs58sX9vPLXioihNowvfiM+ysyionK/NeUsI4Icv+bWVNDbikp+w4bMfxLqI38sNDohVlraWJJxln+sK0UeJZi1np6XsPCIXSrcNyFfGV1koL1t7PnQZt/BMson40b3s0qcTk3xxeFMFZuHA5oY6WoDzxJJozHtcrPui6azbRilVce8Yc0reKoHzhi49umDdNX6H5Jcr/kJRbXLojsymWYx+LXWZCvbxgAVclhVVPBhWwNSYgFjR3xlAjDrPpICpRVhkW7dmfjnMCMSTpJts1UDTcE+CByYCAmHMNmW/aSQB9KYXsezttXZjbtFrIC9cJDCVm3qrmbVdSe/wpIpWYZGf8IrpYx0WUZCy/yfRCjFKcXhf1pu56nMuMVqNRLNHOOUubmLn3ofwOgBstTiIA6inVW4J+gsXhdvf30U8+w==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 2N3Inpe9Eb/o/Y8XT8ILJiAqboTni7cl4auZh79RHIIc0qFGk09ndzyO1M8jIIVx/3ssmEHZofFyRJXnQJUG1NT5QCWGy8KvCbKp5fV8BwCPDxZethdNxtxf39xIIpB92TgYStM1kTdzTH2+gk0XwfbGmXo73e1EWwQyhtScPQwxWRAnNQFoX5qy0+LN/WqhpRUmacwA1IwlwTY+DMXMp2w35HanpQidM4/9fN6MLJoQHBkSeUFWJ3alnwX6KLEowNI0TNpihqbj9qnri82Z9JjlxgXe/wpqbCT9o+suyypjmqOt2SiUixsa02vyL2+QQPvMOj9NbDiG/DSB2F8Bjd8n1DY2Ol1t2R6kex+RdMe4m7pf12UQOYV4sLD5vSEHSUH/HbbCNMoY/AWKGtra9RgdnmohWPjMQvWRT3LgivIW0Gd4OE3mcWLMx0WgQCeC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:37:16.9686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce970946-6939-4cee-ea17-08df351a1c59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000052.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

SPI NOR flashes describe board population, not SoC IP. With boards
now declaring the flashes they use, drop the disabled flash@*
stubs from aspeed-g6.dtsi and leave only the FMC/SPI controllers.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 -------------------------
 1 file changed, 56 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5..de705c544 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -119,27 +119,6 @@ fmc: spi@1e620000 {
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@2 {
-				reg = < 2 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		spi1: spi@1e630000 {
@@ -149,20 +128,6 @@ spi1: spi@1e630000 {
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		spi2: spi@1e631000 {
@@ -172,27 +137,6 @@ spi2: spi@1e631000 {
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@2 {
-				reg = < 2 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		mdio0: mdio@1e650000 {
-- 
2.43.0

