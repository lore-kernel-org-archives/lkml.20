Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793244452;
	b=xJkX/WmepmYeU7B5GbHkIeXvvUx/zLcORIVWKOEUzOdifRwyu1MzkUT65U7TY128HzKy
	 TcS3BuwrMG3CURTFFm20nP751M8bj7ODzznnpHq9h1/2lDSEkSV7yQFLAx+lFeUxEOXFC
	 L1PYJoNKMBPKGwK58YxhhmOTob8qXyOW/WeKTm4rchS81KwYrqQd6DG1/3fkWq3nfz9wi
	 7MVA792i8ar5yjEzrWCGHEE4dA3dBsAondHtzQPanwjbDWX2aPh6WoLfnFGmzRJMO1Nl5
	 yMMjY/y6KAC6PUtipIbLS+ZI1ts93oJIROQ1DEA1v76VjqUqRBcYDK5ETawf3go7moA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244452;
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
	bh=ETEEDWZx3OddyJ1BBu2efOopb13ZwQs2xCkkWOEO7Dw=;
	b=oRkP7IA2+EeTRsFqaCGY7uZRjPmjfR6mbyFIewX40/8qQP6W4ppkUTX3w0eqPnkoh4TJ
	 g0SC91Xicoi+H5Gl+Ckjv5UWPpQPo1oYttHkpCL29oKj1+Lj1r//V7N7NqG6Lq2sIt40G
	 Emd/2tbTLPAiCWp4/OxNWeOAYaHFU7z5CrmN/ra4w2upJziQISgbAGqTEuaHVSXUJ+Fec
	 583a1ay85YFsyZAUK3caylrqDJdzdZ8X1eILlpX3/eYH0YPp+YvJluj/H40Tg0+/Lq0qE
	 kIkHFGfKu4b72ImybHMh+FG7bxUfGkel7xq98PvDXrNXAN3vxPJkRBNfw0Raf1UqTSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ENzYqaya;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.41
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFE4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ENzYqaya
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=echp2kk/bvjoUloWT3jnPJKGTixt7FmLQlOTTYJpAItWmfUEKY8rxMwfhoMRh65nwl32v5lvhqVlNyuif0n+Grf1S+3f0Y/uUt9FGgjEn5r6AF+amPDPJ+vjBzRl1rxy5CFifINeeZSI7AHYssfX8WbUQo2E+ldnSBtTIhLePxPJPohx/8Xnko0J2rmoU4zO3CK7E9VvAyctvigF1It4GrdFLu+fz1OIgUmtwd2sxg2fqJu3OQXvrYsQNDR4mGfCWH65QEwJz2kl+I/I0duMEIaYOJNhRrrX+QSMLODtP9WZOZZy3zN0EUrEi/2rEUUsKMvNojo6y9sBXvk0jJqJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETEEDWZx3OddyJ1BBu2efOopb13ZwQs2xCkkWOEO7Dw=;
 b=vLj5b4MJ4mVhDK3Zcq1cadYhK4pyqbtIo1CavbP5QtgSwIXrLgY9CGqIWxgZiiJlEMO07YOz2p8aN73iSSmmO/KddHO4BPoY2WbAHfgcq6iZbzKH/etewB8wglxyGtIY2+2b2ugr04SGr7n6SSgYdNzvdUqaibBMwZiBo4OiO9TsdS6FxTHtyyLdI3F55Rfl/KtNch1Uz+cdb6nDfg3aadLlah/tpqHoasvDbtTj4TVCJl6dw2xIWtUMaGyNsDOaR+tEcl8uHnEgtdN7Ww85Y/Rbv9HG85SmhKwCYv8oWkSY3EuotPn4HO7GhzAzlCvHL1Qq+aaPxkAf9yVB3J8NZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETEEDWZx3OddyJ1BBu2efOopb13ZwQs2xCkkWOEO7Dw=;
 b=ENzYqayau4URco8N/g0KM6NBwrsfEtKa+DYgvpbqxARKyLLVNjmkXWAB4pl6Hpb+w2PJ0VJGBYm8YbC/r+4uz18rCcAWcpBCroUF5CwV4CSjxt0R92AHIw//+b4PbvxvWiqm98Ry0IHhdpFMApGf9GrguDMOkFxTPcO+B+Tupyk=
