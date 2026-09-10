Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE24A3852;
	Thu, 10 Sep 2026 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053286; cv=fail; b=EQy7ACsimY/ULYpQX9OayK6QjsJRGDqX5yTe3Upbk4DU/mlQPwNhZGP3lqslpbNGnS3aGigDe4aYRVOlNJRM9ouAmrJLTljNSWNOtr9TjRbg4K8lvapOD3TMQx4qfYGlmAqNxgQQlPedTaJE41Czm+IJ6hRMm6KhCjZH6XtRp88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053286; c=relaxed/simple;
	bh=W96Ec8VwKQrv+SEA4HT6zXumiqp5xFzjWoZXAdA5ax8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TnRWRlg9A+uukJT901r7jbTgFLVLxgSAlay1LX4U4M6sx5FW05gIm/78N6Gzy7etpt92mFRBQNIR2D47c8z5kY3OXfGU1loc9AlsXy5sKDzSU91hXDHVr+KEPlbNCKJcmuOvc66AW7GT5SFCrfQFITfGIiqKzN8OqFsBMbVzyRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N5KNs3Vz; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N5KNs3Vz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5PUw87Osz3CLKuozKapxAjXUR+e9w7zhVoePGRwej6LY3IxcnY38Az4SA8P3S2zs7X5l79VaHJQHEBtDlke7DGRFor5Kl8+oH7ggLqxuGJUM+rp+f3Q1vhjQH64dXl5fV6Vy1JVaC8GdDdSJBgRsfpknGzvlt/uQzGxbgiMVhg43rd4pzpuabQtrmclr/pPfx8cB3FZ6vePs0Ds3RBlEkOmWP2ULvgZdY8IZEKAijlpNmLrxir0IylfEuRoezHuzcPJfywMg1aZPMCGCUvhi5chrjkjiuo3+7GqZz+LEIz4Rr+GE8Wk2QJL95+7ZiRMA7NpBBMyMy7B4hPFCSp9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEe1TyzQk0DUvobGC4MsZ8QdCfjEGVi4RzHsXB/ViB8=;
 b=xDtjqS9TgSEsGqe6r1mWZ7MYEDzJpG+hEFI4OTL4CUyu27BIMtGpBXirFO6C1M6izWjR+HUOIXJVxjAambPLe0jtG3PTXFIx9Tn4vU+N8n3D1Rd6HkIgzETVh5f7D8KoQ2nOxsblfyQ4Nexm86CCwLcBJlYe9a0r8dghCC87MOD4Ao2LGO5YV/ZyVTxbAecpD/hh6pJfY9gPQTqUGaQCfek/LbHcBCfpFueHBilk2a0Sa26rabiEsakAW41k2vddcKjj529Teu0Hu/1cYJ60g+jI5+OUjY6QXFkfXt/CbQisnFo56/Wn8MRRudCbIWZK7YmP3ed92oLTq4FizQkxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEe1TyzQk0DUvobGC4MsZ8QdCfjEGVi4RzHsXB/ViB8=;
 b=N5KNs3VzUQ1spugHg4VRB8xkDMO8AdX8NIJ/9oV8WGhD8YCO12hE5iLZZ1TbHdENOGUMExGO3cV2Gdj9ZofREzG5TGin5pGn3osdU3n0ZZYQKXDazcZNUowYr/RVBEPsUOg2N6st9b6q448J8SP/d0B472BHsACj5z8WsCr6+io1C6LtYUuEeHA3S3YwzlDln3RmvIYoow3d6pt47Lc6pFtmjbgNIbk1UXDYWziaBFKLeGvInCo767+SofvXVNuvgzUOCnl1rfTV15OoB9AFIZkKiwYnA9B8JhyLYKFmB9MkrckcRKhCaGhr+L+AVVRQZdBLEhE0xVe6let3JIwdog==
Received: from PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13)
 by DU0PR10MB9326.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:59c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:14:32 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:102:19e:cafe::3a) by PR1P264CA0008.outlook.office365.com
 (2603:10a6:102:19e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:14:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:14:32 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:20:31 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:14:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 17:14:27 +0200
Subject: [PATCH 4/5] arm64: dts: st: add TAMP backup register in
 stm32mp231.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-upstream_tamp_nvram_dts_part-v1-4-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|DU0PR10MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 98208826-8acc-4ebf-64b9-08df0f4e379e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EhdNqjxJ+7+utVrnxxXT9kbL0hwXX5FhZzuv/i8GUARrZ95zeg4RlMwP5p6TlfskmoX0pprie5Jq/aMAifXF7FSrFG2IKi/Uce6mv3PcMpGxsOuYQhGQjqqOP2eaO6mg6bu81emZIWiga3YlBxJTw7TbPgUD7VMQSGDG/7ePDjFMirgNLthRvTI7wwhcFPn4u3kLPjYcfdN5dIviAHPEhCy+zT4zpFn+AvCPnm+x8GHq33cW344HTFkxQkmDB/7T7+lGYmEidU37Y7tj/abi0L6HtGwoF85THHwXv8Xo7RgP8oFhuovASkvwJUm4R+reHGq59yleEnNTi1eZxelv8GsdLk467sIhvZNHIKi5nu3POnLqTXcwLcA2lkPktp+N7xyvSgAmUky2hOFUPNfDMGQVGKz8motW/lvQCi+kIWJpL2y/Oe5yuiGxQ9aq8SAl+d/CpfjHlbeY53NR2eQKLqqJn5OEGIXwig6QpUqlwpKYNwOr+BXkbxVjMcZtz+ph2d5h0JapEnpxKBKpBTaNMAe6U3nUbew8zXhynHaRPwl9P/w9Rm/b3N+0WNWmQITQ9S/9j2OAw0GQsY3kzmZA/Hr1fYOFv/mwAwVVYDqw8y2Mt11kNvc1MwdrHe2mNc/kvACZsbUre1OZI4g3Aa9iX4paMEg+7bAC4IVRmzm8/GaOoF/Ufixsj87ud/1ju+Qy6UrP33UyJPqBvUdpeQ76PQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CzMjs+k8/P060aGjfpws1j9ILLBBq1uHC+EKhBFJMrtwAopU+PB+zTKBtylCQ3SsLc6ygbTBQ2eS33WxVxvwyKwEZsRiT3PvQKjF4PSSNCvhfVyuoFhN8L3zZMvb0jni0ZarJydieso2GZK5KMue58z4Ex7W+IwA6Kqm5H+fKaaSPnhA+Mr8cW8xkCu7q3iQk6RE+jBDPmKwtOUE/sZLT4D2pxn2lTihGrFWbdqgxNuv82OSezOifncCUYxf6rOj/93uyVdOaJM0SeFKdGX/5v65VaQJnhYvEOxztCZXza1Q9VLp5ot6zYSxg8eNcLWK/fzZscCYA94MEjC/ivHVgL3JnF99vz5KFhYnCyjO6aT2khADYglgOAqEzO+DDJSk85H6lYrXSavRcUsd7AP60B6b+GLc8FpL7XPKpH8axSjpXEXT715Tbnu8cw2pvXPD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:14:32.4157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98208826-8acc-4ebf-64b9-08df0f4e379e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB9326

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..6d7c16e85d86 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1102,6 +1102,36 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			compatible = "st,stm32mp257-z-pinctrl";
 			ranges = <0 0x46200000 0x400>;

-- 
2.43.0

