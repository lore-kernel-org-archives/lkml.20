Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54D37F306
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501612; cv=fail; b=sH9puBFH2OrrFpHhvBtGGV0ngUt9xJ/qdkR/dpYOnyL/5VAJu40VxvDKsFISluc3GAHz8asGauxOiDcwK5q9Xg0uXkLpxYmfrX6ZX7FynQ0OO0AxbIylrAFSilk6ctLlorIUX0dKlmctwHDRUWZmzsrqnHX3inHlQM5YuEHqA48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501612; c=relaxed/simple;
	bh=OLhjw228Hl9/P3OasRu/E52MZ+ICmenY5q6T+aW82wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gEW8bka+upDpKAay3zDwE7x227q8c8ETHrSmsvEybqq79ueYvd0vUbJGxk2K3OBwQFqrH1GlUBBKZEbtYdQTvoA3YBIgKT7Qv2IBBv6XAMkhW8i4+LfftrY31l4KBG5jGWAFix8jV0zKBn9DVNxudD1RlagZtpBfeIzBF9IO7oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kst/fsiP; arc=fail smtp.client-ip=40.93.195.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kst/fsiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyhkSXydsF9/yyLHAVzdPQIZou+gIM4A5BBOKouKPf0N82jixxAL/+lzIWa0HJH62zr/SXasAB9gy+yxhAaxY737itTTFbTv/sqD/vMG8GQ8FMbwkHodUefploJ6rdm+JdK/Oi2qa1P2W9j4+B03dqdQT5jov0zqNORdJzyebP9G8fQzpwxnpwMy5uzc3JFDUFYyn3W6qt2bHwzDEIDfludC2I8QZT7Ohyd4etMBGh8gUTXV83PHbztcJv3P44P3zMjhU7pbvmwKO3OK7R0K8S7ScNcnson7ucSoWH71KwqKjZSPM8t6Y7ZsKY3fl3J8mYhUPHbiUNMWL7c+d5rKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcTFQN1rU+yVDqs+DbeIWP6Mt8YoqyAzCNZA5icbtPo=;
 b=tLIJyir0bzWrxmvXRKdSbfPhpM7MMk8i5sbOejVlhlx2oqFGAK7+u2KK0OgmjG1uqeTFmW6lMUXl/GTAUTK0cOrYq0W2UBT7dqNB6dJYC21dmlxAaaQBuSpjLyHHLN4/FNuMoLFEf8OL3uvVF4uDavyxbBUvU+JKkz7QwIHGMsmVZILyu0gnZZ73qVA6Ig746ayWFRXROCz/yDdjwSdV5yV+EHo/1lkJPZL9KMIA7xS8kVY+JgJyiIO4vjZkZga7Su3qldcfoBi6A5FC6KOOb9nt27iz1g7+CyKvHgtQ0siuWB81V6+7f7leBHd+XKrwZhQTtcDKq9g7sdFP7c1BHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcTFQN1rU+yVDqs+DbeIWP6Mt8YoqyAzCNZA5icbtPo=;
 b=Kst/fsiPOZdn4zYa6bqxZEurhXkwLu1M+kl84rheaP+7kU7Vs+pBF86BubKJQqOgbK/6m/MyAVCyolIRglxi8iLj9jPZiWUcs3hu2hZ2M5YWuoDL4FSkVPcp9Gjfx36eLrRGm3m9ZFtyKSb1+Lw4kV4ie6J1KTZdCcnUEQ8YUnw6hcmbVKlN8Sg6oSFiVrfAxvsBRMCMuVcUyJYuY7xvh2bK/qNkRDkkEBunhAT5rNA1NLg4KCIhUScfdkQqb6izjORCu49G6NEZU/5bQ+2uE8LgPhURrGfcrC2eXefGGdrQH1n9G3cgH8XQR3NM5ViXZ9En2+JeUGh3YeJW2ROa5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SA6PR12MB999200.namprd12.prod.outlook.com (2603:10b6:806:450::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:00:06 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:00:06 +0000
Date: Fri, 4 Sep 2026 07:59:52 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <appeWCqxApU8NmuP@gpd4>
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-3-arighi@nvidia.com>
 <0d02e284-9a07-4f54-bf63-8edaa5e224e5@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d02e284-9a07-4f54-bf63-8edaa5e224e5@arm.com>
X-ClientProxiedBy: MI3PEPF00004E9D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::454) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SA6PR12MB999200:EE_
X-MS-Office365-Filtering-Correlation-Id: a65c6682-64c2-45a5-f3ac-08df0a49c4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jmqhSji0JHrD8wsnWhCavCXozg14A3KRU2cOf0ng+oGXQKPbhol9b9s/Jj0NsyiNVFNDkE3qUtSYdUewGKnKkJilzlwzfQ4BhT7mBG+GOJxACwsx83V7HsMTHLcm8OanlmO99Fqt6OprYkPwmQHoEasZBiRQSQql+o3F1OttZzP+8A/8CutEODGf2D5o5TNL8Icfpvy3qrYRu5C3EDJDbRm+g/J2dErB8mw3dVpKlR75KFBWM24cR8QMx0YXltsF56ncgokCjWUqY8X5hMawdVhW7zGObQL4VDY4KAcsM94QjuVyNezIwIIca5qSGRKo059ChAFD7p7fxNB01MUCu24y//7RQ57KPqqQAoeXLEVkGxVvlHLNEYhNy9ETJr1BG27FLFDdiYOv7z5Sgy6sfPi5d6ZyJ4qUB8B93eUHaGTUjCXN5SMz/QXU2x02PZfUjhoXjtBAervxTveCBcAOnOEdXSJYysJYZFYwP/gY5jm8jodzP5NvjNQXKzKocEa2LBXIL9NZR+CF7iD9YrRxxZEiCNlifmXhqRTsIL8UelrGfY4lxmO/HyDD7JfyIptqbqAe1L04WDtWihJgfWnyfiWSlN35elRjCdQIg6Ptn50uOWZ4QYFMVKS8OTWowlU+b3w6Ui0OKfJKF1ZQjc97gyXyx7aSiGJT3efYWqzeJKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fGo6hSmBmkYTjrbMAvp8+UKxjUlRLVQNp0J+wVninHy1eY2cfSwRRq0RYEBw?=
 =?us-ascii?Q?4zZyIHvgJoPV/FTS9AVRfIZm+ObdQI8VnKVQnKZQOJOVQ2xNMAHnBuuuvJN7?=
 =?us-ascii?Q?kavrkOVWrvSS40tSiGZKNF3vZra+4NTuz6SQl0Rrby7znlCCe1OK8FszwG0P?=
 =?us-ascii?Q?Be6DQTW75OyfBwPpMtrxRpKT6qKvo3tdQCL1TO9CME3LDcen8HZuSvOo0NPQ?=
 =?us-ascii?Q?BGHgAK7iS4n+yqaGX9WwJLQJA0WII/Q8pTzDuoSwc6FQN3h4cZwQK4Ikoat7?=
 =?us-ascii?Q?aaZ7sFndYmHBxw3p6DkENvhUvGQlQ59tEFkYDoOWpPzhEJO44u7UvgHXLVhg?=
 =?us-ascii?Q?7k1wWd1CqZcce9pwRm+i8m+BeZmRydVgCmFbo2wsCtS6O9ftoTTOgv82pfeS?=
 =?us-ascii?Q?48nzm3Gb2Gal1XM9485VC+BSxsW9xLyba69fvXlCxzTqZRwZa000dE/Mie4s?=
 =?us-ascii?Q?6XVUL7rk+S9SjEGQdousXHzIgt3WZmeV/2WxE2XySqD0Xc+5I+zKcm2+uJcw?=
 =?us-ascii?Q?2GNoM6Vjns6+V2XvtJRVD+rtwKaqBAoh/9n7FV2av5OS9hOyyj2A5++DhULS?=
 =?us-ascii?Q?S5JFurMixjnCeZ/ZGnqwKbErAtxBeVVptMwg+3HLcv3yqZ7C5nJheSK5mumQ?=
 =?us-ascii?Q?M4BhnmKGcrWKRI9hAzUHsBj46F8SRxt8ievC5F3Y9FlSriRRnR/IaVRGjusI?=
 =?us-ascii?Q?Z1LfrhIN/Z+nPFPjRbuwohyQntH58lbTJZZST33xSOcIMriIVCepBlhT314I?=
 =?us-ascii?Q?ftIs9p+oArwMOR5GBHOAJeMb+Uov16lb2Ck/amyaKKD6Bl1XcEBQk802Oj+C?=
 =?us-ascii?Q?Cg8zUFmfQ8HsKevCn7f0dEBvziBqj4XBRbDjE0cdYQxwp8s+D/VgG0SCYzt5?=
 =?us-ascii?Q?sLuUKkEUeaTwO6haqG8lwxokYmw9WM0ReUa7ANVfYPhjAqfKGxfFwEuXXz0z?=
 =?us-ascii?Q?qdBlmpLkN3rD7akHJ8Jr/ZlT+DwYwOBj+wQaEEkjPigkR0f8DGebPZ2kDWPG?=
 =?us-ascii?Q?e3PG+0IFgCGK7Sz3RN6p3tY4eMb8ccU8deBs2JuKBXYBmixuW9U9S1z1sXLj?=
 =?us-ascii?Q?nkMAodqcvdRIXm/3RTwsKjdaX709sh2sbEkDvsNw7cjayGrDUb676o/IAGES?=
 =?us-ascii?Q?hfz6113OgaE//zgPVPER6fCx453IGZXsnvWhz6qP7oHtRkc7TAKiixg49XuB?=
 =?us-ascii?Q?XcqF6mEVzT9FO5vMfS09NT0Lnx8fL8D6ZcR+ZzoW45Grpwx78yucTiHSu6i/?=
 =?us-ascii?Q?kBPlhTufz1bczWIjfULmVC7Ts4chb/SRzEsarFMMaLX69iaS5EccH9VeNsNN?=
 =?us-ascii?Q?P3IWGMU2KLl9xcFZm19/OxsgxMrpWbBQDadFNW2tbyyEyBJYZgs6qJ/yxGHU?=
 =?us-ascii?Q?g3x+bEGTq5O0QUp0zOTQQqP5+U5/AROCnf+RdmpBupaw/6VICkPcNJPuiPOU?=
 =?us-ascii?Q?GzvfLgBSbEtIAW2GiaaL0ZS3iTakzvYyLrdcMMf0q168bSuq7xQ3p9iM4Rnh?=
 =?us-ascii?Q?ap+KIydSwIIKHy3Odt/lszGAo385O3Rt87UdfpbI3G8onIyoItgiTqvFwJmb?=
 =?us-ascii?Q?1ThLvBDIE8Yt7SiWZUX9QCT1yiyIBwCoD4eLIMs6jMeNmIjqeROSXMMf37Um?=
 =?us-ascii?Q?dg0CYp225TH5tHnnYrnOFZcX0yu1aaLVufzxlDBsb0GuK6dBdcjNM9Y70EmY?=
 =?us-ascii?Q?XnqXDeVSjmAyeAxmDE4QBUHp06ItA/H2Edj8xhQl0DGEFgu6kM90gjJnhDyq?=
 =?us-ascii?Q?3RvlMXS6wQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65c6682-64c2-45a5-f3ac-08df0a49c4c3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:00:06.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCUtvlV1Lj5lCWySXACyckZvGQ1Xqv646ufaDamSdfzj9ToP3fPFjoUte4eUC8MpHYe816ahCl+IUiv7rAIBWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999200

