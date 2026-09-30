Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4C45D5C9;
	Wed, 30 Sep 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754628; cv=fail; b=D54wFMv+imEW4QdXiFyoqQCODEXUFD2y3ju43mwCREAeNfubsHBmiWlQIplBOKzjyr2+QfWkIGWy1SOQP+0xYeLEpRN0eStZdHmDC3ZPxWPllA9gsmKym3fFg1+sdDiWmFTbodc5QM1U2k533riBhTwi0LABW9R1WMPlSLa3B8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754628; c=relaxed/simple;
	bh=FZcRiHKZG2caKIkaYUKaLB4BA605Ld6ig2ti19Rb76A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qyimf+Z5OV5FtWkFtJaCRtQryAzk0kxxjRixCCQUXh36I4CrXqB1HLFFbnzrC7BoX6k9fM2NJ7D6lWgOGgXWJHfvGOJHKxaIUZz+V9RdThnd/5aFKFOF1OMGKdUadbU8r3oBOPL8+gZbSuGwMBPqFxV9R7WTAriTJrqT6Unjjmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=INBDdfkY; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="INBDdfkY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeVanCRXwsD1yvO1Spl03XCWDezqTOoNAbIROVCPPOcZlzyukJ8lj1vGKWqW4konnQ9e2ayaVOVB4Eo+9uKoO7XY//kgtkXdBZNrxHcjUZJtqp3VT8FuU2JlXrMJ3dZLPJtqPurs0WFkVZD6y5wYSuBslyFtThnJgGmOqqBz3aJ85c2+/xtpyY0K6bj4g7ufdLpk2+slpGeZN5ObSny5VSJnCns1LlxWD4do471zequ06XXy6lXK7rFN3is+AFhX3q/bCKJAbfKRc400zxftxcVo+Va3j1xL61n0ZkZPb0qy62KOkTjEZgvWlzjkgKXGR5MiDJPp6gif6SQvtcD2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1HpGfYIgVrheCu7MraFrUPt3HHdNdeOh8pEYpO8X+Y=;
 b=jSGgIkQN6+bpEQWnMYe9p5bV2qkXCKku2kpLvfs9yEFe+cmqirPpkvPhw+hdUaON8kdSU/lxzj1M4tmlj/BrIy6aEUDnfxVGW3xVYG0gHrMH/RgOLmC0BVZ3Pj64+kfPQyPZc6ES+MqhbHJBkiQIl0NByuolhjQKJCU7671GTkth44qybbzNpWGgqwtCCwBglmNxjeEaoVOLMH/4TPy0qr5tzcdOvQd6OBWjYSBHZVg/bHbYg64otOQzt6hXX6S+FgrGPEYfVN3DJLA+2I4c9jg4I6aEQ0SEWrF7WJh3WzfCrExUN15ncDgiVGjqXxok5seHhMs2c/HZjae8R4MKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1HpGfYIgVrheCu7MraFrUPt3HHdNdeOh8pEYpO8X+Y=;
 b=INBDdfkYWtLljiweyc3VqKustMmdItJq7bKH8tctLBQvHvgiX7gAY7zgauXnupbvvDL8p0BJZeOFVLJg7JUaxenfhsKgXzO9A62UBlpm1qFdZSojR7oGE4rP5PB65v4rozL4yEq664LmeM2Fqdw0tUOF8B116OIylFLz1u6ER1m6wQBCycaLl737bH66XZ9fvTDKQpR0H5MbXBQ6wp0DwWsuoTwErOxDQkRn03u5UJfV/A1u6b1pTfuaqYUYFJEjLF6PVbWWDdFJj8mZeAJkkluf2XFe0sVQk8CsdgoY4xFB6iDneOwBElrnOmuCcG+9yiuvUvnCcdic9NwQ919Wbg==
Received: from PAZP264CA0165.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::30)
 by AM7PR10MB3336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:106::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:50:20 +0000
