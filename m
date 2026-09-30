Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B739479C;
	Wed, 30 Sep 2026 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754626; cv=fail; b=Ao6HMoG6VZtF5V5AVXDDThWHaPygE/vWZBoXwIlSKE99CTlEYF2JCSZJP2DMUEqpS697jNy3FQO78bU+oXTNEQhDLv5LWNO7VvXl8aL0WPyTx3YEm6137xo1PYRfmMgJqHcjrWOjtmtCaHm6u1ete7qaCOq9pPdlH6vPV8L+7AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754626; c=relaxed/simple;
	bh=+jZXp5rnyKLHnyxHDj46UTDsy83OxnSifgM+5JuXH4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GbOY8r7fkqWN+Zc2Uw40MYHxLax5hU9KTc9oMBTGHwBHwrq8FDI8pFEzhHSSSXVrMguUeXEPBvw4E3ReYTwEOFCqeZSIBPfAzjuEdf1EwHPjazIfzP52XMvEOL/wigKvNw2W19EU0pqpL/LNgsa/It2OiB9yuokDsPrHAHcVrok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LUjZ+VUj; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LUjZ+VUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB3UQTA+Mc1Nz6Wng3ICAUx2TZJumyrOXyt/cn0tUqrfCiCeGaDQJDEzS/5C5WWGih+GWZ7ZHHYAgdfzTBUXJPGFEKtSWbRBPfeWM/cetCbWp0sYwNTd7ON5ahYR4J1Id55ZBzmoi4ZuHKkf1S1brPDBIq2Vr9FXLpW6tN4GxTrJdE36Yvps++unCQ1E1J+Uxcc07uDTpd3fU2I7QPvR35QLvPirSd6G2F890t4991phCAbQO9msGCKhcPSMVVQrYWcLIAfdrzOzIuDwXEBycdfbKjhk0Y3HHAc/5wuyCyFWpsHyxFCOFPkeaiiik4+C1sk6S2o+SPGK2CCJUiDOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjJIE/SBtag80Gj3bNVTgfMrXFEng0xAJ7OiMPhJ3lc=;
 b=LQuLuvXDbRt9ove4Z+9OQ2zK4gLpQ4PjDoUKDjVlwnVxMn8QpcFRzrNKE6C+NsgBMrxfRMUokgl6y0TO7qudVQIwTrCZU99vohCW5UqQLh55lBF0fjViupYiOKD1Cwukw38/Ln6GCS3OE6SPW26zamhM9PTriS0t1Si5TT8RTdGebVYBCjnD1n0Sgw98WWA2t+II4KpFSRpsYtq7dQr8ct5H4GPXzbxBnmkHnlHiTRfn6079AZaVqhfGZ2ELZEp6vlNWKk0p+rSp1XcupGfCEAzhjp8NiNWgXKZLzULaDLVSnHncI8lugswkxF29hFgHuftuzv2Ae9ft4ULxV0ckLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjJIE/SBtag80Gj3bNVTgfMrXFEng0xAJ7OiMPhJ3lc=;
 b=LUjZ+VUj9k1w9xEbl//sTBbOoS52kWiH2VaqZy1sboLB/GnPlW6mU/5ju4DR/8e8xgKSUBLSS5r3HdExpZLdXFE12Upo0ElP9BqyWNq3j0W0tZtPPswKNaGw4Uw1twl5E4UFEWGDpRDxUATaOUj/DQeO9glWDJ6+vi7ZVscnU78yiWQeRZvoSG3Yy0V3retlbFpmqv588yFiRthY/ZBM3gvFruboHnaHhrSFDkrRDrbSLNsahCY8H976t3P5t8qdHSYXRjkniAl8pdFCJX8D+N8e7EPLnPVZctseV8ZnbJ0D+r+XhZGDYxoMOANEDiEp6kFoQp+GAUcl5CBnerrRBg==
Received: from PAZP264CA0183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::26)
 by AM7PR10MB3762.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:50:21 +0000
Received: from MAD0EPF000008BD.eurprd04.prod.outlook.com
 (2603:10a6:102:236:cafe::a5) by PAZP264CA0183.outlook.office365.com
 (2603:10a6:102:236::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 07:50:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BD.mail.protection.outlook.com (10.167.241.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:21 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:10 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:16 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:49:51 +0200
Subject: [PATCH v2 4/5] arm64: dts: st: add TAMP backup register in
 stm32mp231.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-4-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BD:EE_|AM7PR10MB3762:EE_
X-MS-Office365-Filtering-Correlation-Id: 2709b444-3e6a-41ee-a623-08df1ec77ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Fs+jn+AhZXgj7NC9RSWacx9XS7YrM9OHobHHen+3Z1uPYPt50Zdh0TUNxqhRQSdGgKqvHPpjUrF5twX21gVaNjZn2zKoIks0EIOdzvC3e4G86uAtwn6LVdjOrc2eY7zrP/+QpnEFekI3YWbUYj14Yk18pdCIFKrHDiEP173D3BzAPw+NhlGaNtivig5A5QBkCUQhi5PpyzVr6ESoom0Z6Skx7XMAwL6lc+bp96EF2DHd36PNycIjYCdrWR0/3WlLEilXxPh6gt4gBGbuLCf26r3Gj0npQk97j5q4Fmz8dYvhnTHUpeiTnevA2lgsUuNX0evFut3U/9jcbEtft5DcYXE43r6zUbOFG5k4d6H5lIpkclujWX2+cLv/6u2gOMwDBKaY5HvZhHJiI1u0M2WDiZcROdWrM02SerBoiIvVIlpBc/cuibi3PYVY+hdaPounJZjXuzIV4zktVTeMtjHEIk0DyyFiJoEdngghwjjyZtLtW1OToTZwbHvXJkf3nIGZCqW9FcnGY4WsEFQ7xVa1kT+WyA9aFG/esfilDRcasXFzcLx9pJfKntsrPXKcc2WR/aXsoVMlBXYmeiHxlPrvZiroWBFV93n7BbYRXqESImC0tqRktKcStC6rsK1v/QCJ7eaq12wVtAmQJOqdlqAg+0abEceASvhnHb1k5V6vLMngCq1D3VvCChxBMhIcSnrakdMas6fjdXiGXwhjgaDZzA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jYNjde53SO674+4briCguHFDjYR1yhAc7Lm23OXh1TxzRtS3taMHcymB5/KLZK7Y42SKisc7yJDoXOkZ6zLAS8WxUJJ3W4UPBkBRoFPxTp1mI6vWZDW5RNlOjADG5NAEb3T+aUcGCw44IQLiUDhlPGbAN+nuHhKlPGmjd8lRaH6O78Eao1LO0XFAKxdzjr95tpOip5+9v+itVC+OY1I0ji2qWbCz3TdU0/bns5kADO/hoUeW+eOuFeN2nDMOH9emMEuUcIICtT/b/zIW7C6QZDCw/7/YcgZoHwVRSjWWYHrmnu/lCo+bsalI3gVNEgN8E9UZd4O8GT/LyJ5KUF6QhCtw6mIK61aFA55+wJfWDrWnTlr2OaoPXmr+Z/yZ7LH4wLSrGPosc9mYgAFJjodx76pLUlpnG8ntx/g9LS3ZnTiITMIUTLXUabcr/Ws3FKhB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:21.5903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2709b444-3e6a-41ee-a623-08df1ec77ac7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3762

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..083ec93a2b5f 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1102,6 +1102,37 @@ rtc: rtc@46000000 {
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
+
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

