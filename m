Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C94A64C8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007329; cv=fail; b=MMAuvM0tRcHbB04ZwQSDmBYBj/yVqlpyYIb3JsjVY+59W2tSNYr2h/QSDhvrGG103JEakCEVZoUSNZJMjsSh9UyxsAggE4cjsaUftv1SUCof2RBO5VCqNyzR4B87cWvmixPs2ilB0YQFP7zgd5DUb6id95RaLReVMbT11K+CEWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007329; c=relaxed/simple;
	bh=rxFK9hpqzY2P0ftltikr68LkfT8GZ0PcJgeGG9jnzt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JRz9PcLgUNAYzEl/8lSgvhdnU3lmxw24kes41D9PvuZ2xXwfi2hLuqH/jOWf31IXI+oRlh2sRWd8sH5jHHpiu8GeqQgK16YT3O9T0uLRLu24ptz/u/ELi5ftpH+f9WdTlJ6e5CbeQyVUnZ45KiTeJbqPK4Ox9fEuuNGtJeAFIO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c6pAeeGU; arc=fail smtp.client-ip=40.107.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c6pAeeGU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCzDIP4lM7KVSkvXcL9TTQsDi5X5tlYW5mBNmR8RAteWCBPXA7UQ21p4VFanMdrrUSSfgMthptBpUu3XRugtyjwUUlpzM2Ofprgs0VsONh83GLaE3iLIYecrznBDTqD4jJRpCsuFAKxcTnQb1/mPnrG6jrDdqrcOreMxar//PYfjP+JwiEKpMnsEj+B6EMZBK+bkqygxa3+LHlVNz4swUWQO56FiDFSLNX+z4UdEHhT+mZ94I1WHq4FXWj7xN/a8pLKlAtqR53MCfoVaEcsufMiIDE4OiANCTR53Vye1DhOFYt+CCb9qgUZS7NUv745RqPWuaU0ULm09BM4WHYxP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StIQYOQWmcjlhOCxxcP1v0z8T5szsP+3x6gE0lOEHKU=;
 b=t7V0ttx8ljN1EBA/8Zka7bgEB5I/LETlkeBRZnk+/YnSgaU3vANDygH7N/7K9hQJFhIGWONqyydH+R6iHlCuiBwOgBVCTbu40WgNXBN1iYLgOr2aw8ImOIhp66Pf5iBe4mT0NjXNcHmJAID6TDBMBDOSh7700NpOCYJkw6umlmzJIvBimJdyGWUdDoAk5I1VGR5rUVLZWQGWRLEBp4TswcIe+ivtji1s2njN8gjk/nGdtmHwTuueDx7RMSjwU7eWZ5VAtybHsAj4P2sJK3xULbam5pRgZ3j3cJbh7Utl4oICCuuhlLxaFrXM89KzMv7+ieC0GBxlbENDyZFBNdi0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StIQYOQWmcjlhOCxxcP1v0z8T5szsP+3x6gE0lOEHKU=;
 b=c6pAeeGU/0SGpwqtNkhB6r+4FlgleOt5KHVWz++x5a/Fw0Siu8OlK0ycZDjTIuTOV3YnQZl/eR9ATBgZevouANoYZwThf5D3jSxffYACQ3NQDFyHoUnOOhLhxDcyF+utSueeziC4sjng4AFuPzVEEwcV9ZBrYun79D4hj77xdu8q/mGOTVGyURNgSJpckVDD27a4D31v8OfbAbkV0tnaNYmYc8TEUE/WhZkJtEOiXw/iMvJMnkxJb+tEe2uUBeUclzsjLWBgztfM1Bo1kVvMnxt+OhK8m0TgCfzcKwUwIrlspPsqut9hrIJa4Nijwp1jCIH34DGHmzoMXRFSCbIGEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:15:03 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:15:03 +0000
