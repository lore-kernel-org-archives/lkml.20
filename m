Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021081.outbound.protection.outlook.com [40.107.192.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A9378826
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138088; cv=fail; b=m6mKiS+9rqoHgYy37aVNM1nMZ6rliBpQr61V8kiD9tFG5w1yS93hyj03i42m6IXHBAqKGGJWcOe5PFy9z8RizWen4cUYeZATKmEZpx0G8ZRJPtrjSXo9mWcBUm9NWpEA663ALZe9Rgc3WE3polbgsSZ8TTci3MH6WkFeuiMeQfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138088; c=relaxed/simple;
	bh=wkxF8vC7vpJW+f3Ct7JUTBBlL48tBtawEPA8B1CaUSE=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=u5DtelsETqjYsnBJBiOIOY/Sy1vDzETnZngdDmbvqk7eXzWt7ejGHDW82MWkHqO/Mt6M8LvizNBePhsCLnO/+iOcsNFNR/2SVF6JSDkl5PXU0P+/rkSGbMfl32a7lNWKuP62a1iT89rSu9IOyi1X6gwMd8EJ/y2YSRnBzhYscWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=QfY/+8XK; arc=fail smtp.client-ip=40.107.192.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="QfY/+8XK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJprIO1TdTDUGNZ2ZDShe26vdwnfPawL2KYOd7Jmq/Rv4Lq1SKjlpvH5xtFKySCewYsJ3vjl6pbDCKb+5wY3jPwvI1Dzzq0NKtVQ6Ooao1EMrYuV/PpFX+PEKhHTRlu1nNhh3gdHICRyedBcJa7WjPgdD1Xq17Rq3RF0lFAy7+RrBfUtxaigEWS6H3/LF2tsZqF3zMBGbwjeezfZ9K1FB6KwIrS5ZviQ79qIXBeiTvIzPIa48/K18yj+gvBCh5ZVAaz750MF+Wd9T/0P1cmfsT1ZxqlZwMppH/Xo2zEKmyQ/84wcBGXPcQc6EVSIUUi5E30eSBWNYPwnC3tLJO2Kzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gca5bMst3K8uogKeJgY943CC71RVk6dj8/NG+cGlQrg=;
 b=k42FZDdB3N6EBdab72defnraaNWtqLrytiBm+TXhLv2k/7yE3+IVY4OfToMQ5gblJunHDudMkKRiUSKrJfI3vmT41mf/16iwLtTCReF//i2k1RnGS9AoG4f7qDiCXBMtskz3Mm1dJ64UPTp2ZsnzPw1SFlH0cfYyZClJlx8VciFRCz/tuTx7xLyzvgEGOVtAZEb8ILzcioDlq9ZLL/wr46wOgfYMtzZyyjIdDFvRS3cNWf4UP1San35R6TNdSlJkEwF4qU45ZpK0ci6eBgbuMTHozZty5WDglnu+C7DydOUHZqEVIRho7yv4YPSzU7upljmEGUkgY5nxWbn0OmPt1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gca5bMst3K8uogKeJgY943CC71RVk6dj8/NG+cGlQrg=;
 b=QfY/+8XKi10yJavFtJNvGaTw/FQZdhcbBw8nEuOgtuztkh2gZ7AlXUilJicc6ztEPCozHSPgFm3GdyNp7Cmke7xXaRHNmixrHeD3Eg58VC2flinDjfSUTQvrGoOUtbXvVnO8nxhs7IiEE+awZ4nkexUA/C1KEEpu7+AUat8xogw1Y1089AhWZqGcAf8wT2IzEOk8C9miEI1ADOGNXhf8iLrUrlam1VfzLX4sgs//d5ujf+NOQK0G70etEahKkNUZz+6oUWwh+h/awoKJd7P6uQhRszZhv0MxnsSNfcSBfbdyY+CvnnKGo41CDlTwhw6RUmXFgbJCcoqEl84qFulJWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT2PR01MB10575.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:48:01 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:48:01 +0000
Message-ID: <2e21853b-8c0b-4a70-8591-bd778b210d6f@efficios.com>
Date: Fri, 11 Sep 2026 10:48:00 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: linux-kernel@vger.kernel.org, lttng-dev@lists.lttng.org,
 rp@svcs.cs.pdx.edu
Cc: Paul "E." McKenney "<paulmck@kernel.org>" Alan Stern
 "<stern@rowland.harvard.edu>" Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [RELEASE] Userspace RCU 0.14.3 and 0.15.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::11) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT2PR01MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 6336a05e-2b88-408a-3faa-08df1013ad8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SVKYco43sl33gL3474ZI2/62RWPEdz5/rAmgUhon8Ifs7Xfu9Lb1QLSqEl0ODm/Qv1Tl3/9sOAXO03fbR2iwpTFoDblcki4co7KD+QgSZtY/AbMPEpggV8QMUQxZ6QaFzN0wBkAvS9SCP5tCBlWW9Y3+JmeHlYw0d0pQ5d2sMcT4MelaBYBKzrDdNZzzaFBs6AKbJflIJG56M/GeO13zWzgVf774SH9bcdTV8Tv4aeYW3yPMPAX29M9gFqgOLEKEhrhuL9gg48uesboqN5GuywYRpAGPDHF+WtOTPeQB6BkiXLibmMJtGM1rV06/GFZjpWuR9dEZGaxckpI7K6P1txEOfqdlzx9glVGfQ/qJoBLIxq1rwc5xhkiHpmymRc6kSo3e4cM/qs8siSEBODjIpT0KGvwAXDo9E2TM3u5WxsR6V3TVl5vzPtgCTVRFrYpi6QZOuvcQoB1zvU6AegyXLKYVNPV81IAycgzL6GOyw14V8wz1Jj7PircfZ5rpjygUEcEosI4A1xnApBg7jmIq44NYxLV2gtu30zXLKwfDT2EDyE5YKbRFoT15eP2quwKy124Fd8g1TApdlfOajyc/Wq6wFoT/awzRjF7dLr+0wWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBlSW5ZdjVQM3E1d0RNUkZjTWoxVXY2enQ1djBvOW9mUjV1WDZiN1YzYU0z?=
 =?utf-8?B?OEtzM0Z0aGM2S0Zlbk80S2ttdHpxV0JINjZpL0YvaTRBTUFZRkU1elZIcVZK?=
 =?utf-8?B?d2dSTGVVcWd2KzFtR2R1OE9HL2NJZk1VZUlzNWtqbEI3Mm5mRTBLYlBwOG41?=
 =?utf-8?B?Y1U0U2RUN0VQNnplbVRPQW9yRE4rRlE5QlBockI1RVYvZlZtZUlJWEFiUjk3?=
 =?utf-8?B?eGxFNkQxN1JsclgwQ0M2NDAvajUvZG1vMHdRdEVLRVh2VkIrMlVVZFp0a2g4?=
 =?utf-8?B?VnhOd21YYm85Q2VKYnl6RjBzWitlL2trTktUR2pmNEpTdHc3NW5WU1pIRnNs?=
 =?utf-8?B?OG9mbWFMM0RqQVJyWkRBdmtIMEZmazlVb1hPWDFyNUpCZGt0SDUzRjcrNHFL?=
 =?utf-8?B?RE1McHhieDEwQjJ2SFNqSjlkckFOUnJzSmZvNWtrMHlZclFnUTJJckdXV3Js?=
 =?utf-8?B?c3lUNkU2dVFwZnRQVDRUMGg0Z2ZuVjdPQ1I5TmtWU1ZQOUdWa2orRitGVUtT?=
 =?utf-8?B?K0xMTlBFUVJlTGZQNEs4WUV3ZkFoU2FCU0ZSZTI5RnIwUTJHVnBDbWE0aDBG?=
 =?utf-8?B?V21Jc2cyY2I0eUs3NXVLSGJtT3JWNlFVUm1yQTZ4bXBxa3dCcERlS2tPRHhW?=
 =?utf-8?B?WXY3elgxdTJ5RXhzNGhrYTFJdUVVWVFhRjBXSWw3VUNnZTU3dE5KbE1HdVZB?=
 =?utf-8?B?LzVkZ0VFemc5SCtpTytFT1ArcVcwZzk3djZPV0xHak9HZXNhd3JHbWdCZXVs?=
 =?utf-8?B?Zk5VckxyMzZ5WXdCd2JzaVRnaXpJZlcrSC9VRVFRYzcwS09LVm5HWldnMDFK?=
 =?utf-8?B?ZHlnTXJQSmU5ZklUQ2dhTlliWG9XM0pwNWJIbTZvbFF0RUU4V1FubFR4RDNy?=
 =?utf-8?B?bjZYMnd2enlSSVF1bEhyQ1NGOVhmT1R6REY1VFRMaFN4b1VWZlc0RVhDZlEv?=
 =?utf-8?B?T0RnSm5kelV1dXBYa0NVaVRYNUpFdkJRNk9CWTFCNUluZC95SmtqalpHeHJu?=
 =?utf-8?B?cEJkM3JJTFloRkVqTlZMOUl6dXlTYVV0SFhsSHhYQW9aWkhSVytDMzBmQlhZ?=
 =?utf-8?B?dVcxY2YxcjN3cG1QUi9RWlplbVR0YlVqcFVyNnRPdEdpWktwSExnR1Q2QlhV?=
 =?utf-8?B?OFNLTFFpOThPelUrRitlWi9FVGYzMmpBTDY0cWgxUnQwV2N6S2VHemM4OWVs?=
 =?utf-8?B?blBORUptdXFSWVFYWDk4SkllZ1pYUnJBdE1IYXZRVzBJZU9MMlVZdExkQTgy?=
 =?utf-8?B?aFFJQjlkQ3lWa3ZsTzkvNFlJbmxSMVd1aFJwQjV2WE5FYVZRYTRiTG1GTFIr?=
 =?utf-8?B?RVlmM01iTXpvU0YzREwzbkhtdXA1MFRldG0rSk0zNkN1NW9VNHpOK2FBY2gw?=
 =?utf-8?B?KzVycG1td3JEeVhPejNxMUY2QWNuOVV0Si93RUplbVJNR0o3azlrM1BCYjVO?=
 =?utf-8?B?NEhWeXFTNVpBeGdhN0xXS2xZbTVSM1l6aDZFV2Z4WC9Sd2FFZjJCTTYyT0RZ?=
 =?utf-8?B?Szdwcm9lbnY4cXBBaHAvcnlCRzNpWHlwMUxZRnlYc3hVWFN0aFNWTXZCREph?=
 =?utf-8?B?VVBuNTdEV0JWQnVuR2RLMFYxZUVJVXZtdkVmSlZNTzJNeVVQVElHdk1udEoz?=
 =?utf-8?B?UnkrQWJYYit6V0Jab0dUTWcwVUFJWEVaWjhlTnFmS0FXdHFtVjJKODZsZHkx?=
 =?utf-8?B?bCtZZEcxc1A3cm1IWXlsbnZyY1ljaUtQN1RlUE5vNk9QeS9LTVpIYkgxVWhq?=
 =?utf-8?B?MlM1cWFrYWxnUXdGU09wVVBCQ3hYazBlNE51K2NnTnd1TjhDM2xYektjT0Fj?=
 =?utf-8?B?MUwwK0M3d2NNdHIvT1l5NTFhSHlCaThlRlBPTG93VGVWNXBmbVhKS1g4R3NJ?=
 =?utf-8?B?eU53OVpHS2JLcTQyb1dtVE1ZOCs4YnAwVnpoZERJUUYwVThiZDFKQnJBcXEx?=
 =?utf-8?B?ZTN1N3p4RWMvMWNBY3FBNExMVTNkSDU2V0NVZzlHK2FNa29hZWM2T09hZ09Q?=
 =?utf-8?B?eWZDUVJRaTBHb1F0Q0pPdzMwWWlNSGptRkFwZWJZTG81MFgvZVpScHhWNVBi?=
 =?utf-8?B?U2pYallGTlpFRnQxMDc1bXQ1dFRsV1piaGFHb3pVa0tvVm8zRkdtMDRiNWNI?=
 =?utf-8?B?R3RrekIvWTRlaDdsYzVaOTRGRXlWbFJCWE5iRTF4S0huemdOREF1NWJKZlhy?=
 =?utf-8?B?NHRPRGVSRWdyUDFDZ29WRTNUQmgwT3hSRGdyRkNWWVJ2L1ExUGhJOENwMDhU?=
 =?utf-8?B?MXF4L1NjMnpsUFhnTjVHSmJuazdueUQ2QkRJaFFOdXZCT0RjSmhiYXc3VXll?=
 =?utf-8?B?b3A2M2M4clFmc2hQTXZSTm1mbHE1a2s2UUQ4dXN5TEwxNFVuV1dKeUFxOU9s?=
 =?utf-8?Q?1KpsckdbNBCBw55JbTXDqooOIatGh4tLfLX5P?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6336a05e-2b88-408a-3faa-08df1013ad8b
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:48:01.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUM/PG+iLaJsOpY5VHkfcE9e7BBiB1jUFoXkjipy1jPaAj3BA6mZinlnVP3es2OlvTtSYS/D0+DFlpQ2josbpRn0m2cV/vGGARv5GM4mUsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB10575

