Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793335286;
	b=pEhVpovEk9XiZgxWMgq4yLNVdqY8jDSrxJUXMpxf0wgsPnrHKphsMkuFVgupgJvIip2H
	 bImOzmEWij3dxaywA52LuV8JbetTCmYGWVZjr5xXcowcyzoFu/n+DcnOlY+AxdK7WCjtC
	 iokuP+hJlhfrdHm7yzWp8GTV5U4oxLoBHC8/FfNUL678XE3CALldGGAGlf7NGz8+FSUMF
	 /XbPuMRuF5V2V2+h5SKOxAPB/U7c4Y9j8ZIcQoYKxm10arn9VxpBkCXL0Fns+pZD4SSng
	 0jP2LqbbfwzKVDmSEelQEeR3wHF0HFQcFKJC3bLzbECSPPbLcSCWnop9Bff4ftyA9Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793335286;
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
	bh=mCiTdXkGqHoV2ykTWUh5y1vKxiJGGgeuLWhZtFIeUuw=;
	b=qIp2Ejm4tGIWYDPwonEg5ruybNK06ZcFHuUVuZWShS87vOz2tmSRj+AojQk8rjsiKlwO
	 T3a9uNwueSYTmi1/8eVp+Lisn34ncaAGo5mbvM5kUUShLYE38GZGy8d78ZoCcatLv6nDq
	 XExxmjI9lVo0ju4RVpj2nBWyBbjotypdfsa7B2trhuTm6efHcF7yu6hOOdAR0oBtdEW3M
	 emic/Gy6HABL3z19gf/SUXm26EL99nXP+c+MCFvVMwUWwwxVIm+I3yPrGCjxzOH2lZgOK
	 1QTw7CdLdyJ89HkAdIeOxcZDa3FMZhz8XTUbDBDANhcDgtixPxEoZ3alPfN+GQirvzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MWLRl0tn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.61
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MWLRl0tn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hByo3/7m4OaAKkuMBAoAqufp0VqgMnW4g2LaNq5tpaqTFUxG0BJE3gZe0uOoBGhD9HymSTtvkfq+iW3fRKKKkfwTRubNUmks7KPf4Hii4IM3TOkHx4+1kEus26bbJvhDNbYZZLblhYYYteMHDrcQKXm+o52dLWMQR3OC0pWqkq3R6gNBEx25nw4dF3rfpCXFwUng4g1QbxhbiYxn3wCLGE7ZZshPb7ynykIsmqiE2e/tXsl1azBHBH8ZxEzKJkZEEgusNm0YDBb61cOg8Xy4sBmxgCQ8wtSsWKO8ur/a62UECSzc+AbaTVYizks0cDODn7XXMBj1z9hKYKIeOMh5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCiTdXkGqHoV2ykTWUh5y1vKxiJGGgeuLWhZtFIeUuw=;
 b=xhrRq08ucaPF36c5coiSuH26n/FA8YxBkUMO4L0Jq/k/RVYmwsw3aAhu2YzktX2L+T0EWWjEsHvlLumLm/ybtWpzoKvd+wJDqY/0mrIJLr1EX7Lw6kwtiNfqiByaTV+NcyqfzNlCH3vPEApcW84Z9rDBzqHDsQmAvmzrgDG8+4ePY4Ji9UsfnBkSExHKyHbadFqCp2Xjps+Ft3KfRorvx7vzzGk5QAqnoOw0f2yes6MMDalsGmyk46KRviCSNhm05/g+4LlnkB91b6NThWT2YXrVAhFlCCUYyCtF+T4ygnmUWRIjUa3b2itr4sMEhXLFJ0cRrD5qmNV9Dcu5yhGVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=atomlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCiTdXkGqHoV2ykTWUh5y1vKxiJGGgeuLWhZtFIeUuw=;
 b=MWLRl0tnIv3TBDCMNfy6qYoQNt76BJiqRgSf8p3GXNKyrPjiLQU2TALNB1eT7qAKXiAP9CjBh5Yc7we4pAjNB6Sj/rwUzrggSmXnfYRkCMveIoMc/Pl7kU14pDiAvtlqiqcsdyvhyW+lJ8hSkgI0KeTsK19WvBZIGoOT6YJdMKg=
