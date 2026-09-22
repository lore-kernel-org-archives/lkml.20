Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C842E401
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056103; cv=fail; b=s1rDciwLaS1sNJUa1ePnB6k35ih+ksjTa2kbdPkr1ogFVA9J7Lw2JsFSsH+wVorPsps/ABjE5w3JsIeS5w/ibU2E2lU3ky0YcGxsd1P2lEuY44DLSbts2j1kHHjvnk7kZoaO4zVzzI62oG4hoxPc4Z1GFDEYSe9gQfEiSPv2qDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056103; c=relaxed/simple;
	bh=ta7Ywtw0sGQH+lQlW7VY4yIQ6YTlNgT3K1uluBmpNeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KSHygAAWkF0X6gjPCGSqSDNOS2S1v7SAFDP6zva1bRvhBIcGqGChd6ei9C/nk+J8RN0lpPKrr2wonKQwqRzkbDqXH5E6+rNe6lYhCUlvULUMYwBxURhg9G9CZE5yYI2K/5qcrNduh0Li9pQcZ7CaHpg84xccU5kgXJmuzUZ9paU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aGImCSbL; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aGImCSbL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3xiv4tJqOV0QotCpLR/+agqcPwkWswlsVgjZzeudCk7Ol1cpP6ZE2k2st3JDtPQHP3pneMkSn0ZEMWNt0R6GS3YTSdTqJPgQqHkCWFryhPLLspkO005WvBywgB/8TXKH8umgE/7pyGB7DzosfRGqbBebmFgqK5XVkkvjm1zDhdGxd/KrGkpDRupJg2MWTq9UcxjIvDGxy2WtQ4t+TVlWPLyOLoPkUoM7PkqhV/CMzC28fZ6HaUT8lePgY+wnekNcoHt8Q4M+gGLINKOOIcnBbJT4vOe8hCsGskKYltUd/OB3NEEGzCSK4GKhBKvQr8+hDIdyi5WYLUS1pTIoX10qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICG8t7ld0olCk5mXa2Ubz4FFYZNYUrbxIUhWXgIS2jM=;
 b=qCV+2o3IEGiS7fpeHX4c40mmTD/p0oPpIfaJVWlpK5r/2FH8GVPPB0vpIFTbjVvvjJhSXjaBMqRFKwDiLa00enkcJ0+kw4xlEu6ZTcSxecSXlg4JPtAiuWtzvbguW2TznWgUEQL+oW8QFmgOknwTyZn1WWAYmAQPmyMpkqgfRd46bH8HCN69FNIdLIDqjPtQWt0RX/EdfXuxQ4sBDS3mYYjwIe+0nIeEgFRfbVTfQBRvME9UVfqgy/S8tFhWF7+XR5nHtmiH822PyeOrq5FjwjHqddhnU+CTWOkSjyvEn05S6B+q4ZtnWIh92DIY3Dpihh7w+Ahx8Cw68D4f9cb1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICG8t7ld0olCk5mXa2Ubz4FFYZNYUrbxIUhWXgIS2jM=;
 b=aGImCSbLcgSzPWLh668OBhKmLLPIEQkN07BFM0Ptw1os3F0uuRc85EF8V+CTGsFnrXJ5k7R9Y5VhpdUXBlXBXB3jxlOeq90XYvihvdAlaZqC6KCcmCbZFEKdj+S0Dap7r3XhzuKUQYgcRR3fqjhX0Nm1cFgpPrm0U17Uz3lKvSo=
Received: from SJ0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:33a::8)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 05:48:08 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:a03:33a:cafe::4b) by SJ0PR03CA0003.outlook.office365.com
 (2603:10b6:a03:33a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 05:48:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 22 Sep 2026 05:48:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 00:48:07 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 00:48:07 -0500
Received: from [10.136.46.195] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 00:48:03 -0500
Message-ID: <8669890e-c8a5-448e-b059-d959e3a1d73c@amd.com>
Date: Tue, 22 Sep 2026 11:18:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] sched/proxy_exec: detect cycles in proxy walks
To: John Stultz <jstultz@google.com>, Hui Su <sh_def@163.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Zhidao Su
	<soolaugust@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<linux-kernel@vger.kernel.org>
