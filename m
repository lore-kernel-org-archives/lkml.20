Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794388257;
	b=kVhSHZcqQh1xnKNluSjuZ2MK9p2vObpYwAzFh309q31/oH/+/fp+GbUCVBjELjnOYFzN
	 4aPV+vJc2whCL8ig/ruxJQlxHucJOA+/Ktog95diGtuAah10D7ZrTI/GV7buHwDJsPqwI
	 +CjseZew7WlVHU4YdVluLgrP+aW9MTerZPS5AKMtxUNJmvDrmA4X19gncC/jfm96Ngbzi
	 Jv1p9lykVsNIlsnhIZ1KrFf1Ht4e5t1iku41OKBQgFDvh45bSA7cIWsSHbpq0T0UjcoBh
	 6M60oQqmQuwGTOC5iCieq3NKxrr6W9uuCdPrm6ZYzaSOaSATNcxO44Q1tEKAL1psvJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388257;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yhd6eYuBGdngT0Sz/bLen871df7tG2kviQAmy8fBstc=;
	b=cwroW5w2jLoAHfU7quTQJYOCyVUGzcDbBVCykjjYqlPHv7AZwylxaqH0FDa662jU98VT
	 6YDCTlnxFhbjKw+AFfiCY1Y5Eq+p8tAh1LBUWuI02JdxQ8SaU7JGDvYkxtx2SeNNvEaYJ
	 1I2Mo7yB8kkDoQUP6SFaucFot1TuczII27NH5GAttr2olETPtoBAkdthlFY0oGDHoI2Jv
	 6EbmnPYt41nTqO0pv4mXkT8Z/jxHYd4nS8IqJ2NtJlnv6iak9XnIyOBvMGEB8ad5dUMg5
	 pdcb5dM5VOG4bJCbgJ1ROtqGvi5nT/6Un7ZUQ0PiumwuSaRXy1yg17D0sXyddlyo13g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hlP8DvXh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.66
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hlP8DvXh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f58csqHEpT5xGXdMTYhkssJRFxUQ55BxKfM21FYQStTbko3NG8ZcWYTJ3cSENfAgH7LhLeGVTMqkBQlnY95H0+YqUiYjD5K6c2qDjB3MqDnR6FWmuer0TaxTqLG4yU5V113itaEGOlV4DWVCwpdlimQhNikgOxXdVUxVO/y28H1jOE8xoTt2h1g+fRVskJ/VdRiVBq9Wemd/rqy7qdg40JcjYYxjnj9HrLkFwLQAan31LTq+0u+5DiewyRPekndL00zgWT6ECx5DN1K4ypV0Wahnbw8bB/z8mCQ15REW1bmPjc4UcR8UH6cUXA3hHBng5oBzodRv0K5GIUoRtcRcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhd6eYuBGdngT0Sz/bLen871df7tG2kviQAmy8fBstc=;
 b=Twfswc0FQ3QU2jIWGJvjTvfw9m2nEEJhHYUo1zyvxWpqW37tIkn6nhs13N3QP/0+6e8j/tvG0oS42FpvtVWI7JwN4Y6X73d1PeKP+mUOXsTgszGr+GKlTWp4kYNqlBqIZnLj7LecEvL68AJo+QkUGtFsjlIfH+ZNTH+epWQFePZ3f7HgPzbtLCKwieItIsHgj7EdQitj5o/zPyOomP/QpqXONZp0fm0TvryP8Qbmqxje2GxMEkaGdlAI88st0V14CW3/+8ZhnPM/+BoiHE032XVUm8dgGhwT7YgaL2N/3vKvEHMFtv5ewwaKf9O8IHZsedEbBmjp6WESIx0nfJGDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhd6eYuBGdngT0Sz/bLen871df7tG2kviQAmy8fBstc=;
 b=hlP8DvXhVmj+4d41EpoMiSB3pINsRITBHWepNKtOk5cb7r4S7M5rxiZM6AGKkrUiVwTyQNqmoBQ2WCeiUCabqivYXH9vmJu51P/U0kGum1e3VUMDVEyWTmR0zoZxAdYgIt6FdPa85KnmX2xGDJU4cn4qjmwWLZS/mL40JQICyHg=
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:10:47 +0000
Received: from MWH0EPF000DD30F.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Wed,
 11 Nov 2026 09:10:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000DD30F.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:10:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 03:10:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 03:10:46 -0600
