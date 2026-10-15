Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazhn15010000.outbound.protection.outlook.com [52.102.160.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB47384CDF;
	Thu, 15 Oct 2026 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.160.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079332; cv=fail; b=pc1a0nxJ3OXLijuzGBZUNmjEEMowQSShtcu+PJW+8WU3U9CxAhskPWFC04lmMc628ltgleDU7l/3QtTRebarSB5j+69B3mXUWW0PW7+6VaaK7ZUUQIwvgLEbNDo8+lGgeGqAAqX8DlSMuJ10ALP1mFeiSolMml3ULnw+ehSSEHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079332; c=relaxed/simple;
	bh=oLyJlzzQB1FXTkjHaZm4mQ8PQTSVuRu5R1DRQWgAvWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqCBuSwiTbkTbvFv7JPROg5rS3+5qdyokJi7jgq2mBdf1biYyzM3ZwlIhMMZZhG/wPOmMzaF0vCmQdHRW1/vlOobiVghRXSvN0rIdwOyTkcahJFBfcSEEsoxlHb0earWhKdLgmDDXyUFcc0vMVxzlTjc/KBeagkU2X3KQwz0Lcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QpOBmG5k; arc=fail smtp.client-ip=52.102.160.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QpOBmG5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otQOP1ZOx3IH45CzAmybMkXkKvW6gjtA0uXiyST8USph+XaIR70Zmjnilm2ufOiZ1Z9QQcWw2jckeWjUbnBjjkzOQW2UJaaoWT12npOmMuHhCNc+p0rX9brUHU4bav+xB+2cZUqG5XkjlEO8F0H4hxu1QueW3FwaWd3e8K3vVussjx8tSC8KXtTVmaDeNgM4foavqOwRu2/ML73Fmho2nVU/kbgdRhYYUEsL4Q9mLosl+oNuIFaozb+b5a6o/6zHyHuQkXQiwX3DYwt2yvd158xTZUNQ/sJBP2OKIjoEG+RN06bImOZ6j6Bd83/N3FvKndXF6bM992xqCM6tuC2uZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk4YdQhy+eKKDp/clV2MTuBm8ty8Cm9a6Pe3m7f6BO8=;
 b=qRAVImTvXS7wD8sAWJB/PS6NZ+hcJPXe2Z43b5MODsqnuFiq0BhZKSCZfw/YSw7ryt6vdJ4W5v+4OsacaRh8OZmcE/KgrrtpFSO/BeHsK5kQn24e9KG+rgBj2VjfWv/X2rys8bNlViCuzZcfpKHPyMwPa326kJ/15mp/S1A3JU8BQnXNargH33eI1DKmtzc5V1xjLYf5rSJ22CnyNLCTXax/F4T8xX5LAK61qq9EtiduwdytEUvTZEj0RDpJbDMXmUeQotPR45xtvE04Jo/sGMEIIaYdv4EPFrNq1P1OOwmA2aPGRvxcQQrwlKm+4i60cW/IgsqFPCQYE4XQ+4qGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk4YdQhy+eKKDp/clV2MTuBm8ty8Cm9a6Pe3m7f6BO8=;
 b=QpOBmG5kYU+vso07TYwX9iHh1eEyjJOId8TkOUVyPNNlxrP1bz7/1AVYUQ98SrmsSAiAtfbhOCsNa7rPD4vDtuLRoUFjSefkVUBi+Hy2xeT4M5ibiiEabt9j3MKSZNiK20fXmv3JM1t9hKS9uiKYDOFDiqE3nbTba2U//40A1u3tonIw+g2NmRP2aVJxg8qXYZ0eo2bvTEQ6yPIEs4eQY+b9perDZI0iivi76JMh2m8GQFPibei40IyLcHMUHsmn0kcWjjAneZPMPPtsd8nWFpqek7U2gUPEFN42XuLusxPaiYUoZVxYRQVaFoJ53/HuPEZA6TJjMBwTA/IWwcXnPg==
Received: from AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::27)
 by GVXPR10MB6006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.13; Thu, 15 Oct 2026 15:48:30 +0000
Received: from AM2PEPF00070CF4.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::9b) by AM0PR10CA0017.outlook.office365.com
 (2603:10a6:208:17c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 15:48:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF4.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:48:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:56 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:28 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 RESEND 1/3] ARM: dts: stm32: move ARM SMC watchdog to STM32MP151 SoC
