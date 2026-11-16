Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799482;
	b=sSpjq5Sn4Yv1ZiYzlVRhCnihN+E6luwwXajwSTKXKjr+AuYuVVuL8NXrqVEX5ob6CyFe
	 5R+sgw9oavWhcILILPjGcoWJaaoOIhaVh01zWx7b/5SUItJwyPq2sfH8ow6qnVazFR0L8
	 lEhX1nk714k3IGNfbShXPI/0qzigY82+McE2k/n6cgsioiW1NZdgArzjuHNGIZbdaHKKg
	 FBuVTHsf6H0DKbS53WiMr87k8Kh5aP7L9zvWK5UFO/WM3+7nvxmmYdkFR5T56laqnbrGf
	 kv6Hu7xGrJYAUacUF/8Vgt8zNiefR5L7g/XKFV/T4F+/spcaTogzPGXzPZbVLwhIbUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799482;
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
	bh=LFg0REveY+ZR4Gab7mXtp58koIpRKz6HFzrci6DOgd0=;
	b=nlLa3VFiglFQxq3lTFhXwiwvvtczLW6UrFSPR0xncXPxjqfOZziB7N6YNAr2MCjjnqiN
	 x14Ac5xEKPRwRBeFAq08bM47gnsFw/0RBFp/uvNiVSlMVZmkvwdULVHvRnQ5ianqgoeZB
	 iKfinOuGXfh2aHNMz25caSKC2kg7Q2+P67RF1AlhHCpUCTOsnZz9y7CQOb/gRGC8bOUrw
	 3dSIkKvMq7ZTf4YrVqv0YeRItUBlJYAZI/T9iQI7S6Z7wF6gAwC6sL3STOnYgXSQ5X3db
	 XuUs1wsU7nX0SBOST4z81sLuryZKLDEZoKcctoHMFrSd2nmKKtB09L97NjQsX4DQD4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E3iTSFjl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE30F606A8AA;
	Mon, 16 Nov 2026 03:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE30F606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E3iTSFjl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5tsyF/MX1r59oV+clDP7TbvxAl0GSCZ1zb+u2vulGrrcVRpJOTe3VMrWU/HeHzAugHzQZTgFbkOh58MZaoxCwmyLP7LgwIy0GGqhrVmnASk5MSGm0v+70B87lwj3io9Aw5xtR78ujWa6egocUftj1kyvEX5HEbFR5jSD2k6MeBEr3IZ70owy4X91Ub7gjd4FXD+qJIWM1j4LvjhKY1Q7wLXrnuwZMcxI2ApgyOLY+POklwIQmOd8S87XgwRjC6HsBrU+DWyKFZ3Fz2H22eGLMgRh4St2gZEW3Pamav9YXqq+z3RKJHavTwrIZaELSO5QwphpiKWLuJdHZMR6Uegow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFg0REveY+ZR4Gab7mXtp58koIpRKz6HFzrci6DOgd0=;
 b=o3edYrxx2uJpJczACSILgRxg3sd3MHxSptBMV0F2y08WKP4tK5RddFlNPIRTAZSa6HmTDgOuGtCs/+xkYkmzIGD5784JaoI5VSSDbOtu5Nbd2UhYjknWyJvP4X9EXlZQeF/1/GlwyzYuOoWeIglyv+aFkE5O7rZxaGJKkwi/Yok+cRXV2DccmUBDFbPxKm+jjeSlwd26g/4ZVCS87euqhCGvvAkj60vVVMf5NcgpRxZhonl4TXC8docapSsURC2NycdEyD+QJqbaT/dw8SBlDpJsJ5FGT2wGwFtPDnhugxJAqd2XKLfz4McNGOGl1zkvDYQf/1llvvQ4fN81fUQ9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFg0REveY+ZR4Gab7mXtp58koIpRKz6HFzrci6DOgd0=;
 b=E3iTSFjlE/qSGMlrhf2oKMfgQjlxYXdLg2QwG+bSrWFOO5NXlO33ui1V794Xlo79+BVFkKkEz95k+FEbvez5dB7gISDmgwRHrmQBtGND0jbZFW1YHohKa4i+Vo6oERqUlZ3Bp0X08fiKl2FzltNQdjgtyeuqahoHq+c0tfEjUynEGSroU8PpMm72OKWXj/lLmVujm39JH+iOR6ngtTH+m8b2xH5oft24GZn3OC+JFSAWV6H4xfPriq3ADcQykYK0qPyVY23LiQD1jh5AjO6Y8fqoCU+WkB6js2SKV0wmCwMZj6RtepVlpDmeU0GVIU+QmIzc5QmsuQfd2p3/c4ydmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:24:37 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:24:37 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:29 +0800