Received: from BN0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:408:141::33)
 by DSVPR12MB999174.namprd12.prod.outlook.com (2603:10b6:8:389::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 03:27:27 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::c) by BN0PR07CA0024.outlook.office365.com
 (2603:10b6:408:141::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 03:27:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 03:27:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 28 Oct
 2026 22:27:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 28 Oct
 2026 22:27:26 -0500
Received: from [10.136.33.84] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 28 Oct 2026 22:27:17 -0500
Message-ID: <faec8c94-0837-430b-ba60-00fa4a8a5eb4@amd.com>
Date: Thu, 29 Oct 2026 08:57:11 +0530
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
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
To: Juri Lelli <juri.lelli@redhat.com>
CC: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>, "Peter
 Zijlstra" <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>, Connor O'Brien
	<connoro@google.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, "Valentin
 Schneider" <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, "Qais
 Yousef" <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo
 chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com> <atx1U_0FC-fazkV7@gpd4>
 <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
 <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
 <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>
 <auHH9ixQvWQ7RYA3@jlelli-thinkpadt14gen4.remote.csb>
 <1bfd6376-cc69-4c55-ac3b-6ea12b8c6c75@amd.com>
 <auHQJ8vq6VtL2Uf0@jlelli-thinkpadt14gen4.remote.csb>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auHQJ8vq6VtL2Uf0@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|DSVPR12MB999174:EE_
X-MS-Office365-Filtering-Correlation-Id: 36caacde-496d-4be7-85ad-08df356c8e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|261028144727099003|11063799006|5023799004|4143699003|56012099006|10067099003|261009223027099003|261026140227099003|261021121427099003|261022105027099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pFKIrkfsPilQFPSg6O770hzO+a7B9buXY7ucx1oZ6Eu0wYyPq/ppHC22MImZ8stdTxjChpjo/flCZFabcq0K/ynk/cWJfpWAkcnHTzGQDb4lzizNEFpgtud2toPZ0RKe6r1ho0dfGVysekVkuQxe/WiMm0bGR+WOKWftxsFiUCoyzAtRVMKzZxI3+hwAsXWU9Kf5O9Gy8pTsVHAdjgxqakdUey1VTiyK+zIqQyomAIXJtsfPqApDGuQnW4HguLxjN7NFUNeVXrKSViG3HqwE6Tc4doft1w8NDLqsBW7lFDYkcv7+49GBW0oQOlgJZTK9n8Hp+Jd1qHs3jTSPvgUH7Av966v+EnnL52l0I7bA7T9vS5b78EJt7sEXqNMzc62GalwQG43iJnmyH2Rhu1e+EzzX9HxgOH2Fx1kavi4ew4gHOTrUQGcWOtK/yHQ3jl2yhJwWxk0Z8Q6timrSUikVe/rdvQkhfUjft8LCbOOaLmG6c9rncnWyS7h/T5UCqWwXAEbpUwath/X9iWpGmpJVISyJxNtic2jX0/xwCzUUgzVWvAoA2XzbeH0qam6iTRAdpD303c3XbZFcWJWmHBoGL7mOcb6xiJjlHtkEkeIjCQd7A3ybx4n+MykimMdRBZWvASKditsydPw2RogdqyYq+y4kIIt/bhGus6BFgg0BzPsjmkt/pVOUbl+z+Hb3ENnnYmEao4yPWVos9ZIt+PWz8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(261028144727099003)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003)(261009223027099003)(261026140227099003)(261021121427099003)(261022105027099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DzBsXNsIf80a5GWNeVxQxOW6lLjLWX5a4hRUsskRkU59JBHa5mw6Z4q7sR94wsUSMTbtVxI2+5vUNaZqgLttHfaGiXxGF2bc8jZRcgsnQLHQww16JIg5x9zHdGNBYWauqZo4+VIGBVyul3nZlbjWMhETDZKjUbcoTzyP3wf9PQGvX+qqokcu/6A2tba3DFzD3OpJRfyMBTJO6g70DaxylV7V04WURxCLjyGiqjozX6fgiJgrg9V+2F4IteJgiFHiFlBQDh6fedtj2qX2FGs4vUFZSeuiHuniZxswTJqjEufHdPhMakH+qeDgNwyvzHLJiTHYa11r8fq+KMN5dONU0fIaLGBCESmBUjR3C/CrVHRP429CN8oUmXkf4BgHL8us+iWI4cgCAwmU4aWW4cLhB3vSVAp1P7xxUN2R6YFnd4s4M0X/UX+bSAY9j2F7B0Y+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 03:27:26.5320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36caacde-496d-4be7-85ad-08df356c8e0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999174

Hello Juri,

On 10/28/2026 4:06 PM, Juri Lelli wrote:
>> Ack! But this is only needed for wakeup so just:
>>
>> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
>> index c0ebdcde5fe5..20c388b55c50 100644
>> --- a/kernel/sched/deadline.c
>> +++ b/kernel/sched/deadline.c
>> @@ -2657,7 +2657,7 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
>>  	struct rq_flags rf;
>>  	struct rq *rq;
>>  
>> -	if (READ_ONCE(p->__state) != TASK_WAKING)
>> +	if (task_on_rq_migrating(rq))
>>  		return;
>>  
>>  	rq = task_rq(p);
>> ---
>>
>> should be enough then?
> 
> It is enough, but I now fear too 'broad'? :)
> 
> Looks like dl_task_offline_migration() ends up here via set_task_cpu();
> in that case the task was throttled and found the cpu was running on has
> been hotplugged so it needs a new cpu at replenishment. All bandwidth
> accouting is done by dl_task_offline_migration() itself, the task is not
> WAKING so migrate_task_rq_dl() has nothing to do and bails early
> correctly. If we use task_on_rq_migrating() it won't bail early anymore
> and double subtracting? Adding !p->is_blocked seems to cover this case
> as well?

Ack! '!task_on_migrating(p) && p->is_blocked' should cover all cases.

That said, the way dl_task_offline_migration() migrates the throttled
task off an offline rq is interesting :-)

-- 
Thanks and Regards,
Prateek

