Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793269340;
	b=PuqashECvVvsrxUTyQkUEcWaDNYzZsE2X6gXAIwJhIOeOM/JK+PWuwe9cjuO1pah/yG9
	 AOj/pOsBennw5R7FqpF9UdZ4vYdKD/vOq5x11xeUD89FGwYMiAEIat9bgwN+dQrP7IfC+
	 pwsxa5A03G/lwqRdFb2/EBrWo2jY47NfzsgnOCEJMzX4VqaRjEBN0a3CM8IWDWOvi0tNs
	 npdyIXdtDwPxye7a6fC8BwXw9YBso+c8UjCsp9jWTorQ74cCxbQt3z5UZDcBytwslsNt4
	 DlfiTy5x4Ce8kZrfkXvr/Un71Qs1uYznktzHdn69IFm2cBDtb7JF/9aV/KiJUswKYFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269340;
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
	bh=mERhVTreeJWEyZF0OIJz4cYMozJmUKHAF/0M25LMpCQ=;
	b=q4j5phtgXXzuMRei1RG3MWzN5Gb5GWASLnSKyLLSS8uxmBIpZyoyPLPe9Ek6fxX8GVf5
	 t3zT5HVy3e8vAOjKaNPgQJPj6E+hxOXwoYYjUW9Vmo2bJTBD+IfMkDBi+RogyMBMaklcH
	 a6aNwjfb5qOnaFN63jg6SoQxuQp6isLapzY84lhCcGlrp0wdFlQlCPAZxvxbx8y4OdXsS
	 dkPwN+cEUBnrLws6xmXsh1zIWPAkSQQJGMlyNT2yJ5+yYZ59RMjqAuuzu0S8ctmR+lvf7
	 YyxSJWCTe5k5WSdCpXpCcQKVEJxt1XYYrTU8jQ2rzat7gEb25ox3NbnSbFlFC+ZMIug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=S0tNOpXe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.2
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE11606A31A;
	Thu, 29 Oct 2026 10:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE11606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=S0tNOpXe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuPUsbTPTydERPec3XfYg4MfGqxZzjig+cK+NP8AONyboIAPerj5HxTugTmXcGxyP90b5/wpjaQ1cjuinQ5ZAvG9wGjbu48B+SKDyY8FEG2Djybu6xOqjb+cxNm8yZgMB5BNN9CH7SqvP+b80cZPqAe0Ltto/m7IfTcxTbeg64ZT0tpPN3TG+DOlhGw2b6YceuoO0pXEz7xckqrs/U+3tjaAxZymTqV11ktRAZMO8iVhXAQ9Y6+6MyOFAtCgaD+CLzULoPHtYYj9iSekxW6/XcdlCrWYs4RLI59+oLtzKcFNT26r2jd9IRRjS2/Pfr8YTpfcdvWIZH5przZ6iTVpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mERhVTreeJWEyZF0OIJz4cYMozJmUKHAF/0M25LMpCQ=;
 b=fKqg/aKhe6o9XXuWUUSBUzdorye+QjFBEec/uWV2uxZBN1JsTCeromf9595DByGAjnEzqAiuM5dpoLqahX+zkUHVoIyzmUjxDK7AO3JJmV+8E6j8xtGMfoG1RoH8UWWcE2gjXbvGvj1FyjnTfHz9QlM0qKdr/8QCga9oC2t1LsiLfxbWrX/CVgsEwxLolVdCROi+U1We9HbBwsmBQQ1T/mDnZH5JNpkQ6KxKW1O1xXGXPh3/zFhpV+zv2VWAg6kNN5TCgA9SR82ENKJvBMDfQr6PGyZ3+z3EMf3TUiKz/MFjjL29yOJdOTMCoCRjQ7d15PSAAlD5C/ySc0eBDwyVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mERhVTreeJWEyZF0OIJz4cYMozJmUKHAF/0M25LMpCQ=;
 b=S0tNOpXelHRM9wl5r5rXuYSlBH3pTFVMPUiz4IEX9kNiAtZckyg1TekHPUOn8qZWwkSL3ruo1VwyLfT0Lec4aZI0g+++jImzvvrDRIdgjOAEhSQJ4JoFdZQKMbYwf20P4gvnkq1wpMLmJKDY9eolLrOrMYNpjVNqMk+f1kLq37w=
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 10:22:17 +0000
Received: from PH5PEPF0000002A.namprd04.prod.outlook.com
 (2603:10b6:510:34a:cafe::61) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 10:22:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH5PEPF0000002A.mail.protection.outlook.com (10.167.243.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 10:22:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 05:22:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 05:22:15 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 05:22:09 -0500
Message-ID: <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com>
Date: Thu, 29 Oct 2026 15:52:08 +0530
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
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion
 bypass configurable
To: Li Zhe <lizhe.67@bytedance.com>, <akpm@linux-foundation.org>,
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>,
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>,
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>,
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>,
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
 <20261028041253.74839-2-lizhe.67@bytedance.com>
 <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com>
 <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PEPF0000002A:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: cf079dea-56ec-462e-dc0f-08df35a68156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|6133799003|3023799007|18002099003|22082099003|13003099007|921020|56012099006|11063799006|4143699003|10067099003|261028144727099003|261026121527099003|261022075727099003|261021123027099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info:
	GFYm5AKy/3qAYubLx27G8RhcyvQv7ANhQ5GTMmwgJvrjSGBVtUCvpi3Z/JQFoxR9kY292aYrGHQS95Kseqybsxtl06z12UhBagE9iujkj6PskaQ5kZ82rkj9C8xYxEg6h4lH47Ivy1E29KTMYz09YS3bWOOBnYTVA3Hmj7hnsHflO+IuVfIjdTts7sihrLc8iLaIal1M8QZTzTwJ3ON9CZnlnS76Qn4EqM4ZMhu2lEeQ4bAt/q2V1Hz2ci5Fe8YditXXgMa6+eK3uCIah+2WHyyo/dC3K+bc7T9gmHrY9y0PEmtgcBTniwvU/jhoNh7D0pl7XoWaEQgRjqNxLhdNirq6HTF07On/CmbK0RQxT6bQLOAXdg/tVYi34Cj+xG4NExGyXqyNcXOy1Xq/BG0QSV4LceWS3LEkag8dTTfuD74QQi2BLH0OHCTmasC7cjXyizFSdwUzHE82ICuaH8LyWSg3NbN1fKUM46oP2J/dhmb4XHuqc30OzW2TWLBn8A38bL770sYW8UkF61+DqrvMUrAQwDpElZLQFIslpjxlN9zuehXqcQREmFfL6K6j0J4VXUQNgNNs8C/rMW6Fs3qoYop11s9hId8YG/0QhFE+CoPLlgR/cT/FLRjVdHh5xBjnROIG3eS3eSCydZTKJJC1UueJ6dvDP0Q//Qcr8kMGf2PsEZ5MTOhRf6HuAfhcEkKLOiGDzCtwuxuNlg18GcmaFyRGq4BRBUKvY2MQj9j5333IiOb2FmAGKS9xUC5VOScs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(3023799007)(18002099003)(22082099003)(13003099007)(921020)(56012099006)(11063799006)(4143699003)(10067099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021123027099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QyR+69TJ77J0idCatCphagCQc44W4LEGUD843RbjGVxN8nV9JjBxl16uTExFAfBL8I0rwQHxjxbgyIiZsyfPZ3/Kgi3hoTUQmfKr2iaiyYBPpWv5jdyFDdmvhB1v+/vodswYLFMYCUu/FS0GzaUg45zskbiGeysIwdqs/4ngtGko7UNoWQM/IlUh67mKSqDWwNNqkKrXXsAs84KY1DZvBcDVHO5kk2xJNk9z461JKiSj2EdNAh4lah16/6ImLYbNY5tRkn+T2HzNLcnisIiUvzHvz2t6kiTclCa/YOHrDtVOnzUge6Tqq8XztygNH32Jxt2NVyx1xbvil1nL9eJR/qfGM3/GB3IYq5syfQN9TXUXWvs/+FJay6YzZlyyIp4J3aIzjhaFIb3FB+v1WnMPF11Y7SrNDoY5h1Ev49sEmKYhEfNFisP0DGchsCmlltdu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:22:15.9976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf079dea-56ec-462e-dc0f-08df35a68156
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH5PEPF0000002A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

On 29-Oct-26 3:16 PM, Li Zhe wrote:
> [You don't often get email from lizhe.67@bytedance.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/29/26 5:34 PM, Bharata B Rao wrote:
>> On 28-Oct-26 9:42 AM, Li Zhe wrote:
>>> Memory tiering normally promotes any recently accessed slow-tier page if
>>> the target fast-tier node has enough free space. This preserves the
>>> existing policy of filling available fast memory before relying on
>>> hotness and rate-limit control.
>>>
>>> That is not always the desired policy. Some deployments may intentionally
>>> keep part of a workload's memory on CXL-attached memory, for example to
>>> preserve a desired DRAM/CXL capacity split or bandwidth distribution. With
>>> the free-space bypass, short cold accesses and bursts of hot accesses can
>>> refill the fast tier and pull the workload away from that distribution
>>> whenever DRAM has free space.
>>>
>>> Redis testing exercises this policy issue. On a CXL system with node0 as
>>> DRAM and node3 as slow-tier memory, a Redis test was run with
>>> memory-tiering-only mode enabled. The test used a Redis dataset with 12
>>> million 4KB values. It reclaimed memory until about 85% of Redis
>>> anonymous memory was on node3, used a Redis benchmark configuration with
>>> a 10% hot-key working set, and then issued a short 256MB access burst to
>>> cold keys outside that working set. The cold-key burst mainly touches
>>> memory outside the hot working set, which is expected to remain mostly on
>>> the slow tier.
>> Can you please clarify if 85% of redis memory ended up on lower tier naturally
>> due to overflow from toptier? I ask this question because, if it is a natural
>> overflow/demotion, then it will be hard to find head room in the toptier to
>> allow promotions that bypass hotness or rate limit checks."
> 
> 
> It was not a natural overflow from a full top tier.

Thanks for confirming this.

> 
> The test intentionally reclaimed/demoted Redis memory to the lower tier
> to model a deployment that keeps only a limited fraction of the workload
> in DRAM and leaves the rest on CXL memory.  In that setup the top tier can
> still have enough free space, so the current free-space bypass can promote
> short cold accesses back to DRAM.
With pghot, I have been providing benchmark numbers from two scenarios:

1. Non-overcommitted case: The workload memory is pushed to lower tier before
the measurement phase begins, the toptier has enough memory to accept the
the incoming promotions.

2. Overcommitted case: The workload memory naturally overflows/demotes into
the lower tier and every promotion undergoes the hotness + ratelimiting check.

I gather that your measurement technique is similar to case 1 above.

The feedback I have received for pghot is this: Non-overcommitted case is not
the right methodology to use but the natural spillover is. Hence I am not sure
if optimizing the free-space bypass case would benefit any naturally run
cases.

Regards,
Bharata.
