Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800945;
	b=LFfe/VDZuuggXmPYF2qVG1/jZMzeWQVP9fQqS+uXN3hR//ki2HQzOyM78MMT2AuYUyAa
	 +1vCdBMAd/LChbBDtxkpJ/4V1iorQDmrY+yPtKTbbwS+ZYkehIVyB+Bc+p+hcvoaiHSeB
	 bmIA+ldESsiDfRRs2LTNdPstyYJ4syb40GnPZSGNPeYLlZ9Lqk4/HPMUVcQAt4X/OQP7U
	 NpG/7plnKLCbR9n4HUG/M3uLn1h4gGlVIbYPkLrvhgQbQNeg6l5TXRNmXQEF7JdO2u7kO
	 2/t3a3gd726JCvlQhZOjzA9akggIHcfB0s/yPPAQ88xJEJ9jnG92i4opezzVY5/Ztig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800945;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AhorePfnZ55QvFraC7/jiVNYcei1OErpeWk1eX22FAk=;
	b=XJlf1W6s9VX7AVuDW3p0jljayIFc+QovUJfaxydGkoQNZfknpPYg5w7kQ7/sXrCMqqoE
	 +0bETxoiQPfH8VEuZCSEuuC2i28mXyQterJ5WSQojAKJXVP0dyhJsE23Re5n8qUyczkMb
	 kcbto25Yr2PAJfj8mW7ZPs131R52o+kjaQLcqg44FNDY4PBsJkXJVU3UhNHCt7fHq/3p2
	 FpjBRbdY5t3BL4DUjxVYdvY1kuu8XjMygiPukDO+al+gDbd7knWziNnfvUv9yZMc8kg+b
	 k4ebn3u5RXEaS/8YL26OxkFpkoU/6jgZlTd6PacWQiUH3XVyJ7a2oM68hsd8cZ2ALKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=azW5Tbev;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.45
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB958606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB958606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=azW5Tbev
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5cswwwCr6+Yx74aggfKtrla/bYRyC6SzWPnlWrZ58qv2wJ7bqu+3GUewBMPUn7q+LCwzfP3EGNQm0FwW+cJ2vzuAbPHvcOCk13mTxOSsOZLpP9qJzpvjACpaIXJms7jdLBuv6OTnFKMxsaCV1IE52yuehA2D8tyil7cCX/z1203VvSQSMAD19szAzh3W7ynFrfgOeZldSM2C30Rqj8+akOCd2fgEwCCHq/atbtgftwfFuRpHsZUvX/ZfXJhW0sYEJvMHjVLyklRIZkaBr4eqGol+OptdXUdSlkq32+4Rfhq2wnmZNQHKntaruCBlft5rxarqBv8NNm0d1Nr43omoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhorePfnZ55QvFraC7/jiVNYcei1OErpeWk1eX22FAk=;
 b=HVZaxKWqxAHAIZs/HKPkuGz1ykcaRjoQ0xdI9KPw6IfailD8CKUId3mXl4Ba4Eiok1zkvE+iWqZ8DDBQjjcGqJj1z5mSsjFc9Qqe304sJgnb0i02TEMeGoSEcuNY6XrldaIX81rRMJBvpyOD83/hYAmP3oiYi5SeOoXa1nmhD1FhD0DPYAUFluIzWHUeLwVms8gW7Y6iH+4hGxPQVTSQIETiEhBMXS242Inzir0neVb+K/yuTJ/VTQR+m0fnj5zS+Ry/l1f9SPl+a6YIV6FJF4RGskdkxdBbCYscAmoLzeycGCH20nXYJZe6M3RgJXjVa+P3pLiyfV4IdFSWwdKbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhorePfnZ55QvFraC7/jiVNYcei1OErpeWk1eX22FAk=;
 b=azW5TbevTIH770piek8w6D7ziUQCsi87OaHriDPT+rGdZqEbalDM5pPUL5kexcmh7F25FRKO56SxNRdm22QlPoA7g213lzmz7eRkjYC7RlB8xLIgtbMRtKH9D3fFXEqjG+Yp6iew+yoB5xbkVyCUDnF0r7aFGjmA9RtnOWaxxjs4dAucPGOuGsMM2MH5NJtv05ANWJYAuYvj2AqOcHNZAHmVUnNKxMnNpyK7V1EoLhZtMC/8+6jzmpAK10edG+aRKxdMsI4ukjmwxbMZw+swr81YRmgqJ8j7mOOYkg8ryVoYvg1pcuVAa/vEWO2n/AyTux5YkHn00vgK3AKD6M7Ejw==
