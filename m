Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010025.outbound.protection.outlook.com [52.101.193.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41A21CA03
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802727; cv=fail; b=jzsFk2ijvz66wm/ZJ3NWQ1p50bzdqz/tmIxM7WzcSbJq13mkLCUfWtSRfTJc4njDTAZHLUDCNrRQwyD84aOpamXi8TqKIP6mnL8n5nobo+9RNJ7Rjmg0xyAhI37S+52yuLnLBrZ99Eg91UEHujsf7+1+A4fjHkv9pAKcYdzpcfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802727; c=relaxed/simple;
	bh=mbCJpNDxc1qzM5N+4SW+RPvRM5hNs2tx3Gje6nf3b4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l5xj658ra1KxyMpAPplmDoZ/wfqItpAAKidCJN9GiYLfWpd8+lralI8FJHijd0z3FO80kIgnHniLWsPqKSxdMoDlhKErOaBpnjncYD6iyV6q6ginOzvcV2lskGwtxMWGmJdLDdB68bbVfwqRlvzmm3nG6zjEPQzMQ87CVZg5Yjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RxbAyDYk; arc=fail smtp.client-ip=52.101.193.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RxbAyDYk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tao737bWyGQMUcoJ9E9wQZBSZvYYIVWfqRTGNGhXvAhUcHVb17B2f8v0i1D3og6rGrpLh8gQnuRy1M5Bz/zoBpgYp2nQeTXkhCEGRAoR+sMCYF17dS49QvPPWLpMJSLwOxEkmuO1u/d4jUKrXw6Zq00QoJgwfoFz7eL97qmw3WXdVeDJQLf8oeXZtmkqmkaMkCLuwmrgfzfa2pYNK2ZGs7qcUzy4qqyww2tNncQVivb9K0ynASlQjPpbz/zX6WHzRs5gUrg9CLo6xspQzx2MdvYIODiQOgA0mwvUyVkxezigE1HDw10xCGSDCdMKLBu8aU+6O/9QuEhfGmX5VY0P3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/5tBY+FD4N6ayLq+6zOzRwJE8teWUY5+vnYNa39xZs=;
 b=FID1TaNtcXbUC0cEfkP83GvRKzgeU8xkIo30Xg20xGCSHHrBBDs8ywOEJMAxigYlgnpbxjcIpj3ijTDhvycljSqQVIWmwkHZxsJGBPaQmeK+ArAHXfvSBpTWKiy1trJN8jBbQwwMHcuT5+iT5NIg1kXSMS0QdPiVQ0yuNmVYjRbapgpCucUDYkQxNMVcQV7lsGTXv4WM7dvR3PGddqqXRqaL/yjJGUyg48B9bbESHpzZB/5kkMg6zjYkjYGDTKDUQonC6t7cz5it6Vkp0JR/o/N32KCo/ocPZByVRdRCbDQmX8RDVKrdkTdj2XcGJH7xfvRpT3q9JbqKDKi2dnjCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/5tBY+FD4N6ayLq+6zOzRwJE8teWUY5+vnYNa39xZs=;
 b=RxbAyDYkbbw/44cnXagHAlhxzPFrl+Erg2AixnuysmQMU5/mkWCk2S0nkyeyHF12pfhFK6DReivNoE0LFnt5nCSqVf9B/KMmZAw67UyBFASdon6a4qc+h0hLF5ls8fePXb1vTQwRlv4QGyxVxjuSJRr7/R1GmH5qXfAzePFWIi4=
Received: from CH0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:610:b3::17)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 03:52:00 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::3c) by CH0PR03CA0042.outlook.office365.com
 (2603:10b6:610:b3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 03:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 03:51:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 22:51:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 22:51:58 -0500
Received: from [10.136.43.157] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 22:51:54 -0500
Message-ID: <a534560e-3225-4f6f-9376-dfaaedf33d83@amd.com>
Date: Thu, 27 Aug 2026 09:21:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/16] sched/core: Queue blocked donor onto sleeping
 owner for chain-wakeup