Received: from BY3PR10CA0015.namprd10.prod.outlook.com (2603:10b6:a03:255::20)
 by AT6PR12MB837810.namprd12.prod.outlook.com (2603:10b6:170:115::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 04:41:20 +0000
Received: from PH4PEPF0000B60A.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::96) by BY3PR10CA0015.outlook.office365.com
 (2603:10b6:a03:255::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 04:41:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH4PEPF0000B60A.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Fri, 30 Oct 2026 04:41:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 23:41:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 23:41:18 -0500
Received: from [10.136.33.84] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 23:41:13 -0500
Message-ID: <848a0612-61d4-4f59-9f39-e7aaaac7cb5b@amd.com>
Date: Fri, 30 Oct 2026 10:11:12 +0530
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
Subject: Re: [PATCH v10 tip/sched/core 1/6] sched: Annotate rq->rd with __rcu
 and update lockless readers
To: Aaron Tomlin <atomlin@atomlin.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>
CC: <paulmck@kernel.org>, <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>,
	<bsegall@google.com>, <mgorman@suse.de>, <vschneid@redhat.com>,
	<zhanxusheng1024@gmail.com>, <neelx@suse.com>, <chjohnst@mail.com>,
	<mproche@mail.com>, <sean@ashe.io>, <steve@abita.co>,
	<rishil1999@outlook.com>, <linux-kernel@vger.kernel.org>
References: <20261030013817.753804-1-atomlin@atomlin.com>
 <20261030013817.753804-2-atomlin@atomlin.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261030013817.753804-2-atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60A:EE_|AT6PR12MB837810:EE_
X-MS-Office365-Filtering-Correlation-Id: a528a240-db86-437f-0c70-08df36400ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|32650700020|23010399003|376014|7416014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|261026140227099003|261026121527099003|261028144727099003|10067099003|261021135927099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	+4j/qWc9IJQgS8WPWBbqf/wOyTX1iTVeFcaRK39lgegSzyQ152g+iah4S8e7nvACQOJJdpRMeqsiuTaspkCSuA5t2buMugwLPHNq1RE68FZi68ceFe6Y/sytg82T2VA1aZmHJYYveynVoFIiTlgOwOJnIS3Qt0sSmBVbcg2cbEEhKJYy/pAkZ3w5G5X/cxA6uA98W1ssggJEOc03/MdpxSnCiqrdj0r23skXlUCn2mrvrVD+t3Ae0siyuC/T/ygzu4j1VdHYZrRCSzQsKmS+u1DGojaALeEqQBeZgbd1GMZ23mOrBKKXGXHKkpXqVe/VvP4sDtMi4yRlpa6L7/ciVr7GuS35MChfsjmgMtzA5PnSFKkHkCseIcq+cq5OjcDcfvoTo6HDvbZHWhd7lXfd8f8YoxeP9CdAnblojc9vCiBmIrcQ6nmNBA0Utryxydlvpl8p0n1wf7evECFo3oMECkKmE5cESMk9bPP007zoUeFtMZzdxZDAd5p54WazOwQoyMS98FyHsxaFgXWyHquOaXdSi7ghaY7J1J0EqVIdWlPQFHfyial8bNOobD4g/8vjUf5FQPD0vfktv5WLghXwOnBiDzjLWVmxra4Cks47GV5swueAcRu9MEx7JozICG6ERagpNGv5tTv2g4fJxw4qcob9gBQIHgMG42wg6KE8GGcfRV0nVwjLH0Cl4Yi6iWVVpYoytgmmw/tibPCgIMjLyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(32650700020)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BqFll0v/16hFt4+AxPdmLvHFOzGN1wnMTMUtTnBR/CC9EkBxUS5+tNQUHShYo7niXVXgvWxKQcJyOt7vAU538dAOHnwLkbe7ft1ic682vB5M7gKU3LmKuCo0ZfHyDykAjhU7dComwqLa0FWUNq7uHW/IPLuvB2mNKkeGxnKNRVlJOZCzjoadE21eo6jSU16r+EeD4nd5Xm9sJQu1ysfd3SwSBjFfv9KMqxPIhK95GBU+6pQZHpt9JzI0rShV3m36ZS37fEz5RjZQRZ+C+yfMMq3Tsr5xdRfDUI41YG/XXKrYFRQd6OSG2fK4MQOqLy8x5qPI1t7YZDZ8oKj/mtXikvV4lJoLn1vR5vJB1u4HIbBW5O6FUeyA4DaGCFFV8coTzIMgin9mI4Cvn84lemgwR4t+XkIOdahVSAscDYaB6sDEySyfe24Z8lbKltQr2vUv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 04:41:19.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a528a240-db86-437f-0c70-08df36400ab9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB837810

Hello Aaron,

On 10/30/2026 7:08 AM, Aaron Tomlin wrote:
> The root_domain pointer rd field in struct rq is updated dynamically
> using RCU, and its memory reclamation is deferred via call_rcu() in
> rq_attach_root(). However, struct rq's rd field was missing the __rcu
> compiler annotation, and several lockless readers across the scheduler
> subsystem accessed rq->rd directly without using RCU dereference
> primitives.
> 
> Add the __rcu annotation to struct rq's rd field. For code clarity,
> introduce the rcu_dereference_root_domain() helper macro to validate
> access under sched_domains_mutex or active RCU-sched read-side critical
> sections. While mechanically identical to
> rcu_dereference_sched_domain(), defining rcu_dereference_root_domain()
> preserves the natural symmetry of rq->rd and rq->sd in struct rq, while
> keeping grep-ability straightforward. Update readers and accessors
> across kernel/sched/ to use rcu_dereference_root_domain().
> 
> This ensures proper memory ordering, enables Sparse static analysis
> validation, and avoids false Lockdep warnings under CONFIG_PROVE_RCU.
> 
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  kernel/sched/core.c     | 24 ++++++++-----
>  kernel/sched/deadline.c | 77 ++++++++++++++++++++++-------------------
>  kernel/sched/fair.c     | 27 +++++++++------
>  kernel/sched/rt.c       | 64 +++++++++++++++++++---------------
>  kernel/sched/sched.h    |  7 ++--
>  kernel/sched/syscalls.c |  8 ++---
>  kernel/sched/topology.c | 13 +++----
>  7 files changed, 127 insertions(+), 93 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158de..4ead07fd0f6d 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8542,8 +8542,10 @@ void set_rq_online(struct rq *rq)
>  {
>  	if (!rq->online) {
>  		const struct sched_class *class;
> +		struct root_domain *rd;
>  
> -		cpumask_set_cpu(rq->cpu, rq->rd->online);
> +		rd = rcu_dereference_root_domain(rq->rd);

nit. Using rcu_dereference_root_domain() everywhere is a bit mouthful.
How about a couple helpers like like:

#define rq_rd(rq)	rcu_dereference_root_domain(rq->rd)
#define cpu_rd(cpu)	rcu_dereference_root_domain(cpu_rq(cpu)->rd)

... and those makes the usage much shorter. Thoughts?

I've attached a coccinelle script at the end that I used to do the
conversion.

> +		cpumask_set_cpu(rq->cpu, rd->online);
>  		rq->online = 1;
>  
>  		for_each_class(class) {
> @@ -8557,6 +8559,7 @@ void set_rq_offline(struct rq *rq)
>  {
>  	if (rq->online) {
>  		const struct sched_class *class;
> +		struct root_domain *rd;
>  
>  		update_rq_clock(rq);
>  		for_each_class(class) {
> @@ -8564,7 +8567,8 @@ void set_rq_offline(struct rq *rq)
>  				class->rq_offline(rq);
>  		}
>  
> -		cpumask_clear_cpu(rq->cpu, rq->rd->online);
> +		rd = rcu_dereference_root_domain(rq->rd);

nit. If there is no rq_lock() / rcu dependnecy, maybe you can
initialize rd up top where you declare it for.

> +		cpumask_clear_cpu(rq->cpu, rd->online);
>  		rq->online = 0;
>  	}
>  }
> @@ -8572,10 +8576,12 @@ void set_rq_offline(struct rq *rq)
>  static inline void sched_set_rq_online(struct rq *rq, int cpu)
>  {
>  	struct rq_flags rf;
> +	struct root_domain *rd;

nit. reverse x-mas declaration style would be better IMO.

>  
>  	rq_lock_irqsave(rq, &rf);

... and since you are touching these bits, maybe you can also
covert these to guard(rq_lock_irqsave)(rq) and save on needing to
have explicit rq_flags.

> -	if (rq->rd) {
> -		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> +	rd = rcu_dereference_root_domain(rq->rd);
> +	if (rd) {
> +		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
>  		set_rq_online(rq);
>  	}
>  	rq_unlock_irqrestore(rq, &rf);
> @@ -8584,10 +8590,12 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
>  static inline void sched_set_rq_offline(struct rq *rq, int cpu)
>  {
>  	struct rq_flags rf;
> +	struct root_domain *rd;
>  
>  	rq_lock_irqsave(rq, &rf);
> -	if (rq->rd) {
> -		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> +	rd = rcu_dereference_root_domain(rq->rd);
> +	if (rd) {
> +		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
>  		set_rq_offline(rq);
>  	}
>  	rq_unlock_irqrestore(rq, &rf);
> @@ -9009,8 +9017,8 @@ void __init sched_init(void)
>  #endif
>  		rq->next_class = &idle_sched_class;
>  
> -		rq->sd = NULL;
> -		rq->rd = NULL;
> +		RCU_INIT_POINTER(rq->sd, NULL);
> +		RCU_INIT_POINTER(rq->rd, NULL);
>  		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
>  		rq->balance_callback = &balance_push_callback;
>  		rq->active_balance = 0;
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index c0ebdcde5fe5..2dcb3722c317 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -122,12 +122,12 @@ static inline struct dl_bw *dl_bw_of(int i)
>  {
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
>  			 "sched RCU must be held");

Do we need this warbing given we are using rcu_dereference_all_check()
which checks for RCU too?

> -	return &cpu_rq(i)->rd->dl_bw;
> +	return &rcu_dereference_root_domain(cpu_rq(i)->rd)->dl_bw;
>  }
>  
>  static inline int dl_bw_cpus(int i)
>  {
> -	struct root_domain *rd = cpu_rq(i)->rd;
> +	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(i)->rd);
>  
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
>  			 "sched RCU must be held");

this warning may not be required either.

[..snip..]

> @@ -2167,6 +2167,9 @@ queue_balance_callback(struct rq *rq,
>  	rq->balance_callback = head;
>  }
>  
> +#define rcu_dereference_root_domain(p) \

                                       ^
This argument here can be 'rd' for better clarity
                                   v

> +	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
> +
>  #define rcu_dereference_sched_domain(p) \
>  	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
>  

-- 
Thanks and Regards,
Prateek

Assisted-by: LLM

root_domain_helpers.cocci
--------------------------
// SPDX-License-Identifier: GPL-2.0-only
/// Replace open-coded rcu_dereference_root_domain() with rq_rd()/cpu_rd().
///
///   rcu_dereference_root_domain(cpu_rq(cpu)->rd)  ->  cpu_rd(cpu)
///   rcu_dereference_root_domain(rq->rd)           ->  rq_rd(rq)
//
// Confidence: High
// Options: --include-headers

virtual patch
virtual report

@initialize:python@
@@
import re
import linecache

HELPER_DEF = re.compile(r'^\s*#\s*define\s+(rq_rd|cpu_rd)\b')

def in_helper_define(p):
    """True if the match is inside the #define of rq_rd/cpu_rd
    (handles backslash-continued macro bodies too)."""
    f, n = p[0].file, int(p[0].line)
    while n > 1 and linecache.getline(f, n - 1).rstrip().endswith('\\'):
        n -= 1
    return bool(HELPER_DEF.match(linecache.getline(f, n)))

// ---------------------------------------------------------------
// Rule 1: cpu_rq(cpu)->rd  ->  cpu_rd(cpu)   (must run before rule 2)
// ---------------------------------------------------------------
@cpu_m@
expression cpu;
position p;
@@
rcu_dereference_root_domain@p(cpu_rq(cpu)->rd)

@script:python cpu_filter@
p << cpu_m.p;
@@
if in_helper_define(p):
    cocci.include_match(False)

@cpu_fix depends on patch@
expression cpu;
position cpu_m.p;
@@
- rcu_dereference_root_domain@p(cpu_rq(cpu)->rd)
+ cpu_rd(cpu)

// ---------------------------------------------------------------
// Rule 2: rq->rd  ->  rq_rd(rq)
// ---------------------------------------------------------------
@rq_m@
expression rq;
position p;
@@
rcu_dereference_root_domain@p(rq->rd)

@script:python rq_filter@
p << rq_m.p;
@@
if in_helper_define(p):
    cocci.include_match(False)

@rq_fix depends on patch@
expression rq;
position rq_m.p;
@@
- rcu_dereference_root_domain@p(rq->rd)
+ rq_rd(rq)

// ---------------------------------------------------------------
// Report mode
// ---------------------------------------------------------------
@script:python depends on report@
p << cpu_m.p;
@@
coccilib.report.print_report(p[0], "use cpu_rd() helper")

@script:python depends on report@
p << rq_m.p;
@@
coccilib.report.print_report(p[0], "use rq_rd() helper")
---

Build and boot tested after applying with:

spatch --python python3 --sp-file root_domain_helpers.cocci -D patch \
       --dir kernel/sched --include-headers --in-place -j $(nproc)

