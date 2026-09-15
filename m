Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DED4390CAA;
	Tue, 15 Sep 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469278; cv=fail; b=qgFYpmsnQB9/8iSkQ5/GdJk14xjBwnLrqDwjX2L0oewgG4lIrOcEPkSpSZmhr9Ls/0IfggNf5jRwGx9V4KVJd+epMcFNy2CAeXjBSErsrCM4J0mrZv1cgw1mUwmbvjrsZmfkHlCbm+9N+EEJggvd46XjMDPGk11AN4xaV5XqCko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469278; c=relaxed/simple;
	bh=Vwku5s8iXhBh2LdzKn5ZV7aZeZOKmCgSiu/SxInwxiQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BIAQHzFnTPJys63LBV6VPEjordv2BR97eINwbV5sjKY1nHnPNWzZx3YFlQDFZo4cGcIq9VD2F48dFnDpCujBz6hMZhQE9Fpeq10+xRLwIuCbsUjaBb1j5K8+78QnR3beJOrYMetFT2I3S2z2aVdY6ZOzttNHky/4JBQhNeJ3Kr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cyrif37O; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cyrif37O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIsHLycO+qaynoJttYBuWlf5K9yrEDS1WH3+TUREPyT6DZeXgWY2l65rIG2SAgMVekMTuJe3Tj59sR1Ov8q9/j9FjshKdth8gaYkLk3Thin5925IySHPXOwvF163Q7pUGBEYn2VVhf4Vfts9rKP0KJbmtHtKGRfyVYIQfQUuWiySWI2hooQj481CU06SRxv/xXnqnyd5JIWolqx/hFAd4w2UimIkJKUOXUOmiz6L9Yq+zHvyL79wGNLJ2t1O6/FPXUFPCFf4LqQrNRKeyXW7012oUPKDYLah6ROPTGIxjgm7QAqAL1j4SaGdX+8o3clmr4KkDVvcnIdLwHIVVz43cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVXUisvkzQQQ1dzBKuAYSXeQEB+G7Ks/MebQvHmsvQQ=;
 b=SOFg8oTeZGTILKme7zjNF386nvnKYvYw7jQh2MJzwbCReJZFHuOByteyeV/MqHRSFeMHYzYRHX9N2lOhJn5QilbK0lxjvkhZHR+o9954vu8kG6fH8T41E2k6Le+uq0DMCi85G/SZABOwH174xHSo+/kwnMkwSDcSJ8efXt2yULt5Dsmu5jjJD9BhnVDasFSc5aV0uXroYK6D315q8vVRYJxxyaKSFq54RundS1TdmuSHnwaRIKmi5XUSwh2iOokbcIwJA7O/OFr8rjGMZQObmakjLqO/bhtvdVQmiLDDtolc+OTiG8TYK7weA6RlKwTWfOLWliojvFZjb59YYe2sFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVXUisvkzQQQ1dzBKuAYSXeQEB+G7Ks/MebQvHmsvQQ=;
 b=Cyrif37OGjKwUZlDCaRTR3nymCjLK65IxGjjZ0pjRv5MDsFt2DI1REDOddler6c4EWOPGQFh8pBnxzBlb6NpVKjTJxPLfYxK20Xm9YhOCtff6v/Z81t3p5Y/xaF3yoCkEn5Tn0+j8QSYVBMCV7A6C6Fo189pJjRtpmCBxMMeKZJ9jBgJQib9C48XyQGEPf280CBomF0Gr8s9U3iPfgsQdIMMmBDOFDhUE33CqXWT+IdyxQUxfNhBg3BdZ2Bvh7wovZdeDd+F0x/PV9fwnpqWna6mrKAPb1aE6pWktPaPbwK8VwtG0doEC+r0OYeUBCtyMxIrafKeA3FXb0aGvPhcCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:47:51 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:47:51 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 15 Sep 2026 18:51:49 +0800
