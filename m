Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D4470EB9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450183; cv=fail; b=l9JSTeyYjMinpsFFlrULK0EyynztrMkN9C+01MgRnbelcC28aj+y0l0z+riMSerqUlBM5RDu/RvCw3k0Cxc2O0GI7+m9mA8oBBUCRSzdtJ9acNIgL0is63iNlWjFTRppONffoT2/DY66IVV4yT7GvZ/B1+57DQ6BBUA71jR2SUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450183; c=relaxed/simple;
	bh=rNTqEWl0z3H/Ps/mFfOmbIm4KTSupwAJ3/n3/SDz+tc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=An8m5TxsVZe9WTpB/xsjpXsk4SAaAPpyu1seJUrD12bU8ccPnLrNnIQKdSUjfT/97h6fHtvRVoXBOvwYfk0FwLXiB/vsQ709HT/5b7n4ZkloxANJuUL2vMZEX1tZ3t8xIbywtl/TgbFbEB1Wk6XoB1SREDfQkmePD917Zm9/cqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wpH1ys8F; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wpH1ys8F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6i1R9h2afdlCtldjV573enxbVTD/UpwprKZWcUu6NAjiV4FDyEbj/X4WcJdxjZjtaVbCUQdonCdPRvon0IJHIOvAgR6JHdR1jNLrUlvmXwfHdZgt8pK8fpSkZN3iOvffR/gnAF2pBKLSARrMffNbVuganLUH7T/7dRVMk3pUp86/KpGQho5zh1ApYUDW+tVdUfYbMnl3OWMsRFXvKlOnG8IXexocajHJizhq9XgzPaNsqEyrNExk8evn0JBLfkn/YHGiRcCGmUFnFCXhp13jszgEC7lqCM3TEjJUHjpz7W7QMef/mN9esva/B0DqIMdpA95nJ+OOu3qygbenuTCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9wZLOSphUZuM7jmoIo/lHgiqWG2/Z6uj7/rjb66z+k=;
 b=cPYacH+49p43qzQ2ufxEnxl13TrrkxEdBU+n0667euFgT1L1cNd2p0lm9zSyVuAd4RFJAzj1aMierc/1FLrOLD+mp0YvuZ7KA7KfPLZdSkb+NgGxo7783N9v1PdHoyUu3dfTNG9OK/Sqsx+BWP9OFj6R/+imSgbagk7YTPLsGPmtw+4Le1EjFsK/YJbLl3Mig9SKNtBVhgE9ypnPnrP5/sbkOUBs0lzfgC6D376NiEcBTPBgonrAACKUSasIqTsSBFq69Dvc9GW/9L2yHVyzQ4ZR79C/q8Lmu77QOnxK1uOzcQ98aOg/f8uepB0OOFXgN7+I3LiI5rd5UR+KW+LOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9wZLOSphUZuM7jmoIo/lHgiqWG2/Z6uj7/rjb66z+k=;
 b=wpH1ys8FD4AsOVzpH5Pm49x44DcDLHyacYEDB3RPikAnEANRnvD2mksjFhiH70W65XY1RQI/PDxiW/nUq1z4e0/pL4cAEcny8MAGG4e9OBOJkATBmd8qfYeSZX9HrYN8F55uvRurU9nW2VeRZjxBO6vWH+JpI9Id7E9a+WfEb3yb+bjFe2Ro7gBYEvIVpwF43RsbGaivQmvNO78pMCPbOnpPfeyHplATzWnrj7+vv1BNnwnwd8Zg5iOiFoJEnIsyHDpIaJ2fFQJzvnPdqs5abS+X1wOik5iBFjAGSmWaXVgMJQxMMwckUbGJpMvAYohwA6KxnMEj0AAOO/V+N1lOjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:02:54 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:02:54 +0000
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
Subject: [PATCH v6 0/9] irqchip/imx-irqsteer: Allow building as module
Date: Thu,  8 Oct 2026 18:02:22 +0900
Message-Id: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c492bbc-f30f-4424-a4da-08df251aefbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	8Y/RyEzyom+YrShrvaScg8KDLY/1t8dsppveMpKEONwsk2n4W4j6sDzqkrfK2EuBYe39FZNZhlwNmAgYdeYkHoWfMlS91GD7TjAyaS+eIJojIpY9tCcBrHF89F6ZkaaeEZRTORW6mEcO49J4e6TxPnV1r4gEZmAzS2hQ3o+oqXj6HByuHrC5VYFeKdZ3RkUcXXqakAP4wFFsc7kFRFEBB8Nqw+9kVeVdHa8mocVPrTiVzryQk3fTb16jUCHSbYo7yBWguN7h1cU5s4UXlSfG9KSRsvqnSzraBmU0ENs4BUesiExJv2dtwKUiRBBa8bWNkOg30XOz2VvC/VyX0ZSx0hr+gwDzGuDLWL/lLQYVy4FwdhPuOvQmF6+Gj0lAZdSPyiUdibKSirUHthujE8qjRZMS4qDdzjvcome+MUw0dBI/Z/LW5tHIUdKjyNIcDN2oLqhBYmydqecV6ZOj0BSgM2ESbdfwOUccxtgothcT2/GUqFl620w9VAIaD3mokRDbeBbXlm4fnta8ODNQdXyVwNKJZmlOASENezu4G0RjNvBffpCi6kmX/CLnYbGYKn5RVYTDINLhhijg0RsIBzO/3wPo0ffPcTQASoFybFZqvOnoG6ndWyb3611QdXlNnfJvuRKoAlcgSsOTtgBUolMg2w/pYv80onCWdNypZSbFnxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sUQvEJP02AuOtb7hF91G4ARA/jYlFbdVecEmy/iKfZXWO7uyYW547S/g6Z+o?=
 =?us-ascii?Q?bzvFEb73Y3zEKUsyDxW9229r9imRMc16dcuaxLm5BCgpab54QRtC/7lRP+5m?=
 =?us-ascii?Q?+kZRsbUzWqtX4/oK5l81Kfl7cbersTkHkY71woDlpWitsGr/80y+8GujtJYU?=
 =?us-ascii?Q?l91Yrc4NbDc4HP7tmx5QDcGePSbW5hw8ubzopMybVIfTM6BaiWCObfhR3ES0?=
 =?us-ascii?Q?Ov9SM6GCz8LBqo9nniEx1Sgn2+rluKc8+2kVbAhyDGtSCqLm9Sie1eCT6Q84?=
 =?us-ascii?Q?9AQmMNz3XkPui4868Zeg1GE9gn/qPocG3k+wqItRvUl1bc9Wy42WrsOClsK+?=
 =?us-ascii?Q?VPFCoiw9ubZLwlqbOUZbX+Y5Bh8C3ZwqEHIdwMVoxQt4lnxgA2MT++RfoeG4?=
 =?us-ascii?Q?2uRAivnE+/JCD/qqdWA8hPPNScB1EuF6IHJrY8Kmsk1YzkG5AKfuEeP7nkCO?=
 =?us-ascii?Q?TiTjwKY3pMXFWphZBzMa66kLZg6j7IjCuG3q2s/p76x4w+ZbMoIAqOH3g15K?=
 =?us-ascii?Q?v5ahH3OCYF8YTxp2uderyNGa9NsH02aiTaHa2gDGjpD09vr+n5/JL1flw9Ru?=
 =?us-ascii?Q?EQ3JDJNn+YiidVNi2ev9/0ClGa7xHr7ETnMCwu9qREJp+6e3Vvg8/srG5hzs?=
 =?us-ascii?Q?BAUY7IpajqdjI4rEwvkwsp4ZdhXymsDdOwBzZfbiDYb9jvZb4CqrvzxJU8sE?=
 =?us-ascii?Q?FxTdl1/TmDdj7GXmBcQdjvTr0FTPijp/aRkOF+lC9R2KRJZpmVvC80plMKOY?=
 =?us-ascii?Q?VkDdv4zbFPAZNt/DsTjk33fX7J2LSKdtMAH0ymphZnJ3JY3w23RMyTP84jPp?=
 =?us-ascii?Q?2ncDX5+OctRfoY6RugNCZ6bkjZvNs9OvU0PrdRde9fClgz+yzZM/YmPFwJyE?=
 =?us-ascii?Q?qwhXgUtG3vaysB1IA3MiYAOhMKvywDSWzOh9faFVtS1riNC/PetIJnZ9HX2R?=
 =?us-ascii?Q?fH9HQW7rBPOC6jLHDUmJKo9ZPlMLjFdcA9FXmjIrK5hXnK7YyWK2u435GYk/?=
 =?us-ascii?Q?c50LQcVG4gdxkLlP5kOcBft+A0cRqZ2Fa8V+8QQrIivs8J6AsZwYsNuJt9yK?=
 =?us-ascii?Q?2rKkAShb7e2E4F/3SEoUkqI0yZqwq/s5oYQx9UpSaLUB0wCaGS+8gstLXYtW?=
 =?us-ascii?Q?Z53LsvqqZpo8XElyp6VT8qMshfMxuEL//kDA+1CiVbe2ggKDSPPp7M2BX1oY?=
 =?us-ascii?Q?CjDlIZFHuVqhlCCx9UQRB1gk6oHVjpCyS55y/A3l0PH2peMZiHOTU6k4g2R1?=
 =?us-ascii?Q?H92JOQ4URmZSDlbjqF5tLZe+xk4P/r0pN6ZYC4JvbZSVLSXHM43HbhiDLixw?=
 =?us-ascii?Q?/hCDjm6fGh7iOrCa3qhgr/oWSByQZtr2+IrU0IvBE+3QH7fpyCUjtc2CssU3?=
 =?us-ascii?Q?dFst7ojB5EMIN2Lg/RJMfsd3sq2iH45KPtdqEQdpwbauDvG+GIUAmZRkIXgG?=
 =?us-ascii?Q?Q/SwgmGJCfq/Nxgo/r63tUazXA/0u469n8FfUf5xe8A4pCRgPeh+pBhfJTjf?=
 =?us-ascii?Q?+t5R0OG9oIkExKNdZrzbu0AGueqKfJlV5Uzk6hlGSSGvUxzVzVS2OD6+L+mX?=
 =?us-ascii?Q?n0rKXpDlpiVg43VlyFxdWRGPTfc8IFGqd/qUHrOcZ9OpSW/ZteKq40He4szC?=
 =?us-ascii?Q?JqYhUyU+SUaN6bBpqPOu1+y2vqABEhrNGo77IFRKRUK3hcbB0NFdFu6xyVh4?=
 =?us-ascii?Q?vUeF1v5lJg5ClWSui7Bt++fDve+jHDYn3iv5L366O9dDlXdNxvDowuqXxsNJ?=
 =?us-ascii?Q?q3f5SJ4HZCGko3Uo7n232EnfA/f4/Us9IwMwm3tx/XwJbjraKUCf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c492bbc-f30f-4424-a4da-08df251aefbb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:02:54.3614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sD9vaQd2vq48brGnFz1h7Q7xQHm9sJFShKdgk5mP5pen4+xC2aj8hrmtb4LGuIFRKp9JZZOI765FqB7KHiBG5MDCUWs4/g15M3dZdubOr4AP2W3C43Qk9eoIR6gURh4m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

