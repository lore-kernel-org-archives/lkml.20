Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793012776;
	b=qbbuME1Ll1R05RvwHpXiSXJhWuZ1Wdkb6dsYW1P30zW7cUutAsQjHpZ1zfw7lnATMefl
	 2eFKIMNIoXbec8ITIWyVtoTpAmCFilWo2NW5p+qWYaVBUHGlAkiUuHlsugelsL9cEbbLa
	 bZ1bp/AJM5MiajVXV1DYPTjhAa3eAdkPOpjp0f0rf1f/eY/RMdHoTLh6SXeZr2/UwxynG
	 B7ctc43Ecr1omeen3ZSldSH6o16XUsJYg+e01+EPR7HOZfs4MsJHEO90orKemWLkdAJGJ
	 dgJdwh1bNUhseXwDc4HO31opFPaQt/RxGKWgY9tRSU9zqMBH+wmV1FCVT6wmIpvyHMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012776;
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
	bh=YfopxiSI3qC5clGu96zsrcQIm2MGxjfHqGH6mHfqAu4=;
	b=ltLr8s9jJ2jVrpzIm51YCNGOebWblbySj8ZKcoK74hmCe1vjRTPJHht15Qhky1gFEDY6
	 WkPl8UE7b0KUaj7Q2GaaHEgVu/oCXzkzXNMJdwR0W3kA7QLYt0XS+MOLNoa0xmGAg2I/w
	 VQ/E1j/nANiXzaTEMasHrz+SyHWN64MKiNyn9qIoYXy82N+q8YNIjeWAsW44IMn/XDIn6
	 0X0gZuhmXPwqXtM4HR3HuVGPBreXKSuKSrod6BEYs57MAdWY3HgnktrDbanejtQOrLaTb
	 aGHJAyHTK36WD/FAp2pdCy5Ey9iAKWTprIo69yBJssUiLIz19D5MQYuDi9nVVu17z9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=NJzfuIo9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.5
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47A606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C47A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=NJzfuIo9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucfK2F1C4niOgT3zNPjLWVWDPQGKD3hawnJQ1sGsoZwOTBAjPJrm7rBvOIljriuNqgcFs3BgYb8Mia33eFQfxhBIojQGcnraZa70Zi2Tb2oWfusQer5RmrzP1PoMfKn2UcCYoUaGOchgAtR7cDlYSVRbe4DUwLVJfUPcSwID1/4XsyJqAses7dLXywYCcJiV36K9UljvjRAfdSdnBl/LUjWl3USAbRqSQdRX5KJx36ZfUtwmk0jN7Bx+RTzTiyP69hDlDVdDL8D2iJNfh30sams4u8stbqvYhGhjggfi8Ikh/mP6qc/L1oiiL6TAv5HwEYKgQQOq2bxlU1HVsmnzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfopxiSI3qC5clGu96zsrcQIm2MGxjfHqGH6mHfqAu4=;
 b=G+7RyMwuKM+xDCEKqdqtYfClzF3GFmmYmaraWQaV2uzSPGWiBovKIrAl6hfxaO08cw9bvbdl3bE/P0WsC+9qt1rmHpZOhym/oY3DN5Gox2wHaiI57AJ6IaR7qmm6KpzEQQfPf+7rdA2mAWB29dNmFNaQKxXEIoPY7cXc7By3CsYhKYZoC04pbRBiEnlua4T/DNW2pg74cN7Jbv75Lws7W2UvA4ZSRZdmPjHWOiKITCQM8JAmJNyuXCCV9A6EGB46R8EJnPmxc3DSemRvQVaJ1P9GiqE5eqNR2n0tRU1hAZB891fmhAXRmDJRU1/ITJsfquswUmSSzIzjM5tU65w07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfopxiSI3qC5clGu96zsrcQIm2MGxjfHqGH6mHfqAu4=;
 b=NJzfuIo9BSB2+awxUDET0j0zaZqeH/w0ofyeA29V7H4qdN6FNd0Ps3Bw/Wmy1wIBe+U+ljw4VU3AmIO/uogwceQnWd+434pRac+ueI99BghheqWfSg+srK5wq7m9rdnWsVhqwG6pz106f1DsWjT63KicH69ccqMEN3KRkfD8DS8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by VI0PR09MB7368.eurprd09.prod.outlook.com
 (2603:10a6:800:24d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Mon, 26 Oct
 2026 11:06:07 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:06:05 +0000
Message-ID: <7cd3e85b-9602-460c-ae90-f0817a6c0c45@mobileye.com>
Date: Mon, 26 Oct 2026 13:06:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] riscv: support CPUs with Zalrsc but not Zaamo
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
 torvalds@linux-foundation.org, olof@lixom.net,
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
 Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026103014.GC2668200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261026103014.GC2668200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0017.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::7)
 To ZR6PR09MB889505.eurprd09.prod.outlook.com (2603:10a6:910:e0::22)
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|VI0PR09MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e669d5-1e1b-4189-cc6a-08df33512190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AHc+XuPM2hoh6rm4bCA7XOb1OlkoQe8AdDZ30C/Lt7wXjMFNMtQbKVoWy4ESOHrLEm8Zn/Mk2E7AFCmOx3Ap4f8bxnFKDN7j/PYb2GKxB7Nh+OJYDiB53iY7J4L/ieot+T5ZhCO9o7xpWi9NBWhESz9s+wfXWZ3T8NTtrsoPZ5eZeygLV3AhvCKCFPLBK5IdRywXY8yg7v1kWa06FLL4BKgYItLl39IaDcSwdUMZY09oyf8Sh5k/cYFUXdUdf1gsBXaxlS1o9sJhmDQDS0VQEjlLBZcvwue3xNdlY04VEH/uoPFjl2Zn03kXEe9EQH3gP+UjPxbNsX418znUxqJcSXnyd8Z+HLIn3L6b/4x94g2Odxs9A9TgsovdyHWImFLg5B0LESO2WRbhrgBEjOxBHzXcUaSuPslvTyo8YQl3GArIV8VX9H4CCFSB15JFekxYdPkmdzS2wy1jlaqarhEYmd604xY8s0ufAdOCs7ohpBfLqGgaIIoZKCk36QjogP0K3oyRStsd7tGinkONDJKtnxrhbJ7sknWNpPTBGYtPSbnnE22JYBY/Cr1KrMEvVyOSQsUorNfZ/AFY6eUoO/LAi3eliyxKCLblT+o7UdYMeZacipDSC7rmttFURkkZxWh4RzMgPcz4jv1FRhVYLhWlLiIADngnXL/r5tcfE55mr80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZLbEYyUCtRSEdBQmN0R2pUTlBiWHp6OEY4SmZPMzU4akdNdDJQYmNGL2gz?=
 =?utf-8?B?RmZXU21qWXh3M1hzTlpsazBRY25UZFJVWkJsYnl0VjRJK0drYkNwcVM4TVFi?=
 =?utf-8?B?eVlmeVVYRStxaEVGN1cvSzhoaHhDNURNODVUUHBhZGpBTEVsUGc4NW1tTisy?=
 =?utf-8?B?NmxPWldwVUlZWHJyc0hSZWozakljWmRiRXZ4dVJLVUt3VGhmUEdCdDNHdjk2?=
 =?utf-8?B?YWZtRFJLd0FDZFZrTlZ1U1A0MkpYOU9hdWVNbEdBaXF6NXZoUk9LUHRlbSs4?=
 =?utf-8?B?c3p6S1hhYkkyZ0tSdkF5djNBTVd6OE9NSW1yL0t1d1Y4ekVRZHFubHRERUhI?=
 =?utf-8?B?UnE0dHF2NW5yTXhnT0ovQ0ErdVNjclZjL3Z5MEM1czI5d283cmRJTzB4aVhJ?=
 =?utf-8?B?cUlma2wvVzU4WTBhNXpyV2QxcmlVUFBpMStsQ0x1KzJPbzlQZUZ0MzFCcEx2?=
 =?utf-8?B?dzBRbUZudk5wSWxzZUFBZGtEN3NJZ1hvZm80eWk1SzBSa0hvTk5YRXhud3kw?=
 =?utf-8?B?L2R3ckphTHZaNkhmb1AvMW1QRWZDMUZvYXBJcTh6QnNFbk4zQTE2eG9RRHVq?=
 =?utf-8?B?ZlhOZzJKUVg1V05ndVBsZHJWOStXVkFNZ2w3T040Rm1mUllJQ0JhTGxCS3l3?=
 =?utf-8?B?dTkzaWdjbm1xcGhxUTAvUXJUa1R0TUZoOCtJaUxjRlBEd0VUY0sxSWlFaThL?=
 =?utf-8?B?bERJNUJ4UFVnQUYveUY3VDh6UmFBTmd0WGJDNVdjQ1VRUTRvZHpUNXI1QUVN?=
 =?utf-8?B?UVhVeklvR092cTAvYUMzZ3lGNkIwR3luVEJjRTRTVm9ob3dleE9qWlpDOGdJ?=
 =?utf-8?B?aDQ1a0l4SE1WVVcwZ0hCNklERGd4RHJ0K09RcUdYa3F1eEt5Ky9GUERaNklT?=
 =?utf-8?B?QUVoakxzcERndFJUOWpqeWdUb0tPNHNVQzI2b0ZQaWJBZ0ZuUDNRZTNXbVZU?=
 =?utf-8?B?czdnVDhYc2FUeDBPS202RlRjd0xhQ2g1aHFhK0g4Z3lNcWJNYVYrL3dGY0Ru?=
 =?utf-8?B?MFRGTjRhWTJNUDVCNFJTL2c2OXhrRXVpMTRpTXVSUkt3VitjWEVaZjZHMTdH?=
 =?utf-8?B?ZndESTNLMzQ1WW9LMTV3SFJiOWFZbkhMa290OGFjaEJSMHNMSEdXYkxhKzAv?=
 =?utf-8?B?QXBneDJtYkRBOUtEdlBCV29UWWlMbzVLUCtYWm5xOS95WHpTMkxsSm03ZnVH?=
 =?utf-8?B?cXlBdWI0WmdWa1RFdFVFdXY1bDdYNVJBVTNyZVMzbFdkUEV6MGxiMmpnZU9P?=
 =?utf-8?B?aXlNb0xFaitXSUpzSTZieUtzaG42TFVzaForWUJCcUYzdjViMXRKa1l5SWhO?=
 =?utf-8?B?R25nbzZicE9vclN2V3Z4eG1pandZcmsrK0NXZ2tNV0o3UTdZL2RaRm1vem11?=
 =?utf-8?B?cGZQTVhvMUtNbWE3QXpKQmNEU1d1czdqNUVib2IxcmlnQWNRRE1IcmpaNFJM?=
 =?utf-8?B?em1uTVcrUTZvcjJESXEzLzY2RnNubGhpM0N6c0ZEc2FTUXlDQXNUMjAxVlpD?=
 =?utf-8?B?UFlCMndoUEZieVI4WVpMc3RvZ09pVkRua2t0RUhmQWFsdzZqcTVjM2g1a1pF?=
 =?utf-8?B?d2hGSFVESVN3bkUvR1RCcnBFZi83aXhlaEdrL29Fc3dTZW0vNlBIQVZyY09z?=
 =?utf-8?B?N1pGb3krakNuUEJ0RUhYd3F4YjAxUlk2OVZsZmZ1TUpHT0JZQlY0aHdiNlRH?=
 =?utf-8?B?TUZXT0QvY0tJQTFqL1J3cXVyU3FBVnJ0WDU0ZUxBOG8vdEcyNDRqVGIzR05x?=
 =?utf-8?B?Rnp1cHZVc3grSXVuTkEzb3dEMVp4TkxwV1d5cldCcjhvQytHRkM1SzhGYnRs?=
 =?utf-8?B?TC9BRHpEQUN3OWNOYVh2ek9YMXdhdXAzTnVBTXVqR1l0NjJtMFJwOWF3cDhU?=
 =?utf-8?B?UXJaODdhVVc2Z2xVR01lMGtMcFdZVEVXOHpUL1FqaitIVGl4M1F0NmVzdHFT?=
 =?utf-8?B?OXJ2RlBwS0lqSGRTdU1jUU1sWWo2K2VlUGRrQXRNZ2FDeE8rWGNIUWY5OEcz?=
 =?utf-8?B?RGZES3BKVWdZNDFKTEhteXlzRUdaQ2Rpa1BKWGt5bVk5bGo0ODV6cnhwbUFF?=
 =?utf-8?B?anFGMUwvVlNyYkxqcG81TkdrSnI5YjZjNnlkcWl0RjdZSXRhcVlONXhRUnR0?=
 =?utf-8?B?VmxxMy8zY29Ia2RZVVJSNlR5cFc3WVB3WWVJc28wckltbGw4M1I2R1N6bGQw?=
 =?utf-8?B?cWFnNjExOHh1M0NnOFBvc2lld2d1OXpjYTVmNzdyU090bkkrUjZkb0VsS0xv?=
 =?utf-8?B?a3RDUVRhNDU2L3hGdmZQcjlueklibXJOMGJJa3VHTUZGbUNLekFzNmFpQ1VZ?=
 =?utf-8?B?dE5VKzJmSldOMTNMUng0bXdPR091K3ZEWXZWcWx5MFYzeGwwS3dwdz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e669d5-1e1b-4189-cc6a-08df33512190
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:06:05.9531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4A0r4gfNx1YMftIhJ9/M9NWG7tO9EmWwIh0nDXxxoSnJrZ9yoPkklWgWLNN89UeWNNtA9NwOUeOP8nXnX7C5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB7368

On 10/26/26 12:30, Peter Zijlstra wrote:
> The comment with RISCV_QUEUED_SPINLOCKS state that Zalrsc requires that
> cmpxchg() loops have forward progress; which is much stronger than the
> typical LL/SC implementation.
> 
> Does this MIPS thing indeed provide this?

You mean Ziccrse extension? Yes, p8700 does provide it. I explicitly
confirmed it with hardware designers.

In fact, I use RISCV_QUEUED_SPINLOCKS on this platform

Thanks, Vladimir
