Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E143CE71;
	Sat, 10 Oct 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621427; cv=fail; b=C+Al2O9HtiflM7RluSSWGgwBIGq9dGiKNheAps4Lb1FhhRqUwudHCB/8VuXyOQEDoQSveR4GaARm5f5ZMwLQICeHAZwWBTePTPOgMtyBypm/r/qhdD7ZAWpZ1Ni6nEApM8zZwtepdytqRmJO6xUJPnOJricIt7YZpraoouZh1Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621427; c=relaxed/simple;
	bh=Nmo1Dsopw1yoko86wqWx4Xb2GV4iKOG0JL6Gvqj97hk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UkDnW/grmHD6xV9aelH9YoqNp9mdgBbAg2m9RFLkG9J7GqPa261ultTjg/mRWvKVpaewTCU8UaZzgDvQOsmgYI+8bEAdvbcc4usYyIalqld2Q9cPAn9o1MhzCQydnqfm9NRDhNshDoFvMqiqCCXfvCD/qvCGRKJ1WCq0GKn17XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bLuv4BXA; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bLuv4BXA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBdo72DyvZyuaHDzTsVH4axnC1sO74pPwI9imR5q2bIHHctJ2dJcE8Gt5Xzr/QVUZyAmYNuLB05zakqhp6310yHkws+fqIaosA8ZHKVy27NNAsCEDD7FoK1/bwuBkwjYd6/pJIiPL0c5CyZAOl2bxJO71NJR+K0624UD6k5fbFxEYwhGjiVTPMh34z39yf8Yzyi5uIy782iIIvz/IzGX/YUF+bpJ0JVu87/5tk54DNuKP4+ka4hrgF+ijTo4GapMhbHwjJG+9a++fTRgtajEGPuv5EU2vwK3XDwdKKNow9WmOAPjznc5KCyb4kzP8HGA5BRsrM4l0rPihFK66wI0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThZ9iN6kBtDdk8SWdwAc5zbRLce+uw8+nLdnA9eOmWs=;
 b=wVIWiKcdIWJC3oe8IUOr4SnaaWFPm4kMjEjAmraKgbW87iyUD0jFtYcioCmjk175JgtwMY3uFcNcuaoZ4XqN7wdWauMvdjMhPL+cQc1PC0+wyfvr9R+uuMuE5I5IbjRAE8HLMZvgHI6cTczRWP1cgN/u5HFNP+cTAUaHeV4h0+G0aoYZk3Kru45/65kMf4d/kjyFG35DyXmXLcmaaIsqQ1Ob/DQVaEenjuqj/W+H+8W160JLd8p1LENdCkyUmXRCL2zalRLKCWMVSM2EUdWnbn0/F1sENSA/8+ryTM/z3viPzWUZdNdBg5z4NcG6QGP0pTfv1+eSxdOsgaUG/arCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThZ9iN6kBtDdk8SWdwAc5zbRLce+uw8+nLdnA9eOmWs=;
 b=bLuv4BXAKs22cngMtQibASj779krxZZRNf7SAgrQMdGddjNqoahdttQws6uuKJibevOO1HxN9c80LE7nDfu0+MgllX0JelEfYk9UrRDKv9KwaOEWCRiVWoIDDo/oOtUZULhuhxz/HLvcaDwLdyf3jiHoIpWZlJtrwC5BPIlEHVRaDd/PEm9x+nA2IWYc2NDNvsITMdo8SsspLBrjInIOEKzY9GZ6nVNZJyKggfUUFvhSR8dg90PHisK4CqKx/HqHVsz4F+W4cHYU7nUDiphxfGYZTBxorRZIoKa0Im1ad+D6fN3P78m4S8pRslqFwYrdNNkt7kz6VPREqkXBU008gw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AS8PR04MB8103.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sat, 10 Oct
 2026 08:36:52 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 08:36:51 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ak4458: Check reset status after deassert
