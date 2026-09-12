Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022103.outbound.protection.outlook.com [52.101.101.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9840A28B7C8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174837; cv=fail; b=QE2SfccDrRFuWYOr2XKgYd6uOxcYTMYgHKXHpgj572qBWFElMqPyluRDkzFkUO3R5gxXWX5/fGAN2uWF9I9ef0UmOnBznSgaSvpP2e1p0GjY7Hq4PE5pT4EKWhUm++98mNmucR6HY44O29MFHoEUKCzS750F5yY7nvr5Lxi/e/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174837; c=relaxed/simple;
	bh=w9p0sdZv8B7Q92XRhFc+S9/49j6Doe3GgqLRqL5/uxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M+YtYGW0dI4LRbY53hYM4KOtDxP3JVAX89OOb4+R8+SL34I2q4/T0fKJdREW3AHlh1sRyOqNaQMyXWZliI2OowIFQvnkoaLQU1q6Y+H51Cv4cWQTGKxYpSiVkog1nEq0maq9e8F/SZx/DMb1xWK71DXjLDgIvD8bMXWAwxdbxXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/84ttKrx0Xfe2tSrO4tNgsq0zwv56SpbzaZZ2191AdjqwJizQmOGyaGciRX5XDJg4WcnZ9hN3N8+gPvzlxhO7dmP9He/CJDkq/OiijvbMzCADfnfxrcPpbxFUf1L3ngxmNlDw6i8Th6/gMFhRiPv6S8OSkoiRwWOK1wkG7rQhy7qLiYO/eSafg78oX2n4wCHolONbgHMcbRlFtNQ/0f0I0WCBRAxViwcWhNViDvCjtgSMsWGzJSnAfAs/Wx5xezdBMJjDm1G0+xPerg7Jc4PES4E5jMNyfgIxN95SZTYHMSPWxJJlYq3NXP898pVF8g9mDG5j5cmrxjEMkGjwAboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=LHWt9MpNXzPcnN0Ox8SwN0xuQkB11QxFa/tjzru4AbM=;
 b=kSbDUV9cdJQaGZAf63vVOGvsjHoV8RSURRIvJOQtyGQzD0NWOIePKk45uC1MLuwIv/dXCAEvRYDNr+6uyg9eJmwvX1850GLx/DpIR7NAF9k44GqWryvJFGewrYqR8hcGF+cXyn7sXKqev3ekz04ihH6f/16+tf/XhEJTEaBSkUcz3GBwYYSeou4aEqiWzRM+7TycMjoqUHKnwGSZOmQUpWy6HJoibCextawBJz6Gk3gwryOdcgiFnJnAt1vU6woau9bdqVS6dqsfh3RaVnF0bzI7P78Y+1yw3+fyCuLSgi5Mba23O7l5XeWxFqHGO3IODcQciZvd8KLZ64MRh1ftRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB6476.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 01:00:31 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 01:00:30 +0000
Date: Fri, 11 Sep 2026 21:00:26 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: kernel test robot <lkp@intel.com>, peterz@infradead.org, 
	akpm@linux-foundation.org
Cc: akpm@linux-foundation.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, oe-kbuild-all@lists.linux.dev, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, feng.tang@linux.alibaba.com, pmladek@suse.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, rishil1999@outlook.com
Subject: Re: [PATCH] sched/debug, sys_info: Introduce SYS_INFO_CPU_RUNQUEUES
Message-ID: <duj4ijalt7aef7523les6sfqsf7ryhq5quwjoekrtkigws6iyb@2i7ufubk23ws>
References: <20260911022844.521413-1-atomlin@atomlin.com>
 <202609120421.J3jtss6v-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202609120421.J3jtss6v-lkp@intel.com>
X-ClientProxiedBy: BN9PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:408:f8::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 929c9850-1835-4cbd-12d9-08df10693d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tRqLQweC9sjRHYF6qwpA/upeI5AH47MK2NVyup1klcDNC4XWxC0dKTasxS0zD1A28TWQEAF9Fpp8P2LZbZSuQ3FR2E5gD3plmcNXSuX48TNsNTvwz6NNuQz76img9QWmN/hx1sVFFQ7jpj9r6kD5t4n+ZXxsipBC1fZ7r41OWxhU+uRmRB/stEqmDOTil0tYdKRNVwKKn2edtwFjrm37Xr3I/pl1ux5wC3dC+xMlW+w3wvFFGAAkays886pVroZtpKBjuCknWZcS+H6z24f3Dbq9H/YjyxmIQJapoxXL/ChgnKwMvSH6L4MjHC5T6orsrqwD7l7mdGU1CP1r9qkoUeLFWAaw3JthLEm0ZG4MUo/n1kavmnzSQA7q5kz+jacd5n/9LLBOUkEA5AETrRWuXREJ0lOPj0gUnd7DM3eHe60BWLJrUo6cqSS+9Xk5N2mmMrzCZHRHFosHN+GrNWyetWgl+Svvv6i05JK7bnp/yh1ION2G306ia7Uv5bhya8vDw+Iqv9SJue+rFpN90Pws8UZhP8xO0nDDRbhnybvClEaPJ5Fll32NaAJwn6VDp2xU9XXnXhTxHgh2yFKYWcZMucNRDOiXLw0jhpkralxB00TMFAumy7Fvkrp56CYoXROe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkNVWFM1WHJvSjZXMWtEVE83Q3JTOEFoL0NsZXlOTEFJTjZEK25oZ29BcVla?=
 =?utf-8?B?R2UvT2QwQjJySHh1dEVJMzh0VFlNRU9yT3dyREhBTlpQRVFoN05nbi9teFJh?=
 =?utf-8?B?bXRnRWM4S3FiMDlKOWlLT1IxazFxbysrWUVzZ3U0RkxjSzNSQmd2bUM5QnIy?=
 =?utf-8?B?RmR1M2M2YTNuQ2RMVGpPT05FYjY2TUc1OGZhdUZwVHM2K0JxSjJiU1VFUkM1?=
 =?utf-8?B?Z1JhMEo1ak9aZ2xmRFJIbmp6azQ4dkJMeUJSQ3FPc2xxNHkyL0hPWlUzbHFz?=
 =?utf-8?B?Sk0rOWdadGhPNmRNWlNlam44TkxReFFlNHFtUi9yeEhZRWhscW1na1JpOTFK?=
 =?utf-8?B?SGxXaFVlY3FOTmUxUmJjL3VuWDRGeXBTMUM4dTNBRERHZ0ZPS2xqK0JLZGc1?=
 =?utf-8?B?OGRObStVeWUxSnBXNEdtRGtTcUZRTXB4M0kxWVhPNVdFZkI5RlhsbkhxQWNv?=
 =?utf-8?B?RFd1Vis5VzBDdzZxaGJjZlBnUHU2c3BoZkhGUkZ1M2NQVW5IZ2FIYnc1YUd0?=
 =?utf-8?B?U0crbjEzMTJUbUVuWk9jZjlSbUVZMmdmSVNSZmVjUTRCVnRJSFRKZ25BUFRh?=
 =?utf-8?B?bjhmNFlVaDBlbWFvWHJyb3BzQkpCZWw2eFRMM3Arbk5DYnh3a1NReGVVOGFP?=
 =?utf-8?B?MFoyZG9FYk9CejJUaExCN2xia2NXdDRPMGdNbVJqL1V6UW1nR1ZrcVdQckNm?=
 =?utf-8?B?b1N2dk9LdGVQVXZmWmxSSUhYdVd5Z0wyN3dOMXNZbmFuQ3R6b1phM0cvUVA2?=
 =?utf-8?B?VHpnVFFGaE1hdm9PQWVSeG5SZnY2N2VEcGFjUUk3WlF1bGhHa1JWdkRFeU8w?=
 =?utf-8?B?OE0zWjFEckVOVWQ2RkFLd1ZGSGJXMEJQenlZZGtTcGVXNFZaQnNvV1RPeHBC?=
 =?utf-8?B?N0QxSlFZU3orK2VrS3VmNXJFN0NHa1lPNXBRTmViRnUyZmJmeUhMWEFFQWFj?=
 =?utf-8?B?ckdtSDVlUmJ1Um8xUWNkNDdtcDJtUklZQXlwKyswZnJuQUlYR0YvY3J2c29i?=
 =?utf-8?B?Sjd3L1NRTVM3TjFQdXNidi8vNys4Vitsdng4Q0pPUXB2KzBqZ1BvYVdiQmF5?=
 =?utf-8?B?UGQyL3lIZ2pIRmp4bEFmcjZPaUFxL0FtYjJOQjJ4VlBCM1hMTlZHdCt0TEFt?=
 =?utf-8?B?WVh4VVVLVjhMR2ZraVRkTEJFLzFyRVhqY3NTbG9jYzdXSWFPdVpQOXNLejh5?=
 =?utf-8?B?THk3WWpRdkZsOENRQ0N1UzYrcXlrQ0x6emYyeFN2RmdUQkdaamlSd2lHMlly?=
 =?utf-8?B?L0ZjS214cWh4cHJVUDlpbDhCWUp0dmZWeFA3NGppZXJzYVp2WWsrOStNL3RT?=
 =?utf-8?B?YVBTMEZiZ3djVUUrcFVtWU5pQnQxRzdYd1ZTVlVXbHJxbUxYcmhoNys5ajBz?=
 =?utf-8?B?Z1gxR2E3ZjdSS3dnN1lzUWJ4YTJnWWltVTRYL0NhYnNkYkgvV0pndUFGVVdR?=
 =?utf-8?B?VFhwc3luNG4vUURBMU5ZY1FZU2pmakxQVWh6RXNXcW1CQU1GUzRQVkEwYjla?=
 =?utf-8?B?M3R2ajhUVzAvb0YvYmtBMlNna0pkNTBZYkN4YWx5cStESElxR3dLVGRxZVZL?=
 =?utf-8?B?OUdlVDErTzI1bmRJTG1JaU0ySFZNcWJBZXFFcWh5THM3WnF1clNiaEx1UU9w?=
 =?utf-8?B?d2xzalpBVCs1blNQTU9aYmc3MnJVTFJaWTlrY2RRUk5GbDRUdjZwZDlGeVRt?=
 =?utf-8?B?STlhM2dnRWNFb2tHUVc2R3gyN2FFZnpKWE1Nang4WjJxaUN1aFFVVXhLRThr?=
 =?utf-8?B?TFIyTWJzdHhFcDJqckxTN1NhcHhXNFBmMktlZi9FeFlaUFFpSll4Nll5aFdP?=
 =?utf-8?B?VXcrcjFFWHpMQ3YxSTBoWDFjb2RPbFFmSFNNZUwvZFJFQi94dTJLQmtXaUc3?=
 =?utf-8?B?eHgvWVZEMzlzSU5vZTNlcUoxaVpUc2NHOU9taWNRNnlzMDdUdlNyV1VsVUpq?=
 =?utf-8?B?WVIzT1ZybDR0RENDWnJURnFhUmlZbXdvRlFIdTVJdzhwaE9QQVROdHVrWmto?=
 =?utf-8?B?eFc3L25tUm1sYVZLMnRMdFQzd3dDdDVmV2lnRXpaYzR4UW5pVnc0MTRrR3hX?=
 =?utf-8?B?OW00VmMvZzR0UFl3QWxDN1A3M2hWYS9qS0VSU0I2bWJWSC9HT0NhV0pxRDgv?=
 =?utf-8?B?K01LeC9UcWQxaHFIUG1hYnlCbkc3WVpLdW5nZ0taN0kyRUhtelVPcnJIZE8w?=
 =?utf-8?B?MGFYZ2R2UVd3SG9aRXFYb3EwcVZYSmVGd1FVTEtTZzN1bDRKcUg2M3NzS3py?=
 =?utf-8?B?RHBjK3RSZjdPZHFlZENIK1E2QlIvWldkRjRXNDBsNFRDeDdVMlVra1lEbFFL?=
 =?utf-8?B?WCt3aG5lYUhjNjNqU29HbXZRSWV4MnNiUE9oTmdjK0Vlb3JsRWZrUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929c9850-1835-4cbd-12d9-08df10693d93
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 01:00:30.4039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lysbFBXBQHoPPmWgxvvh35bV4oxJQ1f6QfsQR3cnf8UNqumbGdqP1yRxDqHohFb8RgmKGzbcNx2rRTX5oRcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB6476

On Sat, Sep 12, 2026 at 04:45:18AM +0800, kernel test robot wrote:
> Hi Aaron,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on tip/sched/core akpm-mm/mm-nonmm-unstable linus/master v7.3-rc2 next-20260909]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/sched-debug-sys_info-Introduce-SYS_INFO_CPU_RUNQUEUES/20260910-222844
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260911022844.521413-1-atomlin%40atomlin.com
> patch subject: [PATCH] sched/debug, sys_info: Introduce SYS_INFO_CPU_RUNQUEUES
> config: microblaze-randconfig-r132-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120421.J3jtss6v-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120421.J3jtss6v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609120421.J3jtss6v-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    kernel/sched/build_utility.c: note: in included file:
>    kernel/sched/debug.c:868:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/debug.c:868:17: sparse:     expected struct sched_domain *[assigned] sd
>    kernel/sched/debug.c:868:17: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/debug.c:1220:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>    kernel/sched/debug.c:1220:9: sparse:     expected struct task_struct *tsk
>    kernel/sched/debug.c:1220:9: sparse:     got struct task_struct [noderef] __rcu *curr
>    kernel/sched/debug.c:1220:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>    kernel/sched/debug.c:1220:9: sparse:     expected struct task_struct *tsk
>    kernel/sched/debug.c:1220:9: sparse:     got struct task_struct [noderef] __rcu *curr
> >> kernel/sched/debug.c:1355:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
>    kernel/sched/debug.c:1355:30: sparse:     expected struct task_struct *curr
>    kernel/sched/debug.c:1355:30: sparse:     got struct task_struct [noderef] __rcu *curr
> >> kernel/sched/debug.c:1360:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
>    kernel/sched/debug.c:1360:30: sparse:     expected struct task_struct *curr
>    kernel/sched/debug.c:1360:30: sparse:     got struct task_struct [noderef] __rcu *
>    kernel/sched/build_utility.c: note: in included file:
>    kernel/sched/topology.c:118:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:118:56: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:118:56: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:137:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:137:60: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:137:60: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:160:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:160:20: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:160:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:470:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
>    kernel/sched/topology.c:470:19: sparse:     expected struct perf_domain *pd
>    kernel/sched/topology.c:470:19: sparse:     got struct perf_domain [noderef] __rcu *pd
>    kernel/sched/topology.c:654:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:654:49: sparse:     expected struct sched_domain *parent
>    kernel/sched/topology.c:654:49: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:753:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:753:50: sparse:     expected struct sched_domain *parent
>    kernel/sched/topology.c:753:50: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:775:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
>    kernel/sched/topology.c:775:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
>    kernel/sched/topology.c:775:55: sparse:     got struct sched_domain *[assigned] tmp
>    kernel/sched/topology.c:788:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:788:29: sparse:     expected struct sched_domain *[assigned] tmp
>    kernel/sched/topology.c:788:29: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:793:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:793:20: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:793:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:826:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
>    kernel/sched/topology.c:826:13: sparse:     expected struct sched_domain *[assigned] tmp
>    kernel/sched/topology.c:826:13: sparse:     got struct sched_domain [noderef] __rcu *sd
>    kernel/sched/topology.c:1069:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:1069:38: sparse:     expected struct sched_domain *sdp
>    kernel/sched/topology.c:1069:38: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:1076:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:1076:21: sparse:     expected struct sched_domain *sdp
>    kernel/sched/topology.c:1076:21: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:1223:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1223:70: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:1223:70: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1252:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1252:59: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:1252:59: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1298:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1298:57: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:1298:57: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1300:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1300:25: sparse:     expected struct sched_domain *sibling
>    kernel/sched/topology.c:1300:25: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1308:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1308:55: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:1308:55: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1310:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1310:25: sparse:     expected struct sched_domain *sibling
>    kernel/sched/topology.c:1310:25: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1380:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1380:62: sparse:     expected struct sched_domain *sd
>    kernel/sched/topology.c:1380:62: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1484:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
>    kernel/sched/topology.c:1484:40: sparse:     expected struct sched_domain *child
>    kernel/sched/topology.c:1484:40: sparse:     got struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1620:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:1620:9: sparse:     expected struct sched_domain *[assigned] sd
>    kernel/sched/topology.c:1620:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:1877:52: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:1877:52: sparse:     expected struct sched_domain *[assigned] sd
>    kernel/sched/topology.c:1877:52: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:1987:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
>    kernel/sched/topology.c:1987:43: sparse:     expected struct sched_domain [noderef] __rcu *child
>    kernel/sched/topology.c:1987:43: sparse:     got struct sched_domain *child
>    kernel/sched/topology.c:2791:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
>    kernel/sched/topology.c:2791:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:2791:31: sparse:     got struct sched_domain *sd
>    kernel/sched/topology.c:2919:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
>    kernel/sched/topology.c:2919:16: sparse:     expected struct sched_domain *parent
>    kernel/sched/topology.c:2919:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
>    kernel/sched/topology.c:2921:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:2921:24: sparse:     expected struct sched_domain *parent
>    kernel/sched/topology.c:2921:24: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:2926:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:2926:16: sparse:     expected struct sched_domain *parent
>    kernel/sched/topology.c:2926:16: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:2931:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:2931:24: sparse:     expected struct sched_domain *parent
>    kernel/sched/topology.c:2931:24: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:3008:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd_asym @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:3008:25: sparse:     expected struct sched_domain *[assigned] sd_asym
>    kernel/sched/topology.c:3008:25: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:3143:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:3143:57: sparse:     expected struct sched_domain *[assigned] sd
>    kernel/sched/topology.c:3143:57: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:3165:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:3165:28: sparse:     expected struct sched_domain *[assigned] sd
>    kernel/sched/topology.c:3165:28: sparse:     got struct sched_domain [noderef] __rcu *parent
>    kernel/sched/topology.c:3191:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>    kernel/sched/topology.c:3191:57: sparse:     expected struct sched_domain *[assigned] sd
>    kernel/sched/topology.c:3191:57: sparse:     got struct sched_domain [noderef] __rcu *parent

Hi Andrew, Peter,

Thanks test robot! I will fix these __rcu Sparse warnings
(make C=2 kernel/sched/) on rq->curr using rcu_dereference() and send a
version 2.

Kind regards,
-- 
Aaron Tomlin
