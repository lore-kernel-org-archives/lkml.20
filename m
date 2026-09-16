Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA2E3DD847
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541962; cv=fail; b=Ua3xVCmDj3nF1bPY/QtDygrRHtLpHVhm2xpbj8xPd/c195Dk0UG1Y6LJKnnozMteUYlPMLA2nWBR0RDMtVw382yiwBJS+LqgHYEj8CnhEbwyJSXejM7RagBOKeDEh7nogKYkyBe6Dxil/CO4CTo1QsV6gDx6wb4Kwopcx/iFH+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541962; c=relaxed/simple;
	bh=0yEMqBZS1fxam0B8EiFdzj6MYyFKd1M23anJ5QqHlHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qpuq7dbs5ugAaehbiKdkaH4H/DvpVCjPsFeg+OQAAO6DKokOlVrSRTcq0Yv7Rsvo5WizgPHvXDAleSDZs1XZkK7oj6L6394R+aRgTy1/L6g+KIa8w5nHdj6hIGhdEP3+sHo+gYj5od93P4iHfQqSU4cN7d1ayc0lQGSDscM0zTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B08ikxVG; arc=fail smtp.client-ip=52.101.52.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B08ikxVG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLFmLG3u2kglKPWot0jPY/ZA4C+q0Dv8GBF+yypi2qIfYCFLyuXLIaw+g0ufUfmA+4J/GNS5P0xsjsNROvaTaljWZ3VjhgeLOtvmm7HHoHrtSlj1S7SSfONKtTxqtSLDlrcIzvHrY4IHI5Obp6WE32Zbw9+iHU6V+oBKPyvFcmb+J9grY5XbBZbTayxh0iOfwuOdy3xZZoFq1GZmeZMWJJmXSSBv7bezzDi7Gp+0pHkM/qt1uoSywXcG9EYQRJZ5vNPg6oRBNnOYfjYw1+Y72JgylwegEWro12CJcS2mTtTZUSU99GrVtUy36rYRIkBoBO2NtS3yqZWUHCLQiGeaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D55ErvLoVriXoI7/LYwZzt6gPxuPesd5l7M77txPog8=;
 b=SC0SA0Ve82PYTO2637VYlJEl3qCW5bw3VhQc1zhAnSmsFZwak8+BRZK1FQDlsVfO5LqMiV/OVZ1vv00cYxbZ7u+uwhgYBbDGEUobfVNfuqVkxSYnrsy085lvoJ8xhBHiW2VEBR2SsqOJ1gqXpsuxSKoV6pH3z8X8poiEMByY9jbdArY2N7GQKXo7E1pH2Ll46zBTrBTJa7ZeND2IZ4hX1ltPmZnQ1hnB85zmR6tnMk9wp+zpPktlq4kD7nuP59goPohEHVL3gFE/C/4/GuZWOt61k0qBBSB6c+5FAzgpndny70X0+zAx77Ye25XPQHmnzT8hQIVnPJlJWlm3vsmm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D55ErvLoVriXoI7/LYwZzt6gPxuPesd5l7M77txPog8=;
 b=B08ikxVG7GVz1b3C7beBeJoSmb56C4SUDjRZPvHoQ61a+18N6EyNDvjfyys/5YeIVKzIThvYNZvAuRWuWg4VAT3/pWfxqbVpMUNKOPFR3z9Oqq+zaB7iBmjDtFvCbbeL4DmX+kUgQmSiVDPbOGoTwezpBHsDUWRCEqoGRH31Phg=
