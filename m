Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810022;
	b=x+hlR+vGbCI4XC2+KPWOY9Swo8sljHInlSforBm9f1anfw+qqDIXJPIGOPjjJ9hv5dZN
	 hKznU82uhIHSj4SUuEGM6DQU/gT/1LKz70yevIgxUpY3k/rxZ/D/Pb8kDJHZt1nwfXeQC
	 DHVKn7K9UPGwus9yuZFYP48o9QWeZfTu/R+j/zYv9BdyTav6b36heft8XTFdvKWTIXs8F
	 IsBWG3Lw4BQ6Jk9s/A5EIY8cZbMMysE+19Ic8NeSp5cyGBGwL843IywF0JHtAMiWYf4pu
	 W1BlsNZ/yS/4Ya6XuAgXQ4IN9G/bOd4H65EcvimEagFNtICsuWIJvKltQMUvFoAilTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810022;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SvmmvB0pBmnVgS4Zrtkcz2J9hW+b0uIVSeXmMcY2wN8=;
	b=Cw9Dmz7KfaZRDjvMd1GhA6OZuArjb1YnziacU72bYz2Ud5KJMDxDg4H0dtxa70u/PbK5
	 MoKprY1czimO3ZMd18v0KO2xmdZ3sotkDmk+AkNZpD5K8RV7Fv5nBbd3zuQLPXX6hp6RK
	 PTAuaaIXVeXMPSG9/6UlR0h60H/j8rPaN9/gKHAY9hM2C2mKbm5pYaSAQ8Z2TsuKS2nQF
	 b0udlIXLKhRUjuctaKA+bFOCLduRPcblauiAMoZdtRB2AWA+Bun7WUUhQthVIu3tbw4RE
	 cbOq6oOfq4NqAplA25C+RLCZ/LI9zJOV41IXPVFV6X+YIarHLWN+bMM3WoIByf536wQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b="KeiB/C9D";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.129
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023129.outbound.protection.outlook.com [52.101.127.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C82606A31C;
	Mon, 16 Nov 2026 06:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=KeiB/C9D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmYcgVwzgrE8qDgdVV4adnTB4G0+iv+Nr9QzYgYxjs6MnRPLJH99hmMMmOJm2Lfkpfo+iWNNyNRtVwMXLCtvBJwTVfVynepKxPkGEuyd/q+SwbqQGvAug42zM+K26E+81VYZR9lN+2vH1QB3KDJqJNHufCE5zMMjuGNMCHRYHGCvF0GJigPdUgEl3Kf5It3nbQwCR6aYwZlekViTuBIWX44+zWVsO+sQvu1XY08K+5xHgHSwPZNETxSsnFj51vLzAWi8CLYD3xFUlibUfm0XHNoTUTKNPfp4AKZMF+d46gnmqPr6VsSuIg01U8YTc4tX5PcW5iPTG6pornNZtL3bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvmmvB0pBmnVgS4Zrtkcz2J9hW+b0uIVSeXmMcY2wN8=;
 b=WA0z0Ol5jOJE5awsi3K1BCQ1HxpRcVtacKtr5SsCZLEN2cenkgHnpCzhQoIUuBTdtY5Zl7GHBL8q4XJUCuPYzrlpO1P7YwHq61wEHphutgtT2GLVMATMMkOAWbzhQ0pCHUN/j9pYCMyl6nTL1/OEccQqgP3KCgWmo3VL1bRZ9L96Xgok0s1f7DYIXcX6TsZ8W5rySvwpEJhZfml7Q9RZCnRfMURLKv3gpSbIUa5u8jcnIN+eTBfahLVCm4HUT1XqkUMtizB6rt/te4p0aDB3TPus2OF+fNpKrlummhx1mlWh+ERJRRwzoLxbTxtM3D61XW949OuA8j1VtM7BbM2yTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvmmvB0pBmnVgS4Zrtkcz2J9hW+b0uIVSeXmMcY2wN8=;
 b=KeiB/C9DLJzkL+VMtM7svzgxnhATjMfQrAL7annAGAuuotYsIZRJItyVy8Hq8LjNc4tyEpluyN6ZHaMUenPD691RXMRzjgSSHOGs5+Z0pll5uc+DaNtDkd3fSr+AHYli15YsH/1dCl1yw9qhAPUue8ad47xs/XwQTjgicLEC2WjRIO36MtrnwTxrxvuTgqbHWp6AHfqGc8ugSZGbGMwUJr8UBjfbJ0EzqobEyo4Fee8TLaxwKMOMX48kwuv1ERP+6EJP/2TSEbSXQ3H0h6tvJrT7Cev0mWfQcAxIRdrFlhE61QKyS9f05mWctvLacud8JXB/OATkgjLnGdT86dqV2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB7507.apcprd03.prod.outlook.com (2603:1096:101:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:20:15 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:20:15 +0000
Message-ID: <f6972e64-741f-46a1-b990-4d7362466bf0@amlogic.com>
Date: Mon, 16 Nov 2026 14:20:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 935637be-7d4a-4c08-c0b5-08df43a9ad80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dAb6uWbsrh9jSVmkd0xWu2fB4+evWZOTCO5/YQyKzj2uGXtjNx+QFeB4gWKDWeX7vblORfjt+yxVjaaHE3rA5OSgO3PHjrL4zy+AHMrDPYV36jVp0CmyVQzNgCqcxYAZHQhFMc3fJLwtWqzPcI75XjnMaBdQOTCdewp/m0G9m+UqNDer+p5mWLSYSpkOUWSgPBfL0lZuZADrX6nCfHYOVRPWVPbix2q7s0yJJMJhgytkRqsGGstjL+r6Azq4qgKWM9rFb9V8v4QBKd5ecBsnJvIAxICg6fgzoDI50u4ymjBN8Mr5rqETFi8r7Tog7PN1nNjRb2grWBBXnnNyGJmQsWz0/JlEl4ioL2F0gc8wUuiqwTcOM6RvmiEO8NZZg2zovcv04vF2CiOXLbtt3HthW6UYx7+6AHR9efYzsc0RbkLBLBPXM7qB7oOQcWp34iBj1frCzjAHGZ1Pxvm1rNg13K7yvy+e24UpOZE48wk9H4+7PFU0r31hNWP1kkCGHWgQ4xgbprs6LSZUvYSyO5AAz4UQQCKiRdtluoalG76CHmT+Yrx2H9cT3GFfIgLZJ9piuIh2IM7QcSSPGLbnp45m3wRdEPPWzHg79S0ipD1JTn17SuhtjOg+YJkKqeER3qgbhOuRrckvbEBrEgbw0VHqsLBAiy8ZhECZIkr1d8t0aMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by9KUVFkU1A1TXh1cGJRUlBxZ3JGR2VtOEN0alR6dUMzaGt5NlBjaUw1bndF?=
 =?utf-8?B?eGQ5SFZvTkgrMFVWLzlndmZORTFSNEpwWlFFaTFLS1NjUFRKRlhWUnlJaVRl?=
 =?utf-8?B?cFpiemlCL1dpTnRNN1BmeWVmMGZVQU1yQTVMcy9qeGVUc3JiRENlR3p0ZmFv?=
 =?utf-8?B?WVlrSlJxNkZ1Sy9KS0htSUg2dlA3ZjNwMW9KVmxhanV0Vy8zYjUxZllydE9D?=
 =?utf-8?B?VXY5WTE1bW9jMWZjZnpqcjdvSmZXamR4bWpTVWVqMlhrTE9mOUdJZzdlWCtx?=
 =?utf-8?B?QlhhWXV5SjVZUXFLU1RIS0Rod1BtZmkxTi9peEIrS2NWZUQ5aUowTEZubEZu?=
 =?utf-8?B?dFZqTkZSc0VINHJDcjlGTnFDV041alJiRHBSSnBwVk1vTnFyOUdYOHJQaDRT?=
 =?utf-8?B?THM1WkxXekpHSWR6eUY5YkVGaml3TUJ5ZmJneDI5a3VpZkRCR2ZKR0x2c0R2?=
 =?utf-8?B?eGY5NHZtRnZsUjZaZnJZZEcwaG9BMHY0RGd6cVpOTFhxNWkxWEc0N04yYnVR?=
 =?utf-8?B?ZXdKUUJyN3dwc3crOTBua2pIV29uNTJXckRxc29jZUZTampvMGdDNS9LS1Qw?=
 =?utf-8?B?UXJPR2tMdXlpQnR2YXJZbzRmVlVseW5vRkY4c0x1MGhHbTVOZnZzVTE2aUlO?=
 =?utf-8?B?ODQrK0pXTjN3MGpXL2xrTHJKb1JGbVBDdUhuZTlDY29VMVhldGs1VDFFbTBZ?=
 =?utf-8?B?UEpoWVl6TlV1dG5DY2diQUdQVnU4Q0o2RkZSTWgyZFp0WEszKzlpT0wvMDZh?=
 =?utf-8?B?T0NUSU54dTRubjNreXpzMy9BSURtRll6RjlvcHc3UmVRby81UHl3Mkw0cXJ2?=
 =?utf-8?B?aTF1MmppcU1iNE9TRmpJTXRBb2pHNTEvYlp0TytRaFpTQVVXMUU3d1B5Tksw?=
 =?utf-8?B?TUo3alp1ckl2di9tNW5kOWpPL1FwSVhxMWxncG1wV1lWeGx1U1l4THlDWHNa?=
 =?utf-8?B?NWFYcUlEWWZYQjM0cHdrWFJOSVhJQmtxTkkrRmhvVDdUVzkvUWJoZ3FtNlIr?=
 =?utf-8?B?bnowTkt6QlI3c1lxRVY2NDREa2EwMDhMY0h4Wi8ra1kycExaZldUUUJiNG43?=
 =?utf-8?B?Um94M2ptaUk4T3Q4RW4ySytTNUVrcWVnbGJqcm83ZkFZWHROT0d6WStDMEU1?=
 =?utf-8?B?WFpiYlNKRjZkaTZqbS9vUW9hbkJVUG1pZ3I5MGpvbFFSL2VrR3QwWllXV3hM?=
 =?utf-8?B?WUFlL05pQnBPbFplaUFQWHJWUEd4MmZ0ZVR3cjNrTFZHOGsyeWc1Z0srdWJO?=
 =?utf-8?B?eCtXTFV0c3BOTmtOTE1FSlg3RDU1TkpNa2ZxNFBKL2ovOTd0alh3SGVGbERp?=
 =?utf-8?B?OXlFc2owUjNMUEtGSkpNbzBwaStKNG5KVitRUDlueVJ3dXAwUTN5bHNzS0VT?=
 =?utf-8?B?a2pxNTFBdmVHalFmRXBiWElNSVJYamIzWUVqa0N4Z05zZ1A5RHNrbk9sUHNs?=
 =?utf-8?B?OWlIakQ2QUJQOFB4QjFOQmptYUczdVhveEtlOWszUUtmUkp6TFdYMFd0VGpz?=
 =?utf-8?B?d0I1Z2RCQzZoRDJDKzNvbGlGdS9hUHAyY0ZVUktsMExIbVhpdzF0S2tuQWlr?=
 =?utf-8?B?QUtUMENVTGdhTkJ2S0V0L0FRYTRISFdsS2FuemNXVkN4Vmo4Tit6RTB3cUcx?=
 =?utf-8?B?SXNQTDd6VG9oVnVZdWxHSmVwZmFRM1dXNzR3aFRIcHAweHIwaWJsVWM0QU9u?=
 =?utf-8?B?L2FvaXUreGNCaXRaVWRZYnJOalNlTWJsbmRlRDBucFhsMkREQ1ROM0NjbGRP?=
 =?utf-8?B?THdtMEFOVDBsMjl6bUhTL3RmVWlrVmlMQkRqdUtqaTVKOC9YS01taDQ2Zlhx?=
 =?utf-8?B?cmJwZWIvMVdDVDJJdFlZMndBZ0xncVVlK292eTl0UFFZOGFjUHNyZllsaE5h?=
 =?utf-8?B?NFlmUjZ4YVBoVnlkTXEwTUR1U2NBcnZINzdvNmsyTEJldU5aTk4rNWhYdXNL?=
 =?utf-8?B?U2FIc3I1K0wwWHQ2U3lqSTZ2MTViSlFjWFN4cUs0RUtXM2Q5WGJzWXB1MGRR?=
 =?utf-8?B?eFRpVW5VSS9uZnZlbjc0cTh0c29jdkwxNXVGdEVNNTZjZzhpbkIzdld5YWN2?=
 =?utf-8?B?S0JxSWFJVm9iUlM5Wmx5NjRpeUQwc2NOTERPTmdQNklZdm02TXEzcjJkUHdh?=
 =?utf-8?B?REpUd2tPOHQyMXcwYzdRT1RzVTlKZ2MyV1E1blFSUlRIcjZjMlNBVUlUNDZ3?=
 =?utf-8?B?aGtCak5MUzVRWERYdnhibXdSNXJrdWVBNnRLNCtSalVYSXFPRzNZNmRYQ3Iy?=
 =?utf-8?B?eVYrS3Z5aW9JOTN2dVdNVzgwbjNxTDh4eTg2Z2NvMzVGRDI4L0FBai91aHhs?=
 =?utf-8?B?TFVZS2hvMExLbExrZjJWZ0ZnSE5DNkdGK1RnYTJkbnFWUEgzZXVadz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935637be-7d4a-4c08-c0b5-08df43a9ad80
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:20:15.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vyjR1GQTBgVn5RjfV+mJLzE3Z3stIhOYCySCgKqcmXNApKI8CJJ/RPVzsxz7Zrfrw7CtztUSxB98ji+cEQHtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7507

Hi Neil,

Patches [1/6] and [2/6] of this series add a new SMC command in
meson/firmware, which required by the S4 stateless video decoder
to load the firware via SMC.

During the review of this series, the media maintainer, Nicolas,
requested that these two patches be merged first, so that the
remaining media patches can proceed on top of them. He is fine
with either approach, merging them along with this series, or
splitting them out into a separate patchset.

So if these two patches look fine to you, an Acked-by would let
them go through the media tree ahead of the rest. Or we would
also be happy to split them out and send a separate series if
you think it would be better. Any suggestion or review feedback
would be much appreciated.

Best regards,

Zhentao

> From: Zhentao Guo <zhentao.guo@amlogic.com>
>
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
>
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   include/linux/firmware/meson/meson_sm.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>          SM_THERMAL_CALIB_READ,
>          SM_A1_PWRC_SET,
>          SM_A1_PWRC_GET,
> +       SM_LOAD_VIDEO_FW,
>   };
>
>   struct meson_sm_firmware;
>
> --
> 2.42.0
