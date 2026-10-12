Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012010.outbound.protection.outlook.com [40.107.200.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88987331EB4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779990; cv=fail; b=TLBor2GXxvyFrgwH+OBLEYxnp/jM6RAw58IEBuf096qPCZpD+LAl2oUcj6PgHDBZhqnigasvcfKshn1lMUxjBNxT3gOZQxYActhjEUeO/VfQXnEiBNvTh6fQtaSmAuSP5CioBr2cEjGbEizSQe/2ytXN9YaOTZozNKuMbGpvMxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779990; c=relaxed/simple;
	bh=fhNNHEIe3aGiyHFlv3VQvd+WjWProPiZGVrtlj1/elk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UpGJnLewGkBwwHRPxZRoQgIt04TDLe5KBVTLsutv68qRsRtNh0O0IojSLDveMtg3dpUO9s/S/bjhdi0NK42Osl+A0RW4ysnYBPkblIpXQMVemb0tn4iVXUYxt7YplFnvNsE69QPVveeRKAUq80jQtIyOHigyAuxMYpZumf3Sk/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wHv+HDu1; arc=fail smtp.client-ip=40.107.200.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wHv+HDu1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNfrlYmh1kz6t3wfRkeNR0yDuDrCEydXX1azqdeurkzaxXselW9N5VlGoUdmBn1bheRvTf5nSKNCHN+3JqGdCG7KywziF8F8GIzKD6dMr5T1Q9uki8i+iVPhSLJR/zWiIoscOfvHrzSKpaMpxcy51KgxxxecqhK5YBIEJvHlu/4QgcfMozMCx7FnRhlvyPRLLn5CPuTnVr/Ytc93vvOPfhoi/NGlZb1FZTIaxOv78db5IU/qWtFKMTuRJMnTYBAOA/bpQz5GTOeB4zQ7DsfqsaNc8K1g92vyzpvjbAdg3iaj1MnunM8vEtvrHry3Mk9FKnCV2rXN/tNZ16EC0g3zeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZEXRgG7r9T/LRZOs/w3hG5fTne740Fo5GIvft9K3AY=;
 b=BmjdxO5GKsW+7RCPTwpRR1ATDHSKreLhl3/bpnD/ZnXKgwNahov53yilmz039P14roCym7owlVxJlbdMYfr6l/sEuVbouNg5I2XLxk5hp4eLFfjCqtqogkoTR1x/9GH2vnc18Fn32VBBPYaCpV7pFIZoLrNb1Lxlx7GhnWi6gVzZQiPwJhC78z6gSqWMxWyZkhhkrSIT5S2IGuZ/vxIoWcaluvygtEX+OGCcWJL7LiQH2QBnnvcY0k2FXBgbiLEQF6Hi52ZLhZZ139Jy0dkK2ZaeRmfcGn1/+SfkEBiYJ/QerIs9w9l7QqdCVH3JOiDKamVxi8R7Mkw2HymYaXEGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZEXRgG7r9T/LRZOs/w3hG5fTne740Fo5GIvft9K3AY=;
 b=wHv+HDu1qTysp5E2D9ectKyzUz7RWVW2BBFsnY5esmPTwdDSh51vI9tdBZn9fb5NxE363jpYOBJQKUpCJgcCaYXgz+vKgYJzRaokC2Bgw+FURiPa62R/yx4G79EPUnSBdnyNv9gyY/sCn9vnZxjObA6ltLJVLdbJ9x0DpeIenRc=
Received: from CH0PR04CA0036.namprd04.prod.outlook.com (2603:10b6:610:77::11)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 04:39:44 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::52) by CH0PR04CA0036.outlook.office365.com
 (2603:10b6:610:77::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 04:39:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 04:39:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 23:39:39 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 23:39:38 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 11 Oct 2026 23:39:34 -0500
Message-ID: <95dba20d-ad01-43a3-b870-4a696563c41a@amd.com>
Date: Mon, 12 Oct 2026 10:09:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
CC: <christian.loehle@arm.com>, <elif.topuz@arm.com>,
	<linux-kernel@vger.kernel.org>, <sh@gentwo.org>, Ingo Molnar
	<mingo@kernel.org>
References: <20261003114656.105721-1-kayracizmeci@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261003114656.105721-1-kayracizmeci@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 8feb43ad-d420-4bae-0534-08df281ad6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|7416014|1800799024|10067099003|18002099003|22082099003|3023799007|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	B0w0UCnXF9StAFYC3cnjWZheAD3BHKqw1GnVvBAZy/y+Vwc8lb0NT9F7XzDAX8CPU1HkIsiSDJlX0HR18Fg7noErgMYnEpXew9OoUhjbxzCAGKyd6lu1kQ5g718JBC/1DHWOiSQ5lkYOLc4DW46mXSiusWpgy359fmUrpCInEQynbzjIDqbB7hTTsXq7xojOkaGKayODN/Rf/vS38TUI6GPQXGPnewQ4eWzaZq+ApVWHvXVBMRC0spRT+2/B2KIsf0CLaE/xWGwkox/lXLrmoSTxFgMh9JueEIJGmJwoiezqGNx9/zaU6g99krSAmt61ZWsOuho+G+vYNo52bzcrq5zbAvp9/ydHA6Y3MjRSzocEWgQfqPVMgv4Kq8h/c+nWiRiqj7YuHTA2ANE5QQXRxA3tPS5ndkrwU4waHN8sYUwMw9UjzkTKlU35ARYjpQMLObQjJzbtW9mWHxNRsDL/qMubCs4reVGgrvrluZgKx1aUBy+dlUNuNWMRpxC6dV2IYG8kTR7ODCWAkP5FY0HJ7rr2QSlPf4mo81zOrGsrBfEwjTBuig+tKD3TMFcz3i2gLZhbASSqOWRpAp1seXL74tc2h9fgM1qt+FXJSK3eU1xEnfu6T2fyqldi3kqmXfdUlF9rFRaz0DNTUW7P7VFYHO2VnHgQ4E85RsN68tkUwtcGhyOohADJsARKmhbU/oSAxYSafoyOYIc3gOPz477Fz1mFGuZn75z/V1Rl3a/wNXXqSE/q7f8c9P/aWxqxP7Bg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A7bWOJWGex6y5m0yACzcRT+nVysTPd9KDnlOBvrt3hSTBCmCKxP7GKfGdodnJNv4p/iafrtYjFB8ahnEXF7rLbg4njpW3basAOwnbqU9DzjceCMnyVxl7useot9vfWXOf/377IoAZ7fDpfUXZIpa7/DqKkPA7+6wTt2Zh+N+f8qcGnFZ95dsa508wNXmx2SU8ywRSPRVJCuxvb6LyoUNpMUmhKQI5BzwG2o9dfVCwGbvBybW9Snkyi88wlTkYXMVtdA9L6nowSFneTDpy4cALECQ5A9BBaRXSXCveAcZYX+dNKy7UnQeZiRAZr+zplDHA8eyenYmLxRWinVPog9xvcv2QghmQ9kvYWX8wkno0MjVDdqkej/D0LeVdmWi4799KWw7MnBrlNIaQpb+ca1Gurmfg0u6wlFNuP9IX1lHFpRyjiecKl5LJaoVpsHclCO7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:39:44.5371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8feb43ad-d420-4bae-0534-08df281ad6ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937

Hello Kayra,

On 10/3/2026 5:16 PM, Kayra Cizmeci wrote:
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 7b91cae4a59c..bd9e2d119910 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -584,6 +584,7 @@ struct sched_entity {
>  	unsigned char			on_rq;
>  	unsigned char			sched_delayed;
>  	unsigned char			rel_deadline;
> +	unsigned char			rel_vprot;
>  	unsigned char			custom_slice;
>  					/* hole */
>  
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 71d3c948e14a..f1241f572cdc 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4638,6 +4638,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>  	p->se.vruntime			= 0;
>  	p->se.vlag			= 0;
>  	p->se.rel_deadline		= 0;
> +	p->se.rel_vprot			= 0;
>  	INIT_LIST_HEAD(&p->se.group_node);
>  
>  	/* A delayed task cannot be in clone(). */
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b42a0ca2a69e..0bcd3a77aba4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4614,7 +4614,7 @@ dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  }
>  
>  static void
> -rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
> +rescale_entity(struct sched_entity *se, unsigned long weight)
>  {
>  	long old_weight = se->h_load.weight;
>  
> @@ -4712,7 +4712,7 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
>  	if (se->rel_deadline)
>  		se->deadline = div64_long(se->deadline * old_weight, weight);
>  
> -	if (rel_vprot)
> +	if (se->rel_vprot)
>  		se->vprot = div64_long(se->vprot * old_weight, weight);
>  }
>  
> @@ -4720,7 +4720,6 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  			   unsigned long weight, bool on_rq)
>  {
>  	bool curr = cfs_rq->curr == se;
> -	bool rel_vprot = false;
>  	u64 avruntime = 0;
>  
>  	if (se->h_load.weight == weight)
> @@ -4733,7 +4732,7 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  		se->rel_deadline = 1;
>  		if (curr && protect_slice(se)) {
>  			se->vprot -= avruntime;
> -			rel_vprot = true;
> +			se->rel_vprot = 1;
>  		}
>  
>  		cfs_rq->h_nr_queued--;
> @@ -4741,17 +4740,23 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  			__dequeue_entity(cfs_rq, se);
>  	}
>  
> -	rescale_entity(se, weight, rel_vprot);
> +	rescale_entity(se, weight);
>  
>  	update_load_set(&se->h_load, weight);
>  
>  	if (on_rq) {
> -		if (rel_vprot)
> -			se->vprot += avruntime;
>  		se->deadline += avruntime;
>  		se->rel_deadline = 0;
>  		se->vruntime = avruntime - se->vlag;
>  
> +		if (se->rel_vprot) {
> +			se->vprot += avruntime;
> +			se->rel_vprot = 0;
> +		} else if (curr) {
> +			/* Reweighting must not revive expired slice protection. */
> +			cancel_protect_slice(se);

This is the only genuine fix I see in this entire patch where
vruntime adjustment will make the tasks protected and we
probably need to cancel it in that case but i don't get why
we need a new se->rel_vprot for that ...

> +		}
> +
>  		if (!curr)
>  			__enqueue_entity(cfs_rq, se);
>  		cfs_rq->h_nr_queued++;
> @@ -6297,6 +6302,11 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  
>  	se->vruntime = vruntime - lag;
>  
> +	if (se->rel_vprot) {
> +		se->vprot += se->vruntime;
> +		se->rel_vprot = 0;
> +	}
> +
>  	if (update_zero)
>  		update_zero_vruntime(cfs_rq, -lag);
>  
> @@ -8143,9 +8153,13 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  
>  	dequeue_hierarchy(p, flags);
>  
> -	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
> -		se->deadline -= se->vruntime;
> -		se->rel_deadline = 1;
> +	if (!task_sleep) {
> +		se->vprot = protect_slice(se) ? se->vprot - se->vruntime : 0;
> +		se->rel_vprot = 1;

I'm having a super hard time understanding why we need this.

Protect slice is only required for current entities so why do we
care about it during migration? The set_next_task() during next
selection will override it anyway.

What am I missing?

> +		if (sched_feat(PLACE_REL_DEADLINE)) {
> +			se->deadline -= se->vruntime;
> +			se->rel_deadline = 1;
> +		}
>  	}
>  	if (se != cfs_rq->curr)
>  		__dequeue_entity(cfs_rq, se);

-- 
Thanks and Regards,
Prateek

