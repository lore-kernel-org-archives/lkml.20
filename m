Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607654C226F;
	Tue, 29 Sep 2026 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671718; cv=fail; b=DsIPIkpcWhwyWNzC4r74+4eZebSjfjcKZTgp3sI/H2S+933URpYNjjZkqkuEVEkTM+b8KLXy6MWcolLehizbN2oKwGOTzBr9ZDWKqM3vyAzHz9S/MPoW6GIHQYnoHAf9hDFd0rcKK73mBYr2MsOXrZeaeivY6bog18oJPi0Jcno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671718; c=relaxed/simple;
	bh=Vwku5s8iXhBh2LdzKn5ZV7aZeZOKmCgSiu/SxInwxiQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mJtkoMt3za1nqfdLByoHNTBTKVMIpHVsGAb7ZYJtxv3u0xLC4LHkQr2kY5GZYb2CR59X654f5gL5eVmsq8sMsG7EcF0j9b0B8wiGlKq114EawdfdCQRsZhbg/GwLLpc9w1jcVIyNabrmZbcysndnLdgwda/QF1vn91l0TNB+2pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wpbOjxFw; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wpbOjxFw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvXFo9PN5C/EIOIQMLV0e3r+LZyTrGxlo5le9SfFQ1wa8or5OKqjhVex6rAOWNQXTfdqKDSKlrOgqDj20xa1oorMwwRwy+ee/PSwGUHeLdZnPYZTpaD3GWngc/p1xkavM5yMG3DOFPvJLC+sSsQxfeTCXBRvYSGQo1g95Lf+wNUVDDz1IYr60JtR8/pD2ol+mstPoZFxJe6rb0hIGL2H/QCiikc0QVd9KbICocSKLcqX+GBwmtH8NGqN/ZWOJajZBDX1dMW8lZKExvlyLWlOWHTU7xj+IBewErT0c8O9bIx16/jia7eLb24fSiNmNYTrgLuNLCTTWv78iRTk8fw50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVXUisvkzQQQ1dzBKuAYSXeQEB+G7Ks/MebQvHmsvQQ=;
 b=e3IV+RKI5hqzmE0xZyuHcqWAwuB/MAfOoblxtMFyO7wld+bWYQG1uV1nXopkJxzYHUaRtVJNS3DCWhyANtN3ZZl3tAtrz2xq9ixDuvj6TFD5jSX3mLirgrYEfxKNzmWEbr1IkWsFAhDMoLJn468Qy0O+0XtCZUqwpSt0IVsMN+PcrgaGM6+H6ETLO9p0aZgc3KtAC6dip1EfzTz3HeYObFOusujyMM5wVjEy2vSmoWt+edjlMbEEgBWgWZ4xBUVVDHsj3yl6l0up34qhNjNrp4DNB9CioaWVEC5gbVsI+fVqbHf1ekxDK6vtO4aCbWg209xDN7/tstfiJjRxVVOPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVXUisvkzQQQ1dzBKuAYSXeQEB+G7Ks/MebQvHmsvQQ=;
 b=wpbOjxFw8SO2ciZdXW2D8GGaowCVwFBzGdZQKXEqZjGkgwEQtiBTgv9wnvz2m5CeiooVw8tAGS+W2I55376PQW1Qa3bJb5LlpW/GJONXZvYHrdKGPIpZMr2gpzIa7eBGh+G9ouZIZ2ISr39nIHNGFz7U3xUQPMFg2FjagcaAzjT+vEC3GDzZN97q8n7JVOd9FS8yO+IwLXZDFjzQv1ttVdTO2WtH+3rg0ws/60fqaMup9NXNyJOUMss5+y1w678WwqRFyPQhAws/oQChPXzDA/+qyJDpR5abx09VNX7yf9Q1ZyaEjCRTMt2I10XVjOhBzPuOKJ9jrlyTCxKvlRhofA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by PAXPR04MB8336.eurprd04.prod.outlook.com (2603:10a6:102:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:18 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:18 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:23 +0800
Subject: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7
 bits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=1449;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Vwku5s8iXhBh2LdzKn5ZV7aZeZOKmCgSiu/SxInwxiQ=;
 b=8XMlAWHThg9vu1U5nC4Ef49myqmQI44KkocxHTOcni3/QoUV4/YZlry1DJwEZqk6LyhemVWue
 8P+j2RGhMcZAc8VY6X5d17nWJVxn9nFkpdgO+4seb8Hoq5gQbla6Lq/
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::15) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|PAXPR04MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: e3fe19f0-0525-483d-398e-08df1e066856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|23010399003|18002099003|22082099003|3023799007|921020|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	x05b/kqhZKSYCJlVpAQWlj9HzxBAzlFyRDepO1nJNgcc54Jd1jJ/mnx1cAno9au96FnxjucDMD+k3EiAVW4hFNDRmVauv8oawJC7KDhCKQLI4r7QxjqofcDJX8mDwBjQzNu3Kvbq+8nn5Mpbxz3+zj59W9hEDUb0uSGBr+47oueUINJWBiQLwqeFZJEbvzj/b1k95uIIKzMaxn+3SX8gBcpJl/ApHVoaj03ZKjikuxcmo6EbeSm6Y4rkAy1Gg0Gt/zeWG5akzUqQTCi23Ru6DM6BsYhk9soQKgRyWtRxREM+lwwW9O6fWyj/Tmc4Gkbe3nxWRbcN2Xw6ZbOcMbAr6W28VmpZJlDvwazMXMMUDgS9f5A9YpoDYlbz5jN7OENkv39mk6KsxztdctK/PvlGYeudcewNtUKD89gor3q0g1O3DgPlhO9memo3TCCRVl9gWZVpjAxdvt8sF7RcRW4+YKL07mCHkyfoFSBopkpYBdkQOKbR/Ud5DBHq07VuBIwSd9Z/6CO1JTmUTxoXMTAoUO6alZ93C1ShX3kf7IBmlnb+rGuaERmjx8qK2RqLMxEpwP/ZdNMHsOU/TFc+ZeGUvsvn/1HJg/oDiHbb5/sxwzcR0zIvoLRDTv62veqZ6A8f7HmEIvIa5ls4VBN+uMsdJjOBD81LyT4fJTRfh61V0xc6nF9bMvqcr0kGsCnGE+mib63OSKhO88RjXrgUDa3ZDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(921020)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGhmdndwQ25mK3AyMnFHclY1dXdDbkt0My80OG5wcVNtNmwxWWNrRnJvTzBM?=
 =?utf-8?B?emM5YkVHRWJEeWNLNkNBNWRma296MWlNZXFwUWdLc2lmZ010L3NoK3JvUk1i?=
 =?utf-8?B?K3JsYVhWNGwvemNlTGxHZWhoaUdjNzJ4NU9iWG1WYWJxVmdkeGRtWE1DaXZp?=
 =?utf-8?B?bGpMZkd3OUNHMGJSUDJDTkZZTmdtM0lvdk1IcFA3TEVkMEtwTERnVHJLa0dj?=
 =?utf-8?B?bWN2UDY2eTVzM2Q1bC9BQm5OUStuaTZOaWJXcTdFd0xETWRKU3JWMktENkpw?=
 =?utf-8?B?Q1Z2K1lNbE53aFBLTkRQYlJjZjRJY1NoM3MzRHZmVVVPUjIrZnNIem9udFdk?=
 =?utf-8?B?emxTbW9GaEVLcjFOdDdIeE1nSUR6TmN5VTRyMDI5WUthRHJTa0IvZndzNHU0?=
 =?utf-8?B?WitmdkxJbktCbFo5V3hKZXJ6dHRHMExHZVBxYkFVOG50VFJ4ODJMVHJpbU80?=
 =?utf-8?B?dVJzMlMvUlFzSGJMbTV6aTNCaHFCdGI2Y0tlenRlZnhDN0YxRC8waEFUdVAr?=
 =?utf-8?B?UlY0UjFVZHpVM0VidEdySWVkNHhUNUVnd3J1RzVSay8vOC9DblpiUGRkYWFp?=
 =?utf-8?B?eWlZWC80UW9BTTUrNm1mbGxOL2FhSFdjckZidXVmbWx3ZnNHV042K01WQlJk?=
 =?utf-8?B?Z3l5cmc0dGZockxrbWFHVHRGMWFBTVRGTGY0cXFJRlJOL2o4blBFaUQxdnBl?=
 =?utf-8?B?eTdqSWlNMTRnUDI4MUFOV29wR1JtUFN0YWRlQXlSbzdObFkrV1cxYmtnbkVu?=
 =?utf-8?B?NmxWRmpsQzJUNTF5dURzSjZmbGN5b0tVTDRrTm1rcWt6cDJ6UTBjUkpyU1FL?=
 =?utf-8?B?b2hKRXBBUmJKbHBVOFdRUHZMOVA4RlUycys4Q29pZVNHekcwRWVyZHNvTk9X?=
 =?utf-8?B?VnVxcE1aT1lJL2xPT05lQzhUSzFiM2NaY2EzbzgxWkk2WWFhZVRpQWdZczUv?=
 =?utf-8?B?eDZVMlo3Umgzem1nQWZ6RFdIRXdUck5KMkFzUG5mc0c4M3AxeHRRWkdOaytE?=
 =?utf-8?B?TFRmVnVON1UwdlR5bWRGbUVQVUh1alNYeXN6bk9LZExoRXBmbktJMmQ0a1U5?=
 =?utf-8?B?elo2d1V4OWhCQXkyU0xPU2V4YXdaT3oyS2RSUzhSWXJGNlhSTXZsWlBjL2VH?=
 =?utf-8?B?UVhuLzdGU0VFNHRicE02SzZ0NU5UME02Y2xscldJc0pITjhTaDRvTlZlZTM3?=
 =?utf-8?B?OTZqRUFZUmhuTEZ1UHJOY3JDMWJ3NXByWmlKbFlNODM2SXpFaDBFWmNOaHZj?=
 =?utf-8?B?K1lMd1JHeDNPNCtraWtESFF5STdJRFBPNmh1WnhjbkVLeEVrQ2xmeHI1TUVu?=
 =?utf-8?B?NXE2czdFenpPRkNRZ056dThoZnpXeXVDLys0NkVwTnZtbkxFRmt3ZXdYWEJJ?=
 =?utf-8?B?aFR4Y2NQZldLQUE2VUR6OXdEZE84SlR6TngvcUYvWjA3andQYnFiVFU1YUtQ?=
 =?utf-8?B?R2VGZzhVMG5YeHcxZ0dyalRZanZQNXVaRnhTNDViRVVzRUlqTktzZlZzZG95?=
 =?utf-8?B?N29UNVU5Rm41WUs0SkZOWUlrWC96MGhxa3NGTjFTMEtOak5PRXo1cU93TjY5?=
 =?utf-8?B?MFBoc1RrMlI5TzhSUDF6dmF2SEJZZ215TXdnN1R0UmN0ZkJlVVVESWlYVm9q?=
 =?utf-8?B?RGNGYnFsSDFGWWNnWXVKUzhxbFVrbENXQ0dnUldIczlBNHFLVm9IaDV1dFZE?=
 =?utf-8?B?dm9HdVMvdWpqa3JiUmJMSGV6LzZZQXZ3UjR0V2pGR0lRL243NHQxZTRDZXdK?=
 =?utf-8?B?eE13YXhnTTdidGhYTy9NenArR2t0N1VkOThkYUhMTU91SzNNcHBDNSt4dUNM?=
 =?utf-8?B?eWhOL0RrRGh1dGJ5L2JUK3VpZGRqbFlTNWc4NEdGSmZiZ244SVhYT1NmbFpq?=
 =?utf-8?B?NE1iY1ZFK0ZCSW5WL21DejAyb0ZmcEhWQ3ZDMjZTb0IzVmRkeWxzWDVYMm16?=
 =?utf-8?B?NHZ2ZDJsc1k2dVl6Vi9zQk1WVk51YldzWmdwSmlEUnNDWldhcFR4RVFVZGhJ?=
 =?utf-8?B?RHQ2NEtFTDM2Tk5qV3JBSUxRRzlVVkpaREJTYlpMVU1XVzBiUTVOaEt1T25r?=
 =?utf-8?B?MnVnVTU0ZFAxaWJRZ0lmMHBwTFcxdlFNdldnRkxDQ2VxMDVxZHRHTkpTdXFQ?=
 =?utf-8?B?MlBGTUZDSVlCLzA1bGhGZHkrMnhaN241bG81Ty91amhPUjF5bDM2RE1JQkxp?=
 =?utf-8?B?cXo1a2VTcC96ekt0TEZiOHdKMzU4ZHh1WTN3WFRnNmV0V2pPSFBGNy9qQW5Z?=
 =?utf-8?B?U1ZRSGc4dDUwWDByZ2dwQm5qZXowWXFQOGx2NmNNWnlDRWtQNXE1V2R6d0RZ?=
 =?utf-8?B?RCtPVVhrbVNLMFEyVlVjcnFOVXFQZ1dCUUk5Tjh5SUEyc0h3eXVIZS80Nmlj?=
 =?utf-8?Q?5yn7dYboz/l3dTIHsmwo5mCiP5L427+Fdn+Rf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fe19f0-0525-483d-398e-08df1e066856
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:18.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSCrrm7Qc5n1qhbrzNRpr12wCR+wczgzPquv+NCzsF1XUtYGZb3idNnb0lvTOWHo3BOoCbk7QogVCIWpB65T7Pa3NRzMo1CsW6WsLk4JdExyZo0rAku/DePH3y6vVyzb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8336

The ISI output format field width differs across SoC generations:
i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.

Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
bit 30 is unused on older platforms.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Use unconditional 7-bit mask instead of per-platform approach (Laurent)
- Drop Reviewed-by from Frank Li due to significant change

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index e795f4daf3ff..c704be882705 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -39,7 +39,7 @@
 /* Channel Image Control Register */
 #define CHNL_IMG_CTRL						0x0004
 #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
-#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
+#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(30, 24)
 #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
 #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
 #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
2.34.1

