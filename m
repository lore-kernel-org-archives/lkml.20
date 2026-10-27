Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793094349;
	b=CcWMYPN70cG345gY5OIBJHFxuXTpLzuaEYdipilQhj8D5BOk55y5tmoAYCdY24r5LEIN
	 cbQjmS6U+1J5lu1H5+nwF2zheSpI74zyL7OLHlvrJmQYy7fx7IoXULXaLPeRHgcCdRsT9
	 fqLTMHnj9CYQ9a0VQnQnAXQGA7Rm29jp1ve2XJTTWdXpG8z3KM+KslGKKbTzFvh1TrgBe
	 TXIV0/VciYmlAOT5bmMpbENYSLaiT1S7h5BUNQM4DMfoRSGAtH3MgMbn3L2yRppE+ndnN
	 lNqn+8qMxOVvvpv8ow2AS4H3WlrCgw2DeZB7oeC3iNTbsVFEc9pqIU+jioUHl4pltiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094349;
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
	bh=2I7+onKjryZuwnpiXmgF++Kh56gIROoyhnnfR+VX88E=;
	b=v1Q/v74Mk9u4O7FSWdgp2LSNVqas85XXN47g0SBTwamPk+f0kqZAFLQI66qabX/cSbC3
	 q3krLmiy2xbrxir0O6Py2sJooY0oYUOwjNv/Lexq66WINvbk2mxdLSm0gF2qsLeAN9bEA
	 0V5yn0U3WLVoSpu/C0uFkQcFL+7TwLqUitMjUFOegkYnAYWgip0oM/AyWvhZrEb/p+55A
	 SsemlgF6Dc5/aV3qLwKzduJDomxEouMXbe9O/ZdM/OjJ3pQr8pOrGP2y3OINPt8g/W+Xs
	 EfNJxJjtRtq0hsy3S76HBrs/DNbv/OcVBX6pBeaGSLDYlEbD+z8Q6YkgA1chuRhOhWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=evc26+4r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.49
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9025A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=evc26+4r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haI3SekmhU8SWjiDQHgPPEM0QbvF8teGr89OWtvXs3CxhsDjJmy6G5XYEygDqcqiLJ65JqCmuARJyoAITX1R/LzfgAls/d6HO0oqa7/WDIZvMIcXhWCKeCinvm3vp+gmSxWo76QM6kOaD2mYocOyK1U2n9Vp83xm5T3mpBK9HHi9e8R1dHw1nFvRJVwlc9GNtprWz+71kQ5trSbvxLcMyRpfms4u9nocRq407XbHxwPx4kjtFp4nkaR1UlZ3Kri52rsdHDWJ+NWmVh176vEuwJe6BYnFYB/rEY/SkIo2Rne8j0v8oDZfuLLzkTqcFJpdZ8e7Q2p4Mp87hTPAxftBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2I7+onKjryZuwnpiXmgF++Kh56gIROoyhnnfR+VX88E=;
 b=x5aeYsQuOBwgoccmGfX+wBn7uueHGyzm4KWc5FQORQXgzV/RgBM9ebLysQ7rFN8KVaP1AoScVHoQ0zDgl4n1Pz4RO1kpPow/NTd+JpJLLXklPWhAebdAFBW2kIWbYWQOl7YWR+wuJx7y5olqShcJtSEw4ysP/HQFIapZtBFUWugyW4JpMZmk5Qcckx+EKVe35XGRYQaOlUsQm2yPuylG0rSiOHdaZgmcXtasZZ123cw3EFVYJPLlK03UYALqaVfgVGX4PuSIwIFJCffpWEiXKEPpj5hV3zy1Qc1q/uLE/BrMWcXgly5/KJL4kfAiHFEI+P236qR3su7dqagtGHmAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2I7+onKjryZuwnpiXmgF++Kh56gIROoyhnnfR+VX88E=;
 b=evc26+4rZAGuWpdH99ADDrgvG2SfZBZLF5YNsWtXPvgzUxvcZhT0J9YoPNaRVquAmBCcD2w7VjPslEnfUMY2rejTJr3pNyvelIGrXR0gtZ9TugDHspAdt8jOx3mBf7vrW6V36vsuP1BsLrBeHM7RTM2L0bSXBnbbJ2DtGXFP7jQ=
