Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62484ABBCE;
	Thu, 17 Sep 2026 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671872; cv=fail; b=VNn1YvcqmPQ+nJuPVvwAQQ6CnO53UoGI8jGFIhaqdhjZ2g9KxTvJ6jde8YYalZQYl3zRhZnmMKHipytVxDYeo0KEh0YsFnZr9aqMZReVQ7av+nrbpNTrp6g75wc2yKjeB4BiIQtpIHTHFkSibfqH7/daD1vbsommKFtGChfdCO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671872; c=relaxed/simple;
	bh=ooG/upfDVL4QYQL+NbvpMeknNK+usnxoVYtRj4arsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RRlD1q7d0soC4HX2NXoOQGYjRXTj/JBnbSC/4XcB01mFxBJRrYNAVrgoi9EVBiQuN+pjq5G1DhJNRxT26R7u8ZEi/oBFqvdOmFo6l/tslLzpVzefgDjUVjl6QxOd364pERbBEpdLjpOXjtA7p3lMv4zM4Rvw01qJMbKC2zoS9lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vRPYykrs; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vRPYykrs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJK9h7T0qghaZcI+SUNm8f5wPcGDg9Azcx5QiPi3JcCz1BWrnJQwd0siwiV6xqYwmZ4M8KfpfxWS3TDkh+cl5lLt7UTpwfo5s4/Ao9FJdv/Qs7SEK9fQ8Y8jSx7BCQPkMcuvJJwQckcDpgqsj9TC+LoT64J5P+ogzgaDOZBHEUWn7Vm6yCLaA0W5HctsShFuNYCCeHZoUITqzV9rqdIfcX9fhKlkKjfqATdEGtQhNEdLOeheHpy6rxiIM/fF+G6wphVgvC7NFytKt+HMfDG37PUV9aFFe2lQgoSXh7AjIG+iBk7TRClGsPrswOAFf4DY15GinYhqsf8LsWdcPppo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoO3EquTeFTx0XqB5Vb3BdQ5lY17cCjIzse7O3b7LL8=;
 b=r/dUjRJiKbbmKZthdI5OMCFZH93CGWaMftQzgYI39CxkyHllrPZZBvK7T7j7RwCAO+cvC7iD9Jmf24uaqPdTGspEge9E3qDKSFJqDAeMcxvl2WwJ4kfXnIVJFJ4MYE7V2UgdxG+k3Ew0uRvVlWCrI8iPVx/YvJFdR16gxh2dI/D/hIrK9392UAMJDTWX1ZxHK8/tGYwatDfOe3doVU4yl5PRt6d2e6i+3Aji5W33iJ3FNS18fMcaGCR5kfHYOtw5rbgBoo+KmaMmRRfGdI75CZsc8J7hE3zamKSGSma68CzF3EMdW70OYZivZS1gn7S2F63I3RVyYQVfIiyNWyuo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoO3EquTeFTx0XqB5Vb3BdQ5lY17cCjIzse7O3b7LL8=;
 b=vRPYykrsLn/JqCH6vlYgAhJEde5gTBqKpPkqMFAjuPkuNBsKIQCQvw8nxBRi+EumfzoDM5mx7tSCzDzISL8uPldizTsIB6pA2947vpucajxrlT0ubbkLkisp9jHHDn5Xdxq8uPdBwe3iJvaeGtdLTbwvwZvzMy74wecqFXFBPpoZKffNVj2iPYhwupR70aqQxIv29l7ivl/OS5nGLX6Lt1lZp5P7xtmQp/21KaYY5KoMRSub/0bJ9QJCmOTFbCGay3zjPAf0LaUTMX8gt6QDtUx2m0jIbCZk3M/HwQriOtcfu/lBGo52tlCusGbSbTvv0WHjb2dulGWnamSlrSizWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 17 Sep
 2026 19:04:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 19:04:27 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Xu Rao <raoxu@uniontech.com>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] media: m2m-deinterlace: replace direct ->device_prep*() calls with standard DMA engine API
