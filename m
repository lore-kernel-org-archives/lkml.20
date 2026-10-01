Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C454C1512;
	Thu,  1 Oct 2026 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894261; cv=fail; b=oUJQSHNo+j40woyWoD1FcxM3Lfa0074wXgTzb/sHERfrNaLNR7w1gdrH3uZTVVu0lUa+FWNJy8f3BvAh9LAKmD00gO/TnWNPfUe44c9G0DTKfDP9XBA5X2QXKM6iOqihdlLA2CiEBIygJx88bYB+cHIFgDMVnKmSfV69DkMMHFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894261; c=relaxed/simple;
	bh=oSFexXtYKh9Cu52nm+wuZOaL9KWMdKb9th+cwJ6ixTA=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=aDmMyXWq3nBDwoqoxg5Vr95n0uYx5L6xq4zLcjzH5j/cFznjaE7j8ctFcVGUfzCDfSo/oQK/9OshijVd4GBjYIWls+VWh+Z29FMVYyS8MRUsbBkYWwM+ltxjkN1GD44OHbhgEGhI9YNBY1Cd+SGCBlDVVCsqZ/sL5tY6w0vS2t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Rtb/d8v+; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Rtb/d8v+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv+sL+Z9viHQ22GktohxSbXWyIaXyshw/UWUKzn47f0EVvb1dWKqDE09bK/17ulX96daUIn5IcwIEQuCxQcjKMD5qny8g5dMD8wYnsbZD5s46A2vtIno2zCiqmtTBx8ZS3VsJGTIFg9Poc/ljtB9Bzl29RePgWTUtjW6vM6352RM90lPqnDLR8sKh1iwdGAEUYopgXAy9aSiuxwenjbFpw6MPveMJqfrBqD3gdrxZxCrbHcFHsbCjMIulJK1frDTXBiFXomvYgZfQokKTnr+9e/1+BrI6Svut/wSeOamY4n/g0pZaeAUfVJ4hL15ugZyaqtOllZiRw6sicfeDoi7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MhO9LzOFsbzA/KM+S4nQ5RAqoeFr+BnWr161HcLW6s=;
 b=E/duY/UtOv4w2wq9pHqEt5r54aZGNg7gHC1suJQTcp3qphPvltC6v8bp9NTNt1PKd6ZsYXEXeFkn+zYkesceT8In6dCjNMOP9dx8zlWvDqPClOwfplA/OO06DnZ47+nBkwDf1o3qA6Fv4sCTyZ3cui4kib3W8DX7VSHKeroyMxXunsrPPjFNVTh0BTvTuQek9M19OOnb6uEp5dyhg2tSg2br5nwXc+/y/r0c9sTL/5v98+xMK4af404Z03WFXGKu7/3xGJ0dLCPa2tcxNzde1HGHhEZtYmlxAxpED0my28uI1sv/SCtBlccavuhyQlDt7XCxRsqRWcIp1CuoIHAyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MhO9LzOFsbzA/KM+S4nQ5RAqoeFr+BnWr161HcLW6s=;
 b=Rtb/d8v+2f1c1UuEdtKH3QgiFKx29w6zp3+IRDwfQ2YfEwlCfWGQ21h9P4Ylyh2w1tyyF6sBglKaDxASk7lh4yj6Oc5x4a0MnAjDzdcuqiSLKBOmEDOO9jn8JvYZ7Bw6WqxwkEtlaGeQ/Juo1rZ7FbSfumeYCXyH9S3yClx9TdA=
