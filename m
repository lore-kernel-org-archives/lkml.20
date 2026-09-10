Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E11549BD6D;
	Thu, 10 Sep 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053282; cv=fail; b=DAygPFWee3QHXrfT8ptrpZIIZlirGqbg3DQ42T9FTx8jmSk8366T8deJUBJyOTqHHwjnhGcWN0l975hsxmMf67vXyai0U+g6KG5wp5Uh1T6+bhHIWhhaDGBFXPzPedc2LaDZSAKKBOu5Olp347y/Il1e3lvv1VDPSwX3y0x7bYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053282; c=relaxed/simple;
	bh=F4U49VwqXIrnxerRd/K6uG0pCRRF50qcsM6idwpD1Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b3h/8dpBMC7SWYrUhHa18s84a3A16S9XSFaURT6yYo8ZbBSiqXwpzvHeUbLKHn7XDJ7N394xzAMBDd6gSoUXt98P7XR+gzBBJrKwcfOkvbCr3B5ARu2rcJwnndhZQ6Ob/zi9RMieYPhj21tABucR43lvJ9hy/0FRw31ET/sD/fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AqWvU0j4; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AqWvU0j4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0LimQFxtZjmmc3bGrSIJdeRF1d1g9QiccvTG/WlePEDXjO+qgf3zEGmzCICyJYjng7EHWyKOlpyZm74PynUG0tLrl0nfcZMm9+KGsqzHW/e5rf9ODMQyPhOd+clWY2SkFxmuBwqmF5iz+VlZpJcTquFEZD8VXDUNCh82QS2l1Nui4DZNPITc3p1ODeMLWl8Pgio7TleZDhglT7lTHDzAkUk5vMJTUbZtloJ9KlbcMBdTMHMg9uD2KUzV6DZkc9iEKaLSXrqksOtVusDdqnErMxpRRjkgGUjmFch6zhSWCBUAZLu9nz+XY7tz1oPtDikWyQ+6RbCk/34cNreWtZ35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNDpDRQBwO4DWkUpRn1Ex9z1RqvOS9op6Mnw1jVE4Yg=;
 b=W7R1O8cpgQolZhLvM4oWm0pnDdYlyTtuY8mjR+PF7fbw8cHsCc3vRjAOGVELkjHGfWLdbUsu73CZyP3KaTf9i4RKKJGdgbRjUfXoMB7ZD5mkgcin2OVE5B1xjQeLxncYeJHu+kW7xGEP9xSN1ZHbyV1uv8jZIJQi3Ls3AvxIIq6kdFjqY2dwnKO0UmObtJG78C7U3PEi71zYqXMoLJTGG1H9doZzwbawHFpWy8rMGFYu897zzkYKptXFxfRUpu7WzWUM00LPhUhn3GJG2exIitO2Tb98Envl09oDBZZKRdUXrBHvqbD1PN26rY3yALjFPns/DGC3SzfRT1Uey3qaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNDpDRQBwO4DWkUpRn1Ex9z1RqvOS9op6Mnw1jVE4Yg=;
 b=AqWvU0j48AY2dltfdy9SoMylipYktTowvF0PWhgdXbA0MdqNFgWVx7VpQKkokjnCHhhb8BCvMux3PwLwV5937vRolBgQ1sLUEc5bvEJlUH0Skigp9k5m+Hsz8TEYD7VCH093dSjf+qPkobjeGwWXFSmJfAwgOwKAW5yftXGcFIXpY1PzdgqnCFpsiCy6sGvckTv6WV29VTw6L6LMu00iYBawL9HO5yFxwin9fOLmVjGRUXszf/CZuKe3hrrNQilxg/RgDWrq5NVCSOhiuESLLfwCx0ECLCgHgaRbQCH96Vkjz9T7nXBD8qVxWqr6xOetzz/6+hI8xBNfilYhaD1Rdw==
