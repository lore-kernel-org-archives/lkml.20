Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D62A3C1966
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540185; cv=fail; b=Osvmu64+alq4/0hjtHYfikslLpnO2905fzYOhn2vVclraK7eqzKsWLzjW13d65oRBlbns0/xWkVCdwDxICr2/lAfGUeCj7b2LKDmxojvnn+w5Ce1kyDSYYI+DlAcgAbk7g9O8lpPvbt8JUPUV/yONUUhrHuOMYnkkw4waRjzyr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540185; c=relaxed/simple;
	bh=56+r2OQRY2UWaxIjFQbXrwY3fQyiVCBoJbe+BVgOgmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m8zM/wk7Byw2vSHQsA5H9R1KOotP0+ZrEBaz+b/9LhDCq4T5SS7b+yEuBWC5KIECVtG1WBO9D1R9IwAWVeDTOf4cHR5hUrNjx+nBIF4PjpFKT4MsqISAMGff1tVYFj8wx7pIURfbV5kTQgSfAlpPC2ZSZHh9bhxGxc7uXL39k5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HHhEP7KG; arc=fail smtp.client-ip=40.93.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HHhEP7KG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVLYR5dhDnauhILQHe3osn1SxKpNFQIUYrEWDJ2u3vpCINJJaRue3G1JiTekbiVC29mXYs7rpUugXE7lxvx/S72sZoG30C3Yv2hL8ynbOIREhm46ICoZlZEZ6wVlGJbkXygqjusTxkMbbJ0yZH/JthIveBp50W/90SW1ie7JaSM7lWaF8kTi9FczPHsnJt5Gk9vOWx2PPQ52J5enhwk6hhCJvxCeioDovLuMT6ZKvQz7QLPgNEoEC5KNfhJzk5xprvEERs7I8pqzkSsxSAvq9Lf674AM8ViAFnvehN1o9rhvmPoZpMZCq2rVvKAlSomLyUw7rNpHUCqOlr76lcCsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq85Sv29ssqM1ddY0oX4LpfrD6VeLwZ/dtrCMo78rpk=;
 b=u77Vm0tC+PzFwK2msR8GxQOl7sx5scfE84ovJd1ZwYtLgpXvAkj+cPXOz5xDhVsTNx/CdCEaM/Y+ko8faMXMWZH1XBtRPWkdzd4URca/O0y6zw3BSQOh1DAXCwRUH7s0x/6ZcCbyFG8RPpqiM658jUsRIEZani3kAveePCIkWwTt35fVfEmkabXV+7iGF0wSW700Nx9y9gcsl7FWS0DcMmPLvqShLPqb0xUBLopd7kMQ9+QJLj6DrNOWUbCiGHsoSDGyQKKoRJ8LMO4HhCl5viJtClt947uZ0RtA1lUTM0O3ErFVTL+BFqsFSnK0oEXqQARe5yrtAPEwQliMEa8isA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq85Sv29ssqM1ddY0oX4LpfrD6VeLwZ/dtrCMo78rpk=;
 b=HHhEP7KGHbzrJ/UkFdBz16Xro+MJnptO4WhWkL0v0i8KP2JVzfh33XuHKvInw5X1lfLz8yN2cXp/xvGsCAhOEoQDnpR/3drK3Aund2D1TfOwNtjQjGnL+H3XMELprrpBfa+1KaoLSCJljfuXAifQQ09ztNswsUoOnAmOOWLYFyk=
Received: from SJ0PR03CA0335.namprd03.prod.outlook.com (2603:10b6:a03:39c::10)
 by SJ0PR12MB6856.namprd12.prod.outlook.com (2603:10b6:a03:47f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 06:29:41 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::1d) by SJ0PR03CA0335.outlook.office365.com
 (2603:10b6:a03:39c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Wed,
 16 Sep 2026 06:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 06:29:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 01:29:39 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 01:29:35 -0500
Message-ID: <a43db121-1a12-49c5-8df1-574f57af6d01@amd.com>
Date: Wed, 16 Sep 2026 11:59:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/16] sched/core: Track CPU where the task was
 blocked on
