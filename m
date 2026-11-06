Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.46.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793956352;
	b=Px1oz2kLQDwSaje1W5yx/mJvnOTycMY7I+3CHSCDCGivg4oDC3zsI8QY9GwvF2BJ5MLV
	 jDIbLznZUHgRAths3buBxFLIXHM81X9EYewg8LKIJHaa23oi5CSYKtLxOmFqgZemh/aRW
	 W3X3CWRcXhVJzmjIt4Yuc0SjMLAHkB8jZWpyrPGLGTc7gyGoW8CWgWJjxyxnrFbyoeTxX
	 SpVlfda/s6GNVWYBdDw7KdedGogJVzBYdYK6ifbHcDJbkdNJH8gmmfySVFrfSGRxV9YA6
	 K9EgDDqKaujEY9dYgov8jSgdZahSP6Vu4qLpjqEA9kXUfaK11nzo2DQGF4l+ar9a6kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956352;
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
	bh=sDhiS7xS9funjGrur12HNFKN/aC0zima1JjQpE/vZ74=;
	b=3xgkVXUf2PXg1lIUW7H5rWMd9KrlqliRdXz3gui83rLhhvikEEzIe3ilVZPFB7fECEXG
	 1Ph0tAUDMFJNm66ELbgnrplLc9OKL1zAfDig70GLDssjfC7T8SWxSbNJ8QcLogtHYW/3i
	 tzuwy1zpy13rykJgYoGYCvcei9/i6IjKnVu76+M7Cn8Ct1S2bedvaI5z1Gxa6jwH2yKyW
	 780PBkWdUjFXk0jjEDuYrA4ht8k2eL1RiQN09eZlUaFvYqMVAn+etaZo7u6aY1SD9LYeM
	 OmpyJm++m01xVmkYHNEsCdBJMYzqWnL8q3nzNNDPWHOU6DPSgqJ1jtKMRSCkYzF3+UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=outlook.de;
	spf=pass smtp.mailfrom=outlook.de;
	dkim=pass header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b="E/re2+b3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.46.82
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013082.outbound.protection.outlook.com [52.103.46.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687D606A328;
	Fri,  6 Nov 2026 09:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7687D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=E/re2+b3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+iIqVz6g51+f1j4QdBssYT13V9Yz2EE586tHUki2Q6CZ5ScPIx3lN0zf7/TeGvC9UTQDbFOz+0lZCk158WCURj1WqEX36wvYUjNyCHwNsOqWIic/2aPXUGoXFKyBZoQhs5pxjX60J8tT8AG5IwwNtQ5fqiOZyd9fT61L4RkdDFMcJLKpbZOIjLCZO7MZHz7Dwqq0EK4LS/AxEjTNUCgwpKorswfDC3KVpoHiIk2pNXtNv1BG9tN4DeC2EKLx6SsSUwnGcjK0YHxQ3qeDOdv4FLnPiCXvOzmt3hp60XuH+6buXj9ocjPvl9PtJnrr8axnT54NL6l5bVuIhBQAd7HwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDhiS7xS9funjGrur12HNFKN/aC0zima1JjQpE/vZ74=;
 b=V+qs30sHI9plmhffpU4HJ+MiVrXL/wAQfD+YyWb7jjX9NRY6OzCvWx71nZHpYxyIBySii6WQa10Bqud5EVUff9PtfZnOySYnGSPeHP1ozT8lxzt7m9XUvjbzgbOhrv4aEYeWHMkXqJ41cySUXbLw5oEOAebB7zAlAVrS7GwP0mAU/PrIQiY/O11yZqnImJH7sILZuw5PCN5K7SwN+2l27hx8h9uA5njK16BjWTyFegiZcTh0kKeRwB5f1WsUAq2AnLhF95oHbW4AmhmmHcqcTAR6VGKGUkHSBeUTaBhtUrdqfRjYouysTemT+/e5nOglRw33EvQtwpR28L6y9Kst1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDhiS7xS9funjGrur12HNFKN/aC0zima1JjQpE/vZ74=;
 b=E/re2+b3Ef64id4PLuQ9MMQT8b7wzs70XtvaUOYC80wkCKeNDLv8pcMCjoYvJVHZtZ5fk2d4wgUHgJ+nfF+CFhn4NwRUipHtQ9bAqXKOXoS9EhgGCj0xPcoLWOcmIdJxSnjE8BZeg90Yt1jy//Yq9twD0aIQw/Z8oVGNXMi1VERS2HRuh1dQPU3r2/N1h1qkFHR4kXv84q36ruXO81R1uoz49oZYfXmsbhuaEtDDXcTSdj4/QwMzPPGjJGTwvWBbPFgH0ubLD52HWhp+wDtSSFgWWDHL7uUdVdaks8hWEIze9i1N/6HapOrwCal/KFWpw2RnxUimzM24HjqcZa4rSA==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by GV2PR08MB440688.eurprd08.prod.outlook.com
 (2603:10a6:150:38d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 09:12:28 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 09:12:28 +0000
Message-ID:
 <MMZPR08MB549315FD98A6FE5E44C863F6E1DF762@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Fri, 6 Nov 2026 10:12:25 +0100
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the
 system
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
 <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:802:16::22) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID:
 <43ee7829-f7dd-402d-8f3c-e636cf7e58d0@outlook.de>
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
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|GV2PR08MB440688:EE_
X-MS-Office365-Filtering-Correlation-Id: bee57b92-5b64-479e-d4a1-08df3be61446
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|16051099003|19110799012|8060799015|15080799012|23021999003|19101099003|51005399006|4140399003|25010399006|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUpmOHdpTVFIcUkxT3F5cy9IcFlSVkNCU1VnZzUwTE9yUDNLNy9wamE2T3Fz?=
 =?utf-8?B?NUpGSDVITTFscFdTMGIrNy9pOE9aZHAzWTh3RklvUVBWd1lUN2E2cnhZL2Fi?=
 =?utf-8?B?bHdrSFBLTkxvSWc2bjl3YklJL0lzOGxYRUZXdXd0MDQyYUxaaFBnaVlBNDZG?=
 =?utf-8?B?bmVQYTdxRzZDVitXMHFEN2pMWFZUTkVYaTFmSkVxa3FmTjBaYUpDTzl6aTVH?=
 =?utf-8?B?UVU5MGlkWnNaMHJlN3BtNjFQd0hubGZDck1MWnJiV3J0c0dNeFozYmo3SFRt?=
 =?utf-8?B?Zk9KcERrczhZcTJoRGlGZWRMdVQxNkc1RGw1Uk8zYmxtc1p4ZDBXYlBrQ01K?=
 =?utf-8?B?akU2Ump3TVgrc2o1YmFNUC9oZVlCbFMrZmFoN3BXQXgzOW0yT3Q5Y3A0ekVn?=
 =?utf-8?B?SXE0NERHZzY0MkFFQzh2Q0xGS0lmZkxjWjJJK01mdEp1QzF0M2VoNko2dE1M?=
 =?utf-8?B?Z2RJYW1saXVLWWFINGFTQXZZUFppMzFNaklQRWNHRkVTU1h5OGJ6WGRTTkxn?=
 =?utf-8?B?QUR1Z0t0SUJnOTZkVkVSdlp1L0tiWHp3VVpWWTBjd09DdDRwdTRYM09waHVK?=
 =?utf-8?B?QUIwWWhsOVhTRjZaSFZKa0tPZUt5alQ0Q1hNcHYvNVc3clFmdDIvTm55TjdZ?=
 =?utf-8?B?dHR1U3MzL0dWUzloWXBTcmk3ZDF3MnlRN1dWWkhXSGQ4ZEVtOVIwd2pOUXFn?=
 =?utf-8?B?UEJwRnF3VGRsN3F0S2xxY2dHWW5tc3I4dytXLzlyYjg4UHlSM2YyWUFaNVNq?=
 =?utf-8?B?UlU1ZU1uQUdVTUQyN2pjcDJEeUIzY0JucnFJd2lzWjJCVGhqTjMxa1BKNlVI?=
 =?utf-8?B?UDNoQ3hGOFBtWjBIWlFUenloZVRNbm1qQTNYYjAzOEpGczdBeEkyZGVyQ2Rl?=
 =?utf-8?B?M3I5VHJnSzBEczRjM0ZHTnZwaXUwQ2t2L01Eck1JOVJ1SDR2VkNzV3dRL05U?=
 =?utf-8?B?bXlCdStlWjRza3hKSVhCSlBKK0VaZFRlZG1ZOGFsYzU5V2VMNlZyVWhqa005?=
 =?utf-8?B?WUJBR25kT3BoTnBQb1psdXlpVEVPVlNLRGUxZ0lWYVVmcUt1YjFxUDhBS3RK?=
 =?utf-8?B?eFM1TE5zUXhUdXh6S243c3NsQnVNNVVIUXBsaUNzVUZkMklBYjNkL0xUWHk3?=
 =?utf-8?B?bk16aGNLeGRUanhmbGlCWXBTbGlIdU5pOTFtdU82b2ZqYXlnd1I2VlhIaUgr?=
 =?utf-8?B?QlJYUVM1dFNkdHkvN1ppV1Fyb09MYU4yMmswb2NQenRNNlg5Yy9QREhLSnNU?=
 =?utf-8?B?SHNOdWdPdUpubzhDdC9TdSs1R0dMRFQ3SzdCc2RCa1pjR2c0V3pCWTZxMVM1?=
 =?utf-8?Q?pdF5RhaapwoAPAoS2uIxF1SoqXIpMnlOwh?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU56a3I1WUFIUHorL2dYaTBUOWpTM1hyN1UxcG90cURnY3ZIRk1QMDd5RHJ5?=
 =?utf-8?B?Z2dDWE5jdUVGTFNuOStnR3JXNUttUUd1WUpxWU9PUW9yeUYzOUg5SkZxOE9O?=
 =?utf-8?B?eWQ5QXFidXhlVHk3eGh2VHZMNHVQbHllTjBxMnYvcy9wS2dkZEdhZndTaGpN?=
 =?utf-8?B?NVlNdVRYME9QZEhqcjR1Szh1RXhLdnJJYWdNTFgxY2VhVDhIdmZPclo0eWh0?=
 =?utf-8?B?TWtZL2JqUjlDdE14TTR1cWpKQldabTlBTUgwZ1cvTENQNERRdnRCQUhiTjZN?=
 =?utf-8?B?OHl4Q01ZOENYTjRWeExsNUx4cW1DNkJ0d0pFR1RvaW9rUTh0NGhRVTFPZTVB?=
 =?utf-8?B?Q3VpRDkzVjI1M3NDYWRTdUFXNVJEQ3BLUko4YTE3ci9PbnM2M3h6d0IraFov?=
 =?utf-8?B?c1ZnZ3NwMHQvMnp1WEN3anh5VGlPaUJ0TldFVW1vOU9qTm4zdTNoS2xOZWJp?=
 =?utf-8?B?SjlJdzBRV2VlSHQzcDFqYWsvdkNqVTEzQVI4bVNEQUNOOTNiZE9hWFdKRFl4?=
 =?utf-8?B?ak4xK21VNDhBbXJmZXhOcnk2aDlSa1BuaHBWVmlablU4cjFPSnBTWnIvNTNE?=
 =?utf-8?B?ejNuSTJpS2pLM0p5ZVJoK2JNdGwzNERmb01BTm5aTkNxT0ZpSEVvclF4VTdF?=
 =?utf-8?B?bUlTMndSaU9nMjBxY3J3ejViNjlZSE85aDRoaEFqZk53SUNoRENJRjI3bHZx?=
 =?utf-8?B?NzVvdGRFL2RISkVqUzhYS0poL3ZqTWZhU0hJUXFaeTI0dm5pTXhPbHlXbVlN?=
 =?utf-8?B?ckRzOUdpK3dRSHlhampkNkJJZ1p6Z2ZaQ2NncnYyQklqdk5sM09JWlgzYUNL?=
 =?utf-8?B?RGlVby9qVnZLZFpsYko4MFZJWjRidXpMY0JoWEtRVlRIUDFqUE9iaDJTTzFE?=
 =?utf-8?B?Nis4eW1HVk43dk8zemxUYllVZUYyRHl4QW9JcXV2U2JMMzNvcEZVL2lHVTF3?=
 =?utf-8?B?NFU5S2gxWHpjUDBhSGplaXlDY29MY0NwMTFYSE1uYkdRYmRXYkQ5UnRGT1dC?=
 =?utf-8?B?YzhvV0Z3Z2UyZnF2MDRLOHlSTkR0MjRMdWlxMXRhcmtmcWYvRkpNSVUrYnZ2?=
 =?utf-8?B?VlBjS000V1h0eXBjTFlRYUQ4eHplN2tCamh6QXQrZmtRQjlpSThTZFVRKzNU?=
 =?utf-8?B?YmNIQURlNnoxKzZTRmpHcVJrYnRFcTJZR3lnS1lDdzYwK3NKZ1pHR1paVXpw?=
 =?utf-8?B?TWExS0JHVms3a0cwMU9lajVTbDhra3ZJM2lKbFprSGRpY3Mzb3I0RitiaEZn?=
 =?utf-8?B?RGdQeDJub3hVSzNPODB5OUxnOE11L0tXd1ZDTkt0SFJpSVlOY2g0MDJyakc5?=
 =?utf-8?B?S091bjVTSnZPRGwrekY2cjI0RE5Qd2N5VUU2NE12YmpCbGxPcXNhalZFQy8v?=
 =?utf-8?B?dkJtSHEzdmRrUzVjWVRoUmZBU281M2YyR3ptMk9KVC9oSXlkMzJJRVliY0xH?=
 =?utf-8?B?Z2lUM1NsNTJ6dmR0MDFKWFJobjBxSlVMM1R2aERFbTVYTmxob0FIdDE0TWR2?=
 =?utf-8?B?TjJ4cXhIN1EzUFpLalZoVmx6VlJGOXFBNzlneWZqMTZWMDQ2OTh3dEFFdU9S?=
 =?utf-8?B?ODVVSU45aEZsUCtJc0s4NTYrRkpSQVl6K3pJQkdhUGdnWDhEUmtHa1QxeGgr?=
 =?utf-8?B?M3pDUFA3bm5Ld2htNUJ4YUpWSDY4aDRxbkV2K0dnV3BFS0FhYTYwVFlyaGtT?=
 =?utf-8?B?dlhwb2FaNzVCQ0FZVnJGVC9yQy82OSt4aWdybGVIbjNpWEVDMFZxOGpqTGJC?=
 =?utf-8?B?MnBpSDUxd01MQURDai9DUDg4VG85RjYvak1wMHEwVUk1VDRNYVhBSGhiSUpN?=
 =?utf-8?B?cUZhYWRuK0kwN3QyaGxTZjdXR1BiWlB2Y01CeWp1MHZ1OHNpSGU0eCtuQmJB?=
 =?utf-8?Q?T5egyUn4IA+SN?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bee57b92-5b64-479e-d4a1-08df3be61446
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:12:28.0219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB440688

On 11/2/26 00:01, Martin Blumenstingl wrote:
> Can you help me out with better understanding: is the firmware
> involved in suspend or is this CPU core idle state suspend (meaning:
> firmware is not involved)?

Hi Martin,

yes the commit message is a bit misleading.

For suspend to RAM ("mem") the firmware is involved: Linux calls PSCI 
SYSTEM_SUSPEND, BL31 puts the DDR into self-refresh and turns vdd_cpu 
off, and the always-on firmware runs its own IR decoder. It wakes the 
board only on the remote's power key code and reports the wake reason on 
the serial console. That wake does not need this patch at all.

The patch is for s2idle ("freeze"), where the firmware is not involved 
and only Linux interrupts can wake the CPUs. There the meson-ir 
interrupt has to be a wake interrupt and the decoder has to stay 
powered, which is what the patch does.

I tested it with suspend to RAM, which proved nothing for this patch. I 
will test s2idle with and without the patch and, if it holds up, send a 
v2 that says it is about s2idle; otherwise I will drop it.

Kind regards,
Christian K.-D.