Received: from PR1P264CA0200.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34d::11)
 by PA2PR10MB8718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:02:22 +0000
Received: from MI3PEPF00008556.eurprd05.prod.outlook.com
 (2603:10a6:102:34d:cafe::23) by PR1P264CA0200.outlook.office365.com
 (2603:10a6:102:34d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 14:02:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008556.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:51 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:21 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: nobody
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/7] MAINTAINERS: add entry for ST STM32 power domain driver
Date: Wed, 4 Nov 2026 14:55:06 +0100
Message-ID: <20261104145502.3.I878d261f7f2cd680f9b13e783acbf07b9c0c1425@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
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
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008556:EE_|PA2PR10MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 7998d3ed-0e77-4fe9-3c4c-08df3a7c3f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|10067099003|56012099006|11063799006|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|22082099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZffZ6loqT/vhDzO5C9XF9UzKYHD/oKebOL86OAF/0ZTG9DIozHLMN6FKRAmXqlRpzaMlyXGl3FHz+mk1jFLSFiDxcFbgP1Ya0nY0lNnhQmG1773MGRNII1y1rsxxD1ctzgOwki7g0r4DGiapBql0VZUt2QAszEWtR+8xzyRkFi4FlhoLqJcs9dT+7Dhb25CvUHJwiCrZ8tEVhp8BTlqrGEL2/m7r9hPmO5d4d4wFY0BBjY0XjdVOuGNCikrmXs7TCuexIzQ3mm3nHpunb1LUgOnpgsKsuT/tSfX4tzovCZVYbAGhOu8J9BgJnG0Q9Hzm/y39dofMV8FDiJjKPhzsqaTtR+siSJVE6lW4xzJUwTFFZZth1p4gWHwND21iHZrH74MIWsUUkObtJJtMzBh/nXxukbLWPNcOFHC4xNHWWS9bfAKm/3FK1hEVzoidoSJMsx3t86NphhhJhMMF4CI9MQIrDE0FSQDQzxyC2JorXlV1wqZU6d4uZrPCTUmLL0VNyoZ/eJjPggPU0e1DxC4LFbw2CnpCi+movbcSljytUGx+7q6ZkvJLIQ3ryxeTTUqXwfCci3icT6AgNAWUqQj8rw8Gn9VntPX2odyMgWqHf81J3xVF8iXfmkIOshWBkFgQuFkkYZe366mwKXrD5mhDXzS7WOrtC6UeWbEyDHKxtMmRnpiSqZdakY86XWmlNACJqWxzQmuol0AanDQoVqKlxg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/UCk56XJw0LWdGapmrWg8Cu56EZr6W8JnWrLlRcvpMQrZDSkNhpX2qw2dFYJBivm8bEkwQuOhBcWOpM0RU14wwiM0R4ivU9FeZ9bWkcYdDfULAnINdVyanwJCT/3vJP5g2UBFz4bjYTtcnAiUQM+gIBTobJdXJTV6tcKsjDhGm6kna9Tk/JAmP+0lofdj/g+PlwcrYxo463WvJFYI83Uw+ptiF/dMUBQkwoslJptx13Wi1WhVBEQ7x2MJwsN4eticz3Y+YESxhLVhSPCTW72vw0KypPQMXAJLilIQGoaEPK7R0cW2Owc9ynedysezFTY6a7HtzyqoOK/cwnKTUsdEoY2Ckt8q7v4KUgmfCktVCtDl/+rQ1MTgQtWwB8yAvfFNGKJG6UE33z0rEl3LEWjrTb6txqAwzHG2Js7vKHgKr7OWX/yRrP8VGioMY5VOXK0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:22.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7998d3ed-0e77-4fe9-3c4c-08df3a7c3f4e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008556.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8718

Add myself as maintainer of STM32MP power domain driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..8644100ca909 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26571,6 +26571,13 @@ F:	drivers/pinctrl/stm32/
 F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
 X:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
 
+ST STM32 POWER DOMAIN DRIVER
+M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
+L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
+F:	drivers/pmdomain/st/stm32mp-pm-domain.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org
-- 
2.43.0

