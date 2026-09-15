Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3F41BA77;
	Tue, 15 Sep 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469291; cv=fail; b=BF+NcOaCSPpe0x6UxeU1lBjTtyEmMe/cLqWD0J65fvaFRL4rp7n+sNTrG4+rvUDBPohwIiUGTaHc8L2+nCgZRbzK3o/+WiUfrjrdOOZhnu7LHawK/dt6Jo7p2Y5U8YU+0+e8YEa7KItZH4aVz+2bN6OdQLjkNOfpCGOoTsVZSRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469291; c=relaxed/simple;
	bh=JrDF2MN46AsXTd9gjDp81INIx8fab4ar+2+ayabpDS8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fTjblgZZFKNmcW/KsOxhIbKMDUGHJonSQgm8zvZVMOZd5denexiiOCUy2S/+laq1Y0XM01+DPaspbAZJWGxGkHSnri2CPuc45i0XCj+G7qZt9zHVi/3/5oOoQvrHwwU/tvPUeMIeoq3iXdpp7BfP0bGJr3CIbnIpEYNk7IG6oCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oYef1Qq8; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oYef1Qq8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TawMjmO3eexTFLfVBUp/aLXywjH65OG5CTg4sCF0gqc5U9iYCcGQoSuU+x9z3sN7EPUiqdoxXTsR5CyhhbsDvtBrZCnj++ZVPbUmdoj9LT4h0K0VTesHD3LxEetLD++z9xk4FRqNz6Dh38oBZUPOsMaFX49t2CQfrWfhE2oIjXrUtwl4IEz5IUb6/eLEpotcXVN8jqOk1jw941Bif1n+klYF/FoEMsQKylxHyrvzogou0h5upYdzBrezZKK4Oog6eGq6n/pKh3/Z98YSDmcvfP0Nm9ZKvVhfGzJpKmnndsSOl6BMJI1G9Oj3/AYSCMI3/NaZe5+eRTXSgGfXPS281g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY57m28q6tonvLvwKP/6ZY4g9U3W6gOIolpi0L+JRhA=;
 b=kL4alMQp5hRM3oQVHk9wY/K+35B7B50T6E5vsAfFlC2cLW1O15lb+CYbPDD6BDskGV2QYCQoqPeQPhgkKZ71AaJ0EuMYkfsV0KEw/SzhUilz/MH32QaSdfWXnAx5fvE+A+AfSkfQucyQXaDybWgUB82WNdig9yFpTy2ex3ctelx8rkkGF6nkoyM59wjUdk9y7Zx9KLKW3vSOJOFfHvsA9BPJQ/fDNLI7uI/y68zunWWyrSrDVpmnhNHXDtBgk4WNMZs6DBiUk6K57HUjlRVdpazTGItCuKL95FfniEciZvGDxSCbFSMxwYHqbL2QYDNevqlWKlXY28K8P4WyypqijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY57m28q6tonvLvwKP/6ZY4g9U3W6gOIolpi0L+JRhA=;
 b=oYef1Qq8cD8NwbwnhvyqAlqAJsrIZrKVRCNzWqbuIr8K4OoaaBztyyto9EHn0vS7WDEdJoYWbxB9/w73FqmI+vEgIKMDhoHf0QG2Dj5uXSvjWBWNCIt6nLoqHZ3wjYbob4wjSwN9vv9T6MGcJSOOpwc24ulrV79nAuM9cVWGtH1ZlvMLQbf23Z1sqlGgIQanV9Nl0oUxureW4uV94Ml5dTNIQAgL/UkPrl8yJ/1GR3vQnSsxx7GLeMQgkIigXQb5xOk4KAdDkxEHppZE5/J7tDMGLiXsVaiJps0lDoWBGy61CTeXiAE10g48RJuyAkDBeElWGm/Ty7cgtnYjIe8omg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:48:05 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:48:05 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 15 Sep 2026 18:51:51 +0800
