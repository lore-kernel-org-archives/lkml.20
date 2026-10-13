Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34AE30C37C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873989; cv=fail; b=eUo2w1ek3DYD+N2IUIQYDBWWDSk28ePD1p60vz9duPG1/vFYakOgiCy/jAfkgWsAXY8//wHUCgBJ4LdauD41pFtFwX8YiSIb7Zv2aWMIqIy+0aIZdZQSyeffa3onzs2kW+K600K9kQYrHIVNfMs8GYJrab/RdyLRgEAofraNcaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873989; c=relaxed/simple;
	bh=KXO+Qp11S6MQtOhOu67ytIcpS/PYL6BnwRVcbI5LTjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=pOKQwOLMZ7LO0TlBrokhuYVN+06cu2OaXi8dOT0ZKH4fKiZRn1tN6b5t9PL3Z3z6VkTaFJpXM3Wi9dJR/159QNUUB6lVp35QKGN7+wyv8emUDpz5CRmaMXBlaIwpCv4Ew5368ydBVP7Ygozas//heEBE0gOwwNG/YdeNcRB+TAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cFberYfj; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cFberYfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVptMspjZ+ETkhTtN3Our8E+tY2Y+0LfAElHx/63weMSmo+0Z+xJZhIVLvI5THXUybf5VWlZVfyU1j6ujdedor9cnZwq8nz5JxmXEq/78CBjFXvu/1UfrGZTNuEpeGG3ITmEYe7Gdc8fwGRthLk9oo12U8dM1p/n3StuhhNTcATkKyPSF6l5JMdM4MPHZh68A7QGNDozoPzEhCugwOtsX/aigXKBp+bBnHjqoM9U4Qx6F5Lco0bwhP1Kymfg+bnKEuqg41HoS+jbVV6h00Pbki91D/xn7EAMFPCWEcaXlAEBv0g2xHZD5TdtcOAFO7NpdSZB3anHBTlAVoEIxU/cmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQM1ZHVC5PAYH0lgB8LcENzuklS91tPLF3mvS2NrYeQ=;
 b=CMaSbqeC2KtqpEyvH2FAyv5q5EpHD/SaCc7mjE/4JQINg1ykBOUiteVT5HZWNr5w4gL8rMWo4Pi6aqYH4Y00eQwXXgqKx7CsOeVDODQxKQasc3YQKSJNpSQzNm3qkk+9mqVWopFdkUoIdVcp/jNkpJO74Nv6woHf4x8TU82Jg0k36jTVhLoFTDR7Rlcpcpva7iSg6+EIfvPiYnKGhyiQcJpYKvBm6ZUkJST1zOJsp0fIVGIx4qrLsFlhKffE/rrwl5HbQuTudBCeuuiw8qeIuqRA16G8AyLE40m0/atYxVz9qxDDJdroRNDF/w/+C+pOQQuP9NlqtKfmaXStQ1bejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQM1ZHVC5PAYH0lgB8LcENzuklS91tPLF3mvS2NrYeQ=;
 b=cFberYfjxMpmLNXySVgZqu2cb9EjIPQ2DRWUrwDhYZf4FV9UeBWZnBjXRZR6yWq40Y/DneaC9Qne0tObRnozgJcPIVwzel7n5Nv11t0BrDOmyy0JUZQmjJry1xgpAFbiaPqKHdkmlbugTHvFjHO/OHqAQrgOXMNodqUMpEBri8o=
