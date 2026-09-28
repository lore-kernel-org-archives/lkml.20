Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021111.outbound.protection.outlook.com [40.107.51.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1114A60F;
	Mon, 28 Sep 2026 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597730; cv=fail; b=dzjl2XrSDo5nseNEmK3GlN3zTRrEzrpPd9tQt2ciqztRTW9+AaDXEMicwiFz/DBfIr9eGm11z31LycpfJzAWvGwXIjj3ssajKX14AcbekCeisTriSV1+Uo/yly0IRFkK+qjwXUFcaelXWiFodAkWIypiDS4vcl8zXBuDD6ss6f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597730; c=relaxed/simple;
	bh=2KctDc49mXKtBEqd/BBQKnVHojHmg3qYD4aJ4wEoYJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uqKzWNXv6M7UQBpM/RzffasRyy6PG/OIBvfdcQldLQ6AsI5XLxZfNl/+aaBcJP57hPK5uGwDPJ/0eQ4N8Q0ycypj8n7SnaKl6tTye0ZBEF8QVNgZBi6gDuUIdx9TR+dhLY/FffGPVfyB2RUtbPuwsJBwG3fDrP99jWZj1jh2Dr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prjpC9/nlbB9LI1O2RBKwB01ThuoN37RCli2iOn4n0zPW8r/6DpQEvWdDBxNjs8iYFZy3u4pRu5B5nUkWjCpxjfQijPgqnjHdqqNoB0KyoUZ6hBjh+AnDR2GrBhEW1LKvbTe+hfKEKNsmUDioWFIyM4oGB2N1zBqNKxXPIt1Qqo+IBiw0PovH/ApzKcGt1+DWUhnDl9nBMPGtf/JLMGtpsyk7xkVhBYuYwRUA/ABUOIO2Mb7dhccxPMFX2nhU2N0FVzdzdLGdPrL0U9Mtb1f741EOUzaRpmET3W9BLeTXIPrmJssxaaoi4NfIJlExKH3ZPJ+Cdzg60FJ8lZ4mT9DSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlBh+twuvcdUiku/RsbgQ4rRcIAMHjPFzdOvIWv0nCk=;
 b=M0ca12B0GVxe4T5ls1L43pWHPovoaxw+L4OV03Mq6gXil8U5t7VPo2l1mXb7DPlXBDWfu7ShzBbKSDhecSlVPRWUe9AnOfEx5d3UKhfQnW6pExQXvXZ9hrMamrf93xax6ISwNIZ3Uxj1gP+AoeedUdNao45s64GPQDFmDkdxRDObflSfs/Aq+XS3i/FeLg46gebRDsrLVu5xDISQr3WuwcrlS6PTiFl0TkJZ1mzPMjJKzIPV7XFsna2LSvWbKcVAzEaMR1bz5ogHyYpUcRQLL9kzVZBZK+FQksf+VIERD5LHzkFdUvTVShW9bTvTO4krNStSeVTkOrKEPwzdLDJyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0267.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:25 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:25 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v5 1/6] media: qcom: camss: vfe-17x: Fix write master buffer done being dropped