Subject: [PATCH v3 4/5] media: imx8-isi: Add i.MX952 ISI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-isi_imx952-v3-4-3d8ff1363dda@oss.nxp.com>
References: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
In-Reply-To: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469512; l=2965;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=JrDF2MN46AsXTd9gjDp81INIx8fab4ar+2+ayabpDS8=;
 b=SUtgiwX0VDXw0v8UV1C0hEWIlomhhuUfPxfVhVwUo7sFziUKfnLDu1Rw5XZJF4+pExRtMrfRo
 TRYDy2gAvsbCqJzUC+bVuPsnxzhleXgeg/hLozSCZhJnpDJnyQnUCwn
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 3859e1b2-bbe4-494e-aeb0-08df1316d2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	epshChmwVw0K0evsjinIMnQEj1tSKY+ElPr4Fm3LKyElN7dgD8HcfC8V2jkZLyXm7mpbra55B4NXlGZolr3YygWw/g1FYKPYzr+jXICvFowmDifaq5jRx/bEeISP6cSkV8cD+zRLB/qKVABmkASKeW+UXk0GBnYC+2ZZMB6h4b56DsJ9tBcvWLuAYv3vYYm/U/sODP2wXru/Oca6D6R8Kn6kMaUMoIBJCEkuffr0y+QY0T7BheeXA0TvtakLe+E0A5M0rBu6kX/rB6oBuTiTJ+6oOMzWbjNqytUEWm/L0DNpSR/ZI4jxgFfKGAXAUQk2mqPMe1HPIAxKrLWPE96lauYbtm4ukhIkE0LBPkOBK8ReOdUOTSacPuAyS0bWIMzH4yogM0dn5dbNf79272C4DliPWsVNin3ExXN3NhahRyZT3IVWpFiJK7POxIDN/NZSATLhAgX1NQ5O7+YkzmrEtBXsQ3QJ13RHdXIdXyVrkcn6W+uFRK9yX+keRrEnyp7/khDP9+iHxYd6T41TFjp73xNO3qIqPlH5UaQnXyCkfm9u1+XOExsAyFofQr7fzRdPFESp339+JJof63WUc8klAY4vn7O5V24LGP72G81THPlLcHh6FXtNEIBQCbfk1ILtJkJNLWGiL3ge5t8m2CMhqLYa921p0WPm4elB2kqYFLjkHTixy1P/wFL0mkRqACthJTtT3p8PSSakW6MF2QNrww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjE2ZE1pc3V0T1NJVlRpTHpTclhUMytsZ081a2Z6OG1yaHpmZHp0SFpEd1hi?=
 =?utf-8?B?Wlg0djRpUWJkV0pRVG9PeUNFdkxIdVRaK0dZakVNZEpLNDd1UHhkejl0ME5w?=
 =?utf-8?B?ck1YaWt3a2c1Sm9LK0NCbGNhc2I1NUI1dDdNby9tQkZTaFNwMkdVZ29OeG5E?=
 =?utf-8?B?Vm81ZnR4Rkh2Z0lHWi82N0YrdGtsZzgzQW5xUmFSOTVOTk9Sb3ZHU3JnVTJG?=
 =?utf-8?B?VkdkNVREUDZLS21tN0duY2psTnJLM3lKM2dQTnFGS2dqS2R4ZjlEanRYK1do?=
 =?utf-8?B?a0s4bEY3ejlObVVDa0N1aEhiTmtUUG5XM1pWTncyTHA2bnhlbzVPSHZwaFZY?=
 =?utf-8?B?bjk5N1RTOENTbEM3Q0VZWnlJZm9yZ0tSRlVTY21sQmNWKzgzd25teVhwaStm?=
 =?utf-8?B?bE1NKzFBUjVWN2ZudU5oUFhxY1pCZ3ZxUDhybjhXR0xkWTN4WnRiN2c3aU5D?=
 =?utf-8?B?SzBkNnlEZWJUbzRYTU1WNXV0NjB5WFlkSlNSQWtmRExOc2tFUDNvSThBZ0Fv?=
 =?utf-8?B?QWQvMkVvYm9SaUdhbDFNSzRudG1jM3FwMHBWN2tLMDZueGlXdzhTc0Rac2Jp?=
 =?utf-8?B?WFpLOU44em9wVGVpRHBvU0t0aEJob3ROWjM5NWVUQUNyQUx0TFhxU1JBRkFw?=
 =?utf-8?B?K3RhSHFNcUZwZ2U0bVRwcGswQ2toYUtBU1hRc21HdkVkWkpnbmZBTzFOd3hm?=
 =?utf-8?B?WUFIUVhXYUlWT0dmWjRxcG40K3ZweHZNMzJRTkdHR0hQTkNQbFUyRXVEcUdn?=
 =?utf-8?B?SFU1UnhwWjlWVnhDL25qTzNvT3E1aFVUaXRDOUUzVElDWlg4NlZCV3lNb0ww?=
 =?utf-8?B?QU9NR21WR0ZWdjBIcUE3VjN6QnhVQ3F0dGRZZXpLRi80RExEbFB1RVhGZ0VD?=
 =?utf-8?B?dWpIS0tLY3pESk1jTlJMdlRQenkzcEVaNVZJaWx1ajZNbUltLzZBWVhJNmhv?=
 =?utf-8?B?NWlSTit6YW9MaVRhU1QyeUNKUEEzbzJKOXM1MHg5VTlTeXZmQmF6ZDNvdEQv?=
 =?utf-8?B?UEpYSlRHOWpETTJsaWhTUVBVL05SRUZYZlExeDBoK2VlK0xaSXd2L3JzZUJj?=
 =?utf-8?B?SjZ6MkNGOVR2Ny9OekZSaENtV2FRTytkTDNjOTA2MzI2d2JCVzVZQkJQNzFi?=
 =?utf-8?B?czFnUXF5TDB0ejVsa3FGSjdjQk5FeDVlZ1FpemVCd255L3ZmOENlMU9wc2I2?=
 =?utf-8?B?UzlBeXVJZkd6VGsxZSt2aXF2QkRJY25mWjNla1R3TzBtSjk4OWNNMGw3S3BC?=
 =?utf-8?B?ZUFBYnR2U29qczlLeStnZ3R1Kzhmb1o3dmlqSjJVTXNNOTJvV29pTmtYVE9q?=
 =?utf-8?B?dTZmSWF3bVNBQTArQ2RjS0lCczQxTFpOL0Ruc0Nlem5Jb2F0UllpSDRaUUZ1?=
 =?utf-8?B?aFJqaXJ0M2lXbXppQ1R5YlpjMGFFeWx0MmZlSkNCdmlEWFJTNFVSRnM2RCtO?=
 =?utf-8?B?N3E0dVkwOGUzb0NYb1NlbVh3WmllNkVxclpkZURGRUV5NDdBNm52YUZXYlZi?=
 =?utf-8?B?dTRSWVVWaWtEanhjL3M2Yk91aytJT1liOXFKbzUra0lsdkZ1ZDNIaTZoelVG?=
 =?utf-8?B?TGxTQXN2MlA1a1BybHlqK2hSWThta0pYdExCU1hWRExQZVREMjdFQUlXMVNC?=
 =?utf-8?B?Wm5MR2lKTHY0NGU3M3hlNWJrUTdxSjZtWlJoeDFDc3pXTFh2S1V2QnB1clNU?=
 =?utf-8?B?c0oxYXBwWWNDTDVEWGYycjNseFQ2ZVpxMUZBZ2RwOTJ4Z3M4T3FTT0xkamV6?=
 =?utf-8?B?d1ZQZzVZTkNqOU43WUdVdDdYOFlDa24rM05PZll0Nnd1U1IzMGFsd2pGYUtH?=
 =?utf-8?B?NXI4OGJtUEV5T0hqUzlKbUtuUG05a3M4NzZmQnptSXV6YXpiZnlVVm82ZUlI?=
 =?utf-8?B?a3I4MUNCSTVNNHd3VXE1aFNsRHBTNXJiT3NZTGZONVlJb1E2anZIZFJ0TFdt?=
 =?utf-8?B?cEVYUWpEUWtXRlNlV1ZqUjlrUWdvalZhSGxDTSsyVlU4V2syQjByUHlSenRm?=
 =?utf-8?B?UUNid0NLMCs2VTBINk5odWhjU3FvaUlBZmtSalNpYUJUeUwwWUVIQlYwNXpy?=
 =?utf-8?B?aWoxMjNCQ29lWldicVZBTEpTYXBnNkc4NEo4bDNkSlNYS3haYVRaK3JMVjho?=
 =?utf-8?B?ZmRPL0c1VGcvNndLMzdHdExsWkdBRUJIaTJ6bmpTcXkvWUE5RmFJMVpReE03?=
 =?utf-8?B?dHBQek1DUmcwOTQ1NEx1dnk3RVg4dU5rMEl2dXU3N1FEYlROUzdsL1NUdkh3?=
 =?utf-8?B?UVU4U0wxZjl3UDI5SDREaE8wbEo3alpPWUVicW0wMlN0djZwZ0s3RU90bU9L?=
 =?utf-8?B?SS9SV2RhcXJxaXJPOVNmYzBFZlU3OEdYQ0kxZ1luNkQwUjZBWHF4TWRpRks4?=
 =?utf-8?Q?f+VdtIzY5QR3uRG6u/huVs9Joh3p/YVCw4RQA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3859e1b2-bbe4-494e-aeb0-08df1316d2b1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:48:05.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSaeJ1xnRXskpLApnppNqn5AwsckWKUAOal+X6moYPN3+RoXU63oC+jGGNiBliN60Or1zG0lRCv0FNQfEOD5K9odfHN7YYbSTRv/00TDdWofM79CDZVoQgVQgz4mzNTG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
revision. It can process up to 8 image sources simultaneously and
obtain image data from up to 4 pixel link sources.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Extend mask globally instead of per-platform (Laurent)
- Add Reviewed-by tag from Frank
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f2a8eb82fbfd..bedf8515b1e7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx952_data = {
+	.model			= MXC_ISI_IMX952,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
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
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..839693fe6e0e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -164,6 +164,7 @@ enum model {
 	MXC_ISI_IMX91,
 	MXC_ISI_IMX93,
 	MXC_ISI_IMX95,
+	MXC_ISI_IMX952,
 };
 
 struct mxc_isi_plat_data {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index c704be882705..5d166d670ae0 100644
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

