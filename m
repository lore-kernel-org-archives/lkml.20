Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434429;
	b=oC1WSiXkxRQlxNICJK/lPgMIpkY/qIkUBP9jO4Mzi4erNMmpLPbb9x+z1IDEdu53tCQZ
	 c9x+WYVufYZ0X23zj+5tsRahJmSohz+KRlvLy0WHRD7gj1ybeXLXlIW5OoHtQ5iiKmhtZ
	 lP9dKMNzF46WGIHLsNxJNu0BZP3OCkg2/sOViw2VlO5JBuqg/F5yEobB1STHKWOk555mV
	 sLvpbelnxy2FzF0lDrFwOoqOebXYk5+I201Oo8iCDXbvmexcYAgpf4qdKWRC3OKv0pVkv
	 yXvm51EqUl+ld78G7PmGSEJxhvhgNH3gDoLvSsiFtShiqgMe+iXXxK/qwoDQZIAStxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434429;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=f5Pollkk4dQ2cG+DnkmrD/rftQFnAlat2nff0ay0MIM=;
	b=ybxPLDXROCbMLyY3em2Iqx6tTfvjl2gigPoYDWHESaxBhmUmLkhapiNgo3WJAvXvFomK
	 2izjgYkaPL+c0uGaCOJ0dSc4wC75uBJhffdPwoIT5dd6wUsUY4tn+sGoeuT3Sl6oBepBH
	 7PA/2ZZP2sN3l4QRHTXG6LbqTy5MnzgCIwf6tmdjZsC2pVWTOFtZCk78eJe/nNaIZ+MBa
	 Ce3sBAftCkout11REx1gQihSFOlFu+Nt95N/1CTLC9xyP+UBEpnrxXLllzDFX0KE+ZFkj
	 Q/WlnoqYfYPY/3WqDA6OJdjHbDyss/eae0ZS5D3c9H0YoAn4XHOhYFkZnbl6h4JtBSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L2i2vSye;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.12
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890460A263A;
	Mon, 19 Oct 2026 18:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C890460A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L2i2vSye
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVoHjvkA7NsjfnJWZetkqYZgYRyvrOPk9up8N8OveW5mONcLbsmLPCeghNNuDY7SzgUQDHzEvbGVk3+DfgIH6oXwl+gm0rQvnPpZEuvYcW/xHf64dI5QlF50/Qtw39VEyoqR/nYjRTI8z8G/486Sq5Hu+XROQmhraYVey8fexRdCXk5L8K4l3I7BI8InlsMRJqs5cIzN9FY0TeUPBqkdsV3x4k4fAchziSsKr8F1kk/VVsylXE+CG5j3laIYfOgYXBJXH1Pa/TXfEE4vJm/B5QpHOsh4q9XEulDlO1eNfIknYHt3guRewLVS8CaNR0Jsw4PUC2itnKWcFKiMdZPVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5Pollkk4dQ2cG+DnkmrD/rftQFnAlat2nff0ay0MIM=;
 b=R0CX0SHv5vnyNeEgDnu6DhLKLwEb7LFaO9Gl79ti6EdkqkITuCENB8cxfnEc1iaurqfgzQ4/lkk2odO4XgwTDagjfJUbr8eb4dqqZfzfG3tpTPuLNV8ZGV5ErKyHesMmSh+9vkD1FnXbs7F2tN40jQ/jyt+LmuQedm4KRharlLFDkDQ7UlSL8nb4dU3byYKsuR1XhFE5zAACg4lBmjj0zHrINDO8grmBJZKBxb3jypxMKc4bJCyiIM8i9MDwa7vSus514FKMddXEu4C0syAxcctGtd3s3Hfma3loVTF7lPFMv6bh7tdgw2pYqcx7ChGsirze87GHsPI+jY7Amb15nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5Pollkk4dQ2cG+DnkmrD/rftQFnAlat2nff0ay0MIM=;
 b=L2i2vSyelUVRargecrPewFHK+yczu7Y9jRpzFlW3RPU0NVbPNatupiuOGq0VxMWVKdw1Pe9zi1QVvhklI5Fta3p5Z3Hn8qFijZsrz0Nl36n9gW8/hfAR1icQicPa4x4JCY+pxfY/iKySB37i+EaZZBtRFImxkme2tp4Nh3OXwkV4QGSOjEeyveGe/sXe76phjIBaxcUHnW2FY1OXFVwkun9S/uHJNFDFteTOg4QgN2xoUopkiw+wzwlxTE88aFJ5IAsCMgL1j+8aJ8pI+Ns9gtlmRctqibPCrjYXtS+piLigg8tUfYW+8HylqIP+mEYo6dZF5kT69ixqXftv50hmjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:27:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:27:04 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:24 -0400
