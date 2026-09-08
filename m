Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BF3360EDE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845893; cv=none; b=NtB+7fc+HHAjEQSaUokoouuDbU/9gp5Z4ikhiOesJiFeZWvWjZEMS4i4iur1WL4zOugdmac3ZAGtfoNYlsihAf6pq1Al1bjD2O01ukUqUt/moZRvTIKWFJmsQkxIatHUJh3s/7hYb+L0XSpUlv/iE7q0E3n5qNZfbMXzqshUfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845893; c=relaxed/simple;
	bh=Nw2bUXEhIgzwt+KTJ0jT1hzN1QvPEajyXGGVutLPo3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/8uqblu9Ygarp/7QFCqA+p6EcrETtZ6pEesvBjjKRrHziZGqMlJpwzrjJPL7ma/wDDCO5WDFgSttzTDHABeuhhhKhog+NGWjiNg/Fogfo8fEVI+ebubF/4I6MttfSxOOczdeVOQPpqeyD4jYXQu0EeT06TRuQ+umFFrh1LXv14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=buE+VSKb; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="buE+VSKb"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68801aR91497716;
	Tue, 8 Sep 2026 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=yusK1GLJkuHtFYH9FNjx6
	0TQgqSJBWEnCpjtMIXjOjI=; b=buE+VSKbgSMD6g6f3Rdx7Jq/xCT06FUToaZX5
	y2/qt6ZhMBWxY5ErwuSKK1tfgfQOY3m98bilWZu0KxX9D34JcyjGDjUWYtCom0j1
	IF0rXoNb7/mIiNxE9l3NLL5Z29hE3wrn9mIwdRKEJNxc2XJtYASj+VUQ85MP1FL/
	56/58unrC/NHo17cyJJMxES9b64lW6g8+DTvpp8HnhStTZyQTxrs9QL4eC1vaeV2
	NMkFL5iFOWHQFR96AI0pRRsawuFuRVwKHw8eucP5LMfv3kT4NYPNz6H8CjMRBM5u
	91dioEY1+mrrIWE/fbUf3iFvLGTwavK5HVkcl7yiRfwJWoyFw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbqjvqsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 05:37:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6885WeHw007099;
	Tue, 8 Sep 2026 05:37:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gh03y9ncx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 05:37:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6885bQEr42008832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2026 05:37:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97A2A20043;
	Tue,  8 Sep 2026 05:37:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0214620040;
	Tue,  8 Sep 2026 05:37:22 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  8 Sep 2026 05:37:21 +0000 (GMT)
Date: Tue, 8 Sep 2026 11:07:20 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Loehle <christian.loehle@arm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
        Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <ap-fELvfw5w51vbG@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20260904091838.3617894-3-arighi@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: CaVTNGGxtJ0bg2J2w_nOG3SVvBRKrlWI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1OCBTYWx0ZWRfX3UY1dD1FOEl6
 v0dCTtsj3vGk6AA6t06lvrSncAR1//4ktdCcgvuGxhBNluEgBrp8om6QoLsUKGD+L31129FmiQ0
 50e4q6S1lejSDcXlpFlngUvMPO20pog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1OCBTYWx0ZWRfX7x9/Eq07pS4/
 gf8/eG7UtwKDaYVEYxNBqpDAZNeZ/CkiOHur0LutwPqZTQuxw3c5GRMe2qrvIGxxWjcVfXP9Wjj
 HhznisE2ZSqggEk/WCDapHSNmtZdCIJnpr+RPR7dBNSqlp6UY26q2ar+aHIYKyzJxplXjc7NClk
 qwf/aOAtAzKzZrH8Dy26AChhC+9VzCAnjsmsO31g5roZpybGY5c4of6rQ/2k2V0st2EDKZM6SPp
 vVgAxgMyBJThJ6+kho3jr/1MvETuU+LbfjMgOgKG28lhpe3KDG7GPAuPGXf9u3nEe+580/YnWBe
 slx8Z30wuq3T1k/dIxenLNC0m3CLRxtxaREl08zM7q1qkKwljfdOFDJ8NU746u8DU7MY09VvVn4
 +VGDhoujp0duB3pteLe9iowsyLTjFKlq82zfsStnhnlgYWIFnURRDsXqYaJLqakeZY1MjwQrLCy
 qFfE+bypq9vipn8wMQw==
