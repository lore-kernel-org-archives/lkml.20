Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810500;
	b=KhY3DqzIgnfdqYOYgjCqAXU7O86KCitIlLJg//LMqvn7c0HNm1FyUV+4zw8T/incBD3e
	 LcptIdD9WlkIYwqnAEbgIcLMHAyJvVEcGszwADSVJ71VEErSBEymLm4U3Eu1LjE1xU/wK
	 IJ+cpmXKpBR+T2wvo0EtubmkHBW6BkueI2wwBZjf9q/PcbB9UWpBRJerkW/7SPuvQll1o
	 CbSqLV1ClYaQheDnPaDJOiYHbwHEBBOKA/UgiroLJW4pm9EIfY1dP0prv5yNSoCYNyHPL
	 cVRXnM3PjjDn76EGXd+axBKZl0Ogu73fRIXa/nYZG1L1GW1r1Wue7Z8yx+EpIPNhVzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810500;
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
	b=dGvnW9ot6gyEHfecy3rJiHYRO3xHzmmt2JIlZNHfRUokjJaGd8RUpIBaBRwlKH1bwWGK
	 gzop+rjwLoUUGKeXdERNjZ/BRPsM5UQj3WRup64maTFl+2KTY0PEukDV+zdY+tCmgUCdE
	 2f5rgh1qwdLxp4E9QA1djPGDs9+G2lFlLfyI56JQ9aXSd6LegMgtzZWSscau1ZWWeflOv
	 lfrerc03HEIzuh0PVsTNKtTgSrjEo4rnU3fkwdDRYAk+ZU9MjLFa+JFTJMBErg+Wnc4ya
	 4iCBer62To/AZC2gdwSzS+liQJ+6gYg/5UNSLORq29B+E3/+uMiX8+GaPMA4IaPpTeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=T3KKTU76;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.45
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5B606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB5B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=T3KKTU76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxNS3/i/51ARkAH/pvw4esOxk4Q3KNCgwYBS5D2ssVhxMtO1+38FrkjBXbZ4C1cd3krJJTMCZEYbr5nbfKacPoRj1Ywqd6WGw4DestuUhywssuwq+cN1w8dBf9zDsT3LHJW/78dYKReWycgkOc0ha+qLdvETNIYYm7xygXuXJKKzE4oi6CnvxkrRreo42ZSU569LTipcb/h2TsVZ2cvr1W+vrgelGpmtzSZTebPIHAQTiYN276rJPPIGO8xzplIRL1IXN4ebWbj+MsRgJfaDiMMpShwGlCRqd1itlW9+9pMqqktoXXdGqg6gaySJPp3DcC5d+47do3nHpukSNOpSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhorePfnZ55QvFraC7/jiVNYcei1OErpeWk1eX22FAk=;
 b=l9H35+RaGqS2/O/PC2EO3GMlZ3D7kPm07ievvqmLCmKAj0kfi9Dae4eYZdm3wc4Bks3MnYoICIP2EiDZKtOsk8fbDUirGxb3kI/v7WH23ZmOGQBFqkBkva2xmNHbxuSV/SsaQb4kJ4ilF+JVDqeDBqbHMlCZI+FmNSc2QfdpQ/pdtEZPxU2Wnmwn+a2xwZkpy/7sxSbK2rap8cJMbgjPZVWBYf5A3XFIHrpIJf+E2FBqRHg8RnknxzYOwKYqGEh5F9u7dGh95RVQLvIXRhaP0b9/t0242b0VKgkaRp7yiUxur6/+aubBHytA0W1Y7JMpg4kHdssggZUEyP7eLv2P0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhorePfnZ55QvFraC7/jiVNYcei1OErpeWk1eX22FAk=;
 b=T3KKTU76jMmQ13ztj5kc5/UcsiMG1q7mo8ue4Rp/dksp5P7cBEFyKFys0/aO+XeaLhtsfHPocrT5e+9jbLYlaSWMUZbJKNS2xPiXQ9kNa0MLv+WoJVOFusKQMRLWdhz6sSSDZwSqNttPiI5Ue0yybJ0NHeFI4CGGXohxQ3qvhIMQ71v16QyYoCMgVuy5oOD0s0MwitF9rZwDDJOd6yOfv7xb7k2rDDnI4PMmWlNErTDMQOGbdmxkMKGvLNUIYE9SKjr9e8ED1IDLqxlqwa2YUQWnVGwWX0f5SVSV4jjbLA//Q9jE6+mJoqUnGH8xXCm1oWyFnjSEXAtDIoq7wEbCFg==
