Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897566;
	b=Ib1PFagyLVVKf8KsjOQD36vn4WA8DXOYWABIYPTrCldArD0PHVWv/h4xMBZhCLVzj6kR
	 plZmPFO0gvtQa1Z5dW8NDKVmJgIIrZTTwVwx9fySElkYYFZ+VQEGXhbiRiIGzT/T5iG3l
	 fWkTJkVJYtDf9uDNneT1Ub1RIvqVf8LOwlOt31rfomvvY4Ca31Xrf9dHvSDM4HvDQikek
	 kJfG32M6nKLD+XIOGTUCpn3vEaSod08mvltclLAfah3xYQoZJOLLKfrGo9TcoamCiJ2wS
	 AxTeCMmWTsykfjsQ5Mx/cFZa0uag3gUwoN6EcLMtNWXptvQ6xEIUbps1b1yGdK3qc1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897566;
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
	bh=PyWLrXpzq0Q8zj8va2M5NfXGrUPlMop9TMbDquVSRgE=;
	b=5VGCsDwGbhs1nmHy1wbcvj1upzxVb/0g8VyYuFE7kxhx573tcogYFDU6cvxUThqDtOXw
	 kIQ2LZiqFUA9FQ7WqXIDgImhKsititv6pG5Nx2B/9mw6o2hUmPkxQBZbfHt3B+rIYEYP9
	 IWjGZ7HN/W4iGp7ubAKkKVhe97c+BkmiQLcpZ+0ejjDmq2jgQtDLGzRwul/M+b4K/WC4h
	 +dkBh2cVC4dd01lX/3w75YHFsZIih4JR8KsTzf3iXI8yAbD3VPhh1HYskzDHVUecF3znM
	 ndLXJzRzTB5OQtoCktOLVXPmmDzO9iIBsGPMjKsbSDklNReXJwoDKy1FOJ1erXi8uSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b="PTo/a0zS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.9
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F62606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F62606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=PTo/a0zS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzwMZ02xn8bMJOwywd9/xcYLmmGZ8LrMO54nRSGXgIIFMJ6nlYRhslmTqJJLhOCrE/F62SXnUDv2WdNZAjCcNwxKDtI/w8yO5lZrFKBUpT1QXtQViBiER9EfLZSrjYlDR3GGWniO8v3GuKDXMkGOVd9QQFWm4J44RoTNUCaOsspC05PzVf89CxG3PbxJlcdHfYCv0jwSj1olICk7zN0FbdfN94WAjlgtg/thsk76+3YwJLFj9Pg0gCkeE5nDIOKCB1W30O9rVlFdRMQDwUlw0dvrGxL6/Ws8Vnb0NF9Z1skhsWJlvb1KpArqjB33TUMWHC/TyUYs2hiAXkrZE9H0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyWLrXpzq0Q8zj8va2M5NfXGrUPlMop9TMbDquVSRgE=;
 b=vYGws17ZwyIN1y9EZMID/OOs1AdXw6UPNTCBT90on+O283cfsHHuIVXmt6ifGCwq4knb31t3vGjq1ynHc3mV+7z6qeAT+DxMXFvJrBxzNJfZBzDth3xzvVShO7s16sVGcA92vVCjYzn8iOYZke0z4A4jXKe/Zag9qQk59Ufy0ttoKZdDpgAAoohX51xApHP0E6QSaOpfblwVG7SS/MczzlpCDVkPhWDSASFGnNJte2Es8JbABiUMhaZ9MwyM1JbE9HmrpwIdzL3oigNSHThAcPXydhIdWNoddabtZDe6bVwloJoKLoT659A5XJR89BRuFzCrt4tyisyfpq9z4cv4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyWLrXpzq0Q8zj8va2M5NfXGrUPlMop9TMbDquVSRgE=;
 b=PTo/a0zSMJd0foELlH0dEBfIMuejA3xDzXbN19HLKoWvUtNIAP2S8u4QcZELgs5Ree6PaHsg6JPbuA0m77v5xlbzR3lkBu2Z3k18DiQiQb0cixZha76siWQ2mqQ9by2GI3DBU2BW7SUjI4i9Jqg/icyvZEFbvGfS2ql8q+jvizc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by AS4PR09MB6520.eurprd09.prod.outlook.com
 (2603:10a6:20b:4f8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 16:52:42 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 16:52:41 +0000
Message-ID: <fe79cf85-4346-4e7c-920c-0614a8809dbe@mobileye.com>
Date: Thu, 5 Nov 2026 18:52:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] riscv: support CPUs with Zalrsc but not Zaamo
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: pjw@kernel.org, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, peterz@infradead.org,
 Mark Rutland <mark.rutland@arm.com>, gary@garyguo.net, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, cfu@wavecomp.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Olof Johansson <olof@lixom.net>, aleksa.paunovic@htecgroup.com,
 arikalo@gmail.com, boqun@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-6BAAFBCB-95B3-45AC-9087-C00241996255@Palmers-Mini.rwc.dabbelt.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <mhng-6BAAFBCB-95B3-45AC-9087-C00241996255@Palmers-Mini.rwc.dabbelt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To ZR6PR09MB889505.eurprd09.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|AS4PR09MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: a2486a9f-78c6-49a2-0ee4-08df3b5d34aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|18002099003|22082099003|6133799003|10067099003|3023799007|11063799006|261021121427099003|261026140227099003|261026121527099003|261102124527099003|261009223027099003|261028144727099003|261022075727099003|261102123227099003|261022105027099003|56012099006|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	wnXo/8VDyEXjixPZy2Rdg4e9+oxrBBBvApEOU5kk+d4qlwq6kBlcyTPgMBJSTwvmrEeAi8lBbruueANyD18Y6oRH//aeC6QKlH/0ZZLqsjRzcDIyxe0Fn/FT/ka26bJOyPflylsrGyX5/BtbFwOVnh08L1e/koNTZptjhDseCqq/+Gnd93nk5cd050m98bhUaud0HkdF3xVuDaUTpwmnUAV9XqZpLSVHKkwvtWryXUX4JIe7ZJEVxTvu1LHzLFJ/F1rvkuYuS5c7WFP+11E9RvCeeEeNheZeuk1btzQRq//TVqIW0jhMcEHQ2BC//zSjww70ajK3B0JWaDmtvhmCJjgV9FOR3zRa9i93CTYNBZsHOI7OKmF20tSgc4OqtPWOxJKkbfu+b2wsHNebpLWY/bkmwoY9ltMDyGulNyz4DJhVFEGg4sadbexQaCc+6p4JSh8YVjdkpqkcJyyBQUTB5aKk+GPRO9aITT60hlsKQClkzu+yIYdPxHguPad+tDGUBJghk78Hft4qFx0CridBaHR3CxTLmExUANMxQTBSSV7h0j2ckC40/O1nvPhCbX9K1/zpg1wzT7ol4ANhYw4FZYqrkBkjUdO970yqhvGXaKfotBlkgPpmEhZi4DXI1Zms
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(11063799006)(261021121427099003)(261026140227099003)(261026121527099003)(261102124527099003)(261009223027099003)(261028144727099003)(261022075727099003)(261102123227099003)(261022105027099003)(56012099006)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVB4NVNoaWd6TWNQQkpVUzBtR01TdDAydU1qam0rdTZ2UThzME9yWmt6d0Jj?=
 =?utf-8?B?OGZTeDlxdHdETTlnemxsYUUrUzdkUEkybnpVcmFzSy8yNFZpRkYweHRxREJv?=
 =?utf-8?B?ampGcktaeWtYaDcvYmFZK1ZqbjR1VXlFZFVyeGVPdythRENVczZQWEMzdWNY?=
 =?utf-8?B?RWtZTThzNlZOZlM3Ulp0TmU5SkZ2S1V4OXZ2NmJqQjBsQnVIYUV1ODRYbndK?=
 =?utf-8?B?LzFuRDErYUJFVk1IeUlzcDdoejMxK2NwMkEzN25CbFVJT0lrRzdXQnI1TmdV?=
 =?utf-8?B?RldqVUdtRUFMVWtlcWZuVnF5dStZdjh1emZVcHRBVm9UbXpWMlFyTjBKay9H?=
 =?utf-8?B?dm1LZ0Zid2ZtWUlZUFlpRkgzT2FScGZEKzFUSXRHc3NTbGtNaDM1N1ZsVFJD?=
 =?utf-8?B?d3p6NEVIQ1IzclM4WmhLU1ZGbDMxWEV4cjlYWEkyWVlGWlhVOGRWQzJuL0Nr?=
 =?utf-8?B?ZE9hU01TakpJS255bWxGbTRWUkJMYXhEd2ZhYXp0alpEWG9yL29ucDAraWhk?=
 =?utf-8?B?S2UvbDVYOWRZS0RpTWNCbThpQmhlTFQ2M3RiMXUzRzFlNWhJVkhNYkEyWTlU?=
 =?utf-8?B?QlNscG9WWDl2Ump3T0dFOGo0SEJOTDhocVdtSy9mWEhocTIvVERGa0ZGK29J?=
 =?utf-8?B?RDRpWTRDMTJvUktKWkFYOFI1TnhyMlhzWjZzMnQxODl5RW5yVVRFOWdYZ3Zk?=
 =?utf-8?B?amc1UHFFeFVKSk90ZU5LRmg1dEhReXljUmdiVUdVMzJNRFkva0JFL0wrby9C?=
 =?utf-8?B?a2V0d1k3RFRiQS9SU2hIcXVsNktXZGdEOVFXQWREbVJOR1greVoxajZJV3FN?=
 =?utf-8?B?UHVybVRUZ2ppckYzN1JvMzUxN1h5MG54aXFIMFBBK09wbEFoNHl3dG0vcmhW?=
 =?utf-8?B?eWxxR0JPdkNiY2ZZZEV5ZHVBZ3d4RVVlelo2bXhtbzE1SngrRm83STJvSVIy?=
 =?utf-8?B?Y1JBRHlvR1IvamRRWitpV2FsYk45ZEw3VWQ5Q3k1UW5YTDJBb1dGbm5BdlM2?=
 =?utf-8?B?cGxQRW1QekdnZXdiODZzMyt2TG5GUyt0NEFHaUZ6WG51aDcvQi9IdWFTbHNa?=
 =?utf-8?B?cXFRY2dZZzdpdmhWZklEc2RhNmRMNUxpdVdWREREcXlNK0RFa1hEdlJ5ZkRH?=
 =?utf-8?B?bC9FbEMvek04eE8vbnFORU4yQ1pqVkMwRG1UeG1OUytHSUExYkRzMzNYRFB2?=
 =?utf-8?B?U0d5UGRpRHBOU3ZkNmZuUFdkUU9zblVjRDNMc3QvWXlONkU0NExNcHExM21n?=
 =?utf-8?B?TGZyZDBUL29paGtCKzhqMmgzY0k0TGtDT0hJQlVIV3dWSzdObzBmdy85cG1x?=
 =?utf-8?B?Ui9KOG1GZjVSSkVNVi9hbUtKV0laeHN3KytCTnNCSi8wRUFWK3doeGJUMllM?=
 =?utf-8?B?dUpTTVJHNUFrVHY0d20zcDlrMG9VaGZ2L3VqbEpLeWNLNXg4dnFKZ0puMHA3?=
 =?utf-8?B?Sjg5N1dyd2ZiRXpSWEtQeXQ0WWpGTFBGemh5WTRKR3F4S0RnVWZtNThxSUg1?=
 =?utf-8?B?UU8xSURoZlF1ZVVRa3dnbmZiSFRwUDhGZUo5RDZOQk5zeENxU2xIdGp3MGdm?=
 =?utf-8?B?NkFYakF1bnlQYW5mNlRvM21RRlFGREdjUTljUGN3TGdBMG5pQm93Umd6UFVl?=
 =?utf-8?B?ZUlpSkZRRXB3YVhMVEl3bEdZclNXMlVSTGZaVldYbjhtSytoNEtmdkVVdmxU?=
 =?utf-8?B?cWc0bnkvYTNQVEJRaktJTmdLN2wxSGNBOHk3N1BicWpNSXBNWittamFjTlJn?=
 =?utf-8?B?SW1zb2VudDVwZ0kxQno2Q1lxNXllaXlSeW5oeTFRcllObTZYVkRHQitYVTZI?=
 =?utf-8?B?LzZobmNYTlU4alc5RnlrTnV0LzRHaEhFRU9teDMrMEtIbDJ1VmV4bHIrTm1P?=
 =?utf-8?B?enVLT2xUQ0pUdjNqNHlBQnRkMjJLVmZJM2xxRXloRXJzVUlCU1dHZE80VHQ4?=
 =?utf-8?B?bWc3bnhGdDQvd2xIUmlaSFVodkNLZXo3QTN2WGFIQURmT0R3WUdSZGZlNmU0?=
 =?utf-8?B?ZjVhWERUSDFjbm0zbFl1a05JS0V0Qlh4dk9wcDJlNHkvSXpsWk5pVkZ2SEx2?=
 =?utf-8?B?SStrUUQ2cUNYNDgzOU4wTkxDb0Y0cmVOSWVnREtxd0ZzLzZ0Nzl5Um1SUUV3?=
 =?utf-8?B?Zmd2b01VeDFtYlZKeldsVkxaWkJwZXZ0dVpOMEtscUdtUVRYN1ZRMFQrOVdC?=
 =?utf-8?B?WG5zRHlsYlZmZEE1ZUQwdStMVVBwZjZ3RnpPTElUb0FQM0hRclc0SFprOUpH?=
 =?utf-8?B?eklFM3pURElVYXNKemtXOHRjT24wSmx0N2pHVldjZEpTZWhUZTFDdGtYSnhR?=
 =?utf-8?B?Skt0N2lZb0pySC9RMmV0clJwN1duckg0VjZzTmNPeGVUd05vbkZodz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2486a9f-78c6-49a2-0ee4-08df3b5d34aa
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 16:52:41.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHvZmsipfDiMmbFG/at7eMfqwsvLu/yPz91cbbGfYoc5vFx4IHvQQuW2j7F/RuPNdMTBORyCnkrm6eIzmaHf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR09MB6520

>> RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
>> (LR/SC). Linux has so far required the whole A extension.
>>
>> MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
>> trap into SBI. I measured typical userspace atomics on this CPU: an
>> LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
>> ratio applies to kernel refcounts, bitops, xchg and futexes, so the
>> kernel needs to emit LR/SC when Zaamo is not implemented.
> 
> In RISC-V land, things that are implemented by M-mode traps are
> generally considered "implemented" in the context of supervisor mode,
> just implemented to have low performance.  I don't agree with that
> decision, but that's really an ISA thing and not something we can do
> that much about it Linux.
> 
> So I think the first thing you need to decide here is how you're going
> to be treating the atomics: are they really unimplemented, or are they
> implemented but slow?  Right now this is kind of a mixed bag: you're
> sort of treated them as unimplemented in the kernel (or at least parts
> of the kernel), but then implemented in userspace.
> 
> If you're going to treat the AMOs as "implemented but slow", then I
> think it's best to see some actual performance numbers for a real
> application.  Sure 600 cycles is slow for an atomic, but I was recently
> playing around with some much larger systems with ~300 cycle AMOs and
> couldn't get any meaningful benchmarks to show up over there -- those
> were OOO cores blocked on bus resources, so a completely different
> problem, but just saying they're 600 cycles so we can't use them isn't
> really good enough -- particularly when the alternative is 40 cycles,
> which is also super slow, so it's not like you can be doing all that
> much with atomics on these cores even with the "fast" sequences.  You're
> probably also going to need some way to tell userspace about this
> "implemented but slow" behavior, similar to how we describe misaligned
> accesses (which is all a bit of a messy retrofit, so maybe don't copy it
> exactly).
> 
> If you're going to treat the AMOs as "unimplemented", then we need some
> way to deal with userspace.  Right now we have A as part of all the base
> behaviors we expose to userspace.  We used to have the non-A userspace
> support, but we decided to drop it when upstreaming the port because it
> didn't seem useful to anyone.  There was a design sketched out here with
> a VDSO call for cmpxchg() that looked similar to some of the non-A Arm
> systems, but as far as I know nobody's implemented that in the kernel or
> userspace so it'd need to be proved out.

