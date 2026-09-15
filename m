Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022104.outbound.protection.outlook.com [40.107.193.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34306414A16
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488673; cv=fail; b=lVEixCxXgTVHudxMMfENx1lIeZZsC7x/WF4j3RmpPayVllSvtXDXYn2FrLD4QXUxQiv9RGAwaZumCI3ac46uNpnQ4Bnx/7npG8FPVwM26OBQqZ8p7g1h3AHAFj1Z5ggNQbS/7iOrRc+9/5xx7rRzo26Zlassc7rxhboKKxi5XKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488673; c=relaxed/simple;
	bh=Xgag0xjPeAverxZK3nR5ZG0VxOSjeT9D/DzdugsqqeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lcMBW20vsLbR9Y4/hrVZgUrOY5Zy4HwdTfMWW6UK6qfsWtT8qAoFoUaCy5EuOsP2A+Rhw374d5D5auupl7SXYcD2mJxRI7psNJE0iobzyRQ0/f+FWB0qbKf7AqmHWFhQH4q9qV4CPWz9FNW7QCe9+OTXe/LSAUZSEsPSUnZKtqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=bghnIIMi; arc=fail smtp.client-ip=40.107.193.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="bghnIIMi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5qlAFMzh62mOQ3dqvSKpZVLFHiJpGxjv8zBlTeLW6kq6y+j7OmgRqgDoS1uOE2z6TvRzXj7jMZ8g3nqMTbSh/RXLN4QLnOzSMJ84JymuYFHR1rtYWlFvEkZK+En05IWaYdgwDojJFs3FMgFApv8bm6a3ytPws1FwKBtwxl1YG2ED3dImlrqgZnODeMjjwtXmiVedG3xikxfxyiIl6Wimrtq6uTgs4kYJqoV0FhbG46Iwjg6W8yfuWZH/OCwjzxDVAIBXHTN0s2NeN+eQbWhjVLherGqLKQySaGS9YLCS6aLBpO66Nt/0HsqRfYmD3z4ZJ7aEt35F8j65v3+zrWrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cLRSZghr+9HrcqOrsAn0XTnikeDZkn6vw86rdZLa0Y=;
 b=Gr+HfG9lZh2cRSLDXoFwNLBAhZpo6I5HgTv+ByUD5PmcHmzoRTd88ZDtLOAwIa2Kc8wlmSYsfh2+SJw0dYoSMyEb13SR9pt7QaUDrq++phD6gTju+YXUfSCPY1VmUTjw/CxD8lbAfyb1Os2gEpBnbCf40JxG3RQZkyiunoBxfvD2rzEHtNn8p4JvJMUU22a7xscAZdGIUWjJ3gzAYsWMxkecVx3lMc2OUab6OYmkNnAVHQhQ1nnKqSIQb6+oqUo/ELM0eJM06L8Wu05UVhaRq5XWtq8KW2YHfXsdNMUFBRXDgSg1EUxdHl6CFviezqllROqzUj2h3i82hiG6QDYQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cLRSZghr+9HrcqOrsAn0XTnikeDZkn6vw86rdZLa0Y=;
 b=bghnIIMihU0EysIzeYp2AK37g6EwcueaxmhI8gSMdoZZ3HJ3R8PpHURnmEfRztrT9SbQOfsboXfUQvnqyUbyooO2Yrj1129y+dglZzOCKDvv6f36ElIjqIiPsAqhf0kV96kBs/S3VhcQ2jKIdZn6+7tlkPsO3o9Es896xLPWxYbetGXcFuszQzvHR9RAQFNAeJv4e44LgSV/DHgNvQbTcLO3WpwV6rEhMkT/eGfq70iPsxgWgIs+0aygFb22U4uNv2gVIIyafUeLIQPXVlg3WxaGxxGcbOij9Xii7sDtKrspobfGIn6Dx4I20By1YXJRq0zQcSif5COtRrAfZanpjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQXPR01MB5397.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:40::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 16:11:00 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 16:10:59 +0000
Message-ID: <10d3d3bc-ef34-4b48-8dff-f544266181a9@efficios.com>
Date: Tue, 15 Sep 2026 12:10:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/mmcid: Fix affinity-triggered switch back to
 per-task mode
To: Hui Su <sh_def@163.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, vincent.guittot@linaro.org,
 juri.lelli@redhat.com, peterz@infradead.org, mingo@redhat.com,
 Michael Jeanson <mjeanson@efficios.com>
References: <20260915155953.2856524-1-sh_def@163.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20260915155953.2856524-1-sh_def@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQXPR01MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0d7257-b1b1-4ea7-34e4-08df1343ee6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	cTg+/4TbG2JI90Wg91NZWjKePhsIDawKdlG7i8OHGLShHi3KwqjMkzeIeNoKZIQk9FIpSQbQmblOrDI2JG2EjuoINnPaPiHPZBbxn+9AcSYPP61r/prkAy9guU1YqDudHPUqR1WtYJoy1OGz2b3nSl+d7Z9iZ5M82BeL9k5iB79B7SXPYTsjleGrnUberTzGNbRrxwWwkQWhqO5vtU8I9myC9ljp6buRbzscc49rSB16lirB6ReCclPrX96J2du5z32ggby2b2vGOJDtTMXaRa/4MGMwB5PScA1Fd06OyJTIlcKwFz7k2oeI156ABflCca7uJgacUDZapIhegKyXnZpTfV41XpssZOI4pxTByjmJk6ltsYPmKtEBICWxCHeL5b/OAam8bmHKjZ9oGKontY11g3t/aqwyXZOQACB7hUuIjLLNwnIPgJCRGODOcCXu4qRKG4gmH8eImyQCxSCoA6vdIuJ9DEv1pImnwx56aafGQQUVTTIUchP8CQ9YXjHCFYV1OosQH+bEa6bdxMrvP0YyONQ92QPAlRvUxFjKTYumekxdt0ygVg9ip0+xgWcghXja6zMgka0hOyLHSkKVIWwLWi4PIJYU9JvX+Ya6Rzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T213OVM1NnpaTTlZZzlQVS9OaWZsWi8vejFSVm8zVmZXSXRJRU1LZU5ORkxG?=
 =?utf-8?B?VUptQ1d3eTk0UG5ydm9DL2JvOTdHdFdaamhMWGhjWndPaWlKNk1SdzZTN21y?=
 =?utf-8?B?aTRNektLVUY2T1dzVzFIbFNmanZCNGo3ZUdxVXZDcmhmZWJyb2JjUnhYSEtq?=
 =?utf-8?B?RnlhdUNFWjFmTFQyQWpkN2VzcGE5MEt4VC9ocHg3amtWQURabS9pU3ZqWFBK?=
 =?utf-8?B?R0UrUUJMNCtndmxxMEhwZml5MUhyTi9WVDBmSnQyMk9FaHo4aGlpUkRDcFpR?=
 =?utf-8?B?UW9vRFBhWSswTGdYRVl4WE5jbGVreWxkZWx3UkVscnFaVlV2Y1l3YVU2YjAw?=
 =?utf-8?B?ZVAyZ1ByS21DWU9xaTFSUjB5MkxwUnVlc3VHWDdrOU8xZDRaUVIrSHNxRmx5?=
 =?utf-8?B?cVdvQkVYL0xBNER0QTA3RlpsN00rbTdGbS9BYkRXVHZsNFhEQjNrVmFMdHVk?=
 =?utf-8?B?N1J1emhwT1hQWGRWampMY3RIQlg5cElNWVluY1NTdHhYQy9qanBqMUZLcjI5?=
 =?utf-8?B?UStQYVp5d2hEaFF0LzBubExFcG1uWm04SjQrYXJ5ZyttcFJscUN5cm9id2do?=
 =?utf-8?B?cHE3Zk1MVG4zeUZOOVpTSEJxM1AyUVkvTktKYXp2YXFTc2h6cnZTakF6Y04y?=
 =?utf-8?B?VFRIVU4rekxLREpHL3dNcjJxU3JxakxmckNLQjlUK3BDMTZkKyt2U0gwbXZj?=
 =?utf-8?B?SXNKWHNxYUxHSmZJVHNHdTZBVy9BTGJhelhxemNsSTlKcm91c0g4VGpveDBa?=
 =?utf-8?B?NVZyMjVuMVdhZXlQVExPeHVrU21QRWlBdmxmVVM1ekRoY0oxQkUrekk1UDF1?=
 =?utf-8?B?R0h2MDh1amhGazRtdHFvTmkzRklYMFRsZm1BS0ZyTTFaV1I0aGxNWlBLVTk4?=
 =?utf-8?B?UmhJNUpCcWkvcGdRZDArWGtDcnI1amgzVXY3WUNsNUVXOXVJbDEyQ1RkM2tk?=
 =?utf-8?B?ZWxQUytDOGtzZy9tSFVzL2FuTkpPcnZWTUtJM2hUdTExU1Z0cGFCWTVheVlt?=
 =?utf-8?B?VlU5aXRvNVF2dWRoV25QU2hZTjZ6djhkOGdCZjdkQkYrdklBOGdHZXAyMUMr?=
 =?utf-8?B?d3VXL1JGRkE4eGdPbDRpaHV6aEdRYllHMkZoQzQzKzFLUDhlckhwWWI2M3ox?=
 =?utf-8?B?djl4WEhnSXd2Z1Vwc1hBWWNrbEVWTXV3R3loejJhWWFreDBmUFEydUlFbzls?=
 =?utf-8?B?ZGFZczA0WHh2U3djc1dnVXoraU1uTnNwcmlIMm9vSndlTE4rRlBNa0xFTGQ3?=
 =?utf-8?B?ZUMydWxxTnhCNzFYNldxYjh3V3NhaFlOT3F2YWwzdVVvSHpGV0d6aXJrMkph?=
 =?utf-8?B?czZnY0hpWlFNR1ZXYktDVGhobHVraXE1OVNMY28vRTZ2NUpnV09DUlZIL3N4?=
 =?utf-8?B?M0xDTmNQQVV0RjEvL0tZR3UwQ0NLRXRtQk1mY2JCRjRNa1A0b1A2VlF5VUw3?=
 =?utf-8?B?UFh4dGRzOWhwRjViVzRUaFFiUUpBWEJYMC9GMjNXdDc3OWJoRkRxdXcwUEZB?=
 =?utf-8?B?V0IvblJUZWl4QUlZRUNVMWt0Y1ljc3dhKy9UTEtDS2dBUHZNZXhLU3NnOU5L?=
 =?utf-8?B?aHBnbDZnS1o3bHpKMzJoYXFVUUczNkNicDI3TmxNdG5mTlloMTUwNE4vbjJ3?=
 =?utf-8?B?dHplSmd4UjFwUXhZQjNqSXUyN0xRaTdHanRCdFBRVVdHWmQyT1I5ZnZWNWhQ?=
 =?utf-8?B?T3U0NjYzTGhLRkIvL0hJNDA0WE1KVU1DTmNDUUhWcWZITVROMzVtck9ZYkNM?=
 =?utf-8?B?bTRHQVdKZzlaU1NNb2x3Vnp0K0tDQTBRNEdpci94VGFQdWRobU1iU1pMSzVu?=
 =?utf-8?B?aDhiekN4RHdCRjVxWGhvaFpYVld5cU9PcjRJL014NXpZVU5WZGR5cHNUVDJx?=
 =?utf-8?B?bGJSVFEwdVJkT3N0U2VIdk9KeVNDT3dwSEJCSkp6Q3ZEdDNyRFJzWXZuK2JD?=
 =?utf-8?B?MHdaQTZqdUdmWVpxYm10OWZ2bm5ySkl5Z0QyQ2tHWlpLeWhJdkdPODdid0RY?=
 =?utf-8?B?V3AwZUJKbGZ0RFEvSEhxQVhlZjQxeUFteFJ6OGdhRmRieHZ1dWhVdVFaclpv?=
 =?utf-8?B?eTQyVUsxQ3VCV2hRN1lzaTBqdktiODJDcDFlcTc0dkt3eC9jNlJ5alorODdo?=
 =?utf-8?B?MThwdk12YmViMTBmNHhVRGRNTVlkUFVNNzAyWlRYQ1dnRnBvTUxNYytGdUlV?=
 =?utf-8?B?ZTRCeXVtekk5dmpUT1JPS09EY2U4TW9MeXFYM3V5ZEg1SHBRbk50NFJIeTFV?=
 =?utf-8?B?NTU4c2FzUDVwaXJlbk1oNkltanFvNTg2UDBsTHlVbjRMUWRDUFRHb2dtemNI?=
 =?utf-8?B?dWdOZStrdGFWdzVHMS9tLzFzdk13dVFEYmJPVlJTcThqdE5NdE9CN1Qyc0RR?=
 =?utf-8?Q?f3V6mwqEDnngNqu4=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0d7257-b1b1-4ea7-34e4-08df1343ee6b
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:10:59.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X17reOZvupQ+/cwZVr/ZNtHFV2TVlXq+ziEMyr7OlByMdu4tR671jV9i/Tb0iGzU0JTIXif5o0W/h9EnIOYg0JOKo5i9B8Wp78IQPcNh5nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB5397

On 2026-09-15 11:59, Hui Su wrote:
> MM CID switches to per-CPU ownership when the number of users of an
> mm exceeds the maximum number of CIDs. When the affinity union grows,
> the per-CPU threshold is recalculated and the MM can switch back to
> per-task ownership through deferred work.
> 
> mm_cid_calc_pcpu_thrs() incorrectly uses
> min(nr_cpus_allowed, users) to calculate that switch-back threshold.
> This makes pcpu_thrs no larger than users, so the
> users < pcpu_thrs check in mm_update_cpus_allowed() can never succeed.
> 
> For example, with three users restricted to two CPUs, the MM enters
> per-CPU mode. On an eight-CPU system, widening the affinity union to
> all eight CPUs should produce a threshold of four, but the old
> calculation produces three and returns early. The MM therefore remains
> in per-CPU mode even though the widened CPU set makes per-task
> ownership preferable.
> 
> Calculate pcpu_thrs from nr_cpus_allowed directly. The users bound in
> __mm_update_max_cids() still controls when per-CPU mode is entered, so
> this does not change the threshold calculated when switching from
> per-task to per-CPU ownership.
> 
> Tested with an x86_64 QEMU reproducer using three users, an initial
> two-CPU affinity, and an eight-CPU affinity expansion. The baseline
> did not invoke mm_cid_work_fn() after the affinity expansion. The
> fixed kernel invoked the deferred work once and completed the switch
> back to per-task mode.

I think you're onto something.

We should cover those scenarios with selftests in
tools/testing/selftests/rseq/.

Thomas, I recall you had tests for those state transitions when
rewriting rseq mm_cid. Were those local or did they make it upstream ?

Thanks,

Mathieu

> 
> Fixes: fbd0e71dc370 ("sched/mmcid: Provide CID ownership mode fixup functions")
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>   kernel/sched/core.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 7885ff76e69f..0280ed132d0a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10845,11 +10845,10 @@ static void __mm_update_max_cids(struct mm_mm_cid *mc)
>   
>   static inline unsigned int mm_cid_calc_pcpu_thrs(struct mm_mm_cid *mc)
>   {
> -	unsigned int opt_cids;
> +	unsigned int nr_cpus = mc->nr_cpus_allowed;
>   
> -	opt_cids = min(mc->nr_cpus_allowed, mc->users);
>   	/* Has to be at least 1 because 0 indicates PCPU mode off */
> -	return max(min(opt_cids - opt_cids / 4, num_possible_cpus() / 2), 1);
> +	return max(min(nr_cpus - nr_cpus / 4, num_possible_cpus() / 2), 1);
>   }
>   
>   static bool mm_update_max_cids(struct mm_struct *mm)
> 
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
