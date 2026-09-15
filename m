Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12451493646;
	Tue, 15 Sep 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469299; cv=fail; b=TmL2yp+dzBZq3mc5y6jSUIdQ6gWJSNUSfJZ5f/FUmY8+vt+mm+Uhxm7PADJGAprcLQvG07JFSj4ML+6H6g7yOrMC/MM51UlVgucBaWnRpxkhLk2PE3Nk3CidnauHHvbjiF+TJDm7srZsrOgyVOmCVrb2C/oHoaPzrYaO/iMunWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469299; c=relaxed/simple;
	bh=/oX4GYvAncNyj8EJD5enjo4CWA5xAlpxdE5Vr7cZJQk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SDVmnLUni0bkQjG0XWcXGGqu6B4cntm7DlG8QkGdgqjmCft3JXpZwAT64TuiJKpcH9qAB9Mr4rwz0OiubEIfQ4Gh7ObnVt01OfQGDcSu7d4dYkX3v7VFuuF3+aZF5ZnSOtTelJvLNcJwKwSXksnZ1xXJqjjCsNQNCENH5EOQKmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kfoezfsJ; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kfoezfsJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qg4DFrckndDHlfNCDKwhbpN865dALKFsuE7n0z+Tz8sQp2esWh9Z9ljLjqHgBoqaOkh+ktDzXl7cZ1BV5VZ/h5lomuWaSFXOy3j1TukEjiuMd8Dk/Nwn3uea2aNWieK8uktz/mB0L8Jk/NWR0P9JcRnWrIXc7glC3AI7hWVwjyr9ohTjT2pHUY2l2RejkQ879x57+yTMG6PxFRyuib46IUD+k0Eb9QNoLh5PeqiWzHbm4aVlARCGLeaGklOddXYNooeDnZVqFbyHtKBeKbHPA5Wa01lbLYFnYs/aSJ95tk7SqfTUt95ved7g5pxnARJXlZt/jq9hRwJUGLKMZHLh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9adsG0HdxiBBSoCMwV2qwu6+9cWqiwsA0WXKw+AMOA0=;
 b=vyZTD4D5c5s6IlvT0CzJvEGTzT/0LOAnlNh9neIvAEQaXNGykGTqP6FXIfSlR+gOAhIf4N+3kucTdaRtMattFg5g9kckm9s2cfQ+o1se9RQwOiBLCtt0CzORtChn+G3pdPXLlkFCFkA/gKp6hal4IYeage1A1/i4NhlgkxrV7jZRXJRP8SGInl8xl0HXRSguM/B7sjMTga7I9HdBQ9/GC9JEs5vT8SV50dEm/gfw8r4fersq/yejihoQr/BmCGgB6EEEkKg3grA311rX9vMr4Mynsy/ONY51cCVoI25lu+7qhsECbKQVnPYM2ABtLZV38LS4aa+Wz+uzkrgFxriTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9adsG0HdxiBBSoCMwV2qwu6+9cWqiwsA0WXKw+AMOA0=;
 b=kfoezfsJ8TXMsgTJhz5CYDJsXSVblt3xVCJlzDNR5rXeK1o8R8eeKgk/N8wZMC81pNQjze8yTvuLvphodwVleJZlqju8Ior3C10p9Em3dGrrpy0QA7kqrICZDGtOv06/UGqrub+c2AbqTqDcqbOSdzdROUXOIBLDXTkgyqXNRBZe+jPIDJ5911VQ79aXG2nyn5eKywSLCpvdD60EpAJCONYxctZLvvCzjSn6u5/P/3WXFSmqIOSvoMnOiK6WBsBpH+cP+jW+ZK8iSUExlPjgUyObm2UhDbO/zx+lSwYojAW6ffro0iPY0cKnbosnbd8I06XzlF3EbDC6GgWutbfseQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:48:13 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:48:13 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 15 Sep 2026 18:51:52 +0800
