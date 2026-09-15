Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1213CE0BB;
	Tue, 15 Sep 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469269; cv=fail; b=RHE7F5Hp1cZAyCa5pT3OOyZAZlkNabwP4OIqMmOn5kIC9nEfV8YZpqV/5gz5/A6BeaJjYhTY9jR/kEcg0sEYihlAC0jyLsqc7MDAI6k+zq08T+G5yKGHZFzt7OnjEqyYMrLpDWxU3VIl7tmtLdEVmFzfEq89ZaT3pqtEoo2hO24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469269; c=relaxed/simple;
	bh=09zZuqgXe2OIdPfWk8ai6X1WFFxNQ1Ab29TGRIivYYU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LvrnhpGG91RAbug6GFN/RNW9r7N24n+mLzziVWBbuGoSWCHGM0xVLttbQD3AcqCX5jIENcLqMGOmpkMoQ0OcV4UUYAvo/+tIRbJ1hQLE+jwGysqC9Xm/r5Kj+GRoKZpcKo0JqZNt5vf0ufQAccek0zIobNY8G/eQUAVVAU6PFkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LX9REdAq; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LX9REdAq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/mEZl60nETQYmL4HNRNDHcWyjyy4DDOLwk/d0tYcQIgFdAhTfOjpMHphus5jqBbE+pkVCzTcsKg65yNuQsZw2r4y+36Y3GoS2Yi3jEe7yzUPwck+X9v+Sq/nhlzM5+R7PkcwTl/BG4CgwPs3eK6se/I16kHQ+GAb+ZysWPP3LeQlooAclziD6i9tYgE4wfGYdHSWT8+l635QY83jqj8FwJPhVaw8+n3INrlpzVMKXy9YQiyPfcTAv3Xjd5kTK02/DrvN2n7kOAHIxjAtXhYsL5SCSAjaX0MjtbXq5vR/xznz9G84jzylBzUy+PR6QTNSyzwoW+9U/BfjJQ+fMQ8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=;
 b=rtLY5m0km+AeoCG8MFXt1eg1poROcPbBpD5IFH6/160kFY+/NDAGA7UMcY2oamVbSOV31iegFLDKdl76fH564btzjV/P7sKgYVtHOfFcrsuPDQDYBUOs1lh+on3WHDRmDDYf3ZETh0Aca9/v2zqE6f4e8i+5A7MpoN3s3H8boVfvR9Oy6kGhgzhv6f8dk1rGf5pCldF1UUVKwPGK5vsxDw2KQTDKsJxokeLiPJOMMJ6ehQbTqyAmRHk83AvHjEvDgFUpGKNJF8/OjDDP75IO+QnwHr7DbzGI72TSIuaqHz4/GfXAa9WTaCH1C3ZfdM+WsOWj6L3Iw8frsHojmhBCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=;
 b=LX9REdAqRmUpZmyZjoxzqa6wDKfSRK0EhcKpUWMkiiRFGEhCZ5C//bOrtBcad3zJhqr+2eyYsgjHL+8OgCKE7BH8Ae8bgPutLVIGQlstiJWsP6e4hsAhAd811MEDaq0Xh7iHhMQTUepZjj/rDrQ7A+7xGQe360bXZNwiCEti8d5jawB06fppIqdUz3CO7LMXWF2uTWXX5ZwXf2gsDWbPoQkSJTi2mWOqBkyiX+roA8hzPSHqh7mo4ab7Hll4kumYl1MFjqkkILmGbzCfWfG24tLSZeFyttpneObDI+Nug2d49Oc83UAMEFmSf6Na6or8Y0ZeuRYmNpfCUSPi4iMGKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:47:44 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:47:44 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 15 Sep 2026 18:51:48 +0800
