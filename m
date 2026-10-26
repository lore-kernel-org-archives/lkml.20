Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793000457;
	b=B/TJlD5GcsDH5SgCGgzc39WsbfbCP2Pc5zvBP46dZpOOmOB3yfkSfLCoLUS8Yw+p4z5w
	 LErfA7TvIRSz0f9oDmCK3keydOO3mzBJOB5lvb8OGQiJaTUMmXKio8fLDWar+RmG9Gzqa
	 DTpbVs+sOFvzMHngl/1WkAk0oZ58NioohDDDOSwvCS1YtCF94dj5+ImaOy/wR2taCY/gx
	 +liJbez+GZgYNpbfhAwwUMPVgm9fTHkvp8ar8k+q5eKXmVW8ey7vT9Zekcvpa3oeYBGcD
	 Lv+6ioOFiH6kZb2FkCeTMYe2wE8KD4eYaOrNRqpZzp0FnPqj/nW77VSxTKjr1sRsyoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000457;
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
	bh=j3obspcWAQ0A/Nh2OOHOEEN33DA2F0kV/I37A1DJGjs=;
	b=btTgyIxdt4bAEgzG3XM+429kv/p3zAzantKIlPKlmGxiJvU4izmP4c3kT0X8HJojP0o6
	 UObrjbs+3D50t3S6X0b2AW4f7EyoEsL7y57IV6HGMPH6yuGDWJY2dt309YGlUD0duiAr1
	 hVCFMgMfo8CjluTeqLEJiKvbCnu4R5ohsGQ+x7EYgqsksF5XWyko8Wvcdgxuhk+nJSEXO
	 CCGyHz1roFJC2Mx4IJMJZxnqjKFLTs/2B+ls3fbO2jtR9PMZByAvOTlRNq0P+98olBQhB
	 2KwhMIbUWJ8h448Fm4sa06W6eY9xs+G7cbf+YxGYnH1BkdiSaa69HJ+IuwajvzcBAdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Hiqj+ixu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.71
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Hiqj+ixu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYInSf+l0hWO97BHkhuMMWN+ASsmaZMHe9wLvf1lu7SAhOGm0lcsZnmWFsDPs2LKohlHXr3wvMYx0l/YQav2BiH2Xk6A/I25Y8hd5L7yW+K3eYbl4VLuWVe0nF67kWcucok7KVTcqcLmAe9KqYkZ0VZ7mpNRKw0k9ut+/9sviyU4BUSnlP1O+1pGNgKNTCnu5m7qTRgQyq3rRxK+8B2CzEkh/w/KE+KcJtF1vmJg/jg8hnkqLg4R3KjwBWiNCSOvNom1lB31+pUjb7UsQnG41emedQKc5OGxryX1KFsmOaC9c218fBHXoKOXrFH/nBtEevtIID4TtovlknmAPmWMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3obspcWAQ0A/Nh2OOHOEEN33DA2F0kV/I37A1DJGjs=;
 b=rzwzFgN8wnMOvI9+/HdvGDZPJsCe8AMge3k7bCxzsqw5XPlHGQ/7sJxdl1NagK+PD+scIIroTR/ryGYv/Mx/7Mr4D1yWI/XdBc2g82vDhZIVBjGY6sOe8RTNeBCXpC1RIJSphKRZUFi292lM3pAeYfhsQVdoExiQ5/JLjVs0Ln7YX6WOvhJdIQCG08dNVpNS34xo+RMSgQN+S1RGPCa6QRer7rS3h3zS78YWIRpfPR1n2xyP8rQlHXcgJsaGcXbGINmVHNYCXd932imDcClO9XgtvKs2OqS/ehIIVi//4lKnAfbGmiMxUMclxRn+fmhEwmcUnDE/Y0prDz9x/Yh+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3obspcWAQ0A/Nh2OOHOEEN33DA2F0kV/I37A1DJGjs=;
 b=Hiqj+ixubJvGoXOVmdZfk4LQ5SXhiBFOgyXcm9leJKmxVh5XeQC1m735Po5bOHKr1FHkKB1XlbsJH20kJN1sXq2zCGiW4C8xI8WJu2FW9Bh4iOSfWdsAdE6F/B/VUHFkjBqb1RhStJegpQGqxjEx21fWv6PTxeUhSmGEVCk5Wvo=