Thanks for very clear description.

Risc-v spec says "M-mode can also be used to implement features that are
too difficult or expensive to implement in hardware directly."
here: https://docs.riscv.org/reference/isa/v20260120/priv/machine.html
This means I should treat the AMOs as "implemented but slow". So I will
keep advertising "a" to the user space and rephrase comments.
>> Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
>> ADAS and autonomous driving. Kernel atomics are on the scheduling,
>> memory-management and driver paths of that product, so the emulated
>> AMO cost is not acceptable there.
> 
> Is that announced anywhere?  All I can find is an EyeQ 6 on the website.

Not yet, it is still in development. With the eyeq7h, we're trying to
upstream early. This is why patches appears before official platform
announcement.
> Also: are you planning on continuing with these non-A systems?  Those
> 40-cycle atomics are going to burn you at some point, if the plan for
> the next-generation systems is just to go implement A then maybe it's
> best to keep this out of tree.  We already have way too much
> fragmentation in RISC-V land as it is, we don't need any more.

That's the hardware I have. In the automotive industry projects are
moving slowly and stays for a long time. This SoC going to be used in
safety critical applications so I'd better have it in-tree.

That 40 cycles timing for LR/SC is because reservation monitors
implemented in the point of coherency, i.e. L2

Correct me if I'm wrong, I think there's 3 options that can be used
regarding atomics:

1) full "A" support (strictly say, + ziccrse but it is not formally
required by today's kernel, kind of super-set of 2)
2) zalrsc + ziccrse
3) zaamo + zacas

1) is what is supported now; I am adding support for 2) while leaving
option for 3)

>> This series keeps today's default: both extensions on, -march still
>> contains "a", generated code is unchanged. Turning Zaamo off is a
>> NONPORTABLE choice. The resulting kernel matches one -march, which
>> userspace has to use as well, so a runtime alternative would not
>> produce a portable image.
> 
> It's really not non-portable, though: the Zalrsc code runs fine on
> systems that support Zaamo, it just may be a performance issue.  I'm not
> sure anyone's actually measured that, but I think it's sane to just
> assume that native AMOs are going to out-performance LR/SC on _some_
> systems.  It's still just a performance thing, though...

That's correct, dropping NONPORTABLE

Next series will add the BPF Jit fix, and patch to reject kprobe/uprobe
inside the LR/SC block

Thanks, Vladimir