Date: Thu, 15 Oct 2026 17:48:24 +0200
Message-ID: <20261015154826.1947492-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
References: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF4:EE_|GVXPR10MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: b01d5934-350a-474b-f3fa-08df2ad3c251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|34020700016|1800799024|376014|18002099003|22082099003|10067099003|11063799006|921020|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	82BEvFuNH49UcbPDlPwJxTukAvVuEarjNuOjvbEDeUoCjDx/TGHagaRCl4tGp/bUML+RHRxeqZDy/6AnHbkWjGByBwXy41HsAR2x1fBI/RPpl3q+dpxi5iTXaFFY/Yc0cDEb1WaTaggayv7+wMHc+qMPWHVDsWwG/mC8G4ikA2gJAT2brtTP8dOKRwdNGk8wrodBbNYGYzst5S3dnr565Q0Dy6OphD2YWjDZIr6hO7JYRgW41VKFqdevNwp0d6N/qVQmZ8c4IrTOYL9TzlAdcthOrwDoW6v/kRSQa5BlFi14t4kLIeyNkTYo0ST6NHPFVD3GNQypz3JmIuPHCfRlytBFeooQQthAwdXOiACfa9fmmS/AgNVwLNos1hY/r9hHhrj21lqd3oSOZ6o+50okh7zmONHo/zdCvgTxiImh+IpRt/qpriEElfefRHkcuo+xJbt1yNk4AMjayuhPLpd0qMe2emC2sjnrrFjmMCmeYXscevmEwj9ShVnXYSj84WIQdPSPGS4oHNfKe+DQwYikpSDf8vExj0kqESxz6I75+B5kAMwiCO9Gc7LS4FyNz+NcDgUKOwvAiNGu9gb1dPc7Iju/imKpAD+adnr3vMPdjQXn8vgGX5qkCb5EukHEm2en9CTIa+RY5mj1Zhg7YhMIOGUFRmZYBwPg7pmTRoahOwckFJKiLNrD8qDKeP8ZOLY37ucgX65Ud9A2n2X14ehAiUjEQYAKGBhZWgSFpCA9OBDX3yXX8EfbgPWZO6caAg7Z
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(34020700016)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(921020)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0a9HmNQ/kXzKG4/kcy2Y12Cl3kraqeSRc0VYwCzyosHx97mH1vrhRr3wpa0iQHK+PNvjlKvDcyslHDT2SDCIbESzYS+wR7KQt80YAH22AHcE1yVf8/+yVUT7l5y4MItjSWxaNmcEMUseeXdI70wSZ973yzjzZFuqF5QPX7ryKrmMBkVJoIIl8Yl2LikG/gmRL51tA8XuwnRjKrx6cv9wb816FOW6fmg8v7W8HFqIQEdrxh3tkKy9ZBmXeYdC8MD91VxF5Ly24XyT6cGTYAMMlHGBDjxFWifxrEf8mpMmJF8Niiw5RI/2FGS1/EWYw2/pwnt9SQTCcdJoVcZPexNYUCbESPRKbmeUx+pXR7xMhzc0cK7vysI9e3UWQK7ziqEPPOPhQmqQV20QJuI/HndiFW2jVJAiHMN3WCR4vHum/oCDmvWOAaofuCRWJNvicYIe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:29.5727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b01d5934-350a-474b-f3fa-08df2ad3c251
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB6006

All the boards where IWDG1 is secured and monitored through OP-TEE
require Linux to control the secure watchdog through the ARM SMC
watchdog driver.

Move the node arm,smc-wdt in the SoC file.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi           | 6 ++++++
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 7 -------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index e7fec8b49ae16..3d409f1baea49 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -31,6 +31,12 @@ arm-pmu {
 		interrupt-parent = <&intc>;
 	};
 
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xbc000000>;
+		status = "disabled";
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
index 172347769e025..27ea5e79efc66 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
@@ -13,13 +13,6 @@ optee@de000000 {
 			no-map;
 		};
 	};
-
-	arm_wdt: watchdog {
-		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
-		status = "disabled";
-	};
-
 };
 
 &adc {
-- 
2.34.1