Received: from PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::18)
 by AS8PR10MB6770.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 15:14:32 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:102:19e:cafe::53) by PR1P264CA0013.outlook.office365.com
 (2603:10a6:102:19e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:14:31 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:20:30 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:14:28 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 17:14:25 +0200
Subject: [PATCH 2/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-upstream_tamp_nvram_dts_part-v1-2-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Simeon Marijon
	<simeon.marijon@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|AS8PR10MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a8edf1-6b3f-4e75-763a-08df0f4e3748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UIaJ54p2mGa7oveZiqRbXKdOAxXd/54rUlWbQv8kPeka0SCr2nUYVnGOQ7LKQtuguLwf5YUfYFxuZY+8poJ4voiLATex5+SVVvM4vBMXSjarTCwLlcCcWmqDWzV799oa1u7q9yz0C/KJ+tTqZpHcjoQ/3cRzQ/5SQclU3W5NigUm3xsXP3YT7HFKfV+s0bYm0G99Ou2khgw671k2zzhcWrTjBP21jocxmpnesq0eueJrTpmH5VcCLfjQTMScgHWbwhvCJKfJDxvE/o3BCuEX7Scal2jqkM3JyV+H/HePAayaxDKTsaiEfeE+e7T8i1thKetR6u301ZtFKIR3yhDN8jRcy+Sx5KwtfPV24aGniHe3bGlJeojM6TFcWpRy+NusdWVqIvtZBy/tFTiY6PjCiGGaq9DYRi1DWtT3bofGT5gJWNw/81dKv31mGIiPFXXi9dtTl817BnsJvM29NZiR1orSCl48AMHW0frNvb2HogzmTl3Ofmu/M2gSEJsbNyCl3zFGSl97bAThoNlcdeRudMg+ietXrfLOwYSXGcL3gprzoxbNZlYWOftbPRZeMe1C9owlZLfnmWDXOjEwKgYTlDRg1m5FOT7mpxzVw75e4UGl95DYytkvK9QS/X0a7SJtJ2VPTCzPCRwNPgutcCYc639XpAkbUlfSZGdjtvC3HyzRUW6CDi18xq2//gdjQ3Ts98UnETiGXiYxkksDgzv2bQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9eTef4RmuTigfFMW9e65KvTVoHzAPabH38tCoxE1/NiL/gTIv8E6E8DFj7EvHkRKk1q0bHrpvCiuhclsND526vbHtUnXmJ1kqxocg7OexXVAOkGYckT1WSZMaM+tiR+awHqCJlBqIGpgFzs9ATA/prMY99WJx8VD+4Pxrqx10u+kznUBukYwKklqLPgBa5fSSMYZBHlAUNJ6X/y24p3Ry/lJSkeASbVFTyDJaJbI2u/+KEpr5ttxdQvl/VOnobqTdYdHwCicyZvMhzRZH/3Jdkel3YXnt91Fz8wo3mwAHmmAIUJR3pmLJFlZ5n9wlk+RvLwBB8BM1fgprCfmvNbKvGRra25+NGB4eiWo3jCLFSmNYCuzVlUKhcUUNqltgeh8VlwpJDiSnU2AzG/fuX1RAAut3fNwaszuE6WH3rnntHXOHLMV5Ry906G0EWhVCRhS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:14:31.8500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a8edf1-6b3f-4e75-763a-08df0f4e3748
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6770

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 84f68e8563d8..0ad75e010839 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -2060,7 +2060,89 @@ i2c6: i2c@5c009000 {
 
 		tamp: tamp@5c00a000 {
 			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0x5c00a000 0x400>;
+			ranges;
+
+			nvram: nvram@5c00a100 {
+				compatible = "st,stm32mp15-tamp-nvram";
+				reg = <0x5c00a100 0x80>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					wakeup_sec: tamp-bkp@0 {
+						reg = <0x0 0x4>;
+					};
+
+					m4_security_perimeter_exti1: tamp-bkp@4 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x4 0x4>;
+					};
+
+					m4_security_perimeter_exti2: tamp-bkp@8 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x8 0x4>;
+					};
+
+					m4_security_perimeter_exti3: tamp-bkp@c {
+						/* see cortex-m4 wtake up feature */
+						reg = <0xc 0x4>;
+					};
+
+					magic_number: tamp-bkp@10 {
+						/* see ddr and cpu wake up management feature */
+						reg = <0x10 0x4>;
+					};
+
+					branch_address: tamp-bkp@14 {
+						/* see ddr and cpu wake up management feature */
+						reg = <0x14 0x4>;
+					};
+
+					fwu_info: tamp-bkp@28 {
+						/* see firmware update info feature */
+						reg = <0x28 0x4>;
+					};
+
+					copro_rsc_tbl_address: tamp-bkp@44 {
+						/* see cortex-m4 management feature */
+						reg = <0x44 0x4>;
+					};
+
+					cortex_m_state: tamp-bkp@48 {
+						/* see cortex-m4 management feature */
+						reg = <0x48 0x4>;
+					};
+
+					boot_mode: tamp-bkp@50 {
+						/* see boot mode selection feature */
+						reg = <0x50 0x4>;
+					};
+
+					boot_counter: tamp-bkp@54 {
+						/* see boot counter feature */
+						reg = <0x54 0x4>;
+					};
+
+					m4_wakeup_area_start: tamp-bkp@58 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x58 0x4>;
+					};
+
+					m4_wakeup_area_length: tamp-bkp@5c {
+						/* see cortex-m4 wake up feature */
+						reg = <0x5c 0x4>;
+					};
+
+					m4_wakeup_area_hash: tamp-bkp@60 {
+						/* SHA-0x100 value see Cortex-M4 wake up feature */
+						reg = <0x60 0x20>;
+					};
+				};
+			};
 		};
 
 		/*

-- 
2.43.0