X-Authority-Analysis: v=2.4 cv=JaKMa0KV c=1 sm=1 tr=0 ts=6a9f9f1c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=Ikd4Dj_1AAAA:8 a=4-HSefmEYn3nOEH63QwA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: ZjH3vp9F9iZIvdTmjp0Vfpi1ZhErps9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080058

* Andrea Righi <arighi@nvidia.com> [2026-09-04 11:18:05]:

Hi Andrea,

> POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity
> SMT level to order hardware threads. Idle CPU selection does not consult
> that order, so a task can wake on an arbitrary sibling and remain there
> until load balancing corrects the placement. On these systems, that
> initial choice can prevent the core from entering its preferred
> lower-thread resource mode and cause a large and persistent performance
> loss.
> 

> When idle selection finds an available CPU in an SMT core, choose the
> highest-priority available sibling. On SMT2 Olympus this only changes
> selection on fully idle cores. A partially idle core has only one
> available CPU. On wider SMT systems such as POWER7, it also fills
> available siblings in priority order while the core is partially busy.
> 

Don't we need changes in the slow path too?
Something like this?
https://lore.kernel.org/all/20251204175405.1511340-2-srikar@linux.ibm.com/T/#u

> Apply the preference to idle-core and idle-CPU scans,
> asymmetric-capacity scans, and the target, previous, and recently-used
> CPU fast paths. Inspect the lowest scheduling domain directly, but
> require both CPUs to share its span because isolcpus can split hardware
> siblings across scheduling domains.
> 
> Keep physical-core capacity selection independent from SMT sibling
> ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> maximum capacities, then SD_ASYM_PACKING selects the preferred available
> sibling inside the chosen core, whose siblings continue to share equal
> capacity.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  kernel/sched/fair.c     | 79 ++++++++++++++++++++++++++++++++++++-----
>  kernel/sched/sched.h    |  6 ++++
>  kernel/sched/topology.c | 36 +++++++++++++++++++
>  3 files changed, 112 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b1..ff9a7b1fcbe7f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8587,6 +8587,63 @@ static inline bool test_idle_cores(int cpu)
>  	return false;
>  }
>  
> +/*
> + * Return true when @cpu has a higher asymmetric-packing priority than
> + * @other in their shared SMT scheduling domain.
> + */
> +static bool sched_smt_asym_prefer(int cpu, int other)
> +{
> +	struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> +
> +	if (!sd)
> +		return false;
> +
> +	if (!(sd->flags & SD_SHARE_CPUCAPACITY) ||
> +	    !(sd->flags & SD_ASYM_PACKING))
> +		return false;
> +
> +	if (!cpumask_test_cpu(other, sched_domain_span(sd)))
> +		return false;
> +
> +	return sched_asym_prefer(cpu, other);
> +}
> +
> +/*
> + * Return the highest-priority available CPU in @cpu's SMT core that is also in @cpus.
> + */
> +static int __select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> +{
> +	int best = cpu;
> +	int sibling;
> +
> +	for_each_cpu_and(sibling, cpu_smt_mask(cpu), cpus) {
> +		if (sibling == best || !choose_idle_cpu(sibling, p))
> +			continue;
> +
> +		if (sched_smt_asym_prefer(sibling, best))
> +			best = sibling;
> +	}
> +
> +	return best;
> +}
> +
> +static inline int
> +select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> +{
> +	if (!sched_smt_asym_active())
> +		return cpu;
> +
> +	return __select_idle_smt_cpu(p, cpu, cpus);

Nit: I see __select_idle_smt_cpu called only here.
Cant we fold __select_idle_smt_cpu() here itself.

> +}
> +
> +/*
> + * Redirect an available SMT CPU to a higher-priority available sibling allowed by task affinity.
> + */
> +static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
> +{
> +	return select_idle_smt_cpu(p, cpu, p->cpus_ptr);
> +}
> +

nit: Can we also replace select_idle_smt_priority with select_idle_smt_cpu()
itself.

Otherwise looks good to me

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

-- 
Thanks and Regards
Srikar Dronamraju
