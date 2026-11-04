Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793789789;
	b=NMh/isLYFcYJ5JsnSFmwarQY1CNMtMEbZ3UJShd9akcZHy/gWN/Y3aBnxb9BbmG/z4+I
	 Met1u1SFbcVKvplcOZi0Ez17zWuUQL7kTLCqwirztN26lPsJCxu96gUxqXinE4Mhg9T4r
	 Okk2Z5cGatm6YymfTrKXQjRYLggJwfyIr1khPmGnUb4QVL1Jh4FbqOAQ1TbenHHP0au1P
	 SwggDQMpf/Yfjz5Wja/Q6mEhg9Lh/dhqTQt0bEX3x1OLRmAcEdxQlGJUJ7EBCaS6xxC7B
	 SC67aUNeF8nemQ5kebCaC4k/zqFtLaFvCSIR/L1UXbiQjvl34dlT2s9RThGFnP68Jng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789789;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=0s6ikXFts/gAaYGBTYzjKDCvqeJbJwztsQux0lPOKlQ=;
	b=uq0bWaBtCZhU8/P7vVkMikz11QQIdhlcQVBf76N/ALzXJfDLye8ZoUmDQoXjRWkFECyG
	 WUOAAmgP88FKcFwxV0aAp64B7tcVLFsxMmV2Ubni1qVDAKPE1cO4dxhCo9sOroUKNCtWc
	 Kf3AnXmdyb/2S+wFoPB76NlaHcts9TfLRSr6k7YBXvpVeoktKyWFNnCpUbfyHUIYPWp8Q
	 eGZ53V05nc0/+nHeCFQ7keUETX7qQsgRxHBd3tZ7uQnNiYFlO0yICJq25SVbDJfTBJDv4
	 cwhhtJts/TEcl2TWA9vhpJxsIYemH1+J/Pn8tUHCg71j9BoPm+yovdm+8/b1dmNHSdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jtioLBrZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.9
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C304606A31B;
	Wed,  4 Nov 2026 10:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C304606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jtioLBrZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mst2azXalokMOXHfdHh9J9+RJcskO9l9Dp9YggKmktEoMGD0cjP399LcRR2vi8xOvKwATchbz5oa6VdF0s6MwnldmCFJeLOxmo1nd92ZWwX1yT4nf8GERk8LuleglTWqYud9jPhzZu0lhczPYcA7cxAQZuoLRYCz0wABAJqX6f8JQoAXx+y9KSdrDch3DdBZ0hhbmwfY9P56hCnQcJZ0JQWRaEKAwDeEvjUVgcCV/NmPUynXfK63DQe1VuVGz8ugp0/ofX6TqWw635cZ7DNxvFwOSWiT+gah23XUWWJrDFUpuRErhhNGvBx/ntn09AKDghrpr8H7cCuQm/cJrTQY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s6ikXFts/gAaYGBTYzjKDCvqeJbJwztsQux0lPOKlQ=;
 b=N0MQK+ZdxtStl48al4AHOAVk2QZ28fKAJJgmUXKtRhcJ4PUg7kfxO5tCfd7NpF/zGI5WtqAww/pLIwl6nKfa/VBC0P75YOXRT/1y2obomeingwxGE/3fvzLfU6JDDJ5UD8uYR8iO56P5hKWltzTwHhH2wdkce0AxtzcG67a0aEw0rXiYax54+PcSbSO+FmOU+4UFdmfX12ZTVzwEE7JfCooQ8XgWF8uskp1FXtjXj8y5JMw7mnIiYgv4Xi/DJb3/xHevFO0JugV+3vtWZXdQXuoPdGR2e8/dPCRjnqE5iOgxem0A4mxtV95vjN4fn7FmleonY5m4GQ8eqqUda5EC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s6ikXFts/gAaYGBTYzjKDCvqeJbJwztsQux0lPOKlQ=;
 b=jtioLBrZuoV2jGtL0XQBC1SGV9fQ2/2QEk5jfb5kGhLfT38qO1M3RQ/aoEqhi+JxGsmteh0Po+xxihUyAGf0BjLgGkkw6r20mNYijdbLNw/iCkCLPXc+a5PiUxhICer1ZGw4CxVIgis/I5XpvJ509jDMef6LPkXZdnypFvdJfZA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 10:56:25 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 10:56:25 +0000
