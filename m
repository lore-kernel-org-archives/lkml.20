Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ABF3B774B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741108; cv=fail; b=n+C4+z3FifYwCuCgeskh+GGcO1gbYoAFz1I+jz59vRgswAZuhhGZIpauEsqeTdlNDrrCePrd+caUiokmPsiQ8rszVri5SqlkW9Vcfzt5skMXIRvTs52hXyy6GSt8hi7OGmSpXRFq8P3PsEPIau/8za1Lr/sBr0m8J03I6ex3dzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741108; c=relaxed/simple;
	bh=2pVyj77465uwV0EpeBLvvpzSlMaqw8Tp68cYZBrEiJA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oxC1VcJLwp1dcrBzi46lt1OcK3k2qNHHnnRzvGeLrJxlEmnDCpXP6hx1uypKH7pGH3WzPNZ2HatM9BkBmsM8TTzwllRpWS7ZN0ipLqBiKPRzMyM0MkHKTlsO2tRu9rBeBqstTkX2NWPwnA8uKatQo9ZKPI27W3sGz3gxctrhvSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vJu1m5aG; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vJu1m5aG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vknWQt3R6BYD/8tPsM0SZdli4gsvIAHC2eom055Hh0N8Vux9bEkVEa6oUMrgW9RTPt1/fx04E+ljCfA50K+YNFyUozA93ryGXGVGwePKn/AjwaT6rlAEkjnN40Lii/tY6wzd4S9gxQoRc/GJ4/r0KfBPaGy42urQW989KfG3NU8IXqZQx57LKC22ptptC1GLYj4wSlK72CnxkqQbz7bHZNhrLO5o8YXWFkXcaQJRtd3Us4/TdsjayEkS0QMB4VhyOVCMTEuolYhFleLAklhZ68gykdUW8MI8NpAQpyQ0hAZHj/G+/11VjRIrdGi7Pa0jkMGx6yuthAZZohLv5FR8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9yhGF0hf6fOIEPir9blKPLALmhawmPdUhrIJEBl8hA=;
 b=gd+wmqy2xZks/vPbDYi9gHglxMMIwjyrZFEC7ommcPhgweat9Ub+7ECFgUQkbA4a/CRGUUaos4ic9cH6HUeZ605eOynXp9RjYq1YXkWE4b6PHhi5wtUuEvCJzEfntN8o0U/mG9YkMNDdg0ZE+ndGLSjMkBw1+jr0L0Bc8GkKvtsqlCsEH7OQEIOr0lIO5LkJ2r2d2o5GLle4Wk+EeIjtRVjl+o8lkittutnFc78L55WOwLCO/FPI0A+whemRTmsCWN1EeX2IHhWP5VxS9oJFXgo7rWqQlPKdz7asC3v82Y4euHUzBtbBqDhxxkQpw4rJOVtPQyU5YTT7wLdMX8kKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9yhGF0hf6fOIEPir9blKPLALmhawmPdUhrIJEBl8hA=;
 b=vJu1m5aG6y4t9dnEZyrlYhjemSEhBPPJA3KWb3FdGcDwfCXjSsObMbHQuDaWE7Qaa0vaKjcBq2cqOtSe1YndtHldlPLj3H4FAB0Tj1nCoK7zTJpT3CKMlDK+WIDUIb7MT5BsxfqzUxVdlsBGomz7WXdK64OOb0wIwEZ/3XM1oo3PIDcYjE/vigV+q3Eq3CPHBm2iA2gkT40QNwIE+UnesKe4wggqn3YeRuOjP4leYzfZgvI3bnDZIZ4V8Hub5+c6xCHtBl8Otln7BerjC+fMcIMbvZWyWg6l0+eEQFkeR74M/HVmg5sJRftK8IiJV+LJwOewq045CGqXRpsHxbn4yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MMZPR04MB960486.eurprd04.prod.outlook.com (2603:10a6:190:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:18:24 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:18:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Willy Tarreau <willy@haproxy.com>,
	Ksenija Stanojevic <ksenija.stanojevic@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Miles Krause <mileskrause5200@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] auxdisplay: panel: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:15:53 +0800
