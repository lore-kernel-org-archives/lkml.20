Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686848;
	b=XYB3qerZzLjt/ZWMZqxNfZ8YHqTRoOoO/GVDHbZ59/B+ERtn1ZH3sgzK4/pwcB2TArqz
	 Huwb0ijxxMakYon7JsPJBu9mCB2NEhSx8dH6yg2R97HydM1+HjLGNc9zHRt6wadBYsfM5
	 ZEs5UNebXdpXIDpRoX4PUsjiLg4I9c+p++HZnp/tPdN5+zhxuAeHo1pJi2r27exsA6641
	 cTDWTJg/ZZFLGGxCP6UtusSnwUb3pwsteusphgo7+C2meL/2eGDiWE/s+qi43atxxTrn8
	 VZdl7gl9yBpJDlwhoW9m1gPv3tqu3/WL8DxPuwLZ7SfhGtwBRKhqIHMAJo4SKQ002OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686848;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=kaQNiFuTq+VHuJT98ndkdbVs9pf8GOWc9/zeRyNgX/8=;
	b=ImGvZpD3IwAGNUPWjFZTAfKvaCLrl8zBUqhHRfiM0SwPIV4TI4HFKU0QOkHbsavZQ+bv
	 eE3rt7tjvVrGTA9eqI+lPHOd2KLtpkpzel/37agsSEAYH1JYNSPT1u8PIg/LraKwv05go
	 E+OMtwPG8vKIx0sJaYLrm9gLCWIWIO8lLnFqRvgpR7vpcTSONqY+J3zzfM1CecUXAU5p3
	 AL3uIb/w+b9OaY5y9jDo8SelJKOhytuUUvmmr+TNEJoIEvhChiMcKubPMXpSwluJmWkMv
	 3JHKBLJ6t7jC7oNM8dL5nJQVoz8g/9+1KNFj+jlvg+KAitOYpTWxgaSjffFCcDOwfLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=edAZVYY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483D606D810;
	Tue,  3 Nov 2026 06:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E483D606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=edAZVYY3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTDyittc5Tqna81PsdDQhHIM1Mz5YK/N3VxDnT2tYHM3Ekp5oyntWSxWIi00rlJBWtekzHXCSuELC+rdIl2Xfgg8d+aKxZTOtJn5wme4nDy8l3IZpdRGDWbW8O3Zv+XPJBLjRm02pIao8iEx8CPt3Rj/84nE6JTooy5FMlYCDehz419XoZXmHtp980/jgr6RyZsi72iqIlTtTQjfWhJAbvZanJNmboNwSkUJh9I6n92/ebvjbp+R693Mfjn6VqukMwUm5mCYdNqwyldzCzR7d9Wft6tdoyFPsExQf1sBOq0C+LXlhciLphqADVMXS2a/P03Drz6780qHjThkhJJJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaQNiFuTq+VHuJT98ndkdbVs9pf8GOWc9/zeRyNgX/8=;
 b=GGw2GGPVRHkydho1m/tVIY8sT/7OBWEeXC2IOXAemHDXUrBa/WSw3PXPzTfjjkU1TsobhDUCSyvohbXaGosyyYu5XCa1zalsHY5FIsrls7LDToQWhc+WXF7GnfZzABxo3MLj5XrUnGgaYPnMFZtov8RU7jN/MoVSlKda1Adfp9581BmQfWYtlSW2a+5HP432gzdoJ7QBJlTh6gNZmR8YhZ07DAQ6zxt7MKf5UXbGAH4gzxVzISdO3lSQbIjbcj5Nnh//SeBzsUL4B2O6W7xr8cBfQxymvaFLEYyT5iBRPDKAYX1Rnk3JGAYgMCyS+wvsS4VAgIZq713IEEPiHbcs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaQNiFuTq+VHuJT98ndkdbVs9pf8GOWc9/zeRyNgX/8=;
 b=edAZVYY3OQhnS40DlecJFoB4YEy5PofjSwYcldGw/CoJ00eWxQIASAmNfxNPvmD3jSdqp++IOsiTGSpgDVKqrxXBzEf+iHVAEZo4NHTjWdEauLsOCloIy3TQJhTp0WZQSdyDILeyZln3+oZ5PcDnTAPhfKS5ZdDzTp6hjTqIXyKBkba1kBHBtXSMfzsmYoXSE8wRMqK5nhdihFQyAPLvjagccGd7/qBVp+7Aj8dG3at9kIbs6TJ+wqThQ+6u45fWPpjL/4/Ch29a8+QCothtpdeVmnOrsnN/2H6HCglDxLz6dwq6iWsntuXv5TGk8sRxvNBdEvm6ArusDBRlVECjvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:20:44 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:20:44 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 03 Nov 2026 14:21:59 +0800
