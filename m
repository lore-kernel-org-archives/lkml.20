Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209031;
	b=GAVKOsZDZ6n9VeGJgyf9JCJJ1jj7sQeBux513G5eSge3zL0sOiK/UbGUne5f4umbNjk7
	 KL+W1EmdJavtSIinOo0qk/t5WohCA6wBtX5Eqaapo3aDqXY2s1ditwft38q9CDGxra3BH
	 F8N9abMS0ePpzNMwNWkbNEltvzWjumBVxnM/RI9jAfussdJoTQkWfcUpG+4wjwVHF5W55
	 ScujT4dJJbJfDlW66f7rbpEyLD+cu9/TeI4UGr4hlwoDV6EWahcPCKWt3OrGQCqUdC4Hb
	 vbEdIOHJmhvtjhq0kb43yjAjtxwKI5T5w9sa5RdL6kMrd7X3RTHyAVxA8fBifm5YlUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209031;
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
	bh=GuCPkEpmtPTJUeghjgRh7AaZCaF2VJrtcS6cEbHFkKA=;
	b=F9KmCek3Fui56LzZb+qtCP5YknB3/5oYNx/GjnqGVFZry3y05A5KhaYk5hejbzRZFpH5
	 mGvYvqjyjBsN5bqzHiA6i0pAgCCdGsbonh+2NwseqgpJcxtK08Zfg2t6iiPVx8Yt7UHLw
	 HoyF0RAv+JsMVDSHVpYtIAT8zP1MTYHxe9XAB7r72YvOkZ3Kp06HkGR2pWXn7YXGvm5TV
	 UMjUuMQyNUoUrfsTj8Rc/F6scGAH5WWzoMXIdr2REghxFvTwKpmM03vIGPbLamTXXv21U
	 tsBY2b+2UC8K1XKGRyEmXF3uXJCVGxO8+Iw3RHnNtEGGlOI7CcgDuv2c9dhCMIuWDvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QiSIVp+j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.10
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9B606A339;
	Wed, 28 Oct 2026 17:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D9B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QiSIVp+j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avPohoBoO+TH69fxbq1tOOsNwYlE3dO19D1yfB1/AyNj82pPh6PypzXe0Kbu7IJS4RS5K+iNB/84iIRqjJgReeQ11nKKNQsdtKd86wDi/G4WEiozxJQvXMa/xb2sQgjmtyHSjXxbOdC0904YXPFA1/xVydGT9v8D+01lCtRlS1LOVBUqNT8soGeyeKbofWMfiN0w5Y9t2BhIxw3xO6CDTSQtUiIwbSPKunFVa1k6dx5/bUMSEJxHYqIQweOfz84m6FIrUIi+o+DbBgTkMOLIxVUMd0k3RdJRGqEuUygzNwTk14q711fQgn+WJJC6iIva1lgvmj24iOLSXShDdnhYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuCPkEpmtPTJUeghjgRh7AaZCaF2VJrtcS6cEbHFkKA=;
 b=FOwpJqoztJ9FznE9phWo+mXvopsGFi98zDLjUEIYqwtAFWmTGxc4LKXAZ60gkhZkKp9s6oVI8ZQYZ9xDCFe1P+60h5Gd7XleUofvKL3k/qE3u6ceR0f+8vsrv0AnC6dPt1z1n7XwA4nccguxGugX9uqyW5Riy3XeG4e6/FoLhxKa29ntByCkGbAVrT8amc4PZBdz+Cpiy0lkdUnsr0Fg7jkCTPKAstv/Z2McfwZx4lI2imPVR8TPp/WFFIS11+UODg+sDS70rFn4FsD0U1IllczJzPYEXQcx+OvROd/QtH8Mh1qyBoAL/blPwSPPeU2ZBewP5vsGdpdsFpHeTjdqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuCPkEpmtPTJUeghjgRh7AaZCaF2VJrtcS6cEbHFkKA=;
 b=QiSIVp+jSlZhD84KSSS8uTYvdcDJ6jQWqbE+93anyt7+LwPtOV/ZNWJk9mTCZhe069L64d8ah3L+sh4gJFS0EK4yHBxEBgLqXgs1B0P1QakxiObHdnFJ47TkUwK5WG2EEgjCSk12V7jNq4+f1e8b7pHUFXgYI9Mkg1zA9aDxfOP9kAusgWYYIPVwA3QTdWzHyssUGuTXSs45juRxDMq/S2G1LfATU2W4s+ob70++RpPBLVd4v3mf9+PbL5mG6ZL+aBqr7GlGcG/BCpUVWsasuAeOEz7S61uehZN9kPVET0qlKdbAnVhsexSvniF9m3iwRZq05QpCMYl30fNMBhG9ag==
