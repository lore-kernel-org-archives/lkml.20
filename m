Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473953DAAAA;
	Fri, 16 Oct 2026 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181481; cv=fail; b=dJhZlCpSvYC6+1twGA9VT4s8suDyDazlc2dOLibIJgDgBWx0CDRz66FZ3ckEr6C0C6kJ20GdA0GBsECJ7cJNSdUzBF7/dQUPGLrxsVXb1YWuddoqDaevJIN0gsXuVgGCjgMKI92WBfR+2ia1DZ/gaOFfvnRva510L/66Zhu2ZXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181481; c=relaxed/simple;
	bh=eM+1U2OttwSfK/IZ6DpxmYMzpE3myS0KTu0bNtkjgww=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GyOmY6m1jNBhm8efmURtrSQc7+qPcSocbbsLwJaTAxPplGR97qAaevDMZXMUUwuY48Iu+H1dL1yp3KeWZpNIMJ8FPemhhBaIbouIHY/9wBHMIWXNFaqF44AYhf7C72iO4y8QKSnaCUDc1lKxlLJgEY+hLPMPzv7Gxm/3qo1HT/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GN+ROauH; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GN+ROauH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpP7QFmhBSaSH1c5hQ1qsi/JmhdIwLk+urZMa16V/Y3B7GMD4PTXh6JX7Efo1g9xyO0oQPRg+t5MsJPapeM5ez+TZbzZqvdvHHoWSsoi9GGuT8Sg7l9YI5V7XdQwOvMlv4DTIrpwWDE+z2BLLPDdJJzwp17hl85PUthp9KKQH9jCSZBAeD+AZUdBOOHGdFDjHMpdWW/4qvYkAr//5kwFCNFvfznn1Cs6jWjjiPp4cCgvUFLiwm210zQDNworK3CARO8SHExLLQ+lA+3CF/CzmG+iPqGeYYQ59KmT4xz4ExU5pffEqj6oCXpeiI6QcuYGGQW3Nxdoqpdwd8/hvGSo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZHRycthpCuEBv0Q4Jbyr2GkW+a96GEvpqPXcVrEfRs=;
 b=EvFOWeda3zvSmQxbH0a57qQPPhm5j3HJTHr21WHG7vtBQl6/F4x7Y6ZC16qkXXYGASaMb705B+2ehvKhlnDAU8EK8J8PHvAOziFvTPNDYv0xunlY+mCiipztYZwYPa7nT+A7clO28IL/fZPZQ/FWCqbjs0pUtsWtWZ7EnKd9X4S6jar3m4HkZzB76gSQjf8nJATxQ6sNuw5YPDaogSU/TR9YO2lyJXownUCJtNon7x5ld7SgeXPvb8GwFtk0VSitf3Cn8t3JCPDuBWViLyfMn0NNBNmVn6XNKhA54Mgl4GTANJYMGV4ocb/fd8GXjmvzzzimIgAhRnT/QnqDOy9LBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZHRycthpCuEBv0Q4Jbyr2GkW+a96GEvpqPXcVrEfRs=;
 b=GN+ROauHuky/QJrcW7Xg1eHNBNLthkTzxjbcRPtxQHgtq9Re+TOlR8L8l+BhsplRDCg387NTjST/5F1halAnEZpyFyRmkUc8iz6P5/mMOofnuFGhF+06hJ+EYWjHGdv25q+ftH3Q4O4wZzh63y/vvl6RwGFcvAjkXT60iROmdzFFENx3lSAhYt4TsXzSHV3fcjKE1ZEnt3O5KwKe05LkiTBSMXK1RiIKO9EYC5i3sPwaHMIfup+uR9GQJfi8fL5ZT1HSo4onGGS+Z317dFGJmSSw7B3qiQ7hzH9bRXAJdQ4PHzAOql1fhUUbJ6xzstNhhkCrpijx3UG80VIygg6SSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:07 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:45 -0400
