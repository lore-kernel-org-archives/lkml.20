Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0993B5E19;
	Mon, 31 Aug 2026 03:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147249; cv=fail; b=Y2p1SKeegVS+Fii7zkZ1DjLHDjlBjwT8yuqBW8qbWK/XY0DYsG6HhDlIaZ3x3aPSJXeP9s4FnX552Jmf5Vox65A4FO/R7pwg/Bhqd8gkMK5JywjeOHNKqMN3YW9os+6yPMvMgdAGyMhctjJTNBHaDnMWG9n1rhj1VBmzxv7QMxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147249; c=relaxed/simple;
	bh=50hUyr+pXxzHsJvnoLfvNlhLPBM0UyOYCHlZsxlKhN4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=giepaTC7NxkcoUtTz3zXMq+//0a19MBC6G4c+zQ27+QjQmh59Mdj04wQRsenrLMe5JImfVjNw3yjqqw1aoiWxqGms5YHq8JGMgrIA/0k5ker0aSyVTb4avV+4nfSavDlWEQaSkGRUbVjTuQtMFcLVF2rjM/umo5FKt4HPnRbRMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hRLy48qZ; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hRLy48qZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFS7GTnogztre8QK8+JbseALZFC0Ox6SU7/4hJzCeMbqamrENJx9CfjTkdUCCSIeb2vETO0M9sfaNi27HDvwCKno0YwdE783HRGYNaZamUqk2gK72918XKoSQf0f/7QycP7g5nmAMsdYBk9x/ifE/1h+R8Q68pY16HhtILGoVx/dW8rIcIPNKo8/J3W0XBZSZyTypb40M3umxtqd28rpFAyNAZhlxgNjI31cB6n7guEl+9F3APsIQ02bOh5GWjUQSo6DVyBhUk5+ue/iPP55ZUW2xhdpaugiUC3/NdXxj64bO+JcBC/1xr4rrD406XGIAzETYPUBpiXypZYiQzW/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEQjpJEnKW+LzzFEgBFtWQDqxFwqAn8cHv3kqaMTlDs=;
 b=K2/LF5QX7TWVvXFUqyk+3xpknEWjuX2wxbkRoYsrmG5wwf3m5oU8L+jXxpkZxUPOmHLz3yYPwOEUcxxvPJQhNNDBCWrUVvyYVYrNewLtHppLyeLNUfD4433nylMk5DiLvnIV3GOOJ7frWXJOJLLK7s+yEiTs/r51vHrwbnbEmFjTRtmaRNFFmF6VFXvvK/K9FtmQsTkacre3Md8cvYUAWYdSA7p3HNk8IqpfP66/d8YWzuE339UIeNLWfhmZUIXCbRyHN2DmRxXf67PdLb0YvV3b+OlS9EZtkAKD6Rxvz2Nw6qmjSOsLiGWDQSVioNgnZycu5PdWzI9weY/BEZlqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEQjpJEnKW+LzzFEgBFtWQDqxFwqAn8cHv3kqaMTlDs=;
 b=hRLy48qZl9bqylO13iPUXwSN7aUD52Z7AqDhaGEFEw2MP7Wb5nUSComfgHsA1M6RJRAIED+6DresC/r/dfuRICMr07vQel2ChGm5J7J8dIqBYMhcdM3hgDOOzxcGuZY+snpkNXq6JjUnQ7X15iiNgXOJQmV/Gp/1ovljT+QvQ/MI1MCpOMNigGIgPviHZq1QbsuNA2RHutig3Cdj9fQ/lV3Xp4TTeuPdCHQ0Xq3v8s3WP7628I6nVuLGG1yIFRzoKqQXMS521zGXmFkyY9yC02L9ZJ6j92gmGJWGDQmTnY+ohbLV4FieKH8WMqTZLLV9nEZrtCAVCh4K1uVIDYaRcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:33:29 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:33:29 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 31 Aug 2026 11:37:00 +0800
