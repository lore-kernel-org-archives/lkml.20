Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.68.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794407325;
	b=wmGtZU3Fon9KGfaYVmavy1fTOJaUwvycv/+XdFPbr5j3f3kfGKwZ5tvROsw9MO4ArFpW
	 4Y9Ryi1qd1hfxx4KVZ0txA3PjcNSTH70XzPLtWntgYZadQndZjY+KfVmv3qjbyIsC/Rei
	 DDEj16few2IHHuWnhDyQpp2RC99jdvwf0hYBSCHKsbrujOPU+c46By4SpF+GOnu6mYFLC
	 WS29zzt8u0RZ2al0TWUekwu8ePLKE9RqxZCWMm6c+GXTt3ZZzwSFuSdjlV5oJQrSIBolh
	 a+Ur/oaFZwOhstujnYQTs09oBvu7/TZffeUqLz20QQHqAh/y2B5WKuXm26X0k2Sgdsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407325;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=9GWHWPWq04tPuLtQuLBwslm96Bu8TdjtRCfK/Ft/rKU=;
	b=lKhSibjUkeRnkbty5uKN8McTo3pIxLSRG8Y5ICt3LR+dM3miZsdZTgp0H24MloDapYiH
	 NallItR0IN1QeqSL955d82QGzMovrk7f5/FwjbEMdk2DQrc/eF9+93FZjS/RNwDu/JGRg
	 NT/gRMjtvdWuZlGer07XBiJJ4TSCfr5zLndDenWuKNfCPFEWE5ZYDk1ZRji+1nsKtMuPE
	 8H0ldzcWcc7C2dFqSurw8bH2/0Ro8nC/Ah6XM9iv46SeGx/rjouWxpldT/w7AEEYBirSz
	 CVhJ7pg68Gy2omVe+3HkA/V1qVmMWLnjxwjickY1oKG5hpVi2+tMe7NtlVfw9vCruYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.com;
	spf=pass smtp.mailfrom=live.com;
	dkim=pass header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=i5h2Is4m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.68.30
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011030.outbound.protection.outlook.com [52.103.68.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFC606A321;
	Wed, 11 Nov 2026 14:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=i5h2Is4m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R514DMl0yGI6Pi4GgbXh8XSVQk6F30J0+0mIk9WjshI8VGUo9w4waZkNXYTqVOIg/DIgDNw+1JViI3w3bKFweQD8M12Udz9Sn3m/xlbFfTvKc8KJzBGLQrrT5bGK5NkFwG1NQcTL4PsAwLYyHITAHoCElihNBhnnGua7H5gCk/otmrvC+0NcZJbdivrV2d2qJx17+TX70lemSaHz+kP2us6wXIo0qyjXXsvBGoM2Wp8X7KzFyGJiCIPrSqYPp6E6gEECy/8jM0VH7+q+x4Bw7DJKv0xna5G3UV4lJf+1AnxTBypF2peuwUuxWU/3VfvoehPWffgAd2IUA5ddMlBhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GWHWPWq04tPuLtQuLBwslm96Bu8TdjtRCfK/Ft/rKU=;
 b=F/zb10VKL8tBgrqne1BpZ3AhJIQh46992Uf5fAXAiuTJbXO6WqHmFenLpshXp7NaTXf9uOP+SlhwhQGr/ZTUrSVjK7JybUI8YFjdVCBsLXsPxu4wJyoYnvv0g2ognBfZED5+qsKYtcLZKjBI2qJjGVLRtWKNwfSc2fTBmhH6a401R11hXIV7Hyev0duYw/FV5DImNubzk31hXbO1z6FM+sztknXdBmtQ0jqEQ2t53mdMUdCrVAnv8cbAIT6Srr2cXRdmVw6N/3KnZAh7R1iNyIjEHGCLSqzNJGUtrdYHtv+oCBeIU/vP1ZJlPDfn329gWlYndh2eyzJD09SRN5H23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GWHWPWq04tPuLtQuLBwslm96Bu8TdjtRCfK/Ft/rKU=;
 b=i5h2Is4mS3N8A3RfiWBPoQdxqgbkDI1kDp460HdZDvcausTAtyuV1qcfQhCjAOs+iFlWNXrlPxweb5uc72SCwtvi1vwW6IsOAy69n9vbCYTLvJUKSAItIHL7Kbd5iaX8mJ3WKp2C+M5g2dOk5QCL8D84gNX3nNAVqg7RuTyyvbtNbxXDpJeWdXA3+S7vEmeMfpMLcCQKthe0SaipY+0vvzH2u1VUP9m4BDPKpKbPEo18a5TWBBhJs4Zmjcklwns02cXRSwXVkld+aKH3b1KgCOOUopER6Mw4r0OU4sHh/+eIteBLbi7vv2BEXjehtR5LjnhJ4R0JQzC0uFeFYg3X1w==
Received: from PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::5a8) by MA0PR01MB9625.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:28:40 +0000
Received: from PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c9bc:f785:5905:1e49]) by PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c9bc:f785:5905:1e49%8]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:28:39 +0000
Message-ID:
 <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 11 Nov 2026 19:58:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Andre Eikmeyer <dev@deq.rocks>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20261104151547.70333-1-dev@deq.rocks>
 <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::10) To PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::5a8)