Subject: [PATCH v2 09/13] ARM: dts: imx6qdl-tx6-mb7: remove redundant
 pixelclk-active for simple panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-9-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1244;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=UrteHKmHfY1ep0Y1HPDz3udibs+iQRWnL63mfZDyHYo=;
 b=MB3Ou51birCytcdr0QORnhd8W2clXowm7sx0DP2iYvlkNk9tTc9ql9sfZ7POmfNGcviTVvNSk
 oPGMLwqIQONCbaqz3T6GglrFz3zAoBqkwP6gYBKPLcYEP5NxPtbwaO5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 74169ab8-8195-4ec8-5bbd-08df2e0e9369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	71hyw+FIF460+8icg2ucWr9LcdtDK/UyUhNnqDyqPPYkVdcOilpVmqob42ocsgi6WVCERvw9zCABHyvcn1HhqJ6puOi85rkx3c/Tb1ZZL8IijjKFUFxBid8LGKI/kC0/HYe+6bdf0J90KkE9ej1thpyopvZfMx0iEDp1oi76UZdUDseswSY+shdwX4JEid7VbeArPFpcwac9oGV4CpvjizfyKIpI8dO7SNlXuNXQAp/TtCypg5Srd35LxtZ2OcSCabyB8d+Eb5858sZdvSLzZM3YqdpdPtCFt+84nAzRTbfVnfqzNQt044yRTkr9o61isy0zmmD7R+ruvUYF+/LliFkyJsRBTqLDgpd24HG6LjhqUr0DCCHpN4oUB/UiVV847tFwzUua8cBZzLGGjfFxV3DhiY/+dvxPW3/xdnTR2Nndo4h8fW9gmPG2J/fGf308/THJRxRE4p+OLW1IQg46URzA1Xtcsj9CEBskLNWlw/i7Aqrx25oOJRBMB22i4YffWnxqw/r6k75xM2bUp82pMzF/O4iEM2P6LQ1yz48MIzxVKJTNebifR+rfgTZL4muPdlBXYXvdev8u7bL5EUa5tt2zNjAkmsJdqyYqmVm9g6vzCo/nTwL4y9C5DTspBRol
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEZlK2tXUHJ0RjhWallyRmxsenRQc1RHQm1GTjY4S2JJenlVanVuRjBCaFNK?=
 =?utf-8?B?aENyWTRGc1dxVW5iYXhjVXJUa3o2Rm9WYjlvZ3g5Y2ZhLzg4OUQ1Y2pzLzBT?=
 =?utf-8?B?TkhWR283U0Z2UEFKK0FPUURwR2ZDWnNFN0V0b3NYRkQxVGR0L0o3OThFalNN?=
 =?utf-8?B?Nk4wU2dFaGtsYXgyY2F4bDBWdE9DVTA4ei9TRWdpSFlLcEtPZ3FVa2gvQjNq?=
 =?utf-8?B?NFR5MG9TTmI0L2ZicmlTSlZ0M1IrK1dtQTUxQzY1YmZBNEhOa3JYQjNhSmk3?=
 =?utf-8?B?Tmw3SGdvVWFTY2FHbnRNOGJYalFsbU1va3V4ZEdmL1BtdkZBdk9KaTlLTXRk?=
 =?utf-8?B?dXhJem9ncnM4K2dnNk1Bb2hiRUgvSlZpdDBBZ28vME81cklIckJLTUNJV1VU?=
 =?utf-8?B?SEw1K3dBMHFCZG55ZmtwZXRqWGNOUTJzY3ppQ1dEdEYyRHNTYTFIYm9CV2NB?=
 =?utf-8?B?VS9ZQklMSGJ3aHUxc2o0a2lPRnJGWWZDWmpYL0o3MytuMzV6VEUxb29GV3Rr?=
 =?utf-8?B?T2F6eEMyWUNzVGtUWmNzZVRzbGZoay9tOWlQRTlac2Y4N1lxZCtmeUVRMlVY?=
 =?utf-8?B?VkcwOFozTWg1em5nZDZHN0tzVE1JMUpOVzRmZHJwR2MxV1gxR21ENWhDd1p5?=
 =?utf-8?B?V1lLWTJkQlFUTkQ1SmkxUmcra3JCaTFGWkVZL2NHL0VSYndXSjFUSDAwd3JB?=
 =?utf-8?B?dXNQMnFnYnBJUGVXWHVNTHVHdU5iQzhXYmhCSitva1JVSmdaVGZIT2p0NXdN?=
 =?utf-8?B?TUZiR0sxMVovNUtRQWUvaUxVK0xCcnVBMXdQYWxBdUtQMG5SQ2lEaXJSRmNB?=
 =?utf-8?B?L09mdDB5RmhZSlBlT29jY2FkZG9VdnJSRm8rZmt1QXZVUzJOL1VGcnU0ckR1?=
 =?utf-8?B?Snp5UVdDSHpJT2Zxb0hBUDVqT3JxSU9nTnVLV2R3SXhJbHFmKzlwbTMyRSt3?=
 =?utf-8?B?VHdobnRNWEFMam1ldEZsdUY3blptN2crS1dkL2ZEK0JsbmxHaWhJays5c3dI?=
 =?utf-8?B?QlcwbFFncDhKR0hXWFZGb1duUjVUSzhndEJLTGJGdlVOWXlTaU9OaFI0eVVr?=
 =?utf-8?B?dGlOWEdaV0RKZkczUDBqNDNpTHlKNVZhUUdnUVhVckIvS2IwZm5DblJUUW95?=
 =?utf-8?B?bmNhM2VkQmRvaU4zRXF0M0FyUEE5NlE1bXpoMVpIU3k4ckFzcWRjcG9KN2ZK?=
 =?utf-8?B?QWpQbTh5di91MC85bFZxaHhDbnRJSlJydXhoVzY1b0R0dUQxY1hOdGZ0Rnhw?=
 =?utf-8?B?VGc1ZW41YU00dVE2dkc3dFZWQ0hTOW9mZ2QxTEhraE1ZOFlqVnkxR2V0Z293?=
 =?utf-8?B?elJrVTJ6dGR6MklMTXhFZXY2bGdUTGRsN0szZm1pZTlxVXExSGhoWThuSjM5?=
 =?utf-8?B?NFVJWVNKNldTbjQ2TjZaODFWTjUwUVFwODVvS1VIRWVNcHJiMlBVTE50V2RT?=
 =?utf-8?B?ckJmSEJJK1d1dGFoYlpyRFZjUkcyNTVySjJ0VTgxeEpqZGJpdG03MUlHUGpU?=
 =?utf-8?B?V0NYTndqUWNNd3ozTXIwR1dYL3h6NFBIOU9idS92S1VSVldqR1NpYURzOEJz?=
 =?utf-8?B?cHpaS1luclFOK2szdmtwRCtHbU1Dd1lzMEVsbjN2Q2JlcGNYYTA5MEE1L3h1?=
 =?utf-8?B?aE0vTWJ3azl0RDJWc05VUzZRU0Y5QXl4S0JvckM3akhDTFV6eVgxOWhaMTNY?=
 =?utf-8?B?bVBadTlwekRnbEZpTFl6bmNPTXhNVXpGVFd5ZzRqdE1EYTJjbUZjMW4vQnZC?=
 =?utf-8?B?eEx6ZmpqK2JMTnZEL3ZsU01yWExZNUZYdHZBQURHWFltaGM3OUVRcyt2MkRs?=
 =?utf-8?B?Q3pkRFNpTmMyK25UWnpDajNPVUJuTGsxYjFRUS9wV0VjK3ZaSmRzMWE0MzEr?=
 =?utf-8?B?VXl5RkxmbXFOT01yVWQ0Q0hnVmE4ZjhQbTJMSms3YWlMS0JPNk1taDRiQmlp?=
 =?utf-8?B?Y3Rteldwd0VXallDYVQvYzVBSmlzdUFwQ1dzanVQT01EcVdOdWRrQVkvMjl3?=
 =?utf-8?B?VTdoTjZLZ0NCdklVVE8zd2xSc1V0STlmRXpOT3JMU2JWeEZzSWtNL3dXYy9R?=
 =?utf-8?B?L2g3RzRLdjdEd0J6QXY5eWdwTFZKbWFsM05qc08vZlVmeE50Qk9lV24zRXF5?=
 =?utf-8?B?em10MnJ4U1I3MXdwYUlUOTRia1dIZjFpUnhXU29ZbVZGVWtRQW92MGZ0eitT?=
 =?utf-8?B?UzFYTTl0cjB1ZmxURFZGMUg4K1JuZ2Nodjk4cjlMeEZRZnlPZXllUC9GVEt0?=
 =?utf-8?B?SVU1U0MxVnVlMTFRbjdHcG56LzV1V1kzU0xJQUtUM0VBZmtSbnNCRStLVG9H?=
 =?utf-8?B?MElaSmdnRUVJMGU4VWdobjJJUml6c0J2M3I1N2h5NzBsSERYbmtHektkdi9P?=
 =?utf-8?Q?A8SlTbv5Luyd8Hg2lNqgv5qLTKkrNhJusby05?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74169ab8-8195-4ec8-5bbd-08df2e0e9369
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:27:04.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4RBnGqi403hEMCEy+Xrs65oQSYDgTmEjYJZxzVIqHDcH/CP2ETIX9k98qZyl4qtOwLHHRvm7tmNcimuSOI17vUFGhamMTpM9tqmG147PkpzpY1xqvMWpMygHVBYYKji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

From: Frank Li <Frank.Li@nxp.com>

The information pixelclk-active already set in panel-simple.c according to
compatible string. Remove redundant pixelclk-active to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: lcd-panel (edt,et057090dhu): Unevaluated properties are not allowed ('pixelclk-active' was unexpected)
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi
index 8232f4ea27526..b770d884c6f3e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi
@@ -17,19 +17,16 @@ backlight1 {
 	lcd-panel {
 		compatible = "edt,et057090dhu";
 		power-supply = <&reg_lcd1_pwr>;
-		pixelclk-active = <0>;
 	};
 
 	lvds0-panel {
 		compatible = "edt,etml1010g0dka";
 		power-supply = <&reg_lcd1_pwr>;
-		pixelclk-active = <0>;
 	};
 
 	lvds1-panel {
 		compatible = "edt,etml1010g0dka";
 		power-supply = <&reg_lcd1_pwr>;
-		pixelclk-active = <0>;
 	};
 };
 

-- 
2.43.0