Subject: [PATCH v3 1/5] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-isi_imx952-v3-1-3d8ff1363dda@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469512; l=1898;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=09zZuqgXe2OIdPfWk8ai6X1WFFxNQ1Ab29TGRIivYYU=;
 b=O7pWvg/0nsZKvEjx93L/ewMuo32c4uNiknvLBZHXAq4iS1V/eXje59YxdGEeTthPD6BaZeucy
 RqtkN74zsvnCPRJXG29T35FBZqBFdCZAuGeGcwEZ37dndv9HscgissN
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: c2077b21-a8ee-4967-35b2-08df1316c5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	L65mUVs2YgBRFzzCGEKfyMO3tUoCBgoGKAtKIp0vSdPLUed3R67UecZBYGq2MkFK8S8Nlg86fDF6gdTDKoPFR71vUTutn9bODXnBhwGuxEER1qc6VCCcik35cPJXw1yoakZfFUcalucoN2RutoDcY8YOKJYw71S9fcCdt2S2LZVFyuvi2dMTH7Td9DWA0HtmWssGrvCZy8FPzVPrBrQKgtzCj/BbWdfVYENHoKN3wtRe7jcFgNZckO0AB3XVMRLK3NgR+E8Z9x8sI/5irqVpDAvaN/6iprWxjUb15E5Nn9LMeKXPkgbNJHPUzxCtBR7iiIzHzoPHiKbaj4gH6jnuEyxt1HFaB/cYLn4olBE3r9xVugR/HPukfsgEvlXjdUCBsbBNa2lHsm+VWS36LHdL6j0JiY5ytS1i0tG6Q0siQs+vesFgtE25Eyr3IvIejCIlWgD9rAVhBnRzp3+HIRP/Flr0uBN2pczIvQwv394AnMPLJhUnH+CKWjrj+7ArMGsh9VjJAt+YgY1oalNxOtSp40SiKFCoz9KxORF9UpqDvUE0vPNPr+tryjQC9SSLpJL1TNWLBmeLbJ+Ya502jro8KNrLXDkklaPkTqUCNyKs0ED7MARbVoPN+kLHBLbAXrx9lVhzToj39QUvDTk05TdAEYPV6O4Qhk00LdmrXKrQ0wlpKDcd6KJUJ35iIzjH+EiObBVNDuImBKEcU6WQ35V/8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEdMQzRsa05lbmt3a0IxbU4wRGRTSlNjb1dqa2xsV1dNR3p1dTNIOWw4SmFJ?=
 =?utf-8?B?M1ZkM2ppUWxPRmUvVld6RzNpa3RQZFFndXlYNDdZZGR0QStLNHArZUpGUWkx?=
 =?utf-8?B?d3RBYk5sa01JNWZpa01sY2I0SFhuOUlraFBOYUhoSUdzY2hhNGxVdGd5TVJM?=
 =?utf-8?B?Mmg5MmR2L2JyUCt2QU1jYllhaFArSlVjQnRCSmJQcjNrbGYxR2tSemVzWmN4?=
 =?utf-8?B?ZUNjTnc5K1pZbmxtNHlRcnltMTBqazhXS2lCVDFJRzlUSTA3SVh2S3RWem9E?=
 =?utf-8?B?SU5SSWlZUWJKWjRmeGlLMW5QdWxOMWhqSGM0ZlhkSVFDU2VhOFBRenFnRVRr?=
 =?utf-8?B?WEovM1ArQ2NWRGtLRldyZUd2UGJ0QXo0UFBnemFJbTJXcCt5dWlKMmRDSUZP?=
 =?utf-8?B?YXNJOXBhTVdLWGI4Ujc1L1pKWGkxa2ZQZ2swdnZoQndLQWlBbDlLTi9ZdWE5?=
 =?utf-8?B?SnFpb3BuODIwRWlsQWJYWEZPdkhaSHQ2S090bUVFZ3pNZWhYMHpnTjNwMG9C?=
 =?utf-8?B?R3ZCWlFpOUdicU9Hc0NWVDlYOFFwTzJRZmhyY3BZZWhLWnVUYzVabkNpZXR3?=
 =?utf-8?B?U3hIVnBkbWVyL3ZvcFh4UG1ZcXl0UXN4M2xMYXAvMFh5b0JTOUV6ZGF2WHRZ?=
 =?utf-8?B?TnV3OGdSTEtmem5hZ3lsZG5ZeSs4Q01zWlNGUWUzdzhyQWEyc2VCbXNJNlpI?=
 =?utf-8?B?bFlNeUZGWjREdDNPVnlLc0FSVUhMZlpLM1FuL29IVXlsM040M2VhenY5bmZM?=
 =?utf-8?B?b3hleG5EaVN3RjNnVVh6Und6c3BZL3dJSE43T1NCMzlpR0VHT2pzSkloUDdR?=
 =?utf-8?B?aUV2MDJaVGlsb2oxUXM2dkpXVTFMU29zeHo4MytlbTI3S20veVg2ck92NDVm?=
 =?utf-8?B?NXUrV09oZWRqQnVhS0Y4K09iK2kyQVpuS2xqdTdMU0NGTCtDQUlxUzkxN3Bw?=
 =?utf-8?B?ZFJmLy9SRHg4bTE2QVExdWlUODZHTWRrYXVzVU01RE5iNjlVUThuaHZEZkpq?=
 =?utf-8?B?aFUvSkcxc3RhMEF1allFZ0x0TENtVHlqZUthWlpkTmRyblYrd3VuUjhMcTVM?=
 =?utf-8?B?aEtXVWRqbTd1NU9NWXZmdVIwSEZLS1BqOTZVSSt3U2QxZk9rUitha0d1WEFP?=
 =?utf-8?B?dzNCNDJKVGtJamhQUlAwR3pyREZPMWJFWHI2VmZoU1FLTERKYm1VTmxjMy9s?=
 =?utf-8?B?akhnWUR6UnlhSCtxODU1T0c3L0ZCVnZnMzNBUVNCQVBLQXo5ck9ZbDczM1RW?=
 =?utf-8?B?ZGQ4c0dOTWw2UmI3YlhCUy9HMTZCcVhCajNvam41YSsyRklQTVVjYitTY0U1?=
 =?utf-8?B?R1FxbnVsTlIramppZXJvMGlUSDNGMFk4eUdIaW1HWkZKL1JMNEVCenl5TDEx?=
 =?utf-8?B?VWhUcXR4OFdXYktVWTNsV0hXRCtsZWxmN2plNi9NUjV5RXZ0VWpDQkN2Wk1T?=
 =?utf-8?B?dW9IcGw0SURxVUNXY0VlMjdDL1AzdlNyZnF0NFRqVFRXdnB1cUxxZGF3WnR1?=
 =?utf-8?B?bEFpZm5TYjVCZHRpdG9YWnJnTmI3UXBldzNpS1lEZU1iM0NZTkJiTkdtQTRk?=
 =?utf-8?B?b2JBWVZBRzZyd2h5dDI3MTZQQThyVWdtYmgzUnJaRlBUa0l4V2tUUnFuajEv?=
 =?utf-8?B?S0NiUERZYnZtS1lJdFk3TVh4elVWVGxpeUliY1RyZnljMzB4dTVPR05uRXVn?=
 =?utf-8?B?M2dVNjgyRUJpak5pblBDZlAwTmMyMXpiSDl2ZGs1eFk3d2wyanFQc3QycldZ?=
 =?utf-8?B?aDU5RlE3ejBsV1NOUTVIQzZqandDbENuUXV6czUzQkRSZ0Flcm1wNVpBK0kw?=
 =?utf-8?B?TTY3ZkJQOUQzUStsOXFjU1k0K0VSR0NvY0lmSnhqaGNhSEpLTWx3UnV0SXEz?=
 =?utf-8?B?UUJIcTl5dkpGVjI0Q0VxYW9PWjkyam1Va2liaFRFbFRUSWNpMk1QdTZ0bFdv?=
 =?utf-8?B?MWRKbU83dEEzUGFDZllJelRTNmo1cjRpZmM2RHNVL2Uya1o5ZGJsdVFVZ0dZ?=
 =?utf-8?B?bU1KWmcxRTVSUlNOSVdmYVVKZTB0cUhVcXdJRjZzRVNrdzRUWjZ1M2kvUW55?=
 =?utf-8?B?YVBtLzJZbmxHbnpOYzg1dXRpZGIzU2VBWEpvNDhIWnRkZWFWWTBKQnhzTTFQ?=
 =?utf-8?B?TlNTdXFIVFIvR0Y1dEVKeWJtSHhnNHJBYWFrZEo0UWxpSWlrdUNEbW5aaEkz?=
 =?utf-8?B?dHFQSjhpOTdVUlozUzJwME15MnkxY1dFZFBUaTV2S1RHY0R6RndsMTFTc0RF?=
 =?utf-8?B?Q1JmK2d0UGhHY0lBU0ZaaTNENVpjbWxFRk41OS9obTZ6R0ZxL0dFQkhxMnAy?=
 =?utf-8?B?SnE1TWVPRk5JZzdPa210ZXFaUnBLaEdCWkJJK1ZvTGdodE9ZZkUrZWVuNTlX?=
 =?utf-8?Q?rCilY9OwpMWxR9DcmrP6N0QMbNIHN9hlhmUJn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2077b21-a8ee-4967-35b2-08df1316c5ac
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:47:44.0165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+AbWkdVhD87TGX90VBnpdrJWseXWL6pmaTWNDf8nIIX/9GyrnOUSiXNTzE0wKMWdRGcLdah9VOhTgTTbberYfYIJ+2VoLfrYZJdMthtOl7saIvH5F+ogU/kmlUpRDhh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

Move mxc_imx95_data definition after mxc_imx93_data to match the
order defined in the of_match array.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by tag from Laurent

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..f2a8eb82fbfd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
-static const struct mxc_isi_plat_data mxc_imx95_data = {
-	.model			= MXC_ISI_IMX95,
-	.num_ports		= 4,
-	.num_channels		= 8,
-	.num_vc			= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= true,
-};
-
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
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

-- 
2.34.1

