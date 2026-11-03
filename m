Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710659;
	b=22mK77kjowDJTWUMtwLtM4Dc4XBLOZQutyNElmj39m+PrXFu7tVCOPZSR36T2RFraFDc
	 KDjuPrIruHWqEEw4CyFjFOYyT5iEhIxROdKJ5bRjwpc4aqo89iqm+0m/vHNqxNWxSpd0x
	 deoLQ1wDIoZxcGJsAY0aNGgpkOHDUfUMAo7+q7EiesXYVYYbrfuHC+Te7xnv2Cn9C/Ofc
	 CbXIFw7HQolpJTsiBMDvHF8FCIUiewLWbK5C6Ch19x65omsKJlyvCqIfw9DnYsCEHEOBG
	 k7op33+WXXHv5dWUud0LikmejczgdmlgwIcLIHZrUyQcx9dQ42ypK+sdOO4Xa9oga0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710659;
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
	bh=N2Q6tip6u6LtIwrZMccIV3t4G7pUKCoRQuXcCw1MFHk=;
	b=IbEv5YolyzuIYwSVpODxtOj7a4tU+e/OPZtYCpO16Y/5JeV5MH4XnLPr5BGF7OYuU02N
	 Ji9IptF0d1+0EJmYYm32J197GpY3ztE8SgWy7NaCBMbOkPOQO6xTeCUyzvMYksaWy59zo
	 W1sj8g2vjfiqxqPJigx5D28FMSIB0wiPicTb33jPmcBUVTp6AWXmPQeo1Zxw8iOPlM9vj
	 lHeI+QfSXXeDuwlo7rq0ahR0UEwRCHivoZnPNugSACEb4q+E0P+cON6UF42rOEmVCuN/W
	 O1FedDbBPuNn4iOIHhbYO/LT1MHXPNdehw5bEZ7xmpm0Gq+xcTOET4UYrpmzaguI+vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=PTl39bgz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35DE606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=PTl39bgz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmu84q03+0DID3PS+VAPeXQcI4uncSqzOgOGhvpBW23wbmgkML9ghDG2RyA+B4EnI2mFYih+5V1POk5v8LCiSvVSr20iEgLU3Kz/3FUIzNvcBe4rFJg4qp4xxuBunCBQ9HYj1Au+oAPJtK4phkuZitScONASJ9vIBPSwM/pi2vZnw+SB0zyABOFpaqL72QYm7ghBkRwZEDNov0yZVA2FtVsbPPUWJI4gZPt476JlpEV7JdM+98ZpVciCKP5zFeXnCm8KI65PZwe6gDRzyV+8n6Lej3BSx6EDx3TLrg8uMhjx4SyxwH8J3S8x/8jjuT7324UCv/xpM0/Hr9TAC0w20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2Q6tip6u6LtIwrZMccIV3t4G7pUKCoRQuXcCw1MFHk=;
 b=Ys4RNQRoxcKT8uU3DPcFPPsTrHHfK8KjXzWbFswsW3L29Kud6aPLSCOD9+9TydN2UJhHeTy+kBn5O1zEz+EZm4lmzp1aYz0T6h1IqdqT6eDa8Sq+sE7/xql/fJvaHya1VxnWOyBsojeBdRnPtzivOaDqIfdlD4a27eNvIq3xY5R9dSqGw52lm0lCJLA0BVbpYPmr//GixD11qAGfdpd4axRVyuX0WCfh6sArzhaH+5xKNBMSeAd3yDqw+V/Rz3gSUFjsnidCdMZwk1ohFCi1i7EDmCcSzu4BCy8n/L1SLIZBNfwbOHY8FnLKSGY2GSY/kzihp79bmhc2FXjRQI9BVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2Q6tip6u6LtIwrZMccIV3t4G7pUKCoRQuXcCw1MFHk=;
 b=PTl39bgzkcYYUOSPqLABM7clkP1xfJ1asNZZj4ZyRCBwPnwyX8wFW7Wo4i3Y/XwkqIeWltdhNuXh1gFth4eC/IAc3LmPZmZTQ6k56P1JuNt6Zdy2NbdUEU6A9mreCoEBe9ibztqgkcvPy6VLTu8TmxtI6eQD3BqNP65KbvI0eWo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by DU0PR09MB6018.eurprd09.prod.outlook.com
 (2603:10a6:10:40a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 12:57:34 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:57:32 +0000
Message-ID: <1bcc885c-b013-4ab3-9b08-1d1f89b09762@mobileye.com>
Date: Tue, 3 Nov 2026 14:57:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
 torvalds@linux-foundation.org, olof@lixom.net,
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
 Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
 <20261102-persuader-catering-5ed81c35ae0e@spud>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261102-persuader-catering-5ed81c35ae0e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|DU0PR09MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a18059-3c2e-42b1-4ce3-08df39aa0646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|261021121427099003|261102124527099003|5023799004|11063799006|4143699003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|261102123227099003|6133799003|3023799007|261102130727099003;
X-Microsoft-Antispam-Message-Info:
	VeSvOh+8NT2j2g3HpyeNYbn5qvoyNAF0OUMTj4PtsHXuJ1LazkUl8jd2dQYCvcbPmhlQco/ftS9UV6fv/3h4ye/1s0ZcR8cMn/txj/z1vb8WGMrDPcJr3Zfe4lCAKi1NHDin8+es++dZeLwsLYiPec8hZAF2vh1ONnsVba07/55ywaImOsyaFGJwBh8W63O5VASnaPdAyWClWbhMy+FnKSwvWglAXeyXE9L9jzQIR4Foi0aRlLA4A+RcfgbYpSJ1TZv9c3ZxCiqGs89tZJzvDiJf7AOSiNgyz/N4fRQ7gudyCCzdgheiYC0p9HcRqkaLnziNZUzXLc0DFjzvpfCvLAc93pOfUf7zezSYUjrJdJm/Y2IgTLVrvj1JOVBhRp+c329ULnUx1WweNpJl6bjubN9l1FGSiPp+ZgNmw8XjXpuC5Cy+8Y+tFhVnf4kZvt6TP+KcQcrrjSbqxW/nOd0yhbsf6N88CXSkqt8qgOUurinNmXygY7jq4Q5ETKqi3fq08kAtZ76vsXPIOs68SAFGQ6KoPiav9tS3aC6Cp5kA6kW+PUO3y+DXLGkmm0n6URNoeDoOeHCk5t5mJO5bdT6WBGZB70WtziY8aB3gryTUfftRJN8JGO2Epc60RsTrJs2b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(261102124527099003)(5023799004)(11063799006)(4143699003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(3023799007)(261102130727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk5maVNmcTF0Y0pwakZIWHBsOUc4bVVDS0tiMWNIOEFrVnh0SEgwY25OTXlB?=
 =?utf-8?B?bGJVSGRsbHdDU0xoQ3p3ZE5kcFZSamtiTDZUT2oyTXdUa1RteEFIWHFZR3JS?=
 =?utf-8?B?Mksxa0ZXZ21senU2N1JJcnROcFVjWXhpNDNTd2txbS9DeHE4VUNEQVFjTTB4?=
 =?utf-8?B?ekZjck4wN0pGdzI2Q3VWRlRTWXdta3MvbkNCc1lVQWNvcXZKT09qL1dMUVp5?=
 =?utf-8?B?YWRYQkpmazJ6bEQ0R0xVanlQWVpUQ1BYUW5qUS9KaCt1VEc5Q0puY1lETVIv?=
 =?utf-8?B?RTAxaXJEZHFQK2VxRjVGMXRRMlBFSDBxaGVTb0E5Vk9sRVNEVThNQkpFbTl4?=
 =?utf-8?B?Ulg5UVM5TG9UUTRYWGtBc0lSWGNjT1JJYVpONDBuSyt1Rzk1TGlOWVVZNnh5?=
 =?utf-8?B?SVcxOUIwcysvMVQrK1BTOHA0STFsdjFPZFlDZlNzbHdsOFlENFpEK0xta0Mw?=
 =?utf-8?B?Z0ZBNExvdUYwT0ZGUnM1N0FhM05RZnMyOG9KREJoWHM3Sy9Fam9NVnRUckRn?=
 =?utf-8?B?TFZSTUdkMWZvU21IdXhCL1RtMUJCa0RkbHdiazlFR2h4clNyVmxIL0VkNFRJ?=
 =?utf-8?B?blhXRzNZU1BJY09tOUVLOUJuT0czZEovb080bXp3RkxjU0RWdWNJZEtaMU5k?=
 =?utf-8?B?REJtOE9FTFF2VFVFUW1MMGE3aGJuR0VFbVNPMitubmxxSGVucjMyU2xBNmFy?=
 =?utf-8?B?cDJOaWVXUit2Y1VNY3BnY28vS0hiNzNzN21ZcHh3Umt5UHlMQ0Jxd3BiNUlw?=
 =?utf-8?B?WGFTY1g5anNoT2p0SkhlZXVTMXcrbFA2bGt2akRmckFDMHNvVWpHM1VoM1BR?=
 =?utf-8?B?ZENNQjVoclVTTlFoeTRhS0Z3VG1oNENsZlFmc251aFlrV255WjVOc1RieC94?=
 =?utf-8?B?SHI3RGR3SkdYMUdVUXkxaHJ1Rm1mb2NUc0FYczRKT000Vy9CcHdWN3JZbjFj?=
 =?utf-8?B?VlIzNVNCNG1FeHJOZktlclR4cFJqNGRidVdnQnE3QjdVa2FrZkl6ZERpUkU4?=
 =?utf-8?B?d1g5VnJyc3VxVnhYVThhRnNMR1ZUeS9UcTNadnR2OXF5S2tDQnZRallQMUpG?=
 =?utf-8?B?Z1orbzlJT1diSmU2elJvQWVJcm9MSEZ2TVg0K0hvejN2WWcvOTNHOTcxVEk2?=
 =?utf-8?B?YXRUR1FVN3JPRE0zMXRxNTNGNk9rQnJtYmlhVzdWamQwbmZMMkZCSHY0eHBI?=
 =?utf-8?B?ZmFmLzBPcG1XSUFoOXJKUkY2TjFYZ3BpdzRzYXlnQlFKeVlmYW14RXZEUDJB?=
 =?utf-8?B?MFQ2ck5ZZThSdUd0K0hvVjgzMWF1bmQ4VW1sU3M0TmJCUmFYak1BQXB1K2NP?=
 =?utf-8?B?NXFZMERRYW9RTHp5R2RzWWZ2YXBVbzVrRWtScG9aWXh4UzNHUTRjbEdqQ244?=
 =?utf-8?B?ZVRvaXM5bFJQdTI5MDdZSUhpZzQ4a0oxWmU4ejJCOUxkUFljcUJRd1dPYzEr?=
 =?utf-8?B?MWJaODhVYWowblRreDZpKyt5NWxiVHBjYlJNZ2QzL1lhSVJmY2M4dXg1U0VS?=
 =?utf-8?B?aHRIamdaSFJtUXROZWlVOEU0TzZjWSsvM3QyMVZZcVVJb21KVEF6Wkl6MG5n?=
 =?utf-8?B?UE01NkdrY2lJVHYvOVJjUFFvZmtvbkhuQVVEZ2FnL2Njd1hTUmt2QnR5bWlU?=
 =?utf-8?B?aFhldUlyT0JRMEhRNkZVRmpkeHg0bHdiZmM4aUpySlo2S2JFWkk2eDhkbFk4?=
 =?utf-8?B?bzk2bnVZL1FHa09VMm0rSnl1YmpUUk5Kck5DRm8rM2JGK2JsMTllaG5xMlNC?=
 =?utf-8?B?djBKRzgySmhNUDR1UGM5bEJRU21HelNEdkY2bXZIZHpKbi96RHV1endTREJS?=
 =?utf-8?B?OENqQ3RHTUVUNzgwckpLTnhkR2F4L2grMEFMcUdqVk1lb1dmRWRwSVJNZHFn?=
 =?utf-8?B?UEQxWWRQVVNreVJTbW9qNmpxQjlkemo3ekdIU2JoenJ2M001b1E1SmZEQnBt?=
 =?utf-8?B?ZVdwQk1TdW0yaEdzQW9kMnNlcW43WDRnSk9IdHhjaWgzbjJiWXV2Mi9BbThR?=
 =?utf-8?B?SFB6NTZ4K0l5VTZpeFg3aTlubkM5bStkSTRNZWlLR3dVSVJrUmQ5b2lsL01Y?=
 =?utf-8?B?TmE5MmI5SHVkWUNNZy9wSGZWODYxMHA5V0JjTm5LK1FYSm5CSFJPdE43bzYr?=
 =?utf-8?B?R28vdmlwMWdPQlZVSWNEY2c1QUZYMVR3N2JnbkkzVUN3cnlpTlZyZlI2NkFE?=
 =?utf-8?B?TWRqaXVpWC9XcnhPMFVpblBvcUorM2RaU1VGelZ4Z25sVHpkcnorNEV3ODVj?=
 =?utf-8?B?MlhjSWJscUFMU2ZCZUVrYmowemNDSG5EdUN3Sys4aG9xSTdXWEZVSFhxOE9X?=
 =?utf-8?B?NExWT0JXcmNTeEQ2MExoanJ2ZFMzaWtobGFLZTlBZnBZL1FPVThvdz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a18059-3c2e-42b1-4ce3-08df39aa0646
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:57:32.4023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/uczXuZdK/yJK9lk0xrStSXJaKURnBl/KPJFSmWv7pYRJ7WDCcanNNh3x1kbFzFiztZ79xL0PNelnbuW8WHdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR09MB6018

Some of issues already fixed on v4.
- Link to v4:
https://patch.msgid.link/20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com

On 11/2/26 20:46, Conor Dooley wrote:
> On Mon, Oct 26, 2026 at 11:20:02AM +0200, Vladimir Kondratiev wrote:
>> The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
>> Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
>> about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
>> so keep the existing AMO sequences when the toolchain defines
>> __riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.
>>
>> Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
>> selection still passes "a" in -march. Zaamo can be turned off only
>> with CONFIG_NONPORTABLE; Zalrsc remains required because cmpxchg and
>> the conditional atomics are LR/SC sequences. An LR/SC-only build
>> passes _zalrsc instead of "a".
>>
>> Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> 
> As you can see by the lkp reports, this is not the right way to do this.

I fixed these lkp reported bugs in v4 by TOOLCHAIN_HAS_ZALRSC that test
compiler support of _zalrsc in -march

>> +config RISCV_ISA_ZAAMO
>> +	bool "Zaamo extension support for AMO atomics" if NONPORTABLE
>> +	default y
>> +	help
>> +	  Use AMO instructions for kernel atomic memory operations. When
>> +	  disabled, those operations are built from LR/SC and the kernel
>> +	  is compiled with zalrsc instead of the A extension.
>> +
>> +	  Disable this only for a hart that implements Zalrsc but not
>> +	  Zaamo, such as the MIPS P8700. The resulting kernel cannot run
>> +	  on a hart without LR/SC.
> 
> The text here doesn't really make much sense, given it is default
> disabled as it depends on NONPORTABLE that is default disabled.
> If this is retained, it should be default n and the text reworded.

Not exactly. RISCV_ISA_ZAAMO is visible if NONPORTABLE &&
TOOLCHAIN_HAS_ZALRSC (later was added in v4). Otherwise it is not
visible and set to "y". If one disables NONPORTABLE, RISCV_ISA_ZAAMO set
to "y" with no option to change it. Same for added in v4
TOOLCHAIN_HAS_ZALRSC

>> +
>> +	  If you don't know what to do here, say Y.
>> +
>> +config RISCV_ISA_ZALRSC
>> +	def_bool y
>> +	help
>> +	  Zalrsc provides LR/SC. cmpxchg and the conditional atomics
>> +	  require it, so it is always enabled.
> 
> So why have a kconfig option for it then? It's pointless if always
> enabled.

My logic when adding it:
There are 2 sets of extensions related defines: one is Kconfig ones,
CONFIG_RISCV_ISA_<ext>; and another one found in the
arch/riscv/include/asm/hwcap.h, RISCV_ISA_EXT_<ext>

In the hwcap.h, there's already

#define RISCV_ISA_EXT_ZAAMO		97
#define RISCV_ISA_EXT_ZALRSC		98

added by commit 35173b666a16 (riscv: add parsing for Zaamo and Zalrsc
extensions, 2024-06-19)

These 2 sets are logically coupled, and used in the BPF JUT code like

#define rv_ext_enabled(ext) \
	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) &&
riscv_has_extension_likely(RISCV_ISA_EXT_##ext))

So I thought if RISCV_ISA_EXT_ZALRSC exists although it is mandatory,
CONFIG_RISCV_ISA_ZALRSC counterpart should exist for the same reason.

Do you suggest this is different case and it is worth to remove
CONFIG_RISCV_ISA_ZALRSC anyway?

>> +
>> +config RISCV_ISA_A
>> +	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
> 
> I think this all needs a redo...
> 
>> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
>> index 616b8b332ac5..dc6a8c95c975 100644
>> --- a/arch/riscv/include/asm/atomic.h
>> +++ b/arch/riscv/include/asm/atomic.h
>> @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
>>   * have the AQ or RL bits set.  These don't return anything, so there's only
>>   * one version to worry about.
>>   */
>> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
>>  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
>>  static __always_inline							\
>>  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
>> @@ -59,7 +60,25 @@ void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
>>  		: "+A" (v->counter)					\
>>  		: "r" (I)						\
>>  		: "memory");						\
>> -}									\
>> +}
>> +#elif defined(__riscv_zalrsc)
> 
> ...why are we making this a compiletime decision in the first place?
> Why can't this be an alternative, starting with the zalrsc stuff and
> moving to the better implementation if available?

I started with alternatives approach, see
https://lore.kernel.org/all/20260114072552.731974-1-vladimir.kondratiev@mobileye.com/
Then I converted it to the static compile-time decision following input
from Gary Guo that I think is valid, here:
https://lore.kernel.org/all/DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net/

> Is there some zaamo code that gets generated automatically that we lose
> out on by always building the kernel with zalrsc instead of with all of a?

There's BPF JIT that emits AMO instructions, patch for this is not ready
yet. These AMO instructions will be emulated and work correctly but very
slowly.

>> -KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>> +KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)fd([^v_]*)v?/\1\2/')
>>  export KBUILD_BASE_ISA
>>  
>> +# if "A" not supported, toolchain shall support zaamo/zalrsc
> 
> Obviously this is not true, disabling some Kconfig option has no bearing
> on what a toolchain is capable of. You cannot put _foo in here without
> checking if the toolchain actually supports it.
> If no zaamo instructions are automatically generated, this dance isn't
> needed, so my suggestions for how to proceed depend on the answer to
> that question.

Fixed in v4

Thanks, Vladimir
