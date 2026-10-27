Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793082284;
	b=lg0TklFpjDu9v5lQrlOe0UQlQ9G3z8rJs38dgqMF41Ql1TgOIwADWMB1qYpXh02RjS2a
	 o6fz5eYfm32pCsNAHEoyh/+1twZHCeuaA6krbcCub3Umi2M2nJ4le+wrwHn4EiECH9Tga
	 e5LzNBQ4lVHD7hs6JyeBNyoTKvxSPP80bL9pD+5T5arkU+VSROB0QdURGBccKN/ekgUlk
	 yJVEKAt5ZSv5HYAbLr+/FHHtD5VpiqCznxzqLm/38VqxMAqVEj8aXMW/s2sYXwr9/pUlQ
	 U9dOpJ1p0er/9rPKbqel9q2aaye+DspJdmcNKAWuaKAa1754oMcop8qUPNyCYWnBDIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082284;
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
	bh=uJpFsu/KETMend1yoE5hDnkNAUIbduKfKPuBxlc4dfU=;
	b=xHDrRFMsJpWLy2NLC+VtL09Tez9En2aT6BWX8QyzUtYgH2Ob0P3LCAWn0IKw9XjCjZXY
	 8/GW8E5zNYmP4ADD95vxrTZtEGOLvSsxw+OwhFp3k0Yes3e3XNcBOlYMo7zxcvrYDZnuk
	 uF5pb3WnTF3uMI/3h/cmePgekSxCQbI1IxvZcWKnlnWjkkUjxrq51eFfNiubnDMMJVvZr
	 w5kSCOjAeMqEfZw1JQ5ThDJq7CmBM3O2ZmrPf/1Ix+kM1OPZkqzpfrEF9Q/KBnwIxDRhc
	 JCxL8W5ej2jHnPyAsvu3oBLsDVoqSb7dMZXnkfa10S/0WvuO/TmY7jtH1GX0b1gdpyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ldQ0n6cp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.0
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5552F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ldQ0n6cp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pq0z8U+ZQCVdG0tKArR3q6jW3d5iGuzEAnTC4iO20nAuHYrOpMRmK9rvIjzFRtjp93UgqtXXkj5Pg9Z//D8ZOotG4mpG2NJ9a85Vhg7Ff038ofRInb/0w+UZTaPbi+W8vb80xiiHAI9yQCKZ4pdSsgqtz7qlAXbnS+YhUp1LO4jp5URKINMuahE+wJx5lg8azxsasCouR//5T0FxbrTFeGkszt5w2tCabkvKouHK6tNiIyiFmp4izZm8pGnQifiMXH4T32J0k21/TsNjAIugld1savjU1AFXFAdme34c9Hdb+4QW9ZTIc4/1OH6ohleew9+O6oIw5rNg84ZQv9nTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJpFsu/KETMend1yoE5hDnkNAUIbduKfKPuBxlc4dfU=;
 b=mvvXsG4x/ef5sfcA3SyTqyG9Jlw9+a1OxMwvVMiyw0UhOdYAdkKPYi7hlQwipuEZY/dw3965bhdiuuJ6TKnhMbs/ICANfgVeJ0Q9EZELjNMFqfxVypeQzf2j7IkGSNTGWGA/CPMMY6Jnggw4BZ3B4pvN4eBYS4DWs2AYyiEpRWRGsMSB20jy+HAcJyiv4hzR5Sa4QPIZYJxkXcPC9v0v+ZXe/oRtatSo0bi+1Vo5RlvDtmUAJz6m3K+MGn8EesQ4AWUG1ZhaZ4OjFno+O7ExbomF0H+G+WtN+CIhscawA/M0dIoDiVSDojH/gaOmCcE0mKcO1I6cRqzNeKdbj4AUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJpFsu/KETMend1yoE5hDnkNAUIbduKfKPuBxlc4dfU=;
 b=ldQ0n6cpOEGYeofqAukaPKj0bJYiMx0HC+F98oexwU6Zl4KLsMK5n7qMmaSCzhZWmEEKgQG0WWUuIPraRo9wQQaamnRzmbzBN4SHmyb4gx6PTO9FTQX+TBelUaRWjpKro528a3OvU55Wx7s15b9wL6Ta65U9HhbXphn6udDReKY=
