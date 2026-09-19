Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E03A9632
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823446; cv=fail; b=HqLajGGtDLEG6I9/zeOQPCFyMuuObncA8Hi1FQPjikyF39D+H1zN6PRf1KYkaHKv3e50qG5aGkszuJY3FoomQR5Tf/vP+Y1a5mK7+4B+9dqPapPcTh9SC/GvO30QP8UU2Wa71VL2z0GcTPBs9Ef1RtLu2KzqJhOSNs3Wur8ztmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823446; c=relaxed/simple;
	bh=b7PGobesFHB7I+m3D+B2QV2X511Dd9WbmChaqmXBoas=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Xs49eha2N5TmcEyVHA3RYa+Kyi4re0KcKT8M/parKwfXmDf2XUNcry/klWp/vz0NCtSmEIM6f8eCl7LbQ6xRFKeo/wTo/pyBDxQ/wykbaQdoW7OemW8QlRBnUnQEZMJFrj7hGHFiyIw+kn8KYUvi7tekTnBi+3W38Wd81a19MxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NFYscxnw; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NFYscxnw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMitY3NIYjCCPzjswJpHLeB+BMaBFL9ziFOotax17mc9VJZpdT/WDJpsMXXsmny0Tg0E65n+tC4eJcWL4msv2Le7Ywz4BmOmI7DcIyiS7c+3HDVtK25EnYJkoPi2gytuf8GyxHH6e9CsATHngXH3ivjhSvJHAk0oBClSFkP5WnKDW+AVB/L7PTwyUMxcTcKclWNYrzJB2DtglWS+kCN3bLuqIit912YXwMvmIB3fBQcTFzG3uBNxEi63cZ6l1HM+yHeT/wTxTiLQ/WjWcviX47mz4IdKQJfACQuRqTLXtv7ACDPPu3Hviyv7mxinYu9HRYZkX140n5wBeozpBnBP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gda15FrxNEoeHFP98UEZcxPTfhHnlH+cXH+acVu7fUU=;
 b=sDq7pV42rGhvHjZMJPjK4g4NRrKDNAklaotRoeI0fZoEO7AHz2dsOH4uAtGU3mTnGD3BTOhug3HGWcCdW99Gasufww94f4CCkH80RQFNJhKXHX+mKimYG/9tIJQoT/DvWoij9L4UVWkFmbLMxGJffWwyK6KJlm6t4DXPgHFNnmrUDgyxyS8Hk3ILqG6ZPjfGV+4ugom1Ba18L0DRTZxOXD4XJ1sOHROm5RK/yNeKLQPpktlFoYt16Z76Si6QtXIpHqSkDUzSTRMeehszhT54KCXGjcKqHQ4372K1oGTvKL58UUIFJdf/ekwlU/MHcgm7+17ap86f6qG2Dy0uV5a8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gda15FrxNEoeHFP98UEZcxPTfhHnlH+cXH+acVu7fUU=;
 b=NFYscxnw9SfUIoukKbaV5SRm8LywITnuUiFmOP76U81em7tCZQzM5XhsxRnogMvd42eNrdVhUQRxfbD+//be5U+2yCY5E9D6pspKAb8GZ4HVsM7rpM+aiuQaljHrIdVAN0Bxbqo0HVwx2wojgjQqGId9gaOZlHNuVO0/EKG6Om3Qgt3Jv6R0zZekgd0w5p+1exCMAjT5ZZzVnYWDBsZn1+QAAenmMUifCE5lYfpenDZ7SKb7fkq8nby3sOiVhtQzs9GO+xfrdhfzb7z3Xt99kKhGx/mo65WxKxUB/vvZ/QD6B+faLg28n6LPKDVED7rZintL/1m+NcpTOUu3lElMOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:10:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:10:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0001: use assign_bit() where applicable