Date: Mon, 28 Sep 2026 17:45:03 +0530
Message-ID: <20260928121508.1404808-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121508.1404808-1-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0267:EE_
X-MS-Office365-Filtering-Correlation-Id: 009c9d12-b8a6-4d60-3614-08df1d5a2d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|10070799003|23010399003|22082099003|18002099003|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	anxwYtxJGFOwzt8sCbP8Ltx/wFUmM/eLKWh40+TvIVANYtTziw42JZ3+LZxMWyDlvJbjHfIab7KYiYUc8Aik37ZNdeuwx+6LxLXfBvV6Ej777AQevgdvV1wtYU/li5rLJ0/o+B+H/uVw7t7/MbHDYSuXcGPSSaNDRK0/sGNmEPaPL92eTGNriruw+RUx02LztqtTz68Mn9IoPkDCzkXraHTnKF9LWGuZrf3thOcxT2Bp9KVtcV1sC9teXNl4S05yavFnS0kerMjsiL9vKT7Wpy45XbtwKxcwlHC90WLMC04ylbQHdRFqaQEgbf8N+SpYT+KdZ0n6IHedRuj3CK4lDgys/A8MmpSBCA6/Lvcbzkul/h3YrEsnxcnmq75tNboRzgdR18CJ2FV7sZ0KpZ7KGZYYCgVVAGgWYlw9eOZDM+pbsYSCqj3hi1ZVj5DGMm/DA/hrBz+ImHXKsG05HywLq1EsKIsBFbFMJ7fZ6r8Ob3RHB7igxMaFhyRBkt48s4TFVE5qWNXJmPvGhZHz5ZLVKJAkaLx/TtdK+TdaDIgQzkekB3btYyiE/+AsqmW04JpNXh14sPGetQcptBTfW8jTWdtIM4dsaNwNZo7cNcWibX5pP0oYI5OzSE0NObtKM70dtHpyuidOYFItxYCYolbXs+9vgmgWoL6tX5bXn/wmMtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(10070799003)(23010399003)(22082099003)(18002099003)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q7TWSJBp9G8VhFo4QJ1E4J70FLilEPTbvGVhFZmB2fuS/n25hWA0GeCmfb9U?=
 =?us-ascii?Q?sXkzU6Kl7hr7iYQzGtIWYjtAGi55c5TtLDF+Hq5io82yIVZ+LD7E3ok5vJF/?=
 =?us-ascii?Q?F6wfHTvDRaUaTWJRsEsvYN5PMHW4wGraCyyomqOS6aXVIPODV7nvGcoNBDOJ?=
 =?us-ascii?Q?6BM75WZvj0uxtmP8easqdznngvgw52LutEPSusvihHtzDoHuAqxcWWIyTF72?=
 =?us-ascii?Q?vlOLo5wGy2B4t4JnUjCyKUxAmtTrDjZSBVW/BWoZxlWJDZxKsgNo9aO9ZJU3?=
 =?us-ascii?Q?kQFib9/O21y5UOtCPFnWzUI21PTDRhUkAtoSNnUj+nGTP7hXLMNqSlpqIDN0?=
 =?us-ascii?Q?Mu9RH1QOp63hvdiCFgLiNNEAfkaLQrNGX1ydHI3cMX3Cb6hMBtdONEn8UBU0?=
 =?us-ascii?Q?Z82aoGLE0LEBf1JrWGVSlasWf8ImaBq0hm0pwEfG2PWEd/6sl6c9V0jMx2jT?=
 =?us-ascii?Q?nMyq3JB21y5Hx0vpzsfdpmwrFjK58Nn8/tZHGOrQhbUSiH9m879zgpURmom1?=
 =?us-ascii?Q?FNXX8t8zgpRI9NHWQ29ufQHh/EpXSr/8SuP+/DDKv3VrwxDhpwYzuz9Hmnm1?=
 =?us-ascii?Q?Kxx0GVbZ1UAJQL6BRfY35Mi7b8x7WmyW65EQaojrBMtwNLCMgQ5NbbPSfcOc?=
 =?us-ascii?Q?DytVaktmhQLoGA+m20o18Dhia65ZFtBIwPlJ2MIQQQPQUZbWh9FfI8m06wiL?=
 =?us-ascii?Q?oSc7ycn6i3PsKXa8syHVM+Sj3ti6BocBlK+p3VytaNW6rAKJWg7LmETwXHhR?=
 =?us-ascii?Q?v7qWi9yitIqBSrrtSO6eudAUCenxcaDj1U/WwegPCpZn5hoTHyVSLBleIkYy?=
 =?us-ascii?Q?HOI7sBIqT497HVcwt4spMKTCiAQSP/gul6nrA+zylxER8VsAhSAU04sGD+Ea?=
 =?us-ascii?Q?BQ+vGLcst2+Xjq+kA8+3GuoYBqIuKcjTFzLuiqVcs6rR48UcG/fyxXM22WoG?=
 =?us-ascii?Q?qVv7GHRpBdSgUDmPvDXeCyCs0lbsxl46z8JDXRsQsObu7j/t4QUcIHu2vqro?=
 =?us-ascii?Q?3MOCYYCstmQ5iEaBC7dxqwuwA/yUxvYYFIugEboF8+8n4Dl/CxEjaPOZ2ML6?=
 =?us-ascii?Q?pNc9rNM3YCzwgLl+rMA9pqtNDiskxSOUw90wbvbBZmu9/xtQw09x1xWU2F5+?=
 =?us-ascii?Q?atj3dEB++/iidgO/jC51SwaCOMfPMPwGRULPoEfGjSLYCoNiWlUgJZKZHBcV?=
 =?us-ascii?Q?HKccXYohqx84mqrY2sdAJPk+AlP/pdtltyosMy+AwK82yUJxwE90VWj2NjS3?=
 =?us-ascii?Q?oAbuC7P6znVlTzV/amGSsmbpYoq3LML/n0zl8PlCfjyUSGoSX/9goVil4UcM?=
 =?us-ascii?Q?EcNX1fx/tN3W8IT3NREXDG/yrK6eSgEyjvU1n5BTsaSlJHYhLaUeKjP/Uil8?=
 =?us-ascii?Q?yVuRTY242GggWX4GrX7rqGSb1srAzgAUtz/wa4SrRkLoDkpBx//VosmJmI7y?=
 =?us-ascii?Q?C7BidYRhOs1EHcd897RIH1+aTLH9IRidGksoGM3hhbLayrl2iFI9jHoQ+4+n?=
 =?us-ascii?Q?DP8jR11lX//TtMPQ5hyuBK2k2JPMBWGaWvhslm4j3GQL6W7Lp849c6zqHDbK?=
 =?us-ascii?Q?YegiPIQ9OxekuFfdCxBccsn5vlxZjQtV9wi/S48tGliIiu2HRx7fucjHr+2q?=
 =?us-ascii?Q?87EvknVLmxRQkS2mqqgWCF1nmz9n3JXtSpT4e71qc9sbrxHGhglEJJCxIstW?=
 =?us-ascii?Q?AYQwYqOXtpobrrE27jMrID8Hgd0a/GB5CbT/lLg0rl5Kc6PeRUWtrnhnupbf?=
 =?us-ascii?Q?nqFkSs2vu0coAX68Td+sE1LmalsEc3zi+BuikaJms26sqAfSkwQtNpOobNSv?=