Received: from CH2PR19CA0030.namprd19.prod.outlook.com (2603:10b6:610:4d::40)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 06:24:41 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::2c) by CH2PR19CA0030.outlook.office365.com
 (2603:10b6:610:4d::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 06:24:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 06:24:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 01:24:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 01:24:40 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 01:24:36 -0500
Message-ID: <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
Date: Tue, 27 Oct 2026 11:54:35 +0530
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
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auA7AQ_S9iwPHr4d@scheduler.schedules>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd60f7b-fe9b-46b9-4a5d-08df33f2fbc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|30052699003|376014|82310400026|1800799024|7416014|261021123027099003|261022105027099003|56012099006|10067099003|261026121527099003|22082099003|18002099003|4143699003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	QfPAgIcDV7K2qpaogD/y9nuhiRp2v2ZU9ckN3oIxAu0OSaUhGru1m7LUJgFONlfvcN7FUiwnW0m/Hgz3yGaDeNTZKamqLTJthBXcAse5DwxUVhTBVlj7+cQ+xZZF0t1Poj0fATYwiYF9sfI40u2Wo+fGMQTylh7AWQUrYgRsv3D2XB8B8GItMt/xLIo8IINregKEpw/QASH3Cp8dWPSr/Sj8x0uukUy+TY6rB8Z5t2ilKd+3u/roLGKq52QDSUEZ1oHtIJFCob/lEnajoYqnA6zzIcCj+1erlNhL2uGni4BSa897p1l2VvKUqog6ivtmZp4wo1heG1s5d5s+E+IZ/gyP5LuHROAtNa8LhJ3b2r+hzcluuFZJMOi9aa5Ysj4UD7x3k+tonmLqU+AAxj9f/Vfw0qPU4z1tGf65TjzMaZMH2zlXQHMPXm02O4oRvFfyXHwkYB+/ngr7wECanC5syWkt0vYevgjiEuawpxXTy8bD3onSxEaeTrlaDA0vRSgWaxrE19kg3V1z/7C5MCFAp1LvyUnGDnpb7351xHziCllSORRa3XVLTFwJZOCfHx9oWW5MDjoCGiTWM89waeYYD0NR0hkz28Z3t/hZdLcJO7NFyThtZGIQxa5bcA/QREuAL6N/in4gbCyAFN2OudHytH/yNDBoBmf8tUwK8pN0RAUq8IPtmJxHQX4CyaNde8G+fnN2xizfHbBE0DerevFAkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(30052699003)(376014)(82310400026)(1800799024)(7416014)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026121527099003)(22082099003)(18002099003)(4143699003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ac3GNskDyL4MoRnTXMUOqSmUlw5gk6+jrIcHmk0oYuNJbQW/byeSQkEaCcVaNzFrDkcDUjKSRkxWh/PeheedM60l/yjtYXvr7Qy2KU/i9lKT/XQIehr0aGhB855OmVJZW7sjJbTOFXXrZzUP+LDfWTnbng33KMih90qOimbCblX3+CRPJ3UInBuQ39ulaCXCAwAK2KFrwdRSDZO+eQmtMuQfNA7XM9eVOorErhHD3s/32/jR7ZcChLMI+eCc31YTOBmG9AJ/ojByr3h1vk6B2KNg+2gjXbsJhBsjcVhs0PAvVmZkTKtrqH/sZjc2LuyWAZUL+QYcm7Hl4nuY7Afi+Z1VkmHvV6gjEK+tTY/5VuZj48YHhFO1j9DtzBzT4yrfVCKx0IxxFgJccqduRdBqa23Cl/i+z6p2nsGIAQ14y8TYHoKVY052wEElE+9SKmJy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 06:24:40.8235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd60f7b-fe9b-46b9-4a5d-08df33f2fbc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859

Hello Kayra,

On 10/27/2026 11:41 AM, Kayra Cizmeci wrote:
>> So all things considered, I think the following should work unless I'm
>> terribly mistaken yet again :-) I've left my reasoning as comments:
>>
>> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
>> index ebe0a7765f98..c4c624deb25b 100644
>> --- a/kernel/sched/stats.h
>> +++ b/kernel/sched/stats.h
>> @@ -239,6 +239,15 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
>>  static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
>>  {
>>  	unsigned long long delta = 0;
>> +	/*
>> +	 * If a task is blocked (blocked donor, delayed dequeue task),
>> +	 * do not account the queued time as runnable. A task that is
>> +	 * blocking would have already cleared the "last_queued"
>> +	 * indicator from sched_info_arrive() when it got a chance to
>> +	 * run on the CPU.
>> +	 */
>> +	if (t->is_blocked)
>> +		t->sched_info.last_queued = 0;
>>  
>>  	if (!t->sched_info.last_queued)
>>  		return;
>> @@ -290,7 +299,23 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>>   */
>>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>>  {
>> -	if (!t->sched_info.last_queued)
>> +	/*
>> +	 * "t->is_blocked" is only cleared after the enqueue is done and
>> +	 * the task is woken up. If the task is blocked, update the
>> +	 * "last_queued" timestamp to that of last enqueue - if the task
>> +	 * is still blocked while it leaves the runqueue, this timestamp
>> +	 * is ignored and is cleared at sched_info_dequeue().
>> +	 *
>> +	 * To transition a task back to blocked after wakeup, it has to
>> +	 * run on the CPU and naturally reach a safe preemption point.
>> +	 * sched_info_arrive() will do the correct wait time accounting
>> +	 * based on the last "last_queued".
>> +	 *
>> +	 * Any movement of task after being marked not blocked will be
>> +	 * correctly captured as queued time at enqueue + dequeue
>> +	 * boundaries when "t->is_blocked" cleared.
>> +	 */
>> +	if (!t->sched_info.last_queued || t->is_blocked)
>>  		t->sched_info.last_queued = rq_clock(rq);
>>  }
>>  
>> ---
>>
>> That "t->is_blocked" check in sched_info_enqueue() may not be
>> necessary either but I've left it in there for now since I did my
>> quick testing with it.
> 
> 
> Hi Prateek,
> 
> IMO too doing this with is_blocked would be cleaner.
> 
> But I think this not works on a case where a donor is in a different CPU
> from its owner, like:
> 
> A holds the mutex M in CPU0, B is the waiter and its on CPU1.
> 
> proxy_migrate_task() gets B to CPU0.
>> After that, A suddenly wants to goto CPU1. And it goes.
> Now B goes back to its home CPU next to A.
> 
> Now in here, timer starts.
> 
> And suddenly A drops the mutex. Now B is not is_blocked.
> 
> Because B is back to its home CPU, there is no dequeue.
> Even if there was B is not is_blocked so timer wouldn't be reset.
> 
> Normally we need to add the time that task waited for itself.
> But in this case we add the time task waited for its mutex + for itself.
> 
> Or am I missssssing something?

Indeed. That is possible and can probably be fixed by doing a
sched_info_enqueue() in proxy_needs_return() for
task_cpu(p) == p->wake_cpu case like:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..3d261a4e5b0b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3838,8 +3838,11 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 	 * will not apply. But if it did, this check is the safe way around
 	 * and would migrate.
 	 */
-	if (task_cpu(p) == p->wake_cpu)
+	if (task_cpu(p) == p->wake_cpu) {
+		/* Begin wait time accounting before marking !is_blocked. */
+		sched_info_enqueue(rq, p);
 		return false;
+	}
 
 	scoped_guard(raw_spinlock, &p->blocked_lock) {
 		/* Task is waking up; clear any blocked_on relationship */
---

Not sure if this solution is ugly or not for calling
sched_info_enqueue() out of the enqueue path :-)

-- 
Thanks and Regards,
Prateek