Date: Sat, 19 Sep 2026 21:08:06 +0800
Message-ID: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 3328e025-9ea7-49c8-0ddb-08df164f6842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	5MoTFvWGbqThpNWc98g/ZzUOs4w66Vkc50y2+O8I9eoolAOXweCCuKcNCpfP3zO3qxDKLdgomJjrWEh13SAn5wMI83+tx/FuDCCrQIUQLST0JfN4x+riBEa/JPIuMbeNVQiygAzc1HCOHX8K3iRLAU3DrDacXiFWrEtUZ8Sq33kKTOYTw8qFgQn5YF3B26Lc9KcXM3V2WXoYoX89aKbFMtD5wKuPkrMdWCgLTfhFWWcZu0wbF7uP7PH0ucWkwD5U9Zqb/d20SflPWIQjTbVav5p6KiSN3lu6I1DNdY+VjDZKj1GTfZjxOvLFkgo6sMKo+DB8mxjgRR4iNq3fQM4CBKCVLUn7204cI0/QWXfrRnHxkSR5S8K9tLDe6pVm6NznyUOA8Q5PIkCeSFpQPGUSLiRFuU0bVLLocYIinj9TP43hFu7JiauzIz46WlmZQghfm5/7rSnfvtDk8Cr7w9kfe+T9SV3x1I8SckUrXZWlhcq6yh8VX6WEcZ7arBy5Ffjy8R9YvY07UAjo3N3mospNCRBlg8SJfmwD594/W0EDCqlAnmxZdbhV8skzh75BIra14owwmSdDS6VJR5l4KJ5rJDaCFyRrYVxo77d+698BqJ7axB8nFBc2ooqnvcDctLGBoIHrqCmiRuocUKWy9yEiGP/TWpAKNy0YO8ZTSwNGlWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1rVa9LKxdUA9iFfaxao+/4oTIbbJ6FRxtTp2pBhcal7LhKCizTwWxVrn+qz?=
 =?us-ascii?Q?hZiTyQvhh+QT3dW3dSBbTKuZzcW1ISz2CeTvdkR8fIGMGtzW3SrR8RG/ZWBp?=
 =?us-ascii?Q?kPGCdIEe+iOOYyV2ccrSayB+EfuiMmal6GyL++BSZpp5/w3lTGoY61fgt4qB?=
 =?us-ascii?Q?A6otXOlWJDHvxfmeXIqYyzZfXTfwVvjGx1l/dM/aasEbMfg0npNxoDjpSQkO?=
 =?us-ascii?Q?Phv2g9t2d7piNmAkeGEWvlCAQ98ay09GBXjY0XCWGRStlb/0yC7gbgzoiyqD?=
 =?us-ascii?Q?/0841494mv7S/bg9OWlOg40KQTt4NEWPO4dHxZ/khWRqSW/iYj0rKSqqIkCg?=
 =?us-ascii?Q?7EtxZOgy3TE95SBFGP7f4dpT0inbJXOuMVklhgNw4xbskbSPgX/h0Q8HJbE8?=
 =?us-ascii?Q?PeXZ9g/X5ZjFEZsPdddT5v+x374Ds3+/TFiXfOul0JD2evuxgwuzC+ceXH7U?=
 =?us-ascii?Q?jD+chJBunBilTzfft+FW2oCgYIWPjv/gPWAVOTNZycRF45zqqkvjsiz2OMgP?=
 =?us-ascii?Q?SNORdZJmdyPB6uvWv0yd1dPAfws/dDPqq/9zqb5S22Q6cNkqmfeUxbj+N4DF?=
 =?us-ascii?Q?FgTGm+fXLhx48UjDUyiuPaEc3SBOJemxzWmxfJg3Od+PKnZgYdI5ofLFnoPV?=
 =?us-ascii?Q?ft49tyuZzOMXedoVL8l4X7EkPT98bk4FRL11aycPGpo8TZuE1RRFAGstslU0?=
 =?us-ascii?Q?tg1TSs/DKNJj+vvBbSlSeZJ0AO3Yn1gfa3BEgCQqz9d3cKNff1H4kBlMz87v?=
 =?us-ascii?Q?KTBk78qFCQX2cNoPOybOYbvmkVuxlzVbEHqbRd0KWyruyYGrDErQuIuoETRe?=
 =?us-ascii?Q?/+Ml4SjFmGodeECjgPSeELZJ9ABm/NdVLO55bMfe1hbL759MDCVLiUC0gKgk?=
 =?us-ascii?Q?mUB8Y7nEe5ajWE0633JYTeG8WNdRwVulm/uGYwx/bbX/vSuQvbQhXbhb8/3Y?=
 =?us-ascii?Q?fRPif/NGoDEGwxm8es2HbSBM2a18Vby6pwJRjeLOMA5INdtDQ5uKd4p7gjU4?=
 =?us-ascii?Q?6rsbaMrbnhqGLq/FXpHLEexcQLyw+4dFI0vmIeHc6pUCNXt1g7Vg8vLhUZd5?=
 =?us-ascii?Q?J28sZJOKoakz5YXPFJmy0/3alDMDE8v/HXEdD1TrHe+nFl6mTGmcBJ22/QO/?=
 =?us-ascii?Q?loCj6Kqme8nBwGElaRvmsxDKiruDMUHF9x8jkUkIGWq4YzNrMTu2Dmte65Am?=
 =?us-ascii?Q?r4UTSxjpy/3AIbP1Yck0EF986mR27FPoS0KPuN+kfcPJ127nmjxhNnkbU5Hv?=
 =?us-ascii?Q?azzq/mYB+kopNxEl6VZ105g6KoafuiSq7n6n1PIW4yOrcxLXkf5Pz6dkJIeA?=
 =?us-ascii?Q?uKVYBvEZhWt6f1OgnTWx4de7plOapB2QgBqbEA8MJxTAuKbRcYe0XQu6pgwR?=
 =?us-ascii?Q?mm7A01gU5WpnfA9uWewXErxr9g7utcoM/Bev1X62mv6nEV0spUbpEPsBlzBe?=
 =?us-ascii?Q?MBve+MvTeM+j3C1Sz8UbL0OyaInoLmhPKYTGs5TK/7sBhn8GKNPZOc3l8Frd?=
 =?us-ascii?Q?A5xrKp9YpwFPdjIwae4kDUyA96RS3/RruTNWshdgaTggU85K2jUO2El7vlU0?=
 =?us-ascii?Q?hAsCmmX077s72Vvz/zt4D//8egWlY04SuEublGkGY+iA3zZ8AvgY7KLlCEG6?=
 =?us-ascii?Q?cc9HEYAUcDT/g28nf+yWiOHN3vxX8t2HwZ1XyoMTymIK3QRFtRl3vCtM8c8V?=
 =?us-ascii?Q?3gO3pVz8g1Pw6udAeUJvEwBBYQOxhlcwg7VcCetKIWd9Vs70grPfpHBYkRsa?=
 =?us-ascii?Q?KEfhAxoX7zY9CuXYjGwSNfFM13qiyuoZ2d/0m97nIFJVn4+TI3Ta?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3328e025-9ea7-49c8-0ddb-08df164f6842
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:10:41.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR/m6UCxlCP4iHWisiU4CMIycCpIlp1SQTmMcJeeGfFoSmlnP5C4jO2TBSyWB38Afkj0+Pr6NmwT8yphdAmxE93hCq3LqTElzrXKptpAlQUySufUrtO2Q7rhapSDgaWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 60d82a1acb01..e5805eebeed6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2520,10 +2520,7 @@ static void cfi_intelext_save_locks(struct mtd_info *mtd)
 
 			status = cfi_varsize_frob(mtd,
 					do_getlockstatus_oneblock, adr, len, NULL);
-			if (status)
-				set_bit(block, region->lockmap);
-			else
-				clear_bit(block, region->lockmap);
+			assign_bit(block, region->lockmap, status);
 		}
 	}
 }
-- 
2.51.0

