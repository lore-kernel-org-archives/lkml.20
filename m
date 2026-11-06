Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.33.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793955957;
	b=wlsnWKrBgNggs9reRgP+7JAvF4j1+LCv1EFUQeDXthyTZc9WCp3Id34eXcGweyn88pK/
	 0TkacoAb1u34bA6VYaGqd4FDxwzT+voqxoShD1o5/+Hs6WuMojqp+JhOT0lE/IFUs634u
	 SbBGNdY0hd3QyRq1FVw3gM5A52Lr592WRR9jUQiVFiJg9w0T0YY5dH60tibp9eH8ZyKEy
	 abrJk6AK0hffm5ZlWWi9R9tbeOF5wzQvayJ79UTm575WT9NtSkKQQYatCSfu8PmryrMfc
	 swGDU0xX/lzQ2JO/mVTAM27Hk0K1kiCTqhi/dyrn+QkMdtpw8+s3A42GnEdoVD6DYRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955957;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mHkmHaaMlDo11GD/XjAkJduAzTIpXkulwgY73afQGzY=;
	b=AtVj/9V+6n9cZU6cdD3BMOR8fHoNoRjQvEOiyfatPLwpfVGxgSRfYu8sRSv1W14Nllo6
	 ZfQFiLkx78JxR+hRvBL7jf+3rTEpF9E/gVjwTRuQdSGVKVohgqRH5TXHZydhX754AxFHw
	 Nc7mdyvsmTXZ2Ro8sIa7Yvw8Fk/gLevlyb7J5Tev3/PeeANeGEyngAXViILGfs5sqGcmb
	 tiX03UXErUwVnrH1d1O9GTiSyE3uEtbBNF0pzh3nPJ6YyMi+FmBRceRpLkT7tKAVLu0Ib
	 3GFqnbtIRCXIwS2ZjBBl/qOjEqwIB8ZSH1ontclxKHYssbZ/gWdJ1/rzvNXXwrWc82A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=outlook.de;
	spf=pass smtp.mailfrom=outlook.de;
	dkim=pass header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=fMPrVqDF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.33.33
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011033.outbound.protection.outlook.com [52.103.33.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6CA606A326;
	Fri,  6 Nov 2026 09:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E6CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=fMPrVqDF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYdQ/KJ/lNNCKvEDhBKbFvFNLWwsB2vEkE2njrPW8UUg2wAgY9E1YwTVIw97K3JnFy/iIZUM3h53iNculuoLFvKdoj5avmpla9O8+EA5d82sBw7wX76jj/6J1D/XPZeDyKnX95SKBGwWICx9ujANiyWDjJq4B5w7YMjA0WehMTAaNMhcbFy/0xvenyZzfwbcGoeHvBRbBX1+rdNs7hLiGpPVL6ytvHbRbef2qJTRUjPM2Xv8Vy52bXBm8y/C1B2oR55f+jrFQO8iLQ9oZpJTQs10l0JF5Dc2zn4ovZLJQ2HIiQzTsm3sEvUJ0XJhzEI5nZfLmlCtGBKFa0mpCvO2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHkmHaaMlDo11GD/XjAkJduAzTIpXkulwgY73afQGzY=;
 b=Q+s+o6dXLVwfKsGRa4cTAbBq1kugtjgYTLppLVMX5pC1y5mmpNPk+VEMnCwmNTUxgam8NyWmDI5gnRsm/cPx9yMpmPEIAmaxqRhfJHP5bK5NCqsTJi5cbri5ry1hqWxt6XUDY0rrfqmd138BgNTWwIwrY5EP6hASoNAzkRISkiMIOHH5+RhOPslK1Ze9B1Ir694QSOeR8VVAON6qOXeVh273dhxq5qw02KMTYfH6jvSZSA2EL8/pN7yVovSE2KlYAsJwVdgD/YxyF44GUfiEWFTRz9cwip3/SBicT7bkn/o1LtbAJekZeSijlNwCS+izaJ5cySYGclHXlcF1cQ9LnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHkmHaaMlDo11GD/XjAkJduAzTIpXkulwgY73afQGzY=;
 b=fMPrVqDFxUiod5XguVmjnLF471h3jPNjW5rc/kAkJpuImMd9E/B/BA/ExK0R3whk7MtQRv2CfpOgjPTr4aEzvzWUSjaWI3evNhu8GM3MnAVOcP7jnzfaPtvFHzadO/CNuqvNGrslEkKQykDoVZIMh9KLJ065S/XttnBgN5L93isN0a0r5zc0NjHkV7pBPiBbh+ea446zaxwGwzOWYPndneK/uXTja58RY/aSexez0tLxVz32yW+Nk7IAySV+ntZYWjKOTnvAXkisTL+NFD/gVIbDp7GnPcXXPEPof/1nOnQ9twI0DZxorYXltJUb4BTs+v6EopBsvSEcvJF1g3bWFg==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by GV1PR08MB8692.eurprd08.prod.outlook.com
 (2603:10a6:150:86::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 09:05:54 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 09:05:54 +0000
Message-ID:
 <MMZPR08MB549315AE650AE4557F41230617DF762@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Fri, 6 Nov 2026 10:05:52 +0100
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 01/11] MAINTAINERS: fix the Amlogic VDEC binding path
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-2-christian.koever-draxl@student.uibk.ac.at>
 <20261030-invincible-peacock-of-feminism-ecaefe@quoll>
Content-Language: en-US
In-Reply-To: <20261030-invincible-peacock-of-feminism-ecaefe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0098.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::7) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID:
 <7edcedda-7b7b-410e-a374-b1e77a658fe4@outlook.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|GV1PR08MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: b85d995b-1e96-449d-aada-08df3be529bd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|23021999003|19101099003|5072599009|51005399006|6090799003|19110799012|8060799015|25010399006|4140399003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGI4QldDVEVFNWNYd05Ba2dmNUxSaUk0Q3Ava2d1WDBLR1QrTVlVNm1zaFox?=
 =?utf-8?B?dVNndU5USys1a0plb0FmTXpyMVdlN0orRW8wVThLSi9hTGVEaFhRK0dNTDR5?=
 =?utf-8?B?RmVTWm9zOTRVRkx2S3RyTzBGVFBQS1BLbmVxTy9ON1lYUGdiWlZMTHV0WVhQ?=
 =?utf-8?B?NHBUL1BxU3ZzN0tJMWU3MGJuK3ZiNFA5bkh4NXR3VEJpeHhWQjRtbkc3Y25C?=
 =?utf-8?B?RmtMRlNpSGhzeitnWGQ0QVVCTkJFMGl4Vm5kb3o4bXlYZmNxNnNMSHZCb093?=
 =?utf-8?B?Y2hGeGRUVTBvWStEdld0a04ra05odkx6ZThOTGg3QytjK3JYK1JSUm1PM29l?=
 =?utf-8?B?QkhxK3doQTdHbHhHMW13SDZxRHNlZzRodXVRcDN4TnMxVE5sY1hFbWFlcVF0?=
 =?utf-8?B?a21oQ3N4NWNoSVJ5U1NYTjZCaFlsVFFINFJKdmgvMnRqeW83YnRXTGtwbjll?=
 =?utf-8?B?YTJwb1E5ZStDMGVpdndMeVhIVDFveEV2N3dIMXVFUmpLVVFaZXN0OTdaUHZK?=
 =?utf-8?B?NUVnWDM0MW93T3FVbWZ1NnZLb3FQd3ZPZU51UXF5ZWRNWmtnN3hHVVFhcUtp?=
 =?utf-8?B?TlRqTTNpS1J6L2xxR1NyeEZNa0Q5bmtwMkR3MmUwZStjckgyYWpPaTVqZ2c0?=
 =?utf-8?B?MTVtWS95UGhqTDFtcm1Ca1BGMGZnYnd0a0N1T1B0N2pUWDhUM3hGR0xaTnFL?=
 =?utf-8?B?U1ZGaWRoWnVPRlpQT2Y2YVQxWThMWWtGd2M0cE1nSUlWazdpbEwwcjRCN1F5?=
 =?utf-8?B?cFBqMjZKUlZ3SlNQeENZeUZsT0VIenZXQVRjSEw3Lzg4OVUxVEd3RG9oTU9s?=
 =?utf-8?B?aHVwOXB6NlNMR3AyQWRDMjkrYlRocHBxaWpIRUlpczFkZlV1bE54SUtHczlk?=
 =?utf-8?B?bkZES2Q1VzVHSVhZYktzeDhpWWlqZ2ZPb2xCRDc1ckdIMEptZm12T1Bya1A4?=
 =?utf-8?B?cENydS9JVG5iSlk2NnpuNS93TnVIblJKRmlheDVyelBDZDdicmlVMmZ1T01D?=
 =?utf-8?B?amhXMVNVK3MrQzhOOU9mYUtRNUxrSUNISmRBaCsyc2hJU0RyeEREVmYva3Nn?=
 =?utf-8?B?aUdRcGlrZW5WVk4yM1pxUkVKVjlxcDNkdHY5OTlCSlpHNWpObENHdlZIekY3?=
 =?utf-8?B?UC9ZazV3NXRaQjcvSUpIaVhIa203SzR6dWllMml2SHdhQ1VobTlNYjRRanAy?=
 =?utf-8?B?cXlHdEduNTRxbmVuY0p0VkZaU0M1TngvUVFRTHdSVHlHMS9UdHRlcHFyWHBO?=
 =?utf-8?B?cytCVGdSQWJ1L3NzRER6NS80aWwwckNLbHNVSE12czFHejVJUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE9NT0RxM2JELzdLT1JqY1hlMm1uelR1aTd1T0xXNE84UE10dkpDdVNwbkRV?=
 =?utf-8?B?Q2dCZW1FYm9ZditXRnVlaHBUaWV2S3lrZjFSb2dqeFJLU0lUUHNOWE1yY0Mr?=
 =?utf-8?B?cURLVlJaL0s5UnAyRFBCd1BKZjNlaGNDMFpVMExERnRlWExFMG43Q3hkT29s?=
 =?utf-8?B?dkRjMHZ2SnJYZmtRRlpQWHZYUkRJTyt1V3VzOTJtZ2FQSjFzWFR3cndoYzhX?=
 =?utf-8?B?SWRwNXIxakUzeWZhTHhZbUF6ak5taGhTWm93c1hmcnhUK1pQTmN2WGRsSzJD?=
 =?utf-8?B?c1BraTVtNFFQQk9LYXQyUjNmZTZpWkQxNWdkcEhaK0R0c1JHRWhSYldHRk45?=
 =?utf-8?B?UXllazc3YjB1ZEpEcExFZjhXakY0OGNabTFvVVltVHExb2ZpYTVtR1RPNUV5?=
 =?utf-8?B?eTZrZFFwOFh2MlFYWFEzTnFCNW9YZFgwNFJ2NXpBeFErdElXRFQwL0psU1E2?=
 =?utf-8?B?cHpNQVpSWFBQVk5sa3psSGJXOWxNUjBhNk5lZzRZbjE1TnZlY25DVDNsdVk4?=
 =?utf-8?B?djQzeGJLMEFLckV3RXpJRThOTE14TXhyWXpCU2tndm5ZdmNEd2RXb1VQS3Vj?=
 =?utf-8?B?T0JPeHY2dXVrSEhzQ1V6L0hzMDJVZDVGTDd0cytKeFMzZ0JacXFyOGpOeFlh?=
 =?utf-8?B?a09DUElhWU15RHNlZDcwWFJaaUJVUHpMNVo5NVFKc1JQMWZLeGkwVHc5Ni9Z?=
 =?utf-8?B?OW5YUlhZNU9OSEFUQ0xCZ3hJNXlQa3pCWkNBM0dxeS9RMGdEQmZzZjFxU1dV?=
 =?utf-8?B?d09pSkl4Rmw3RjkvVkk5bXVGVG1HMXFiQ1FxL3hHMVhyVXRsYnFPb2dudFZw?=
 =?utf-8?B?TjZESXZTR1M2dXptb2djUGIycFZDak9CMGQ0dGd1YVIrOFhYNS9DbXI4WnRT?=
 =?utf-8?B?cE1ha3lmVlZrVVFxL0tJSlU0RUtnWVVGRHJBWm1ZNG85WUU0bDRnU0lGdHdE?=
 =?utf-8?B?TS8rcUxHeHpYWkd2QXk4dmFqaUdhK3ZIMUVIN2c5QUZTOFN2MUdMajNHNmh4?=
 =?utf-8?B?QkthYkVYdHhHbHhQcGNOcitKRDh5SEF0WW53Nm4yZU9jVWJQQ2Y3RmcvYkJr?=
 =?utf-8?B?c3lRTXdDOVNRdFZlVkFRRFpIanBoYnpsa2w2dlJNUUNSMWlVdHJzNVBMN1o3?=
 =?utf-8?B?dnJvaG8yY01JTjJQZmNHRjVRdmpxVXR0S1hpNE9SMGtaM2FlWEtlWko2ZVFx?=
 =?utf-8?B?amFLSXdYTVNCQlRpQnNKSlRVY2M2NXltdFFkSVJ3Ky9jZzRBczhTY3JKZitI?=
 =?utf-8?B?bGN5UTZ2NC9leHVnd3B3SnJuR0hOclpLNGs5TmRsdG1xc1doOVNUczBpaS9J?=
 =?utf-8?B?OVFKT29LQ0lDcFhzZktCVFZhZnh6MUx6SkxGbGtrTldEWmNNYWY3VFcyQUFD?=
 =?utf-8?B?SDhOQThyY3NDWE1FV1pGQnpIUE1CbUdZSjNmenhmT1hVaTZWVDBGbDNIV3B2?=
 =?utf-8?B?N0g0TzFIY1o1bDBZajRNUXBib3JTaVZCRUUxYUp4bThJYUJPbjY0ZUtZK01X?=
 =?utf-8?B?RWUxWStjWXY3Snh4M3JPd3A3R0hwSnk4dEpSVCtPZGtpS3M5dXZuUWhMSEJS?=
 =?utf-8?B?VTNEM25YWVdwbnRHeDJOTkRJeFhxUnBNWnZBcWFMSy8ybDlIcUs5aHl0ZGQr?=
 =?utf-8?B?djJqSWtDNU9zRDFtU2UxYlg3cU5UQW1RMVlCYnBMVytwVStLcXUyc25lTkFo?=
 =?utf-8?B?eVdyUlNkZlZYaFo0UXlwWGJRcm9IemdSSmVEUENJa2NLTmE1WXNKZnFSeW01?=
 =?utf-8?B?aWkvd2V5eHh0L2ZNUXZPM0VTV3ZMQ1FvaUFwa0k2dlh1TzZ2RE9QQTIwK3Ni?=
 =?utf-8?B?YmszRWZGcFc3MFpla3BWZnF1Qzg2TXVDQzZ2QVpuSnArVURZRkRqUnRJODAv?=
 =?utf-8?Q?oZUnle0Le+NlC?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b85d995b-1e96-449d-aada-08df3be529bd
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:05:54.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8692

On 10/30/26 12:29, Krzysztof Kozlowski wrote:
> > The binding was renamed to amlogic,s4-vdec.yaml, but the MAINTAINERS
>
> What? There is no such file.
>
> Why are you sending fixes for broken patches being just reviewed instead
> of just reviewing them?

Hi Krzysztof,

you are right. The series was based on Zhentao's v6, and I missed that
his v8 had already fixed the path. I will rebase what is left of the 
series onto Zhentao's current version, and give comments directly to him.

Kind regards,
Christian K.-D.