Subject: [PATCH 02/14] ARM: dts: imx50-amazon-yoshi: remove undocument
 property min-frequency
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-2-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1002;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hJFdYvlX7yurHz62NsUgayGclSwE0M0gQjysmZkUXE0=;
 b=SFZWIeU67vVhARBnSv4SXuLssXmm/jGL6VumQLI+dZ9TjeRIqwJnN/dxCGjln1qoZfTRlS4Z1
 CJGrTYqnEIVDGuQK5o6DMvmvytVNhzfpBESNZPU/z9ucCAqgJj/ZpoF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:242::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da9a887-0ad8-451b-3e22-08df2bc19cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009221227099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	bh0FWdTl2sMGUoMwEV19wzW+h7UMJ9AybymkS3Nscci6ViGPEYqnAVrtsoR0kOOfmvxOyAg7eWgo7HiL3JHgYMrKQs00YB5uKJgnxpRgLjTI1soVsj+zS2oqc+dFVfqYmW8LTKoP18uuaASSdISkIXw4kLd8XQcA+klO2YW1xLhRTK9YyKkRlTOm6OkY6oSlH7hoLSB99aySJLR3tB9KgJUt2WRPwBDhWV/oydU+2FTIhKEd39SRbZSRv/g7+2r11h8+3xv3hcodH4KH3lcLttR+U/+Rl9UWsI9Tnrz1SqyzWpIQKgoIba+dlNE5VtbUIXSomjC+4fCXfBPZJktNoGRHWld2XOeFB2mYNjyR0q+0q1uJuLVQio8Agr7T92DLn9cWWdExNnRMaL7SHv7El62fREFMj/i0CFqTRtdzYNDvyaJjMysp1Bb7xFNXsxtLImJPL0xJRlVbZhnVVQkZxWV8eB0Nv35FfO6lXZznZYvoM7wFwyAGrVVqD/2ygmF5h/plyfpjmOxX18uNw+oyFze2wPW5JJQIi0Rs4dZcBZmaEoYMUUFhXBaB0PfZ5S4xU5/dFgQW9V8x4CvfT7fNZB3m07XA8JvMnTFs5FKgrmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009221227099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUlTYUVFS3lUcEJmM2Q3YnFUeldMMlJ5SEpvYzFBTm1KdnQ4eEVuUWlzK1lE?=
 =?utf-8?B?LzZ1YnJtVlVITXFLVlZHK1FtUzJVSlBqdlFXa0Rpa1VDa0dDMk9EOUhhWFpL?=
 =?utf-8?B?UERza0c3WVpRdHNNWkRiTXZGWjRTcWRqaTNXS2NOUGNtVm92M2NRbmNzZ3Rk?=
 =?utf-8?B?U01oK1kvb3MzQXpReUk2d1Y4Y0w1djRSbDRnR0xxWVV3V1NiejRITWNid3NM?=
 =?utf-8?B?cUdQM1dpbUs5QjAybjFQM3g1OU9vTTVZQTlidGNQekVzL2hWTXFYeHN4U2ZG?=
 =?utf-8?B?SlZaYnAyallaK09FUmIrK3g0dndUUmtuS3NaZWdtVHhOWFQ5UEU3THFnWDlI?=
 =?utf-8?B?Z2FkdDczc1lET24ydWIvbzNDUHg0SmNGVUl3QjhPQ0VOR1BJK3FLd3VhakJj?=
 =?utf-8?B?WnVpM1FFVXdOaHlOQXp6U0Q2ZGwxK2JHaTlNenZyMVNmQnJZRVRGbWtqbmox?=
 =?utf-8?B?dk93SFpYcVVWV0REWEN2NjZCSlpsTEkrbDFRanpRdkhPVXFLMDkydDBuWHZ6?=
 =?utf-8?B?N0dIeWJzb0pTTzNVMVZPUnVpcld1MzNUWW1lUkkrYWV2NEZFUXJxSDFHUFdO?=
 =?utf-8?B?T2ZzbTdGVmI5ZUxHMTgyaGhQMlJDMzB0NkgzOC8yWStRaGlieVhvKzltcEVO?=
 =?utf-8?B?Q2FiaG9PUDhSVEtPOUFTcWovZHRuOG95TmJhYjVpOHFadkRxTXl0VFF6R1lV?=
 =?utf-8?B?T2RnNWRndGNiaVlXRWdha21mMWlFZXNWUGZKbWhRUFRpSS91ZFJFdmYvZUVX?=
 =?utf-8?B?Y0JoL0VtTmtPNFp5eVcxRXpZa1hIWnJDZnJjNWQwdUhWRlV5QmpQUUszR09D?=
 =?utf-8?B?MjVDZk41MjFaTThINFgvT0NZRXcrTmZaSjZDdC9peGxjT0dSSHI4cjF1cUhD?=
 =?utf-8?B?RmRoM29jOThIWVpCU3d4cWg3OXJVU1VsYlRObC9RaFBUUVczRURIWkJhaTE3?=
 =?utf-8?B?dTB2VlY5SElYUEpmVFZGUC81RkptdFArWVlMQS9hVUJGZWJ2cmE3R3Q1K0FV?=
 =?utf-8?B?Z1UyN2JFQmVyMVM1Rm9LT2lCSFZTYVdER0FtV0RZNVpkbWh5eFZEUHRRYmpP?=
 =?utf-8?B?aDh1TExMVmVPUEJvUjE2c2Z5TjZCbDhEZzR4SWx2R3I0SmVidUR0V2hHbFVw?=
 =?utf-8?B?V1pYTzI1MENlQmZzWGR0clZIOW9iUFpBY2VacjBuWllmemptQm0wd0paMDF0?=
 =?utf-8?B?NSs3amFMV04zajI1QkFCS3M1aGV0blR2RC8zUGJVcndQVFVkZTdOV3ZFYmFW?=
 =?utf-8?B?V1FnYmdOdmQwSUFMTjJDMjVLVWEvaVZZcXA5R24waXB6Sms5ZkZpcElYY0Qw?=
 =?utf-8?B?djBrTVFmVlhoQW5hNDU0QXJJZXIxZ0M3c0RqakZJNHZKYXZkdmY5S3FSa3NJ?=
 =?utf-8?B?bk9nRVpRcE42a05KbDhTbjdoNjZ3cUhuR2MraDdGNjVqblFocmJnbkhobGNq?=
 =?utf-8?B?TnV1aEZGam9lTkZNd1RZYXFkdVgrUFFtQ2ZPLzY0ZExCQmZiejZuWU9RSWJG?=
 =?utf-8?B?Ry9QSHprOSt2ajZFemMwVURjd05XTTdZUW94T0xLRnFHNGJzN2lqTVY2OGJC?=
 =?utf-8?B?Ym00WTRrejQyTnN6d1lnSmtpaVl0MWhJeGNEWmw5RlFyYzlDRXVhS2JVNmNL?=
 =?utf-8?B?UkkxeHFoNnFIVUR5RzJBN2pOMHpTNmhaM3JYWnNZa295bWw2N2I5VHVsSFU4?=
 =?utf-8?B?K3BJOVJzSVd0WlkxTkF5R3dhdEw3dkszWFFFYVlUQXQwZmlreVUrZzFBaGdl?=
 =?utf-8?B?RU5INlBKMi9LUThiMFBYODFCUVNMdTNLTXFLZkRHSFFqb0R5U2hpM29sbnBV?=
 =?utf-8?B?amRIL3ZPRzFKaGVCdld5L3RIdTYzcXBRdHZyamVPSU54LzBHd0I0UFQ3WE1O?=
 =?utf-8?B?RlcrOVUrK2t0U0VWb0I0cS96bk15cXhIRUhCVVJJYWpXcm1ZMGpseG9nalZt?=
 =?utf-8?B?MWk3Z1JHV21zSk5mU1Jab2tVOExWUGljQ05HV0FHcExLNUZyZkpIMzA5UlVF?=
 =?utf-8?B?VE9ZdHYyenhyUThqaUVzTkxQK1hXVC9Gd05ES0wyc3dIZ2hXOFlJall3c3g4?=
 =?utf-8?B?Z3N6bG9VbktoU083dStXQ2FkZ2x6ZXYwc3orREpmRi9zRlNzQWlBaUZjeVBR?=
 =?utf-8?B?T1BkS0RrWWMvUkhEQm5QYm5oVzgrMUQwcWFIa2tTL3hLd2tZM1o5c1VOdVdx?=
 =?utf-8?B?aVQ0NFNtTEFBelBvUGZFSnZMQzcyNlpnLzdTcnhIM3JMQjJjb1FLOXJoc0NJ?=
 =?utf-8?B?VFJvUEt6TmIrOEE5WG95Q3kxK2gxYjFOZVFBM0R4MTFTb2xHVnlTZkJnb2I1?=
 =?utf-8?B?eThTMVdNL3NmdmIrNEpZNUNKQkx2VllTNlVUVEtkd0ZOTHlRU2kwbVhnS25l?=
 =?utf-8?Q?7f4qmjGuB6P6bQoNpGhyPoeY0XzYCdL751QC5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da9a887-0ad8-451b-3e22-08df2bc19cb3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:06.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/8RuT+nEzIuMQxqjlncyu5Tv9VJw2n20nHUfYfEcpquHWoS/BGn8tF6/Dzc92Cptc7y/97XF6TfdnBpX+yriaGTXJxNNUQfhJV9c2zoLk+c+Jlk3d9yFeUqt0APGHZr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

Remove undocumented and unused property min-frequency, which also not used
by known other user, such as uboot.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dtb: mmc@50020000 (fsl,imx50-esdhc): Unevaluated properties are not allowed ('min-frequency' was unexpected)
        from schema $id: http://devicetree.org/schemas/mmc/fsl-imx-esdhc.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
index 417972ad6bb3e..0b6d0ba65f957 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
@@ -21,7 +21,6 @@ &esdhc3 {
 	pinctrl-0 = <&pinctrl_sd3>;
 	bus-width = <8>;
 	non-removable;
-	min-frequency = <400000>;
 	max-frequency = <40000000>;
 	disable-wp;
 	status = "okay";

-- 
2.43.0

