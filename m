Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209040;
	b=vtJqbImMkpaO9CusIrohfkqL8xB+wrImzGDQX5cGPGjnO23elWaX+fp7iUjud3pBM1Ni
	 ugoEpmCF00y6ld26n0iQRroeQiHKG+J2VM7XfEvSCSR9hDjuW8ATNG7PLZl4SNiXDhMIU
	 yPk3BhSnYfmI0aKdHW+nmnTZAetYV95B+xghvVx22WzDGp/09VDm3Am34kweJmyYe4Wc0
	 LE1OmrVvT/rrp6esebxxJw+XEuAeo9e6LWd1ilEE7vXA6cJGtoHWLJfCEsxFtEe+opNWP
	 eT8nDRBsNnvEN4R/o68Wv+zeAgy0C34tScuS+PSQBaOhhg+vGooeBulHjM0POFsOsCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209040;
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
	bh=QqXBocueU53kS/+TXcMDUKhPIuL4LBUwssRUBVr6z48=;
	b=5g90MQky3v2eQVEo1/Q+1pbGY786RwLY1Kv/uAL2cynq/QhVmz5KuYuBL5Qmob9qpre8
	 o7UR4i9BpptbLgWs9aHToXXGb8lnhigNfIkSFt+/bnGiYsZXY2vsMnDGYGFkyYXlYRHFD
	 kp7xDrNLgZeeqegnFx/TjXIeqLS9Ur+63SEj8HL9www2+Avlx0hVMgKHae3LEmYecAj2Z
	 +SatfAMorj3cZRcu6ZLM6apkxObcEGtBKjsNiJJPYmXaYDhhxLs39vsfPo5uZOkRSe8cr
	 XQ2RyzM659CE4cJyO0ciF4KoAR1Pc3CR/2vB/tjms/Gbm3y8kF14hlUzit5GVzwBYsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=onujBjQi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.69
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5C606A323;
	Wed, 28 Oct 2026 17:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD5C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=onujBjQi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUPhHXuQrAI6e8pBspC9WIBbTEf02HHZyDfhhi36dOzAHnBI3ZKzRblVVsavC0wn12sKGm1qvhSWemkN2G9WCf0ecSi7gGh9xtL/rD9owLCJCqDwT1W/DOXATmlP0N/NI5xp2O0H3L87ClLsRuoQN2n8M59Q5VUWrY6yr7gnijPb4K1biCqqjXPtPF92SISD/IzKEzKJNZldfR8k+b4z85HcG8ajStCuC/HFPy5c6hKgFg96NpeDYsFuICoMj3Nb0jP9YAb2SAx3DWk4RjmWza99Xuxq9pK5mlmHPpXrbe0041/yzbTXUTgpbJGifwDEk039WV/MOLJooR8urG54Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqXBocueU53kS/+TXcMDUKhPIuL4LBUwssRUBVr6z48=;
 b=P39lfNGIMhEL/HrPKHula67Uhn1sch0s/LDIlusnJMHua64frqf68TTKJeXR06B7/INEJX9BK1wmW/xfwF9JVuXNzWVxl6rqQynaKs0BedYs3dUJkhgTchUJnDOI98STe1njtBY6/7ELxbSevqvRU3hbruGr3OPWzqVFqbg3U+ueFwTuSXR0WAyx4sYxTEDcOSJHmaaQ2Mo882PyqFbvtV1jhpJPaq7as+Vei/LFSwByn8quilUMNR9y5F7AvhTckvEaksU3ztPPaBVc/tKc99dfuP5EeR3uM93mfvnaOCaQ0n50zMlTNKYrHTfmfAt79ibFLfS7+cDRP0Rbzept+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqXBocueU53kS/+TXcMDUKhPIuL4LBUwssRUBVr6z48=;
 b=onujBjQiMe4dIzg69BXZoNOD6jmeZjylDeSCpPZ6iVXnSd612xpwKRi7sbTLrdGgwMiVfGciTHPbWL/+0jQkx6001+1/UkH/wqhahOOJ9K57PXCDVT1x10v0IivjQmVsOeN6rPEp+rVYr8NwOffEug/ZEgR+r8YYCrH1S2O3RLCvSMFLvxuaivdYenJiWkvtwFOQNJBNGKTbIwv5HiZGi+5keOlJnwCKkpTViboNufh2IpuOZgwO+o7aemkNgAjlwEJgO2ZvukD+UVI/Bd+Ktx1c3TEBowpRiJ1KUPn/3fDZr1CD8stYGkcAFvWM4rO5ZMg4YMcQJ0imp4qHNjt+wQ==