Subject: [PATCH v3 5/5] media: imx8-isi: Enable ISI RAW10/12/14 output LSB
 alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-isi_imx952-v3-5-3d8ff1363dda@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469512; l=12284;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=/oX4GYvAncNyj8EJD5enjo4CWA5xAlpxdE5Vr7cZJQk=;
 b=OgrC4VgKhPN7034RQSi6AwfomJJXXKwRspMpa6qQX3HgbSDOWTbslPd53AOdlq97we2htstyv
 nz18UdvsicyC/CUgnfSoH7s2kYXiYug2SxjdV6ZYnEdhTee1Mq4joVr
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::15) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: ab73d636-db97-4d28-dc55-08df1316d733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|3023799007|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Nzkk/HomAepru3FpS1usj6JtAUCKOAgjvSp5/NtPQNSP1CMoA/wLC4MKLQ2WIdAqFH2RqWsK3s2NaQE6+4MW2/qXpodURD/QjJ/1uQHB+eFXPvTQilalCfK0dvMwctr83YY02Rr8zK7FYIW8ulnvY2SN4s3baID2NrNtSXX3erBOtPPQh2Dlx1rK0vHmfkvlM5hbDt7VRi1LYJcrUBLSZFtfBsqn7ZxaWFwaeg24HT2XMojcrEhJBXL7zZVMP1MkeFy3slHDuHdcxe/y8iyw3ag9ur20p7nNU8/3EZ2ss17Qb2iNeSoG8ZKAeXyYXFZjRjlEGWkJ+UrX4zUcsv9l+P6EFNCdzt0IVr9RszUfcy7B5NIcLA0VgJM1t4nOV+Mv9ND2fq6EDIq6uCDpSCGg+0leFF28A7qkhRutlYZyJvUeL5qcqAWRAt/HTj832ZcXWWDlnqrgNd2HIyfv9mNWxqHLWknpM0njHBiCqozlBLDT5ETqONkCgX8Y/6sT6T9foU5ZvUPL9xs8afcuL3w6OlCYRKla81swXyNJifrFzZByUx/cbkfIjmxSVCYwRS4zWPSkKdBDVYV180jhpEszXjckaouL7Sm/WLw9GUzqE2XIIDrU6UHzLhduIeO2yeMltoSh6SzJ6upXd6cxm6w+7SJSG5AzSvquA8L3R4fb/qiBvPsrI+E6tah+NqxALJrACDZBprDd5qeRytREQz40iA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(3023799007)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNsVFJyYjJIbmo4OUk3cUdtQ056THpoeXNFc1FXN2w1ZGxMSnNScW5FY2M5?=
 =?utf-8?B?YU1HOGtwZjZvQ1R3L1lPbGNVOE4ydVNIUUErYTJleVlFZnZ4Wkp2dlFkSEFn?=
 =?utf-8?B?TlV6K0FrR05VQTQzb2RaUjhPN3VEdWs3OWxuOUxTem9TeERBemZpdDhRd1V1?=
 =?utf-8?B?Lzg2ckhvV21BL3pudFFhYnJEbjlGMlpjRVlSN09NUlVQeFJpYmRoN2xPMUdr?=
 =?utf-8?B?TkpCbWZRQ2tTOUJkR3R3VG1uT3RjdmoycUJOdk5ZU1JyUFJkQ2ZTa2xTajNh?=
 =?utf-8?B?WGtTK0FkbWt6MlBDNEJVWnpwTUZESWRndEJPeE1OTzFJZjR2WVprUlVjRlRR?=
 =?utf-8?B?cEprNmIrdllBQkh1MUdubmNqTWxHVjlDdTExWGViSlM1MTZ4RjVtYWlxQ0tB?=
 =?utf-8?B?bFhQbXlYbHQvQTNKMUFNelJxWUxJQXFXaDJEcXc0OW1SMWp4Q3BlcTE1SlNB?=
 =?utf-8?B?SHNzUVIrbWtGRTAvU0lRcEsyemdxOFFnRDQvcmlKcVJFQmZlYjM2VEswNEVX?=
 =?utf-8?B?U05vTmxNYWcyejYyKzJBQzZ0WUdYRnJFWGgvNDljN08wTlgrQ1FSc3B0WDBE?=
 =?utf-8?B?MC9GMUswbEE4Q3BiWHQzOXI5S3owRVhnOThtZEZ4eWhyLy9DeS9Rc1l5SFk1?=
 =?utf-8?B?Rlh6SXJkVTkxcnRSbGxDZytYdjVWL0hZL0pEVHBkNWRXaXo1eWNGYzVzdG9h?=
 =?utf-8?B?ZUtSZEpyT0NINFM3cjI4YXpDdGMyL0dnVEtxVm9DUDlOdHlmdUNEc3lVbmx2?=
 =?utf-8?B?ZW5kWE5vMjBCUFR5RlFUREUzcWE0aURQTXdZR1ZsQTdKQXZydVdhYWZCT0ZK?=
 =?utf-8?B?MElwd2FKS3V2OTJzRU9vRW9RNmdySnUzUzVHdkpHdlFUUjVRcWsvUVk3SmEy?=
 =?utf-8?B?Q1hFU2ExQVNPdzlCZnhwN1lmQitRUjVRbFhwZ2R1SGd3Nzk2QTdPTzVwNmRN?=
 =?utf-8?B?MFAyL3FMdk9zbGVBU1gvUHViZlluOTZMU2xWQm5GSC9RYzJ3bnNxMENmR3l4?=
 =?utf-8?B?STFMK2lQME1kVkNPZ0RuM2cyUjdJM3hpeTV5NjZUeE9wUVlkS1h6MWV0TEM5?=
 =?utf-8?B?OHVDRmxZQ3grWGt6NEtuWWZUZE9mQ2o4VmxWUHNzejBLeGdMWkUzTUsrYmhE?=
 =?utf-8?B?MHl0YnNaKytVamhBWWZpazFwSFNKVitJZWFtc09qaThZUmkyOUZkbjNLWjZP?=
 =?utf-8?B?TnlHdTlITG45Z0t0bFFEMUNlQ1N1MWo1RExSSXRleWJCNWdxcUVyS3lYaHVh?=
 =?utf-8?B?cHhDem1NVVErSEF2REZhczlvaUFRaHlEbFM5UklocW9uRnYvVEY1dVdKNkNF?=
 =?utf-8?B?UGg5YWxuUy9oRzhYWkFhaGJ4WW5BQ1VBYW1zSndIeFRsK0Z4R05ZelRBY1o1?=
 =?utf-8?B?UjBjYW5BODFrdHdZQXhSVTl6MkZqUGNGcnJCSFRDdWJQZG5FMjMzQnlSeE9u?=
 =?utf-8?B?RURPWS9ESEZsSnV6cEt4NDJQdmhUWHJEWVVndTAwcm02VzNaN0N6TnY0ejJp?=
 =?utf-8?B?ZnE1YjI4a1J3aXdHTkN2RTg2alVwVi9paHEvSkZBOXRBVzZqcU10QkJyTVkr?=
 =?utf-8?B?ZkdIVWxDaE5zTXg0Vm42ajlvNUZEN1FxeklYSjdyTjVENFA4VzQweG5TbGp3?=
 =?utf-8?B?Rmh4TE43S2tGQ3d4SWE0cHM0RHpsaUJob3A3c2FSRzNzYktCZGtVeDRVSnp6?=
 =?utf-8?B?S3NOaVlHbUU2Rld3Vkk2TkJoeXNKWWJBTjlyM1E2NktrQXR2Y2wvS2l0NFo4?=
 =?utf-8?B?c3dVN0d3RDJEaWg1R3lFTDM0SmYvREN0dDBnalNwZzFENHpkM3R6WjB6OCth?=
 =?utf-8?B?TTZRZWprRlZianBJc1ZPVnhIcFV1R29KOUoyMXRJVnZGbnEwOFRIY2lpVWls?=
 =?utf-8?B?dEJtMkc3RjVvSThkRFJMYktyN0x4UDJOTitVWFlvNDJwR1FhOEltNlpVdUZw?=
 =?utf-8?B?Wk42ZWJ4MEpnUTY5YkIvRzNiZGsvKzdjYnB2N3RmUlY1SnRiVVR0bFpJYU9C?=
 =?utf-8?B?T2hoaXgwN1N2R1krd0xDOW1uRnBtWk1VWkNWMEcvRzMxdktEOVpISUwyTFpM?=
 =?utf-8?B?cVZFRXFHejMzT2E0K3llTEZXbTgzR25ldm1WUVdaaStnZEt0NUFtcEJ5ZXBM?=
 =?utf-8?B?aS81NTJBcCtHRTRQdkhvNmdmbjVnTG5mVDVVVjd6MFZ6UTZpTjRoVlRtZkt5?=
 =?utf-8?B?OTBVVlNuVjRFSzFIZ1kxQW15dzMvWUFkK21kZ3U4S2xDZXQ3VGNxWlBhSWp6?=
 =?utf-8?B?RXI2QVF6cndTZVBJWThnL1AxTmxsZGxBQTJDay9jNEZHYWllbXBkT1EyUVAr?=
 =?utf-8?B?YmNSbnA1dWFYZXYwKzBDdTZETTRBN2JRUmFnTW5NWGJuTW5WY2l4U3IwZE81?=
 =?utf-8?Q?Iv55+SfHwG6ZfLPaSTyjMg4ON5cF5a/dAG2sV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab73d636-db97-4d28-dc55-08df1316d733
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:48:13.3931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieb8Nri+oIZelrvWRSz73fF4Kfy2Tc72RRuwJ2FnxxR1ayJs7o6LBKXqk/5bntcXRe3b3ylpL5ZzfVOZs4Q4WTXKFD6SILoIqtQBTvzNs1SMOaooNTHK+gcNRv6CuQ5v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