Received: from [10.85.41.63] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 11 Nov 2026 03:10:42 -0600
Message-ID: <b3ded9e9-2b4b-48c4-8e18-5c213601b96e@amd.com>
Date: Wed, 11 Nov 2026 14:40:36 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] sched/core: Abstract/fix
 rq_clock_start_loop_update()
To: Kayra Cizmeci <kayracizmeci@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: <mingo@kernel.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tj@kernel.org>, <ziqianlu@bytedance.com>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.242460109@infradead.org>
 <avBDWS-AY6QQtCuH@scheduler.schedules>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <avBDWS-AY6QQtCuH@scheduler.schedules>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD30F:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: fa94b58b-dd47-439a-e887-08df3fd3ac6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|23010399003|1800799024|36860700016|260925021311599003|260925022911599003|260925021911599003|261028144727099003|11063799006|261022075727099003|56012099006|4143699003|261022113327099003|261022105027099003|261026140227099003|261026121527099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fQeb0Cg/1byr+aFBYxUfb+nQkDkDsr1zDmM4jEYxWDO+guvrw/HSFrLIYSADeID1K+fuo39B4h7mpGXh9eqZL2Ut0KN03alEPmVZQXJ+eESujgd9e4uVVhvbh2EHTmqQqcn4lsl3ylKGmbd2hAVMgA0DZZRipaTRL0gLd0MV3DE1cvFjPEH5rQRpTfA7Pc2bp4/gbZ0oHU0OJu07YIluR1/PfGIV57R1ItSGpNedtz7mPGyXQzWr8d8lRcRRTE37pMi6wHzBTFA5TSPk6NkNW0EZ7pboaqXUnrzaw/lSed+SN+7DTqiRKZDruH5UZWhHdeNtD9BkGYIAYz3n4YOw4NeYX0QSXORlJ8hr6kYCztUzfo40dgtDjrfq7H1rXFXoxor4LqBXMJQaU8H9rR4WRpVSF7vtdNnSjB1PDN+zIzxCW9QNGz60BaAYciWzWnmmCO8s8Y3Rw8uKWs4bp0l3M536XIF3I2XdZy/BkbahwLLd+FJiSIYNygvPhbhzAu6h3jfR3AM2h7mKIhi49y5TSMDyGISduki6FQxd3cmOIJJp2qJIjeG+xbVVQIaziFXdCBTThp6fFYwry2+KRayPXqXIhrtZMNKbpeaZShLJOvhSGOcKxq66cKtqmEsn+9RNJCbe9XksccRWPzmPG8a2olSBTSKGUzpL89JIZ/4dj/YdXn1XBo4e15DLboGqekAn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(23010399003)(1800799024)(36860700016)(260925021311599003)(260925022911599003)(260925021911599003)(261028144727099003)(11063799006)(261022075727099003)(56012099006)(4143699003)(261022113327099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dep45iT7WvB4/oDnoPegWizy9bOgteh5sWKA8EhLRhA0ZUewJ0y0tCl/cm9Bw5YM/AuZgKMrJVDXsHqlXRfnEszv5lU6Yy+2YY1kWlGF3HYlZ7sCbHCEc079UL9z1BY+XFKTSReh6FVVRWvaEm5r3IM8JyuxpPm1p8/uKyNo/eUykc8ebU0q72cDh7fCu26o84EkCcgKN7dvzyCajxOgwJ7ZmkLRnLeerumEsbaLJNZF5HbXovz63Csb4HgBqNgikXWIkGh5GFnGfsTkhahO6FkNb5EHjQm6oRPdXVlGqYQyvgsPyPypujcDX+99O0HAzKdzpr9azRPxRNnzoJX7A81l9Qk80UQry/tKFSc2tT88nP4xiKR9ha0nzF/ah+Q9KPLlNbFM7ZXx0PXV30ftFTKOua1JdaE7SL5z5NKgg9IOUlBkJqIty+HRvcUViPod
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:10:47.2430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa94b58b-dd47-439a-e887-08df3fd3ac6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000DD30F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782

Hello Kayre, Peter,

On 11/9/2026 3:56 AM, Kayra Cizmeci wrote:
> So to fix both of these I would suggest something like so, not tested:
> 
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 339a77864ec8..a91d12640f37 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1911,7 +1911,7 @@ static inline unsigned int rq_clock_freeze(struct rq *rq)
>  	return flags;
>  }
>  
> -static inline void rq_clock_thaw(struct rq *rq, bool flags)
> +static inline void rq_clock_thaw(struct rq *rq, unsigned int flags)
>  {
>  	lockdep_assert_rq_held(rq);
>  	rq->clock_update_flags &= ~RQCF_FREEZE;
> @@ -3357,8 +3357,8 @@ unsigned long arch_scale_freq_capacity(int cpu)
>   */
>  static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
>  {
> -	rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> -	rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> +	rq1->clock_update_flags &= ~RQCF_UPDATED;
> +	rq2->clock_update_flags &= ~RQCF_UPDATED;
>  }
>  
>  #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\

So with this, I still get a clock_update_flags warning like:

    ------------[ cut here ]------------
    !(rq->clock_update_flags & RQCF_UPDATED)
    WARNING: kernel/sched/sched.h:1862 at set_next_task_idle+0xe1/0x100, CPU#262: sched-messaging/8375
    Modules linked in: ...
    CPU: 262 UID: 0 PID: 8375 Comm: sched-messaging Tainted: G        W           7.4.0-rc1-test+ #463 PREEMPT(lazy)
    Tainted: [W]=WARN
    Hardware name: AMD Corporation Titanite_4G/Titanite_4G, BIOS RTI100CC 03/28/2024
    RIP: 0010:set_next_task_idle+0xe1/0x100
    Code: ...
    RSP: 0018:ff919f922f4e7c80 EFLAGS: 00010046
    RAX: 0000000000000000 RBX: ff49b96ece1b33c0 RCX: 0000000000000007
    RDX: 000000128e40504c RSI: 0000000000000200 RDI: ff49b8b30f2d8000
    RBP: ff49b8b28ed84280 R08: 0000000000000200 R09: ff49b8b28ed84280
    R10: 0000000000000008 R11: 0000000000000008 R12: ff49b8b28ed84280
    R13: ffffffff86a043c0 R14: ff49b8b28dfca700 R15: 0000000000000200
    FS:  00007fddd81237c0(0000) GS:ff49b96f477af000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000055ce59162840 CR3: 00000001a1f11004 CR4: 0000000000f71ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     __schedule+0x93b/0x1ca0
     schedule+0x28/0xa0
     anon_pipe_read+0x302/0x410
     ? __pfx_autoremove_wake_function+0x10/0x10
     vfs_read+0x30b/0x340
     ksys_read+0xb8/0xe0
     do_syscall_64+0xce/0x550
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? do_syscall_64+0x35/0x550
     entry_SYSCALL_64_after_hwframe+0x76/0x7e
    RIP: 0033:0x7fddd6514932
    Code: ...
    RSP: 002b:00007fffd6dcde28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
    RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fddd6514932
    RDX: 0000000000000064 RSI: 00007fffd6dcde40 RDI: 0000000000000007
    RBP: 00007fffd6dcdee0 R08: 0000000000000000 R09: 00007fddd81237c0
    R10: 00007fddd84ed0c8 R11: 0000000000000246 R12: 0000000000000064
    R13: 00007fffd6dcde40 R14: 00000000000001c7 R15: 000055ce88d5e840
     </TASK>
    ---[ end trace 0000000000000000 ]---

with:

  coresched new -t pid -- perf bench sched messaging -p -l 100000 -g 8

on queue:sched/hackery.

If I do:

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 339a77864ec8..fd900d1419c6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3357,8 +3357,8 @@ unsigned long arch_scale_freq_capacity(int cpu)
  */
 static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
 {
-	rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
-	rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
+	__rq_clock_clear(rq1);
+	__rq_clock_clear(rq2);
 }
 
 #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\
---

I don't see that warning anymore. Must be the "core_pick_in_flight"
check keeping everything sane.

> In a case like this:
> 
> CPU1 calls rq_drop_lock(), saves FREEZE = 0, and changes FREEZE to 1,
> and drops the lock.
> 
> CPU2 gets the lock, saves FREEZE = 1 and changes FREEZE to 1, and then
> drops the lock.
> 
> In this period CPU1 gets the lock again, makes FREEZE 0.
> 
> And later CPU2 comes and makes it FREEZE 1.
> 
> 
> Not sure above could happen tho. Could it happen?

I suppose it is possible.

Generally rq_lock is dropped in middle of __schedule() when NEED_RESCHED is still
set so ->task_woken() would generally bail out early for dl and rt (ext doesn't
seem to drop the rq_lock on that path).

That said, a concurrent wakeup can grab the rq_lock when another ->task_woken()
dropped the rq_lock or a __balance_callbacks() for setprio or sched_move_task()
can interleave with a ->task_woken() and lead to your scenario.

> I tried to fix this assuming it could happen.
> 
> I'm not really happy with below diff, but I couldn't find a better way
> neither, so please tell me that this case can't happen or there
> is a better way to fix it :-(. This is on top of the current code BTW.
> Only compile tested.

[..snip..]

>  bool cfs_task_bw_constrained(struct task_struct *p)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 339a77864ec8..d8f1784d0640 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1281,6 +1281,7 @@ struct rq {
>  	u64			clock;
>  	unsigned long		lost_idle_time;
>  	unsigned int		clock_update_flags;
> +	unsigned int		clock_update_depth;

I think this can stand-in for the freeze flag too if you do
something like:

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 339a77864ec8..49c732d3f3bb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1280,7 +1280,18 @@ struct rq {
 	u64			clock_pelt;
 	u64			clock;
 	unsigned long		lost_idle_time;
-	unsigned int		clock_update_flags;
+	union {
+		struct {
+			s16	clock_update_flags;
+			u16	freeze_depth;
+		};
+		/*
+		 * Inspect both clock_update_flags and
+		 * freeze_depth together in
+		 * __update_rq_clock().
+		 */
+		u32		__clock_update_flags;
+	};
 	u64			clock_pelt_idle;
 	u64			clock_idle;
 
---

Probably makes it very ugly :-)

>  	u64			clock_pelt_idle;
>  	u64			clock_idle;
>  
> @@ -1902,31 +1903,28 @@ static inline void rq_clock_cancel_skipupdate(struct rq *rq)
>   * update_rq_clock() for several cfs and rt runqueues (Typically when using
>   * list_for_each_entry_*)
>   */
> -static inline unsigned int rq_clock_freeze(struct rq *rq)
> +static inline void rq_clock_freeze(struct rq *rq)
>  {
> -	unsigned int flags = rq->clock_update_flags;
>  	lockdep_assert_rq_held(rq);
>  	assert_clock_updated(rq);
> +	rq->clock_update_depth++;
>  	rq->clock_update_flags |= RQCF_FREEZE;
> -	return flags;
>  }
>  
> -static inline void rq_clock_thaw(struct rq *rq, bool flags)
> +static inline void rq_clock_thaw(struct rq *rq)
>  {
>  	lockdep_assert_rq_held(rq);
> +	WARN_ON_ONCE(!rq->clock_update_depth);
> +	rq->clock_update_flags |= RQCF_UPDATED;
> +	rq->clock_update_depth--;
> +	if (rq->clock_update_depth)
> +		return;
>  	rq->clock_update_flags &= ~RQCF_FREEZE;
> -	rq->clock_update_flags |= RQCF_UPDATED | (flags & RQCF_FREEZE);
>  }

This seems like a legit problem one can run into and
your solutions works well!

-- 
Thanks and Regards,
Prateek