Message-ID: <19d9107e-1a85-4435-88ba-9e8664a1fa5f@amd.com>
Date: Wed, 4 Nov 2026 11:56:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916204509.166633-1-marex@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260916204509.166633-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 544cef15-6eab-4f69-29cf-08df3a624535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026121527099003|261009223027099003|261102123227099003|261021121427099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6jKcjWYrI19oSzao9/w7ahkHhgtkHkxeoBFO9CIYuSj68k0aauyHWVL0kD2Zcue5nKFS+DBcg1M/yyR8ZAeaIU3I/VDBX8RnxQIw9+dGZhB0ehPVsWEXANlrzkZDEUJqbIOPOxvgoaZEGTiB6YkTVW4Etq5nuLZnkyplCYsy+neA8rNuZc+OFCHJzG5LreOKwovNXHGkDo0MGyLlYByjYxtefPcn0M+JlIJuq9bcBML5yuMvphs2bksu3+KUuJqhyPKfn8RTgNvM4hxjelpvkUr/NkIcmsJnpv2gd4r3SZcNyXeggt0BQ4ZqAGkiuSXiTLy1C4QOmAWOexVvmj6PWvSedcF8Mlg4bEo16Ly7+YBegDPlTA4+54xH7zVYc19SJTKl5MZjjYSvFGFPcZ1z2meVVbhOS08smKEpYvKcqDDBhdneby9CT7JZv961CEUPpVcHz/3sAAfKgszDPLUt1ns093JkOMHws2FP87g9mZUrFkCqcSmVsj7UBrZyO/mYdCIymfDVufak3vqBaM0g0m9dgNNOOoXw/S3OUMVlpSoXsEDSjjiESfFgcxNkzj9E4jUeh/qGh8xuOEM2lX2SqUWbVLlIZEayX9rurs2y4BqvTSSywwgHaJKOulNc602Cgaau5S+1SUdJgbCLZwMYuXnbaPkJNNzkssJuCdTM6uU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026121527099003)(261009223027099003)(261102123227099003)(261021121427099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWg2ZWpjOGxqR0RZYlhMdkVYeS9YOE41V0hXajNDOTM1WXdRMWZFandsVmox?=
 =?utf-8?B?KzYwVEEwNGpDNnlNLy9UOGREYTc1d1ZSd2g2a09nNTY4bmZKL1BYZXhJc3dv?=
 =?utf-8?B?Q2tjKzBYaEJ6aDhseWhjNEpYbEhsYVI1OXJ4bkoreGp5bVhuV3lYSXVGUlZS?=
 =?utf-8?B?M3RaOVZuakdjUHJKSEttcHJHcnIxM3l6ZVByeGNaekszQXF4SVFhNnBnZkpI?=
 =?utf-8?B?UEtRT3J0SHZIMVg4eUNhbkNLYU96L2Y4L0ROQ3NNVmt3Q1Rwd3pIcmZXWXFW?=
 =?utf-8?B?bm8reW9HZUNBMmdIVzFQYUpnWE5MSTJLR3hQdnlWTDVqaUJSbmJJOVMwQUhC?=
 =?utf-8?B?MHdzSGsvT1E3MW81NmF2d2NKUDBiZkpSOGRWT2syZkIyQ3VGMjUrMlh5TzIw?=
 =?utf-8?B?eGovYzV3c3k0TFYwQVd0Q1o0ZDFpdkE0eUJLY3ZLSWZyVXpFbGN1TGppejNy?=
 =?utf-8?B?aDV1cXZJcVZXOHVINy81S3djbmYvTlJGR3dsL0dTWm5IRDRpSVZmTm1Hc3ZX?=
 =?utf-8?B?eCtIZG13VDRML05ZVDNzS0pXZUtzeTVkR1IxSkFBc1VKNVhmRTh1blZtRnlv?=
 =?utf-8?B?dFZsUWdWVzlKdlMwUGNtNExwaElYM1dmM2VlSlUrZnFHQlo5SlNQMkxURkc2?=
 =?utf-8?B?TjUramwzaTVLNDQ3cVg4TDE5blFicnlmZkN2M1FVeEYwNEdJMmJmaG9VV0Jk?=
 =?utf-8?B?MUQ1cUxHR2s5UTNEdVY3WWlSOVVPZzhUVmRvWXdSY0JoOGdGSG9CdmRpUHpw?=
 =?utf-8?B?MU9NVkg5bUs1SUpSajl0eEZVd2hmUytBb1N0ME9uYkJNNTVNS005UVpPQml6?=
 =?utf-8?B?RjRoZWlsZTZQTEZLeVlzYmZPcjBjd3pLTFl1TXdFRkx3c3NuUDFsaEIwcmll?=
 =?utf-8?B?OXlyRTNrSmFlTGZyYXF5S2NYQ0NVa1dPTHVlQmQxNkdHQXhPM2NzY3R4cGdm?=
 =?utf-8?B?NkhFSEhpSTFhZ1QyaXRjR0tGUHE4Ykt5V09Rdk9iZTVpSzM2ek9hZjNKcG1r?=
 =?utf-8?B?WkNTSm1Fb1czcTBqK0hLRmEvbTN2Z1FtVEN6YTFtTTJLWTdQcER1R1hlUHRu?=
 =?utf-8?B?end4amkxYWY0QkJSQUU1WjZxOXJKOENqS2JnZUk0Q2dnMmNyYUFFUTQ0Z09q?=
 =?utf-8?B?U2V3SDVvWVUzYSsvWk9DTWZHSktEbnlxcWQzc0J0ZTl2MHlCdkZZSnVLZllD?=
 =?utf-8?B?bmZET29aZjVrUWQrdzZKcG80ck9IVUxEUmwrWWtXaG9TUHV1UmpxUWVvVGhh?=
 =?utf-8?B?QlluenFCMWkrOENqaEU2c044bm8rcC9qNHpQMTdkTzBkWEFrZmxJd2ZMWTZG?=
 =?utf-8?B?T0dpdVRmam5YWkI4UUpsWG5wTERoN3RGTWxGbFd4d0pPMCtsOTFzTGIwNERz?=
 =?utf-8?B?V3g4bXp6dTIyaGRGWWcwTXJPMkw2a2xWNTQvT29sTTJ4YWtIZ2ZqU1JYYmhq?=
 =?utf-8?B?K0dtSGhPOURKem9tSkw4NUs0dm5CeHRIUlk5NTBYeXZTbzJHd2x4RzlsVmFM?=
 =?utf-8?B?ckd1Q0RkK3o1TUVCUUJOTTYyZVhpVFFteHhqS3dDMDRSWWs5a2hxNFgxVUlR?=
 =?utf-8?B?YVljb1VRQ3Y5aUo0ZTZNL3c2dVJyT0czNTR3dHZoMHAxUnp1MktWT21NdnRz?=
 =?utf-8?B?ZUtzWWpMRFBPT0x3WkRUMDBwUDNvYTJDS0lWZFB3cWFEc0Z6eDdWSGxIODVF?=
 =?utf-8?B?Vld2eVBMTTdmTGpQMk4waTdoRFVuakVmWkJUbGdKSVpiRWlHTGU3YktqZkxV?=
 =?utf-8?B?WGxCOERJbGJ5b2VtMUdTeE95N3Q5VTNaQmFZZm5sSkNxcG0yUkJuTVJDTGpG?=
 =?utf-8?B?bUtWRFNSZEllVnVTYlFoUmtvUDZ1Y2J3aURSdHQzY3J6Z2xXYVpSQ0o2TmVz?=
 =?utf-8?B?aEFMa3lvRXN5QjVZTDRVbHc0Z09UdmRreFRReDIyVjQ2bS91TnZFYW1qVDZF?=
 =?utf-8?B?eHIyWWVVZHNINkI0K3hNYXl1cVpaRy9QSXhlSzBONmVFekJVV2ZFZk1YVzZG?=
 =?utf-8?B?Q3NMVEplK08ydU1hRTVpT29uL0tsc3VYaEtkT1JHZVhjY1JhWUZRei9jWE5K?=
 =?utf-8?B?Y1dSMlV6ZU9PMlZPdHIxKys0UVpFWkp6a3FEWmdnNWlRbUhLK0w1OTFCdmZz?=
 =?utf-8?B?RndmaWJaSk1EQ2NSZWtMWGZGekxWQWZrUlRqejF1ZmZ2VW1QVGpsZ2NFV3Ry?=
 =?utf-8?B?ZTc2ODl4YzZYM0VxOXExeW9OYzlFaVJxM3Y1Z01wTGcwc3RxUm03RmdscmF3?=
 =?utf-8?B?T2VnaTJjUXM4ckM4NkRjdG1KUTF0c2NkOFRVSWpvaFI4NWIyN1ZEUjRBaXZP?=
 =?utf-8?B?bTg4S2lPSzQ0Zms1VzBCTk15Y2o4NlFpRGFueFIwN1huQ2k0Ry9GZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544cef15-6eab-4f69-29cf-08df3a624535
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:56:25.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/TJsoPKvaWIW2RsMummJ+wReCoDUIkNEYqC1bn+8UK5pDBaRTaZ2hMoZHfUACLv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946



On 9/16/26 22:44, Marek Vasut wrote:
> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
> The board is populated with four ethernet ports, QSPI NOR,
> eMMC, UART and USB host interfaces.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> V3: Add AB from Krzysztof
> ---
>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> index c9f99e0df2b35..49ef4e0c68501 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> @@ -44,6 +44,11 @@ properties:
>             - const: xlnx,zynq-zed
>             - const: xlnx,zynq-7000
>   
> +      - items:
> +          - const: ifm,zynqmp-vhip6-evalboard
> +          - const: ifm,zynqmp-vhip6
> +          - const: xlnx,zynqmp
> +
>         - items:
>             - enum:
>                 - xlnx,zynqmp-zc1751

Applied.
M