On pre-i.MX95 platforms, the gasket provides LSB-aligned RAW data to
the ISI, so CHNL_IMG_CTRL_FORMAT_RAW16 works as a passthrough that
produces V4L2-compatible LSB-aligned output. Starting with i.MX95,
the gasket is replaced by the CSI formatter which always provides
MSB-aligned RAW data, so the RAW16 workaround produces MSB-aligned
output that no longer matches V4L2 RAW formats.

The i.MX952 ISI introduces CHNL_CTRL_RAW_OUT_LSB_ALIGN to address
this. Enable it so the driver produces correct LSB-aligned RAW10/12/14
output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Use CHNL_IMG_CTRL_FORMAT_MASK instead of the removed per-platform format_mask (Laurent)
- Derive raw_out_lsb from the model field instead of dedicated platform data (Laurent)
- Clarify the CHNL_IMG_CTRL_FORMAT_RAW14 comment: the format is
  documented on i.MX{8ULP,91,93,95,952} but only used on i.MX952
- Update the mxc_isi_channel_set_output_format() comment wording
- Rewrite commit message to explain why the RAW16 workaround fails on i.MX95+ (Laurent)
- Add Reviewed-by tag from Frank
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 50 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  4 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 ++++++++---------
 3 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 6aa760ce3605..0832b4a110ed 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -303,11 +303,22 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
 	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
 }
 
