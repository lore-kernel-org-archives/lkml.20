Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75ED3B3894;
	Mon, 31 Aug 2026 03:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147218; cv=fail; b=uxHr4OuIkp/r7zHomJU+ZUYYmXO9qnTlKVvrpY0zj0DmtoV3w8Us1ceSe6RY6C0XtuMXIRCt7lCYoI95nkMshsoqszEwCW/phIDX6+2NtZoWZ0F8HtefVkg9ZNjjDc0M16LhRFQgkzTynIYN+W5ZB920uNlffmSBAOH9CCYUHWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147218; c=relaxed/simple;
	bh=FOKqaZJxGIieArzKhvy3LP2dz30ymSlrTy6i17nUCik=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JE1WzAnftNw/xiW71Ae3zRqLY0VZtiBgAjiJk2+XFPB9DDxnIGArJe1mnZcFO8qzEe/2qmOk9nxhBjg2pKmMZOeKB+utwMZGWDFrUzrwpbF840VzbyGfcJPja9PaUMZBTLnfAqqpERZxp84HwRx6v6uCCIXrvSXlJHL4KL/mzxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eKuizXSr; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eKuizXSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8jWD0t53n0yow5FUDrAYey0sFgJLJ6ytv8kWRtWffWtOf3XoOfKrgPA7ZF/KrAzCrMa3V7Xq+TJhCRi/1kx4iaeLh4gRTZVcqmjwNzxEioUWQaGVgz4drgOPqwG6cc5y5oiol4ILjrmbJ3bSJE1z/v6Vdk8PurJ0Ixvrr80rgP/8GbqMYnlVvIEkMD544eFd+6I6kk4aiAsvpV2Efp7b6fwUX3GeSdoVPaJYVkHBEDq2MgPWhmw4+dFJQ3i3u6qKpSm2C5FH+cr2vJZ2NV5laHccuNsMD/CqbRqO6P+XA+IQWMbP6tuY6C95PxyaILnxndnhNf61oHbJVk0fHfpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCFIcrFi9uaEdjESOLj67Zi1KK3gW8QJUn0lPTAmtgo=;
 b=n3h/LAsNsSKOuJBTSzirtgLQNL+RI3nsja2+JeJU52tYv/qeaPWLFvrruf1kV1x6dpMUFpQkC/I53FDrjtrIH37hVKNJ5G3xxcX8Ye/k2VUpePYVi8TUwPvOv8MVz41DSH2OwfzswHBYwKGEJJgNOuIFzqOoOeiRb/S1I0pJvJ+0T8iAJzd0hUHHcfNa2Ls7QIpl5StrCKcroEBmCW8x1sjr5oiXTEKBnltuNyQiSaFKdb8LEf7pMGzBdWt9LCgoCrol/cM1UtUMNYvgBB3A3AYk4jpx8bHQLRdAZPaFIva1akZJPlakHBDrp0Cx1CbdszUXHVVOhO93ygnxWJIEsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCFIcrFi9uaEdjESOLj67Zi1KK3gW8QJUn0lPTAmtgo=;
 b=eKuizXSr3D0KBYQeRVNRxk4mPJz+Zvh634Ep8LMEgBrYaw1tDzCWGYx+6up1xeLBpaP9dnWNYEtEOU6BTv+88n/3Nl2jUWHQulVU0wjwcxwmf88GGr+uMmk1KNprRVez43McbTA/45LHJbW57nk6HgHsxPaU1NSSP1nLLv3GBDMHS2kbbNalduSKobVsu6gzUHsx3+SL9wzoteE9NeJ3hJHwWqUV97VUYHaTc+EFsqJAjUckBwF19DuMCfFd+2aWVVx04gBNE64a39YbfQnxQ24cEkmw83r7YHS+iq9ceJKWZgTjtGu38Rp5L34/IJmxc0vljljhoZkgQAw+R5ARuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:33:17 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:33:16 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 31 Aug 2026 11:36:58 +0800
Subject: [PATCH v2 3/6] media: imx8-isi: Remove unused model field from
 platform data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
