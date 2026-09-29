Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EB84C33E9;
	Tue, 29 Sep 2026 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671732; cv=fail; b=YjFI6tsBXTohYS0JZEDoxdojBhLf7lj9pH8Ip2gvl1nZE+HcmV6OwHRecqaF0m7i3BepBw6iHR9miUyPOp0lQLuukxRmEsVKxV3V9kLKzM5DFfddfS08SrjMfVCKZG/AcOiy975nNQ/TiSdAbrcUNOtofS9QWa2RhCWkCCHi4do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671732; c=relaxed/simple;
	bh=q23o/ATBla5cGPDyTf7iFQ2XM2LOnjh6Pz7JZ2CPFGE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pTjsQf0L1MF9gL4KMhHt8Z9WHXw+q2PBzGE3r3Ly19JFpY2ps/AgW4IyV8ewsO82wmzWipQKYWiGeytow9WLHhdCGm2dotRKdTyy7LpyNCvj2pNNHy4CqLkuvjRuyN7mv6d6FpmB/uS0tXVkOPy3L8zu1gdCsCc/a40ByMQPOPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=inWmpTY0; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="inWmpTY0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkygattS5xSZislueDlFnqid8Rp6JHd5v5OiNLYAN2UlH9AywqGsN6oB65etpRHQTuBSqeBzXepkfQUDpTZSfA1jggakfynce9jp/afhvMOFO9Z2W4KJEx/XOP/iuxvCGuEp5U6MlaQ+pI5Py80pFYzWAqAi0TZB3G45R92pXj2Pcd7QUqQTuPIlWBwgS6EK9+Oyy269+C6wcyhxisA2cfYViOKW5WU3smdM7GSZCgOG7QW/j1+aXdKFSGqmrk4USB1qxMsRecrOF3OSnlEDCoHEusqvr6s8s4sHp17cmUgzJkFQS9Wh2KElQjD4vcn0tiwXRk3QS2y3ueUV8OZwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdbO5Alud8E+Cv5PfJIgXknqXHqFWzLaj9XEdNqICQ4=;
 b=dTXuRtbk6q27PIV3cV3/MMgCn+p/vtQqsE/XfvpP65UFGI+PR4l7HVGvwFAx48qe1MXzKWIU0ApVjNwRviUWdD/ceygBCeGWCSYG8F1hLq5enMHYqRxyRZ7pJBW1pGmEpJFgrudIVcsBCk/i5UQm/s6YhoN9oGcwtvoWu4ieL+yEc3IOIAluP+DUzOZBnUukuHrt4GhVwrsLqfH84pA73V7A377QBw+2k/FnvojQGhuIV9GEFjw5Izr9zGcsAgoFWFmJeWdb9BbEt+icJanIYg4+D5IiTgcdwLeb4QL0NTZdyq8uionxjb/+mY0NFYUniy0jTEPiEGu6S4iH1e3jPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdbO5Alud8E+Cv5PfJIgXknqXHqFWzLaj9XEdNqICQ4=;
 b=inWmpTY05PoIk8ivHu1MzSyB+JwMcYYJsOyI8VVxp43wIRRIy4fbPNuJpxvWdgcjEbjsspYA+POuN2bCmVUB+A4GOWbVngfYEvQ2yRFyOIq7YjhesznGySc34zaYUILBXj1S+ZNO4Yqa+NgA0bNGaBYioQL7VQB5cWX1WPcMUQlMhgKk9qC3KpkQdHmy6UmV/Yly/zt54U6fd4zVR1NyRFgvzn54VSTxLWtJfp3yIxZoNfsBWaz6QC3zJeF0K1Ynjo8VOa8Za8e4aianoH4tfol5uxJdtPosnvU7iyzgqZ9ljpMnZqH51+U6A5lXY43v1Qu5qhtQ2ENYqnKQOYenEQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:38 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:37 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:26 +0800