Received: from BN9PR03CA0573.namprd03.prod.outlook.com (2603:10b6:408:10d::8)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 06:59:15 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::36) by BN9PR03CA0573.outlook.office365.com
 (2603:10b6:408:10d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 06:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 06:59:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 01:59:15 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 01:59:10 -0500
Message-ID: <8394b163-8ddd-40cb-a2ff-bcd18d9a9d14@amd.com>
Date: Wed, 16 Sep 2026 12:29:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16][PoC] sched/core: Alternate approach to
 sleeping-owner handling in PROXY_EXEC
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
 <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
 <a367d70f-a095-419f-83e8-5d7458204f3d@amd.com>
 <CANDhNCo4EHNXY9zWhE3ngzHN_7eHpjP9v2MrBkrS8vHpTD7jWw@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CANDhNCo4EHNXY9zWhE3ngzHN_7eHpjP9v2MrBkrS8vHpTD7jWw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 90831f10-614d-4180-155f-08df13c0055b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|7416014|36860700016|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8NhqAFXIXZpzfZBiCHjWaLUSODLy5WNJw+Qbs7kCG1Wh0WSO1nV8+QCZmWtgadTEoIdA2QZbeELLIpZ/GrYsaN0zTq5t/LMYgSGiQnaTAKGLYS8nLRZGiCvHYfL+EZaALKYFSgcchOXfFoO4aKQbkab8RnmpKDsky8yb7ZdenXV7TrHAl/fyM5AAEFApmhvhIRB5crdRMSm6BU+gq0OQyL9VwBIXAAcBQlLAso6WGCmgcE0mm42rxEiqB9P3myXxBOiQbNUQBhlSyk7Bhiy2CPSC8mINIWIu8oimGXS1u+yCcJ2rmvum3XkpD620syLu3q09k5u4OxvuJ2smynihTqWXyE8k4P3vU+ceJYdr99qrR6A5G/OXdQdBJVYBd/EES5V1HdXGwp3w58rMVDzCzgcEyXd2+P2yWpJ8MQWDtkAYn6mtiq/NhINaAyGFJc4HQRuXpAzbamVHPaukJtd4TUImQSmLJMnNlL6WsekYEBgnba2fpMRry/jJl5qtlTB4anwL+I7HNHST697mGLAWXmOhjXpraT36IQkzkHxx4XqZxIv56LRr/3n5iPixVDMmq6qFo/G8UsncBtrEjhelMglYMs7VheHlA5udac8TNqv1YiiJ2DxkZXBOq39Ze7YvkES5uabTkWkpf9uZ9WN0IuzyYZgXPKIeLKDjgRTKEPIgrKjTjgRzXT/p2HezCIaBmdD4Abf2OPKPJwAcmlDLeg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(7416014)(36860700016)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KsFvukNYBTrfIPWkBtNd0CKucO7ZoOoOv8SXMYy0TpPPCE5XzOWG5x27MkleyvBl0bpNAgqk2CilTN+Ed/kbib//OopZ+jPJx0ITICyXHok11QBl1IqpMl9WByMKHBC35+7Fiq7sV52YIBgjpfBZaE5MWQg7PwOC7Ums44b4mfXQljBOPMGnlbuofKH2vMClgb6VPdcgBYEyPRxxr8m4+lKG1C+Tg6jIdzWOfNPXWBWG95Fk8pTi19wGZ73GouomPHsggmaeZdjPtpdepVAsY6dpzTIyNUDHbvXzF44bvP2uuT6zDzYZJu4kxPHdp6NG5UHolCG5r4TLcxomMAjLTRD95nimgXO2hD5hVFzTTpNcDruKeS3BtKJSHyEGnvnPHUbBhFzN70OnXqT0nbcBlipyqz4WBlG7W1dkDpF4+1fvhfSwEQ8QbitE5Ycj0At0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:59:15.3964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90831f10-614d-4180-155f-08df13c0055b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837

Hello John,

On 9/16/2026 11:53 AM, John Stultz wrote:
> On Tue, Sep 15, 2026 at 11:10 PM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>> On 9/16/2026 10:52 AM, John Stultz wrote:
>>> On Tue, Aug 25, 2026 at 11:29 PM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>> Again, it definitely is interesting and appears to be more integrated
>>> into the scheduler logic, so I'd expect that will give us better
>>> results then my maybe more isolated and tacked on activation logic.
>>>
>>> Have you gotten a sense of what Peter thinks of it?
>>
>> I think Peter is slowly getting through the more stable stuff first
>> and may arrive at this at some point but I'll try to get a word in
>> at LPC if he is planning on attending.
>>
>> That said, knowing Peter, I have a hunch he might like your approach
>> better since it handles delayed tasks too (tasks may be eligible at the
>> time of chain-wakeup), does not add stuff into ttwu_runnable(), and does
>> not have the insane (DEQUEUE_SLEEP | DEQUEUE_MIGRATING) behavior which
>> has larger implications for PELT tracking and SCHED_DEADLINE.
>>
>> I sent out the RFC since it makes for an interesting discussion but I
>> have a feeling lot more things need ironing out if w go this way but
>> I can always do it later after the stuff from you and Suleiman lands
>> once I can prove some benefit.
>>
> 
> Ok. I'd like to try to make more progress moving the sleeping owner
> enqueuing upstream as soon as possible, so deciding to push forward
> with my big patch or migrate to focusing on your set would be a good
> call to make quickly here.
> 
> Your lock nesting optimization at the end seems like it might still be
> applicable with my patch, no? Maybe we can pull that in at least?

Lock nesting optimizations only work if we fully block delayed tasks
at the very least.

The only optimization I think which might work readily with your
series is proxy_enqueue_on_owner() bits in Patch 6 with:

activate_task(rq, p, flags)
{

    if (sched_proxy_exec()) {
        WRITE_ONCE(p->on_rq, TASK_ON_RQ_MIGRATING);

        /*
         * Once p->on_rq != 0, donors cannot queue on this task.
         * pairs with smp_mb() in proxy_enqueue_on_owner() that
         * orders list addition against owner's ->on_rq check.
         */
        smp_mb();
    }

    if (list_empty(&p->blocked_head))
        __activate_task(rq, p, flags);

    guard(raw_spinlock)(p->blcoked_lock);

    /* Slow-path */
}

Trades off needing to acquire blocked_lock always with an
ordered store instead. Also depends on the first 3 fixes from this
series to handle p->on_rq = MIGRATING properly on the
ttwu_do_activate() path.

> 
> I'm also wondering if trying to refactor the is_linked bits in after
> my change might make sense, though I suspect that will require the
> _MIGRATING flag dependencies?

I think so but I can take a stab at it and send out next version
re-based just before / after proxy futex bits.

-- 
Thanks and Regards,
Prateek

