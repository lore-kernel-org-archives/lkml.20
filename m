Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF93A9632
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823432; cv=fail; b=BCDbVWOercI0DHhO6PR4cldhkb9qcTn6XA4UW91qxlxTN6BYE3rJaBdKsXSZ2ywmlGU1P42cDTTfESiOGJUM9d1W1FEbNy4Cz22lc5P6g4kyQwSkhzqXJe1W5e+HkPQyHFH1qoACB1DkXKsHh2k4n2WYpLenC9HDEqZM4bEwEkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823432; c=relaxed/simple;
	bh=m14YWp/mUTI0E5S89UUWyJyLHAwV3+BLim/zsp6X6Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LaUvaysNfZZHMEip3MqoyDjlPhtks/BJ8EavL796qv54RJMq7TwfDZItyP/pJwGPoSyEL6XTKpZBtpVHmBfRV9tX7ZO4AdT+I5ex678tthRIyq7N2z5VHnb1LW4LRAnB2RLwnyHY+3vkGbunc5V1xJsLUIBMgTCsHx5GipvPlAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YBv4P+/w; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YBv4P+/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXPuSad60xGr070r7yC0U0zX8d2cWBoG5BL8F8ZHliAKZPtYkDYS+7g74+RyomW0H1EYu0HEljViRzgl8o7S7ihlOvDEhbfIFCNeDk7LMZvD4agVvOp2jGJPFweNxpGqB/Dxz0Uh6KPwmHNpnUqJ9sugfkHXl7zVn1kFoPW8NUnZrmgs7EsRQ8OYr0WK78RbrFMxGxg16/0QKkr8UkRiCOsQLY9mB35Ji2u1F4hxcTVW1c+wuAK9XS0ycM30768BIfnKhP0iWB5iQ2yCoJj/8EMMpT/O0vQ2Dt035pC/OxSskPVm7oAxw9NVRiM3YMXypaITBZQ9TKWXfuPRNvucPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UJvWgElTqd/ArzMf1244BMaAvlANNGjqodhJQVP6hs=;
 b=uQkAARQrzNvDsa2w2AJEuVfEQwD6DQbuzvugDoGABTRiEFKb9fBK4z8dv/q1tMCqdNDW8ModE8gK6C+sgQMOsEsuo5J4bMZY2xDtYmy9RwZp0Tv8WAZ0XQAyyGo1rxCr6Awy936CXCYJ/L6lXYnC06rG7vXHCV0sHlwJKuIxV6qESM58gnlYXbMi3PxHEEboYH0NhJ6sBucawslsV3+/Wl/TJfEWyLUBcpLtT9alFl12Vr2Ha5ufqRNcvmUmj62fAcJSCySUeEqJMhY3++Ldf8SNAR2qpRq7Qaqed2CQjnEEWExjtq0bf7G3HLto6SnxCtlb2mYovK8vdrwG6vhIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UJvWgElTqd/ArzMf1244BMaAvlANNGjqodhJQVP6hs=;
 b=YBv4P+/wA9/mnXSqOb9AWg45KMiLE4jGFjzfAEO08FmARfju3wQvZH2niDMT2KvI+aIJ72c/d8PwbgQ9p5mhH8dhNMSmUGEXyyMRNb6huQnMo/T9NaVFqtdEWOozGXTtbH6GAg+klMr6Zj5UtyiU2+cVwisdC7/j+KNN6Hi4EhascYcYpkHCwKP0X46omKUkhTiuvtcr/eWw6GEVcVn5E3y3UkRXUMSVfPlF4OAOArmpquHPjZDCMCkQyyVboD5jQUnKQ7kEP7J5+y8pBVhuWSvvF7xEuy6VUDLSKbK9n8MZxLfMXenYiiKVhasFASpbFVgvGpJLehmJKSfvzi2yAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:10:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:10:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] misc: ad525x_dpot: use assign_bit() where applicable