Received: from CY5P221CA0152.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::16)
 by CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:37:06 +0000
Received: from CY8PEPF00000055.namprd05.prod.outlook.com
 (2603:10b6:930:6a:cafe::7b) by CY5P221CA0152.outlook.office365.com
 (2603:10b6:930:6a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:37:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY8PEPF00000055.mail.protection.outlook.com (10.167.247.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:37:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:46 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:43 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 4/8] ARM: dts: aspeed: ampere: Declare SPI NOR flashes on boards
Date: Thu, 29 Oct 2026 02:36:11 +0900
Message-ID: <cc96a014b2b95ce0074186defcd0f0003613429f.1793179064.git.jackyhuang@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000055:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 98aa9fc2-f647-4d75-b51b-08df351a15b3
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 JrTvDX6D8xv7SRlYhU2gVZkLWhA3kZczL2bggYxSMi4O+h5CsLevumwtXn8uNR+EjqcDLXsXZ18o0eK3nMC+XWO8ZfsrEknGgmaqfFk9mIchmYPPOQA4zo2oD72Vo0E5Q1+qemjQrYkWhngRTk3SJ1w548bSOxIsUkGTBeQVWP6XLJSw9enTGFWMxwaJfGdy/vOaT3CvJXNdrtS+s9um7xnadCbZtWe0XtwuTm0n5okkaEo8TABTPHNRI1HmL3g6XeVeRMqQKQHVes0Jur6QcjnMpd6+TXQFPqZygJ1FRyGGe+u2rvztX44Pbjbt2H+EhCF1CEYbDSWcE2oDxAkCf7QKb8KRAbakYCLQhfd9BFg1s1IxFHglbrER+Qb/n7ikSCfkE9R+TxTlpNAKUvs4pmP8rgDVTOEUF1/jhGO7Otq7aBhQlcC+CdW2wf5gWYpW9Dwv3NGYnJD4WsxkQFqzPpRPQIjdvCEpj0fFlIR7r8S585VPSMZuDMeyQGsrbhLNR78VTaLpKu7gv8wWH3oGTRKti+hDHUSxkr4vI0X1uZVmJlfj/SkgVaJtKws1vSj2ye/GCgQJdMIski3v4BD+Q02kMLgY1pLSHA16AoIjOF2If7+o1CKs5aqzpfUc0RgXLKj2qPCZ5xY6G1auS2yR1syZqom4svhDAShb7MVHURsz1T23GJtN7CUY8aXV8RBw9wArcVdVrwD+45Hox95RnQ==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 pu6/m9mY8ZZ33I0rlM2nG9YjOS13PAXFhXTTEun1FdPCY/F8ycegpYtQT3r+RfPYgw4j52YEG+Q/LElMayJJr++sNNxmMOty2AQLyxuw4UknxI4d2R1K/CjSF/Z1JPLs8Xg503oM0IeNq8Po1ddF1YSlDczVs2kumrBjwozGc7SWrHqW2oanLE5u1VG5yVYe6tN0iWEZGNu6D2sQzo/EwSaxuexCki+ydfX+fUTdGZjF4g2bb24dsbRsJDClspjUvuUUhlzBVV67/nIoF9yj0j27YMyleMA8MoJN8d2MOIbbXt4pIBzv03ANLmUiRI/p51hbkKdHL3C09luZ+olWUBio90+3whMHpqRz4Q+N/Zsc/2O0cMh+8pB3oJCU5pWDnZOIfJLfhng90uxeWgCuVEZ1fYeprvMK4tYeurcseog/JsM2tA6iV8vFWqiG8ush
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:37:05.8105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aa9fc2-f647-4d75-b51b-08df351a15b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268

Declare jedec,spi-nor flash nodes with the properties previously
inherited from aspeed-g6.dtsi stubs. Keep status = "okay" so these
boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts    | 9 +++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
index 53b4372f1..44332d1ba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
@@ -149,18 +149,24 @@ &mac3 {
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
@@ -171,10 +177,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 2b336aa01..cd7cd012d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -379,18 +379,24 @@ &mac3 {
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
@@ -401,10 +407,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
-- 
2.43.0

