Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59007126BE1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774918; cv=fail; b=FDAH8Nrk7cAqwEm2h4TDvu1mRC6uPlPFyWm4FBF2nlysGUkFNfpu0X9DPhPgsgDA/kNP0cNjPAVFE2LrccJzfRCosOIjlEFUmWty3uPxinPwAyl/dTr3hSjRaiwYAAJ1RGTYU+9qRdcXh84P/JVwz0082zofjNKapzMWmjiHCYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774918; c=relaxed/simple;
	bh=ho4ng9Xi/NI4qYJeBUWrk1EZPi1x6/rBGCea15FgKiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=blmyKYuXIm0suAc1jcvGjufNmBtUV2qP9gX7hqCEbvtbW+/JKF5mjCmQT8qyxq8MQfbuVM9nAmj3pInnflTz1M4C+ymBfEx9S6tD+TZVnHiVPLp2mfqKyiZTFXkJupDjlMmmkJ9Pj5alILGgahneJsaLZjEQi8C9PSKcwQY+cTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MOUlzEPx; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MOUlzEPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhu30hmhAXbfppexixKPxMSLu4dovqhGpWxyerMcNUIQ1+6W9BoLNCl3N0nzev3ph2FL6SAhEiw2n35gAdcZTUmwrr+RYAlkcvsICRFQJv2TrDmh6ZemqbvmCwcdFSlTNUIgWUmyVTR9AjUYTybXD3YWTdFho0gAfXXy+p7hdJPPKjMjpKBnJsEyY2XGTAXLHTLlZHuWQ95MJNwScKiHwT19X4ku+ZDX+0yILVIm6CxoNWX7dcAVHfoXVWZhMqFrFR+OjP+cIaNPB19FOo8E8ObLl+nqMr6NMCWkZ3hU9Ybb4y7g5yHjBROr504mKMvCKkuGIPRzyQ3QpMOgMeDPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mspaR/Ff8oWh05ul9QkNBmdmNXuuLlAJmYr5AKQ4Ly4=;
 b=mYhhX6fylj8lctIQqqcmBFWZ+6vWI4VEnl136Rk19zkFpJNbwP7ACu/2eQkm1/7/O2P+zbwwtJc6RfNcZOSewQxnoD400E3itR37wjJ/2qA6He1RgxLu1EofpwjthhH72Lpdc7cCH4mAnU0BlAO2q/yqVDEz9b1Uga4cVFQf2plYtn7ibPjSc+ny4Txe699UGdqouyRZXw57PqUSLGTxyUKTKeZAmSjKO99HFKiTGT5ekt9BGIygA1Wk6XgPtD9ThHQfVqhL2gyNqh251B+z2Uvw6HR7bAZZGvtFfwMjcondm9h9PXE+wOx8/z+GDr7Kgls2EtLcui/ChWF2srDWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mspaR/Ff8oWh05ul9QkNBmdmNXuuLlAJmYr5AKQ4Ly4=;
 b=MOUlzEPxsHx1ikuWBppkg29bXJO+pxPst+LpyaPdfRHjRru7JuHGGG3rcb0fhnB9JZTXWjBZT90xhg42X3sc9lgdorJX/iIT0NmmDp8J8rTviaBxod2GsAPHHcb18dAaaR7CueFzyHTV9MpS5B5UjWpToDaNH/r3UE4YiZJxFzQ=
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 12 Oct
 2026 03:15:10 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::84) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 03:15:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 03:15:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 22:15:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 22:15:02 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 11 Oct 2026 22:14:59 -0500
Message-ID: <19b982f8-f4a0-4d47-8f56-0779e691f0eb@amd.com>
Date: Mon, 12 Oct 2026 08:44:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/autogroup: Serialize nice rate-limit updates
To: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Mike
 Galbraith" <efault@gmx.de>, <linux-kernel@vger.kernel.org>
