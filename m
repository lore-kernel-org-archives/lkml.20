Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazhn15013061.outbound.protection.outlook.com [52.102.174.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F42BEFF6;
	Thu, 15 Oct 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.174.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079331; cv=fail; b=PDRjYogk0MF166v1lTkdfYK0i6ClJCVqpSIDs5qc1KGqsSUtfUU94SJ2KHoh0N8pERDQstHhL6ke8R0ze2ANSBpcg/7xvi+ihIEljfi8AYjRAGaCvlEAGfoHE8LyCvYpn7ybF5jokg5dCrSwcRdUzx7/Nf5INI6i+vLorVxfe/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079331; c=relaxed/simple;
	bh=vrjk3y3bm1IlxQN5z6elkTiEYt3WaX/nJad572SjzSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ih/1v+Y2z2GF3Yg4Ne2dspWp8yaPMLS85GdK9Y6tptTX8gVAx55QveWCSY2bCy7EbTF2xqIXnPGxp5POptGCcMKkQ/M4IyOFhefCcZUUNAwq4dbv1lLHyIU/bCDUMazpYMOA0hX7ZRpqRRbvHjPceZfVXkvgCl8jcyu0Mc8Pa3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oqcYgt2h; arc=fail smtp.client-ip=52.102.174.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oqcYgt2h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QODkoOmaxR4FS9w6YyKjnt/goLxF1UiDyBzS+xoMilJxK0YHIoG3if8wvLwPlsWvPoVqNxE5lzhPfqnVOQxf/qnrt6g13RnadaEkjwJBWnLYSBtGFJqFSCIC/PZFW77kgLzhDEuyB5um9hMR1V4LEnQb/g/hOhBgtuVWpGNPBTPL5l5nIXydAY/XQsqE272gSt2FqUkGbtzHN7aAR1yKMOzyqN6wcUh2o5QMxGuR4sHclgcwTAFpKn16P2mru0vXHXTn9D9tnT6REIF7ncR9ate92bMxE3t3VzcRWD2xC08Bw3Mtw4fQGSoJQNIFZYbvcISWCOSZ617SZMuTMvyAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihIATp5UQQL9Dp0VU4sU+GurghNXmufV7YQeudo0EmY=;
 b=uj2ePcszUopAgMp4dCmghqPhO1rSRUqn2KrjHU+Zdh6A3Zho7tGnVOLMAHflRtPNBn0ueu8CYiJ199VHSDBxU5+k3nW/OinbHmBREQ1mE7gkzSNFts7cbb/jEaRRRJrKfS4Gofc45QZJ6TCF9cyWxMkC+5RMVLxG1z9QHK5XIpr3or0oKxa0bVA5TEZHQucHa2CJedtjtNiwQwiIJpF6HD93hePQol0eayYKkMnHxFz5ghc6ppQoh1plUoa9oKglwzkqn0s3xp7T+H4oji9hVZb5mGX5qSVb1gjLGPcomtcEowpUAO0lbeACZHnzlVWrZZ2p8CGWKvzKgJNd+rg7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihIATp5UQQL9Dp0VU4sU+GurghNXmufV7YQeudo0EmY=;
 b=oqcYgt2hDAuyd1qM6y4l5Tcg4Q8BxkmhPwS9mEeyYGVjR7urBvGtrK2w7YHE8SjF8WXe6PKc1DbvOtUoErSYvLU4Vcom6lKFH1ofif/F/HrnZYjHNtPPNGOeUrryGh+ERSmFxCypFU5XON8KKnVZxeeKeiRvTyHbKmEvpPnmp4jRrplXX9kiwkWalRK/o8jYutf0Ei3gYtJCTGOHh4ooOJb74S7MgoKrVH3kEc50FNeujKkb7zvRBB8zZiIpsbHEgT1B6QRDGZlvUg3zasH++9P1jmgx5en9g/7/8Llt0hbVl0W0c9NIfZFORchP0oEU/c/NrlxjK0ghraBh6lvQBg==
Received: from AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24)
 by GV1PR10MB6658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:83::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:48:31 +0000
