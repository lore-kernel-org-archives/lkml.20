Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209029;
	b=V4Kxvk8+DwQ4eNfb1cpPtOfyJ8mTdwCuhVw9hfjme0fyO5aObhETO3wTyvIQoEFHAG4p
	 6X4GnubOaFtIveUz+NUoTo6RHV8toxRVQAuze++INkeusN9LB5DqfsHrdCcBB+RyuSKuJ
	 H9ETwaC6BSdU9PzKzDIdsAuwvOXN5TSvhKdE8CccWc08sA8pkk/Sz2jNnD7nba4L3E8nk
	 sO6DS0Qvy6nhsxCOkYuWcm70BSWQIZd02ZvFgEOsyij3NhCXKO5zQjZj7UdPsng2oGN3g
	 FYwbSZmuCfUoSaL9xSTgw01HLmL0ztFLm44nmqe5ngN6O5qclJLb/OS9G73GD4kZrUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209029;
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
	bh=xM/vrqXg2ECGYH195HCfHRWmOlo9l8Z8D7M/R4B+FmM=;
	b=1NtBy/NC62ImrWCVTEkbVuRJsaDR6RVtoqiVVxM/MNieOgGB8DPi2Ib4zP94jaQeZg4p
	 i4er+xh2SM7yWUbIeQ3woINCiSdiLHF5Btm6EUxx6xAU1kMetId1vTFJlY/J4BEW54fNG
	 oBOP5iY6NqjKbvLHaTaHfcEEG95rsF9jPT/v0RgZ0AY3vBi5gu4QBVb5gOHEXPNmGkZzi
	 0KEppiswLRvY+7WRLabY4Zroe1L+9IOfDAwX8wsV5t2jzum3Bz+ucFXTvhTuQ9oiO+dPb
	 Qk3NXHijsk+ELDU0nRUVLGBtNr7Zp/sxFh5/9xbMfBkL64Fgr7MLA40/QAlwmRW1nPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="fD+77HB/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.8
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3D606A325;
	Wed, 28 Oct 2026 17:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE3D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fD+77HB/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7n3HJ0cIKuLFMio7pIMibBzgFLqXQ7n57Pk9RreH6E7dan6/zPea5WXa/HgBw2Xv49siJDlAQY49dG0OlJzo+DPwa8szUMdnLCXoD/B0Vegc+/QqyOE6sqX+5PnE9RQWWoeuD0iaTyGvEe3SPv4RT86uhpEkq6sbVo84A8VfSGlYIhXIWlO2C/RI3nflMzRZEt4OpUQukaMMDTpAI4ABiZlL+b6edzxlTkzQfhwoYL6x0XHYLRcu7Vy+D5wUkCjwjK+uyBxTVWI883xFb/+xWezcllyx2U7mq7TVAR5Uqz8oxc0YnCx+Z/x66E+jCldlAg4j5c97dBYJUFNuYBk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xM/vrqXg2ECGYH195HCfHRWmOlo9l8Z8D7M/R4B+FmM=;
 b=MzjMhJv5I0m/G97kA8ltxOMfscRwqPrjX1fQvx8Pmqvr0+1lvWGgsLhXJHLKxaZCq+8swMKA53eFbk9E3Ob6bms6RzAh7UX1HKl1pS8ufCuS5ywdLe/L7czbpjfFHHmlMBLJUOH7AJDSnHZewV6PNk6w7HDKcoeTOUsjweANd+xKSZgh59v3IgAbN6Ypf5Ihd+gnL1c1TSSw8pMn/QRhNnIXeN6az41XDZ6i3+v6UV4xr0L9R9wDZqrjO7a/bpi8NOdOd7GWHia6HGPrdp6k8uN2sP51mJ/ukPgRqj1srjrNk4975wgtIFamrtuPnidr+lhN7I4TX2c6wcpeUAUdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM/vrqXg2ECGYH195HCfHRWmOlo9l8Z8D7M/R4B+FmM=;
 b=fD+77HB/dNXWn8HUZO73Fyx4hMOpZk53/77GAHsPjs+oiI3KNCKtPvMlyhh7PfdVvwbwx/vs6vx9NyI072+KER/najd7k/OX5m9shbHQB3Tf/E+qfNf7cCEhlHU86yWjSzeemaJ3rJb9sFCZb0+VNJAOvjFbP3NdoK13nafrLPkiG2BHv7/Kbp8f5MPu4+HZXrFHf6Qcnt6dNve14V2wdsBbZX+ZgKKY/usDwNJUUarwhj056iV+ck1s3PFbb94vjgKg12tW+x4a3VQWdVlUvcvtPQtt6WI0JkeXC0y1k5LJhU1YdkGEOShuF2Y+zwUGHoM1GVAkBFdT1mbh1pUAIA==
