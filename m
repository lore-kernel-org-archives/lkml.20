Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793907412;
	b=F/ckwOKYlOwSrS/oRS3OE1UVIvgV7GBGQlpDBAAPWziXjovuo9Y54BLjomeiS1/aQQNZ
	 WgugIBi/9azMOuX3UuvDEvE1YM23Y5Jp/YCwouX3vr6CVKCZXWZbQd+LTv2AAzaOLSCFi
	 /CbWvGBVkov6U1BmEyil3LnyysuO/hjWTMLKf9eUVzG/RK+axgbOyYrZA5YX8VDh7RuRy
	 Yh/vkFfq9IZg9IvDclbdlv/Xj1gfiiLOIVMJ/Zd1p5Jm+thm6nDpR0nRlCfPEqZRcDu3s
	 qtFh9FCR2XBzyv0YdZ/wGDY8+XpM0oz9FtJdSNi9QH5N/GllRjJ6yn6NbMcU2ELW56A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907412;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=Y2FJrGPfuUHo1DXNzVvrATlt3MI1C6M3KdeQ9bvcXPg=;
	b=JDaWH932x7zVlB0+WNPD5I/6W0uqnUle5ouljZDLto3v38NhTQGu9tzct6px3G0Zue0u
	 c++CmEATT6r8sTOMr7KMZlutCxh/v3T7T2u6oIdTXxtrA173vELeg0GKlsmvu1hL4ge5M
	 //+sebQPWrDFtOR8i1F5C9LIL1YavqO/P5n9QVD+ewKtKOs74iH1qDoj26k8yXV5sUnYH
	 OLJ82Em1AujMsizk1JM2MDAsUJlxrpWMuvXImmwfS5p/2VXtiEG7wxu+8UPanmPl7toLc
	 jaEZUQpCaDLtqwreA54jmf2IwYYywYdTD5kGGW1JcDX6UX+7fT4WB8XCgeTzUSN9TfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WXV0G132;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.62
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED21606A6E0;
	Thu,  5 Nov 2026 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED21606A6E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WXV0G132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyUCaLUAdYFclUxaZiGMU2rTTLmxVnfFXwaxUr9LBjOxbccrGa14Eb0PeIlnSM6WQh5etiAyQbMWiu9For5cGY448YA7U4tr4pyplqqLu0mYAGuAajqy1L4s4HPHjiBuILf6EGyXVWLWrEbuGA2OeK8Jxp1cQGK2GeI2r7xqzF6jfQrj2VQo62gvvR0Y5BF3Onp7vkaqGbZI32uibofSh4LWrbl3LG677LYUF2Qp2o5/alkl/pFm6Rl+Af/JmvcCc/9Q5+UB9dsDRoMLDk0+7hb9mE3y/BlESN32w5QVDe/krJX8BNJsHqLahRLf/DWs9MrnkQEsNjw+Rc1SYEqd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2FJrGPfuUHo1DXNzVvrATlt3MI1C6M3KdeQ9bvcXPg=;
 b=KlNGT1RTiFofq9ygEbk6Wu9PwBf703ZKvE4unpeixFrt433ZpmjibMNPBFBJ7XWOvPlEeO8PU34EUDDX2E0zTHziDWG5dbBHJ5Evken09ZtNMMwgEyo9AqzDNBO+SGbax4qeKHBeauVuMal+FXn6dce4LPMh0mbCJNjp0I4yRSxQQYq791Wg7jwMDL/ExOFooSzqlcjANKw+ToN/CwzWGj3m7+dSCAZvI41pxBUZ1I4cqO3qN4sRYwJ40UPFH6ea4Jx8xvCjofZh9f96wc+xs45k6KSJso9EaExhVJk44m195UHjbM3t0KbhAmNllZwEpjUBBG7fXBbb+2iOItVsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2FJrGPfuUHo1DXNzVvrATlt3MI1C6M3KdeQ9bvcXPg=;
 b=WXV0G132kODe9zLvsTFNO0bZt3VEVampGPqccv48yh6PxzgyC0Ho1RqA9UMB+976lXFy7CoheKDcLYUlGkJxMqiuvvUjOuB1Mgp15cqJNczcox7PHrHtKZQ3kVZJcPBvsptvkul9dI4Ex+UlxvzpCXu5iejIC6OtmIX5PyVofQ5p4OCmh8QadOXgWL+WyHk+VWL6P76ntoAyklqHSjZLxXOx+Ibm6GXMX5FHsYTx8EQwgqVTmIJifkYAVd+kePeSW9M4YxcPK5dCuOoyrBF+G0w84ZokaeSqCdUCnHANKbuuiNqsW2fBbdWYsRZkehoN0HUubyFcWqtmVy9ch/q6SQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU7PR04MB11090.eurprd04.prod.outlook.com (2603:10a6:10:5b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:36:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 19:36:48 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-aquila: mark +V1.2_DP as boot-on
Date: Thu,  5 Nov 2026 14:36:40 -0500
Message-ID: <179390737711.1615394.5923877906841119197.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023102408.119509-1-francesco@dolcini.it>
References: <20261023102408.119509-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:8:44f::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU7PR04MB11090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0801c68e-f439-4c21-1890-08df3b7421ee
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|261022105027099003|11063799006|261028144727099003|56012099006|261009223027099003|261022075727099003|261026121527099003|261026140227099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2krser5mJL5H7RCqVYps2KuP0uJ3LkfVjlMSN/JWNR9nneEfAecHjbYKU43K6VTJ2uRnrA8ovFEd/bDB8wDWL3Y9DEOaGn+Yvwnydlwul2PcLrRWuNViHtlpqGq3T05daZgqRtdUvNi+D+e7dFJWxeRjnTlVOoK6M1LymO0nTHJZxWJjK42aCfEV04GkVfZwspYC2Qr5PyOXEqB1pIPv9g0LP3YdtkfrCn68Tb6hymNcp9qnZwuAKRujzF1pcvrnmJW+DviLlzrHoSFsvyp41xGwJtCNDWEZXsvowrX4kgc6jjKElFio3hjpUiO2r/NLliaI19HGkiYFAofBMgYfWwikvO7oOA5FtX0nd7doGmlcHAdyQuQ9pN/ODZXcjsIJbk+xE9ByScJ/xSwD/eToVjv9IrVHmJjA6u2Y8xjoMi6cbZ97ck3wmRaTjh/xEp+G2X5EkKnECtsxfcns/oxoE14TWhdGUqsC/8Rntn85xM/uUAVANVMhkqUuGcTwLr3PzukN3OSAYupMMJk2HIKZ9Kjj2FpR4GcoT+XzcGhmhJVptZOTFbZnBDlJeOLhfbMjSJjMy2gIirgYMAny87r3SNMMORIjRcqlpdzxIce17mtCsxzt8A49zmfazr6jU3axPxM2v/7lNO73dMRhsyjFT7u+yGlHaYD3vZfvWp8iDhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(261022105027099003)(11063799006)(261028144727099003)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261026140227099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRxV0RRUFdESlJJRkZVYlRSZnFBQ09yU3E5WkFtVUcxai95YnZaSGt5WUxi?=
 =?utf-8?B?OFYxTDBqMm9FRk5sNkVmbEZ4b1N5UzEvYWthNzcyc2hBRlBkM2YzN0N6TVM3?=
 =?utf-8?B?SXllRFVaUHNlRytQbDRhNFBXaWRETGQwS2w0eFprTkY0WDNoSkhnbVJEaDhv?=
 =?utf-8?B?Y25uYTFDamRVbTlWY2xySWRFbW5YWURoZER6L0RJT0lpTUQ4dDBIVDlEcmlS?=
 =?utf-8?B?Z283TDZnVmNZRlROQnF0NmlRVm1MVTJXS2NMU3BwV0FSckN1VDF4ZTJMZEhX?=
 =?utf-8?B?TmlwSDdFTnhrOU1ZSWpheGtPY3hwcmZnOHFLdmZTd1RxeTJwSnkrM1Yzd3JW?=
 =?utf-8?B?TEUvanY0UUhhNlVVQWdMUGc1eHAwY0haYlRXUGZOY1E4YVFXNldhNHlSa2hh?=
 =?utf-8?B?Yjc3TkwzRGJ6eUlPckpDbG9TMmVNRTZCKzRvcHRmc042c2F6a3pQdUJncjds?=
 =?utf-8?B?ekdqcVlsaHhLMmYvd0N6Vk5GNkhsaEV0MHVMSmtzMEM2cUpzKzlBbG1MR3k3?=
 =?utf-8?B?UW5mUUVCdTJyRlF3eEZOQVd2Wit5QWVJVjJ0bk5Sb2pFeGhzbkt3MjBZdExm?=
 =?utf-8?B?VHJOOElrWk83NjhyT2E3NmdwTnhCdkw4dldDMzF3c2tIVGNVTnNGT2ptT1RP?=
 =?utf-8?B?SzZzSjRkNUUwNm1FRm5TUW42QXQ5MnFIZTg4YnU4dTNZNUhTekVETXI1b3py?=
 =?utf-8?B?MWFNb3ZMbVRETU9HR09xZ0I5V3V1U3RpK2JoVm43Yk52OTJSbW9Pd2RyNjdH?=
 =?utf-8?B?WjVwSDFacFQ5Znhxei9zSXpLYTl0TGd1N2VHR1VmK2Z1dzJ2ZVpIR1JBWkxL?=
 =?utf-8?B?K3Qrem5jNGJMODBLb2N2YWt1aXdBVVlHOHRjQ3pyNFpuYUFKMllmNHdwK0Ju?=
 =?utf-8?B?OEV6cUUwcWxVcWFBeHc2WUhsc1NHdDlpaTlLVit2QTFaSjZyMXdRdVVwY1c0?=
 =?utf-8?B?V2dhM1FiMHFWUHFDdWRvbFRhYnZORE1XRWJNbi8veDB5ZkFLK29VQTlzS3R4?=
 =?utf-8?B?eXg1cnJHdmFyRTFvU29VWVBnV0xEZVFkTlAxaDVpUzVqRVVwemVmaDQ4ZGtC?=
 =?utf-8?B?b3UyZkoyUWt0R3docis4MGlRSzNtWHV4alZiTG8vT0JNdE5RTXpLRGFySXUy?=
 =?utf-8?B?bEdML3poMEIxYUVvWlNCdmFWMm1aWkd0YmozVVpxb2FNaEt3aitEbkhuRlhk?=
 =?utf-8?B?QXUvVVlTOUgvR1BQaEVTdWdqVG5nNU5mQkIzMnVYSm9kVVVNdXlERHpWTVBQ?=
 =?utf-8?B?L2tiU1ZZMlpDSEhGVWN4aHF1b2h3ekFXaWoxbUM0ZE93QWNSTzIvbG1VNTdm?=
 =?utf-8?B?RGY2SFFFeVZqT2dmMmRiSDV1QkU1UEVaeU5Ed1RXKytTRHQySExVUzRLUm14?=
 =?utf-8?B?SGhGZXVvV3NRTFcvQVJVZTdwQnVnWDBpOXBvYXR3czJpZHZ6N08xVjRWM0da?=
 =?utf-8?B?SkxlT0JhUWU3UWhjZGR0RkFmQmMxMHBuelRrRytVdlZpakM4bFp0VzU3NlB5?=
 =?utf-8?B?cFlzc1VNL3YyYXhpVVIyS0NxOWRWSXpSYTdaSWI3ZmVTZTV1Sy9MSS9Ydy8x?=
 =?utf-8?B?eHovK2pZajVSMlJ1dVpZVFpxNkJXRER2WjRLWmtsWFBQdzhlZC9kRXhEakhX?=
 =?utf-8?B?aHRrdUtkc0RGNkNMSWZ0SC8zaUVUamxMeUo5bDJkdDlqMTEzTE5ReWFoQkg0?=
 =?utf-8?B?MGFVRTIyYmVKVmJ1ODYvVEhEaytnSFN4SE5EVGJQUk9EdVdnMUpGbnlwcnVS?=
 =?utf-8?B?VVBSdUw1c2dCdkl4L3R4cHpZcXVZWjIyMG5PbWZLa2dCamlRb21TQlBJRmNi?=
 =?utf-8?B?Rzl4dyt1eURBRVhJVi9MaTFpc0ZTWXh5cXp0ZEVtQXMwNVpQeWJyUUdMTXFR?=
 =?utf-8?B?UlA0ZjdMYTBodlZEY1lLU2NyK0tXUERPT3dzcDQxY09oK2xQdXJsWnl1Zm9F?=
 =?utf-8?B?WUpnYW5vK29URUxIb1lKRWE0K0xWcXdGUkpqR0xPUUJ5M2l4VXNpeUp3N0px?=
 =?utf-8?B?YWpBSmJycExzb0NnVjJlWHNZRitoZFhiUi8va3VEVU10ZDFWU2QraW9HdzU5?=
 =?utf-8?B?Q0YrZXZxQmt5eEUySE15eVJSRy8vdzJJK3lrOGNWaUpVU0tibWthRkxRN3Yy?=
 =?utf-8?B?S2RaNU0wK2I4cGxNbytqNFlTWWgyVkxxaE12bkRlTlE4bGUwY01jc2lVNnZY?=
 =?utf-8?B?WHkvZTZ4ZXZjWDg2cG1zaE1kS0d2SU5NczdYY0JpcW15MVB4U2ZlUjNsZDhE?=
 =?utf-8?B?S2dqUHBsNDNRZHNDRDZVbzIvN2NoWVA4Rk5aaCtBVDk2UG1xSjExV3ZTQTJM?=
 =?utf-8?B?d0NrT0xkUGJnM0ZPbncxb0oxczYxb2RWdzR4VXZSSTB2TkwxaFIyUGszTGdn?=
 =?utf-8?Q?lv4HIQU2NlANc+juttT+Qz8M88VHUvc1msNUr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0801c68e-f439-4c21-1890-08df3b7421ee
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:36:48.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JujE2cWHBlwZqs2bNamiSJ+zRYb2f9BH+nGhp9JCSEwwz2vJra5GxubNbk2CP1VKu/hHTzvlGnAwkBH1WlUk1NqJmuGAJCGXWIMEMuALCwChnN0m0hcFpAJ8i4AUidPh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11090

From: Frank Li <Frank.Li@nxp.com>


On Fri, 23 Oct 2026 12:24:03 +0200, Francesco Dolcini wrote:
> Mark the +V1.2_DP regulator as boot-on, matching the hardware: the
> CTRL_DP_BRIDGE_EN enable line of this supply of the SN65DSI86 DSI-to-DP
> bridge is pulled up on the module, so the supply is on by default,
> before any software runs.
> 
> Without it the regulator is briefly switched off and on again during
> the board start-up, potentially disrupting I2C transactions on the bus
> where the SN65DSI86 is connected.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-aquila: mark +V1.2_DP as boot-on
      commit: d9266f28a24d1d835b180dcf6bf45f0de85ed565

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