Received: from AM2PEPF00070CF4.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::72) by AM0PR10CA0014.outlook.office365.com
 (2603:10a6:208:17c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
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
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:48:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:57 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:30 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 RESEND 3/3] ARM: stm32: enable arm-smc watchdog on STM32MP1
Date: Thu, 15 Oct 2026 17:48:26 +0200
Message-ID: <20261015154826.1947492-4-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF4:EE_|GV1PR10MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: ce978ded-e9c4-4d66-8ba9-08df2ad3c31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|34020700016|1800799024|82310400026|23010399003|10067099003|261009223027099003|11063799006|56012099006|22082099003|18002099003|921020|12100799066;
X-Microsoft-Antispam-Message-Info:
	nC/UJDOcbBXJupBvK7RRPmiGG5OUdvVBt7P1Nf332mQceCPoSLK79XYAJAZ75J7ooFALGOgl1i48RCoXAUVaZ37LKCmASm6shcYGv7ba59X+oCvtQuQZoGjmV0pmhHOu7CMiI9MtIBHol/kY7vpirgo78xx6miY9AInQOO/XnBFaDpbOpvTwqDuM4V7o/ffiUx7XLs/l4ZKU+g5NLWwKzl/mKqaIrwhU+vhzNimxSrU/9dZOAGVXe+Tj/XbmO7fhC4r7bW7waoWXJ5wBBCBsnqCfbhgsV8pJnW3rjtAnnWGxhzwnVLgLqU38dA02SVDfr3joAgDrzRllX/nNqnSIcWdC0kqC8Gy2/O2SWxcD6q4KMkNYTpskKIaXVbWf30nIw6qpzFu3jZvHEkIS3T2xDCZnmNRL8MLNjS5SjNx7bx0zXh6jw7cdD+Es4aJbm2QsQTsk8DSLiBU+uShOgQVAtjKnVj4LL5cfKXlstLKACiZn+pnwKMD2Tf/+cflL7HkDB+msy87sn4shP0QJCF0vwZOCOHyTWqDkZ+C36xz6DbKXkjq+G4NYF4pu5cT0DiB7UGFHLYYfDDgqy5Fm0KNsh0TEdea2caQuAnkTq3TLUpVuFwblARhwfbRBLCEZ8RfUlNvb61PRHiuFaifZyvKbsuR0A1bHqGbn3f+n4OJnuic7EA1pKm2ESr6eC/NF32duY8JDRWKjZGea/UIjZrgE6UGOUWKvvd83BfLTGnI6V2X2tFX8hcE+5jrOzpROUsF4
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(34020700016)(1800799024)(82310400026)(23010399003)(10067099003)(261009223027099003)(11063799006)(56012099006)(22082099003)(18002099003)(921020)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DY5H8AFjQpqESTxiFcE3eRM8eA84MyWAGznVfHRd0lx/pKYQ+N3kITU/inQL8fYI6Z9Xt7lEFc2AMBAL3U02WQ6U2MWC//v1cr9rg5krqSF0ngdGeKFUAH804X3NcKXbLzlHbGEzaJyz6ET6P9nLrRD/6kF0KHIKMtq0Tj83jzJ4VCRbsi6DGEUY4c4OGlX78ku9JJKkg7Y9J45ghioxdlLYjI/asO3wnLZUxTKYr/ZC1fJLKRu7pfQuEcDrrNmPd0jdUTJn1O1Q9VIUwQ+Xcfhw1t7KqO1pzm5R4CyaMHra9jXguXH8SnAqjYTmTqusJyzRO+mVl4RaFZfMERk5+OXuWrGs2zeWj1CaSaTwqACurLzV2jQHZL2RMHJObjSXFy9WPyy6jUoT0JWPhGMjNCk9IcpVSu7sNaHemQ37nUK8idnTN05RUM604x4X2geG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:30.8984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce978ded-e9c4-4d66-8ba9-08df2ad3c31c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6658

The watchdog IWDG1 is secure by default on STM32MP1 SoCs and has
to be controlled through the arm,smc-wdt driver.

Enable the driver on mach-stm32 when ARCH_MULTI_V7 is enabled.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/mach-stm32/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aa..de09b2afa0f2e 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -13,6 +13,8 @@ menuconfig ARCH_STM32
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M
 	select STM32_FIREWALL
+	select WATCHDOG if ARCH_MULTI_V7
+	select ARM_SMC_WATCHDOG if ARCH_MULTI_V7
 	help
 	  Support for STMicroelectronics STM32MP1 processors using Cortex-A7
 	  cores. Note that support for the earlier Cortex-M based variants
-- 
2.34.1