References: <20261008064440.240528-1-sh_def@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261008064440.240528-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 49605815-f001-4b49-db07-08df280f062d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|1800799024|23010399003|56012099006|11063799006|10067099003|5023799004|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	fXsX2jThMmyLzcjhUr9GgPd4gLQXFlGjy8+JvFyQHVhMT3BPu2onBLFT67nq1WaSmawjnCcryx0litPy6XyTYzqvHQPigbiQnlzEQa2CYayVvqmUFKiufevVCY6at23XmAK5ULFnpwN1V9O4zMvgXg8AWbcIhjw7qqDUBEtefNfNQ5sbH9y6rBKplwGVED9c3JWneVnUFrWh4GiSsYoIzSuXn6E/07lJ++YAlJ/OPRtIrl1cH3FnNqbzzIudNuRkITyPpOiS/wc2LFRAa3IzR5oUyWGIVTEtdAZJZz0+ebjcIZErcz+sEIGnaR8dJj7TqOMurFp4dcFiuMrwJKBYtrQ+yyU3eBQnX1AMQ5zZifdwZm9xaWM7Ooff+majXcAevRiUI/lpDJUrdxGGjlqUx/I/P6eo4XbNy63BQTpjRmUBas9VmzkkEQIJgjB3kXu72zyYjJxn2s3ACrJl6t0FwcLhZzZIMFCQ/gyHAJIrQNqwBZRpKb6CpkXKtkh2G/OY9VxjlushQF8611Vml4V7/BqKHxHMN6AII+UEnkKYVVYsxHAcPpIKesmZKDvCB/az2znFztB/FqrCJ6Wh+klizzuSDKAOqueNgL0v0elVV0CeMHGCbkPSEEqg0n3wTLgqd4ahWH341S+qNx2X03EvFEBs9G5KcByEm+FZ8ygfz5gmpr/bH4BrZw325k0DEYHjGC2mUNITTQDocboR7iJ2ZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(5023799004)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DcxiZSKR2/ARoZ0DOKf+2b9oNv8aBuMA3RRbhBWtaQdzi60xXc+zRct9OILveyhFy6WptixMGAaNfFV2khr83QU9RtRKYvdr1oMSoBg5Mu+NUHKMDV8chg+lVGaU8BsXq/cZyF2W8MJO6pAE7L87+ywJ/Z+HAyU/DER9OXaAJNkh6G8drYXul1puHuQVxrNzWjSGZ2WaSguKmgi4+e9hqlRyKJ5a+FqDMYr4PZ8bo/mnWoFcqZgibRa0lY3vuW/kFSDY+/VBRiREK9eXWGdqHS/LrnShAWCEhv7lXRt9/ZSbHnvtjUNKe17PEG46rY2s8DSX3mvPp4d5y3Xs9CshPaDR9PkD01htATvk5MhAtRPMIDnhmP5E/Ikc7yNuc8ThyE0emSPArp9qAK0xEkwQMwIHW9Om57cHgy0eiJWCY0w75ENhsz7BeHmQNyKankSu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 03:15:10.2762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49605815-f001-4b49-db07-08df280f062d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017

Hello Hui,

On 10/8/2026 12:14 PM, Hui Su wrote:
> proc_sched_autogroup_set_nice() uses a function-static timestamp to
> rate-limit the expensive sched_group_set_shares() operation.
> 
> The timestamp check and update are not serialized. Two concurrent
> unprivileged writers can therefore both observe an expired timestamp,
> update it, and proceed to sched_group_set_shares(), defeating the
> intended 100 ms rate limit.

Is it really that big of a problem?

> 
> Serialize the timestamp check and update with a dedicated spinlock.
> Evaluate the capability before entering the lock and keep the heavy
> autogroup operation outside the critical section.
> 
> Fixes: 5091faa449ee ("sched: Add 'autogroup' scheduling feature: automated per session task groups")
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
> Testing:
> - x86_64 KVM KCSAN forced-overlap reproducer reported concurrent writes
>   to the shared timestamp from proc_sched_autogroup_set_nice() on CPUs
>   0 and 1.
> - x86_64 KVM rate-limit oracle observed two pre-fix writes within 20 ms
>   and no post-fix pair within a 100 ms window.
> ---
>  kernel/sched/autogroup.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
> index e380cf9372bb..3469a52dd255 100644
> --- a/kernel/sched/autogroup.c
> +++ b/kernel/sched/autogroup.c
> @@ -230,11 +230,14 @@ __setup("noautogroup", setup_autogroup);
>  
>  #ifdef CONFIG_PROC_FS
>  
> +static DEFINE_SPINLOCK(autogroup_nice_lock);
> +
>  int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
>  {
>  	static unsigned long next = INITIAL_JIFFIES;
>  	struct autogroup *ag;
>  	unsigned long shares;
> +	bool admin;
>  	int err, idx;
>  
>  	if (nice < MIN_NICE || nice > MAX_NICE)
> @@ -247,11 +250,17 @@ int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
>  	if (nice < 0 && !can_nice(current, nice))
>  		return -EPERM;
>  
> -	/* This is a heavy operation, taking global locks.. */

That comment suggests we don't want to take any global locks but this
adds one more? Is that a good idea?

Also, any reason this is a spinlock and not a mutex?

> -	if (!capable(CAP_SYS_ADMIN) && time_before(jiffies, next))
> +	admin = capable(CAP_SYS_ADMIN);
> +
> +	/* Rate-limit this heavy operation, which takes global locks. */
> +	spin_lock(&autogroup_nice_lock);
> +	if (!admin && time_before(jiffies, next)) {
> +		spin_unlock(&autogroup_nice_lock);
>  		return -EAGAIN;
> +	}
>  
>  	next = HZ / 10 + jiffies;
> +	spin_unlock(&autogroup_nice_lock);

Spinlock looks too heavy-handed for this. You can perhaps do a simple
try_cmpxchg() and the ones that fails it can simply return -EAGAIN.

Thoughts?

>  	ag = autogroup_task_get(p);
>  
>  	idx = array_index_nospec(nice + 20, 40);
> 
> base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581

-- 
Thanks and Regards,
Prateek

