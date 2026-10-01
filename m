Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7204BE439;
	Thu,  1 Oct 2026 22:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894201; cv=fail; b=ueT0qxUDiG8BuRUg9IplabAXL0dT5ot3YHBKEVFrUub6HE0nNT1beWzpyR4BTZa5DT8UwpD1C/8u1uzt6W8eiOJNMbXd2dB4vufrzV+4I1a1JKpGnNvuHMcZNlW3maXIGrai671FpJtdslbwpk488XXiAJvIsrC9KHMWZR22p1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894201; c=relaxed/simple;
	bh=g3AAEUHvnewQEDj+l1fsvn9uT9nYoJUnQf6w+oVnZ78=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=ZqPqAHq13WVBRpubi1NBkWMTdstdzHtsHHUtK6YeaDM0tofVqbz+nedAKDrSNuVxCYS8hVGotYBDR79FynBHGvMYcQ1WbmvAM8y8Udpj5K2peCzS8UC9fV3GjQc5xSjzqIibX3He3AnIziPaeDKBMYd6RFQP5v77CZwjrYLbjk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=M+pzhI2+; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="M+pzhI2+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1lUyZr5ycxXLBb52pSJ8BsyFyxwx8cctKllUvyruuvLOl+D5Zs21Vme5rMYG4PYCok6K72hEk8ATSTWpKNWpJzGpRIWY86No58fc7Qbc1zCLoxHZ+KSOTJfttm2ywfGo3560hIY2/KftShy7kNA7Uccs9yj4kc1F43SHed1uvWRIJ8RWaPC97VZitLj935G9091ph+49N0gM2X9LAe69VjFdIjvSKC7bA9DGXsuTkcWB1ewFGGmRnEHi1v1mJVASFovm343xMK0954rZ0BeCQ4sTD1d/QwiXZipECH2wb5OFP+gh7K1X4rR5+9JMEU7wSreKgjkzp1DOnrVfqqDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqi1IsICq3pL/Zm/glofrjUdtaz5WS37GMp+XsNkrrg=;
 b=bD7GOshD6iK1ZdXRPOFORHRa3ZtcqbuyPkxAnfCHAuBE9IK8t9kcaQ+ZYPotPNmLqcilJvqWXxJkrxQCWYMSrHH3opBoaxPcX+1/Z2JeDPcw85Z0I0gHShMtQZnIYdT67ryRTjCVB7hDTTHwQ62vU1lJth4Sh7jgIOqfOnI5MihQ7LT8m/hsk58I+qHgjZHJhmHAzakL8SsGdtZCxnv7AjK82FZJPqOl2bDOfoMQUlKzxORyYfwicMa9VX1MKLLA8IViMcf6JrgcNj9b5UFBmLoAuZ5B81WKcFvRe43xWxzLFzURnbRCOQMwMbaSpr9AtSjIoM+CHooNCPSFZH4YrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqi1IsICq3pL/Zm/glofrjUdtaz5WS37GMp+XsNkrrg=;
 b=M+pzhI2+YANoyfSAKFTImPTd0vw+FF83Laf9VWON3rK5OU/iLeVIc7vECAf5b2OYVjC5ohACO0j4VjQpbZRxds4py+ztbVich4TZs5F3p+R+NP9ykNXuQJF7za33J/MW8xq8VSUs3aOTUQ9BSj95xrrfoSKmRl65p7Ir0bQz+5Q=
Received: from DUZPR01CA0320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::16) by DU0PR02MB7874.eurprd02.prod.outlook.com
 (2603:10a6:10:346::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Thu, 1 Oct
 2026 22:36:35 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::74) by DUZPR01CA0320.outlook.office365.com
 (2603:10a6:10:4ba::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:35 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:32 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 04/38] arm: dts: qcom: pm8941: Remove superfluous empty lines
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:32 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU0PR02MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b1eb48-2588-4d47-b11b-08df200c7371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zYcxU0K0n1hOAQe7GceW1u6qju3FB1GpzZwXEBghXw716HPAaNMQXdY1QRSRyGy4nKOaR0n8psJaJ3LwrMh6My3MgT7+2k+1s3cxwVcmelAWwC+f/aSNwbu19UtCVjtWpE7KPYU2tXKbivDP6Ux8dyXiieuHlUAY18YDKRlOMME+xhCgo+ZzV70L7OPJ5nKIm3q+W5vIR07keQivg9eWktSo9j/Xk7mT3WwK91eT6XRYfVzeJ96qrOKVIXfplywIXyccJ/pyAKeu9L5YgQde3UCNa3DHrAU2K84Ba5dYrDj36PMRl9ispCSAJWV3NHOHyLjLIYn0jpSyYYvt3whvqZvB/N01u4Ggd2BXQEDvk0C1jeYA9RXKHLEYmNoaFXfnVhw9SKtUYIpYY1iOMR70S7jNDAxAOMT5BTGaLvic407kLuiwrIDgFrPZmDi35hzogPW41bqpo5wolXBWfsX5NAnOhgexog7aWJdORZQhe/AM9KgvX/sITT7xyd5w54gW8SlXZqqc3yDGu9QOFWl7OMJbbrRYUHXKPVu3dqhX//G7DeY0FjlbXDbdjgnOoBrEsGgGKKBxwJ8ecjGkrKcNwvsbJmyrl+t4AOsVDuAp4J9Av8fUKxSBWmqK1UN5Ee+XHTuK8R9olVfAthd6mAvRd4uZWVwq2xOzWsv8jIJUAiW8KAvYVf7SbCHsSDeltkgbtzVYaFZEW1MkGHl2lpgjTg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yst5AHnDFh8LFO436SVYtvSx2hwwQGBWFKnZ15o8ta477YJSFv8SeLJzKHftxZfRoOtrO8BQT25+P3i6SNMNFb5wHn8+DrNnYKfucB54fdIPY3LuYoh2sthw47r6XZa8lFJx3UC+/zal7nrO2lt2pXp2lD2fhz6IcdGKhQh2smfJLjZ4AbmmI4/O5fU9sUefV6J4eplVtBqJIqYTdFpj2tU5kDJgjYTepcRRQZ3k8GH6y2pVnjXi+EstcKzThk90BqRI7O3rkPu8JOMeWoPjHWWbs0/q6Zu7t4sc0gNw2dMRNkVOTgKLl/A0RSjHxGugnkctMKqx5I2GvPK8MAHQa1+5U9rQohV2F3xoy3vl/Vrs6eK7n/EQeo+szI3a6Ey5DTRfhZNu+a6yGa6NGaNWMQu99sgbmQqRj3XZ0T7xwztgC53DSUS9ytk5ZjxaudVk
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:35.7949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b1eb48-2588-4d47-b11b-08df200c7371
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7874

There shouldn't be a newline at the start of node definition or multiple
empty lines. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/pm8941.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8941.dtsi b/arch/arm/boot/dts/qcom/pm8941.dtsi
index aca0052a02b75..e48803fa74333 100644
--- a/arch/arm/boot/dts/qcom/pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8941.dtsi
@@ -3,7 +3,6 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-
 / {
 	thermal-zones {
 		pm8941-thermal {
@@ -35,7 +34,6 @@ crit {
 };
 
 &spmi_bus {
-
 	pm8941_0: pm8941@0 {
 		compatible = "qcom,pm8941", "qcom,spmi-pmic";
 		reg = <0x0 SPMI_USID>;
@@ -146,7 +144,6 @@ pm8941_vadc: adc@3100 {
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
 
-
 			channel@6 {
 				reg = <VADC_VBAT_SNS>;
 			};
-- 
2.43.0