This series makes the i.MX IRQSTEER driver buildable as a module, along
with the pre-existing bug fixes that become reachable once the driver
can be unbound and reloaded.

The fixes come first so they can be picked up (and backported) on their
own, followed by the runtime-PM/clock rework, the module conversion and
the irqdomain helper cleanup:

 1. Call chained_irq_exit() on the handler error path.
 2. Validate IRQ count before creating the domain (Fabio).
 3. Dispose of the parent IRQ mappings in remove().
 4. Convert to devm_pm_runtime_set_active_enabled() - fixes the
    "Unbalanced pm_runtime_enable!" on unbind, with a Fixes tag so it can
    be backported to stable (e.g. 6.18).
 5. Let devres own the clock.
 6. Mask all interrupts in probe().
 7. Allow building as module.
 8. genirq/irqdomain: add devm_irq_domain_create_linear().
 9. Use devm_irq_domain_create_linear() in the driver.

Changes in v6:
 - Split the runtime-PM fix out of the devres rework into its own patch
   (patch 4) with Fixes: 4730d2233311, so the "Unbalanced
   pm_runtime_enable!" fix can be backported to stable independently of
   the clock rework (Fabio Estevam). devm_pm_runtime_set_active_enabled()
   is now set up before the IRQ domain is created, so its error path just
   bails out and no err_irq unwind is needed.
 - Drop the err_irq and out labels in probe(); each failure path now
   returns directly (Radu Rendec).
 - In remove(), drop the runtime-PM reference taken by
   pm_runtime_resume_and_get() with pm_runtime_put_noidle() (guarded by
   the return value), so the usage count is not leaked and autosuspend
   keeps working across module reload (Sashiko AI).
 - Reorder so the Fixes-tagged patches come before the rework/cleanup.
 - Rebased onto the current irq/core.

Changes in v5:
 - Consolidate the three previously-scattered series/patches into one
   coherent series (Thomas Gleixner).

v5: https://lore.kernel.org/r/20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com
v4: https://lore.kernel.org/r/20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com
v3: https://lore.kernel.org/r/20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com
v2: https://lore.kernel.org/r/20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com
v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com

Fabio Estevam (1):
  irqchip/imx-irqsteer: Validate IRQ count before creating domain

Jindong Yue (1):
  irqchip/imx-irqsteer: Allow building as module

Zhipeng Wang (7):
  irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error
    path
  irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
  irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()
  irqchip/imx-irqsteer: Mask all interrupts in probe()
  irqchip/imx-irqsteer: Let devres own the clock
  genirq/irqdomain: Add devm_irq_domain_create_linear()
  irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 74 ++++++++++++++++++------------
 include/linux/irqdomain.h          | 30 ++++++++++++
 3 files changed, 75 insertions(+), 31 deletions(-)


base-commit: a0e1fdb96578ea562a03c487f70673d228824d0a
-- 
2.34.1