Subject: [PATCH v4 05/11] media: imx8-isi: Apply RAW output format
 workaround at runtime
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-5-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=7179;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=q23o/ATBla5cGPDyTf7iFQ2XM2LOnjh6Pz7JZ2CPFGE=;
 b=yvS9ueHwuhcPgxWqJz/atf563YpBTrfAvHAqSvgJpsfDhmywgXOs4SXR/TZkLG6XmRblb5ggB
 iAV2kpsAl+MB7FlXkjuVKT5f3a+yQlOLbBKGzEk+dOT3YO6HwVNr0lO
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3590f4e1-8c32-4069-797b-08df1e06741f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ozKE9TkYJ7ly51rQEXCkaDYno4GDaaKrohLFn+HBBhpDHWZ6Kng5748BnLe34/6vDrs1Khxh8IJecwZqP8+UHE/qPCNHXy050C6PcCl89hncCl6jENBAGrv7WbWI6t2/OZCviWF8jDTRoWMNcpwy7Al9pPAYwgEdbAtKiolKoN2kFnkR/4dVAr+OMcJtGBhCjrq+URuGPRqZ6evs6gzPFYt6d0vllL6bhEzYb6OSkTmLXKgSo7G6INv4P6gLFofcxVOUfJNbVrDpxm3PmV1wZd79ijIvAMyZ6B6bPzYLdd4us9+pemrlCofNEl0XbyiAtMqqLhOsNH2EyGOFud+yn4e2tN1iGONQtukfXxnfCiQVAcFvqltCsngnDkKLo28Fl3gVlpbWhm/HDOOSc38hhErUBv9zcKcAmA4PLcV8yaSZw5KzHM6S4k0SqdeyN3PnFRQNc2R//rLobfPH4ELapSb6LkQ2ZOY5AHVeSOEXiDkofwzJd9l+kLJPC2nwBBtZF9KI/kGXEWGpmhnnPs/fQw9LsyzamJgilJJPnmsdm+Wbw1Pn0yw0awo4PqNfB4unTEFHZac3x38JBh/hFCx6dzBwUcJwVonESDoOxOMNRNCuf9awPWMxScCWJDbGbXohmKIMZQAA9/xhEvFhrzWfNW/9xaOmW9gsnjATdLHx7ZpaU8nfmBVEHXTNznHqKQM/LCKXpvHvCdOdA2suaScgwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW1OQ0NKWnk1eWVqT25ocHRQSDRQRW5hdWIvRnpYM2ZPNFh1UVlQWUJ4N0M3?=
 =?utf-8?B?UHJxdk1EcWJrbUs5aDhPcGxnejM5N2JjdVVFUDAyb0NkMkg4b1FpSFdZbmxH?=
 =?utf-8?B?Z0ZUSS8wUFhsMWtCVGtTZkFHZS8yK3oyZEhrNWtTcjk3dDJETGpibU5GdG5F?=
 =?utf-8?B?cHRITE85dUswUVI0blZ0eVFzSHJQclg3Z3BZeExZRzZESnMyMnBRY3JjbGlv?=
 =?utf-8?B?QllnTElDdXBLQ0ZNUm9jdElXRjduQ3ZUeGZ4WHhTbXlBVmRicTNlOHNLc2pq?=
 =?utf-8?B?aHp5ZGVwWTk1Yk8vREpXblltOFliamdYa0Jxa0YrbjNycG01bUNjR1RVSlNF?=
 =?utf-8?B?cTYwbVcxODBYbGFLZWZKcHp6dTFFMCtya1k2ZHU1YlRhTDlVOEt5NCtuRVJ4?=
 =?utf-8?B?WGZaaUdlS2U2K3c5bDQ1b2Z1RUlFdlFKRXU2bXd0K2NhSkhQN3FWRTl0U1Nm?=
 =?utf-8?B?R3kya1JDdXUvVEdMWm93QVpGUlBvMitCVjhScUtwcjliUi91VkxQZEhkSjMv?=
 =?utf-8?B?VytIN2h0dU54cERZRUF6T1UyZWliSmdqNmdxbVY5c3NqbGFZWWxSMWZ6bmhD?=
 =?utf-8?B?SXlIU2Z6OHpHMmVCcUtLenZmc2lrd1pLY1F6aGplMzVUQUZScTV3MWFHMVo3?=
 =?utf-8?B?QUFoVDB6UHliUWMzNGs4NTlObFNUYVRPQy9oV29qRWl2azNXMGdVS1oySkdU?=
 =?utf-8?B?emlpM0VtU3FXay9hQklHL3pSZFIvanAySE90a2JFalVQbUhyOHFBM2NqYU5J?=
 =?utf-8?B?TVJHbEhKQ3kzRnlid3BtN3I2UDRkZ2hENEZMaFBuQW9hQVJSYjFVdndTZEhq?=
 =?utf-8?B?cWZVRnNxZmxpbHI1azkzNUpWZkM3L2dsdkx3R3BVcm5wMkVsM2xhVlpYL3Zq?=
 =?utf-8?B?OHJQamd0bGNVOWZOekZDL0JiQktYcWxUU3FLaUluc1B4VURkL1dSemFXQkp3?=
 =?utf-8?B?djRQaG1sdk9VU2YxdWJ1QXFPK3VNZlUzcGVCM1VXWFdMVjZJdDlvUlpKeVNv?=
 =?utf-8?B?WU5yV3BGK0lkbUhKNXkzSTVTdFhqYnVvanZJcmQ4Q0k4S1lFZVY3YXVsNUhL?=
 =?utf-8?B?cEZqZ0lwNDdjMlppb3o0czM3aGxUMkM5WGdWQlNWam9zby9rOEtaZ3o4NVRS?=
 =?utf-8?B?TnVxVm1IWmhTVnlqM1RCbUx5M1ZZdDdmZjhGcmhWZ1BPNGprRFBqRTI2bUdX?=
 =?utf-8?B?alpDQ2cxTDN5ajZkakNrVkdLakFKVExiTHI2cDY2a1RRSkZTZWlnSnhNZmxE?=
 =?utf-8?B?UlkvRTR3YlNPaG51Mkx2RVFMVk84MlY0aHFjSlJUV0U0WUttQUlZM2RSZ2FU?=
 =?utf-8?B?YVdTaGZLVUNKY3Z0M3pJZzI2MjAzK0JXbGZQME1QVmZuUEFSWGFDOStjTU1X?=
 =?utf-8?B?QTQxNVdXcnBRamluek93WnRLUytjQlc0QkJUOFhNWkRQcHN5QmtIeWc5Nzhn?=
 =?utf-8?B?bGx6ZWlhcUtqdENXaTV3emVmK2R5dWhFdWhBNzVneUFIdG9UdUZHa2poWUZx?=
 =?utf-8?B?U29LYUFLUWd6Z1FaUWNLNWxxbks4VmU4eGRxNUlqZEtwL3BJUVVZYlVTSnJX?=
 =?utf-8?B?K3owOEMzR3hCRHcrbXdZYzNUcXN4V0Fsb202UWYvQ283T1p1ZS90RDI3N0ZJ?=
 =?utf-8?B?Mkk2d2ZreS9JYzdWbmJ3amhpcWtHUnZ5Z0tQa1RDd1I3UDR6b3Vzd2J1NkF6?=
 =?utf-8?B?ZkRHTExmWGVZRXFDcHMvcUo5QTNXbkp0S1N6UWp5WmxHSXBFN2piK2lsU3F2?=
 =?utf-8?B?a3kweGdjNUlrS2R5cHhpYjdwRGRNNW8yc1VFZ0NBYldmWlFVUmR4NkpQQWNx?=
 =?utf-8?B?TlF5SzZxYkwrKzF6ZGE1b0F1RFNHNWxRSXFBMEJZY1dzU1BqaFdHY2h0UHNX?=
 =?utf-8?B?S3ptWCtKNzg1bDdQQkE2RVJENG1FbllMQzRiZjc2UERXS2VETThHYkhJbWR0?=
 =?utf-8?B?eGNqdVIydkQ2YjlkcEJIek1zdVBTdG45WEFlQVV4T042ZW5Hem5nd0FNQ2F4?=
 =?utf-8?B?d09JVTZ0QUtPWUJOdXlvd3AxUVg5b0QraVdUWjdsVU5wVVVhOElQeGNiV1pZ?=
 =?utf-8?B?LzZXMlZkb1JweWJuS1pnRExMMmlxaGk3UUFwUTRBL2FYNjlLRm9FNXlnUDNh?=
 =?utf-8?B?Q2Mra3dnYkwzUG5zdkJiYmlsRkswc1g4OGpUVlI5dmxnUkh2ckVJWlllUXk3?=
 =?utf-8?B?UHR0OWY4Kzk1N2NrdmxnRXhuM2JGekkwREF3ckdNWXc0MmNISmhoN0RCNkJR?=
 =?utf-8?B?MnNOa0hHQzE1VVVSakhOcVg1K2F5Q01Ic0hCUC9OV2VQVHlXQVRCa245RmFn?=
 =?utf-8?B?aEw1VkhTUHR0VmJJdGh4dGYyQzg4TEl0UjVublNHa1ljSXZDdUpwVDVyNzMr?=
 =?utf-8?Q?bQZYuCHCGmFfV+bhgAmql3PfnBBGY3Aincmf1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3590f4e1-8c32-4069-797b-08df1e06741f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:37.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuiTvXh3Da/jEs3wsi3qtOG9yeZDsLeEaFurgXESeEt08dIeT8fylxg9osquY0WtRQ5s/Wiodv5NaH48NNtj8jaOQbTZ2LCxO3AD0RQP/coRnLUcCi4blDIJOORnL+Yv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Refactor the RAW format handling by storing the actual hardware output