Received: from OS6P279CA0010.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:30::12)
 by AS8PR10MB6969.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 16:41:36 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com
 (2603:10a6:e10:30:cafe::42) by OS6P279CA0010.outlook.office365.com
 (2603:10a6:e10:30::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 16:41:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 16:41:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 17:41:55 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 17:41:10 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/7] MAINTAINERS: add entry for ST STM32 power domain driver
Date: Wed, 4 Nov 2026 17:41:04 +0100
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
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|AS8PR10MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 733a0dad-baa1-4240-6465-08df3a927d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|18002099003|22082099003|261102123227099003|11063799006|261028144727099003|261026140227099003|261022105027099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	wI4BCp7bVpO93zM2aSjILGAXS6ExFN0kvydPtj9gqdJa3H3Vu1LTIOd+Vqg1ApdUaYA64NJGpuMkRpj2RsiQxAga8AURGtNzhimAVOoW4/XqNrtaAWN5e2l+nxY6oYSd82YSHcssRFdLDdf2J1NOZD886oJHhWVSOYBuIwO8cYOaDOvBObmrU6TLi1FWKltTbPgvA4tc6M9Fj0orBnfWFEs7GW4LLQ6hC+6Rww6z0S73GOACtazkJBEE28UP2duODPBcQor1RPdbTA3MxWtSt/Ag5EE/G5nYA9qD0wU1Q9XCPl5/uZNVbHw3JZDNgHEACVzT5fKDxz8TZWWzRaRZcR1HqdV2b5IIbzBxW3IeEhQwcB+4qHyckp51iou1Vm754efblKSpMhGsl3JkrJIXU/hkSf+py6gZVSiAlD6W8cdhPGK2m5ZYCL257ijFpsQQKTTkBgFfjvgMzWaTA81a532/dOW4MnM9mz45LO8C6FI56fYAY9jinWbPzFv4QybaanbdBHO+EjRlH2mJjuOfnIAyu4E6x7mT2/yTOrLC+wnW5ld8whITpSeposg1Vn2xBE0yvJhyf6F5VzInIBE+Mc7guAyH6VXkKo8eAeZ1jKAfVfEQz9Gq8UdjiB9a5F5dTeBxlDGoLhwdnNXyMY7XkcN+6vtAkEnxVH3R5+6IsKqaLLlD+z8bVcIy9Fhix6/5RTJ2adnVupfAgUkXGlSzoQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(261102123227099003)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ss0CaKYrB12LthwPUwz40v3BWUb+e+V6PXbAvWJlYoAbTMO3wBdxtyHrzI/5s2gpOpt82BvBV4AzITjVnZlelUCbMzWRwqyAwG4u6UQtBhD9+VuendIQoRNvnedxPPvMe/+WSeqTXNRHPTwh98anDDz5yca8imfr+H3pA/R9YbIS0qPK7uZcdFR8sYt0hZFklBEwXMQvI3cqFPaidla3xUguR+r7cZAKSqi04zW1v/sFHcsfVOl0dDDU0oFgWf9yM49aRiKAaH6BIfoO6o7LPjkoEtDt6GEHyvBeQbgrI7bn0zXvukQEDwQUMHe/w7yI/wpKWeuqHyY0BVR+7T4XNonqHbl+rrYYazuJgPaTRrqkFl0i2+4zFB9deMLjydA3xKBi1xEq34ZDMeTDoB1GXohrj4QbO5VueGQPysWYQEPpwaKv4uCjW4nMTWTS5PCX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:41:35.4958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733a0dad-baa1-4240-6465-08df3a927d8f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6969
Message-ID: <20261104164104.X8vz28TWB5xAu_SjhUkN2f3UocMWM51FvV3FfKzKyRc@z>

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

