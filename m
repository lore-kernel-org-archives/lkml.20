Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793245163;
	b=ajBf8l7tsHa19HcBIgBZ3/LeqLSj/o77jH+dotrXbinimsITuEHj29tFoxjJlGLMC2eB
	 TXKNYXxBcbCjduvLFErW7TPr4r90YvqG+CqOnZ/JV90jOiIznP0mGeavGi56wQXFToLvV
	 emzkLoCZj6trd7RH+BFqh46reTWQ0OK+EQNKevWyJ/s0wqhrtOSgSSwMkRmamCq+cpKSO
	 Wb4yASL3ry/pg4UGzP5i27RreYW1jmGY/H22xncS0HQPvrQAL/qoMwydW6X56HQCMU/iX
	 F7dHmQUBH1Ximgr/uEg6dhkXS/g5Wv9Y3kVfRt3efU1nfT7hdDXz+erv6BF7DWmGz0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245163;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=ZsFe6Dn8IXXy1VV2jDk/FbpE0tWWd33hTksaxGIAWr8=;
	b=IiPNVNz5uySImXIJ1I6XerCb/HS6EK4i2ZNQe1d8OIDGPla7NAaGZkXtpi3IILjaSFMp
	 Bh1RqOXS6gT3J+oaVoQj5mVHA/3RiwcL+auyd8qRdlyXqseMYE/h+K5yRcmfw8Fw7yJo2
	 UvQ2ti5F0YqcXaj21vRUUCU5vybzDnQfKKNlNgMFLwRV8ylaBu2x9zoAQ17IVKI6gVhLY
	 Bbiq7kgnYzkn4o0LQyl3JsYV9sUV4iy5L6ZLx6hX2uontuf8+kKH7qqSbMOaVVOS21zlV
	 JnfPN7WT39nxynesaH/8qOu81SNNI2UH1V153BWCK5PaNyCwhMyx9I6TN0t2KvJWolA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bhfQAdUs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.68
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EDC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bhfQAdUs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdZkH/0Lf7n6xglE6mV0NPgtAkOWp4hNWDJgVYLPJNbDyzKPeVjZIf9bJ07zNUqoyhFl9Pe66gOXNzmb7hX8cXIDiLdNE/nb1cdTgv85FTiH5pz9vOgGIv7g6Y1aI6+inqp/5dmrdlwfmIvyrfPNuravDosbN5TAgGSJoAnrs+aV1g8njj26jrZbIxE3Zwr8R8KpUG9pQgS8Mby0cPimSN/g8bhHBybvZ8tdTSnZRRGB15pTgmtomS5jcFqq30gUtNZCcaTU7pu1eC22kFg1Xwzas0zEwucViObFzsHVX3U2SLK62i3n32vf/+DwEL3h9Mszn2HZwml9vN/2I5XR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsFe6Dn8IXXy1VV2jDk/FbpE0tWWd33hTksaxGIAWr8=;
 b=fUPy7gDTCc029DkSJlOoIUH0EhuDjjVlFDda+C83UOf3kNvTUeqYyJeYB5C1x5N+qozMzV8VcZaBbtWj+97tS0yjvZRb6db9BpAuLp/O48RaX5HiFzKxYt5OkCLPAivNfSGvJBJkFGc+iwoFQZYj93c2gIqCzzUN6+8NXLeH4pGTznf4hz8dr67QPclsDorxZeWGPv8o5kySweKirUuxmshpUmvNv9H51eAOE6GSR9T8C8E0D7i2RPVVGcJ5htQQSHMwDXx7iEFYcAwfLb5cunDlnF3inK4ZGRlH5wcrQHlDGqFD92e5qp6phgjDmcIZUWwtl+FhSBcVO6XrERPDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsFe6Dn8IXXy1VV2jDk/FbpE0tWWd33hTksaxGIAWr8=;
 b=bhfQAdUsS+rqD6j/LJR2CSkMgjvdsZ/o2crcOZs1MKzBsCmrBEJOoKcAWtgmivxwA9ErT704ug+cC/Xw8ullBHUuh7+iXUeGKg7Fga9hR/f7FtpSfRevh9jwJVpljV/9lGlXRyhVwIPYqsEQAcs+sWFFyMeHkhaCv546Fwy4gaQ=