Subject: [PATCH v9 03/16] drm/imx: dc-plane: Disable plane when it is
 invisible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-imx8-dc-prefetch-v9-3-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
In-Reply-To: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 4939b15c-8876-4dc6-6b7c-08df397297f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|10067099003|22082099003|18002099003|921020|56012099006|11063799006|261022105027099003|261022075727099003|261021123027099003|261028144727099003|261102123227099003|261021121427099003|261026121527099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	k7jwM+8gffyXL4TDpwB6dsAU79fWLkghEWa68Lle8u4qtCS7SdOS8SCYzVbIHifMvPw7PSqq3wQImc80baRz7/XuR+19lu3D/Oz8o35921xUJOJGFgL9GkAsPHJuDHwosxLzv5Lxh6WGdjkczsXvVHt6NOrE+XBuff7KKcDnW+v3mZMSFzEJJ9FjqzXflpBTsmw7G//+eUx4XdW/MtZPThWfHeiIwWAfxg5Pk7a993lZ6rSDfY2T11XV2Jg21lBfsfOX/k/SYvOf4f/B7hDXqetOZTI9AsrCjLHjnxh5wDX9JWfXXJD4Cn1QHg8jE4XxvpLGrWhVFi1+OKBOxv8xd5vF/s/AqTZE1i5pikCqi7EBkNOJQw14d/ZGgk7R3DaUVZlKkZw2MYIFx8zvhp5E814/evoDMNGEvWyLUZUrlBEJx/wurq8qx6JAZmIHsAlX+vYmVQlnu48kzJiOITkTJEE+fVYYxUhxEJ73ew9nf/OWkWdUBCdeHDKmoO+Mu+f2WBh9dsKjWSfwlFj6X1Im4bqnCVVUsOx12i7GHBCek8iwmVh7plxwOM4WiN+FNXvK+q7wsVDgTtka368x/2HgWeKwGMDP8tMUEUrH07w3Acgo5n8IsZfGKijs3jmLc3menshPXEJ7Jdl1BWB0wi70dvIXf/3AJfiVDz3dDTUJqqwBrnTWFbKS424YzsvpdQVVK2Z7H+v2049PMWFADqDq4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261022105027099003)(261022075727099003)(261021123027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEY1blJHK2FjK2h6R0lHcGNJVHh3L3Z4QVJUbXNBTmhiOUtZMWE5N0UvMGgz?=
 =?utf-8?B?dGdjOHdORk1Bc0R6V1pINUwxSkR3RFFqejl0UC84OEFvcUwzdjNaSlFZOHFN?=
 =?utf-8?B?S3dpdzc2RzJFUHVqMFkydWx0dkdJZk1UYVppZ3pHT1R4Q05LazZwbGxWMHBq?=
 =?utf-8?B?eUZMS1dYd0EvVVQ0bjRLOEw2QVNORUYyY3VPV1FUUkQ1bXZud092SHBna0Na?=
 =?utf-8?B?UERJQzIwOHdhdFF2cWcwKzl5Zi9CSGJTQ0cyRXV2VklwNDlhNUxEZkl3dmxD?=
 =?utf-8?B?TFlFcG5abTQwNXdXL1U3MFNZVC9MbHhML0dON1hhdWszcEVVaEg0NlRQRGhM?=
 =?utf-8?B?UE11SWlmUDVoZ3FoZTl2SVQ4ZmVpblpRbjZpclhLNGwxS3BCZUhkUWY2b28x?=
 =?utf-8?B?WWdvSUhsdjg1UVlkeW9GbDhrVVIwOS9qZ0IvVmcrMXBPaVlCRmt4YUk3NzZn?=
 =?utf-8?B?VTVCY3p0OUVrclcxSVRUanMybi9scldYSVJkSDFtdGE4a0RnNG9Hc1Z4NXdI?=
 =?utf-8?B?NUo3U2VNTTY3WGNqSWZBMC80NlpjWGxiY0lwU1dxeWw1UVhHV3J6QXdSbTJi?=
 =?utf-8?B?NGgydzk3c0JSNHRSby95Y0FXME9MQUxxTGlLMXEyVGZnVXhLTWxHZVQ0TDlU?=
 =?utf-8?B?RFpzejgvSVlDY1dlZkwyVFd1alVKUDNqSFV4ZWxhV3FQZlQ3NWE2bG5IajFr?=
 =?utf-8?B?dy91RUlSdmErdHE1ZXM1SE9SUERWMW9lNEVhcGNtSDZINllFeUZ0djBMQyts?=
 =?utf-8?B?RE5acHkrNlJsOEt0Q1h6RXNEQ1FFQ0RBaTl3d1g5ekZ0eU9sK3FHYUMxWUdZ?=
 =?utf-8?B?UEZuTWZ5MkhQazBkdzJQYjJmSDJJVklORzRjVFpNRmFDN0ZQVks5cHFyazV0?=
 =?utf-8?B?Z0NWSThqRHFFczVDMGlBbEYzem9XM0VJVlp6L3MxK2NhZFRzeXhVVXRTb2Ra?=
 =?utf-8?B?MlpaT1pMaVBmZmZIaW5Qak4rOGlwc1pGR1k0bUJReDk4TjQvck1vWlU1UlRE?=
 =?utf-8?B?dzVGZk9LYnR6WjNITzRIUkQxVHc0eHVFNjd2ckFIOXN0WExqZFlUMTMrV1RX?=
 =?utf-8?B?bzQ0aURmLzQza1FPbjE3M0FXbngxTHkvSXdjcmxFOEJtdHJlVmkzdUpRL1lR?=
 =?utf-8?B?aDJOOEVLeFIzR1UwOXBTMXIxL2Nwbk1scHFmT1JTMlZYcmd0czloNUQ1eWtm?=
 =?utf-8?B?MmNBNGVOSWMvNDJOYmZMRGtoYnFJeW5sakU5ZC9KNTVEMHRUZG41c0U3V1cy?=
 =?utf-8?B?UldsbUNjN2FGYTBDbzBpMDAyNkE5anNUa2lMQWRlcDlwWHI5L0JUVis1d3gz?=
 =?utf-8?B?Q3A5Yi9sU3pDYTNDb08rVTJaVitaMm5idE1wclliY09WblBEYTlGN1BNZ1dh?=
 =?utf-8?B?bitkMjFRNkZzUE5LSHZHdnAzSlhmSGtSN1N6NHpnayt6N1NuSUVYY0hzVkJM?=
 =?utf-8?B?QkwwbEhFc3dyQUpXWkVOcm01amRpeWptcDkzdmN5WU9XWU1qekZlZ29kSk5T?=
 =?utf-8?B?SmdEV2lGd0ZvcFAzMFB5ZkxQeVNaWFJPU0w2QXUvcFBSQmtaRTBHVC9uL0Np?=
 =?utf-8?B?aG12REx6QTBiaUlqQzhpUjRMbXF3dnoyQ3JlY3F3NW9uRDNSNXRjSm5Hd2Fi?=
 =?utf-8?B?Y2lSWTBEODh6Q3NYZmlNMU9Rc1pGVHBva0JOOGxkNDdyNFJncGtkMTJaWk8y?=
 =?utf-8?B?Wi9LRlloelQ1eWFiNU42ZlVLYXpnOVBpMWZlZ1BpODFaNlpaVjdjY2pFaUxC?=
 =?utf-8?B?bGJJUzZyR28wWmI2d3J3Vk9IVzhUSTZWa1puNE1yOVpadUtuZ1I3MWZLTzA0?=
 =?utf-8?B?YmZJb0RwZkFPbS93bzNrVlA0djQ1ajVaNDMwMXBKRDJjRFQzYkVDSFNVM1V3?=
 =?utf-8?B?dTYvdVMzeHo4RHNMM3p5cEVrdXdZQVU0b0JqQmRnL1ZuV25tZFh2QUxxaUkw?=
 =?utf-8?B?d05jamVnelhaajdaSjQvQ1hTUVlDSHBSK1RQUEN6REY0ZUF1aTdOQ085RVBi?=
 =?utf-8?B?bUM4c1hEa0pyRWMxNVBINjVqZ3RxdlJ4VUVVVWlCQkYxMGQ1ckgyckJLNWhT?=
 =?utf-8?B?aDhVTytrb3RCcThGK25pQXBTQlVqa0pkK1hBNmYvbTE5SU00K0tyZGpBUVhs?=
 =?utf-8?B?YmVwZUNyWEZOV2R1VVFmMnBZWHZpZUdraHlyeUVqZ2lNdVZ4c3FCNXBHUTVZ?=
 =?utf-8?B?TWlXV2hxTXgwMDF1MXdYbzArcG8xZ3l0M1FncFdhRnJGaTdCOFA4SEUvZlJX?=
 =?utf-8?B?aDVIK2thRkNMWEVzN2Y2d2JhL1RWVVNGeXJZM3JtQ1VOamMxVEpBbnUrUGlB?=
 =?utf-8?B?a2g5WU53bXlmRWZ4dUJmd1dhbllYN3o4SGhLNzdIMjBmTUJqaTR6dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4939b15c-8876-4dc6-6b7c-08df397297f3
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:20:44.8766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLJknic3lXI2uaL+12bpRJlIZEdk4j+GI+S1iTD2YV0r8WnxmrKzd5JABkY1DU+Dp/QSt+LyMXr2uQkvDiQKeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Fetch unit backing plane doesn't support invisible plane because
SOURCEBUFFERDIMENSION and FRAMEDIMENSIONS registers only accept
dimension for visible frame.  Disable plane when it is invisible
to avoid wrongly programming the two registers with invisible
frame.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
- Collect Laurentiu's R-b tag.