In-Reply-To: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=3430;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=FOKqaZJxGIieArzKhvy3LP2dz30ymSlrTy6i17nUCik=;
 b=+A2+O4A9KyAvS1sEGdNp+WeS9z+Qbt1IdxCk7elgQuVFYf1JA+GELBA7ifAnd80S7IdrkI1h/
 aLEzidjrPWUBHLNiEtlPAn4xI4lQm285HCbpKG8Xvtsgp8vO1hzmN0p
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c4048f-356f-4b5f-0489-08df0710984b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	g2gAa4feuYvR6CUJ/finwLwmN3WBydUUnIVRf+JYRO06EU+TZZlgGPD+MExsEXGmDgXEy2rO9i5uS6KUhahmY96EpOPxnfqTL/5IUg3dAXiFoas4zCl9QrA4ioxVWos2EIVK6sb88zJYb3HdhLTvjTrNgm56TdHPSYCKMfcIsso6ZJ2gK35HKK3Fhgj0z9b2iTsS1wwM5CvnMafT1JC9rt0QHOONaLaaPWV+pzMYWATkgyeiWjeXeNN7BMabYQVDGwPXIJuOadtHEum+ejaWnmdNQhgY1isclLJ9CIKDUrW4UYa0ej52D8p/zaNdJONn9MliUv8liXN5dsb0z1skhEqduiblKhS2sQHNfM/J8TFN/+UeEC4jt7/phsa1DHBWrIrcDgbIbexxIuZxciOojV6zc83rzpwtW53qY1RVCNcZYcZ9lhcrMMfJVqR78j/KMjWXol43uOnSRM9EA/emevmaFlSU9BtHLfebaZL1iG13BBi1yi6QCTGATMnb4OFS545nTI2VsW5lh1qsPtgLtAYj0KU1Kj2qWCm4ajnb/BV+9u5A0mfLwp6Y626bWGP7tQk2cRGvDQUIpDEuKDIPsKO8Cc59asirCqOe/fHIzbRZMSAO5wN1yIMn4G7kAhH4BBK7SoBMX3z6CtQtyWI8/Vxv0xJJtg0GT3do8i5zpU1WEmGIR/RpqLNAWmlQqavZWNFYApnGrEY6+nQglvXPiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzE1RnJVQmVxVG9VRjFWOFFQejhic3FoT1ZFVEF4T1Rkc0x4eWZYS1pBVFI3?=
 =?utf-8?B?WHNKT1M2YVZQY3VJSU1rdTdBQitwd3UwTUNBK1BlSCtMOGNhOUdQOHRWL3g0?=
 =?utf-8?B?V01tcWliWUlhRURTQldpUkNmNVNYNXdTVWhCOXBkSVhUMkRxVVhBc25MQWln?=
 =?utf-8?B?YWVwMStrSWY5RDZhY2ZhTkNZbXJHRG80M0hYYmR4MVkrZHV4UU5FMFN3Tnc5?=
 =?utf-8?B?K3FORGpKbytjUUEyNVpyRlJuMjd0ZndKZE1VUndJMW9XS1BsVlo0dVVQeXgx?=
 =?utf-8?B?OExTVXArS2szZlZKRWFYd2RQSEp3cGlzU2RDOEkwRFFSRlN6RmFzbDBMbXhU?=
 =?utf-8?B?b0Rta2FZZDJUQmovWFJuSkxEckw3L3kzRWxoWHhXaGhxN2xveXRpQXR5RXgz?=
 =?utf-8?B?c21ueFZXM3l3SDNzMUozc2prd1lpdkMvYjNkMkxsT3h0OGh3MXdieXFZbWY1?=
 =?utf-8?B?L1dWOVd1ZVRSN1psOFNiVzdKQ2NYM1BjeHRqMGQ4TzRwZ2tWR0wvL004TkhD?=
 =?utf-8?B?SWY3bnV5bWlFWnpvQ3M2VFJNeHFIeEJCZ2hHclVKWDlvZXFsZUl4YTdtSkJu?=
 =?utf-8?B?M2V1eFB0bFJ2TWE1Zk5OL1hXK2pxay9UQUJRUkhrbjdvK3luN0pPVzljbUtC?=
 =?utf-8?B?UVFvak15dDlDK2ZvRGxXOVl2dFdaTTY4M2hqRTJGa1hQeCs2R2RCeS9NU0Jt?=
 =?utf-8?B?dGlSTjA4cnlmRmVKVXpTN2tHWUM0dzN4QmNqOUJnVzBMTnRNVWVpanJYWXlw?=
 =?utf-8?B?WVBaVjFmTjNmTzE4WXpUQVBmMnlOYm9KTEdzRU0rejAvSml6YituZ1VUOFFK?=
 =?utf-8?B?RERLTnZuTEtyRzF5QStwMi82dTZuS1ZCVW1aaHZKcENyR3c3Zk1qeXhBZ3k3?=
 =?utf-8?B?Rll2RnkwUCtSR24xUzZnN2s1TmRzcVJNRnFXWVpDbWk4cWMxOHppSFVZbDk5?=
 =?utf-8?B?TVQxZ3ozZTZJREMwbkZLcXJtZVdCbUROcjNVa3BFUlRlbVVMaW5YRmtJVGhT?=
 =?utf-8?B?M3hNTUVYRW56dDA1NFZVNWZ2VlVQQ2dBQVFJWFY3M0pTaG5JUWpqNDlMQi9a?=
 =?utf-8?B?NlVIK0ZaNlhXOWlteUZZQ3o5U0JRWHU1VFQ3TjVUOThWckhxL1l1V0hUcW1m?=
 =?utf-8?B?WDMxTFdPd3NXM1Z0RVg1ZlFqMDV4a2ZjejlvSThxRzJHM2NmcGh5Y0MyZ1U0?=
 =?utf-8?B?OElzcWtRMXI3d0hEMVZzQ0RKQ2pBbXBoeEVBbnMzSGxhSDdtemNMck5jRE5X?=
 =?utf-8?B?cmtLYmhYQkpJUG82WWszYjRZWEs5SGxodjVkZjFlaVgvdFRxT1ZkcHZQaTJl?=
 =?utf-8?B?dGtOZUJsejY5VUdTUGMwcklzTkxicnl0VTYwQWxVc0xkb0J5QnhoMnBUazFu?=
 =?utf-8?B?ajlZMW5wNmhlM1RtZWRRV3cralJmOWFPT3lPU0ZYVFhXdGlKZm14WW9USGZ6?=
 =?utf-8?B?NkkwWDU0S08rYVMzSUU3YzNrRTQ3YmptSWZRRkRoajNLZjNrR3FRQW9ZbXB3?=
 =?utf-8?B?RTF1NWthRmNjUlRoaUhQNWt2cXJCeVB4K29ycWJURlV2cmwzVzhUNThqUDNY?=
 =?utf-8?B?Mm8veW9wYVhTcWNDcHFtVkdlRkVJbHpWUGl0anFwSkY1Z2dJM2tvdC85TlJn?=
 =?utf-8?B?TEV1dmtES2F5L2lmdUZpK1VYTmRpUFJHRDNGcWhWSFZ6UEREN2Jwbk4vdXFU?=
 =?utf-8?B?M3hOb3dpOHQxMzIwR21tSmp4S2RIWXBONDFleTJaWFlxM1crYWR1OGVpVlpl?=
 =?utf-8?B?bmNjaysrUnhvSTdTZ1RzMUlpcU5IWk5WU252Ly9USzJ5ditlRjdyNm9Tamg4?=
 =?utf-8?B?Vm1mMHh6TnlCRzdhNDFXWmR3NFQybXdsenpSTXNveXhBME9RYlQ0WlhucWZ2?=
 =?utf-8?B?bjFxbkNpc2hCaTVxc3FGbTR5eThvZlkrcDBGQllPcmZ6SG5TeEhwQW8va2Fw?=
 =?utf-8?B?TVExYm0rdUJpbVQrM3o0VExxY3l5NW5BOXpLSVFlUG5vT1I0bklxT3BNMW1u?=
 =?utf-8?B?Z3B5NHVmV2ZaMTZVMDI2Q0tSbXZDMGp3MWtCNVNHSmtxdGFtOHVzOGJrNjAv?=
 =?utf-8?B?SS8xcXRidmFKU2J0UU9IeTZIbDJHeFBvTTdMalVvZDNRWlI0ODhjNTljWUdN?=
 =?utf-8?B?VUk0bGdKU3hFdVZCODhGQzhzd1RGRnR1Y2I3TzBxdWdaOHhhM1hlaUxqNllN?=
 =?utf-8?B?U3AyWExCZ3JuZE4zdDQ5VEhwYzg0blJKczVHc21PNTJwMnpwZTJoTXhhSU1L?=
 =?utf-8?B?L044NDRORlExRmxnWjJRWi8yK2lvR0VZWVMydis5SXVWVnI5NTM3K2NtUTRz?=
 =?utf-8?B?R01PWmNLRCsrdzRDcXB2MGZta3hhWGhBRVRMZk5OazVnZFE3OFJ3ZDFqZXJu?=
 =?utf-8?Q?MHZ+NLlg2fCF9/kjnR0EGuuR+uLakBqsrlB4u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c4048f-356f-4b5f-0489-08df0710984b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:33:16.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taLHwtFl7nzNXETSiCzxQE9S3NcHV7K1q8LwTaM00mB9V33C+0FnWa/TMaaiUZ96595iZoi6tNVrFXmXTMKnSnwYTlRg3hY5TvLkCwrb1n3+9G+h9re3aKYA33J1mb2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

