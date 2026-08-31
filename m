Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020074.outbound.protection.outlook.com [52.101.191.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB7553A8AD;
	Mon, 31 Aug 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183935; cv=fail; b=XkGyQd7HWRBFlhJU9l5mKGA0AYa1xQSgY5/NhpaDTEZltrO5NGAy9+Jwhq/wNnCkAXR/BzfrD8RmbX0ie5M6RvR85S+A6TM14EThZfVoVE47mRBIgCd+areXa6aMMjPIaLGhsnD0lyLev/KF5EX7PMxLe88XayT3URxe5/et1tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183935; c=relaxed/simple;
	bh=avitkl0oFUjDBInuDsC6XDE2S4pB9sMr5dESjLUmOFs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JMoz7UwxbCB48cLiU9RE5AT07wGW47lo1Q7DGT8io815rVcg7jlclCLDAhzq7draqrkRhm2SRjcedXBCkC2NJ7Xtx0YGH3NbfQjbcLa466xMasUcJ8ONjmYOCNSgGjvSALdc3YfG86zr+X3kWduL/1bQwRsJ+xjB+1T0Axu6dCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ZXNPsUUy; arc=fail smtp.client-ip=52.101.191.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ZXNPsUUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEJHb2II3y++G0ncLKPgTfP+CWDQMCsAcVUGQICCnXBZsD/RwFx6EMmu6dW8JGrbjkuxrgOAGIDdJpS0PUf0KbxciV43X9lfdPNplYzLzdOYd9RhvTtbubs0IY80xo0ePKWsYUmFc5j0KGbQiAYi0A7Aa85cnBjDmmh5+KBFoHL9xhKKYHDxolRjkWOa5cT54ATIBMtnPGvafgD7QnpMV749/wt3oxNgBB/m6SMRmuebBqQwaX2/I08F1fJoHnYqnVhJUvQv7P7S88HbgYpnxmDjHEyLb/HQ8dxTE9FoGlr+bUcGG6gk2SeNqw+pZgjS8gS9QzGONL0N5MdS+VbXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwIqvLVMt+qn4dNpBWtQzkoBDjwOSxFwnFACVKhnIZM=;
 b=UrwH2fAREc0s781/EFSaQhgo8XzSuDPnXDwquhBJq3if46AfpFfW2SUc6n8dgezofczTfukNHX/BJhAAbEgL65nKLdVmdeQ7Mua2UmsurMU370VSAzg7NgfHyagqb76mTqWnso3Ax1OCaZ1b3V0KzzeL3nl2fG1RZm9nKWCb0YSeMK7czfF4dOH+tbLQymbtX2dORDSHnESlwLvvmnd80mLOwjnXvUNSYyhWFXdmKg5UgMxwhvzTGv8IMfhi7mE+IC8efx9aRLKp12JkDnzWuM6RxYqXA2k9/Hph5DaN3kMrup0hnybNfAVWtOt+RJ9WSYM4TcU46FdROFxlCAzSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwIqvLVMt+qn4dNpBWtQzkoBDjwOSxFwnFACVKhnIZM=;
 b=ZXNPsUUyTWl7OCetpluAtWTx+EF4FgxcT4+9uRXUBjGscAqqwB/T2X8PHULvpjht5dgjyOnx3KSod7erlvj94oLnZeotH6TX5BBhYOTvrn8PVTasanfSMjX5x2kIrcNhpJP4FWincNWeKOG1akD/UBywQSC329JFN8cTPrFypgH48jTV90Mb+LGkF738LrLfsC1RhVJe/xMwY3prgbB0mjfWInaoq1pEmfgBkrMwHUOn8hyYRGMd21GlUKOl3gQllbpJ38AQR1mb2shYskltbrOesGwSWJ0IDFogc/HIDkczc1x3XLSsZRs27p/RJwa0A8vAfTf0jJ6Xrg5D+VCFHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQXPR01MB5578.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:45:26 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 13:45:26 +0000
Message-ID: <c8453a19-3487-4031-8153-22e1b1cd2b69@efficios.com>
Date: Mon, 31 Aug 2026 09:45:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wake
To: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::34) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQXPR01MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e21a3b-1702-42e7-d3d4-08df07661cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	JgG3L/UjhPIBysoMDR8TNxcVBXTnmDCPlDjroqJqUKdSK3L7PR/afGb3uEXpQ5xCN531fPvLve9elxrH3b/pv8Wp8zQVVuelQJzrNNYCDARpOI4EZQi0DYi4jh8PZuGuOesr59+6SQqs6P3bNAcM5iDv2q7GEYFWgAGXxatL3sjrvuRQ9mA+ok4YKaU7ybYVrFAqqlVyrGiFC6pE44f9l4TG3nBx/SvM2GfFxbpHL/sCKfqglAmthOfBAOfRxgBzCbK0s+fEwJk+FymGN/3vKOr08p7qGQUUlBBXiPJjrdP5HGuNASt0+kNovRcVqcC3GrqKeuKE0PBAqEOZCSlpibhRgRtYvaKGfXvJlF2Wcpn3NecZlBqcfMnAAizp4EkzRtQ2s+7Sea1k06YdH1DwmOzKY9ONngGdO7mun1SdqnEW4GleL8IZ27KUFZh+aITI2pjNsjBZzGDi9+dfBMESbMOMIzHYmtCzuPEEAkr1l6R+ufUmDcp73OWeV2QmlHfw/psa5wmiEWON1RP+Oq4vCVJJzaS8Yabut5JOEo7/eP2uYCAm9ceA748joyLvrlMM/3DHKQ6xbOzjiHhFYskzt9bvovElQJwP7o4XamLefX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGpvQmc3bU93ay80N0ZuMW0vVVMvbDlFa01JOEpFM2pJWG5hU1Nwd090M3dm?=
 =?utf-8?B?dEVOODNsa3JpTmpDa1ZpTWhFdXJ3c0w2TVdjRWhpWG15T1RaQlZVYUE1QjRn?=
 =?utf-8?B?Vm5IT2xybStOaGQwSzY1S3JUOXdick1HSFlHZGNkUk40WEFBMkRseXVwdklC?=
 =?utf-8?B?ZW43Sm96MCtZWitZeUgxYUJ3bGEzY0dtQWxSOW1iT0h2Vm1CYjQ1ZTlBcDg5?=
 =?utf-8?B?dW5DTXVVOUFXWXNnMFkwZmlnazV0eFhPcTRwNTRLOXBySllmZ3Vrb24vNWI1?=
 =?utf-8?B?R0tPSnM4TzdHalV4K2NvelhYNWJpSU1vNnFUUGQ4MXBIS1drTWZFRkRLWDVj?=
 =?utf-8?B?Nk50NUw3Y1M3aHhTbFFZbW41cWJOaVBmSFVWOW9Pb1E1ZmY3anh3Y3ZYQ0hT?=
 =?utf-8?B?T2YvZXRidWZFWTdCSWlDeFh0dExoRmxvQ0JYcmpGUGwrYktOL3BHMUhJY0Ux?=
 =?utf-8?B?S1MzRW1vc2owMldHdU5LdHFSY0swZGpZSDNwVXg3V1BucStkUzJyb3VoR1JQ?=
 =?utf-8?B?R1ZFYXNlb3R1Y3hoTFptWW9DR0dpeTg5TmgrdjdEZDZjTWRZdmd0bUROYVJV?=
 =?utf-8?B?ZHFpeVF5dGVWVDBOc2ZJNEhlQ2lSUkVDV2Zxd0wwMUtEZ0g3SDBmbHQrKzU2?=
 =?utf-8?B?aEg0NE1saVk0RG0rRVNhRXE2Q3pJamNiQ0dlMkFHanQwa0QvbGZHK1BPcHNG?=
 =?utf-8?B?KzRyOTA2cVJSVWZDNXZHVGlMQk1xaXJ0cE9qQlhMTHNXVkhsM3lDWE90WXJM?=
 =?utf-8?B?YmRjaDUzdzBhTlRWTThZRERVME50RnVDaUp6ZVNudVdnQ2laWmR0QllXYVVJ?=
 =?utf-8?B?b09ONGFsN29BcDA4MWJnUm5pdUpmdzJoREp4eiszZ3hBZzBqV0pSbkVQMDBD?=
 =?utf-8?B?ejJ0K3pSREx0T296ODUrR25POU1yQmthUDNzbmNiRVdtU0VhTUlCeFFDYW1X?=
 =?utf-8?B?U0p5MzBwM3RUZ0IvMllpSTlrcW5ySjhjU3BkYWdNaUJlaG1ZditRd0dzeFF3?=
 =?utf-8?B?aDhqak1wZklpbVB0WG9ud2F2TngrRmlsRDY2UHUybTcxMkxPaVlWS0l5dG1z?=
 =?utf-8?B?VXFsREExNTBhR1BSY0J6bFVlTW9mNHRYU0VOaDRNaDVzWFFNZThCV2VmOGxz?=
 =?utf-8?B?R1o0VjJvVkxyR3hvTHM1bTNsc2dnT2kvK09KYVRNb0JWeHJ0KzRQR2YrUG44?=
 =?utf-8?B?M21UeCtGYWE5cXppVkVjMmtVWjNVS1QzK1BYTGQzNDhXSUZnVnZZVzU4VmE1?=
 =?utf-8?B?cERmY1lnN2RQOHdDRnVEWXpnSUs1UjFHVmlIeFQ0eDJlYjBjcnB0bWdKeDA1?=
 =?utf-8?B?MHZaMU1ibFR4cUVyUEM5aUoxYUVtNTUyczB0UURZUCt4Ky92ZzJ3TE85aUhu?=
 =?utf-8?B?NmJxdlVTaWZXUUQ5RkZONG9nS2h4WEg0azVHWFNGNnRtYnlrcUxMWXo4NFNN?=
 =?utf-8?B?ekhaSlRGK29EVCtlRkxuRTNJOGxjMlA4eTVhKytrU0g4MWovSk1kRDBBaVM3?=
 =?utf-8?B?Y05MeGlKbXRnaWYyZkR4L2tPRmdGYys3Rm1oVVhaWGRoTHRtTkt3R3F2RGdn?=
 =?utf-8?B?VWE2MW1BSDlkY3VuTFNOQWVTRDFDNlAzMTgwN3I2dExTWTIzOGFFdFArRGpJ?=
 =?utf-8?B?bzdBczdVb2lYcFB1OHdnMklRVnBvNEkwY3lnbk5CY2NaTURScHJtZm9sNVVY?=
 =?utf-8?B?ZTlldTIrajFzOGQ5ZWJQcXI4SDFOYktPd2s4UVduTWNrYkFxVzhSUWlaTmJi?=
 =?utf-8?B?cUVSaGFJTDA4ZGhSSFZra3dNcmtRSmdBZ04zMkd2dEtrMEJHcFZsMFhVYnhG?=
 =?utf-8?B?a1RONUJoc2dqbG96anVsUnI1WXBkcHMyZ3ZYQjlLTjYrV05jYkE0c0RRZ05U?=
 =?utf-8?B?RzVwc25LSkduVlZ4UnhxVjhONXJmNGIvN05Ua3ZpSzFoR05Sc0JjaVFmS0R2?=
 =?utf-8?B?OTVsT2tvd0dLeFExeGJsRjF3TjdVS25PWmtPNmpJblVjK3hReGRFUHBLa2ls?=
 =?utf-8?B?bmRCeklOamRHRmVVd0lZdHljajE1L09xWDhtREtVSEtIRWo4Zi9COUFSdnJ2?=
 =?utf-8?B?S2Z6THg2azlHVmgzRGx1T1JsWEQ5VUpqVWtHUW0yQUFmd09uUVVyM2J5Mm9D?=
 =?utf-8?B?SE9iNmJUbzFucEdhTGovMGJYTE14UDZKYTFoazYvMWY4ZUNhMzltbm9mTEVV?=
 =?utf-8?B?YVJwTDIzb2xCT2pNU1dOVFRod216cUxQZGJqMy9Zemp5SmtXV291MkZ5dmJI?=
 =?utf-8?B?RDBZOHNRMEoyWi9vYk5hY1plVXJpS3M3aThobWRkZW9Td0t4bUpHcWR5aXZ3?=
 =?utf-8?B?dzV3R2xoK3lGSnVaalova04vOWZnanVLN0ZpaXZleTRTa3lsa3FpTWxHVlZv?=
 =?utf-8?Q?GXMnTo81FaJgVqW8=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e21a3b-1702-42e7-d3d4-08df07661cd8
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:45:26.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OFd6aMJyvfdrI4a/9tjp4uxPG6oBvxMbC3uiUeeMjOkAiH+4rDSaN3OtLdYdhNZ93Eoulgkg85e9VVLQwZbK2G9bvOIL7s1DD3wGeOnV3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB5578