Date: Sat, 10 Oct 2026 16:40:58 +0800
Message-Id: <20261010084058.2365291-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0237.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::17) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AS8PR04MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d82d444-a831-4471-40d2-08df26a9a1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|261009223027099003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IeGpxjEG0d06Jww3Zo4usNC4OamxAq6Y4sbROyD7C8jPx+asnGuwOr3CgBJdxAL873mVuBrNWBZvrQmIloPG8tn9OCj2BXCkKW5jRpbKEpmgAvXEV2sUN0sYWTzPtP7d4bm/BS2UOxPMbwNYmsVG1zts3RCBb1LOfrn/yTf5LQQPHd46svNT0Ny1rzgR55+ioGV6+J93HUUWN/8z8xeK7k58eMqUROioeN9C/nSVtUErXX/ZSU7RCPD3KNbxv9zrIM4P4pWeQIrhAPGeoUabbhv+/nkz/LqS8jrv4Sk5fHE3XEk0t249/PlmW8y0nmBVcDww82K7QvgYjFSEh/JiPftK4eMknLZxOxJRlSMVtK2msVMDnI+bL1jM/NtRO4z3NRoKdx7W5DJ7BcQ3r26uAF8aPPzpI6jjzxgTsAsN1QTSAhxMeHGCX0MQnvnI4S2PlvHdOl9VhcFlM71/AOkeY1AMI4ci57Wrl1uy1OCNQKEQoRBDQiRB5StYMOLlulk03RbofdVNZ2lDpTaZ4Gu7NEZd5olKLkBfVUxotwEb82nPEMd4ThtVZbpUyvL/ZQbKJYBodClagbxDAtk4kWopCg8adOdI388gR1PPVTrNd8bQv0dm6i1v1yu1SaHuM8MJV9nOx4busDpYBTrWQZbgc45+hXoyZGkCOItDg2pLTOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(261009223027099003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3mdgjs0XuNg9dKxtbvYR1bz9rPGt1SFQRlbmia31v2BKctKAp6xHY4eIodC1?=
 =?us-ascii?Q?L00fNkJbNP0pjeZcLtWz3QyCViK5fFfPwPz23SzrfAVA6LKstYiEXPcRW38p?=
 =?us-ascii?Q?qyuBDvlPWwKkWknibpXj5QFzjNj/Q7VzjoU3wkr+pPSpIVtvCm+QBIY6Knm6?=
 =?us-ascii?Q?w13Q6qd/fTG05FTWr0zl/Y9Kc0PALYKnS0g2btFU485Fj2u+XifMZXHwmAcA?=
 =?us-ascii?Q?GUjU1W3E6RWPjoc4KeKuWTUKFqjYNZbUKPLPijfxwHrTu7upYf/xKinUam8R?=
 =?us-ascii?Q?xT374SPCskzNB5UAu6MIm0lTsW/DW/fEAU9hdVmjlYo37o+w+BGVGj3lng/9?=
 =?us-ascii?Q?8IVkiGuXJLGpA6NEfYKIaXRr2Tzyvno3gAr6q93wLHmTalueMf7LxPU3MniZ?=
 =?us-ascii?Q?OaDPJgOCk0n8Vl7iiFUUwv+sWr6ahsZYxWL61kss50snr+5wLrElJQHTgQof?=
 =?us-ascii?Q?OuMSj9JxSdMegUgZk7/wT8XK9Uyo+lbGh4KGIzoCPZVnsTo9xBliJKzDwsmc?=
 =?us-ascii?Q?Z7ppZcB9nQiEWbMY5HnzbzVEFReExUj3l24hmkH8nTsFJxAvC3LhRyQbCrOj?=
 =?us-ascii?Q?sk7MYS7sYSYpuow5F930KdgTZ1pBcdygGmLLbfO261mRX29YauiohpGXX+nl?=
 =?us-ascii?Q?CNtwJx5w8Q/f8fJSnoaTCsceP6aXXIXgG9+dA+z55qJic9OhoTl3b1ALk1IA?=
 =?us-ascii?Q?CYnQ9NaIV2gi/ErInJcwzzfeeyOasE3To+gOLwE6k9g27Z1ITQpTZWFkGEow?=
 =?us-ascii?Q?JMVcMZxVrgiYQDo0puwWjGUgnvI5odUkUd9cSolnxpwC+XxC+c+1dRQhslLb?=
 =?us-ascii?Q?Gp1Vz7VFQLYEo8Sd0U+tyGbblaI2z4AzNmhMyLtEelIFXBUknCOalXis7X4p?=
 =?us-ascii?Q?39lrPovvH5jbX6wSGYZnDHQYfyv8fDcQJqa7SGk9GFs1M02Va8QA7YGoXg+l?=
 =?us-ascii?Q?S7M+qPf6UzmP6dkstAwUfy8VE3TpQPlpw/ACw4lR65v/q5s84aViPLn/eEdm?=
 =?us-ascii?Q?6OAIMVu69AWQJLzsA2zoa9FWGEEXCLYithdupGSb80t0vHvr7nfOkxaQIuxw?=
 =?us-ascii?Q?kA4cMSH14xkMHCKFIWI9T/ZFgNX5eL3InllbZntOjgPEZ3MEyQ6kNHlfjY2K?=
 =?us-ascii?Q?C1a999rcO4e1yMIvvGYlOUusgCYeDi9ipKuJhUs0D0NMyiTL2jcdmKxUqodV?=
 =?us-ascii?Q?D4twzMOrjp8Jh4it1B01XZPAljIBIIMCWtXFwexTaePANq39zAWG4OKk0QN/?=
 =?us-ascii?Q?u8uEQQdyLJHfkaYUKOMJgybWaRr1kuiHzX2Id5s81kzYw8YkfJHgz2B33AeG?=
 =?us-ascii?Q?KzeFp88PUqnTuex+efMMDTcMFFp2l5arVk//mCCq1vPuCz6mVQx2wYZ0e0Ou?=
 =?us-ascii?Q?N04+1hWX0zkeATZGi8FJhcg8KFQ8/6orqgH1Kz7pBU8nkFPLKbMTpEgXKBMG?=
 =?us-ascii?Q?nkGv+7dh17oln7qZIUSmo4uV9uclQhafGH470eScf0nWqYVVNzR81RbwoZmr?=
 =?us-ascii?Q?TWPAEFx3odV0RAUGhtXJ+OnQpQcibMHPZIm5Dsn6PEF2wa3orAjr/BPAg9KX?=
 =?us-ascii?Q?yf/nM50NZvn/c90hc3YGFpQ0gVY2ViqI+p0fdL6Ttg2jBthH99bNYnDnM74C?=
 =?us-ascii?Q?PX58yM2hUteOvX1VYCjozj6x8PD03qOwleLoBmKrx+s/DGQsv9QS3WvP47s6?=
 =?us-ascii?Q?54mgoCDcan01lZo9vZsq5xCHEaMXcJWy8gz8UhQT8l+gH4Kd5KhXEvCkAadi?=
 =?us-ascii?Q?RKgmlpPyNrxNRZx1sddi4LY6x/vxoKVA+bVc+iMlkvPXBzKM87pj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d82d444-a831-4471-40d2-08df26a9a1b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 08:36:51.6937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tvz4DoybV+r1Gf92QV0ouWNMGzzCnn/mghEcaYAuo2qC3WuRgF0e3Af5gpGbOhIEM3yyCjxEpkrEYeQbyPj0TVUiAO2Pt5kDRmb3tY+1B4VqTQ9I7losAZk6TleZbds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8103

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The reset line of the ak4458 can be shared, for example when two ak4458
devices use the same reset GPIO. In that case the two codecs may call
reset_control_deassert() concurrently from their runtime resume paths.

Only the first caller performs the actual hardware deassert, which may
sleep (for example a GPIO-expander based reset controller). A second
caller merely increments the shared deassert count and returns
immediately, so it can continue while the first caller's .deassert() has
not finished releasing the line yet, leaving the device still in reset.

Poll reset_control_status() after deassert so a caller does not continue
until the reset is really released. reset_control_status() returns a
positive value while the line is still asserted, zero once it is
deasserted, and a negative errno when the reset controller does not
implement status reporting. Stop polling on status <= 0 so controllers
without a .status callback do not spin for the full timeout, and check
the reset_control_deassert() return value as well.

Fixes: 8a0de73cf9dc ("ASoC: ak4458: add optional reset control to instead of gpio")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index a74be99e877d..64984974ff88 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -635,11 +636,36 @@ static struct snd_soc_dai_driver ak4497_dai = {
 
 static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 {
+	int ret, status;
+
 	if (!IS_ERR_OR_NULL(ak4458->reset)) {
-		if (active)
+		if (active) {
 			reset_control_assert(ak4458->reset);
-		else
-			reset_control_deassert(ak4458->reset);
+		} else {
+			ret = reset_control_deassert(ak4458->reset);
+			if (ret) {
+				dev_warn(ak4458->dev,
+					 "failed to deassert reset: %d\n", ret);
+			} else {
+				/*
+				 * On a shared reset line another consumer may
+				 * still be in its hardware .deassert(), which can
+				 * sleep, so the line may not be released yet.
+				 * Poll the status until it reads deasserted (0).
+				 * A negative return means the controller does not
+				 * report status, so stop polling in that case.
+				 */
+				ret = read_poll_timeout(reset_control_status, status,
+							status <= 0, 100, 20000,
+							false, ak4458->reset);
+				if (ret)
+					dev_warn(ak4458->dev,
+						 "reset still asserted after deassert\n");
+				else if (status < 0)
+					dev_dbg(ak4458->dev,
+						"reset status not supported: %d\n", status);
+			}
+		}
 		usleep_range(1000, 2000);
 	}
 }
-- 
2.34.1