v7:
- Newly introduced to fix invisible planes.  (Sashiko AI bot)
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 54 ++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..42c0a46281cb 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -126,6 +126,33 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_commit *state)
 	return dc_plane_check_fb(plane_state);
 }
 
+/* A prerequisite is that drm_dev_enter() has been called beforehand. */
+static void __dc_plane_atomic_disable(struct drm_plane *plane)
+{
+	struct dc_plane *dplane = to_dc_plane(plane);
+	const struct dc_fu_ops *fu_ops;
+
+	/* disable fetchunit in shadow */
+	fu_ops = dc_fu_get_ops(dplane->fu);
+	fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
+
+	/* set ExtDst's source to ConstFrame */
+	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
+}
+
+static void dc_plane_atomic_disable(struct drm_plane *plane,
+				    struct drm_atomic_commit *state)
+{
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
+
+	__dc_plane_atomic_disable(plane);
+
+	drm_dev_exit(idx);
+}
+
 static void
 dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 {
@@ -143,6 +170,11 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	if (!drm_dev_enter(plane->dev, &idx))
 		return;
 
+	if (!new_state->visible) {
+		__dc_plane_atomic_disable(plane);
+		goto out;
+	}
+
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
@@ -171,27 +203,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 
 	/* set ExtDst's source to LayerBlend */
 	dc_ed_pec_src_sel(dplane->ed, dc_lb_get_link_id(lb));
-
-	drm_dev_exit(idx);
-}
-
-static void dc_plane_atomic_disable(struct drm_plane *plane,
-				    struct drm_atomic_commit *state)
-{
-	struct dc_plane *dplane = to_dc_plane(plane);
-	const struct dc_fu_ops *fu_ops;
-	int idx;
-
-	if (!drm_dev_enter(plane->dev, &idx))
-		return;
-
-	/* disable fetchunit in shadow */
-	fu_ops = dc_fu_get_ops(dplane->fu);
-	fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
-
-	/* set ExtDst's source to ConstFrame */
-	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
-
+out:
 	drm_dev_exit(idx);
 }
 

-- 
2.43.0