Date: Thu, 17 Sep 2026 15:04:16 -0400
Message-ID: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0142.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e13bc9e-74b7-4a91-5fc8-08df14ee7f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|23010399003|1800799024|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yGxgGDb2kAdyFbwp2hFd1hO3aeWn1ZBCNBfAygQZqOvt/1SGwOVB84mfyn+hU23uOd/gs5XuOoiEA/QKZ+xV96lxiEOe45iQX8bzfzZg1T+FQWkuUCkV1kbtMRDEDd43CPr4Yu/Ibfq7nEAYxDAFwk7zOR2sunhZaTlAm1UCSU1xuUpyyBFSYH2Q42Dvh8TodEh7lC5+7JXaP/HTZEhX2lT6msMJ7jeIVjf/hEhCNiKSEy4RaZwNY2vFPBFy8pV6FAHk5dXBECZE3NI+l8ZsGw0r2zLNRQ7MqvEDJ7De4oq52rCybvLwHlncQ2omneyAoMdqlPhJRLXun4Yxa2ScaxePI4twAWatf0Cv+IShzfExiX0AFcudVnaAGA0P/qInjAwbiN0s60Sbs6cV3G7FegmXG9CPwIcdPOAjLK96TBeLyOLtMUCQ+eJpGG4ON8bkdtLHeMXSrsWtLhHznhKsajbj5zEs1Sxp4jFojAlBlrzpZWpuMCIwHhjKbgavGnvaJi3SH+nmLXDb2v+gN6I3qpi7m/rBAnFIhMFD6izgCZPVghkY6++gZf5a75rohSQOaFMRtLa8r6Ip3REFaaomnxH7DB4c+0Q4U8qC+q891L8rYdqC0BTgJR+Ubn5YEnj5tBdvjKKcnsIMvDJUWaB3uhiG1YqzuXlj+vbP4Pk1lNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W0LjVtc/pWlu5bvy2yT8QdPBzjgK0AGNWQC8eNWsdhRe4mLVRDLIf2CwIQzg?=
 =?us-ascii?Q?/AwnI6awPWxb+rbAGrO4VX3qlGX5BY3vlP9zJyzqA9cskdPsJgxTPjVomCVF?=
 =?us-ascii?Q?QRPql8PjL7UZZ25meZGlbNtxHSUo06a/VVe7v+fYQfKAoCZd0aWVQhHEmnQ3?=
 =?us-ascii?Q?0UpH/Sjd5S/F/5RvnVZrHahg4Fpo0U29Mou4xCHLoMOc/RL0VYzApUPSODNI?=
 =?us-ascii?Q?0k4Cq2o1+IUTOhP7nAZKyRRcWR9P4tp/UrgDMBlH59wxnhctCtSfqbMUTwke?=
 =?us-ascii?Q?KNsmCUYYhxUmRSaVUZNQ9PmMtYh03jb8VO/EaGZP3zoAvQLcV9k5Zw7DlbcH?=
 =?us-ascii?Q?BH9Z7GxW0vFWeYUWoA0MYyjFo/Uuo4u9xraqVdVstbKFSNZO0TnhF8Ifsh77?=
 =?us-ascii?Q?n3QeXiT7nYchny6QqRM17rylkjO3mVbQR8RW/NU1ac24Wsgq4gJWjAEnNe/P?=
 =?us-ascii?Q?eqs1IT1jWEkVw2q5R4pmR5aftGX/ofiPJPE6LdLWL6DmdM/fHyklJG/0Mree?=
 =?us-ascii?Q?Wbw0VYFrE3EL6qM2QC6F/3HH2SLs/3qmhMM51g8lfh95pakVA/kDs4qJngr0?=
 =?us-ascii?Q?eRBsUvvrQAWOk96uCmkEGQLyBqN0EJtswzUHU6pjrYpfmHq+xMrwr0Vc6Eut?=
 =?us-ascii?Q?2PuhyxGXLwYaofOUl376ipDiMg6eAXFcZf/GDaxKrNwZDZEGaIJRz8kffQPQ?=
 =?us-ascii?Q?t3UmbPSeSLUgGYUFdvWmG/iny1zi7tC/AJvcIjVmM9Ci6Hoi40oRkSe3v/MW?=
 =?us-ascii?Q?BsT3JIKvm7vMTEloxn2MLAu+LaUzfp6V4ZHO7OW8UqV7ytyZ3GRQFbrLgXWl?=
 =?us-ascii?Q?nffBNkdNxItVmH/kCJkFZS07aCTY0Xw2n7MtH1c43uoDX7MVDrs4cwMQ9FQW?=
 =?us-ascii?Q?zfRxFY3LL35JBf0kkLA3/09cLjQqwGfCohgeMq/M+lfFz5Jz07SK8UcxyrKD?=
 =?us-ascii?Q?QexHpsysfJDxIfcjst4nF7UOMEJTqY0zDx7xHbcPcwFdjISEii96LxdAv8Yc?=
 =?us-ascii?Q?q1EwVmzYAFlnYmid1JZPCaJt6NhHYKTDJZPs0UGivsCk9z7Ink3h99fJMEyq?=
 =?us-ascii?Q?oFRoAkmMKdwa41wjwSv9n+YMBwcpRI6wdMbI8ORAvjto1IUiZ28OCRoJX/jp?=
 =?us-ascii?Q?CpkkG+a+1qldjyfNxeDY6Rt1U9Ke3PrsYExgwYk4WiGq3dy7+eB/V/l8KRWg?=
 =?us-ascii?Q?PJc7vcTbrbRg2RW7+NJzuBx/vex7Pcqakji/SIHDkMmUT+D7JjEpoRhwwKeF?=
 =?us-ascii?Q?iiuBZYG+248RtN4vN5MW4iOPkzjoIP8uhcvHqABcsFKd2MOE+HLuKR2j+LaX?=
 =?us-ascii?Q?C1sHTjqdI74Mlg7tQjVD9jVFdH9hq7+2c2ltMZ/Vu9Qo8QiWdXfAuEMnYb24?=
 =?us-ascii?Q?M4g2JlZr6Q2saVqSsRH4bUVfCSpdk0iFrCg0bCSAKMAbxsOf0JkvR13scO9S?=
 =?us-ascii?Q?jcieBN8fDdTjCMLydk4w3qGrhqupq7AbJy7JYkdQfAQSuORWmI8pJDPqI1dc?=
 =?us-ascii?Q?3Os3WMWLaQC85wgVHag/W5/o6wAaBdM8KQaLL0rVWK33fDkGIuGSp5LuEH/r?=
 =?us-ascii?Q?gPhLB8STaQpIa98B2zqPHP6mHHGo2Y1LAENFDNjNTqDQqa4lH1QiAyDuV85o?=
 =?us-ascii?Q?RtJylvOk8pvrgXBeaho1C4Hlj2lwsau6/f/pvfbsBfX2ls+YMtXcvuyghZkO?=
 =?us-ascii?Q?B1OD0oVGMys7WutIMieQZ4L4puspU+JRLNSwADcPJt3/6eHytDLeMyMRFAdq?=
 =?us-ascii?Q?Ul2mZcmNNTEePQb/RfVnncmED9bV7OFfgKFdoKYb7w1NsA4pcFI5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e13bc9e-74b7-4a91-5fc8-08df14ee7f16
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 19:04:27.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bK2iolYLIl15A6krMG81Ydh9RGkKMp7bCJhkUXQaEYMJQHIfeZd4Iy8byiH3wbwQI2cAbpfsq59G5bdKxZ44NrK3whpEu9Mp18vkPsK7XOrOQBPdgmE/nQC1VhA9P5OA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698

From: Frank Li <Frank.Li@nxp.com>

DMA engine consumers must not call the channel's device_prep_*() function
pointers directly. Use the standard dmaengine wrapper APIs instead.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/m2m-deinterlace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 9dcc4bd6cbdd5..57a91ff2269f2 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -330,7 +330,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
 	ctx->xt->dst_sgl = true;
 	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 
-	tx = dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
+	tx = dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);
 	if (tx == NULL) {
 		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
 		return;
-- 
2.43.0

