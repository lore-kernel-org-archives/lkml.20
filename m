Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9988476689
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450188; cv=fail; b=NcsNl8E8/iTpj4fGNJvttJZN8AlwspRzAvELf4MfuEQo0cLZy7fF0LU142N8qjwadQPjQMKqFXXMyAKts1uzqSQ5L5ppg2RrQgPD0v2Oa+PuUgtvbQk25lL1T/I0HkCwA4ESStNSjqVAUpiuIT5qfBWzn3cKr9QLFhTLLTN4e80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450188; c=relaxed/simple;
	bh=hy9teMe848Y/gM4HBr6PrTTcqPA9QK8qS0c/XcLtbXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P83Z0J3eNpSX9txuFVa3slmksIkK1/kH4uym/Xu9ut7GvLNU2eifdMtqyKfhyGY95x1NAtLyWcTFtix24uP+TKd//0HlU82k6ZKSfiwTxNjvru2e7BC5R8ZKaM5vHukhQUkXlNb5FD5rckUzvmOy+BHtrzPRlK2k42p/d9KXA4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cWS0ZIbB; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cWS0ZIbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEZT/uivIxkEwSjLFUUyaxyz0NBMqRPnfiw6HXgGCMyTMT3qWQkUuL1JlX71k5j6R5Am3Hr5QpUbcB2d9gB0/jj46TR5SJChtrvu6wNtaiwTQdLf/I+OJ6uvk5kvj7Q1Uk/TzPUXwd/w6ogpZyXZQ3VVJkXkw4taTZIvrjwCnHIkL4T8cMfLE27SaskfUgHOB45ifge+K5qu2sDbvJez/XadimsmwVkSs/Atfz82S4yw91hCh9HUmzH4hjaAoJC4js/Qq8uBrCh+UVnRv9mJYBUds0AbuQZy1VsXuWMEoGMIkb2bmW4EiwsOvRdkjKEHGbKVggPpmSyDQAiyDtOgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
 b=Dhw7HP+tCHJBBf2I83D7mY0EdyoeinarF3sQM0WZK7ykU5yuiwoUgwEEVHZ4DAd5nIJp9V1CJNGeh9M8XU4j3wYuXfxX4QG+QZryFPvFGE13AN954eVmDbOt7eoI/9VioC0AUduYNocEnEb26D5IaUHnbK88WoBK19/8Kltc/f8q5tHQ7WFyu5eQpIWWpa4YEZYsNazFWOhyX7NJP1X3Z17Y1swYEpQdjTFWm0gWC4wpkd/7rberINTXBABSfN0zDMDhl5vMBCQJTUwDclau93+frBhxjqL4mEEAV+4lnum7uFMkoHyYRHg/a4Wc4P474fgNk/38R8Q3nEktSOn5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
 b=cWS0ZIbB4QpM6WlgQNV8JPY/TFM/2mLy0rtTa0Tl32OvJWDSGbrNCDoKOGY4gPnNxrIMHBATpdd0n70BX23CRxz24eAtjOx3hGkmUXQZLwCo9RViMNCWDvCCmoxupGC5mBNVTzBHnaAYeGQvbTHTRMiiEzvTJoGIYhJhNqF6NOlYVgfJiVIamvriX7MDyCtptFUga6YkU4I0JqlyLEM2AZVNCiyO/zcWfM8LgqcmrgC+0o8wH6BXmrCEdNerFQNYXw5xykLM+C+4VhNvV+ZI57R+4x2Nycn0rYUZWRYDSV57gG9GVyw93OoVlEHSAF69nKrG8s2NC+XtrnyA2UzMig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:03:03 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:03:03 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/9] irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path