format (RAW10/RAW12) in the format table instead of the workaround value
RAW16. The RAW16 workaround is now applied at runtime in
mxc_isi_channel_set_output_format() via the new isi_out_raw_shifted()
helper in imx8-isi-regs.h.

This makes the format table accurately reflect the real hardware
capability.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  7 ++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 13 ++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 ++++++++--------------
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 6aa760ce3605..cc52a90c2477 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -411,13 +411,18 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       struct v4l2_pix_format_mplane *format)
 {
 	u32 val;
+	u32 fmt;
 
 	/* set outbuf format */
 	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
 
+	fmt = isi_out_raw_shifted(info->isi_out_format)
+	    ? CHNL_IMG_CTRL_FORMAT_RAW16
+	    : info->isi_out_format;
+
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
 	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
-	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
+	val |= CHNL_IMG_CTRL_FORMAT(fmt);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
 	/* line pitch */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index c704be882705..0f3ada30e71e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -421,4 +421,17 @@
 /* Channel Input Buffer Extended Address Bits */
 #define CHNL_IN_BUF_XTND_ADDR					0x00b8
 
+/*
+ * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
+ * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
+ * to align the bits to the left and pad with zeros in the LSBs. The
+ * corresponding V4L2 formats are however right-aligned, so
+ * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
+ */
+static inline bool isi_out_raw_shifted(u32 format)
+{
+	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12;
+}
+
 #endif /* __IMX8_ISI_REGS_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 21849af3121b..365057db47bd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -218,15 +218,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.depth		= { 32 },
 		.encoding	= MXC_ISI_ENC_RGB,
 	},
-	/*
-	 * RAW formats
-	 *
-	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
-	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
-	 * respectively, to align the bits to the left and pad with zeros in
-	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
-	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
-	 */
+	/* RAW formats */
 	{
 		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
 		.fourcc		= V4L2_PIX_FMT_GREY,
@@ -240,7 +232,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -249,7 +241,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
 		.fourcc		= V4L2_PIX_FMT_Y12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -312,7 +304,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -321,7 +313,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -330,7 +322,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -339,7 +331,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -348,7 +340,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -357,7 +349,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -366,7 +358,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -375,7 +367,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

