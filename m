Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022123.outbound.protection.outlook.com [52.101.126.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2923ED5E;
	Mon, 12 Oct 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792326; cv=fail; b=q0g7nBVbTFUyC4LBqA2bR6dACgkrKQHkppX+ixh6RtXQb/5yD7jw2801VfEJKlQXXG35Ql6nbhSRH2eDvmC0dG0UvpXJ88vo9hDe2hNdOnOJnqg+zGoaZMHfx1SR5+OaHUfTdKiVUFf6PMG716DkDTKz8xVEJiDnYa4m51mjr/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792326; c=relaxed/simple;
	bh=Z5Lm5yXESiLJCW2ejBrmlWDOYDJyGB/iXAG2WdqwV7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQHdx5vWZJteBGaty+f0reJO8fYYasIJGzJ63eDAp4iOO02/rX9XZz1JhzSTiLl1GmcgAhRwFfd0atumiulXrvAhw09lXp9yavJiErMvRigcDiKDpEl1a9ULQTHnorwBYEnwaiigfKvuybuVmgEQI0R54DhtcPTc+VAp5lzZpQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bisKy7kt/oVcbrIUXrVQ4lxRGSPa61XPkQwYbIh8K3gjPrH3uIvOr3d2JAexXku5/36LemJ4WNvjT4AXYqke6l+6ICUQ0BNfgetX4m7irf2/VPxCDmmKKGO8rwYdzJLMeNgy/+DXSq0rDZwhzVkOjk+xoP5dyv5ObCFaMdhmlazKaNsZsYAtFHRGO3kNTNfm36bItvlK7jYbN42U/kUXQ0H/cccLOy1sNkPJYK4lyLjKNn3nioklghmcPVA9RTtK8DT1JKN1yMFniVoV7p4zDKuHffGfzMNd6PcSKfV9NuyEdsyUztDdrupfKsV5xkjZeaRJaFVrJjJqcJlGMycJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zCpLkfnIPuVRZZJcn7+tHHgouN8lV7rK07rn2B4cOY=;
 b=oPI2EsW1ByYeWFjl2/Xsx0UyVUBV1dGNFXuUIfYQDPMk/FHgU1ai7fqlzIdi64a78RoPrffyptrSFoqef85dKlmDA8yXOoghdyvNEVeShcxzOp9Rs/+Dcq2ygi05jiioITVX++JNXO93e9Fr3RG1vgPRkb2Dle26MTtazfHGx1PF1FAI8qwBwIFMf/uJX1z+y6j+e+j8fMcA45D9mnAUUHbYdHq+YKOIrG/9V8ZhwrB13Us0TxVBnLFjDN7563u2inO4DhYRzJMydQv/DJOGA4NNrNagvJWjwAHzWiRiQ+oCM7GJTlJ7K0YkxbmzbUhieXVEIF10tsKWHRsGPa5KLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0002.jpnprd01.prod.outlook.com (2603:1096:604:251::11)
 by SETPR06MB9257.apcprd06.prod.outlook.com (2603:1096:101:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:05:21 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:604:251:cafe::f) by OS7PR01CA0002.outlook.office365.com
 (2603:1096:604:251::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:05:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:05:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3A58B40920E2;
	Mon, 12 Oct 2026 16:05:18 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Date: Mon, 12 Oct 2026 16:05:17 +0800
Message-Id: <20261012080517.566920-4-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012080517.566920-1-Luo.Liu@cixtech.com>
References: <20261012080517.566920-1-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SETPR06MB9257:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e13ba80d-4713-46f8-58ac-08df28378f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|42112799006|1800799024|36860700016|23010399003|18002099003|22082099003|10067099003|921020|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5W+EGkT2KDCwZeORQtU7Yiepn5NKdJTrd1/WuI2hm/Z2VzHX7JBUdgycPBQZeLOtItyU7N5mMDgJ+M21bSkWJODEYhbu7LXKPzfLU+S8etKT0gVDp1fvI7j2HvBAIllxowWrQzAXQKhm5EnlqC8mIqeSindCKqlTbVvWLmdRO2bnCIqS/4F27IZkPoJJCWLdkv4Jzgy7ae4pabMteuKPRGzvCGaeGS57IEcQ4m2DK07UA3NZUWeobkwfB2XRh0HNCwwot+B45ciXjBKqZ00XM0XLoIWARynHBlI2S8ow2mhUkSbNvewXSWgOhfqLeXgx/303H82X+B3+VDsopIEmgO+zVnZ+QU85nTAk6oUATQNuq0rApTFIowPxYW6Ch7NcsnKZszGTqj6gHg5WCVGendQYhc5tiLhYq/UC9QBGNcdo+TIhMA2Sbtyi6K8yaAyq/qavRfjHDtYBPLEyGKCLtOUzILBXl8LdkGppYgDyrCRWS2DyHWj6OUWPSUyrQWw8CnVTomODooFWySGAowQQ3V4CCkKMHWAsgZAdlGsZZobcCazU9cqzEN/uf7Jx4/RuFhfa1ewhQuxI5ZBy9keZ2tr1WTon3+0g4Gpi5yQcJZFqmzIQ9p7Dh0iIIKYOd7+6sXe8BP+mUgVy6ur/k0AgES5fVe1Y02Z/BueCitEt9h86yT3y6M9irpU/aZmHlVhNsNN9Vx5jpW8/2rufaZopmjAwyFmYybWWd33YDz3Mkqn6tiTrxyR2rDQu2GurBqtk
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(42112799006)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(10067099003)(921020)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+S3heO2kEipgEnpnSlH/TW7AfPiUSpU6CQks6qwH7t10kygytPd0wXSZ9CZmwYzwL6mnsk36eUak8hCOuPNYSLlASfuwYJZPdgaPYY5DP2VNTkaBhDEOyjQSzW5sfydI4SkmfNnnA7amIQAdCG0BTl/PNWU6aISYpsGEQXEtdBzPogNIyq7CwQ/8nTnvU4hWhA4Z+ByrgvRu3mv6UqzYBEDbvdzUHVJx+Ld+y5cItl66nCMLyGGVFfMTH8yBS58ACjW6H9mddYDHxfeLEeXrHbi1QlGokWk9DCUw+n1ylbRNAShl3nhufjsDBFSZxaBI4EO/t1/LiDaulyN8K0UySH2g4O3ofaXBBn8nSPNJZtAHgrxk/gsbnF698nBN2uX/vV3ZP43DxzmREDj/WSlbCRaZ3eSBrSwPGDrzJ3OJe2sz6rypi2MOa3QvjG4ExnkL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:05:20.3576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e13ba80d-4713-46f8-58ac-08df28378f89
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR06MB9257

Describe the Sky1 DP PHY in the SoC DTSI so DisplayPort can consume it
once the controller is enabled. Enable the PHY on the Radxa Orion O6
board.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 4 ++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..b659c10f1f4d 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -36,6 +36,10 @@ linux,cma {
 
 };
 
+&dp_phy {
+	status = "okay";
+};
+
 &fch_gpio0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..33bd2173fb85 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -762,6 +762,14 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		dp_phy: phy@1414c000 {
+			compatible = "cix,sky1-dp-phy";
+			reg = <0x0 0x1414c000 0x0 0x4000>;
+			resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		s5_syscon: syscon@16000000 {
 			compatible = "cix,sky1-s5-system-control", "syscon";
 			reg = <0x0 0x16000000 0x0 0x1000>;
-- 
2.25.1