Received: from SJ0PR13CA0069.namprd13.prod.outlook.com (2603:10b6:a03:2c4::14)
 by BL4PR12MB9482.namprd12.prod.outlook.com (2603:10b6:208:58d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 06:46:22 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::5d) by SJ0PR13CA0069.outlook.office365.com
 (2603:10b6:a03:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 06:46:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 06:46:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 01:46:15 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 01:46:12 -0500
Message-ID: <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
Date: Tue, 13 Oct 2026 12:16:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Apparent lost wakeups
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<kernel-team@meta.com>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
Content-Language: en-US
In-Reply-To: <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BL4PR12MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: e421f01f-6dd9-402e-af7d-08df28f5b16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|7416014|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	OCqo9+ExDuZNKE1KMBLVYi1i1fBJMFF12fPxNUOia2RbDTylqw2ZPasfCaewLrcqk4BmX4cospJxM2VWiuxNXqfQYvV+KezwKd5bRurrwDRWezF6IyT3k/gNt7wbvdPpBY3Un83XVgCUXvUT5BL8Xw58YdVlyL3HOV5xmCta+8UIzisZ1snJ5sRltdUKZVvsOe6yJaC7clCQ3S0ztfjDTTDN4seBQxLkDypDH3HJ0eqCFDJW6z+D8D3ZZW6oicZzDZErrY3JUz1atyEYUW2qK8BMFh39wVCnmv79NjHz20HwcfK4iEvwsJyc7zUPx83c2GqKlWGFMzQbmwGLx65Yee1DruXwmRv+zaP5AScFddeAgQscAAN6qBWkeEffHOTwlRUp+z80y9KDRU4D7xwNMmwKwbJ6QvlG14ZUclqI7MbOuuoxIKPGaD2+PtzJ7/JFthFdMdMqrTo68Zh4CCg484LnIrpd60K1vCs+97F9+2GCZjFBspRncuPJYPYqVJ6bwWt7vyWE/y+AkeFOC/+GffOaCBNliJ9PhFxWF1jefcnlPk60GoXXHDvIkCVJr+VINsKb/aYTleA3fuRastFVBK5vRGgzkQpmUezvyejCnuE3eTvQCIvbjq/lzEgFHj66mL6Wmvzk+u8RKQxqXF3oSyfel9Evm5xz/aeH78qwAgGxru5XrAudqpm72BGDxWh4WVxp0EM3PwEGjb0KyMTuhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qJ401VKcSO6Iz63eLrk97YQYI0I5jRyTkyGdiNUCvTMDmXyY1XVaMVmuAgJMLurNFW1tIZ4jlpvAPqufv8BshZfpUmQEnjOQQNL6V4TxC8v76UphaEuLZtbZI0tjUvxJGqlQ0AufI1TazIjdJZ7A+tZO1GzJ7niUcb7jvL6meHWzvwuwTDToJWRLoRX/hXerVtQ/ZqzCHU7IHINO9cjArUWX/NchNHJJxkr2Pz4Kj0lFgf+w8QaLqTuex/4rdBqo/VzTaCcwGCNVT66DYLjQXSOGxR22W06BgQPpsNK8Fx5KyyUdnMONvCQGrDsn63IYkoVTq+j+hWaTgiVhEO3jE2pzChp+U9wI/8vwW3E/uZC7wjbAOim2hc2aTmGgMCRKftMQz4ZpGJZe+5Tjo0fQYurVOGa3HvzcwhclG3uRVVbPjJ+jaYzDs+YgBqUUJMoK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:46:21.7552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e421f01f-6dd9-402e-af7d-08df28f5b16e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9482

On 10/13/2026 11:36 AM, K Prateek Nayak wrote:
>> The following command reproduces the lost-wakeup problem, which shows
>> up as RCU CPU stall warnings caused by rcu_torture_reader() kthreads:
>>
>> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 20m --configs '19*TREE01' --bootargs "nohz=off rcutorture.onoff_interval=0 rcutorture.nocbs_nthreads=0 rcutorture.shuffle_interval=0" --trust-make
> 
> tl;dr
> 
> I could hit that WARN_ON() from your debug patch with the above test
> even under rq_lock. Seemed like a missing resched_curr() but it
> turned out to also be related to rq->next_class interaction.
> 
> I haven't been able to hit the warnings with the below diff. Could
> you please try this:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0f63c30b4324..f2f8af3cdfb5 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11239,6 +11245,11 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  		if (p->sched_class->switched_to)
>  			p->sched_class->switched_to(rq, p);
>  
> +		if (ctx->queued && sched_class_above(p->sched_class, rq->next_class)) {
> +			rq->next_class = p->sched_class;
> +			resched_curr(rq);
> +		}
> +
>  		if (ctx->running) {
>  			/*
>  			 * If this was a class promotion; let the old class
> ---

And now that I've finally woken up just like that task, it can be
simplified to:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0f63c30b4324..b37c771c41ad 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
 			 */
 			if (sched_class_above(ctx->class, p->sched_class))
 				resched_curr(rq);
+		} else if (ctx->queued) {
+			/* Check if we need can preempt the current task. */
+			wakeup_preempt(rq, p, 0);
 		}
 	} else {
 		p->sched_class->prio_changed(rq, p, ctx->prio);
---

Peter, what do you think?
> Lightly tested with TREE01 which passes without complains after
> adding the above diff. Your mileage may vary :-)