Received: from MAD0EPF000008BD.eurprd04.prod.outlook.com
 (2603:10a6:102:236:cafe::6b) by PAZP264CA0165.outlook.office365.com
 (2603:10a6:102:236::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 07:50:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BD.mail.protection.outlook.com (10.167.241.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:08 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:14 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:49:49 +0200
Subject: [PATCH v2 2/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-2-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BD:EE_|AM7PR10MB3336:EE_
X-MS-Office365-Filtering-Correlation-Id: 480a91c6-b5e6-4de7-7404-08df1ec7798f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YYJep6GioRvkzLjwkvv1Boo4O+16LNm7QRrBEbaie+kobGH7RtvKlTh5iLzdhUsUbBVfDTb2LjywPOQYx279HauDNIJZ33Zy7knB4MPm234/D/DclgufI6nYSmMdCP1u6XiYhfAq5o9IakjM83v6fKFmMC5R1K+LsSOxSXX0o6W2pZqMEW/C/7O78ZpptbT3YB0ufr19vNZiXzJ7dtqvbInHU2AMGK+lOwWHf2MJRHv2g6+xE3w+0tjtQbLO9vtrFPJRRO/yBuZ+MRdBJWB2bDvqHCnnk9Sp0CD6vgtppcVEwuTUmMzWQU5vzueA5Ku4WQ9PyFCdESKXvRUo8Rxh7bcaYVXdfp/0pTHrK47LC93pMpBzL7XjVBgu9mkkreY+AhQjrMjDpfqDpDaj7R49tldY+znjyX9LqEMGa+yWPnY2uqKaDJa4adArAPms+CA/O0eqWraCCYPkhaVCNraljtK9RJublP+y3YV6k6pl3lHsY5F+nP+NgINEwWppf1JVLA2mna6IAYj19PEIwprgR5JrarC+uleKWpm29hpjEd2mlKg2bIN6PJGYAgZ9Fhl95dfD6T8fM5IfXI7zsg+TN/DfVdOp0mj+b3/TdIn8CkrJWqH4kMhJfHdCJMSQVkG1i0EEnVXQ3E3X8Sb3mkXjFMFduM8aWK80xeeh2iuZszf+gWOFNHdXxvpi59AcDqyB0rHTueTtzP3s1G3INNwVCg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mA9se+LFft0l5jY53wYYvyhD9RbKSf7zYSDDOIMm3n6ioG1p/V8V12pFe5Gyh2ICtBL7ok5HPAT4WTxVLcO57bxD2xsXTvOASwzt7/twfv6SlErmWWHHCQ3R/TkvGyU+jIAy1Xftuyp8cffZCO5Zr384nzIOdFbJNzjDGL0J1CL4vVzli+6SCaN+qTvhoHCmoebieZkdPXkwVns3hzRzkU91xkNTkVrXOnkQ7Lbz3ZViHLhbLsdz6FoGkyACzuvcCGfZrpKBZmCN3Xgiv95QluCJwPZf0MwP1TqS1yOypOZ1nceiNTphgE36cmC+yuvvH7to3teng+1Yr3sYUizougMLsarPlJEL3m8MLdrkMtmhGgUKNu1FCwGlkWt7IpDQZQ4adXXM3JQ60xf4xvP3lpKO9h+Vt2A+JCORv+lqVnIzaRzRI1IGFhqKKhMRSDaf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:19.5465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 480a91c6-b5e6-4de7-7404-08df1ec7798f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3336

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 83 ++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 84f68e8563d8..2ea505ce1748 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -2060,7 +2060,90 @@ i2c6: i2c@5c009000 {
 
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
+
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
+						/* see cortex-m4 wake up feature */
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
+						/* SHA-256 value see Cortex-M4 wake up feature */
+						reg = <0x60 0x20>;
+					};
+				};
+			};
 		};
 
 		/*

-- 
2.43.0