To: Andrea Righi <arighi@nvidia.com>
CC: John Stultz <jstultz@google.com>, Suleiman Souhlal <suleiman@google.com>,
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Waiman
 Long" <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-7-kprateek.nayak@amd.com> <ao8SOkBYH1uLh6Sa@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <ao8SOkBYH1uLh6Sa@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 033bcf42-b258-47ac-fff2-08df03ee8bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	InnzMGSq4IhEta3n3Ctl08ROuJWlGyTmGZeng8dVFgIbY4aD2uz78sngfo1/vBjsXnsIu+OG2F64bBATUk8hPEUix1z6dGqPeGr51XxGJ2Ivm1Y0kq8RsjkDMMDPnxfKNgD6XCs8wWqBlWq6Lq4keo7bQxC2l91mvUkO1uVM4IwurKdbXN2L9qXO0q0usvVGmmYt3ezkqZ2UQd+QV2ZMEA7kbSpj3VSupTQUKFkKMsfcnNyESFuwAiaqGfo2y4IRG5ztzgqNQqorEcBu1s19b21zZNDgKoc52mFUR6GQV4VVbBPaaYwcE7x+rT8FFtNSSg4xSQm2AcyzyTVCwVzOXKcfKso/enDwwNvXdijZe3lMRQql/UHvFwLgIykQnwLPWiDvkqySTwUCPr73vwqePnlVFfj7woGYiAl902ecIHa88Tpv8eYThhTh4lwyfe7QJfZk2qzF5SJSymKW/MJiFj4NiAN1Xmyik4j0tkLIDAml+E6SgYsbUff+2k0cZ++I8o6Em+TwYWpuhu3ftgtVugt7mS7EhPcxhoxLcezmqjLs2ExPK+BIRIN1ymzEZ7aDROfmYr9cBEPN173+EpilHXqcCXXxD0LfdEz86vOGYFryLCzj5R0pTWpJ+AXoGwvWGynmh1bHznlP3yvEECuWdyheVfBL3erCharCyxzyBFL46k+4QiVt0hXMN+t4sWglSwGHs8uwDVwiq1hOwWHaoA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cNG4LlBkJqVmrSHkpBWxfmZgjPDI4UIJ/DBzrX53OlLrs1B7jk3hKnqR6ax8rFx7lhvRKPq+YZimkscZCTSzkmLCV0OmL7zGxHf9tRfkHxcoNIWwdkxCi3bB2FLy56I0NKYs8sUzqtmFPNO9VJTK3rDQ1gkdMRRACPPThaD8peM204fCUvWTkzu/85Wj9NmesAlzgp+W00eKS0IIfx7DbKmcJ1rlOlRDXB0MBOUSV4bZa9zWBkZnc4sQIelaMVF587sFUKLj7yw+Qt8lL+FV1oIs3w9gTvDAGpl1TX4AMRyJvv42123v9Ejqh29No+U7JyASHxegL8H5/pJfxxhjSE3/raHQzMMdud9gQ2MGeC3ftVQOnSo8DUqx87OKS/xo42J8n3o91jq/qkwLFgSiqiDrc+EnUUQeBbECSWllClejzWHZEmQb4yFzlgGva8EX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 03:51:59.3425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 033bcf42-b258-47ac-fff2-08df03ee8bef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039

Hello Andrea,

On 8/26/2026 9:50 PM, Andrea Righi wrote:
>> +static void proxy_enqueue_on_owner(struct rq *rq, struct task_struct *owner,
>> +				   struct task_struct *p)
>> +{
>> +	lockdep_assert_rq_held(rq);
>> +	lockdep_assert_held(&owner->blocked_lock);
>> +
>> +	WARN_ON(!p->on_rq);
>> +	WARN_ON(p->sleeping_owner);
>> +
>> +	WRITE_ONCE(p->sleeping_owner, owner);
>> +	list_add(&p->blocked_node, &owner->blocked_head);
>> +	proxy_resched_idle(rq);
>> +
>> +	/*
>> +	 * Order against __activate_blocked_task_slowpath() checking
>> +	 * owner->blocked_list after setting owner->on_rq.
> 
> This should be owner->blocked_head not owner->blocked_list, right?

Correct! My bad. Also the slow-path is proxy_activate_blocked_task()
that gets introduced in Patch 14. I missed renaming it here.

And ack on other comments too above.

> 
>> +	 */
>> +	smp_mb();
>> +
>> +	if (READ_ONCE(owner->on_rq)) {
>> +		/*
>> +		 * owner has woken up and may miss activating us.
>> +		 * Remove ourself from "owner->blocked_head" and try
>> +		 * find_proxy_task() again considering the owner's
>> +		 * new state.
>> +		 */
>> +		__proxy_dequeue_from_owner(p);
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * Owner is fully blocked. __activate_blocked_task_slowpath()
>> +	 * will see us on the list during wakeup and DTRT.
>> +	 */
>> +	block_task(rq, p, READ_ONCE(p->__state));
>> +}

-- 
Thanks and Regards,
Prateek