+/*
+ * Starting with i.MX952, the ISI can output RAW10/12/14 formats with LSB
+ * alignment, matching the V4L2 requirement. Older platforms lack this
+ * capability and need the RAW16 workaround.
+ */
+static bool isi_raw_out_lsb(const struct mxc_isi_plat_data *pdata)
+{
+	return pdata->model == MXC_ISI_IMX952;
+}
+
 static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 					enum mxc_isi_input_id input,
 					unsigned int vc,
 					bool bypass)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 
 	mutex_lock(&pipe->lock);
@@ -357,6 +368,20 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
 	}
 
+	if (isi_raw_out_lsb(pdata)) {
+		/*
+		 * Enable RAW10/12/14 output LSB alignment to match the
+		 * V4L2 requirement that RAW formats are LSB-aligned.
+		 */
+		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
+
+		/*
+		 * Align the data selection from pixel link to MSB to
+		 * avoid data shift since the data from PL is MSB.
+		 */
+		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
+	}
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
@@ -406,10 +431,19 @@ void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
 		      CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
 }
 
+static bool isi_out_raw(u32 format)
+{
+	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
+}
+
 void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
+	u32 fmt;
 	u32 val;
 
 	/* set outbuf format */
@@ -417,7 +451,21 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
 	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
-	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
+
+	/*
+	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
+	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
+	 * respectively, to align the bits to the left and pad with zeros in
+	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
+	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * Starting with i.MX952, the ISI supports RAW10/12/14 LSB output
+	 * alignment, so skip the above workaround.
+	 */
+	fmt = !isi_raw_out_lsb(pdata) && isi_out_raw(info->isi_out_format) ?
+	      CHNL_IMG_CTRL_FORMAT_RAW16 :
+	      info->isi_out_format;
+
+	val |= CHNL_IMG_CTRL_FORMAT(fmt);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
 	/* line pitch */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 5d166d670ae0..c11ee8061852 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,6 +20,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
+#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} only */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
@@ -89,6 +91,8 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952}, used on i.MX952 only */
+
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index f45c2aae59ce..9a6a8302774c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -221,11 +221,11 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	/*
 	 * RAW formats
 	 *
-	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
-	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
-	 * respectively, to align the bits to the left and pad with zeros in
-	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
-	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * The format entries use the native RAW10/12/14 ISI format codes.
+	 * On platforms without hardware LSB alignment, the driver
+	 * substitutes RAW16 at runtime in
+	 * mxc_isi_channel_set_output_format() to avoid the left shift
+	 * that the ISI applies to RAW10/12/14 output.
 	 */
 	{
 		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
@@ -240,7 +240,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -249,7 +249,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
 		.fourcc		= V4L2_PIX_FMT_Y12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -258,7 +258,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
 		.fourcc		= V4L2_PIX_FMT_Y14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -312,7 +312,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -321,7 +321,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -330,7 +330,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -339,7 +339,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -348,7 +348,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -357,7 +357,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -366,7 +366,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -375,7 +375,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -384,7 +384,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SBGGR14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -393,7 +393,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGBRG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -402,7 +402,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGRBG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -411,7 +411,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SRGGB14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