References: <20260914165455.2126134-1-sh_def@163.com>
 <20260914165455.2126134-2-sh_def@163.com>
 <CANDhNCqZwGk+wqhB4N8Emq0rPmzsrVWzHmayiSj9ptg-vLzo3Q@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CANDhNCqZwGk+wqhB4N8Emq0rPmzsrVWzHmayiSj9ptg-vLzo3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0d3387-e0a5-4d80-3982-08df186d1423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|13003099007|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fTIN1azt3b6nHeVjGmBbvjdsXI+BAmKp1/7sDxNpA8fePBPpIQ/qnyGj7m9JlamBqNZmZsdOLd4BVUXVWeUX4H3VkD+HLvNYLkZguMc+1mYfzAK80mzU3LqvTMafb1HFlO55xGIhAURn3zb7hAbN8f5LXO4//9a03gio4Z9JyAfa5HwFkI44YUUcAPSjw8bxbuARCH1ILop1G49T89frjdKIJnIGykrl35S4DY2Lxw3AGHksH73DZxKcUJFw/sA4Jawbi9YPjx+LCjQMDm0BEBknp3T2iLWJe6q9aPtRysTDkwCrR5OrTufuV3TUC+qacpaekqt2rfr9Jl9pEM8GG8q+UrMsOM7g5tboLpWtT25450GYxGOl8DYZAtzWg9CDl21fcZDhtl2dABn9vBSVAff2Zvwj+Zo5zaXtD2HiOAfRWsUvNsVc3ict/egk1uvYstQmNnqFLttbzOFnaPq+NeN3ja3VWV/PbZt/tuTtty8s5dTFHw1/IFO3Tx9hJcJ923r8TDgcIm0/4+3NcnF9lvkGR7aSspAS0PZxTJKYWmrM7MGe9TAhRm0UiSugARW/uRgfzKpdEkHim8P6EldWx2QnYXk0nlLmVavuTle1cW/i8epWbfPeG4vxY3PH6qGmdjSOqkEkxyW/cuf8i+y3hFt+QQxaUk44aGhLZedqErY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(13003099007)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	91iX5rQnuqnN3p0m/3moVKtKIqgnj4rJVhXSACpvyL4dcD8SMKlVgmH5WSp6XQHM8phlzCFuGL4uPL4zPSLe8n1PeMoacWK6xsObsnB6pDsQX3dNxyciQFSEO2FdAYwPpOQ/XjReZL3wVOek2/4YxQEnAN8qo/NNc8VU9Y/zaoYNr/Zxdr3poukCbNO6wVyX+6+YpVBYr6ONjdjHDscRdinSwUn4c4Lk/6TL1hdfwlSxTHHeg1rJR3XcSPK0026QZXwtz/D9SqfH5aRzXwuEWCoXnzFk02jhG7d1Z3h+p3fuy5mhRjjplCKPH8oDv0xHUmuzKRgsNHRNfG0ZwKzwFZ4yQ+2Q3QPBVwFNk2CaMAdFLE6tljLj9mZC+GqYfBXFr8kKKUzwU4Kjkp7sOJREq7nrWPPFTQd9Pk/kJrRJn3+1LhXgt0fneXib8v8LvwdG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 05:48:07.7461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0d3387-e0a5-4d80-3982-08df186d1423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

On 9/22/2026 10:56 AM, John Stultz wrote:
> On Mon, Sep 14, 2026 at 9:55 AM Hui Su <sh_def@163.com> wrote:
>>
>> Proxy execution follows blocked_on relationships to find a runnable lock
>> owner. A cycle in that chain can make find_proxy_task() loop indefinitely
>> while holding rq->lock.
>>
>> Use Brent checkpoint state directly in the real owner walk. Cycle detection
>> reuses the owner resolution already performed by that walk and requires no
>> separate preflight traversal. The checkpoint, power, and span state are all
>> invocation-local.
>>
>> Keep the existing owner == p wakeup-race handling ahead of cycle detection.
>> Unlike a sequence-marker approach, this adds no task_struct or runqueue
>> state and requires no activation-time reset.
>>
>> The online walk can temporarily install a blocked_donor cycle before the
>> delayed Brent detection point. In the tested recovery path, the selected
>> task's blocked_donor was cleared before it resumed. A forced-stale control
>> also confirmed that mutex handoff revalidates the donor's blocked_on
>> relationship before consuming a backlink. Validation of this trade-off and
>> comparative measurements against the sequence-marker approach are included
>> in the cover letter.
>>
>> Signed-off-by: Hui Su <sh_def@163.com>
> 
> Hey! Thanks for sending this out and apologies for my slow response to
> your patches.
> 
> This looks interesting, and with Suleiman's futex work, it becomes
> more critical to include.
> 
> I think similar to what Peter already mentioned, having a max depth
> counter is probably still a good idea, but it does seem like this
> would catch smaller cycles earlier without much overhead.
> 
> I've included an simplified version of Zhidao Su's earlier work (using
> a fixed MAX_PROXY_CHAIN_DEPTH) in my tree, but will include this as
> well as an potential optimization.

So if we are eventually planning on returning -EDEADLK to userspace
(context: https://lore.kernel.org/lkml/20260917153649.GK4121339@noisy.programming.kicks-ass.net/)
do we care where the chain starts or can we return -EDEADLK anywhere
in the chain?

I think Brent checkpoint first converges to some point in the chain
and then requires additional traversal to find the beginning of the
chain. Is that fine?

-- 
Thanks and Regards,
Prateek