Received: from SJ0PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:33f::6)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Mon, 26 Oct
 2026 07:40:44 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9a) by SJ0PR05CA0031.outlook.office365.com
 (2603:10b6:a03:33f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.6 via Frontend Transport; Mon, 26
 Oct 2026 07:40:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 07:40:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 02:40:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 02:40:33 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 26 Oct 2026 02:40:23 -0500
Message-ID: <9847c389-3014-4c7c-a1dc-f41de2ce17d3@amd.com>
Date: Mon, 26 Oct 2026 13:10:17 +0530
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
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Valentin Schneider <valentin.schneider@arm.com>, Connor O'Brien
	<connoro@google.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, "Valentin
 Schneider" <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>,
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, "Dietmar
 Eggemann" <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>,
	"Boqun Feng" <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
	"Joel Fernandes" <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>,
	"Xuewen Yan" <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>,
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, "zhidao su
 (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, "Shubhang Kaushik
 (Ampere)" <sh@gentwo.org>, <kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261023220431.1106611-8-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|DS7PR12MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 412c4eb9-b554-4f72-98a8-08df333470f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|23010399003|376014|82310400026|261009223027099003|261021123027099003|261021135927099003|10067099003|56012099006|18002099003|22082099003|261022105027099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	KBrhtpsMyYKXGs9dMXwXfGBo/laC4Z5hYlMlkCw1vZFOYpen+FFA/ma7NvdontL6ILCduvyInrEMFmD1dFxjNlBl/UQUVvj0x4GdTwSAhNMYtf2zZ5te7sTSmKShwqcoNcbmoN2Hle4K+SpwI/O1VmH17U54ojR0enA2gdTDvHrGSZDiuu3NqEuw3IjRa6SBq/e3vrOq66AZsR7Jw9mR6EfKVseE2tunSVrG/4nJnj4mm8mW8yOPIgZMhlKH4KouDLRK6W2R77Py07SOc/0o+8FZu7fz9L6yxDIg9opDgScjmMsiZXmnIofMonwePSQC5mr9SmUGV9+N9ag7Evesca/hdkBHcjIFvHNC1jhy1uCwcs2PlUpAG+r7bH3iDNzF1CjQemsoTNyyG7zYj3dbIsx13JlUCMyc951KgwmtHNa7e7I/kve/yRmOPuWwyrccSL6tkSMlT2nuvpwb2PLnhAZVB2ChbekIhDkyiQB+mzDF8m8R62zE1nHc0ySp6jGypssEhSX3pKO99PkAnzRdSAYNY1vT4lWClnaeK35EWCHo6bsFAMif30Kh/REJ6SBEiBPPJy7RHsAIRtON9eqUvWFk0b1z8JZzSnlSDeRfClRUNcCvr0BEiknVagF+Lf3373Bh/tlmMrrhHVL8aiFRHWq9qUV/QTLFu+eHKqAYZsBNxFROno2w3dtG2WTYMBogFu5LxA4BGyZ5SOKM+1t9dg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(261009223027099003)(261021123027099003)(261021135927099003)(10067099003)(56012099006)(18002099003)(22082099003)(261022105027099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1WjOTf7+ltW1lId/BuLYxxBTF21vR4MVKwPXKG9ZhWGllq0SwjEBvYCvb8/lrAzCQUaFVgK1SpgpBYsE//KIGrahdFPOoT4FSnfwl7bpMdeWUgAtahsG9ZX5dW3oU9UW52+inuBZq8pLjS3DlHa60bWH+ZdyQPtUOdRLnD7mCvpaUZTmTjDOERTqi8VUpO1g+lvuUSOIfTKEX5m2vktp4wBx2x0bFSkn6VQElpMTAgIyp0yKqzBnc71kTet/KLxJXp0rgK4c1Rdp2VZupj6GvFV5zSle9ArSgN780Ah/Rpvle2F7Ph+gbmpEBMLFL/f4dqqsMRtsloL48U6uNryEsOcD7rwyJ/trkErPas6/UnTFVwPBJ2ftsoW+d5umO+zNz41WDQhmVi7AzjLaFsQLApfN3tw4DC7VrM8V57xfBmVXFMsHachhRpPFADmzDlpg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:40:43.4823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 412c4eb9-b554-4f72-98a8-08df333470f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093

Hello John,

On 10/24/2026 3:34 AM, John Stultz wrote:
> @@ -2240,6 +2240,76 @@ void activate_task(struct rq *rq, struct task_struct *p, int flags)
>  	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
>  }
>  
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +static inline
> +void __proxy_remove_from_sleeping_owner(struct task_struct *owner, struct task_struct *p)
> +{
> +	lockdep_assert_held(&owner->blocked_lock);
> +
> +	BUG_ON(p->sleeping_owner != owner);
> +
> +	list_del_init(&p->blocked_node);
> +	WRITE_ONCE(p->sleeping_owner, NULL);
> +	put_task_struct(owner); // matches get in proxy_enqueue_on_owner
> +}
> +
> +static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
> +{
> +	struct task_struct *owner;
> +
> +retry:
> +	owner = data_race(READ_ONCE(p->sleeping_owner));
> +	if (!owner)
> +		return;
> +
> +	/*
> +	 * __proxy_remove_from_sleeping_owner() does a
> +	 * put on owner to match the get done in
> +	 * proxy_enqueue_on_owner(). If that put is the
> +	 * last one and it frees owner, we'd be freeing
> +	 * a lock we held. So get/put owner around its
> +	 * usage her to ensure that doesn't happen.
> +	 */

Aren't we under rq_lock with IRQs disabled here? If we
observe a p->sleeping_owner, we should be able to use it
since we are protected by RCU.

Maybe needs a load acquire but get + put may not be necessary.

> +	scoped_guard(get_task, owner) {
> +		guard(raw_spinlock)(&owner->blocked_lock);
> +
> +		if (owner != READ_ONCE(p->sleeping_owner))
> +			goto retry;
> +		__proxy_remove_from_sleeping_owner(owner, p);
> +	}
> +}
> +
> +void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
> +{
> +	lockdep_assert_rq_held(rq);
> +
> +	if (!sched_proxy_exec()) {
> +		__activate_task(rq, p, en_flags);
> +		return;
> +	}
> +
> +	proxy_remove_from_sleeping_owner(p);
> +	/*
> +	 * By calling __activate_task() with blocked_lock held, we
> +	 * order against the find_proxy_task() blocked_task case
> +	 * such that no more blocked tasks will be enqueued on p
> +	 * once we release p->blocked_lock.
> +	 */
> +	guard(raw_spinlock)(&p->blocked_lock);
> +	WARN_ON(task_cpu(p) != cpu_of(rq));
> +	__activate_task(rq, p, en_flags);
> +}
> +#else
> +static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
> +{
> +}
> +
> +void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
> +{
> +	__activate_task(rq, p, en_flags);
> +}
> +#endif
> +
>  void deactivate_task(struct rq *rq, struct task_struct *p, int flags)
>  {
>  	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> @@ -3815,6 +3885,184 @@ static inline void proxy_reset_donor(struct rq *rq)
>  	resched_curr(rq);
>  }
>  
> +static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
> +{
> +	unsigned int wake_cpu;
> +
> +	/*
> +	 * Since we are enqueuing a blocked task on a cpu it may
> +	 * not be able to run on, preserve wake_cpu when we
> +	 * __set_task_cpu so we can return the task to where it
> +	 * was previously runnable.
> +	 */
> +	wake_cpu = p->wake_cpu;
> +	__set_task_cpu(p, cpu);
> +	p->wake_cpu = wake_cpu;
> +}
> +
> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
> +{
> +	struct rq_flags rf;
> +	int target_cpu = cpu_of(target_rq);
> +
> +	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
> +		/* If task is no longer blocked, don't activate */
> +		if (!p->is_blocked)
> +			return;
> +
> +		/* Avoid racing with ttwu */
> +		if (READ_ONCE(p->__state) == TASK_WAKING)
> +			return;

I feel this might be racy and needs some ordering. Consider:

  p->__state = TASK_WAKING

  sched_ttwu_pending()
    ttwu_do_activate(p)
      /* None of these are ordered */           do_activate_blocked_waiter(p)
      WRITE_ONCE(p->__state, TASK_RUNNING);       if (!p->is_blocked) /* False */
      p->is_blocked = 0;                          if (READ_ONCE(p->__state) == TASK_WAKING) /* False */
                                                  if (READ_ONCE(p->on_rq)) /* False */
      WRITE_ONCE(p->on_rq, TASK_ON_RQ_QUEUED);    ... /* NMI */


      /* p runs,
       * blocks on new mutex,                       /* Only p->pi_lock is held */
       * queues on sleeping owner
       */
                                                  ... /* Return from NMI */

                                                  scoped_guard (raw_spinlock, &p->blocked_lock)
                                                    if (!task_is_blocked(p)) /* False */

                                                  ...
                                                  activate_task(target_rq, p, en_flags);
                                                    !! Activated while being queued on sleeping owner !!


Am I missing something that prevents this?

I think there are enough defensive mechanism for this to not
make a difference from correctness standpoint but it is worth
pointing out that this is technically possible if the loads /
stores are reordered and the machine meets some terrible fate.

Since task activation is now done under p->blocked_lock, maybe
these checks can be done under the p->blocked_lock too? It'll
inevitably stretch the critical section but 4 more loads on
a relatively hot cacheline shouldn't hurt much?
> +
> +		if (READ_ONCE(p->on_rq)) {
> +			/*
> +			 * We raced with a non mutex handoff activation of p.
> +			 * That activation will also take care of activating
> +			 * all of the tasks after p in the blocked_head list,
> +			 * so we're done here.
> +			 */
> +			return;
> +		}
> +		if (task_on_cpu(task_rq(p), p)) {
> +			/*
> +			 * Its possible this activation is very late, and
> +			 * we already were woken up and are running on a
> +			 * different cpu. If that task blocked, it could be
> +			 * dequeued (so on_rq == 0), but still on_cpu.
> +			 * Bail in this case, as we definitely don't want to
> +			 * activate a task when its on_cpu elsewhere.
> +			 */
> +			return;
> +		}
> +
> +		scoped_guard (raw_spinlock, &p->blocked_lock) {
> +			/*
> +			 * Again, if activation is delayed, it's possible the
> +			 * task has been woken and is no longer blocked_on,
> +			 * but went back to sleep, so double check blocked_on
> +			 * before activating onto the owner's rq
> +			 */
> +			if (!task_is_blocked(p))
> +				return;
> +		}
> +
> +		/*
> +		 * Have to make sure we handle nr_iowait adjustment before
> +		 * we call proxy_set_task_cpu() to ensure we are adjusting
> +		 * the same runqueue we left (where block_task()
> +		 * incremented nr_iowait).
> +		 */
> +		if (p->in_iowait) {
> +			delayacct_blkio_end(p);
> +			atomic_dec(&task_rq(p)->nr_iowait);
> +		}
> +
> +		if (task_cpu(p) != target_cpu) {
> +			en_flags |= ENQUEUE_MIGRATED;
> +			psi_ttwu_dequeue(p);
> +			proxy_set_task_cpu(p, target_cpu);
> +		}
> +		rq_lock_irqsave(target_rq, &rf);
> +		/*
> +		 * proxy_enqueue_on_owner() called block_task() which
> +		 * increments nr_uninterruptible, so we need to reverse
> +		 * that when we activate the blocked waiter
> +		 */
> +		if (p->sched_contributes_to_load)
> +			target_rq->nr_uninterruptible--;
> +		update_rq_clock(target_rq);
> +		activate_task(target_rq, p, en_flags);
> +		resched_curr(target_rq);

This should be wakeup_preempt(rq, p, en_flags) instead?

> +		rq_unlock_irqrestore(target_rq, &rf);
> +	}
> +}
> +
> +static void activate_blocked_waiters(struct rq *target_rq,
> +				     struct task_struct *owner,
> +				     int wake_flags)
> +{
> +	struct list_head bal_head;
> +	unsigned long flags;
> +	int en_flags = ENQUEUE_WAKEUP | ENQUEUE_NOCLOCK;
> +
> +	if (!sched_proxy_exec())
> +		return;
> +
> +	/*
> +	 * A whole bunch of waiting donor tasks back this blocked
> +	 * lock owner task, wake them all up to give this task its
> +	 * 'fair' share.
> +	 *
> +	 * This is a little unique here and the locking is messy.
> +	 * At this point we only hold the blocked_lock, so the
> +	 * owner task may be able to run and do all sorts of
> +	 * things while we are processing the blocked_head list,
> +	 * including going back to sleep, which can cause tasks
> +	 * to be added to the owners->blocked_head while we are
> +	 * processing it!
> +	 * Thus, we pull the entire list off the owner->blocked_head
> +	 * here so that we will only process a finite amount of
> +	 * tasks. Tasks added after this will be processed by the
> +	 * future wake events.
> +	 * Even though we have pulled the list off the blocked_head
> +	 * the removed list is *still* "owned" and serialized by
> +	 * the owner->blocked_lock! As we have to serialize against
> +	 * mid-chain wakeups, who may try to remove themselves from
> +	 * the list.
> +	 */
> +	raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +	if (!list_empty(&owner->blocked_activation_node)) {
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		return;
> +	}
> +
> +	if (list_empty(&owner->blocked_head)) {
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		return;
> +	}
> +
> +	get_task_struct(owner);
> +	INIT_LIST_HEAD(&bal_head);
> +	list_add_tail(&owner->blocked_activation_node, &bal_head);
> +	raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +
> +	while (!list_empty(&bal_head)) {
> +		struct list_head tmp_head;
> +
> +		INIT_LIST_HEAD(&tmp_head);
> +		owner = list_first_entry(&bal_head, struct task_struct, blocked_activation_node);
> +
> +		raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +		list_replace_init(&owner->blocked_head, &tmp_head);
> +		list_del_init(&owner->blocked_activation_node);
> +		while (!list_empty(&tmp_head)) {
> +			struct task_struct *p;
> +
> +			p = list_first_entry(&tmp_head,
> +					     struct task_struct,
> +					     blocked_node);
> +			WARN_ON(p == owner);
> +			__proxy_remove_from_sleeping_owner(owner, p);
> +			raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +
> +			do_activate_blocked_waiter(target_rq, p, en_flags);
> +
> +			raw_spin_lock_irqsave(&p->blocked_lock, flags);
> +			if (list_empty(&p->blocked_activation_node)) {
> +				get_task_struct(p);
> +				list_add_tail(&p->blocked_activation_node, &bal_head);
> +			}
> +			raw_spin_unlock_irqrestore(&p->blocked_lock, flags);
> +
> +			raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +		}
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		put_task_struct(owner); // put matches get prior to adding to local bal_head

Insane jugglery but super impressed that you got everything right :-)

> +	}
> +}
> +
> +static inline struct task_struct *proxy_resched_idle(struct rq *rq);
> +
>  /*
>   * Checks to see if task p has been proxy-migrated to another rq
>   * and needs to be returned. If so, we deactivate the task here
> @@ -3872,6 +4120,10 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
>  {
>  	return false;
>  }
> +
> +static inline void activate_blocked_waiters(struct rq *target_rq,
> +					    struct task_struct *owner,
> +					    int wake_flags) {}
>  #endif /* CONFIG_SCHED_PROXY_EXEC */
>  
>  static void
> @@ -3945,8 +4197,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  
>  	update_rq_clock(rq);
>  	if (p->is_blocked) {
> -		if (p->se.sched_delayed)
> +		if (p->se.sched_delayed) {
> +			proxy_remove_from_sleeping_owner(p);
>  			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
> +		}
>  		if (proxy_needs_return(rq, p))
>  			return 0;
>  	}
> @@ -3975,13 +4229,15 @@ void sched_ttwu_pending(void *arg)
>  	update_rq_clock(rq);
>  
>  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> +		int wake_flags;
>  		if (WARN_ON_ONCE(p->on_cpu))
>  			smp_cond_load_acquire(&p->on_cpu, !VAL);
>  
>  		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
>  			set_task_cpu(p, cpu_of(rq));
>  
> -		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
> +		wake_flags = p->sched_remote_wakeup ? WF_MIGRATED : 0;
> +		ttwu_do_activate(rq, p, wake_flags, &rf);