Received: from DU2PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:10:234::32)
 by AM7PR02MB6468.eurprd02.prod.outlook.com (2603:10a6:20b:1b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:37:36 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::a2) by DU2PR04CA0057.outlook.office365.com
 (2603:10a6:10:234::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:37:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:37:36 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:50 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 35/38] arm: dts: qcom: msm8974: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AM7PR02MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a21652-5c48-4c2f-cd7f-08df200c9784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PgrDoagLLKa3N8tbgJBJW2tQVSjudaHbFifn7tSJRCBRoM0g6btyOy5Z6XOzlHsMjOA80jEHsATVXKIyK2igrwrwAs1O0M0TkELwpdmtNLAkA+5nSJ4coaffpIBvtP0RtX4uzyXkFjeNn3CdL6hVo1CIvy0DA+Di3nQRNil0IBWS1BHA7io5YLW3OC0tFC5QwA/H91sZFUpWkkYvDaae/T0v/xZuuhArsfLfwPtqrccez9koLJoRE1ZUJCrhaIZQpM3UKa0qnAzyeFn4Y5chahNuF0uo+Q7dH85mAH30JAd+g/3HC9X7HB1Q0tnaRtCrW0VUT5qmc5jcZgAubk/cK/Y8NKhttOXT9asDug3xnENZWj83b+YGT7L1beAfV54B0s2lDqz9I3uQhYkp0/1yg2XXveep9OxNWeIfvjA4rQMfsF7OIXD3NGA6f0d8z9vhTr0gH1YfD6a+lUB/GktPFjoyQBOCl5vV9JCGx5w2NXKsKNYLDCu8+GDWak0hdxfFtaINJGM4k8C6iD9u7DFzvs14yFLzo4itnD0e+7wC6McWfemyI8Q1vfmpXHRP5t7v3mlIQOJpHclC9QT21qXnmsa0DiIBUJUxb03adlC59GLslt+ypzCl//sUkDx8+pwnDQgv+nA4VfKQnGgNzn311s+2Jvq44AMgP+Hbt81LR1CNG36Q6NqPQsPHJPUlxZKJe3YY7Lu2npDOJ5pS4pb3rQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FDfw+d45S/1M4Z85s1FMBNdBY5ACgOWIP2KeTJ+PMIK5gOcqDixsFVbk2p5Z0y287akSpSJ0eGJRhtuDI8IABx9uU+nWbQ6orXhtLiTUAwH1QHHSZ5QxPZ0dK4bpIU+zmo0TsbfoJ9HMZJl8uQgKVS/yoF6OBDFSchDyw+CEGGEYbW/l7vXD6ZOcNifAkSgcX9efkgyXOuXazKuOXUW1TNFsSTlz4WzxZ5yzmGLzYhF83SJa1CtzAxuDKGTSgQYB+KNK6+5IiEWAGOzwIAkSpYvDPMOe1qsJyF8FcRASZouhCEqSX15oahm1AlmOXcnf1b0oI61dYr0en3OoE8/AlFef6EeqdGukobWdQYKjMBYv325VH6g1P+hcEzl0JAxGkbvCWqVQXvH1o5dkU/Jn5Zb62lBAsks31rsEzwVbga3cux/0v6gx78au8q1xyWHe
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:37:36.3161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a21652-5c48-4c2f-cd7f-08df200c9784
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6468

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 4c2730b34cd1d..1a2f0cc9f8a03 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -960,6 +960,7 @@ replicator_out0: endpoint {
 						remote-endpoint = <&etr_in>;
 					};
 				};
+
 				port@1 {
 					reg = <1>;
 					replicator_out1: endpoint {
@@ -1083,18 +1084,21 @@ kpss_in0: endpoint {
 						remote-endpoint = <&etm0_out>;
 					};
 				};
+
 				port@1 {
 					reg = <1>;
 					kpss_in1: endpoint {
 						remote-endpoint = <&etm1_out>;
 					};
 				};
+
 				port@2 {
 					reg = <2>;
 					kpss_in2: endpoint {
 						remote-endpoint = <&etm2_out>;
 					};
 				};
+
 				port@3 {
 					reg = <3>;
 					kpss_in3: endpoint {
@@ -1785,6 +1789,7 @@ blsp1_i2c6_sleep: blsp1-i2c6-sleep-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
 			/* 6 interfaces per QUP, BLSP2 indexes are numbered (n)+6 */
 
 			/* BLSP2_I2C1 info is missing */
@@ -1872,14 +1877,17 @@ mosi-pins {
 					pins = "gpio45";
 					function = "blsp_spi8";
 				};
+
 				miso-pins {
 					pins = "gpio46";
 					function = "blsp_spi8";
 				};
+
 				cs-pins {
 					pins = "gpio47";
 					function = "blsp_spi8";
 				};
+
 				clk-pins {
 					pins = "gpio48";
 					function = "blsp_spi8";
@@ -2280,6 +2288,7 @@ cpu_alert0: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit0: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -2300,6 +2309,7 @@ cpu_alert1: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit1: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -2320,6 +2330,7 @@ cpu_alert2: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit2: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -2340,6 +2351,7 @@ cpu_alert3: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit3: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
-- 
2.43.0