Received: from DM6PR02CA0130.namprd02.prod.outlook.com (2603:10b6:5:1b4::32)
 by CY1PR12MB9582.namprd12.prod.outlook.com (2603:10b6:930:fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:37:14 +0000
Received: from CY8PEPF00000054.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::d) by DM6PR02CA0130.outlook.office365.com
 (2603:10b6:5:1b4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:37:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY8PEPF00000054.mail.protection.outlook.com (10.167.247.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:37:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:53 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:50 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 7/8] ARM: dts: aspeed: Declare SPI NOR flashes on remaining boards
Date: Thu, 29 Oct 2026 02:36:14 +0900
Message-ID: <685ab598d3d5e2bea63024b5d4940a2e027c2043.1793179064.git.jackyhuang@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000054:EE_|CY1PR12MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: dae93b85-de45-45bf-24fd-08df351a1aae
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 O1Ix3L3bJp9T2810qoVT+K9tlXa+yqvMMgwdmm/8YGm2/2mLnDIjZLU4xJejCao/od5H376oKbfBY7FjbY6J7q9kZPIEgS99fwdaKnrstTKszgNyfqBz1J3SNL/OsoiZMS44995nQALpV5ry0NSl2ZrN0HS+FGDhlyKlI5HvMtUsUPYTwU6N762eK3DFYns2xleenMsgCLlk1WQqVs/Ejp4vCQvzN0mGNeZHyE8yxv9DTjEplH4qSl91ybyczeyZmxij89tvvlv83vaNZJFYpXFNGZZCPEAsX4G2nrKYtaPrOt4vpleapyH7Rvmk92umZ6P418FIE+vDcQxYRkvizj9qdriWo0CoLWHgoxZvGyWGDFZ8ymcDcV3ZqVHQFRm+EyytD86XBu0LOnzsQWvdJ2qB77uYBLzcfDp60qQ4iWfHJskFplGJ6jJqrMb9/8DudgcbyxZOdXnTJanC3U2+OWqp8cbg1NkIoHE7QbEGKqf9CiaLHKo97IwHEpwfgnzVDlDKBGDJwSGnx4DBxeNEqw1njKCMzUC9oFGTq21SHNFzOVHB4C313KPPUzkKNyg0py+i7SlnLCOvNBcjXlpYvgdy4yj58dqjsFsDBPKy2+rA8srXws4KWljb+90j9bxq8lCWjjayFe9pdZL+oJ/cZsPiyZRv4gl+SR9wHbNyKp9lZ9y8OmxJRUpj+AOduLQ4FEsl6g4047UDEzI8y7UKtg==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 7SI3RrUf63EbY+VOe+NWjSO7lE8JU+MXVWs3fZW8G1Udgp8koMVpGSX0u9AO75Z69U1ia8AjZ35HtsA7YDnhtO7a1sHUkmze9MC330zY74tcW8g4hsazylDvniN9wf6Dsh29GRokyqiJrfMI0ohE1D/ERexutYDZPee2Wn8eqb97XFdCMpp9rhzuuGT+x4HgQtqhLQdmK/OzB1e+u88A8D19wPhmZhaSHtjga+1wVJ6EnJ7yKf7gsJgArjQBPiWxgN4zeOUqmtJ6sE+4NImtQo2LXO/a6d5/yxCUL4PmUmqqDw+HKwFfkUWqWiqsBh+atDx4EcBUfgTK3f7WNQpkxJT486WtDlPNFh2pkaTZ1l9y4eujAn5VvK5777sn2U7u3m+nt/EP8pTz3XWQgjHd1S4knmhxOetMfClNAXQmugf8pUzNU8q57usJPoVAuV/x
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:37:14.1580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae93b85-de45-45bf-24fd-08df351a1aae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000054.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9582

Declare jedec,spi-nor flash nodes on the AST2600 EVB, Qualcomm
DC-SCM, Quanta S6Q, and UfiSpace NCPlite boards with the properties
previously inherited from aspeed-g6.dtsi stubs. Keep status = "okay"
so these boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts          | 4 ++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts   | 9 +++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts       | 6 ++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts | 6 ++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index 3f2ca9da0..38f8d7c03 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -179,6 +179,8 @@ &rtc {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
@@ -194,6 +196,8 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts
index 259ef3f54..882b68248 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts
@@ -61,18 +61,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <133000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <133000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64-alt.dtsi"
 	};
 };
@@ -83,10 +89,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bios";
 		spi-max-frequency = <133000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
index 864512278..70791b3c0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
@@ -196,10 +196,13 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 };
@@ -211,10 +214,13 @@ &spi2 {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "spi2:0";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts
index 7ab29129d..d8f7939ab 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts
@@ -148,18 +148,24 @@ &mac2 {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64-alt.dtsi"
 	};
 };
-- 
2.43.0