Is this hunk necessary?

>  	}
>  
>  	/*
> @@ -4488,6 +4744,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		ttwu_queue(p, cpu, wake_flags);
>  	}
>  out:
> +	activate_blocked_waiters(cpu_rq(task_cpu(p)), p, wake_flags);
>  	if (success)
>  		ttwu_stat(p, task_cpu(p), wake_flags);
>  
> @@ -6822,21 +7079,6 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
>  }
>  
>  #ifdef CONFIG_SCHED_PROXY_EXEC
> -static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
> -{
> -	unsigned int wake_cpu;
> -
> -	/*
> -	 * Since we are enqueuing a blocked task on a cpu it may
> -	 * not be able to run on, preserve wake_cpu when we
> -	 * __set_task_cpu so we can return the task to where it
> -	 * was previously runnable.
> -	 */
> -	wake_cpu = p->wake_cpu;
> -	__set_task_cpu(p, cpu);
> -	p->wake_cpu = wake_cpu;
> -}
> -
>  static inline struct task_struct *proxy_resched_idle(struct rq *rq)
>  {
>  	put_prev_set_next_task(rq, rq->donor, rq->idle);
> @@ -6984,6 +7226,29 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
>  	proxy_reacquire_rq_lock(rq, rf);
>  }
>  
> +static void proxy_enqueue_on_owner(struct rq *rq, struct task_struct *owner,
> +				   struct task_struct *p)
> +{
> +	lockdep_assert_rq_held(rq);
> +	lockdep_assert_held(&owner->blocked_lock);
> +	/*
> +	 * ttwu_activate() will pick them up and place them on whatever rq
> +	 * @owner will run next.
> +	 */
> +	WARN_ON(p == owner);
> +	WARN_ON(!p->on_rq);
> +	WARN_ON(p->sleeping_owner);
> +	get_task_struct(owner);
> +	WRITE_ONCE(p->sleeping_owner, owner);
> +	/*
> +	 * ttwu_do_activate must not have a chance to activate p
> +	 * elsewhere before it's fully extricated from its old rq.
> +	 */
> +	list_add(&p->blocked_node, &owner->blocked_head);
> +	proxy_resched_idle(rq);
> +	block_task(rq, p, READ_ONCE(p->__state));
> +}
> +
>  #define MAX_PROXY_CHAIN_DEPTH 1024
>  
>  /*
> @@ -7087,11 +7352,37 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  		}
>  
>  		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
> -			/* XXX Don't handle blocked owners/delayed dequeue yet */
> +			/*
> +			 * rq->curr must not be added to the blocked_head list or else
> +			 * ttwu_do_activate could enqueue it elsewhere before it switches
> +			 * out here. The approach to avoid this is the same as in the
> +			 * migrate_task case.
> +			 */
>  			if (curr_in_chain)
>  				goto resched_idle;
> -			__clear_task_blocked_on(p, NULL);
> -			goto deactivate;
> +			/*
> +			 * If !@owner->on_rq, holding @rq->lock will not pin the task,
> +			 * so we cannot drop @mutex->wait_lock until we're sure its a blocked
> +			 * task on this rq.
> +			 *
> +			 * We use @owner->blocked_lock to serialize against ttwu_activate().
> +			 * Either we see its new owner->on_rq or it will see our list_add().
> +			 */

nit. Last two lines can be part on next comment to keep it
next to the p->on_rq check.

> +			WARN_ON(owner == p);
> +			raw_spin_unlock(&p->blocked_lock);
> +			raw_spin_lock(&owner->blocked_lock);
> +			/*
> +			 * Before actually adding to the sleeping owner, double check
> +			 * we didn't race with an owner wakeup before grabbing the
> +			 * owner's blocked_lock.
> +			 */
> +			if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed)
> +				proxy_enqueue_on_owner(rq, owner, p);
> +
> +			raw_spin_unlock(&owner->blocked_lock);
> +			raw_spin_lock(&p->blocked_lock);
> +
> +			return NULL; /* retry task selection */
>  		}
>  
>  		owner_cpu = task_cpu(owner);

-- 
Thanks and Regards,
Prateek