X-MS-Exchange-AntiSpam-MessageData-1: h2uM7R276mH78A==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009c9d12-b8a6-4d60-3614-08df1d5a2d00
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:25.1046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVCt6rhPKjYxtAEr9CkBhZbvrkUCuQ0HOgty1Ufw5fwlz1aRgjG4Bn/I/A7tNYUsgc74Ha2Wpls7oAnFzq9jpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0267

The VFE 17x interrupt handler reads and clears the bus status
registers on every interrupt, but only acts on the per write master
BUF_DONE bits when bit 9 of IRQ_STATUS_0 is set as well. Bit 9 is the
ping-pong flag of image master 1. It has nothing to do with the other
write masters, and it is not guaranteed to be set in the same
interrupt in which a write master reports a completed buffer.

The bus status is read-to-clear. When a buffer done arrives while bit
9 is not set, the handler clears the status and never calls
wm_done() for it. The buffer stays queued in the driver and the video
node never receives that frame.

With one RDI streaming this is rare. With two RDIs streaming on the
same VFE, for instance two virtual channels demultiplexed by the CSID,
the interrupt rate doubles and one of the two lines loses buffer done
events continuously.

Act on the bus status alone, as the other gen2 VFE handlers do.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b..c011f64f63 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -364,9 +364,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.comp_done(vfe, i);
 
 	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
-		if (status0 & BIT(9))
-			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
-				vfe->isr_ops.wm_done(vfe, wm);
+		if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
+			vfe->isr_ops.wm_done(vfe, wm);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