The model field in struct mxc_isi_plat_data and the corresponding
enum model are never referenced in any driver logic. Remove them
to simplify the platform data structures.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- New added in v2 (Frank)
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c |  8 --------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 12 ------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c1c16dbc1539..e627054bbc8e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -291,7 +291,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx8mn_data = {
-	.model			= MXC_ISI_IMX8MN,
 	.num_ports		= 1,
 	.num_channels		= 1,
 	.reg_offset		= 0,
@@ -304,7 +303,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx8mp_data = {
-	.model			= MXC_ISI_IMX8MP,
 	.num_ports		= 2,
 	.num_channels		= 2,
 	.reg_offset		= 0x2000,
@@ -317,7 +315,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
-	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
 	.num_channels		= 8,
 	.num_vc			= 4,
@@ -330,7 +327,6 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
-	.model			= MXC_ISI_IMX8QXP,
 	.num_ports		= 5,
 	.num_channels		= 6,
 	.num_vc			= 4,
@@ -343,7 +339,6 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
-	.model			= MXC_ISI_IMX8ULP,
 	.num_ports		= 1,
 	.num_channels		= 1,
 	.reg_offset		= 0x0,
@@ -355,7 +350,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx91_data = {
-	.model			= MXC_ISI_IMX91,
 	.num_ports		= 1,
 	.num_channels		= 1,
 	.reg_offset		= 0,
@@ -367,7 +361,6 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx93_data = {
-	.model			= MXC_ISI_IMX93,
 	.num_ports		= 1,
 	.num_channels		= 1,
 	.reg_offset		= 0,
@@ -380,7 +373,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 };
 
 static const struct mxc_isi_plat_data mxc_imx95_data = {
-	.model			= MXC_ISI_IMX95,
 	.num_ports		= 4,
 	.num_channels		= 8,
 	.num_vc			= 8,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 05c21c448b93..73f6ea7b0ea1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -155,19 +155,7 @@ struct mxc_gasket_ops {
 	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
 };
 
-enum model {
-	MXC_ISI_IMX8MN,
-	MXC_ISI_IMX8MP,
-	MXC_ISI_IMX8QM,
-	MXC_ISI_IMX8QXP,
-	MXC_ISI_IMX8ULP,
-	MXC_ISI_IMX91,
-	MXC_ISI_IMX93,
-	MXC_ISI_IMX95,
-};
-
 struct mxc_isi_plat_data {
-	enum model model;
 	unsigned int num_ports;
 	unsigned int num_channels;
 	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */

-- 
2.34.1

