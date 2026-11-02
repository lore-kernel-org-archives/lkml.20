Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793588672;
	b=1p9UKliBZZ8ziH5bkhGAqtYW3c9P3G+HWkfsoqUoJl5o3j0wZmcxGSXMdltM2f1eUlwU
	 eOK2jjxqA+jcqwa+Nokl2WuExmyJFfiSC2mSgFiu9m39miKIvS/7V/Orm8DU7nO3kiOMU
	 7H1esETTXeSjSW88+/l7WZEQ+1LQwE/VY9KPIUd0LBWjIagDZSrQbUEzVLtMKTs8VJVcR
	 WS4otoHzDu4AeDrXcB/axmzpc4/SYoDYEXmkBHeb7DCEAt66we+n3ZeksGB9SuOpaGPtz
	 vedTXI19fJfV3wyv6lEPOAkQ0Yt14AMT7QKqVq+8PjjoLgUV776jctJ2cqtqjoltMQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588672;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PZdvWPMNEOdZTboayEPkrb6WCP5CvFdbFdfgscNHK2Y=;
	b=pQDE5LULOrF+ELRYEqfMpvGmZy0wuoXAW6nF8KpjOJ7kNN5vIe0TfEcBilJO+6QVR703
	 O2En5DJ7Hwis/zw0/j1deu0+hnbQ2N8LmZZiV7VZAMnw6TEctL7HMBC5uihlnhSe7vayN
	 7XkaIuSB2WSiNN1lAwS1I/8drbIPg+jW8Jbn/u5Wh+wrQq+bR1F5k3AGe+5ILY3Zc8R14
	 Q8tbDUTrEJ4E+tnNXHqJ4GM3e/mcL5QPQzVxyICXUKbyQ7UFMbu4Ppi/A+n6mhaB3Lgt0
	 MDSbJdHQ7EB61M1r/eoMBRRwiFJiMHFxQXXlnac9tSnTQa4VlOTF6z7/asxXdnUm8uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.142
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022142.outbound.protection.outlook.com [52.101.126.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E0606A324;
	Mon,  2 Nov 2026 03:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3E0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ymb+zVWy2PqXuo1U4aFvzeBNjWbh4QVUO8h9Ci8EwdKq9trT6vyCI86P33ONGQsMm5xm2vYJqHxlmtArjxK7VppTQpP43qWETq+DexfdMK7/nPZt0n0BsgVIPh87DeavD+tn2LxgtJkhfEw6e8nCWF3qNN9cazztg3tqTiYKJkbF+DA8riAGz0hi5wNCimXTUYykoh+KKccUnQRLTX4/HVvzvjs0HRyz6v0rKhYIt5cA+qbfP5PuuW38xBpYM/i02wN4VsxxunQB+o4NBdMG8V8nHW/EjtSAKkrwR8iYV3a3qybUfhTy9EaefN89vZsbelNBvAMx+nrd7+n/nIQcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZdvWPMNEOdZTboayEPkrb6WCP5CvFdbFdfgscNHK2Y=;
 b=DHN+0iXXKCsk4bM/nBTM/DCyUAk3DoBcm2tjsbPktIAGRlHSxORoN22GqQEOnnlDmZp3T6jhGmurFOuTBxvk1lpB71GQNWlyBMkJewrjrmsqkVo7FcqkPyYPz/8wZfOZiUWY31i2PxBiL7sQlBht6IFwv1uB2KH/cJdfDy2m3eH3ZtjihVZ4zTEIEVbLxLiRF7axzPA0CqwhO2uQ4TyUObjjkDwiEM685fKO1B5ynEjBcmzo+KERwkaPupWys2+rgt1DprqjzMaJvwA12dbT9ERzm0tWA5xUKI9snwurhavrxTFBiTaqaLrEwq7SEVWBwzLOOzl8HTX6bzeqFAIyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) by KUXPR06MB8368.apcprd06.prod.outlook.com
 (2603:1096:d10:81::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 03:04:27 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::b) by SI2PR01CA0029.outlook.office365.com
 (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 03:04:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 03:04:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CC52940920E2;
	Mon,  2 Nov 2026 11:04:25 +0800 (CST)
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
Subject: [PATCH v4 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Date: Mon,  2 Nov 2026 11:04:25 +0800
Message-Id: <20261102030425.1957585-4-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KUXPR06MB8368:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4cc904c7-90ae-448f-df2b-08df388e015c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|42112799006|921020|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F4kM/XaReDdwcSkUuwJW3zPh0puhb1FZMm0tFAXq2/LOfOQEO1A1EiynanSLyoewUfiaqbZTASXBLbeMVmD22ORDvOHl6GW3tPJVJH2zNweFd/JjM2OBHr7gNq/+tVcdX9CYmvdbMKlj3QloolgJDqy+DJi/ipH5+AXloYi31gdKABBSdyR09WEWRcKYP2pjtU4hJzw6W4W4EIKmKPhZrrLaEDddnvBKG2Bgo11QxYKKLnUh+m2eKxVRjEF8O3EJxkUuEWfRrmR0OZSsH7ow3LCOOrSRU8FEPJBjo/SForaMxQ7+PdgqXwo637w6NowrjuqkdMPulaBvIq7M863hhO/SPHiPBRDcAhAs4t54oQFux/mQr8qFXeRt0hM11GWYZQNeotkseQBAeK/BoT2jTq+Tkh1Q8lzdR0RnDSF0nk9CircMorE7zVHLguA6OrOTVL5FhJL9NShJ9LsjYsvEu6q41QNKSSya0YWXeRCDSCiHDStXEDx7uU4gnZMOpHnGU/S8tqWWT1x3rpjzDTkDaTkG/lTn1vUzRTeQIoDtACdod/pJGMluRgunxKdJs5dpn7SWuz2B6y2VP1mNZV6O649bS0dLj2mIMwRFg1se8N9J9kg1JQu/6ghubpnjJYYwJSNSiP/lZyaBzCsL9RqmwAOiOzcvws4LeN2UiTyJXY7m0QwiSay1EcQE105oohpGJqszKGYZ1Y9z7JExvyhBvZjUclp6soHSJUDsiMB9gDPMzIr+7C0Ab7ZZ3m1KYrY8
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(42112799006)(921020)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lQxs5mUNTxsFoqPBKesupAN4F2HgTzuJcJAjAxXE67xol5daTyZ6O/NS2Zrvl1yXaN6eh1zRoPRBrYV4C3O5L1pdSxiz2u11DQGT00nFkay3TcfxmiWgL82FizxPDtdh4/DnYdgFY5tx5CaWmhMUV/JBPHutfPXtCFQ8PAA4lP01GXjcMr6/9HM1sfq324xhLKUFCZBogdk32MPCiwhUE3wW4yvrW+9OPH8UN3hAiPgwSSFF9iEMDZF/NDltnovtVyha6/zUa2AW2VvbnScdVm1xNhcoP16qjUN7WPhTnOmOJedGgxcvxDGWAo5cJDRJ5HjB0UCoyPpCGFPE7r9b3ebydmyWhZkMxvPV0t1U6rWhKhOCgVkRGAc2bOHe7E5BXT/C8c7J/5tDB3oEDW0b5T/GJiYTCCOizhQnoNtGFJyxYyJ56m9c6sZPLNOE9tOO
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:04:26.7520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc904c7-90ae-448f-df2b-08df388e015c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8368

Describe the Sky1 DP PHY in the SoC DTSI, including the DPC2 APB
clock shared with the DisplayPort controller, so DisplayPort can
consume it once the controller is enabled. Enable the PHY on the
Radxa Orion O6 board.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  4 ++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 10 ++++++++++
 2 files changed, 14 insertions(+)

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
index 0a820f45feb9..cbc14ac5b2b7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -762,6 +762,16 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		dp_phy: phy@1414c000 {
+			compatible = "cix,sky1-dp-phy";
+			reg = <0x0 0x1414c000 0x0 0x4000>;
+			clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
+			clock-names = "apb";
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