Received: from CH0P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::11)
 by LV0PR12MB691222.namprd12.prod.outlook.com (2603:10b6:408:608::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 03:39:20 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:116::4) by CH0P223CA0029.outlook.office365.com
 (2603:10b6:610:116::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 03:39:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 03:39:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 28 Oct
 2026 22:39:19 -0500
Received: from [10.136.33.84] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 28 Oct 2026 22:39:15 -0500
Message-ID: <725e7cc3-711c-4afd-8fb0-78f79d45de7d@amd.com>
Date: Thu, 29 Oct 2026 09:09:09 +0530
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
Subject: Re: [PATCH] sched/fair: Clear throttle state when leaving the fair
 class
To: Benjamin Segall <bsegall@google.com>, Daehyeon Ko <4ncienth@gmail.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, Aaron Lu <ziqianlu@bytedance.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20261022235234.150957-1-4ncienth@gmail.com>
 <xm26ecd9ihv8.fsf@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <xm26ecd9ihv8.fsf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|LV0PR12MB691222:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ced0a5-1cb1-4687-1adf-08df356e373f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|261028144727099003|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kaqvthpVKVzFAYnLqsIxFmirP1dgImuQGeKLGiE18njdD2u3MPqgik0DYJn47p4LJKs6SWc0tDQgXyDOrimNYEsV4KlwC3XSH4tRaBY4cuo5u1hsEq6aYSi+nn3oUJblBtseHwbEqT8cWzC9J97/yKzyE6kH3S5HfPkdk/GSNYtMjTN4NP56b5Lu0eis4LmiW6WGu7VwBOdeant9OLUNjsRHCuYOkl8ULBX3++uL11drLYFOuygfdoNmDsbBJrl0CJmLS1VnqDonpL7XRYA1vqW40jcyzZTl++TI/YODUYRHBKEJwx9RimBf2vVD5LFu6KAhDcsvwQ0EstGJ35FMQkqvGs4QJul5BuT6akXldJqFwvf1Akq9Ccu7ZO9lqSrsEuIUQ2RkhJnnJN5lQJbXsV5VJh1O/hBJr1p/sj5e1ZnY1qkNPM8beTOj5d2dJ/UNzPGk7Gos4z5uOY4/efyOWtVl5daqhed2tw2j+9+gJgHasbLeQK18zPMNg+7/fRk+koIQ0ZLHUgNJU+AcE8X4280SP5uWYd/lhqJ+GfSK6E119ZLNHITs6zAWxzrGMNf2n5BqfPvRTFi1XdGLmal80D6uRntafuhCfsJaQrQTXrsG+c/hrn1ZfVIIgnaeWv1JOxc5Yx9Dsc7gC5rUP0vWdC4KKSglzH8Y9Yij1D9AP5FKgCglAGlC1aAAVLBz8LjJkrI+V0T9wPCnC7kuJp6Jrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(261028144727099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qPU/AuJeKJtPR1LJZwK2+SZtBCAryNIex/u5mf8KPzCaDYo34TJIG1Qx8l0f+OtsjbApfZhipiK1z9x+w+TzbafIv3o+W7Za0FC1ajzq3XPlG7gECZWbsTtxmDQocTIXk2m8FmwCTLgwiZ3rozSNDU1zILDgIxJY7yYAE/4eeUOcFg9V3oJuz1+ue3FdQta7XJiBdwKZPoQAOdzQU/O2aNaNf/VwNpfzQUByxIKaKpgd80g3PENr45TzRm4g3OMdSE/ku3L0M0Z/csum9aR6ZcvXkNsX9ylibz6jkEX39hzEol3vPYH57zOKA6wQOUgUeazhKSlw9yvGMVa8bPNg92EmQFuGnKEcKUmAmEXX9GWDNP69ZDyrgh8aU8DgnY596FVRaSxAoLtb8fO9IjLDUW+u8tg71M60cAjMY1d4apGK+Ogi/Q9oyLOlZ0L8ZpDG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 03:39:19.8900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ced0a5-1cb1-4687-1adf-08df356e373f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB691222

Hello Ben,

On 10/29/2026 3:54 AM, Benjamin Segall wrote:
> Yep, sched_class switch lets you smuggle ->throttled into
> !cfs_bandwidth_used(), and then that check on enqueue_throttled lets you
> smuggle it onto actually being enqueued, which leads to corruption.
> That's fun.
> 
> I think we need to use switched_from_fair though - if we are currently
> TASK_ON_RQ_MIGRATING, sched_class changes will skip going into
> dequeue_task_fair at all, so we will not see the DEQUEUE_CLASS.
> Triggering a migration on a throttled task can still happen I'm fairly
> sure.

We cannot grab the task_rq_lock() when the task is ON_RQ_MIGRATING and
guard(sched_change) should never see TASK_ON_RQ_MIGRATING - the task is
either fully blocked (!p->on_rq) or is queued (p->on_rq = 1) on a CPU
when we are doing a class change.

-- 
Thanks and Regards,
Prateek