Date: Mon, 21 Sep 2026 12:15:01 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] sched/core: Make fallback CPU selection NUMA-aware
Message-ID: <arFYBf58i6J35SLZ@yury>
References: <20260905033656.311477-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905033656.311477-1-ynorov@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb94d6a-b264-4bae-8abc-08df17fb7e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10070799003|921020|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1U3gvXpqujArmBcTUo8pZyi7gfB9so7Ga5NPZ9hU4Tk89WP+DeZzB45CrAMjfCw3UgFaBhHDw0B0gdcOh1nm1iH+AKyv5lF7MXV1h2YrKe2EOrUT9jDj8JK8Lb3xwaMYnquXfmOulE3wJYICDz8PToTbjttIoW4piIk9U+jFJdhJF8etJpYufrCs5mbuq+i47ehOGU5Wg44kCQo9q1Svuj7OfRf8oxG1nRI5A59ZCv5du5YoB0U+2AUDfgIeyHZ9I3k5QYRMFg2z1apR/A8o/BnTPIoBDc1babofpfgSeA89wzutLIY1UJ6+mNSpIsSHYomfUZv/6URUPzR83LkBjuYg/IJqW1EuExcYwPYxHowLe6XaiDnf0rlcFwo2Dl/Dx24MRqNNs5d92UygfxOa2SkMETuLgBM9R92bDToMNAh/pOrDLgpwbVVf9dwSLZnCeUhtMnyk9sIXbC46mDnuoROVBYKZVxfEZ66ou4/6pLad4nlOSFiJkzfY2pCqteDJ9FETRYwUaZb9ZtgDe7Rvm1QP0Hf5TLB42HsiD3kP2ttMI8dAPNgCAEV0Z3oBRzIkn+0AMJjE3BEcCmqR6Oa1sl99imiLNcq9Taiuaxr2bRP+iUOKt39nBKY7o7Vb9vONFAtG2hdTpYAEtL+AazrwiOJ5gCVluKhenYZDwTCGPhouuXKitbe72FL7LLQFfHy0opTM0o6/GuxIc30JXiWyaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10070799003)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S13uWAW8HkoS4B4RLKY5AlIAmIGZ3LU0un4c8m8kmUSwVvglpnRSfGlOIxyJ?=
 =?us-ascii?Q?3GBMWUfNkz8x4ejjIWi1Lrzu1tfwg+vvyzrQ2dU/kfdidLJ4VVNV/kHSNxPU?=
 =?us-ascii?Q?jCJxG/4bw7dRlNNQhfRNk3AKvaydv2w1Y03xQksZjo9oUav43Y0NP7nLnvba?=
 =?us-ascii?Q?P1Zhg7yhHOPCGLQ6xSPNBZMy7ADjolUbOxgl+Nbbay+FCmFjHihyR/uz4sOu?=
 =?us-ascii?Q?YorLYI3cUxXjbmMi4TKyKiToISMuvw8IVFA+cBRd6TU9kAXLoLxUkmDJBYeI?=
 =?us-ascii?Q?AJMTzMhEor+Z/Y4egOpObPhZ+0aa3gefji/alsxFv1YFTFCCpqRo9L134NpG?=
 =?us-ascii?Q?qT4QFBz5rw/tbonC8+7Ls24d4tOzDh3g9RUtzNsPB4Z5F7bX6/xLbjMgDDBC?=
 =?us-ascii?Q?7tVpX3Yh0iHx2mcvieZez1X37gDwb/u6jLGbctsUIA+hbP72i9PSgcfrXcDR?=
 =?us-ascii?Q?NeDIkJXfloxLl7OJsgqKLAoW2Ad0FQUfEhXs8Ri26P6GDCwGXV6s1+JqaCMb?=
 =?us-ascii?Q?cPHka8prmQYtINiwzlBqLYpDfACEMiXt9KlnpHZeWgq+YBG5ekwmO++aKZN0?=
 =?us-ascii?Q?awBh8JLf+HaefZ3V8cLuRIw5dyUqDj///0cwm4EihH6ySUkhXzSEtaPXmG92?=
 =?us-ascii?Q?xVc8IvoKjpnC3Tx+vL8sOcDVVFQsgZUbrguPU9rwo5D4E1Ld+Nma9O6ksuTx?=
 =?us-ascii?Q?fMVAhDkrDrx+1yVyZijXbggUTy3QU6EyvbZkQ19pZYSTQyVajjx0LXWWYbNf?=
 =?us-ascii?Q?RSNBELs9O8glbhSX6FiCVfaKJq410VXjcGxRPg5xzaq85CZxrb34wM3Tc66E?=
 =?us-ascii?Q?13HF8QNvpz0tYgoVHZJzcQrv8RlL1Zj24dqSg5Kbcc9XFhGahxtAbzYdsUtO?=
 =?us-ascii?Q?bDh+0wXNdxdo6p7AL8izfDwog/AzpMhe5w90vbQ/NHB/Ywl1JSvwuY6AQEGL?=
 =?us-ascii?Q?zuRi+kuuHotQVJGxec/dtQpRw8jbI4SZKKtyQOmC75ukJxTwtEki+RjbeKrr?=
 =?us-ascii?Q?QwyvEoD3bHLfj9hds8WV5Dgvd+kyZkrTLChJvfBD7u/XqKCP9NrmjCp3XbnS?=
 =?us-ascii?Q?SiopJuLVzRd00Nrh9lrWMIrm8gexP08kDCBs/S9MvocLr53hZT+AbQRpheGD?=
 =?us-ascii?Q?F72cgGk/JxFNX+g6SIxseBg/rYSUWrmlkfzywljYF4goOC6RamD31RXDOvIq?=
 =?us-ascii?Q?rEcJbRL/sdhi+fYO2npA5RbxDuaqmb00xW6vZ09CbS0eNwBRsYJznWQUy2Z5?=
 =?us-ascii?Q?gM2LpkEfD+HlL1/K+hMwukKGioIPoaCmxyOB2IqgUUHZ4L6l/bzz2T0FxiJ+?=
 =?us-ascii?Q?razRWzxopDt0YwAjAgC0z6rkFTzwG0q9/tf74LygPmH+VtvhaOi31xBPD3vP?=
 =?us-ascii?Q?1fGxnRD/Uf6ps1Wg1Jf26q2Lruks9tWXZlzOke4DGp63wwT8fyzaexCLLKsj?=
 =?us-ascii?Q?QLd8TkIXztYZK6XpazwzjE8RtUqTHe3QKiYrxE+TOVANisKEpPMNp78kmKdH?=
 =?us-ascii?Q?bmGJWJie7NUEFbp/s394xXFnZwz9JqNM/lfxu0wkIAjS7akeSDYh3rK32Sdu?=
 =?us-ascii?Q?3HV1FRsKM5TRGvnC8rd9IGpbw1Jssd+FrlTg4wF7TFM1WpTSkwie2noPIJdZ?=
 =?us-ascii?Q?0ishqXm/67u8WC9fNXjEs7btnh7+Et2pr4FjNR0vEGadtiEV/Sohkl+XHenr?=
 =?us-ascii?Q?KFafkCkoJVhGrhKu7whVLGwBczES8oKzRhSnbqsxn6EPNwZklTJCeSMwJRhQ?=
 =?us-ascii?Q?6jAAKV72NvjXBKgdULh/MzfsAdbWQE176PK9z6CEh+4LXLhglXyufgbmrcat?=