On 2026-08-31 08:57, Alice Ryhl wrote:
> When a task is granted an rseq scheduler time slice extension, it is
> expected to finish its critical section and relinquish the CPU via
> rseq_slice_yield(2). If the task issues any other system call while a
> grant is active, rseq_syscall_enter_work() forces an immediate
> reschedule on syscall entry via cond_resched(). This may cause
> significant latency penalty for userspace lock implementations that use
> rseq time slice extensions when unlocking the futex.
> 
> In a userspace mutex unlock sequence:
> 1. The lock is released in userspace.
> 2. If there are waiters, the unlocking thread calls sys_futex_wake()
>     to wake a sleeping waiter.
> 
> Because sys_futex_wake() is currently treated as an arbitrary syscall,
> rseq_syscall_enter_work() schedules out the unlocking thread upon
> syscall entry, which is before it has executed the wakeup. Consequently,
> the lock is free in userspace, but the waiter remains blocked in the
> kernel while the CPU switches to an unrelated task. The waiter is only
> woken when the unlocking thread is eventually scheduled back in to
> finish the syscall, causing lock handoff delays.
> 
> Thus, update rseq_syscall_enter_work() for sys_futex_wake() so that it
> does not reschedule during syscall entry. The thread will yield the CPU
> on the syscall exit path instead.
> 
> There is no need to apply this optimization to the multiplexed futex()
> syscall since any userspace code that can invoke rseq_slice_yield() can
> also invoke futex_wake().

Is the goal there to provide a single blessed way of doing futex wake,
or to allow the futex multiplexer to keep being used for that wake
scenario ?

The proposed change exposes two ABIs (multiplexer vs explicit futex
wake) with very different behaviors. I'm concerned that it would be
confusing to users.

Thoughts ?

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