Received: from CH3P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::21)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:45:45 +0000
Received: from BL6PEPF0006C3DC.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::84) by CH3P221CA0013.outlook.office365.com
 (2603:10b6:610:1e7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 27 Oct 2026 09:45:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0006C3DC.mail.protection.outlook.com (10.167.249.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 09:45:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 04:45:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 04:45:44 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 04:45:41 -0500
Message-ID: <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
Date: Tue, 27 Oct 2026 15:15:40 +0530
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
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
To: Kayra Cizmeci <kayracizmeci@gmail.com>
CC: <albin_yang@163.com>, <albinwyang@tencent.com>, <bsegall@google.com>,
	<chen.yu@linux.dev>, <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>,
	<linux-kernel@vger.kernel.org>, <mgorman@suse.de>, <mingo@redhat.com>,
	<peterz@infradead.org>, <rostedt@goodmis.org>, <vincent.guittot@linaro.org>,
	<vschneid@redhat.com>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auBEeDRRFKZOGlZA@scheduler.schedules>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DC:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1480f9-b33f-443a-0b10-08df340f12ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|261026121527099003|11063799006|4143699003|56012099006|261022075727099003|261022105027099003|10067099003|18002099003|22082099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	rL/eS16kCb7xN4zhRhBKNw1EOBwpMHVZYC7S1oDnsqbn+CEHQX4Fzl9fnPvKtkJP43m8PNIW8s8bZQqpN6h53+6oHrmCEKx0dvch4wGhjF9w19T+V/W5Oa0KGC+1VTWZut6epJEn31SN7eAJs0KuR5giLNtvEoEfiwrisxe7ePgNFbFBnaMPUy+MTH5pL3R9GwV47kBbbcte9s1fYeu4pkJOJJbNMxJ3hMMKoocp9Sf/3ww/0M7TDr11m7pu3dxbjP4zPdCEO3o6JmN6tAMfCkRU9EOjD/uXMGH0QrWMW7IwxdmoG1lPAqJumxNO3KeMU2txVO34LE7JWwSGOpv7MNjiIO8tgkvVwfd3B0xKsitPtNHfv71Okj06Q/hLeuNtglqF4QWiLlhqpaNg2oXuV78EUM4V9ujnvZqRI/ZUkpTDx5mR9m6W3lB5G7DgErQ8MxlF3n9h65q0aGOJtviC4Qzt5eDxOUweIcRkiSzuVSXDympdSYwp39j97O4o8MaiffgWTVk5m0/rrWIJkqkShq5ZtK0HAcuPYOTrOP3rVyeZ4l2e8TJjR+aaedZkOsNd3VenTVbEqy+1IKenM2gxKjRAXusclLSR321Ge/TnQmGb6NkIguNk+wxEgLCsaB86CkjVk3D3Ow9a6XrV2Z8goDm7zOkGHMHBy1H/QasajW7Y/qT+sceqUgLBV1CmUSM3YawqEdFWaE00uWu2foEXdg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(261026121527099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZibYP38RFu7ntXcIElAu+G5oYuwYoj5iUvfWOFbh/NKMaB1b1fWyMvC4Kl4/wXZKCpMs1dQKO5tKveuXQMakEqtiuB3Lj0Uk6K+ftKQfyxPK9vG8J+oyYQtg9HAodSFLwa4lhKyk5FQCjC2oh1I7bk7jfPiCXMj/Ec8yaiFJms2MC6WK0m7lDlw1nQ0QOUvkkOsP6GFuwf36oFYlK82wVnfVYsEQsevJYT7qKnuo+pti58+Nlj2EuaDtGj//oqWHWna8/woMweqZDSV1NKqfKfEMSWvEZNOrxK4Rj+r8+X49Y+kX/+pec+gdAsdA3bYDAAkVxAWDaN93ZEUq+WoHeR0u/+q4rB8C8HxygMOtLcJaXZ4d1UxewpU+qW0rwwUvQZsT4d8CFePcC+UJ2Ti+SXFeQStRdHaRU067GGqFcIwW1GNi5u6KlOjdxTALYteX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:45:45.3844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1480f9-b33f-443a-0b10-08df340f12ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264

On 10/27/2026 12:22 PM, Kayra Cizmeci wrote:
> I think this fixes the issue. BTW I think this should skip curr, no?
> On a case like this:
> 
> C holds M1 in CPU0, D waits that mutex in CPU1. A holds mutex M2 in
> CPU2. B is the working task on CPU1 but it wants mutex M2 and we enter
> __schedule(). B gets is_blocked. D gets chosen. We open the rq lock to
> get D to CPU0. While this happens A drops the mutex and wakes up B.
> we enter ttwu_runnable() and B is still curr. And we start the timer.

Good catch that!

> Or am I MISSSING something?

I can't believe something like wait time accounting can get this
complicated! Anyhow, We can perhaps call sched_info_enqueue() in
ttwu_runnable() instead of proxy_needs_return() like:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..d5758b78b741 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 		 * it should preempt the task that is current now.
 		 */
 		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
+		/* Start accounting wait time. */
+		sched_info_enqueue(rq, p);
 	}
 	ttwu_do_wakeup(p);
 	return 1;
---

-- 
Thanks and Regards,
Prateek

