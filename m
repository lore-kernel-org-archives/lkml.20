Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323001;
	b=fGn6LQ3sQaUFQ4xtdFAUL1IYEvMQhGr4V4anFfHTepSEmHjTGv4juLp655Qpf1u0lqZ7
	 P5JeVnoNz2IZA5q87OSX69r9FzF5XDUV4jPEtoNrBrztOHlqLxNXzp5g6cD0C2chP3XcL
	 hvXcfl77ZeUSdEQB9pk+2xK+ADCMORaK6muirqZa23DAhJ9zZf2ArZaYrXHakDgNHsLLl
	 8T2fjrAStPF6BZfp4+kBJnADlwAKdZXvr2gyIGcQuXmEzOkAbHRQZsbodz6Tt9OLZt+6g
	 hKWWUKOvo5M8A3LCn4oTquSz7WbSlExXtwukTYgf/dai69od1cSwneHCCM5RdZIXeRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323001;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=bsEE+fcM1uzq7v3S9IQPUiTfzlaVsv4y1AIpluHnpTA=;
	b=P91gz4uWhdjj0puSctGr+JCT6kM34/MVtDjETD/I9tKuTT6WVtk0tmckM9U4rYxZQ3bX
	 DgWNQN/rz/K6Oasmh+Xvzzz/+K5iOebYL1eOUvnGui3a8v3JtI0JRAMkUoyQAgDCfBMx6
	 yQ/RkBcHNn8D7bWiQQ3uchCrH5USrT+DFRrBiXjsfqC8uCDgF1fWtDc6fA99B+GCtEGHO
	 S1ChVFRlys5iFX3XHIGoIgFpRVAi7zJh8c7a+KSIPD+KHDW4WukE0FoJdU5kniULgJa7d
	 x4E0hSQg9pfc/QwX/Kp6Ln+ZVRaxsekxNE6zM6XKkXBBjiTpoe6nIbnloNOeUIa0HdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ww0OjLyn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.62
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013062.outbound.protection.outlook.com [40.107.162.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D549F60A2622;
	Tue, 10 Nov 2026 15:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D549F60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ww0OjLyn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHpjSJF+/IgQqQ4b+qABF2hAe5rB/LXn9PksWve2W4/w22ly7nscc5rq57mrIvApuk5HTyxBoBpX4Rcx3qOZTIxkwCzZUSzUQqBh5BJukG90ZghTEHPG1/2wzq1V1ADGm0Bo4RNQpasHgLU1kRsqbwBpAYaUf5CZjnFH1p71duSm4E588dJvpaoyb+LFK7cuv9h2/+eivano3OY8+rov4p4et9n02K0hIWumFEpAAxrHowTztEc7UPZQZeEOAKDs5miId1Z64fuRkLCQvK8/6cbV+A/TLPoFsK2pTQVtcQRdQ51e9OoOSBzr+hYW1AaOJsh7o3gLUaO7JWMFRO37xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsEE+fcM1uzq7v3S9IQPUiTfzlaVsv4y1AIpluHnpTA=;
 b=aWpehJATMbh2p/7Y4wzy9Ln91MuvNC/78uI+3AZ4gzr0ffr2eZjn2mRzuJEhyHNDjb/cdr4mSjCfDA8BN8iWiftOq7zdnyXK/SdgBwItldg461txWW3GFreA43JKPKRECVjmtY2n+rMI8LOPEwAhj4HMyOUrti1qVldF8gV/EbKd4OKirj9gQaROBB6c57UbKAlNDPscYecD+Xpxrl8n3WMMx2e/81boxLtPMudvjiJHK6XTbxmNEl8AuEc0xbnccCElgXG9hVDHs80tpKsTM6qLqOsprF0Q6gf0REDvnCXenU31q9D6sCOiQVESI4WNS7fnPtbvfzOFtcElXa7gLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsEE+fcM1uzq7v3S9IQPUiTfzlaVsv4y1AIpluHnpTA=;
 b=Ww0OjLynxnQ5XMWnCT19CYnJ7bHLo7LKuafu1xVBojTsApltksi8OLtiRJRFd1jDes1UXKXlcuANrNTaGJBWICf/5qO+qLeC2jCG5gEfkbnUSSuHRZoCOI23InV2TkTm4pI1wvOkzgGQhIH04EKcZWuSwTi3qMsp6FAfRATfaS+JdFnLWAihXHXJPmC31IPBzesGYKw8sjBabCaBv3x4XpxAwyPdQD3Pu7JaGiHmtU7U1kV25oG+yOED48OuDjwnQ999BUwxx+p6plxXo3xK+ZeFJUY4HWYqP2mXgWqHq04jYf8mAW+snvvnDIaok+2R4GQBc1DtLaf4EJgUXXcA+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM9PR04MB8414.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:03:17 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 15:03:16 +0000
Message-ID: <4969e7d1-3e6c-412e-bad1-6bde149ec545@nxp.com>
Date: Tue, 10 Nov 2026 17:07:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
To: Lukasz Majewski <lukma@nabladev.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Stefano Radaelli <stefano.r@variscite.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261110150024.1530988-1-lukma@nabladev.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20261110150024.1530988-1-lukma@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P309CA0004.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::23) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM9PR04MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: c50acedf-6801-48a9-eeb3-08df3f3bbf85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|11063799006|56012099006|261021121427099003|261026121527099003|10067099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kgjnkw7t5Fl6LAYM+LxwPxBWBvjQuKvD3erJRPxXTBLGS7z5nG9WzZ/mEBP+Jll9K+Mcj8STWWNuwduBQyMEBepoDtG/840Q5tFlNxhTE9ZnV4RCB84EEZrKj+CbSSffoY6HDZI4bncNFkK1sLEKxnHB/mHm+mVhC86nKUGiZaBGhEs/OEmvYxQyN7bZx6ZwruDP49kYAA3j6WrAxMKmOPkvuUei1GFE5VcvsVBxFCiFEfQS44lkduos7PrX7Qy8/3Dxsyw4Ry/6qIxtOCn94s8txoM8fC4566bD+dlllSrasnqxtKS2wQjFHrpPqurjFzKx1G48APirJ/fmyhHjCdNRtgQ2SiF4rJ+dvkJoF2fn89Q2fFEm0dM4/qEriAcMC/QBYYMD07FMrBJm//z2sVWa+Anpob70AzRgSnP4lAgaO+bzT9SorAgMdYiqK+YuWtNK2t4eQzZ1//7rORDAfjjbiFNPG7X1ZQCzZGLv9nFhJo8nis6lue5dhMekYbYIdLwN4D+wxl9lje2sO6M2qU6e87owtNM2BK/YcdsWULsJQZRYP6k0Y51fJxNSA1W6oYkwgKkyGx9UfKUJaFdluexbGV3dSlZKC1P0daJJA1QX28ZWVmN1gqDkOKnRk9lT7605BzxwrZcPPbW72RZNFYWfNhjKcSGBfw5dyKHkd4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(10067099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3lTRndXUmxJYU5oS2IvLzVMbGFESXlaOVduYlNmNHMwL1NYajc2YUpwNFBJ?=
 =?utf-8?B?UEJrTWN0dDVHdklhWGtkL3lmVjhMRTN0ajJSdGpubUxka21LWWRtcHp3a2ZH?=
 =?utf-8?B?M0U4RWRjMGM1aWQxRDR2K0xHQTF6MmtOZVBWRnZHU09RdXBlbHltRTNhV0dn?=
 =?utf-8?B?WUJWMWc4bFlUeFRyR0tRVUM4cEMvSGZnMmpvYWwzZjE1Q0d1SkNpZU1wZ0tJ?=
 =?utf-8?B?SWwrcVNrUnU0YXhiQmF0NElsL2IwanNNOHJ6aW0wSmRYcWF4TkgvOUpWeHoz?=
 =?utf-8?B?cWxnNk1SUkdWUVdFNFM0VVlrNThzQ0hNMjNKZkVaOVlFM3lmTnFYOExPbTZj?=
 =?utf-8?B?bU0zQ1hQcG54cEdKVk5TNmZLUmtxNjFPbTQvK2tPbityeTNpcmI0SCswN3BC?=
 =?utf-8?B?R2k5dkxGN1d6NDY1R0lEU0hoZnYyY3I5TmdRa2ZDZVNmNUpHemtzdFRtcFNC?=
 =?utf-8?B?V0J1ckVIb0RNeHRKRTZBRXJxQ3JjcmFXcXAvYzUxV0hjY2NPazNKTjNyNnRO?=
 =?utf-8?B?bGpxdEMwV1liMUc0UHFlMDF0ck9HYUNZYjJBdVJNK2lyV0ZoUExqVE0xVlFu?=
 =?utf-8?B?b21odkI2Rzl4NkZ3MFROczl3blJXbkFaWUZ0VWc1MkpiQ3NqVWtnZXdtK2Zr?=
 =?utf-8?B?Z2I1ZWZzYW81ZmRodjJwWnJ2QlJTVjVSeFNXOUpGOVBSa1lLcHpaeVZKUVdO?=
 =?utf-8?B?eHZWNVFCRnRMMzB5ajIvcHF4a0hjVGkwbmNmOWpxWmM5ZG9teDdhdXJjV3NR?=
 =?utf-8?B?RTVKWlVPVnBuclhIL2RFWVhnRXpiQ3hmZi9taFJpSmg0cFhleUh1Y3VTd2Y1?=
 =?utf-8?B?Z2pyN3NxZXFqM2RyZ3laQ2lZSVZCS2dFcnp2QnY5Vy93UFlVZzBuV1g4TnpZ?=
 =?utf-8?B?R21tSnQ0ajB6elBqb0RVSzVQaEQyTjQyVk11RHRhOTRtdGV6d244WnRML2Zj?=
 =?utf-8?B?emJmZW45TGN3aHdmd0NqdUxZODBOTUNlcHBGV1I2WmFRa1JrSXY1Y2tKb1V5?=
 =?utf-8?B?R0ZJZm82RGc3NGVCNlovZDBSdWVNcDY3bVlaRy82a0xmQzNiK0dzeUF1S2F4?=
 =?utf-8?B?T3VIVlZCb3UzdTM3M1VBUDRCdlR2all2THd0UXlNeXpkdUtSVkkyNGRiMjlk?=
 =?utf-8?B?aUhBTkFCUXc3WGhoSnJNRi9LMWZLcXkxZmZVMGVuWGZUMExXR3p5MFk5SnlS?=
 =?utf-8?B?R292SlQwRTRhTTQveER4cnc0RWtQUDhpS0k0RlMxR2ZFWHI2NG9jWlROR01r?=
 =?utf-8?B?bmVtRGEya24wYTVWTFQ3NlFOTEdsNUU0ckl5a003RXJvSkZheFNjcUZUazVU?=
 =?utf-8?B?OWtpbTdpTkNaYWwrUGpRcVB0VW9jc0xqUmxFTVZ5RFRsU0tXeVhKUGRXV2d1?=
 =?utf-8?B?REVMbWRzOEZFNm9UWTZRMGxyc1pXeDZ2UVIrSjlMWEwvVlZoVkIzYmZCU3Z5?=
 =?utf-8?B?aWpydkd0MU1vUTBzWk4wUWRWSlh5V0x3Nkw4S0ZrY3lYSmN0dkRuMkxHb1ZI?=
 =?utf-8?B?Ni9JbHJNdC9jUC8rY3M2ZkR0OVorTklia1RrUUZSRnkxVnI3ZG1xVXRPY1JY?=
 =?utf-8?B?bkhOL3FIQ3V3SnZSRE9lSE9Pc0JWeFhKamZaemZCSDhrSnpsUWVVaUl5NlJr?=
 =?utf-8?B?OVl1RTRxMmljdDhMYzZxaVFoVGxUeU9mVys3a1Z1WDBXRkVqcUxqNzRVSWVj?=
 =?utf-8?B?ZG5HRnBEQ0U0TTZIS3lkYlR2UU1zVGF1aXdIa2lXdERDUGV4WStUdTZ6a1pR?=
 =?utf-8?B?Qy94U1lGOUg5azY3RmRjM3VqZkIvbGZXdVp1RWlmaXZOc2xOZllDU3YwbVFQ?=
 =?utf-8?B?dFNmUlp4SDQzYlNkVkRSdDkrZWZjaEFGSUNyZmhSbjJZUEE4UzZiSmZsMVgr?=
 =?utf-8?B?Q3JhMDlGaFdCRjhQMTdFZFhjUld6c01XWnVFaXA0MWJQUGRTNHBCWWNGcEtj?=
 =?utf-8?B?Zy8yeDQzYWk3TmhqL0ZyU3k1TnU0MmFBSEJqTmJ3Ni96cGZGSzg2QjdRS1pu?=
 =?utf-8?B?U1h6dEVCNE1ZQjBYaWN4anhGTkNQaVM3d09PektvTEIxblF3S3NLOElENDN0?=
 =?utf-8?B?THVUNVRhWDVRand3d2MxYnJUemsyTGgwQ3J5M0dnc2x5WXBEdHhhRnNYZERt?=
 =?utf-8?B?MllyaHhaT0szYUt2eGZINkhVVWJNK2wwaDR6OUZNaXFxNU9RMFZLaFVFQi8v?=
 =?utf-8?B?QmlrUnQwRExLOTFtdEpaTytuQWdFZ0t0aGczanhOT0FQODlvV3BuY2s5NzFW?=
 =?utf-8?B?RHg5OS9UekIyQ2h3dDVMT2FQaCtQU3owdmJqcjR1QTNqb3BUbnRjVkU1MThF?=
 =?utf-8?B?V0d4ZGkxT1RNTHdpL1FKZ2JwQVl2b3VrdWxaYzEycUZSYmQ0c0NDZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50acedf-6801-48a9-eeb3-08df3f3bbf85
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:03:16.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH87ZB4ipi2EyKDvBKC5oqqSqtB01bo2sOR77wTw9M10U6jT4MVK209kMCLSMH388f5Eqw7Eub6lRgnjzgCoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8414

On 11/10/26 17:00, Lukasz Majewski wrote:
> Add an entry for the i.MX8MM Cloos CBASE board.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index c8290a83205b..3aee85026f6c 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1102,6 +1102,7 @@ properties:
>          items:
>            - enum:
>                - cloos,imx8mm-phg           # i.MX8MM Cloos PHG Board
> +              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE Board

Should we sort this alphabetically? That is  cloos,imx8mm-cbase should be placed before cloos,imx8mm-phg
 >                - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM on MBa8Mx
>            - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM
>            - const: fsl,imx8mm

