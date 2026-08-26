Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9A3090C6
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758631; cv=fail; b=jvc5QFCa3ragSupEgR7OJh4XmD+7ruVDMBG69SRNK0a1lgp5PYx5hZBXz5d+aBD/52KXvqwtAOM0JYzEHj9ON7ytnJq7WhVz2Z4ccc+3dDrBDnnlxQLvAgMcKc63G3ZasUZGb1iyrmS3QiOYtQlg+1rzDpu7rnPlk3tO/TZqoHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758631; c=relaxed/simple;
	bh=IDu0UwytdQIBzln2wDGAz1DSO0Zg8wQB5TSmH6oIqA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JIw5hN+O3NtS0Zka1O7onAFEjW6dLv8xD4Vcbh6uAjD+aTPeznhmSWehVjKvXiyw85vRl56Ajb73G9mjitQSy4KEnaOZ0Qm9SHt75yItKPs3WpHI2zKDf4ZDNzFQDj7Lq6w2GZCL7p6ieLxFGwnVuOfPmQjSaw4Ye9N8SyeGfls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e8V7Gaov; arc=fail smtp.client-ip=52.101.57.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e8V7Gaov"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbl3yV1vFR3JfzZ1AF15keWLcHY2BgUhsSurGF6zMJBGCjh0eU0nF1ioJkKU5C+BZe7/1w8wQvWjJNUZYy1dAgRFd90H89xGJ1SaRo40sW3MMaucjaYdvUu7cpniH+9YGM7EjFCW3xlHLOBl8VZgF8yNz+IAVv0bBYSETYy5Z+zBkeOWSr8tjuRVbRIV+JiDqLpnJ63NFVbVLikyKDXcrDn8sikGgNNMknaI97V93J6GEtpiagNy20okApBqpp/KN3YmIMhTk9GcfptKWREqP1aF5VQuvYjqefClhGWOOtVJACQukJ0BhaNcuaLqDd8Tep4pV5RxYZmVDNyNu0OeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=323F8/lTbDidMKxT3g7Y0lMTYGiDoGpj4uyu+N0frkE=;
 b=XanxKpWwKgTAs3gq0frktrtWDdOvsR9b/Be/EqzVR2b7ODhamjEv6azDkW6JuvBeUhvqFb4TOWWTjxjhuh+LXbqc4TDMqdPNH7+CtuI/hYcFtACOpoH8e1t04HEGLl+nMNUP1myJQQzeMXOCKUtg7TcIHnpXF+naQU1UYJvSJ49BBLP5wLFxle+5yMMOaadzKqiiXaobrbxEe/jB2boN/knMIggBO4Xh2kZMeaaQosS5vplKHbsb4iqCXj+8L2fEUNVxvUT6LznoEihDCRZe3Ktp5XNNM1hzzWMe7z3jRMHIBHlA+c7GNz2r1WYorjutTcuYayoaUkY/3WTlGg36eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=323F8/lTbDidMKxT3g7Y0lMTYGiDoGpj4uyu+N0frkE=;
 b=e8V7Gaov99PNu6rQ+hzrkv3zOjlTn5LKrRZZRCCFSTZicen13rwldTOeAVU83gAWPheOrDZmnrIuO5nBUc3Vn3A9l71HHsuJy7zi64sgcHIfskVjfvyMVZuoFRU79tH4UAPf5JKapFlivkZC1v55PRMgLiPoWLjhKIhpv/C4I52ZPjQ8PpoVIXVqcvYU+x6AKCFokhOJwOLABi+OfLwQuULlGweW42SOoAD83i80qMBt8NOb934+ZJoKzvRMdHMha39Qa+qUqcMwpJjNFbfbO/tAsERBK6GqxxxOPzrrWIn307aitpxid/laZs/uTzctcoUeyNDa4HGsvE9Nc5SR6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS3PR12MB999239.namprd12.prod.outlook.com (2603:10b6:8:38c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 15:37:01 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 15:37:01 +0000
Date: Wed, 26 Aug 2026 17:36:47 +0200
From: Andrea Righi <arighi@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: John Stultz <jstultz@google.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [RFC PATCH 03/16] sched/fair: Use enqueue flags for DO_ATTACH in
 update_load_avg()
Message-ID: <ao8IDwpGxcZfegg7@gpd4>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-4-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826062901.2137-4-kprateek.nayak@amd.com>
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS3PR12MB999239:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e3fa22-4c52-4060-8afa-08df0387df31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DgGkIoWWIG+r2FCqhg7FV1iXUZ5U2gjLmITRgtEMfkkANIxpqauIJMNIt4azgVG5E/0jWDDVa5wf+tW6vv7FUSe7SkFikbXF4oPA8YMmjkjkcWzH8TVJP3vyaoNAzuXHodSQbQVbJoOpq0IDNwjD8dw5exLxxmC5SgOk3GrXSmbmiySueQ9QFtCfW5Fh+SViN1m2Zkm4eaJcEWjzzbNvJI67WI+pSMUIOrYBVKoICIdgFZUqmypAFiaRLBcUMM3fuPiaAjs47+/QKOY2CbQImpT/HQX6GOHFn+4zW8S8sLtpLD8NqfHsaeR8Q8gFSAao4LYDbNULL3Mzi09l11U6CmOkY4cUIQqaqFNp9Spj4YEBka/SnIlz2iryBEwaeWmOtp7XLZNfhVBdI/zAeS8SrFJ2gl+um0DVHvZs+NrS7Zw4abOceoK/6cFfKZRZIfdeaulgIpmIQgWNBAlBbQH0UCaDgS5MXi7VKWdGB86+txvwsksTk2eEdtr5AoRW/SjijDE5oF5Zz/IHOR70qlwQ9kBfE7foWSe4qXFQzdsPD7pH2u7AuCYOudqC+ghBJuHhPglBitw5/GALd3hS4J4Nwkhcryl0CXj0UTFbd1DYPHmsWXmohMot0aZYSmNKfiwJT9mZkcqLHCNL7w0t/2sa26BAhjeJJfJuyLFyl12wr7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b1jJlnfG+hONC7zAMWnCNGoSYvgAiMkZZ4xmPTUIReqonsRFYhW/bKNPktuc?=
 =?us-ascii?Q?TByYcCGdr/RKjItnrs2H5RtSEw6a2nKITTbCm+Fbfpr3Ev+MFiB1XKzeqpe0?=
 =?us-ascii?Q?IRe/Gjjm0e1n9FO4o1r5LIT64XvG2SEqThnZvjHkpsexO299WhNJ5mk5q0lI?=
 =?us-ascii?Q?L54EEpO7kwv94KbsHAAnEsVoEsJVEnnt1DSb0mDrDQalYMeZ0SXGJZ13pRX8?=
 =?us-ascii?Q?CGHrPEPxDnZCwblGXtkEsveG26Zb2tyKp87xy97orbUaLY8iGLkgv8I+F+rz?=
 =?us-ascii?Q?0meM+WKyRoUhZj/HBt/HIDHOabNHnRbaWswN8D/R2s9JJ9Pni2hCJHKWPC55?=
 =?us-ascii?Q?RreW4tm3rGffQNfhpOkR43hqDuo20bJ/wilMa7GGrUHUw3KgYzfhRbWlxWao?=
 =?us-ascii?Q?tolVZHlIwhGGcx4VQFjIlVtADDlDVkgjzRkYJsuJt5G2sJHlWtYaZyl6TJNw?=
 =?us-ascii?Q?R1rFRkyoI4OsNHCpTfWwYAJy5iOQqRytr4cFuAFJFNxSkHoYpgqzstViuve0?=
 =?us-ascii?Q?os0ymoYvUQEj44/oEzvtD7WWpv9Edet1H+K9IvRxgABDw3MEsrUZrIK9maR4?=
 =?us-ascii?Q?XsR5UafqqSTZOoQZTlxStuJmrMYcmCluncUvDHVAVyPF4ksHl1JcQWSesCL2?=
 =?us-ascii?Q?DtHkTXq5sz5txTNc+5mkR2kIjqgKIzfbS7OTi3bYreZMqn5QIy5nnUphUepj?=
 =?us-ascii?Q?P3e1AkFepYvg58yg9GMQjnuD9i9D41vhPmivLkDPaqoUuuMxBTeE59qxeadw?=
 =?us-ascii?Q?Pr/BmLFCGM3GJZs7PZgXHUIxjXXJQzMvJ+tHodEANOvl+fJvmufQukENQwuP?=
 =?us-ascii?Q?+NrwZXadtDpKzeZkRxHC79yz5FUWDyhMl5AmGtaKz97hPKG9Ai/sZl9tGYgb?=
 =?us-ascii?Q?G+JAVwM9UtF8KcG1R5EVUgQKgUbtflatAomsNOCL8UWKg1DNJebM8ZEwXZg7?=
 =?us-ascii?Q?FVPePAqrLMWP7iyLdoOh/zQ/5MVr34wmTaYyeJxxnXjnysc7KTvWYoXFHf4T?=
 =?us-ascii?Q?p9zzGit+navmW2c7K3otiYjmmwZWMN2pYFtLb5GfJqyYZlZcx76dwhjOgV8r?=
 =?us-ascii?Q?4koHQBQ0HS0T9rqXJpXfJuK+BVvqko3fd+UKlJVAyxOepIA/wgt++y0ofrGR?=
 =?us-ascii?Q?v3FZXmO/ToW/bBMxVRYEYBIw03UJcPLXME2OgoZqX82obYZ1uW2gyQH5v+Iz?=
 =?us-ascii?Q?ZT7RuVp1nG4y5lwPRvaQM7+RrlUqe3UzSWwKPw1rD8ilpvfpKF1QHR5g4jhv?=
 =?us-ascii?Q?j602xhWCEQ6xmuXZOLpvDspc2NEZ5DNq0B1LbSB2KtL6Au/9bvAQWLzcIbUc?=
 =?us-ascii?Q?TK7tdRW5uI7OxBofS0nOfd/EM4vi7rUfsnxSOVe8/0pbP1xyF+XKFZcSwr3N?=
 =?us-ascii?Q?IyvWEnQDZJIoilRItpaaUcgkfNM0MvTsl/5Biir6b/Q6BSQAso4PuJycPDTa?=
 =?us-ascii?Q?a/OGPNz645v1TMQKQRiGjo/5grRUPkx0qVDBzZ38ewK96e+dBJZegQBmeNJa?=
 =?us-ascii?Q?4WCxZuL4mF8B7NZFnI59nOKbdW0t6cHJroXbKGRZNeFcr/Amcgssx7Q6EuSW?=
 =?us-ascii?Q?PlyXW0P9SO3VlSNPAKGk7veRkcA+ZD7E0kBcCVWgg3Su/qHksf2GLdktzS99?=
 =?us-ascii?Q?fMY/t3C0R/pzGbHbQcS1TzrBh6T4ZLGkrKuHpspwrg1Hj1cQnPdl8Rg6aBdE?=
 =?us-ascii?Q?Rxp4UxrtbDx4qkDlmgYx5ezqcvN82UJ3RF/sjmUx+YzlDUT8esXvFGo+eLqt?=
 =?us-ascii?Q?3EA8vvOMFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e3fa22-4c52-4060-8afa-08df0387df31
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:37:01.1982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SGhHcCF7aE8w72wZoECSkW4UCPvK4Flq5h7/kVcUX3ZzY0y7J0PwEHloyeBYnWZjsFA+FK3PA2Cfh7tEVAMcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999239

Hi Prateek,

On Wed, Aug 26, 2026 at 06:28:47AM +0000, K Prateek Nayak wrote:
> proxy_set_cpu() skips calling ->migrate_task_rq() callback for blocked
> donor migrations and can lead to incorrect PELT accounting.
> 
> enqueue_task() -> update_load_avg() depends on migrate_task_rq_fair() to
> clear the p->se.avg.last_update_time and use this as a gating condition
> to do DO_ATTACH which is skipped for blocked donors.
> 
> Use migrate instead of se->avg.last_update_time indicator for adding
> DO_ATTACH action. Add a defensive WARN_ON_ONCE() to catch any cases that
> are not covered by the MIGRATING | MIGRATED | INITIAL flags.
> 
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 244f1c68c041..ed397c259509 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5654,7 +5654,7 @@ static inline void update_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  	decayed  = update_cfs_rq_load_avg(now, cfs_rq);
>  	decayed |= propagate_entity_load_avg(se);
>  
> -	if (!se->avg.last_update_time && (flags & DO_ATTACH)) {
> +	if (flags & DO_ATTACH) {
>  
>  		/*
>  		 * DO_ATTACH means we're here from enqueue_entity().

nit: the comment below still says:

   * !last_update_time means we've passed through
   * migrate_task_rq_fair() indicating we migrated.

We should probably update it, perhaps:

    /*
     * DO_ATTACH means the entity needs to be attached to this
     * cfs_rq's load-tracking sums, either on initial enqueue
     * or after migration.
     */

or something along these lines.

> @@ -6110,6 +6110,7 @@ static void
>  enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  {
>  	bool curr = cfs_rq->curr == se;
> +	int action = UPDATE_TG;
>  
>  	/*
>  	 * If we're the current task, we must renormalise before calling
> @@ -6120,6 +6121,11 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  
>  	update_curr(cfs_rq);
>  
> +	if (flags & (ENQUEUE_MIGRATING | ENQUEUE_MIGRATED | ENQUEUE_INITIAL))
> +		action |= DO_ATTACH;
> +	else
> +		WARN_ON_ONCE(!se->avg.last_update_time);
> +
>  	/*
>  	 * When enqueuing a sched_entity, we must:
>  	 *   - Update loads to have both entity and cfs_rq synced with now.
> @@ -6129,7 +6135,7 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  	 *     its group cfs_rq
>  	 *   - Add its new weight to cfs_rq->load.weight
>  	 */
> -	update_load_avg(cfs_rq, se, UPDATE_TG | DO_ATTACH);
> +	update_load_avg(cfs_rq, se, action);
>  	se_update_runnable(se);
>  	/*
>  	 * XXX update_load_avg() above will have attached us to the pelt sum;
> -- 
> 2.34.1
> 

Thanks,
-Andrea