That disclaimer still applies.

P.S. This is the output I see with the fix on my 512 CPUs machine
and 64*TREE01. I hope this is the expected stuff:

  TREE01 ------- 34879 GPs (29.0658/s) [rcu: g238089 f0x0 total-gps=59806]
  TREE01.10 ------- 33788 GPs (28.1567/s) [rcu: g234153 f0x0 total-gps=58824]
  TREE01.11 ------- 35987 GPs (29.9892/s) [rcu: g245677 f0x0 total-gps=61702]
  TREE01.12 ------- 34864 GPs (29.0533/s) [rcu: g239025 f0x0 total-gps=60039]
  TREE01.13 ------- 34143 GPs (28.4525/s) [rcu: g234145 f0x0 total-gps=58821]
  TREE01.14 ------- 34603 GPs (28.8358/s) [rcu: g238249 f0x0 total-gps=59848]
  TREE01.15 ------- 34654 GPs (28.8783/s) [rcu: g236633 f0x0 total-gps=59444]
  TREE01.16 ------- 34714 GPs (28.9283/s) [rcu: g236617 f0x0 total-gps=59438]
  TREE01.17 ------- 33838 GPs (28.1983/s) [rcu: g233041 f0x0 total-gps=58545]
  TREE01.18 ------- 34119 GPs (28.4325/s) [rcu: g232869 f0x0 total-gps=58502]
  TREE01.19 ------- 34087 GPs (28.4058/s) [rcu: g234413 f0x0 total-gps=58888]
  TREE01.2 ------- 33669 GPs (28.0575/s) [rcu: g231649 f0x0 total-gps=58198]
  TREE01.20 ------- 33240 GPs (27.7/s) [rcu: g228757 f0x0 total-gps=57475]
  TREE01.21 ------- 33656 GPs (28.0467/s) [rcu: g230577 f0x0 total-gps=57929]
  TREE01.22 ------- 34505 GPs (28.7542/s) [rcu: g233817 f0x0 total-gps=58741]
  TREE01.23 ------- 35031 GPs (29.1925/s) [rcu: g239141 f0x0 total-gps=60071]
  TREE01.24 ------- 34771 GPs (28.9758/s) [rcu: g237589 f0x0 total-gps=59683]
  TREE01.25 ------- 33751 GPs (28.1258/s) [rcu: g229969 f0x0 total-gps=57778]
  TREE01.26 ------- 35695 GPs (29.7458/s) [rcu: g244333 f0x0 total-gps=61369]
  TREE01.27 ------- 33001 GPs (27.5008/s) [rcu: g227229 f0x0 total-gps=57093]
  TREE01.28 ------- 33399 GPs (27.8325/s) [rcu: g230181 f0x0 total-gps=57830]
  TREE01.29 ------- 34602 GPs (28.835/s) [rcu: g235361 f0x0 total-gps=59125]
  TREE01.3 ------- 35795 GPs (29.8292/s) [rcu: g243365 f0x0 total-gps=61126]
  TREE01.30 ------- 34129 GPs (28.4408/s) [rcu: g233673 f0x0 total-gps=58704]
  TREE01.31 ------- 34713 GPs (28.9275/s) [rcu: g236941 f0x0 total-gps=59521]
  TREE01.32 ------- 33953 GPs (28.2942/s) [rcu: g233017 f0x0 total-gps=58540]
  TREE01.33 ------- 34353 GPs (28.6275/s) [rcu: g234397 f0x0 total-gps=58885]
  TREE01.34 ------- 34836 GPs (29.03/s) [rcu: g238653 f0x0 total-gps=59948]
  TREE01.35 ------- 33714 GPs (28.095/s) [rcu: g232241 f0x0 total-gps=58344]
  TREE01.36 ------- 34704 GPs (28.92/s) [rcu: g236349 f0x0 total-gps=59373]
  TREE01.37 ------- 34205 GPs (28.5042/s) [rcu: g232549 f0x0 total-gps=58424]
  TREE01.38 ------- 33833 GPs (28.1942/s) [rcu: g232017 f0x0 total-gps=58292]
  TREE01.39 ------- 34001 GPs (28.3342/s) [rcu: g233089 f0x0 total-gps=58558]
  TREE01.4 ------- 35768 GPs (29.8067/s) [rcu: g243141 f0x0 total-gps=61069]
  TREE01.40 ------- 35209 GPs (29.3408/s) [rcu: g239941 f0x0 total-gps=60272]
  TREE01.41 ------- 34950 GPs (29.125/s) [rcu: g237825 f0x0 total-gps=59743]
  TREE01.42 ------- 34396 GPs (28.6633/s) [rcu: g234305 f0x0 total-gps=58863]
  TREE01.43 ------- 33162 GPs (27.635/s) [rcu: g227049 f0x0 total-gps=57046]
  TREE01.44 ------- 34965 GPs (29.1375/s) [rcu: g238837 f0x0 total-gps=59994]
  TREE01.45 ------- 33531 GPs (27.9425/s) [rcu: g229529 f0x0 total-gps=57665]
  TREE01.46 ------- 34167 GPs (28.4725/s) [rcu: g235829 f0x0 total-gps=59242]
  TREE01.47 ------- 34538 GPs (28.7817/s) [rcu: g236357 f0x0 total-gps=59375]
  TREE01.48 ------- 34491 GPs (28.7425/s) [rcu: g235029 f0x0 total-gps=59042]
  TREE01.49 ------- 36278 GPs (30.2317/s) [rcu: g245997 f0x0 total-gps=61784]
  TREE01.5 ------- 35415 GPs (29.5125/s) [rcu: g240741 f0x0 total-gps=60471]
  TREE01.50 ------- 34928 GPs (29.1067/s) [rcu: g236977 f0x0 total-gps=59529]
  TREE01.51 ------- 33065 GPs (27.5542/s) [rcu: g226573 f0x0 total-gps=56929]
  TREE01.52 ------- 34111 GPs (28.4258/s) [rcu: g234373 f0x0 total-gps=58878]
  TREE01.53 ------- 35627 GPs (29.6892/s) [rcu: g242797 f0x0 total-gps=60985]
  TREE01.54 ------- 33155 GPs (27.6292/s) [rcu: g227505 f0x0 total-gps=57160]
  TREE01.55 ------- 34386 GPs (28.655/s) [rcu: g233137 f0x0 total-gps=58571]
  TREE01.56 ------- 35130 GPs (29.275/s) [rcu: g237817 f0x0 total-gps=59740]
  TREE01.57 ------- 34660 GPs (28.8833/s) [rcu: g236409 f0x0 total-gps=59389]
  TREE01.58 ------- 34901 GPs (29.0842/s) [rcu: g236937 f0x0 total-gps=59521]
  TREE01.59 ------- 34915 GPs (29.0958/s) [rcu: g238425 f0x0 total-gps=59892]
  TREE01.6 ------- 35682 GPs (29.735/s) [rcu: g239305 f0x0 total-gps=60112]
  TREE01.60 ------- 34643 GPs (28.8692/s) [rcu: g235361 f0x0 total-gps=59126]
  TREE01.61 ------- 34343 GPs (28.6192/s) [rcu: g234857 f0x0 total-gps=58999]
  TREE01.62 ------- 34592 GPs (28.8267/s) [rcu: g233665 f0x0 total-gps=58703]
  TREE01.63 ------- 35315 GPs (29.4292/s) [rcu: g239865 f0x0 total-gps=60250]
  TREE01.64 ------- 34793 GPs (28.9942/s) [rcu: g240109 f0x0 total-gps=60311]
  TREE01.7 ------- 34171 GPs (28.4758/s) [rcu: g233977 f0x0 total-gps=58779]
  TREE01.8 ------- 33806 GPs (28.1717/s) [rcu: g233497 f0x0 total-gps=58659]
  TREE01.9 ------- 34083 GPs (28.4025/s) [rcu: g237765 f0x0 total-gps=59727]
   --- Done at Tue Oct 13 06:44:58 AM UTC 2026 (22:16.0) exitcode 0

I miss those days where I could just turn around and ask Neeraj
if this was correct at the office!

-- 
Thanks and Regards,
Prateek

