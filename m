Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3117D3AC0EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857059; cv=fail; b=aagIQLzqZMV2PqReiSuGzOsvcrMdlHhu0QEI4XOjKV2WWhqHKdeVVDt1JL92X1TDq5rLAk7XJe0yEfvNhDtymn9aTOWuywJLxCvfi4nEdzMpwEii9mUt5Ld0lbSzpmMkqYJBo2Tg27TbpXCYyi/PSVNZAvkhMFn1TuhxuYPmpjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857059; c=relaxed/simple;
	bh=KHwnl1QDSEVELGRj3bD09sYDjyQH+REwwwQUJ0QKgXU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Jkhgyj3v0zWIZBdK4YaZadKMh8AYw6LP+3QBx0imkomTXzI3zqqbJG45p4TX/mJIEKxi97iLKYIX8vhD4d9YMuuOqmPy2IdJYAttfJ78+Rg68iFnBgp7HxNvsc2nXxbHhMjxYkvb2L2uJhxlNKRXPv0uVzA9b/xoTuBKXZQOMnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dbnpV3YV; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dbnpV3YV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqoPaJynZNbrSl9lnKFc72kpXmBXYulson3OPfp4SrOE8eZbwXw4cDTpTi4sv+T8qxPtYFdazPekf62sfZ3xLzp2vLSnYoImKqyetqkvZzWKqPgKVlFZFPccw8ZasgNmwuno8pcATxVhStr50XUURh6XfhxEC5CRaXHhJqmxenJlbyKJnKo73mXBp3VAK9P7kfRl0Oq3PjfyMCjhuba4DA+/KXP4pLLYQxQ48pkVV0NwzkhT9MIhpTTMSFWWiS506lSxPqw7QpFsbhzazXgPfWUC/L6BX/1sqFUOYBl9mjbr2VMt9Se1D44e80XshEijJL62qY8HHxwEPwVKvL0mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvMUXDikXPBkAOpEY3ZgsfN49HZidiDAekm9KVs3qyI=;
 b=hOHSlPltrPJ2HS5WeTEDCTJYQlsQcduXY/KZ6kH7IpiHO6/tp5BlnWENSNwpCvOfGMCzt4q096HXm06k0BtrLfXQtgswJzTbrqRlM5Yxgrj6TSZGpksrwzOjDdSiiWt5mzlqY4qhBlIHP3HyHDA2X2y+kRJm/6VZbI14vnc401RGTO+n89xVVMMS+skIrPXLb303QDmLLLaH+BmnazIJJuYtZvKvpZIjXqXv68EcinLXe0FN2WTinmOsmpzToRKZWGkGv4FvugITAdPQ7JfLL/DGbFQjt/u0abBv5gaO1xPvI4BHgTC6JwqWmSugblGmbRuljChcmTwLWp42mh2pqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvMUXDikXPBkAOpEY3ZgsfN49HZidiDAekm9KVs3qyI=;
 b=dbnpV3YVvmHqfmg6QShDTvlUwa6SWoTG1u+2Fcm+IIJJXaLyv9FRFyBTAV/puwx+T+Jk9VaCaa4vivkMiqq5dTX2+WAVKtHik2wJZ8FffalO5LvTcgN/GzKzjinliu1gtv3b1j5b9h6BjBhqKU8fTDCN8rKbk8LG2xReVGQ+QdsNolpjGJx+5W8uSHyRI4iH1/s1kfig/usF0GaDFwCDyy3TVj+FXFvK0mTHhQttn/t+GzOhoIyTTZZIPqmf9euwu9uUgFLajNqGllW3jEe3sOpdZQaSQnm2GH1cNF1W8rofVpciPvF9+sWn9sOhVKhLQ9XTTjX1MounccaMtT+lJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by OSKPR04MB11415.eurprd04.prod.outlook.com (2603:10a6:e10:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 02:04:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 02:04:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 13 Oct 2026 10:08:45 +0800
Subject: [PATCH RFC] genirq/chip: Add guard_chained_irq() cleanup helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-guard_chain_irq-v1-1-cdbf490510e5@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKySzWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mj3fTSxKKUeKBcZl58ZlGhrqVRooVlSlKaaaKhpRJQV0FRalpmBdj
 EaKUgN2elWIhgcWlSVmpyCcgspdpaABPvjP54AAAA
X-Change-ID: 20261012-guard_chain_irq-92a89dbf5a19
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|OSKPR04MB11415:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a345bc9-aff6-4f6b-9748-08df28ce47a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|1800799024|11063799006|5023799004|56012099006|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	BEE0AavTwswxs/lNkdpGqe/SNQJpT3f8jup80L2XjQN7p8E/2q9rEqyjTLiv4xodoBOZfGT5pmqM+6B5k0wIrWTBE32OdTPMvXZ0rFQhMc9ZtBoVyAQTNsvBOHrkJI95/O+8jfokp37EqS5EJPilGHS+DXGfqjY6MGNYkBt4ZTC9eX8kHnyR00m+zA24Gn7YfSbw2L6b76F6bFy6ISA62hwKu7Nte9eCl1oTBGtfcQAfkwiOVkP+uW+FSlsI//4eDi+gFxaK/q/02DqUwCyhgBYOMdEzIbClSXfJz/Q682qZBBew+I5nSXbFibH6+vmmpBOGhMgqVKCqX9Dk3IqPZCcs13UFOjP0dCAZJ8f1su2WOcu28qb2Qh7NTS+qwBNgZ+5rzmUfDI+ih0cE+ddmHgtQC6Wk6L7LVKjhoGUnecjsreRIs7+iWGqIZZY2eevFwV4y2svpLYE0qcKvhWEP1EvolwJDaksDztYT2UNUzZ7AU8T+Fm80rgJGGQNVNuVhc3/4es4Gsju0kf4w1fOJrZEzM0SRd/K3oM0eTi+ZbV4jW6s5DHDgtkGtrwJwIOqtqqNkzwz/5K/pdgGJ2EYzZnYDe2WFEjOwFAtna6zA4sXYaIGCFSCDErin4jDuQwZ7mxNSN/cpWJYopriYqbnYrV1NUixd5IXJPnEyzGCWjk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(1800799024)(11063799006)(5023799004)(56012099006)(18002099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTJVYWdXdUdMTmpaalRJbEpZM0pnWVNDN1lqdWU2eHhaMWx1bDA0ME83V0lG?=
 =?utf-8?B?dk95TTU5ZzlET3FFVkZwbWxWNnJCOUdSQmJnblBVU2YySXI1Z1l0L3kzbUFo?=
 =?utf-8?B?Rnp4TFVOZjZiaTBpYWtJM2M3VEhwVm5CVnNuMDRiQzlNTjR6NlB6aGg1NGp1?=
 =?utf-8?B?OFA3Y1I2Vm5iSUxiRGp1S2VKdEhUNC8wNHJTekhHNkNsQmxWR05HUVlod3Ns?=
 =?utf-8?B?T2czV0pnYXMrdDRNSFg1ZDhHUUJyZkUxT0hSMmFHYjBsV2tEbzQ4WW5DOU1S?=
 =?utf-8?B?a0RHdzlVMDVianBiN3UxOEcrUzRuK045Nm02U0lwTmlDanIySXhhMVRudjhD?=
 =?utf-8?B?UC9NMVNFQlMwbVJ2L2hxVE4rUzkvOFZZVjUzWlQzK2RDbU1XQ2hYYXcySnNm?=
 =?utf-8?B?UWlKZDJHN2tXL0c4TTJRUHVPVy9YcWc3MFNTb2k3YnBoRy9HalY5NFZ3YjBl?=
 =?utf-8?B?Z1J4anRSZERuT3pVdC9xcmdGMkRud1pnc0kyd2tzT3l0K3FRUDUrajhUTTcy?=
 =?utf-8?B?MUp3d2dKUnU5SHhIMlEwWEhmQUtHNVV3MmRHUFZZSEN2bzN4TEh6YjloNmpz?=
 =?utf-8?B?VE9NcFREYURuUmZNTTBHcm95MWowL3cwLzFqL3gvMkN5cGN1QmxwbnFOK2NU?=
 =?utf-8?B?bENJNlg2cEt4enV6NENRN0M3UGg5MjY2bFRDOHYzOUo4NHUxS3VGeCt6VEFa?=
 =?utf-8?B?K3lUWG9SWWhTZE1FODA4N1J5cHZ2ekNKNWhSRkN3YkhIcDFnT2k4eHhlYldT?=
 =?utf-8?B?eWJuR1Qram8xK1daR05oZFNiRWpwbk1DMmRIWE9veUc0eXhWNkpSeU1TM0Rn?=
 =?utf-8?B?bURZWCtOYWN6L3h6d0ZOYVMwWVRKakR4WFF2dDR1RXV5a3JFZTNhaUxEeGEw?=
 =?utf-8?B?YWROeVFNeXZ4UU4xT0FJRUUvc1ZGRndETFkxM3l3UjZ1STAxMUVrTDIzQS9o?=
 =?utf-8?B?RHVSNFZPQldYSktMMGZadi9ldlFVOTZ6UmVoQnRmL0pDTlNrSUo1S2JkRTdU?=
 =?utf-8?B?R2lYWkZaRjh3bEJDOXFQV1hzQ3NNNTZLN3cvZ2lzczRMdG1IN0JQTE1qZTlX?=
 =?utf-8?B?ZVV6QndmNjNjUzJ5eWNWUEtwSlRPcFlld1ZQbndRdkhEbS9UbjdDSjIySHdU?=
 =?utf-8?B?bm9ITGJkb1dDU21DUHVsTGFzbnJwUXFhQm9LTTg4MGZzT2VmcUc5dVRYZHNP?=
 =?utf-8?B?ZUxETnlkUmRDYmlYSkFzOU1Rc2hvekZMekgvSHI3UnFheC9KWUFuY2NndGhn?=
 =?utf-8?B?QStHR1JZUGFQd0hTcXoyMzAwSnF3ZEtabkYrZ0J6dEpHUmZNT3J4a2puRWpN?=
 =?utf-8?B?emtXb3pCSjJBNjVrNk9uaU5EVTd3T2tvdFZaeGZkdTRNaERyc2ZlbHhUMWpr?=
 =?utf-8?B?Q1daa0RBeFpwcjZKTHJYelhYTHhuWXBtNDh6bCs2U2Y2MkdEQ3hyQTZTQ2ky?=
 =?utf-8?B?bWFwT3p6UHlnU3VPMGwxQXZqZDhCZktlYlJyWERIekxVUS9wUHdMeEJQTFpr?=
 =?utf-8?B?bmlBTFNsU0loZXJMTDlaRERwV3FocUovcnIybGFaNnVDWWhtVHk4MjVCU1VY?=
 =?utf-8?B?Wm9vQzhhWWdSSzAxNkdlVTNVMWh4NXBnOUprSkcwRWdpc3dCeW9ldDJFa3Ux?=
 =?utf-8?B?WUhCOHNWbHJGdzQzUUpSYmpmOS9kYk5wN28zckNTT0ljU2pNRDY4eG8yNlRO?=
 =?utf-8?B?cTc4TE52Rnh2RGJHY1lPUC9SaHJpQTFXV1oxNytMM3JKczdOUSs5WGhoclJa?=
 =?utf-8?B?Ry9qRG5vVHBqRW5QcjBFaFNtMzlJNlROZHNJRUN6QU9XQzdWU3ZndUk2eXUz?=
 =?utf-8?B?alU1SjYrVlNxY1NlRCtnN25ycDU4V1RLVkRpSmFjbnowNVVZdkJjVGdjWkFH?=
 =?utf-8?B?bkVYVGdZNTd4a2VKekJ5RXV5cGU2RVYra3Jac2RjUW5SYStZa1kyRTFISkNX?=
 =?utf-8?B?dFJiQmxhYWlhb21Db2V0MnU5Z2pjZUpVTG0ra09lQnp5eGJjSi9yK3hHMDAw?=
 =?utf-8?B?M2ZIRTk5MVBVb3dUYkJFZDRWQXJraG5xQ043MW9yRmZaQ0xDY2pBUGhSTUdR?=
 =?utf-8?B?T3ErRXp0bEEyV0VuQlNpTmtiNEVZZ2ljaTRPTE5wR1Y3U3BrK3NLVHl6Y1dW?=
 =?utf-8?B?c3JZMVJPb3l2Y3VQZjR2dExtQmRoQ1JLMm93UnZxcEE4WFk4TGhTZFh1ZlJh?=
 =?utf-8?B?RFVSTG55dDk2bndqN3JYWjBpcXZZUWQweHdvMzV3U3hONVRTZmpCeVdwbUZ3?=
 =?utf-8?B?K0hac2VOSnJtbXNIaUtkZm1yQVZOT3k2WXJuV05wQmdtTGhmTGJja3V2RkZo?=
 =?utf-8?B?TW15Rzgra2tnZVpmeGZTeDBtWjErMWNGUWJZdmRkYmwzbVlVOGFyNklvVndw?=
 =?utf-8?Q?7g88Hq7iVF8BWWmzh53HvEwYwuH6wrtvwOSm2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a345bc9-aff6-4f6b-9748-08df28ce47a6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 02:04:14.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 170X9O3Poi+IR7O5jQoZbKf07JVCtPSqZ7ax+9L59oA2qJNCzTrGAbSIwqWBlFDNvFYGnTKeguZd+GU9fKvUEJrkj5q2HKir0jirRF6slMMZkDoI3h+jTwRKfOArS8on
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11415

From: Peng Fan <peng.fan@nxp.com>

Chained interrupt handlers bracket their work with a
chained_irq_enter() / chained_irq_exit() pair. Because the exit call
has to be repeated on every return path of the handler, it is easy to
forget one when a new early-return is added, leaving the parent chip
masked or un-EOIed.

Provide a scope-based cleanup helper built on the DEFINE_CLASS()
infrastructure:

  guard_chained_irq(chip, desc);

invokes chained_irq_enter() immediately and arranges for the matching
chained_irq_exit() to run automatically when the enclosing function
(or compound statement) scope ends, no matter which return path is
taken. This removes the need to spell out the exit call by hand.

The chained_irq_enter() call and the context struct are built directly
in the DEFINE_CLASS() constructor expression, so no separate helper
function is required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Chained interrupt handlers bracket their work with a
chained_irq_enter()/chained_irq_exit() pair. The exit call must appear
on every return path, which is error-prone when early returns are added.

This patch adds a cleanup helper, guard_chained_irq(),
that calls chained_irq_enter() on construction and chained_irq_exit()
automatically at scope exit,

I not include scoped_guard helper in the patch, because almost all
chain_irq_exit() are put at end of a function, so guard helper is enough.

I have a local check that there are 38 places under drivers/irqchip/
could be converted to use guard_chained_irq() and a few goto-exit label
could also be dropped.

If this patch is welcomed, I will convert users under drivers/irqchip/ to
use it and post a formal patchset.

No functional changes.
---
 include/linux/irqchip/chained_irq.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/irqchip/chained_irq.h b/include/linux/irqchip/chained_irq.h
index dd8b3c4766666..6a1a8e88c940e 100644
--- a/include/linux/irqchip/chained_irq.h
+++ b/include/linux/irqchip/chained_irq.h
@@ -7,6 +7,7 @@
 #ifndef __IRQCHIP_CHAINED_IRQ_H
 #define __IRQCHIP_CHAINED_IRQ_H
 
+#include <linux/cleanup.h>
 #include <linux/irq.h>
 
 /*
@@ -38,4 +39,39 @@ static inline void chained_irq_exit(struct irq_chip *chip,
 		chip->irq_unmask(&desc->irq_data);
 }
 
+/*
+ * Scope-based variant of the chained_irq_enter()/chained_irq_exit() pair.
+ *
+ * guard_chained_irq() invokes chained_irq_enter() immediately and arranges
+ * for the matching chained_irq_exit() to run automatically when the
+ * enclosing function (or compound statement) scope ends, no matter which
+ * return path is taken. This removes the need to spell out chained_irq_exit()
+ * on every exit path of a chained handler.
+ *
+ * Usage:
+ *
+ *	static void foo_irq_handler(struct irq_desc *desc)
+ *	{
+ *		struct irq_chip *chip = irq_desc_get_chip(desc);
+ *
+ *		guard_chained_irq(chip, desc);
+ *		... handle the interrupt, return freely ...
+ *	}
+ */
+
+/* Internal context for guard_chained_irq(); not for driver use. */
+struct __chained_irq_guard_ctx {
+	struct irq_chip *chip;
+	struct irq_desc *desc;
+};
+
+DEFINE_CLASS(chained_irq, struct __chained_irq_guard_ctx,
+	     chained_irq_exit(_T.chip, _T.desc),
+	     ({ struct __chained_irq_guard_ctx _T = { .chip = chip, .desc = desc };
+		chained_irq_enter(_T.chip, _T.desc); _T; }),
+	     struct irq_chip *chip, struct irq_desc *desc)
+
+#define guard_chained_irq(chip, desc) \
+	guard(chained_irq)(chip, desc)
+
 #endif /* __IRQCHIP_CHAINED_IRQ_H */

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261012-guard_chain_irq-92a89dbf5a19

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