X-MS-Exchange-AntiSpam-MessageData-1: ZSGP1QEFJRBaEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb94d6a-b264-4bae-8abc-08df17fb7e62
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:15:03.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DQ1Et+bvv4IZWIgedsr42Sm17bQqenGv2h4e5Z+O3m1VE0yVN8bGaj5lEaoTYMA95rVV2BaUir2PRvcgEa+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579

Ping?

On Fri, Sep 04, 2026 at 11:36:56PM -0400, Yury Norov wrote:
> select_fallback_rq() checks the local node first, but then scans the task's
> affinity mask in a numerical order. On systems with more than two NUMA
> nodes, that can select a CPU farther away than necessary.
> 
> Walk the scheduler's NUMA hop masks and consider each newly reached CPU
> once, preserving locality across the full fallback search and after
> affinity relaxation.
> 
> The NUMA masks can be unavailable or incomplete while topology is rebuilt.
> Search any online CPUs not covered by the masks before relaxing affinity
> so fallback selection remains reliable during that window.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  kernel/sched/core.c | 47 ++++++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..2155bad0e1ab 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3554,34 +3554,37 @@ EXPORT_SYMBOL_GPL(kick_process);
>   */
>  static int select_fallback_rq(int cpu, struct task_struct *p)
>  {
> -	int nid = cpu_to_node(cpu);
> -	const struct cpumask *nodemask = NULL;
> +	int nid = IS_ENABLED(CONFIG_NUMA) ? cpu_to_node(cpu) : NUMA_NO_NODE;
>  	enum { cpuset, possible, fail } state = cpuset;
>  	int dest_cpu;
>  
> -	/*
> -	 * If the node that the CPU is on has been offlined, cpu_to_node()
> -	 * will return -1. There is no CPU on the node, and we should
> -	 * select the CPU on the other node.
> -	 */
> -	if (nid != -1) {
> -		nodemask = cpumask_of_node(nid);
> -
> -		/* Look for allowed, online CPU in same node. */
> -		for_each_cpu(dest_cpu, nodemask) {
> -			if (is_cpu_allowed(p, dest_cpu))
> -				return dest_cpu;
> -		}
> -	}
> -
>  	for (;;) {
> -		/* Any allowed, online CPU? */
> -		for_each_cpu(dest_cpu, p->cpus_ptr) {
> -			if (!is_cpu_allowed(p, dest_cpu))
> -				continue;
> +		const struct cpumask *prev = cpu_none_mask, *cpus;
> +
> +		/* Look for the closest allowed, online CPU. */
> +		rcu_read_lock();
> +		for_each_numa_hop_mask(cpus, nid) {
> +			for_each_cpu_andnot(dest_cpu, cpus, prev) {
> +				if (is_cpu_allowed(p, dest_cpu)) {
> +					rcu_read_unlock();
> +					goto out;
> +				}
> +			}
> +			prev = cpus;
> +		}
>  
> -			goto out;
> +		/*
> +		 * NUMA masks may be unavailable or incomplete while the
> +		 * topology is being rebuilt. Search CPUs not covered by them
> +		 * before relaxing the task's affinity.
> +		 */
> +		for_each_cpu_andnot(dest_cpu, p->cpus_ptr, prev) {
> +			if (is_cpu_allowed(p, dest_cpu)) {
> +				rcu_read_unlock();
> +				goto out;
> +			}
>  		}
> +		rcu_read_unlock();
>  
>  		/* No more Mr. Nice Guy. */
>  		switch (state) {
> -- 
> 2.53.0