Subject: [PATCH v2 5/6] media: nxp: imx8-isi: Add i.MX952 ISI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=2332;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=50hUyr+pXxzHsJvnoLfvNlhLPBM0UyOYCHlZsxlKhN4=;
 b=TbVxodxDfkgK/vxMDtViMzQXiBFThkBudtx+GuLPGcUZD3xekSZz9LU2tF6RbtT0SPqcKrO2S
 dRD/jZkOHuVDIuNN8bVAHULELGJIYakZtY5JVs5Ri97O8x53FN1E9f4
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: e42e12b4-17a2-4826-8d2b-08df07109fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	Hums45XvKPcwE2Q6Puzwz8nW6ckBqd2etQddZ52DGfPg2p/KeMumiwulP2aisnkoaN4O6kEC8oxbYa0U6Yh7OptqWv1FX2DCTyZ4OxVzQ7T4JmcvrdI375N2djIDZUSMWRhO2zOF+4LqfHvUK8/lClm6CDU7XGUngmIvEgdC5qfzR4tenqklFOWuVSSnArTwCjAt5Es+AsSVOCqV1B5IQ3HAmCxbS4LIGLs2I6JHozWUPvlSdx4w29/i6QnnJu8wOaZZCTIHdZCS7ER2+L4H5oVhvvMvfV3fAFcKys29bbCU2IcMOo26LxWUnCbvLoDD9YGTA/FioNX3Vz5jW8od8cByfKoNvdx/QRpkXSkW2YmQgbfT0EgBo86aGYHdz6I+5RdZls45SBeilMXLR8iBqM0HuC4SM6ANc7rwLHMBwAD4N2H6CBnHlAGfTK0hslYoZ+h+BcogcegovL1NoRmmysiUCMxV49Mk3O142Cg67hZOW2JU9RSmVT0ueuRKWcTDNEkAQO43Y6QAhrN1XAychIycCTG2DTmKtzuaQ68LH6pH53t7iBEqbgWYd3J7Wbm9W9SY0cxyRJcaLBuY4pNkDEj/UXweLzqLfUravjFM/Fxd6naLa5kK9tppn29jnXzSMoHido1rD+9THSUcuUm2h8vMj6iuY6GSpDEq8oHSpsT5lRJ3kh/WJBLij4moCPWYD89US/uQxdxJj06N88XcPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUc4R20vOFptQTg5NFgzcnN6aEFTN2VDY0JSdDJNQU5yTm4vdHFkU0ErYXF3?=
 =?utf-8?B?TElWTFBJa3pKWE14MEtVRlZlckxJeXI0T0piNkVsNWFUaTZ2SGNGUXV3SXNm?=
 =?utf-8?B?NXc3YVIyQ09qbnA1NkcrYkRQWW9SQ1ZjdDlpMXV6MjhwcFI0bXZjVm9DNWxu?=
 =?utf-8?B?WU1xMktlUjBidTBhakpEM0FEaTVzUWRJMXp5NmxpTlg1UG14cmdvbnZvNTUw?=
 =?utf-8?B?b0VWVkU2cmtNdnpjU2EvdkJlMGd3alcvbTcwZnF4Q0tyZjI4ZGE1VGROakFN?=
 =?utf-8?B?cmVsbE50VnNFOGVHK0FkS1JDMXJURGdCR1VMQWl5ZVc1S1IwQWhaSDFOWlB6?=
 =?utf-8?B?bGZxdktYNEVLVmpvbFZobWZkZytEa0c4c2xOMGhXUVV5aGI5aWFXZ1NMRW9Z?=
 =?utf-8?B?bkVlbFNESTd2MVVwbHZoNEhPWlN5cDFLUWhUejBEYlNtbnA1Y0VPZDJ2cHpG?=
 =?utf-8?B?TEcrKzBrQnVoTGFJdmh1MmlTRDUxTHFvZ2Z0TEU3dEN1VFQ2QSs5dk1BeGNr?=
 =?utf-8?B?ZkttdG1BT20yTlBnYVEyQ1lQSEpvUlpFZTUyc2paQ205ZkJ5WmdHeG5ucWt5?=
 =?utf-8?B?V0tKY2RKRVJTMjlKWENUanltL3VWeUNzZjVjcnNtQ2d4elNRa2o0aGtMNmQw?=
 =?utf-8?B?K3BhQmc3aVRDM2FtUkhRWXJjTnorN3hTT2VZcUJmR294U2lQUWZ0NmRxZFFq?=
 =?utf-8?B?bC9vNmQyZmRydWxPbERLTVh5endSbUZUSW5xN3dERzRUdjUxWTFLLzBhN3R1?=
 =?utf-8?B?OEtTVnNVNnUya0w2Qy9yUThvWTlQU2ZzcGF4aCtMOXUydENjWlpCZEh0VXBR?=
 =?utf-8?B?ekhQZWlOUS9xZ3NjdEYwY2dnaWU0WVlYb3hsK3NtbTBxVUtqbXRmZytTNGdZ?=
 =?utf-8?B?VS92RjVSbSttaGRtZ3RXYW9ZOUdhRmJtOHd2a2toOUphVDlkS1dGa0lzaTYz?=
 =?utf-8?B?dXlKU0hyQ2FMQkxVcEpjSExIZ09lQ0ZRb3NMZW5YcnoyVU5FTHQ3M0htRk1P?=
 =?utf-8?B?ZE9mb0RDVHA4Y1BGTGVNcDhieW5XaHIwN3cxU2dNb1lFM2NaWXpVbmN1cUxJ?=
 =?utf-8?B?b2tRUUo1aUZmTm5mejFMK3BPWW9yMXcrS1l1WG1nY1JyR1JhNk5udzBvOTEx?=
 =?utf-8?B?cGJNejVpQmJ6STdCd0JzM1dlQUkva0dJVkhVdHVCcVI0Q3A0dmc3K3ZnQlhI?=
 =?utf-8?B?ZjBselJ5cWZqMTlhK0xoZm1tTFhZeHpUdFQ3cGNBdVBjUTlxOHZ5c3N4emJY?=
 =?utf-8?B?SGRKOEcxZEs3Z0lwZzZlODdRMEFobmRiUHRZMko3eEhldE9yVU1IdlIrYlhH?=
 =?utf-8?B?djA2bE9WeEpvdU1aY08zRjJzdTFFYVM5OFpPSzBEQ2YvSzkrWVEvQmhFRnZN?=
 =?utf-8?B?MG9hOS94K01uYk8yZFl0cUhyUTJPNkdWcEFvZThjNEF4VjVGditESmxycktO?=
 =?utf-8?B?RkdhUGhQaTVRdmlFS0JBUGJDa1JlZWU2VW9xb0NYMVdNYVl3NlA4Z0pOYTNs?=
 =?utf-8?B?WkxQSlkzMFR0b0taejBNb1hZaXFwVkVrelBsUS95ZloveEJ1OFZZT0JKK240?=
 =?utf-8?B?OGhZNUNaS0hoMEtMdHREQWdJN1g4V01XYkU0MGVQTHQvMkFBM3hDNlo3MkZ3?=
 =?utf-8?B?Vy9YeVoyNHVDZjVZVGE1VW81UncxS0hiZ0V1MlpOSnVvdDZ3ZTN1RVdQbHJz?=
 =?utf-8?B?bTFWOHZGeXYvTHl2ck92aGYrV0JiNGVjQ0YvQ2NEQWpLVTYzSUhRalJycndK?=
 =?utf-8?B?Q2hGZHlZZUhpOGwyQlpSc2NxYXQrZEN3K1F4Q01ZMC9KUU01dWNOOUU4QWNr?=
 =?utf-8?B?RU1oR2JXQmhobTdCYzYxRFQ1OXZVZDIrTnB6NVZVTE1raU03aDhVK1hEV3F0?=
 =?utf-8?B?M05neGd5YlpQZ29VVWJQNGxtbHRsWS9qVEhjdHJCMW1Ua3dMc0ZUd09MUldB?=
 =?utf-8?B?UjRNN2dEQzU0T0pQUDFEaTI5ZGNTN3A0NHNmT09XYnN4MUkzMk9YVm5zeXZH?=
 =?utf-8?B?KzkyNHRLemo0OVloZnJ5Vnl1eHVPZjg0MXM5VHM2VU5BdXRGVmVPclcvcE8r?=
 =?utf-8?B?d1NtaGZIZ1RxZGdSNEo2Snh3ZjE1RzhoanZpaDV1MldhZy9iNTY1ODJEQXZx?=
 =?utf-8?B?UEFVTVZ1VE9BbUN3OVZyempXOFZhRnBjcHV2RHBEUWR0ZkJVTkl0Yk1nYUh5?=
 =?utf-8?B?WWdKVHdxRVBML2UwWG9WOWZId3ExMkF1cTNGd0tnajB0SzU0cUw5bWJuYmx5?=
 =?utf-8?B?TUkxMFlObkU5SkV2b045MEhKTmc3WkZHZWxSeFRxdm5JckxJTFl4aUY4Tmxo?=
 =?utf-8?B?TGFVYW1FdVJmaHhvMVJuQWZDUmQ0L3pYUGVtMDB2S2pJY0sycTd0WVZiOFh6?=
 =?utf-8?Q?lCvFwzwJQpvjr48HesnQpm3CZvMWT3GtHdI9Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42e12b4-17a2-4826-8d2b-08df07109fba
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:33:29.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUu8x5Ldr6irZLETaOidWA8kGD1i/U8emc9B9mm4lesXHUXc8Xe93C8moM+x8kt6NmbDIAk0nTkvYlLorhzLcIMdkhNEAVifv4fAIDU+SqH7VCl9RDqZu74IGh/RAO8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
revision. It can process up to 8 image sources simultaneously and
obtain image data from up to 4 pixel link sources.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index e627054bbc8e..d492631dfb6d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx952_data = {
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -574,6 +586,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
+	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 7c4e736f4651..35dec3a650ac 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -22,7 +22,7 @@
 #define CHNL_CTRL_SW_RST					BIT(24)
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
- * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
+ * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
  */
 #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
 #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))

-- 
2.34.1