X-Microsoft-Original-Message-ID:
 <e3762c10-e380-4d1f-9613-3f024b3b2cc4@live.com>
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
X-MS-TrafficTypeDiagnostic: PN2PPFCAA8F9158:EE_|MA0PR01MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: c1da14d7-b149-4502-be37-08df400013d8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25031999004|12121999013|8022599003|24021099003|25010399006|15080799012|23021999003|6090799003|5072599009|8060799015|19110799012|12091999003|3071699003|56899033|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWV3SjloanBjMnFTTHFkNDlocDBqUmxyUDkycUR1bXZYdUFGdTEzbHZYWmlv?=
 =?utf-8?B?K3NYT0RtWDlHa1l6cUlaQkpwdkdVSWNnOUdPQ3ZxODlUQ2UxaldNQThJMWZN?=
 =?utf-8?B?R0d2MkJzMlEydGdQU1VJTDBhYXQyUkd3a3BFTGV0b2d2dnRaeHpGK1I5WFlK?=
 =?utf-8?B?am84dW0vT3hhVjB6cXhtV2ttV0FKUkpPVWFKakNEM0xiZ1BZWmpuT3g3T21n?=
 =?utf-8?B?d3FSRDVjMmJTN2N3VEhaS1BHdDJqY05BMjhYSzJlYmlockdpWStxS2QzM0NQ?=
 =?utf-8?B?MmZQeDZ5STNPTmRveE1GNlNPbG05OW5VV05vRkdhbDJNMjczY1Z5YlYvVndz?=
 =?utf-8?B?ZnFhNGtxSWNDWm84NzZzSHZmdVBkS3lwZitNdG9xUXJDWHVBanZHaXNRZ0Vy?=
 =?utf-8?B?ZzlCaUhyTmhiQXdXVXh6UXdUblV2VWhnZ1ZFUnNqWHNvUGlFejVwSUR5ZSs4?=
 =?utf-8?B?akRKMmt5TkdHNW50Zk5WUllib1FHODRXaFl3MmlMQ1RDbGVEbWdsc0QxV2dT?=
 =?utf-8?B?WDl1WHRaM1UwdUF4MmdkT0h0NEJNUjlETHFqSEV5YWJKVWxhbE9HeXdzQTlK?=
 =?utf-8?B?MU5QUTJHSWNoekw5TGlnQU40WC9nYkswdGRvUVJJM2kwNlFFNkMybS9oelp5?=
 =?utf-8?B?ejBvQnBoclgxVGhaRTloK0NKVWZqN3hqS0Z5UXE0NWdNUFoyRlIydWV3UDBD?=
 =?utf-8?B?cUlpZGo2M0lSZnNhZUtlSlg3WTh1U2dwMkswN0NsNEg5bVdoZG1NZnR0TEp4?=
 =?utf-8?B?K3h2ZG9ubmYwbU9IbHhWNSs2WXdZYmIyd080KzVIWGFJeDNLWUpMVjM4Z01W?=
 =?utf-8?B?eXFzalVHcUVjckoxTnFLRzRYUkNQdmF6VTl4bklQQktPQXA4d2lIR3NKTTdX?=
 =?utf-8?B?NXQ3UmhUYWN1VjB2TDJyNWlTYXNTWG54OWV6aEZvRTU5bUdzWWloQU5KWVM5?=
 =?utf-8?B?aTFOaGE0WkJnRENlYzlTV2hnN0lvdWxBTlFpTjR1UFYwVVV1ZUxRWmJiblAv?=
 =?utf-8?B?Y1A5WEg0TTVQODE5dzNXRUZhMGhFSVkrWG1mTm9WbXN1ZUl5c2liQnJEaEdr?=
 =?utf-8?B?aC9NNlRCcE5peVNSb2FZODRPNCtuR1R1QTFYLzFFUDBBY0s0cHZLRUVCSzAy?=
 =?utf-8?B?M1JpamF5Rm9BUTdYZk43aWQ5WVdyY0tzM0dZb2ZNdnYzeDlpSTdUdmlXWHE1?=
 =?utf-8?B?Sk5xRkhGZUs4OUdYU1JqbnUwSlNzaGk3UEMxeWNMa1lSN0VDQ3IyWjV0eldt?=
 =?utf-8?B?cmNOSUJsVTNSalBNSlMvZ3B5dWFHVjBnN01Oc0xIL1BqUHZnb0VuemdPNllI?=
 =?utf-8?B?Y01BbFJhc0VtTzNVQ2hETW00SG50NkRTdFh1U2g4V2t1ZEs4czBLWXdnMmM0?=
 =?utf-8?B?cnZSMlNvVSt2U3BkY1ozUmxEdHpLemZ6WUV5QU9mdVV0Zm5XVXJuR3pOOHdP?=
 =?utf-8?Q?agGOFvvG?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJSaTYvcWd1TDN0MjQ0cEhlZ0hqbVZIVDNkS3dyT1NHeU4zcFdranRLMEZs?=
 =?utf-8?B?VFFyajZCcUd6dGxFVXJhWjFSdkNiMVdhWFRlcmtZMURtYjNVL29PNWcrMXhu?=
 =?utf-8?B?T0tvVnFkSS96Y211cW03QVhVdEExTW5MSWJOejgrVkg4MEpkL05UM0tGUlo5?=
 =?utf-8?B?ZlFNNTZFR2Juci9COWJPMHhpY2JLa3BTSmpMcDVKZHMvSEx4b2lJZjJSSzhj?=
 =?utf-8?B?WW9RaisycXd0anpuMnlxaURYbGZXMkJ3YzJtYjloV0NnbjdXZ2lxRytDWUxq?=
 =?utf-8?B?Z0JKOVI0RU03aDQrZzhpcjkyWjNORmc1bWZuNWZwb2xEZ3drUFBvRStiQmg0?=
 =?utf-8?B?WjZrM3dPMXF0RUZMQU42MG0wREFURG5kdWdiMzRIWENNNkhuejMyZWNsbzd1?=
 =?utf-8?B?Q1o5dkM5TDFuUExIQytOZU9iVXpBRTZYRUh6cDYzbGVzV2dEQlZJbzlhUHZl?=
 =?utf-8?B?enZuWE5hcDBCdi9kem5CZjBKNFJGR0s1bnFzQUY4dWhBSlRQMEo0ZDVRa1lT?=
 =?utf-8?B?Zzd4dnlFRVdUclNQanA1amFOdzNmdGRkMUZKZWJPdFlyZGV1NDBxT0JoSlpQ?=
 =?utf-8?B?cE9nQmtybUt1NzU5SHU1MEJZL0J1RmU5TVZyZHdsWkFQOVFmZXIwVEo3RnNF?=
 =?utf-8?B?M3V1RUl3YkpnT1JMNlk5TVRjbEZPUE5QL1dyWFN6M0VxbDhmUlVUSjcyK01F?=
 =?utf-8?B?UXBKN1JwRGNmaHo5VUJVaWwwam1mb1RmVmdZb3BkT1ZTWVNOSHYwcjYrcDdR?=
 =?utf-8?B?bjRhVzcxbVhtbS92b3E1TzlOenZEZTZ4ZU9GdmFYT0htV0Q4a1NvdGxDZldX?=
 =?utf-8?B?clI0c0NTZFg3MjN0anhUcXpYN1NLNFVqUk50cTVjeENLUDNrNDRwYWpyOWN5?=
 =?utf-8?B?clhRZ0ZjUTJSUWRTbGFwWlZCWDk1azlXK3BBUnBEQU1uU1B6RGZWYTJDbkJ1?=
 =?utf-8?B?NVpzVFdsa1RxVTZPZVJJaWRmWkRSOUszbnJTUmFZVmYwcm1RODVER1pPUjVj?=
 =?utf-8?B?WXk4Tkdlb1lNUkhIcHpIeXZXbFR1bTd0MnlRN2tnVWowU3VsSldCNFkyRldT?=
 =?utf-8?B?aFlvcDJob1NVRGc5eTZ5ejA1aUhuNjd2RlluVGlRMWhQaHpidzZGWmRXbEd2?=
 =?utf-8?B?Mm1kTEt3dWxsb0FadUxOaHFsRVYzdWdUUm5rYy8xMWlCMVd0S0ZvWWg1eElw?=
 =?utf-8?B?c0ZrcXZ2TVdpbWtFZEdQazB3RSt1R3lnTWwvV0tpQkVkdkMwSE1EVzRkbllx?=
 =?utf-8?B?RVNJbkJZQVlXUGVNRFMyYkFGZWpTRDhsNldpRi9zZE5FUWdNZ1dDNnZoc0hl?=
 =?utf-8?B?d3d2TGlJY3dINWJ4bjBhN0t6WkgwSUkxTVlWUUVBVU0rNDJuTnliQVJjRXZJ?=
 =?utf-8?B?eE5GQ3VFKzVwdklBUnJESjZGWjREeklLYTJOcVlxMFcrdmUrQVNOR0MvU3Na?=
 =?utf-8?B?ZFNUTkVXVFdaTnJDWEZqQzdYZVdJb3hZQVFvMXNMWUR0OXA4K0N2S2NCcTYy?=
 =?utf-8?B?SU9qV3JXVmxvYjBWUit0aDRsOVA0MGtScjJDd1U4N3JwaXd4b1RvZndKdm9h?=
 =?utf-8?B?azd1cG9laDhNekw5TlNlR085cHhlVmJISTFYSHY0MXluQ1FjTzI5WlMrYU5n?=
 =?utf-8?B?eW4rRlVFTjR6eGdyalNyQU1weWxYb2dxUS90RFRDVC80MXQrbHdybWI1NFB4?=
 =?utf-8?B?L2VZSHRoUXFERU00bWhHSFpWNTN3NkxBdnVUTHd6QndlT2FycnV6c1I4L0Ni?=
 =?utf-8?B?cmNsZ2NBblhJcHZ0R29yR3hjSC9lSkI2SkhPb2p3ekZITHE3Wk9tQk5xUHY2?=
 =?utf-8?B?L2ZjMFArZyswK1AyWm1ISmVqcmZUa2s5dko2SjJtTzdlOFcvaTRvREJFSXp5?=
 =?utf-8?B?OFBTcHlCUmFJRy92SjkvUENuMnNCRzRvZXlxYW8wSjNxY1JmR1h4bU0yeFB1?=
 =?utf-8?Q?U+LOFnbwl2lxS4vhSV0JnrKzFGzOxscP?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-63b91.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c1da14d7-b149-4502-be37-08df400013d8
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:28:39.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9625

Hi Arend

> I really have no idea how to deal with this series. AWDL is not part of the IEEE 802.11 so I can imagine the kernel wireless subsystem does not care to support this. From driver perspective I am not keen on supporting this upstream either. My limited understanding of AWDL was that it was Apple's variant of TDLS (802.11z).
> 
> So what does AWDL provide to user-space and could the same be accomplished by TDLS? From the explanation above it seems AWDL provides more knobs to user-space, but not sure whether the awdl%d interface is merely a control interface or actually passing data through it (patch 5 implies it does). If my memory does not fail me then adding vendor commands is generally pushed back.
> 
> Regards,
> Arend

There has been a lot of Apple specific code in the kernel, be it HID, DRM, EFI etc. So why not a small bit of code in brcmfmac. We have never faced complaints from those maintainers in getting code upstreamed which is different from the standards, but is needed for the hardware to work. While the concern of unable the understand the code is valid, I believe the author can be questioned to clear doubts before upstreaming. Getting code rejected just because of inability to maintain is heartbreaking when people work hard to make something good. Also the patches are just for Apple Macs, and not for supporting AirDrop on random hardware, so it shouldn't be that difficult to maintain.

Ccing some Asahi folks who might have a shared interest in this series.

