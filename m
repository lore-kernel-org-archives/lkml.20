Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023140.outbound.protection.outlook.com [52.101.127.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F403CF1F9;
	Tue, 13 Oct 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885548; cv=fail; b=Hdbj3Soxv+LUdUhapKchKPd+lMwElJEjvd7VhQFAU96pqtvX8CWnFtnFg4R1JcKYNRizIwRsrhDxHvt5bHeb78erM6Z9uLPABBSdsvW+YNRnaHfua9T4QEXqKGcyJtIG+6ghu0q9JIgiV5nK0VHKOTLs9P05W6Yes6GdVHQiUUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885548; c=relaxed/simple;
	bh=Z5Lm5yXESiLJCW2ejBrmlWDOYDJyGB/iXAG2WdqwV7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgNbTzRaVRqCPR6KCMSxSE6OOy0ad5AX4jsZT+6RePEdAcbL6U0/U1YFPPZrmTd5EWISilQ6cKCBMqTkyGJxKyn/GrCIGEt3R2gGW9jzBrXxK9XdpMvOsnALzMIT2bjXewrhM8dtVNLkfSP0x/yrI+L3DE/nS+yCxGcXoHaUGFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+rfEJVmQmR8edzG0DBNs8LFMUTj1S7cmNDtg/bkzFEJ3F817Qra8WGLZjHhxgtCBmXSGS3qfF8dBXPa2Wdv7R9F4UGAxwfr1e/4d+lllN+la7oR7wqO8j6ssK8R0Mk8PcDczL+vagXqCs1UoFuyKA7xEp8PaZoMmhyBedvto1UZYKmduubEVeTN+/sKNYK7LipS+E9rSzwhsHTyJ182Q3yy4gB+mSLVVcCX3axtDyDJp2/YQy58tc5VNM0XxJ9ow8aSK1HwpGh5ZfyA9uukCP+FwsFvb3r6IaPXMsQ5BqUP128BPA9g38jtbVygIwASSYfhmbJbt0yUnNSXXMS7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zCpLkfnIPuVRZZJcn7+tHHgouN8lV7rK07rn2B4cOY=;
 b=H/jCqeiBAtE96/NuU78TrEX4rbhVex8dRSh1BMTuIoUOeZgpmPk1TPDizGym8JOgDEBkbrMeg1a/rqez9S3/k5DHCbAn6xkeE9sHjHTElXISY4r3BQPcYP+cZfWtAT1IaKKAqOCy0Bqce7bql95Bka3fesVE/6fi9/lXK7yPFP/dyfOZsVSgrUd2f5tWchG4hgdw0ghVxh/tKqC9kHoKB2kVIveKDLZ0EwAvDbnAbmmvgJ+7PYCGjZ9XgxBOR6C9MF7oFgttxL0Bjb5L4TyTDHfGq5QocRiOYtrHK8MWuZX+Y3yGpMaVRaFwL4a1Oo9YAISWty5z0NhRD59a4ElTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0021.apcprd03.prod.outlook.com (2603:1096:300:5b::33)
 by TYUPR06MB6050.apcprd06.prod.outlook.com (2603:1096:400:356::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 09:59:02 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:300:5b:cafe::9a) by PS2PR03CA0021.outlook.office365.com
 (2603:1096:300:5b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 09:59:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:59:02 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 233B540920F9;
	Tue, 13 Oct 2026 17:59:01 +0800 (CST)
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
Subject: [PATCH v3 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Date: Tue, 13 Oct 2026 17:59:00 +0800
Message-Id: <20261013095900.758464-4-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013095900.758464-1-Luo.Liu@cixtech.com>
References: <20261013095900.758464-1-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYUPR06MB6050:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a42e58f8-1ae9-4271-ef0a-08df29109bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|42112799006|36860700016|376014|7416014|261009223027099003|10067099003|921020|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	gDOREqd95fo9XVJnOigm9cwqfd22+stHy7Zm19uStkzVV24Xvw64LmNOQsEZzMmLdwVmRmvLUvJatR7gqxQFVr1eNj3/9MS9A5S63Gk3LSSE+65F7j4hV7vBoY/cdFkDjuk2RkheEKa7jmL4w/DLwvA/7zdeSqn2PjcqezxNWIRX7B6LzswyTM3jKD8zXeaoNe3QWgO4+WMsclUkKuB/IViMuGkmBH6pjuYtiaDd9zASzPUTI9YEFZrBt9wtlq/ResN77w61FC5llx0SF+X2eDRJC/w4TD+ez1nniZ35P+kJeSnuBeqRAk8681i83axa8GI2Rzo0SG5e1MGzUcyEaDii63t6LsANvXk2GE+EDegkclZLkRgOWabtst3nkULwn5SLVgZ9thME86t2/qy4YX5ioxFiOcZy8iBt3tM6ly2/WYhEQX597Dp2tL2ZNV1XigoPeu6XhbAfAuebMrFVCH8oBiJ2ZFgQssoDrg8px71AQ3MCPo4vG8EsCc2uzb7uI54hoYA2cpOwA0jjSA4ODWLCnsYWIMM1Cbim7X7+6RohCD/HKJlQ/xq6QG38tpUkLm5u16yNyi8jckg6OejCclOSV7FqkSqvcpK+rYK2fEhkZi3onpAqhFP22eIGZUBoLdIK004STVKkytGQ0iXRlJaR2D6OY8PMbyNRbz1iIP3dN2PdA7B8oJen4v22R/0CE4VPu1kqywpWm1DArdWL9vtbNyztQruZ6EOqb8diV0lEHBFYa06qQQ/3Lje1Bzro
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(42112799006)(36860700016)(376014)(7416014)(261009223027099003)(10067099003)(921020)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O9zjXqmGUbyc2HMl4BxOFB04IwLt6LNjn+sBMEuPd7mg/argJJKQfXTQfpyl3554RhMQZlX9JeZwk9aJAQrS/0+pwTk8+0texvkl4g15FjImjNviOyp+W/62o916LtHax6yWTf22yk6HKZ0ZoOeVpkMGxbvTo/IIKmL/TyuozyR/sdUpiIKi6zZm8sSfNLHR4ix2CXQpL+Dv7YZHzMvFglCjPOY9JMRIL8kUdQMd4QOzgbreWEReLjlzN9D54wGrurnk0W+g2BTNAgmawcg6if7JbE77ve60vdm+rIts1aq0umjIoZEJsYWPKWJmvylgQYfGL9du8bAaL5dOkCJhVnJ3QfWcKDuYetbe5DTDg4XjcnMiD3Kh+nuY5aWnMeweMZkyxKQvKXo7ymihqv60pFKTRO7/7J9kFgxHNvgKmX+NzU2YbAgvtG+7Vy97CBQM
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:59:02.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42e58f8-1ae9-4271-ef0a-08df29109bfa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6050

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