Date: Sat, 19 Sep 2026 21:07:58 +0800
Message-ID: <20260919130759.3041493-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 05095e2f-450e-4705-138a-08df164f609e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZNZ/u644etR5X7+6Njjs0Q+gs3CY47PBLZM79/AMPmp7G3FDGGhsIE7PCP9x2HzlUxZWKIx1i1SinLSeUWnot8oOryY71hA25dkXnuapvGr6ED21VDHO24z4bTN8FITBxaPgVlVlPKHRDCHdaCaCrY+eY/ebSZ4tfdHTHLLwQNsy27Yb+1kk0wzL+GiiWDi0WPTQS9v65ofJmDk0R1EzCYizBMWu3uL89IY+yWB/phxxs7nSvj9WixvlRcqU6oSiHlSXVoQbz5UHlkvtkqnIIe+77dW2RDQLqzBrOpwviDKK3AkzgkEk/JFxsCaOs5ihYN2NdQL9smFevxfdg0SfM2b90QkQsFqxQsUzQallTFwBcFzDbR+fFoC6xefSD1Wj/28X6nXpRAHw4tYbKvjJBEVpPv5LW6WheIOql66W/7PDpw0SfldtM9/bM//PuQ32lACItB4M8N153VJNiBMjAzS9tok2bz+/r+Cl5woH1vJj+GYm43cQZgmV3sGObww16gFRU55LVZAgAHiaDFSSx3WU6zqTQJZUCqqgabQzZk4zhnFxAYaC0NL09xWrWp3m6XTHDTajezqfuJjZyOSabWtRplDT/42iTWZ6+m0O5o7bx4T5AWY9fOiSBQ6BXdhunJF6Otr/04+Whff6pJHF9z1LgrhLRCtgvlAYofvxnUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uSJtTI6dHc9Zhr2LXqfhcC+FO50U6ikn08P25wlCoQufgDdKL/Gb3VWAPbP7?=
 =?us-ascii?Q?9bYT8mWsCcvKpvrcT/HmU/bm7b7FMxdxCGcZzdIc/MnWujreQL78qTGaJsTn?=
 =?us-ascii?Q?PXE1CiAgWDIdTZH4cUUkGNgiOm5GtHpXhtgqZ7To+OHl4RSqx+IKNoSlpk1S?=
 =?us-ascii?Q?UIIKu316XIDx8hO8GkGHiqdU4sC6Yqr4+Uoy/PJJOOSTKWdKWRl21evZmkvq?=
 =?us-ascii?Q?4JLbX24ioA4T47kLnSpVINfp3WPZTqtNe5gaPvDyOhNPGvCzgZe60GffpH3t?=
 =?us-ascii?Q?KwC0EirAm2Xz+9yDic8sCSnx+EoxMfNxp1OR5LNkueMCf7Ft1bEFufRG8LGB?=
 =?us-ascii?Q?cyk8FD97xD1SYyLYhkPPhjitbvLtExzQ13o0FlqnBU3Sh3K7k2EIwZdBokzS?=
 =?us-ascii?Q?qL2mkEjCZcWYTp9h7lz4m9/yu+HQyTXkvkTV3jnNm1hOSxxEEMvDKe4+wSgs?=
 =?us-ascii?Q?HcPSya6C/7PwL4DEjEz5fiM7i8S4f13hefoV51B5xx8CxmJmeUPY3Lr7ATcj?=
 =?us-ascii?Q?MoDN+UW2wNoeyBJNUIj+pjJbUTsF2Q48AgJbKUfg1YOuHuPnDpHm3pXcesRf?=
 =?us-ascii?Q?PUGyEiixGAfu2S+GkqWWJjdnXUFkoRAq4s1yzbRNX447/8xBGn6kyYMo+gB9?=
 =?us-ascii?Q?V4CyVPFzyrN+euGUWGNTfJ0KnagPbkoEc9/vTOGaIDF/yI02UDsgPtXXdtk8?=
 =?us-ascii?Q?2RlStSR2msVp8o8M3XqGK2rZZv5uLoBAnRjardwgwYrC/fXaYFIHZNjgbj8y?=
 =?us-ascii?Q?LD3AUsdqgWqlXhp3lwZG0/4iRDiUEH+YWlHfvrfo/4i4vGZxUZDrmTJV0uaB?=
 =?us-ascii?Q?KSstCo+QBnuPsT0r7iN0ZXtDHt92XQftDcTtbmSzjBi7XYG9g6/n3Kn83W6k?=
 =?us-ascii?Q?qSf2sr1kzers33/zBapi9pt4nRktHbDh2QugLvu7T+2nWJhwwWEBPQQwdL9o?=
 =?us-ascii?Q?BoJ707xi+3juSKW9iYemPbRByrs8kglhY38uZOBJ+JtKE05zmOxGYQU6DdUT?=
 =?us-ascii?Q?ljOOK5gGphWTKV159R4dNvekznLPUyTKaOR1TQfw5QDBFmGrKJG6MiD3VX2i?=
 =?us-ascii?Q?cYO06RUvM753fg/bFDQxpH728HbzGwxqzL6Q88KDYrNbqIihPIf6BDRTQcQ8?=
 =?us-ascii?Q?NF934vedXgTPte9tLgubVtViOqezhqpe5vj/3JzCZ3hRzHWy/WE9ng4QYsQq?=
 =?us-ascii?Q?G/mC2Z6wiLLs9z2w+TsnBqAH99bsBBZghM0yXNQmzrRB4hlsbllYRINWaBim?=
 =?us-ascii?Q?7FT3zBLd7ubzoeYoPTG5taNb/oVRWuDL9aIVEbIjdXJYzWO459T6VzqsCh7d?=
 =?us-ascii?Q?QrIWmMGpnn7Tqqb35Kh+En+AiF+8OSRQt1XDIoNQ6L0dFVCRRKeayygUbqfV?=
 =?us-ascii?Q?vzwl6nJ2eqKF21wkdgJe2PRVxKkwblrhPcUZ+gj5tBvDrVYW6MvckE/Dy6ZJ?=
 =?us-ascii?Q?Q9o6MU/GofQxPkKnRsF3LQGpR9HYEbmQZg9Doi+1sA7ImT5u+l4f8/PcbFyk?=
 =?us-ascii?Q?AnqsHmLxamt1gGg8z4gZovFFL1atBqb7sjnnxcj3pn+9c5rycHVX/43A1K+T?=
 =?us-ascii?Q?e55v3QTYC1Z1ebqRxp1jdDCMo4WRirQvq5FVRPMvFyHwhm9YE/0CsURasI+o?=
 =?us-ascii?Q?Lmji7MSafI6CmmTpJfcWUE5hAwr7Ap7+ATPJ8ufASWO7zR14LGNaBILzxBNj?=
 =?us-ascii?Q?SQM5X4kUwQ72rDH2DC5LsPk2QceU9FHGtBUlW1Sb74W6XV6UJDNbkxmAm8Z5?=
 =?us-ascii?Q?+wGjZEivHg3oWAorc3jt89h6sxFBEXlzWlefgd38OyF1RwCbI0vN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05095e2f-450e-4705-138a-08df164f609e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:10:28.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhXTe+/fLFLqFv5ghSIs3QCCj1mLTW44nYESJ0YP7tum4qosjIXnVuf448KGvZAu0xv2QmOVelK9rS04w9Kt4Fh2r3HNLTdE91z3LPIF8hic+CFQOAtgtEh4ub/JsZg+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/misc/ad525x_dpot.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ad525x_dpot.c b/drivers/misc/ad525x_dpot.c
index a4e22fd4a107..97f124b1980d 100644
--- a/drivers/misc/ad525x_dpot.c
+++ b/drivers/misc/ad525x_dpot.c
@@ -451,10 +451,8 @@ static ssize_t sysfs_set_reg(struct device *dev,
 	int err;
 
 	if (reg & DPOT_ADDR_OTP_EN) {
-		if (sysfs_streq(buf, "enabled"))
-			set_bit(DPOT_RDAC_MASK & reg, data->otp_en_mask);
-		else
-			clear_bit(DPOT_RDAC_MASK & reg, data->otp_en_mask);
+		assign_bit(DPOT_RDAC_MASK & reg, data->otp_en_mask,
+			   sysfs_streq(buf, "enabled"));
 
 		return count;
 	}
-- 
2.51.0