To: John Stultz <jstultz@google.com>
CC: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Waiman
 Long <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-10-kprateek.nayak@amd.com>
 <CANDhNCrWKd_p5H2Cc0uEooD9-kU0a4e=GrFhpVA1cDyz9M2mOw@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CANDhNCrWKd_p5H2Cc0uEooD9-kU0a4e=GrFhpVA1cDyz9M2mOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SJ0PR12MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8d7501-4fd3-4747-ab83-08df13bbe3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|30052699003|7416014|376014|1800799024|22082099003|18002099003|10067099003|4143699003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yKAIJx53FB7cOHSqJFXbdbU0KN/JWk+JRlYpO77Ojfv98E2DSUTa2VyFAqyIrBx0tW6DinasTU1+yyFbHKTgnkR86TOxAa79Exo8ILPsEG6qW31UuuqgiiHKWmLZhEeQSnLqcnZV4UDp0MiSaVOMQ6qsiELvceGPViN/Vs071TmYtMKp1P6nIN7p7Hzlh3J2Sib2z2W7k76+7XJ4OFWF5Y1E2WJvoAIDYTTT5I8iF8Kdfh8FM7hqse1gpAOpCgC99BV5q3tXJdaJZUkrnU1gTs+eVqbe9SUs5hxyeC+pVD0+JZQ4zIhqw+vQPyccRcU9awno+a6cdE9IjaGBdx3VP5xcCK/bMeCIudSOxw7lQlrPo70j06EH+njEb1tfi0I0JkpcAUEefek5fZUvWe1/KGItHLbSc9m8E+x8+rqGWp58eeATCCiy43o94icNT3qecotmrrYuKlpqgeLj+zNiK0gG9b+/RVksuRTCI634QSuPs8OeUdK397QGJ9zQ02of0NdYv7jCE6v7dyUItFWhnrZHD3UdCVWV8UVJdOEEBD5X4qKs378KW0k6NfCnQC1kdoMr0XCzvjttF1+4GgHaxeBrDLMt7ikJLxioHbPdx5mtrF82qfCTINmibta9Y+Z6F0Q0vDCPQucokAmBqBMZpvMRRKdkJWYs0zXMQ2AFhBGLBc7ILSailDhqGqNsf0b8Ol/SdqXebRiRHaZDVlqCmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(30052699003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ITTRgHFkyj5DeX+/+t7/+NRamOv5R7WXzXGid1MiqdrHK9O7AHTcuXLtzNFPyFEBM36eoQR30BXDbStomSQI9Q+ZUjye7Cz5KVYOI6acYyC6YjguGBq+4RQcRjR1OTb9Q2s21AXTris9DEQG18ISrief1DzMhIyaS3IQ4WenmBn0/XUfWsBjb2h/6yuokJO1cjaI1bQ9FmMKF1W0B8zeOFTWm2ytLqXPrhamZk2LbWeO4Y96HFVTzMI8UPt56NHGB/N7ZXvb6YlO36XOBHvHO45fYcWOFWp2k/zS424LoEgFGfd06fDrwVqmWKtpHJjpxjpbJkDyCt1QGb5IShyJUKdXPGr2xgYtLNxRbI67o0Zg5pKOOIA10fD65mxNq+LkgEDN/0vcw5gU9Tp2aFHIqh++B+ubZ0ov/R42IHotgP7jRC095ZR66dJ+n64V2n9A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:29:40.8980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8d7501-4fd3-4747-ab83-08df13bbe3b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6856

Hello John,

On 9/16/2026 11:22 AM, John Stultz wrote:
> On Tue, Aug 25, 2026 at 11:32 PM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>
>> Track the CPU where task was blocked on when running with
>> sched_proxy_exec().
>>
>> This is used to re-direct the activation of blocked donors queued on the
>> blocked_head via the said CPU in the activation slowpath that will be
>> added in the subsequent patches.
> 
> I'm a little confused on this, as the cpu the task was blocked on
> doesn't intuitively have much bearing on where we'd want to activate
> it, when a sleeping owner wakes up.
> 
> When a lock owner sleeps, all the chains of tasks waiting on that lock
> (directly or not), will be enqueued on that sleeping owner.
> 
> In my patch, when the sleeping owner wakes up, it may or may not wake
> up on the cpu it was dequeued from.  It seems we would want to enqueue
> all of those blocked tasks onto the same runqueue where we activated
> the owner, so they are all present on the same rq to be selected as a
> donor to potentially run the owner and release the lock.
> 
> Since its like there is a likely chance the sleeping owner will wake
> elsewhere (It looks like proxy_activate_blocked_task() in the later
> patch effectively overrides the activation on the given rq and instead
> wakes the tasks on the blocked_cpu),  won't this end up activating the
> chain of blocked waiters on the wrong cpu (forcing them all to be
> immediately proxy migrated over)?

The base concept is this: When the task is blocked and is queued on a
sleeping owner (p->is_linked = 1), the whole chain is linked to one
CPU (p->blocked_cpu).

This is why, later, in Patch 13, we block with (SLEEP | MIGRATING),
and do __set_task_cpu() to owner->blocked_cpu before we transition
p->on_rq to 0.

Entire chain is linked to the p->blocked_cpu of the top level sleeping
owner.

p->wake_cpu can change (more on that below) when task is fully blocked
(p->on_rq = 0) but we *need* to have one unified CPU for the entire
chain to resume wakeup from which is why we need a second variable.

For ->is_linked tasks, any state transition (p->on_rq transitions) are
guarded by p->blocked_cpu's rq_lock() and that *cannot* change until
the owner's wakeup in proxy_activate_task() is finished.

Any external wakeup in ttwu_runnable() for p->on_rq = 0 &&
p->is_linked = 1 should go via "p->blocked_cpu". Same for all the
guard(sched_change) stuff.

Also since we do a:

    set_task_cpu(owner, cpu);
    ttwu_do_activate(rq, owner, flags);

we cannot simply look at task_cpu(owner) in ttwu_do_activate() to
know where the donor-chain resides. We need the p->blocked_cpu. 
>> p->wake_cpu or task_cpu() is not sufficient for this purpose since
>> p->wake_cpu is not stable when !task_on_rq_queued() and there is a
>> window between set_task_cpu() and activet_blocked_task() in the wakeup
>> path that needs to be plugged in.
> 
> Sorry if I'm being dim here.
> 
> Do you have more details on this? Was my patch prone to the same issue
> you're avoiding in the second item here?
I think NUMA balancing and workqueue have cases where only p->wake_cpu
can be manipulated to direct wakeup of a blocked task but it is only
done when p->on_rq is  0 and p->wake_cpu is always changed to a CPU
within the task's affinity boundary so your series does not have a
problem.

Only because this RFC's approach needs to track which CPU has the
ownership of the entire chain, I need a second variable.

-- 
Thanks and Regards,
Prateek

