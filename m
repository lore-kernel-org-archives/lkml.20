Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793344607;
	b=FKbR1e/gGuxnX1BVehF6mkAnnPWyBmanIqmjYhYx4HTjWekApnKO0nP0oPZrNIoy8tq6
	 oO8f2bDscz56sj5Hs1hoxh00slGJbTo1tz1NxCdMDYsUb+j3ZP4TEWfjEbsIfJWyRQLUa
	 Di2vJ7WF/oZA2kDorTMr4w+cROFC65r76KKkq4L9gkNyTm9tHzeZtnifuM8juDhUx6bo3
	 xwCI5uasLAt5eaKTNdD8HhzhkNDh2QaFDXgOHRE1lu68RZccEPJJqFLiseOFEa6mLdhO1
	 QFJkNHW0ukt+4jnXbTegi0g00p5el9nu9DVThC07MEG008U3jQRQksLq6eUExkAGTYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344607;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qllX23EwL4USFTxcfYX+ETH+yNN1UWQWmPryXyD+HBU=;
	b=ZJdVVoHG8yVHmvogC0tyAT1aw9f5V+HmhJXiYfWFxu3KzHHrK9uVwpzOiLzzAI5Z24oi
	 PkSabMnRHDTZIRkSCeOZK8kFd+t42OJRGfIGCBOv+qt21wzTURiuZdZ37YJbc6uV9MnUA
	 mg0F5R/aLkLG1WNgbQz5xVAkssccQiYVHVVvgK4lq4GB7ArmMaAjPkj5C+qwRdF82YwsS
	 XK7NW/4Swaq4uOqcqo0Rllgf6KQSsmQ4JAfdil1/UfCw4YatsPLeV/fk1Mdjcbiw6uUR1
	 FlcfUITBe+VKVGRIs9SbQLSl6iBIvvdCGcoCyKku5fFzBr418aNMrijRLVHk0CWfm8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="n/fxO5jW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.53
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC7606A31A;
	Fri, 30 Oct 2026 07:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n/fxO5jW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsMbRs59GNF2d7/dlPPWrE9+cx6p2czb7kPnzGoiD/Xzz8ciF0W8kSXn6W8AglbeDxxOhCoYRUQeNFdI9qgaqJIvIj/p4UtiF0u0D/8e5391rRYJNu+/FQzU3A8/B+e9lezUupu9yU+SoO+TUPuYsAtP4A4RstgY8SqO1NZkTSylwd8Qg3tI01xXXsM9OkODTEIZgMMwVrthWnZsFXVm49G1FadXS/Oga5kVYLz0pEbIKW8d3PRrHzVO1oaKY14Hbvr1suQcMczbKM9VdttoNWgMsqeAGcWDzQW0a/WVCGZ59eaIfogI+w125YVpmueYb4KR5X4Cf2Tkmfuw8xbEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qllX23EwL4USFTxcfYX+ETH+yNN1UWQWmPryXyD+HBU=;
 b=smND5cN340IByTOH5yK1xGdOg5HzNUnPUv64xnYPKGy2VxmZabuNlmTveygMO0e5Xf83vucnXiGwtTQWeCkudXQK4ShOKU7yaOsLExobIaVZM2cW8OAvvaiHFZQYcsibjsa2u1GIY7Fu6OgONcApRu0I4LpSE9+xOM1MrGvJSXfQd92z83YlTbRqYfyE6gRmyqgNNKPV51FmzFRsn4OmWX0wwsIJZkEOVJXtNXk6C4MS2C/y9BN1Y0RpbUxNTTJKzwX1oepC16x1D8DD5a0py9F+cO0FEi8KSgNcvqwa5Mcddvz46BPkG3qVjH2tiUR4pKmRMO/amqYht30BLdeJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qllX23EwL4USFTxcfYX+ETH+yNN1UWQWmPryXyD+HBU=;
 b=n/fxO5jWAHverMMQASZkN+M8MHbpYIp132hPEfuSGWLnLbBHrHX3mXZKmjxjpf4eF3FkR9JQMeZstfoLtufUkdyc+buiItFpTf31DQeEYAXT4iNLWimg6YV2FWAfMkQ8phyBa7oqPkhBzfymPezO86X0FNRcq7kuFKRnl8zhg7f45MzXFYhp6vHvXfMx0N5hTzSa+igwUn9pOrTU2h2aPT2GP3kkPOnc4hfa3JDUbjIDPgKDmOT8wJhXOZFMpGQSWATwpQw08gBe4B5LfQSBdmOwP/y8/37oelTs24pIcNGW+mqMEwtoifcbw71R+c4Hc3Vf6P1g0/9gHu1ppVnoaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB10822.eurprd04.prod.outlook.com (2603:10a6:150:205::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:16:44 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 07:16:44 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: otg: avoid workqueue resource leak if otg fsm init fail
Date: Fri, 30 Oct 2026 15:21:30 +0800
Message-Id: <20261030072130.276679-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB10822:EE_
X-MS-Office365-Filtering-Correlation-Id: c80218de-bb6f-4779-e1e3-08df3655c06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|261009223027099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003|261021123027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	S3rf/JT7RlOGU4NVeRi3rmfCRoeJF8PAQCI8R3CTotOcw6/U+ZcmRwS3puZ9qyTJXANhAdCv4ftfCvLrYvYUy9kjHT1LNmiBm5+DVMSoLmO6dvd+2K6rdBgWmFapfj2V5qDO40JbrEPmCjIG9XEKf3GJ2fZqbiAvuWjH6GhZ/vpVPxK8xiHyf8VAViJQB6jIss01hHmlSDCowZkDh52K0TMkWe5jMWVGKz64ZVV+3OAEQP9W8dcuDOmhdry/jFBIlvgt/gho2SDbOKGNetT8QXXgEr7Qw7guvTg0uU0dmQ8e/UJCxzGoKKIGTsy6XIletr4/KWoQo6bzjoQe+XSeUSuthZ1ut2+vZGRVpqwa94pA+jPBA8i+fLdy8mwEL9OooiYXm0nLvvSS4jImhciX4/H9J0I8msbJPFnDt0hWl6KvyRZbQpAlrP4K7LatdQ4TefxcWeu6pMblN7k9107QrFGFIPe80gd4pNblvcO1mYlVMt1eToRXes9xJPsOYbEGYU1XXUkBm92eeuYJMvHKZuhTym4WjNpZ8zUEH1nvo1vHyPIoi4AWTULPFSNuOW+8whN1hZpRenOZ/oF2lt1Dh1oAznNKkhLYQlqkxJSEbIMoRzmImybScK1K4wRiUAx68EongieZx5cdLIyV+yfAnAPuR74h74QEBC76c6fOpSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261021123027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ihFTRaDgcr7Hj5u3dytJFaNeBaI35lqnxGqPduNRY/+qL+henhwI7chiQaBi?=
 =?us-ascii?Q?zv3WKUUgNHuQoET5QOkEv80egxn3Co7t7+HkrBDMR2bKDGdLQUbKAY7iKTG+?=
 =?us-ascii?Q?Vs814+FVhhjHrZF1GqZstaf7t3p+Izf+LTfSW3C1kTALtRR2MFrpGOLP05tb?=
 =?us-ascii?Q?Zb30icpCpODAQjPQbLvCwVcxiFivLpniLGPkBkkx06HWj2kE5FkgxVqrw5mv?=
 =?us-ascii?Q?3QNSNqoV0W1IprCKKZDKbz3Ix/GK7QO1oitxN6qncRvB6Xiy3uKZ3djm5TX9?=
 =?us-ascii?Q?zCU3+riYa4J/TInqSGf4jXPu182mjvdbhPC8OXfvOBx6Jm9hKrsL3g5uazji?=
 =?us-ascii?Q?ybZktOjpdrtaEwdIMyhN4umiqqhhRI9uqLSh4b3cnUjvZsG8dQoIPoLvtFdP?=
 =?us-ascii?Q?0z1AoF/i9OKWhRsofG8+U6GyLyLktkFwNNEtbLFUZaj7HB+ffRixnB+uLwft?=
 =?us-ascii?Q?7BIIgSFmaonC1zRKak/zfHkSfSlz7WK8aZeeWkml+v3qSHmujDSusDvy1oQm?=
 =?us-ascii?Q?RKnR45i5K2cykE/ga7ShAEV0+3s4xbem/YoxRsEQpShaWnwlIihutlxPG07K?=
 =?us-ascii?Q?kO00U0BlVbj5jqk1Aor3TLSKFJsTHIJfhGwBdA3AQLcjbPvefWdMeUkOrgJL?=
 =?us-ascii?Q?oL2a+ZDap0qn4+YH16TKES9gD27SbfezGv9Li0fhbeORiROLyY2Uq+A/aXFG?=
 =?us-ascii?Q?WDrk/StITWKgXoRJidEK6o++ogjmGV8BnF5FOd0q/2clMGZyKJM3xD9gRa61?=
 =?us-ascii?Q?EZ2dOxQAHqHv0kQ1H0QoP4KyCS3BpnN2q8c+cZTVOUw2I0WKCnCfDrpmg68y?=
 =?us-ascii?Q?ASzcPOdwaPmCejnUDE7HfRU/TR90wwcRV0uTN1ga35R1nF5In1dRX95WV1aP?=
 =?us-ascii?Q?XLGs+EWLZNWsHfaNNiAWQZ9KSoIu4ayHiGOpEXB5CVQ+rS7NVAA7DplxTmkD?=
 =?us-ascii?Q?w8jtmNLyrHMIyf0QC+zg+IfbFefROU8ztg6kvD4rmMccUgxfSPL08h9EvnF0?=
 =?us-ascii?Q?QmdumFrTg/yMNLcGsCiCw5BezLOCwkeH3Bt90u0lvZL7FG+zPgQmlrpwOZnu?=
 =?us-ascii?Q?wzfAAcRSdOT9MkyQMLO9ChPfLvYOVA2TP/Redu7lvL3n+vSo34PyMlSQtQVt?=
 =?us-ascii?Q?6ri5TBmO6OY7RRxQtZI3RBH6tcWuqYaddg/0jic6G/gwYctmYn6ADFKGu0tk?=
 =?us-ascii?Q?4jSGtm0dw3vbi8fuSwooSvYTCO76yI33uL49zvy/9tOVyp5F58EUD7mfhQv1?=
 =?us-ascii?Q?7bFDRegAMjR7EvTDRZ/RqMJ3USYtjZFw8HPDyDrJ0SVIVW1coTZDquXybNpm?=
 =?us-ascii?Q?GMQZaEzWOGC95IF9HaGKkq5lQi07FMzek6KhGk/ihMXzvi8HQ59GDsS8j3V5?=
 =?us-ascii?Q?fK1rOlQYiXauc1Cb2pI4rN8dvF6s2H64QAdkc+9pFQnPl7+wqD9dugPtIFlO?=
 =?us-ascii?Q?2M7sZrbEPw9VtqQi2RZ3jTYOWwOwkS69xBVS0G4xENLd/0Eik3ZRWJ9/j5Qj?=
 =?us-ascii?Q?nGn1D7PvCrVbbbJE8vp4ddZ3HKnElHskyZ7GrCkDqAO0t45D2Ib3DPmG5pL4?=
 =?us-ascii?Q?OUtwIsqwxmPurcPG0gQolZZi59tSOhyJToHCOQttFT+WX59Hvl05oY+8+I9r?=
 =?us-ascii?Q?pJIXD3/mkFv9wN66bmxX+73O8ehpOjOIMVVQgkEWWKMOWbsW6h4pMASAzoMk?=
 =?us-ascii?Q?yciUA1PjK9wt4yslzn6j3t3bdsH5Pawx5YHAshr7WJw+vXdKF0NaTRcnBdUF?=
 =?us-ascii?Q?Sd98LEgNmhjwXDAF6KG1txxYUAkv0DEiS5P4D0Pb+qHqfpf0YSO/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80218de-bb6f-4779-e1e3-08df3655c06a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:16:44.0942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6o1LHJnfQeBlh+MooKbb/AqFmj4CfIO7qkX4YggPcvqohr5Znj3CsfwnxoOhowqG6HFrbc0CuIB5G+PxD+G9LfxlRsUnTuOQptBY2+W4O5RT9dKplinWsKcMMujqvyZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10822

From: Xu Yang <xu.yang_2@nxp.com>

If ci_hdrc_otg_fsm_init() fail, error propagates to ci_hdrc_probe(), which
jumps to the deinit_gadget label, bypassing the deinit_otg label where the
ci_otg_wq workqueue would normally be destroyed. Finally it cause resource
leak on previous created workqueue.

Fixes: 57677be5ef83 ("usb: chipidea: usb OTG fsm initialization.")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/otg.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 5eb3b32c2e87..89a6a37815f0 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -246,6 +246,8 @@ static void ci_otg_work(struct work_struct *work)
  */
 int ci_hdrc_otg_init(struct ci_hdrc *ci)
 {
+	int ret;
+
 	INIT_WORK(&ci->work, ci_otg_work);
 	ci->wq = create_freezable_workqueue("ci_otg");
 	if (!ci->wq) {
@@ -253,8 +255,13 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
 		return -ENODEV;
 	}
 
-	if (ci_otg_is_fsm_mode(ci))
-		return ci_hdrc_otg_fsm_init(ci);
+	if (ci_otg_is_fsm_mode(ci)) {
+		ret = ci_hdrc_otg_fsm_init(ci);
+		if (ret < 0) {
+			destroy_workqueue(ci->wq);
+			return ret;
+		}
+	}
 
 	return 0;
 }
-- 
2.34.1