Received: from CY5P221CA0162.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::28)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 17:37:00 +0000
Received: from CY8PEPF00000055.namprd05.prod.outlook.com
 (2603:10b6:930:6a:cafe::4c) by CY5P221CA0162.outlook.office365.com
 (2603:10b6:930:6a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:36:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY8PEPF00000055.mail.protection.outlook.com (10.167.247.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:36:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:39 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:36 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 1/8] ARM: dts: aspeed: facebook: Declare SPI NOR flashes on boards
Date: Thu, 29 Oct 2026 02:36:08 +0900
Message-ID: <6745ad450a7500af63ed8bdf6d337a9a3d7f7195.1793179064.git.jackyhuang@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000055:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: e54c5c39-d146-43df-9f7c-08df351a11e2
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|23010399003|1800799024|11063799006|56012099006|10067099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 OUKIbW3Y+PFtxwT5lvRTwdovLyLqV59WOsCcs/zp9Okv4AFKffWNdzqvghydn1LDJfHVITvGjG0EFzp7gNevUhv5Dq5ypwbOXPAF8eYfYQwh6KLEI28ZFJ31t675kMQQfDDVSCQYBMJ4gTy7INlcxw6Czvxz4zRU45OkcNd2fXTE2GUFXZNFvSw1e581nWi6fHXqLjL3LoI+V/wYepJdOBL28aTJnPqoEnnFRGtx7a6nyF2oIKKRm8bLxqGPNTFcb61a0Cg3DmYMz6nmYFCN0K85M2rzYE1PyGxsEXAqEyUdbbp+PiuLnj/ypRpNrccNFeKX87Esz2Ng5mqtWBipHHwHswF2xeVT5Rdir//GI+VdYWJRQvBMsIIh4q79YqmubcWbZ2OhoW6oQSkxhldJar5/Y192LC+2DX3EGCE0LlISxls0Cc14AKEdprnwhiM4uagJzEpS2TqISWMNPY9u7CDIfsedP/ujQnrpZctNLhdDhcYxKgXWLBiYLJCOK0yYcnxrYFqXqNGSHrLipdvirZjiz/crj90fNKnNfelnVaqpPhwXX4sKKF/t5+Z5VujfcXQcQzIdzhMVRQxpYSolIZosBgsg4J9/7B0wHaZtLgAiBW9ImwzihJ9eC3+rwcD4RCmEF2Brl1GrBi02gsWPWJ3RdmTIIKHkYXnWtZyd0jIVASNV6ifzwd1+p8e45isRnEIA84Jl7rUWW1SfmgS29g==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 TRP4zYUg2jdZR56jygCaP3wJVaLIUExJk/q00e3+2C1nivPjkkkp4bUUQF0A4gRVdBnrEEUv4BVa3PvN3HPyETdq6yAnSJR9S7fOtJtNkCh3pA2hwMzW7eGk1XWFEpM/Lgi1rfQK1+IkyDKZ4/ZfB0Q4fRG3Wh87fUWO92sTLxnkHsZ305erQJ2uf7OS1gnAD/U20LkQY4peEbzKz2xOSLvB/YiWPbUN2rrV1h2BxAfrpl1vcThAM2y2QIPBdCGj0MKbSVDKNMapSZAeUKTo5h9DNHtDI/ENwzKcyF5wlqxsFGR7d368Q9mlTAY77ou8Be64DHcur4Q4VAvdCb1l06B+ZIh66HVLbgoMMASmeTSgouk6OOh7pgdAoyGSsB/uC8oe8PFFCGupkAebE3zVQXLF+3DvXnGjVXoC7Hyj1RYlm5ncC74YWRUmw4V3O4GW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:36:59.3800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e54c5c39-d146-43df-9f7c-08df351a11e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412

Declare jedec,spi-nor flash nodes with the properties previously
inherited from aspeed-g6.dtsi stubs. Keep status = "okay" so these
boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
Changes in v2:
  Add the missing compatible and reg properties for Ventura2's four
  flash nodes, plus spi-rx-bus-width for its two FMC flashes.

 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts    |  7 +++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts  |  9 +++++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts   |  6 ++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts   |  6 ++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts |  4 ++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts |  8 ++++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    |  6 ++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts  |  8 ++++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts  |  6 ++++++
 .../dts/aspeed/aspeed-bmc-facebook-santabarbara.dts    |  8 ++++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts   | 10 ++++++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  |  4 ++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts  |  8 ++++++++
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi     |  8 ++++++++
 14 files changed, 98 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 1fddf3a5d..e3b0e21e8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -166,18 +166,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -1023,6 +1029,7 @@ &spi2 {
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
+		reg = <0>;
 		label = "pnor";
 		spi-max-frequency = <12000000>;
 		spi-tx-bus-width = <2>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index d1a04b63d..409757a10 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -314,17 +314,23 @@ fixed-link {
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
 #include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -334,10 +340,13 @@ &spi2 {
 	pinctrl-0 = <&pinctrl_spi2_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 14dd0ab64..c6b9c67bd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -170,17 +170,23 @@ &mac3 {
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
 #include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 820d39a92..82e5d7b9a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -189,18 +189,24 @@ &ehci0 {
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
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 49914a4a1..a7df5e7ed 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
@@ -82,6 +82,8 @@ &rtc {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
@@ -90,6 +92,8 @@ flash@0 {
 #include "openbmc-flash-layout-64.dtsi"
 	};
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 5602a502d..e35041946 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -139,18 +139,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -161,6 +167,8 @@ &spi2 {
 	pinctrl-0 = <&pinctrl_spi2_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index eb8d4b955..3bf894569 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -161,17 +161,23 @@ &mdio3 {
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
 #include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
index b29e08cea..cb41b7853 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
@@ -128,18 +128,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -969,6 +975,8 @@ &spi2 {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 3cc6e772c..73d013cf3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -117,20 +117,26 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
 
 		status = "okay";
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
 
 		status = "okay";
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128-alt.dtsi"
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 0a3e2e241..efe1a2ea5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -173,18 +173,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -1867,6 +1873,8 @@ &spi2 {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index f3dbdece3..0fbae54e4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -301,20 +301,26 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
 
 		status = "okay";
+		spi-rx-bus-width = <2>;
 		#include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
 
 		status = "okay";
+		spi-rx-bus-width = <2>;
 		#include "openbmc-flash-layout-128-alt.dtsi"
 	};
 };
@@ -2851,6 +2857,8 @@ &spi2 {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		label = "pnor";
 		spi-max-frequency = <12000000>;
 		spi-rx-bus-width = <2>;
@@ -2861,6 +2869,8 @@ flash@0 {
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		label = "e810";
 		spi-max-frequency = <12000000>;
 		spi-rx-bus-width = <2>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e4172be84..bfc7df61b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -162,6 +162,8 @@ &mac3 {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
@@ -171,6 +173,8 @@ flash@0 {
 #include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 6287f80d7..e2d4aafb6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -128,18 +128,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -1028,6 +1034,8 @@ &spi2 {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 0ef225acd..180015ccb 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -51,17 +51,25 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "spi0.0";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 
 #include "facebook-bmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "spi0.1";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.43.0