Subject: [PATCH v3 2/5] media: imx8-isi: Extend output format mask to 7
 bits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-isi_imx952-v3-2-3d8ff1363dda@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469512; l=1449;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Vwku5s8iXhBh2LdzKn5ZV7aZeZOKmCgSiu/SxInwxiQ=;
 b=iuj473q2PPOoRK7SXu3vkjc0NFZi2MKpQVU1hfyQgI5/2XHwLT+KjPcMvpnSwsorwoP0/21fu
 0fofLF2kTAhAcW4LZpmgWP06jG6uEloNTlSC3Npg4X29gnYesWpFi/0
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 691ee5aa-9e06-4987-b92a-08df1316ca28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|3023799007|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7ygGfbUGups2zV4xXDAITyjTrEwJXocJ+xMKgVT83aSqD/el7fMmZIsZcOZw4iTHdrIqZRqs5b3miYoRyXgojOxd87KXiq8A7EqhKHLWKqndCrl4NZynCUnbvn2F81b6Co3ikq9VavrfqyFATHWHW9uFKb8pDE7e5OU0HE/FI4aEHTmfJkOb4OwlwfsbrgONp1YfZsCdWdTdzIeO4rPLf+nPGIQqgBaQUTDIBJ4BEqeKxKqtv38ntJO9pC+jirkpGE/BnYlpKYZe26Bc7b/joZZ263VxeETs3F+nbTSzftjjSGWpQFRTAjEpLoaexZh1CRKR3KTOKLZ4UYWo/oco+QJ23ugJDvWhunT9ko3ivzQ3d1p58RFWr24LEsTUZ4SBvsVm4aG1/dW7n2TruFQEPOEzDZymgNq3il0jB7pL4wsrwZ+NaGkA9F7gkWDStzhMvIN+35VxN8wknLk7hqCZw8OuN3+Y1dubn8xL3X6ImX5yJz3ZzVECYFIddv02zcuCdrLCe6rEeSic6flg/KURDQKoLZx8CDDrpzmIDh6pYyTFF/LYDm1cOnvU0ysw7ZnkC+2eNqbcp43kjbxPxsJyt3zKXFfBE2wt9yv5LF6WAPK29ZTAmBwn2H5KM58zGmGBV25fifR2kUHPzNoI20EKbVJbuqZC3qQPjH31e9XA+1JNhQzYcxSwJ5mplCcr49cqClgI4NUx2C2+Zb2QYxDkvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(3023799007)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bit2WTM4eWRwcWw4TmczdjJVN291ZTFwTVViNytHdlpCZDVqcXJuZmZ1VWVJ?=
 =?utf-8?B?NVpKT1Z5KzlQSzBmYk95WkNWcFdaRTRHaVE3bGhycVFiRmMyV051VG0xeWxi?=
 =?utf-8?B?d1BnVG5UNldhQ1NmUzFhZzQ0ZGh2dXlIbGZnaEJxRUhIUmkzRDFTR2RScmhz?=
 =?utf-8?B?YWZuZ1VUcXJJczJxcGZ2VDgvYUpKbzBNc0hhL2RUMDBRaStCaElVYVg2THhM?=
 =?utf-8?B?MnF6NEFDUmlMa2NPK2VheGRDcEJpU2dEY0psNm8wcisyVGlOTUQrRlQ2RE9z?=
 =?utf-8?B?RGpmTmVzZUtCazdOSS90MEJpQUgwRS81Z0MvQUFxQkpwemtBMU9xYWxFcElk?=
 =?utf-8?B?T05UVmxYRzZYZ3BicEtYVEphZWJOUU1ZMUwvTHhhVFdzWVh2VUNRVUZmTEN4?=
 =?utf-8?B?VlpvbFhWUHBpdGJuOWcrVjFXc3Y1dGpVRUhRQ29rNlpZUWVsU2tuUGJFVk5j?=
 =?utf-8?B?ZnZRZytuRUtVdEVmZlA3Q1JtckNjUklWQ3I1NmFOa3MweFNOejZYSnRXWU4z?=
 =?utf-8?B?dE91Y05GNXZDS25GRGhkcGhZMkNjOUhWYWlwV0JQQ3JYWjFwS3NSS0cyRFNy?=
 =?utf-8?B?MGNMZkFqTkVYTUtsNFJ3a1RVVGpyZm1vOXZkOWQzWDE0Y2wxaU1tZTBCV2lD?=
 =?utf-8?B?ZTQ1Tm1nNURiaEV2UEhkTDhLV3VFcDU0YmVrQXpZbVlWWU1NSzI3aEVyOG1m?=
 =?utf-8?B?ZWtmalVMOTROa1NOWXd1dEJFMDdHMFdKaXlPd3NRL3o0T2xSMWU4ODRuTGww?=
 =?utf-8?B?Z1RNUElHbkpXOUdBa0hMZ1prUTJFZ1dnbHg5RVVYOWlwa3lFNkk3aThWc0p3?=
 =?utf-8?B?dG96TFRyWS81VThBYjA0YlBpUWVHSWhRM1JnT3hYZXhEcEQxQ2hLQWZHc1BE?=
 =?utf-8?B?L1k2K25sWUNEL0tSbWdVbzF2QzBnL2F1ZG5zanhVaE4zWDdWMHVrSjdtZllU?=
 =?utf-8?B?aEZ4UFBqbW1hZ2l3RFVNS0pHdHNYdXhIUlFlZVZYLzZkcjdWTjc0ajVsR09B?=
 =?utf-8?B?RVovTUJjN0ZEcGJMaFdENDhiUk0rV2pKcm1FNDVPQ2hYdHNIOG8zcmFsRWM2?=
 =?utf-8?B?RHpvYzZyYnluN2podHZZTjBoTnprN2tpdzd1cVMvMnBlVUdkWXZlbTFzUVRp?=
 =?utf-8?B?cjlLeDh1bnlHM3FkTXRjK0FJNVd2NjVtYTBWT0FtRi9oZnZrMThJcXZ1UHpF?=
 =?utf-8?B?aE41cVdlWE9lNjg3SjAzNkZKUHorWER2eXI2Q2dzYllTWlBpcmxFTXQ5ZSt4?=
 =?utf-8?B?b1k1ZEFBT2NYMitOdU9FSkNuTUpSYjRSd3Yrd2JiRXBBRktTQzJlVVR5LzBF?=
 =?utf-8?B?c01Lek50eVJkb1NidVNKMDBENVc3bTB2alFxWVk4bDZHY1FqdzVJUWxFZVpa?=
 =?utf-8?B?WGdGV2NiWU1jUWxNUEpia3MzUnU0M016U0lYK0oxN2EvdkJmR0s1REUyZW9u?=
 =?utf-8?B?ZDc0cVpFeGFEWldZeVIvZWFGeVZJQ0drdmxWaDE4a3cyODhIV1lOcTRjK0Rv?=
 =?utf-8?B?dE9EMlhpLzNGM3NqZzVIQ2hySGc0YVFMNDh6UTNPeHRoL1hXcjZoRndZQzcr?=
 =?utf-8?B?NHJIT1lnUnBFeE51Q1N6YS8xZHlrcHR3eGVqdUFQSTVTSHBLQmZyMXA5SXhV?=
 =?utf-8?B?aXZDbHMxTnVubmwvNzc5Wll1alpqY1UyVWhVM200NmxadnV3bE5DWkxFSkVm?=
 =?utf-8?B?WmR6cEMxbHdRenQ0NTlZQjljWTZkc1drRlNPWWVSNDZGQUJ2MjBFQjBLNWRm?=
 =?utf-8?B?ZFdiaTI4VzlpQnJzb2V3cC9oUGVwYzZlYWZISVZJMWtPN3dFU2R1UHJUWjZa?=
 =?utf-8?B?WlpuUWI4bWVkK0c4dEI1UXhGU1YwOVh1aWdMejZ6MHo3Nk02TDAxeGdEdXln?=
 =?utf-8?B?RE1tQmk0eGVzcSs5WTRxcjdwN040WEJDdkovK3dPQTRWR29kWTI1KzFSZjRE?=
 =?utf-8?B?cTdVcHd2cXBWL3dhY1pXTnh3VUR3V0hRMG0rSjlheFBpVXBuM05OangwWExr?=
 =?utf-8?B?bXI5RTRtamZYSUdEMS9XWTNrTnpTempVcEV3dmM0UHVQNXdOemJrM3FXZ1dt?=
 =?utf-8?B?bGtKRDAwSjNYYnpZZnpyK3FQYTdkdzV4djBGSnNybG5Xc2FGVTY0ZmtXa0xX?=
 =?utf-8?B?amhXNGJRYXhyeFFBRnU3dlNvQXV6NTN6VTNMdGZZUWZaUktHTW13N2lDS1Zq?=
 =?utf-8?B?bW1jOGlKajliRFdvSFd0QXZDK1RJS1ZLelAvUkZCM0RrNGRrdGJ3T1ErUk9C?=
 =?utf-8?B?N2IwYVdGOFIxUG9RV3RxVVcvcW9icS9xdFFQRUNNK1BLTHY0YTMwNEYvL2ZE?=
 =?utf-8?B?ZFNBTW5iYVpKbG5RaWhuYlZkRDNOTWpFSmx2N1MrNkpDNmZ1Q3lyV25vV2lK?=
 =?utf-8?Q?oPAW+F3qlftoam/CtVmmQqfMTDrs8Y0yGVdJm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691ee5aa-9e06-4987-b92a-08df1316ca28
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:47:51.5140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxi2O2+pCjOhYaj7ZszbH/9fFAstUO62+dpapC7stiXKC/LILCWUbxrTmfPP9m6ArRmyi+J1g9rLgxl07Lic4seXJAhj/Ed5UA820hZEBTEGxJ1tftoNiElQrquhzIbm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

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