Message-ID: <20260918141557.3022820-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MMZPR04MB960486:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5e612b-1033-4dc5-36af-08df158fb381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jrJVO9B99xol7UkGq0BUVD4hAh8PPQa6Jb44u9SkSS2LMRqZlE4FUZbID/heFqpgylufsYc2rLm44n0aL2vQjuweFCtYFDUAniFqJ8z9unix9on52AXtN+OceoNb7wppkfqvA7pPpD+ZEpjspl+2WlavwgzEQbfxneY/47Bcc6cJxHCQXqwWzCSHrySj7j+NEATqNjSn8ZVyi0e00PSn5q0jHBq/+a36/5V2E3UBogDrzifpID9JUHmpxndQMLh1VB56mF8GffFcG9NZ14qN2WzjTs91m7tQ8NkSQH6itzFgn9QeDiGuSKJ9GvZ3JsoGBB0Z/1f3jMbSGSsM50PqqVo16sRdbgm5ejVUXDgE7dDikgYyzrdZOXPjqOc+2VevhEeiSjzP/78flY69UiaBKr7P+3bVHBarNUK193FL9OoUiEe33Il3Cebe7Jbeee7VMujQ5YMjBKvzNm+xpzlZHC1HybmxvwgIjpalkIXUiJgrhhT/dNYafU9Zcbd1UBX4Mu2lL68XWDkCvhTqroMwYenldoOiRHjDsDw1fQ9OtNIzOMNEml65+I5N+8EaagbIOXsn01XU3b5LhUH1f6qlCx3w41HQ6yi6KarasluhfclghJ2iv9GnJWwrVJStlm3KuafO06xsJBJwaTsyr/NEp/JbjDwt6ZvIc2YlJ4TF+cU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hOfO/ln/bG7ijFKHNOPXxBj6G18ztkqaLNcNYo/PiTPzfV36xcQ6dZFTZxaL?=
 =?us-ascii?Q?ER8kB8dX3WANoQQ+UXZfbl5g0Wc+9V9tPG8dCEZyIX/B5yFIWBpIWbjnPIzi?=
 =?us-ascii?Q?gzLAnS/SUbr1vVOVucgiVIeXeiONKX0xLJeb+m6OshM/qd9r861i7k2m/1O9?=
 =?us-ascii?Q?le/XCnMFosva1w7Zh7W4lo72PEXS9iFrhGMgLpjicveq3CbDwD0alFP6qzlc?=
 =?us-ascii?Q?XYTGtL12pn+6vLdN8sv1pblPZrINYuDHzStiTX4hPaux7PQ95sNrrPuKsUXC?=
 =?us-ascii?Q?TcDmkyHBib8wuoVWHEwk4lV3BLOkJIN1NPatYDtucgfXhyz74VzLRMasbLt0?=
 =?us-ascii?Q?IyNzxUwGQsn4yMUxDuyY0VtFIgHRtAr91dlwKb7w99CfY6Lxjc9UYt6Qbsf3?=
 =?us-ascii?Q?+3nU3F4MVPUJVk4ynPfZe+Z6yI2ZIIqgi91z520kJb5FvElgnRmUviyQS4pp?=
 =?us-ascii?Q?R9xKzqGcReV4D9LE9OWnwomIvuGbW4RUzgWxfuPTHjWhNhj9OpwdR6voO7IZ?=
 =?us-ascii?Q?Z24AZiGINf4iSFkmZ9IqIP1S1+H4C4fpiqE426F3/9DUSCbha6zq2WjSTJFv?=
 =?us-ascii?Q?5+ckW/dwgjnAnEMMrGcywcnJULA0siLz9TPW07qZINvh4ZSFv3tr8NMcb9jS?=
 =?us-ascii?Q?ilyHMBW9zRvyBEmPEzs4Zouw5JDGbvIqQ/4iXKhkRo0+hIqeNyO9FRVR8ZhZ?=
 =?us-ascii?Q?c12a2x0OqARkapcmi52orr/Nac1XDeIo6NOGDPg54NnH8sLvS/TBVg56iqk6?=
 =?us-ascii?Q?SMxzoiT3GdMjUtlHu2mq8PJ/S7PPF9h/qaGY7f8yTg/jRX/EDycMhT3KwGz5?=
 =?us-ascii?Q?r2qN1zgwQHUB+lbcriN+sxj8Ekm8t+3r5ky5uB7ziC92bqQSiq4G8becsQaN?=
 =?us-ascii?Q?xNCaGyI6Mh/EIGb4h/MfgTDRt5wJCagn2kSgelHRyOwz0iKdqSK4fAbNATZ2?=
 =?us-ascii?Q?od0Nj0c5+CWInVUR7eejeNO1YTJK+2GR272uvuN+IY9YKDrnuL7UEr3H6U2y?=
 =?us-ascii?Q?gY2bdGCvclz5ea9fccCyDe6t2oUeIB92omKQrBguPZlsX9aFd2EDatduUFcl?=
 =?us-ascii?Q?80C3tmVCx6fzujNaBrjfnP/pEpUg6bS9m0zn/PIp4ouAYBOOBim3GtbCMdmo?=
 =?us-ascii?Q?F+BVM4a4bIVRS06OGe5dqzUXSByaKO0q48/qiAHcwIMB+ggDSuIoo9JJXtbZ?=
 =?us-ascii?Q?JXdWYMaGH3B8VannS/Sdy4fX+UircdOsb7jS8I0RDB3BAwVtehp/cogTudNs?=
 =?us-ascii?Q?rpzL1A5ZvlMgBW9lsbfPz4O+q44JkmyB/GLr6MtnfXzeqD/LQwFfErCVtomW?=
 =?us-ascii?Q?BzukW3BxCQMAqCJDBNZcGZekJFgbJqB+Epj7GlP15JvEF0vPywbS91MlQCmK?=
 =?us-ascii?Q?QCusgOsqLfkBS8gBGPTVOqtmJd3GQPGiQDwdnbnD78pRQNFip8mY0hrmea9d?=
 =?us-ascii?Q?0QqZs29TAe2PEXuDPw9OlQHdPXuJ2aYlRUXs/+7IWx16ppoqyoKph7TIqCbS?=
 =?us-ascii?Q?r2XgGTsjaLuIKGgSBYoBnsvHSDD7w24WuAPVHqelDXRIwUdaHv2PTuu92mOU?=
 =?us-ascii?Q?dseJc41p0UlaUT4zOa6UJJrcGRS8S1pGZCkCX1/sSwN8FB6j8KlyShUMBmwW?=
 =?us-ascii?Q?G+RCun4VIAp0pEVWczId6/n+7Par0qATf9QHSgDwd502ZwLibM6IflxlHssZ?=
 =?us-ascii?Q?rDGfVt+VVMWW7GPdJNyNEJAZdhSgX/d7DUU2Nc1/RYnGWgiS1+RQvPX6/B3m?=
 =?us-ascii?Q?avqyVf23Dbbwc0aNOiAAREbN07gUMI11BU1OLa5dFvySIrerEuLz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5e612b-1033-4dc5-36af-08df158fb381
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:18:24.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCLw8phghzRobspwiXNvUIDMT/KTfKT9pOxoFDnYmjhCUPVSoW/j1XdgLyn/p6itmps+m4Qrzw2e4WOYtltGVvvmF0e2QN0ea7UgmBgboWf+FsGAuZ2Nq2RkUc9JbjN0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB960486

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/auxdisplay/panel.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
index a7dfc53157bc..2a567a075e2b 100644
--- a/drivers/auxdisplay/panel.c
+++ b/drivers/auxdisplay/panel.c
@@ -714,10 +714,7 @@ static void lcd_backlight(struct charlcd *charlcd, enum charlcd_onoff on)
 
 	/* The backlight is activated by setting the AUTOFEED line to +5V  */
 	spin_lock_irq(&pprt_lock);
-	if (on)
-		set_bit(LCD_BIT_BL, bits);
-	else
-		clear_bit(LCD_BIT_BL, bits);
+	assign_bit(LCD_BIT_BL, bits, on);
 	panel_set_bits();
 	spin_unlock_irq(&pprt_lock);
 }
-- 
2.51.0