Hi Dietmar,

On Thu, Sep 03, 2026 at 12:59:59PM +0200, Dietmar Eggemann wrote:
> On 31.08.26 20:10, Andrea Righi wrote:
> > SD_ASYM_PACKING orders CPUs that share an SMT core, but idle CPU
> > selection does not consult that order. A task can therefore wake on an
> > arbitrary sibling and remain there until load balancing corrects the
> > placement. On SMT implementations where changing the active sibling
> > repartitions core resources, that initial choice can cause a large and
> > persistent performance loss.
> 
> I assume this sentence refers to Olympus/Vera and Power7?

Yes. Olympus/Vera is the platform motivating this series, but this is affecting
POWER7 as well, since it's also using SD_ASYM_PACKING at the SMT level. I'll
change the description to make that scope explicit.

> 
> [...]
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8dff37059faf7..3c49aa63742cb 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8587,6 +8587,65 @@ static inline bool test_idle_cores(int cpu)
> >  	return false;
> >  }
> >  
> > +/*
> > + * Return true when @cpu has a higher asymmetric-packing priority than @other in their SMT
> > + * scheduling domain.
> > + */
> > +static bool sched_smt_asym_prefer(int cpu, int other)
> > +{
> > +	struct sched_domain *sd;
> > +
> > +	for_each_domain(cpu, sd) {
> > +		/*
> > +		 * Only honor priorities declared at shared-capacity SMT levels.
> > +		 * SD_ASYM_PACKING at higher levels may describe core ordering.
> > +		 */
> > +		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> > +			break;
> > +
> > +		if ((sd->flags & SD_ASYM_PACKING) && cpumask_test_cpu(other, sched_domain_span(sd)))
> 
> Looks like 'other' is always part of the mask?

It's always in the same hardware SMT sibling mask, but it's not necessarily in
the same scheduling-domain span, isolcpus could split siblings across scheduling
domain, select_idle_smt() has the same sched_domain_span() check for the same
resason IIUC.

> 
> > +			return sched_asym_prefer(cpu, other);
> > +	}
> > +
> > +	return false;
> > +}
> 
> SMT will always the lowest SD, so for_each_domain() is not necessary:

Agreed, walking the domain hierarchy is unnecessary. I'll use the lowest domain
directly.

> 
> static bool sched_smt_asym_prefer(int cpu, int other)
> {
>         struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> 
>         if (sd && ((sd->flags & (SD_SHARE_CPUCAPACITY |
> SD_ASYM_PACKING)) == (SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING)))
>                 return sched_asym_prefer(cpu, other);
> 
>         return false;
> }
> 
> [...]
> 
> > @@ -8668,7 +8727,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
> >  		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
> >  			continue;
> >  		if (choose_idle_cpu(cpu, p))
> > -			return cpu;
> > +			return select_idle_smt_priority(p, cpu);
> 
> This one is weird for SMT2. AFAICS, select_idle_smt() is called when
> there are no idle cores. So if you find an idle CPU this is what you
> will return anyway.

Correcdt for SMT2: once the core is partially idle, there's only one idle
sibling and the priority lookup returns that same CPU.

The hook is useful for wider asym SMT though. POWER7 uses SMT4 with
SD_ASYM_PACKING at the SMT level, so a partially idle core can still have
multiple idle threads. In that case select_idle_smt() would otherwise return the
first idle thread rather than the highest-priority one.

> 
> I guess your tests on Olympus/Vera do wakeups via select_idle_capacity()
> so you haven't touched this one.

Correct, Vera also has SD_ASYM_CPUCAPACITY, so the scan path used by these tests
is select_idle_capacity().

Thanks for taking a look at this!
-Andrea
