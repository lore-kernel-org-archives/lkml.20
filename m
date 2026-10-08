Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF913F4DE2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450231; cv=fail; b=kcmbHbe2h/h6pOy2Z5Z56VgmgTTmlwI8xKNSl7VozisZr9uFOoiFVo33EhLfaG47guvfs0gfDafgdNFUDfCMrcEMSUiDyYgfj4zO4Rg2Km833PVDWt9dvMcA4oOG+HNnsYd49R9YBQROJGB6thRyTqeC3csQFCO7ElKazgFlKHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450231; c=relaxed/simple;
	bh=NvULUdxqghxx9Pl+CeP7rIfuVJghS7GntQ+K942iT38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sYxcfFdeXP7hrf1HmrmUYC6s4RnQdcxlxL9MIS7E5Uz8To65bP5vo0w8UWf7WL0HaqmiU8gFbaVBkgUtlRV37PdWcqtjAJScvACkp+9SDxgJE/b9gbnSIyR4FJxAVFbAhQcV+9kLuhIwlP+voHu4mrRBWAS19v7D1lYjVvQldVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XwgxxAKg; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XwgxxAKg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRirvvmOkT7Hxgh/4U32xBlXkZ/hQ01pJtIKWRUPxbZCGVPEDmgkd3RZCqDnAkUzUkzv7FLQf+PtWYRdz64oW8KYgj7Kf0Oxe/ZrPqdLXtoqFjMvHoYwWsPhyTV/jCMzKqxxq9+PO0LDvrE8PQJIjpQadi8hl6Mwc3Dwxp8L1SpMeJ6EwKnUZQaPWg8b1aimua+aHOmIOjXbVuKCKeWSgoajlb+esXKCLkxdJrW1qZf8+bbXaR6NxpTGeMhPU5yhq6tobpjIZqlmpgYHMlTzyOJCF/jkErucE3t9tDX/khNq1+vXjfpxz3GkCawePwIUF8Y6LGsDMInRYrLSTeUzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LTUQDkb378YPmw68zWXSz4SJmRldwpuVhfPkRL4Fis=;
 b=DzZm+U73L5mKW9IIwafwM5E3IxnI6tzPCbL/Mi+LuC0dNN6Zh7fh+ER0VQuHfvynsUKA3FmTUy1RcnVpXW5YRueoY4PhwvfaIuyz0+iMaTRyYwSrmdruOJ9Ac4m/OA+hSEO5zXFNDS9qpn7aDST9miG1GwrNX+sgly10MwaPJT7ynBcUBmJkeX7tw0KHjRNPP7iB9WFIW8zA5XrRBANB0H8/jjjZjO3/obuYeyitmwY0atm2uk3D4N3asmt3DLmDL3q1ISqegrWnZCVEloyXoSfLTdr5DglwAfDwKAeHOv4OwUWRP4C2RYgvVz/33raNuCvb7LOUlYkKADeS0ACnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LTUQDkb378YPmw68zWXSz4SJmRldwpuVhfPkRL4Fis=;
 b=XwgxxAKg2qf4tPBB6jefzVLIauzn+PQZ6vxJXoTDMM2+A3CUOihM2J6zTiMBtSccJczDZEwlDG51tSLBTBjs8QOSKh1w6t/CJ67+DKIv5q3HUthGSWmlUCq9/II8WwXlyVKh23KyFNyZEIxP/+TmCOH54ATjbdpqHMw+QGRTgr8TR09X5kVZAAMLLYMxpMuMTgnE+96tcdS0HV67HOShh4VEFnAlIXQ4MnMyQqUtkz2/57XEjbXhHeWLQp+CgsLOvic/dQhCDPa25frAdE32Qn9mFrSnzPaHtqcNVqzTwNWKibIyMGrrTINDqNLj44FeO4Njd5qEN1qlOMqn8jHKcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:03:39 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:03:39 +0000
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
Subject: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()
Date: Thu,  8 Oct 2026 18:02:26 +0900
Message-Id: <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0288.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::16) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 69238aff-bfad-4108-6572-08df251b0b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	howM3hJaMerHRuPCbN68zf0yOGNZhbzgQbzcoaqyewKvj4d5pUistlPaIzDTB5sbHp9uZo5gDAmVKcuzFKLa+WDhpAqTWPBUkbjJWXJuhr5LuWZz83H2ud2z4kzJEmiqHEyRNHAefL8qvfSpkgVnJOp4BxwGY8m3Xn4MkNl7vqgQ6lmdiMXncpmglCyUd+bBc+m6LmJIgxz5m37tKHp8pyrIfsQxhiLGe154WPN9/Vi9MhY1oL+HGET2oAgftmh3POd0ISSlBNvxzWBioGC4l30/74mC6Pn8yZLxq4yLXad/Na1mHtQStIM+z7JUG1NuDglb5CwWMX/PH+5OsBP84CfQoow1I2lAnGv+afmfcc2aZX1FdkQ9Mv7QU8HRaOmNnW+EhjixY8s7id2hf6viju0nxBkSu2Qwv52Xwwu1bC6aiL2vQEJ2Q2VoZis436SYPjNKWOD5b3io63YiozxSlJ2pd959qJTfPBdGagq1PNDVVOH8xf01CHKp372uPyZzMsaLqPU8THQ9EBrMSAVAGimz+5eexkOC4NhbQamc/vdxt8Szpv0kOvkElAkskHTdIIdzIUdwk7WIbZzYPEjz1geHzjSNfTrYFdddakJ1x8lmoDXhNREbnRY64gBUTEYjqKQdjfXuirfBQ6G+txu6EVojSKClcQMJhLGAzounSEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5l4+DfbXy32L/w5nd1jwa7/bRYJGJ8IOllKSRnInZHY34e9xiK5vUeb+dtjS?=
 =?us-ascii?Q?lfyCLst78myMSCYZXn+nz7nXCwKFXnUfCZwwQLSlRqJuTIGh2O1ekbm1Kblp?=
 =?us-ascii?Q?1h//mZ1DVSy21CgydeGErShGOuH4aLyftpR998bVC+WmcPj4SCqZikTKGRcb?=
 =?us-ascii?Q?GP4dWaJkUuT9Xq9iCvUCdVQAFjEbFTk2B1RWeoPsMTWkmfiCNqg6trMFk4Yw?=
 =?us-ascii?Q?QjvfJyKSDUWZ8owrdbfj7yZ8PhLevbW1PYmZlzSW6tOYMdKQGYkaWjaGRtbg?=
 =?us-ascii?Q?yP4S3Bf/3h8CeEVl5VhgvEeXP7d5w/kp0urauRwQOWDqTk6KSfsfv4HfpFhB?=
 =?us-ascii?Q?tQeOKMXQAWwS9ElzXaeEYvEnf95Gh17855+IUPM4DgYrCCe1kUjj1/VGia8M?=
 =?us-ascii?Q?zP+LDfw3U6aP4g/LZ8shbcVejjSq+cyXMlDz51KPK7QSokg4WhGVyOX4t+pR?=
 =?us-ascii?Q?Yvy37FK+iboUURVnaC/+jHDqA+uRfaK5zNBrk9XJo/M1BAhdouuLDXNKgby3?=
 =?us-ascii?Q?HqAb+c2rarfHGW2XmDl3hXBSBkEPuCKfqyFBBrxeKeuWLf2sH2Kt7l24EnCW?=
 =?us-ascii?Q?kHMFbZ6TYhliD/QxRvaOB0/ZmF+jnkfyEo7zpw9SdsXj0q/gjZGWXxi9c5Wa?=
 =?us-ascii?Q?/nT4EcWB99Qi0i0cqskf7JqX/ovcicYjOqIsmbtWndR3nhkANY5InnJZI1Ay?=
 =?us-ascii?Q?b0/7ExuSkS4/0v3qzHisb7pXJxXhgb6+ZbzqbKR3v9f1E88NfOzvYQKbOHFL?=
 =?us-ascii?Q?qmaFKnLNvlU/85df7LIOuzFuWzKf8XtVmFerixibmNS5CiK2J8Ez0aZE2im3?=
 =?us-ascii?Q?Zj55DHys2OdO4wFkzwxOS6xvoqKIwaTzUjI3bBzMBIftiiTRC2nFVmDVBXUq?=
 =?us-ascii?Q?fk2mYX4G7HfVrLyvTR7pdoqPPTuaY4j61V1fJUA6DHYUNTQAAisBdvdaTaWH?=
 =?us-ascii?Q?R/i+CbAcjq2TWl8eU1nwci36C67RqeRk4rdAytw0h9rOWijPrpAXI2AbOXFB?=
 =?us-ascii?Q?c5Co7mqrMNJSBqxWPsrEVfsgR3N+tDRKToZFeqD3DtrSsquOFWZ9MzGHLbC0?=
 =?us-ascii?Q?VY5w9nrkRs8MtvdOTj79rj8iPaLG3/6dgfeWEYphTOvc578hlK0Pwo2NqPw5?=
 =?us-ascii?Q?DCtuGbXzMfKoYsD910PYHWhzk1DkUDphuGcfW3EfZw9DFoZqZvFVw7WCXYQ6?=
 =?us-ascii?Q?erRjTsQJI4mF+tE8T/xKqHu4mdByMd/ejuE3o6NqbfeK5wQHseb0wCAVwqYq?=
 =?us-ascii?Q?bX8qIDcT8HPl9EXgV12ufSDHHDMPugk/Inx55fRssxFS9ZNPVqRQx7ah3ydl?=
 =?us-ascii?Q?BIgKV91AdiGMh9LMN8D9bM9WEVLBcem3drcjKdfHuOEgOsVChTtjSyzabzfr?=
 =?us-ascii?Q?XybUGwl3868bR5xgsXSr19r7OBhfF9BPKLpfHjOB9xc/3DUSQ1JLK+W40Hyd?=
 =?us-ascii?Q?8BGs1S+KvkBU/F2O/uGG32fRorqEIzEwaNi9x7MlRP3XqIkgAo2q9XEx+MYc?=
 =?us-ascii?Q?85tpSUYgZxuoYZHaqwFlFNFNzyT6MiSEkd1kcmTBVoCz46xPPcunq0Ll4SUS?=
 =?us-ascii?Q?SwxTkxSOg8z85HdRkqwy6zt0tkLI2D742XkJBIm6Dh696Ve8xSFcQQoMelLv?=
 =?us-ascii?Q?JXzx5UJOSslTfMTZTCELE6qXt6HmLkdtFma4hcFK7nsg4E//cgOSHXu+/UD4?=
 =?us-ascii?Q?DBrUqDVsR/xxMFgaRXw51uqt+xugi3LSlByqivMRYrhiYEoKjCvu+128/POR?=
 =?us-ascii?Q?pUUtQN9gykBfyIRbbzNIvU5J6e1phQYM9mzvSA/zvsI0tV8ebCXM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69238aff-bfad-4108-6572-08df251b0b4a
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:03:39.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DFHd42k4fOfJFYgkP08Aia5JrrBFZSpplKosAbHo0uyPMiAgThDkaxmCti9WocxN2hIY8mWOcD6wnlv0YGgXSrSEqB19ItLitgTYxxljj1GWuvQWoo+pKwHEX+qwnbY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
imx_irqsteer_remove() never disables it. Runtime PM therefore stays
enabled after the device is unbound, and rebinding it triggers:

  Unbalanced pm_runtime_enable!

Use devm_pm_runtime_set_active_enabled() so the driver core marks the
device active (matching the enabled clock) and disables runtime PM again
on unbind, keeping the enable balanced across unbind/rebind.

This becomes reachable once the driver can be unbound and reloaded, but
the imbalance already exists today on unbind, so fix it separately with
a Fixes tag for stable.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Suggested-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index d05de3d26fb2..5acc04504e52 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto out;
+
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
@@ -260,9 +264,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 out:
 	clk_disable_unprepare(data->ipg_clk);
@@ -285,7 +286,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 	irq_domain_remove(irqsteer_data->domain);
 
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
 #ifdef CONFIG_PM
-- 
2.34.1