Subject: [PATCH v5 11/11] media: imx8-isi: Enable RAW10/12/14 output LSB
 alignment on i.MX952
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-11-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=5553;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=thA0ZBpRwncmgan/z6JT7nXpLV4idR1q/e5164HOWLE=;
 b=+GWolEnycWIq2Y0q/MOR7NINqiJowAkbjiCA4p0Uz9lmYc+2riO6oMfMta46GQdwok/BquUbY
 +AHFNJJc/LICx+OufKBg3uSxVjGuV3B2MnC7ZAcpMWeFKev7P1iBbK9
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ce8e24-1351-45e9-e611-08df439124a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|921020|10067099003|56012099006|5023799004|11063799006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1phlvzcjNKeLFyjzgi9mdxCM6dFHPZtd8InElFBpVNuEPYkd/y+cWhXZbxVBPb6sd8x9K5xeB9ktDcVr1Gtjx37kZBRO1OMDyZbR+tLmf/JhRbgY2XFKctMRg/Gq9zXDwZaUUoJqSHZaFvIPiZz66lRtKnVnkdWKxGPQVoxU8h3P2xrbDKLOMtOxfl8hZ2zWLt+9ORlTOmVidT9WWEaB5P+NgpDF0b1I+7gpxj8V6TLA2Nk4tA5TfNElDt0kPM9T4jHdgzRMf6kvLxAXZiCLfaunPItY7VIlxFaDyrZ9OQMLkAHEelkW5YlQlifaeIk9PQ/T5CTHXb775iAu6WFRYEmp835/TNuDQ64Pdx57TVAVWKG5OKw9/HE6FQH6+kB31r4UkLPxKCj0zpxdql0Sziy6nKX+2s4byhr/tRgAdWa+5lGWrXvatYyq7oD3F3vtiST9vJjO/Vs4ALDyNV4P/KW8240+Hv9H6mu0SjGUlSOVX4c+SIgLYfJJB965HjWmX4N5P5hOvxyIeDl3xuGxJys+G6MiRqxcquhpQjjbybL9HrPHfPuq/mo8Ey1UjVnqde0QMqmKFMuQfv8XtFicOnOjTuerMb7tME7wJ/eOJMS9pzI94M703dAHRKFZYV8S3l7qxcPKwnEIXeGdbRnABFenWBW6SjaHC5E1SXbc3FcoMaIRQE4ybPXivAypIOgmH8SkpR/kekmz4T+ENnhANw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(10067099003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STV0c3h0WGdocXlrSUFmQ3ZQRitFZkpQWXBERVRTVUYwRmljV2FJaVlnQWQw?=
 =?utf-8?B?RU5LVXp5WkNTVWEzcFVOczBLNloxcVB2N0t4ek50L0c3dExkTTEwTTVqcEFu?=
 =?utf-8?B?T2VHay8xQkJ5SnR1bHhybXFFazBUTXppRnVRc0ZkSlUzZkJVaDRvUnNwUnUr?=
 =?utf-8?B?NVJHTmFWbm5LVS9vSTJRZ0tnZWgrZG5QUGtoZGhLT3MrZnJoejV5ZjNUZ2Fq?=
 =?utf-8?B?dGlzYkMzSTdZdlNIcmN5dndKQk1wM05CUCtLbk10YXpXSUV5R2VmTkd0dWxq?=
 =?utf-8?B?eEJtZVZRMHkzOStHanR1L2hPTE9CcTFHUnlIWUY4Z0lvM0tGR1ZwUUJPZS9q?=
 =?utf-8?B?cmZ6RDBkR3FXalg5WlorNWF4Z1VaNlRlenVzTEVtTUc1OWZuRDZPalRDRjBS?=
 =?utf-8?B?TUk2R21wMndBZ0JPMldnVWJEY1cxSmY5RzdocVhHWkZ2MEZZZlZTQVorNFVX?=
 =?utf-8?B?ajZmMGdoMC81ajFPYXFGRVRrazR1WnA3d0dmbVh0TUtSWEZ2NGlLaERsaGpH?=
 =?utf-8?B?aU9NY0k3RWRtcjJQRUZLV1QxcmdkNVJNQm9TejVpMHNLcUlkU1JCTTZDK2hz?=
 =?utf-8?B?elZVd3FjejBVY0ljTjhlRHZwaTNBM0h6enorc21vSGxOMWpiNk1PSFdoaUJu?=
 =?utf-8?B?YXZ0SHo2aHlMbXZ3ZzVDOVZyQjNtZXg3S0h2TlRQYms2ZjJWREtRUFpNeFl0?=
 =?utf-8?B?MU5vOFBKdjRsc3FHYXNXcWI0ZDZQZ3VzQmF6Q0NpdUlIMkdFY2hRMU1Wdkhr?=
 =?utf-8?B?aGhyNHY1V1lpaW9Oak5pVmIzc3AzWjUxWHBJaG1NUGdqQ1ZySFNyalY5K3Fx?=
 =?utf-8?B?Q1lMUUNMVGtaSG1JNXpORDN4bnB1WTRtVEUrR1c3dkMzZVBpcDN0VWtrMlpz?=
 =?utf-8?B?MHpOWUdGT0JSSlJ3b1RoSHdmYXBoR2ppRmZGKzdzMlVNT01DNFpRUUxzSWkw?=
 =?utf-8?B?SGhJOHRwLzExRE9UZGF1R005aHBxNlhlMUM0eEsrOHllRlZVUTFRTVcxbk45?=
 =?utf-8?B?N0ZFYTRyTitzZnBKTFUyQ045cmpSVHpFSXJVd1hJYVRXOFM1YXUyQVE1R2lq?=
 =?utf-8?B?MGhHRThJSmIrakJUODFkNmJtRUhFL0NoZUdQNi8zK054QW9DbWdXVjlpdk5z?=
 =?utf-8?B?VmJMejNjTEJXcEVSeU8zeUdORGM1UzlKSEkySU9LMjhmQkNyWW5rMTN4cFBk?=
 =?utf-8?B?bC9pYnFWV21odlZGdEovKzA4VFY5b0I2Y3VDT0ErOEIxLzJiVlk0V25uVW56?=
 =?utf-8?B?a3RMUmZXKy9lOGtaVnEwMnF1VjFNN1lPdDdIVm8vdWZjeFRHcmpPdWxCRnlw?=
 =?utf-8?B?SWFNcVhqRExtNUlOU0p6TnJDbDJ0UWNmTE5uQmZ3S25ES3VLMGp0VENKeTEw?=
 =?utf-8?B?RG03aU00aUxyalBvVUFrY05VMHkxUXRjYUlzSnp6NEh6MEVrMFd5dFduaXRL?=
 =?utf-8?B?bUNkQ1FuTmNsTVNhbVdURUdhUUhjM2xpV05URmNiSWVkSGpYM2hkRktHUVk1?=
 =?utf-8?B?eENXdkZialJVZmt4aHRlQzhscHRhVU8raDBvM3lqL1Jicmh2QTE2MitUcXFv?=
 =?utf-8?B?bEZTdENPQU1QMkRJeVVKQUVyMUxTRlhOcmRQYUNnakQ4NVZ6NnJSbkJBSHRR?=
 =?utf-8?B?V3JMR2drSjB3dkhpZEt0UnFuWWVlVGEwTHFwcHN0TkFsKy9sOVZIeThuUDBI?=
 =?utf-8?B?a05HWFcrcWRtSGJLd0dYSW9ub0l1SFdBSmVPVnA0djFEd3p0K1JIaHc0aDJt?=
 =?utf-8?B?dFhsK0ZNdnlPYkhUaGtsajAxS3FTWld2RGJDZ2pTUzdhTHJueGJ4eHpHZVdB?=
 =?utf-8?B?SEEvYU1GZEFPeVhaS2Q4WDluV21LV3kyZVNSRDM1cjNKNWl0ZkU2cDcvTlpv?=
 =?utf-8?B?dU5XQnUzVS9haGR6Z3lpM3lTSFFKN0ZDMXp3Tkh3algxaUxQakVqSXJ6cHNw?=
 =?utf-8?B?UURsL1RLWFVTNU5PWUppV3JnaUJ4Y0V4MzV3ZmJqbXp0WHNUcHhjaGtqWGJS?=
 =?utf-8?B?TWpLMnJ0L0VnQmNHWjVUYnB0NElBQkljSUcxbkNqSjNRaHRmV0FPRHZnb0Yr?=
 =?utf-8?B?UEVnNTdWNGRzc3cvNHdMeFJwVlc0cFRUWW5PSldXUXJMeG9FMTB1cGJNWHV4?=
 =?utf-8?B?c216ckdlSllqT21vL3RIZWJFV3ZWeERVYjZtT1MyNEdCUWRNWWlLcXZVNlN2?=
 =?utf-8?B?V3hHWTl5UHJiQVpzM2M3YzgrWnJ3aWhKNHEyNGF3d2JkQkhrdFp5RmVnUGFV?=
 =?utf-8?B?QjlVQjNyQ1RwbERUdHd3NWV1RVdFZm1hODJLV0t0Z0tFRUorRnZDL2RydTZM?=
 =?utf-8?B?YzNzYXVoT01HV1k1MkZxbkI3bHYvSkh4aTNBODVQOUZ3KzJzSnBqVzZnV24y?=
 =?utf-8?Q?TChAQGk4Dd+m/IuKBLXnS8S59EY7zgATkcUla?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ce8e24-1351-45e9-e611-08df439124a7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:24:37.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1pb8vdaJ9MscamUURLn5eQZJU9OF5e5FaWLXrYvFdsefB32W4+sYZLW/Eq3r+uHuxVWuwgxPf75OfIQNd7Kbddadty1KNYjXb9VPB9d8Pu+Tnoovl6ulEsBAzm71JSg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

Before i.MX952, the ISI RAW10/12/14 output formats are always
MSB-aligned, which is not compatible with the V4L2 RAW format
definition that requires LSB alignment.

From i.MX952 onwards, the ISI introduces CHNL_CTRL_RAW_OUT_LSB_ALIGN
to select whether RAW10/12/14 outputs are MSB or LSB aligned. Enable
it so the driver produces correct V4L2-compatible LSB-aligned output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- Split RAW_IN_MSB_ALIGN into a separate preceding patch
- Split RAW format table and RAW14 changes into separate preceding patches
- Move isi_out_raw_shifted() to regs.h in the preceding workaround patch
- Rewrite commit message

Changes in v3:
- Use CHNL_IMG_CTRL_FORMAT_MASK instead of the removed per-platform format_mask (Laurent)
- Derive raw_out_lsb from the model field instead of dedicated platform data (Laurent)
- Clarify the CHNL_IMG_CTRL_FORMAT_RAW14 comment: the format is
  documented on i.MX{8ULP,91,93,95,952} but only used on i.MX952
- Update the mxc_isi_channel_set_output_format() comment wording
- Rewrite commit message
- Add Reviewed-by tag from Frank
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 37 +++++++++++++++++++---
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  5 +--
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index b3f32b9796d5..6733776e72aa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -311,12 +311,24 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
  * RAW samples from either the high or low bits, as both LSB and MSB
  * alignment can be selected in the gasket.
  *
- * On i.MX95, the CSI formatter provides MSB-aligned RAW data, so the ISI
- * must select RAW samples from the high bits of the Pixel Link bus.
+ * Starting with i.MX95, the CSI formatter provides MSB-aligned RAW data,
+ * so the ISI must select RAW samples from the high bits of the Pixel Link
+ * bus.
  */
 static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata)
 {
-	return pdata->model == MXC_ISI_IMX95;
+	return pdata->model == MXC_ISI_IMX95 ||
+	       pdata->model == MXC_ISI_IMX952;
+}
+
+/*
+ * Starting with i.MX952, the ISI can output RAW10/12/14 formats with LSB
+ * alignment, matching the V4L2 requirement. Older platforms lack this
+ * capability and need the RAW16 workaround.
+ */
+static bool isi_raw_out_lsb(const struct mxc_isi_plat_data *pdata)
+{
+	return pdata->model == MXC_ISI_IMX952;
 }
 
 static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
@@ -377,6 +389,13 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	if (isi_raw_in_msb(pipe->isi->pdata))
 		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
 
+	/*
+	 * Enable RAW10/12/14 output LSB alignment to match the
+	 * V4L2 requirement that RAW formats are LSB-aligned.
+	 */
+	if (isi_raw_out_lsb(pipe->isi->pdata))
+		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
@@ -430,13 +449,23 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 	u32 fmt;
 
 	/* set outbuf format */
 	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
 
-	fmt = isi_out_raw_shifted(info->isi_out_format)
+	/*
+	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
+	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
+	 * respectively, to align the bits to the left and pad with zeros in
+	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
+	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * Starting with i.MX952, the ISI supports RAW10/12/14 LSB output
+	 * alignment, so skip the above workaround.
+	 */
+	fmt = !isi_raw_out_lsb(pdata) && isi_out_raw_shifted(info->isi_out_format)
 	    ? CHNL_IMG_CTRL_FORMAT_RAW16
 	    : info->isi_out_format;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index d2b8a26b7c21..075fc6848213 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,7 +20,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
+#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
@@ -90,7 +91,7 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
-#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95} */
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952}, used on i.MX952 only */
 
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)

-- 
2.34.1