Hi,

I hereby announce the 0.14.3 and 0.15.7 bugfix releases for the
currently maintained Userspace RCU stable branches.

liburcu is a LGPLv2.1 userspace RCU (read-copy-update) library. This
data synchronization library provides read-side access which scales
linearly with the number of cores. It does so by allowing multiple
copies of a given data structure to live at the same time, and by
monitoring the data structure accesses to detect grace periods after
which memory reclamation is possible.

liburcu-cds provides efficient data structures based on RCU and
lock-free algorithms. Those structures include hash tables, queues,
stacks, and doubly-linked lists.

* Highlight

The most relevant fix in those releases is a fix for the memory
ordering of rcu_dereference() when used in code compiled without
_LGPL_SOURCE. The issue is that the load is non-volatile, non-atomic,
and lacks the relevant memory-order-consume semantic.

The fix is twofold:

1) A work-around in rcu_dereference_sym() which adds a cmm_smp_mb().
    This fixes memory ordering but not load atomicity.

2) Introduction of a new rcu_dereference_sym2() which fixes both
    atomicity and memory ordering. The macro now maps to this new
    symbol. The old symbol is preserved for backward compatibility.

There is also a change to the call-rcu worker to make sure the CPU
affinity is set earlier in the worker thread lifetime, eliminating
unwanted call RCU worker thread migration behaviors early in the
process lifetime (first ~2.5 seconds).

Changelog:

2026-09-11 Userspace RCU 0.15.7
         * call-rcu worker: set CPU affinity on first non-empty dequeue
         * Fix: leaky wfcq tests
         * Fix: test_build.c: Test output mismatch
         * Fix: workqueue leaks mutexes on FreeBSD
         * Fix: call-rcu leaks mutexes on FreeBSD
         * call_rcu: pin per-CPU worker at thread startup
         * urcu-pointer: Add rcu_dereference_sym2() taking the pointer address
         * urcu-pointer: Fix missing memory ordering in rcu_dereference_sym()

2026-09-11 Userspace RCU 0.14.3
         * call-rcu worker: set CPU affinity on first non-empty dequeue
         * Fix: leaky wfcq tests
         * Fix: test_build.c: Test output mismatch
         * Fix: workqueue leaks mutexes on FreeBSD
         * Fix: call-rcu leaks mutexes on FreeBSD
         * call_rcu: pin per-CPU worker at thread startup
         * urcu-pointer: Add rcu_dereference_sym2() taking the pointer address
         * urcu-pointer: Fix missing memory ordering in rcu_dereference_sym()

Project website: https://liburcu.org
Git repository: https://git.liburcu.org/userspace-rcu.git
-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