Date: Thu,  8 Oct 2026 18:02:23 +0900
Message-Id: <20261008090231.796511-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd6085f-db37-4109-f3fd-08df251af5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CkO7Aaa6tTY9ikKWjamvJAKW2UedSi4JJVZYsKBc7StGIhaXUygzcpkwquHsp4YRyMvaJkFUuKmOIdx7PhFx0yOqe0hko8SAuh+BfLxbxoJweqDzt/Lo7VzxpwxFRq20icPQ/F9lUGEm+Tc5viqWF5n8JEQ6Gci7lMFffJsAQGt2Ij6xsPD3PIt/Ob8DE5s9y4E/+oehot2c8SbhNF6GG0fCSZuAYGYO7aBhZJG4YM9YWBw2U1YGdX/JvXZsy9ZBipQ6WxjMaCvHnCGZJsHm1KFcKvbwwrk4vNWS8zfs/eKCRNJjb5xbiDER+0vBrGX7jwlMz2wA3kLzsfu0R5QNoWkVeJ1IoWLnRgsi+TD2aG/N9UO3d8Hcr3sRrVgjxF1yq4U/X+TIDU2u49c6eTVblznwdMO7rWctMCIeSN8iKWbObCDIFsc9AvtOMaC8YxXSyaAGXVZYkhYfyrYY6baEkWLlZMlKoR4lFqPRScQGVzEHEnGhApwlV6QPSOqO9mUrYpHUx0nA4neSUEWxTBSC5EoiZ+PpAdK6+8O7TN5pIh4p4f3jDntpp2wqO9x+EHQOxeGrh3vBRrpB/oLLUpSLUZRXpLfJVAUwdDCnIa6eFgXLj/QVOqsJNNN9X+EDmxUfnwm7Pnec0qEmv/8lKizpkqky/8ydRfASNFXzbKAN+RM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RcM59absz9X2XEr6J9BUGb1dRbjwh29bZR58F6a62SSM+2JxWrR/+5CYdReY?=
 =?us-ascii?Q?j4r6AO+XJH27ZvQhmMoG/M0w9IzQ6AUMaVvuvnfKQ1kfPxuZcNGQrKg2VAS2?=
 =?us-ascii?Q?aHJK79CRI3UXOb4HDimbmwRi7yaI0/NaN8ZNY+GTNJGaoNchSa7u5wYoPlFQ?=
 =?us-ascii?Q?bREY1h7mlL/UsQb8HbbVvSfZtzzmco4FpJi32HK+aLdZZsAGtL1EX+uVkvEO?=
 =?us-ascii?Q?C+NfpL0OQjXgH7LmWaCuFqeDCQFppq8R9PVbX1Qz2vrQOWgPnXjBcBYyg4E7?=
 =?us-ascii?Q?0iBxFhsSZneQTIKPlbbbaiOC1lf+qu9HebCrep5aGOjWwF5/ddJg+pbj0hFB?=
 =?us-ascii?Q?BttmdSPD3An14cNcU4ESny6ZSvpLN+1f3HSvgWFUwkkykyFneuXTZVRPyL1n?=
 =?us-ascii?Q?Mu3p/eSnS9fnll5meT3V6jNlXmZ8kgRbnwSlpY/nQMwNZ0M0PXItHXF7flSL?=
 =?us-ascii?Q?yQAOj7gpa+cg2mHCiuuSzvEuyPQfCF04F3synyrp32TwrZV9Y9vc86LegMte?=
 =?us-ascii?Q?ci46ZTcUdii/6lO/7XRSUs+g1M22IB0fwXiGKTcptJQsX+WP71k5fbvRr67g?=
 =?us-ascii?Q?glVvWKcdWGlmgBQSr7A/3B98MPs5UbyNgyMqVjprZdfFqf69pifnQKAl3v//?=
 =?us-ascii?Q?UWwxeIxRIDLZCqTITanlC5WM3gTeFh4RsjMK/qnkkzuJuP5BkVk9ihruTOW/?=
 =?us-ascii?Q?DLMvbYs1Yk7I8+CM/MyWIJRJL+9ukDRgM0ZEopm6nOYBj3QTMDgU73uT4Mi2?=
 =?us-ascii?Q?WIUqKqoJxwWUTSEDJes4jKAxfNQ6zZmO4QFPD3xEYbbQ/9v/6beFX7udAgDh?=
 =?us-ascii?Q?8bBfNEFIyiI9HiXtlHp8bqZPKVhabxicBwJX2WCLBFqZa+/xruyXZAeLWQzD?=
 =?us-ascii?Q?qZbIQN5QTGAXa2W+tdkWh+x0HvTugOeKW1hr/5vVmZzv6Ax5Wepzb8kxuLHa?=
 =?us-ascii?Q?s0r7JhOFGNlnckA/XqE9uXhoUqCZLFRYTmtVIhN31eowvI5AGcwZ2POq+SD0?=
 =?us-ascii?Q?6ITx9gx4PH0LYVjh5LRZganPeAz5QTp3o77yuWAuRf8vlb+5MJVLCP+ujhrZ?=
 =?us-ascii?Q?R2TO/5WghrclT/whDpqg4F1rL+RGpn4E5qr0o1vZSnJypjD8RTYva7SaL3H1?=
 =?us-ascii?Q?NR//tAGoa4/0Rz05kgRtsN5qG/mvur3W6AYXVzH/QLOxheCr80ekGughS87J?=
 =?us-ascii?Q?y4FWJUiQ/YErHD/UP6/OXZkrLKvyDnn67sX/Y9dljpNgqIvvfBWdwxotv8Eb?=
 =?us-ascii?Q?VnFsERxzPYqWywUu2y/FKVr2sgidbXP1+45T5UgrSgyvCYfAFneVmBdGLOkf?=
 =?us-ascii?Q?nSbpKKTDIotrARpM52rzSG3iVIpsH70K+PUvdk2u1UStNfZP7Odcew1F9tCN?=
 =?us-ascii?Q?38yTDojxlp16s331bHTL2wRMLt9aPXfXM8i86ozIIuAw2Nc2UIeofc6K9dSP?=
 =?us-ascii?Q?GJk60tm/DjJFAPIxKK0EjqzHmu2xII7x+J1xuAD/eBwHK9LmGWMv+niuw5kg?=
 =?us-ascii?Q?vu9p6pQgyCUJDT7VWNl5isLsvIZ62WJSuJa5fWl3LuE5gOLh9lWObHXvENJx?=
 =?us-ascii?Q?vDFY83N4kA22sVpbbthf57U/+WStUTTnupldlThVfgJk9djU0xb1TT72lUQ+?=
 =?us-ascii?Q?sZt6ok7a4BelawbO7NqC+ju3nEzKjyxRPo2Jfa0tOnTx3ByUiN0HeBcSN2sV?=
 =?us-ascii?Q?MMo2weCRaSH//Er91gdZGuX0fDyIrNGNQpZOrJBCAEG8odornMmFaFI3/a3W?=
 =?us-ascii?Q?78O1WybI+sE13yftPWAx68NNb979XWMdNU3YC26tC+ZTmvrxYuAJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd6085f-db37-4109-f3fd-08df251af5fb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:03:03.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfUPUJohmeHeTlyeSEcw4f7/1zjwfiHsUhCfG50aNyCfhnQwMQr3X6DQwyhIjbS6WdVjR23EJ0nI90hH1GiPAwdTvyDIo8VtNGV7HpiQtoVzjal/2pTH6dImH9/DMjah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

A chained handler must pair every chained_irq_enter() with a
chained_irq_exit() before returning, so that the parent interrupt's flow
control is completed (EOI for fasteoi parents, unmask for level-triggered
parents). Skipping it leaves the parent interrupt unacknowledged, blocking
further interrupts multiplexed through that line.

When imx_irqsteer_get_hwirq_base() fails, the handler returned early
without calling chained_irq_exit(). Route the error path through the
existing chained_irq_exit() so the parent interrupt is always completed
before returning.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..1b8d0c8eedb9 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
 
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
-- 
2.34.1

