Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241915;
	b=cfXKqqZd6HkHBLHXOtaRkSi4ngENS0Zhzal1nQsbGFNi0KI4ALaUBQV+jUELtfuK0DUF
	 frByX1ZDR0Ks5k5hFZXW0ajcScWLJfovPkiyN7GLGz7+URefs2BAwAG8JTUkXBeAnwJvg
	 NGVCBsCNPexBihzG/aD5N2qEib9NRQd114AfPBWdZVvI9287gc797QCDx0XDNuGzmsP+t
	 FM2ckHP793IhMK5HkKL1u9WTrzJbs7AndjWoxKa3xMS1VDfAtIpOEoRfKinokbo/O3n9e
	 HEH4CsGIl4btuj7AzCRqeAQhBo0ECv9IY7XifyQmBEdyPUn5e0qlii+NNpop0dX14Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cC8Knec1eAFusLhNOT1vTwheQqNmj28MpQavO54Yc4M=;
	b=vjV+QJzEewRdiVEwdvEf3konBW7LnTeTdS6MHWGMk7MagT8yRKO6xxr5BSnTQH45JSs/
	 +q+fARmS+MBeCTDbBO0OGxfsi391zsiaYx6xRjf3acLf2H1mPppRYNQgRJdOQ8cuKcx6X
	 bt+pfgxguTryYimS+F+pNj3wHNWSpIRnAngi2rnUeP0uMgNNMQSy7iEJUth8rHlcVPh22
	 u60+oT9K1YYUz+3JB81WVS/Ta1wmwFVa6qv9Z9LmV/Ok7Djl0MrJNeBFmB+m7eyZx/jT/
	 OwVQCQ+XJA6v9h6ntI6wUfKS9t85huaVUUmlN3ubQLIQ8JCvgmZJj9e8CCAMKnnNccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zmfaaylz;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D759606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D759606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zmfaaylz
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FliLZ3699949;
	Mon, 9 Nov 2026 16:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=cC8Knec1eAFusLhNOT1vT
	wheQqNmj28MpQavO54Yc4M=; b=Zmfaaylz8/JoSiDENqHS0ta4S0oDRTa1mVLAr
	4FhFjeiAC/LbRKhoTpKwMZ1wdf5EY5LtjzaLk7144dVNaoE7QKuoqJ+hYPwHv7Y1
	PaFNZN7DLps8GIgOfAKl+ZZGdCmI7ug+cEF0O6DDfL+38Alyxvn9sZ5UQGnPTIPn
	CHbdIg8+55npwIqEhj8xpycAGv4iRzYs+fJQ/GSu0QTTv7p9IEYylzc/9SPcX1P7
	3cb3aU7Hhn6k/i4R3yZK4Ev5lhvEGZvWv24M1sGHclzUY4fKLR6IAHKmHsl8wKma
	kHwh+sO8GzEtYsQbTNJrJQvkbRTguh5thcXf6vvgXCJ5z6jQA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsug5y44q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 16:31:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FMajY131322;
	Mon, 9 Nov 2026 16:31:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hth0y12qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 16:31:25 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A9GVOLK56164830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Nov 2026 16:31:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF58D20043;
	Mon,  9 Nov 2026 16:31:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EB7420040;
	Mon,  9 Nov 2026 16:31:21 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon,  9 Nov 2026 16:31:21 +0000 (GMT)
Date: Mon, 9 Nov 2026 22:01:20 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>, Mel Gorman <mgorman@suse.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] sched/fair: Skip sched-domain traversal when wake affine
 is disabled
Message-ID: <avH1WCeG9_O83U7N@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20261109120522.1704752-2-srikar@linux.ibm.com>
 <avHZrLRHmIgRu-a7@scheduler.schedules>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <avHZrLRHmIgRu-a7@scheduler.schedules>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: MFmnQqHy2P4qL7R9AKuFkwwxfU4qWze8
X-Authority-Analysis: v=2.4 cv=PeVqFShd c=1 sm=1 tr=0 ts=6af1f55f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=YfObRLfLxTv_Q3oL8oMA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: LxZ4sigawLdwxIQoI0BVIxScvKKt3t30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NCBTYWx0ZWRfX2IHrubZ4Iwl2
 338TlUAB4uhoRgONIUlrdauYh9jJEvkZxfAJ7kLwcly3HaAwaTGccZY4/DsYjp3iVjv0DPCwoNV
 p0a6idhjgZuB0V7Vuav5mbrK0kXbj6oeWBt5RayudfU+JQP6msIdXoE/Z9YFSWQnjZ2sTm2fODz
 Nz8XkRY4eTX44C0QdWNeIalPJnLCaS4wFnby3Arj4cBb/ONX3axe8AoqqYn5mfR17NPlpHLN3GW
 UXCRm7ZLND77RLvrFhhoGHeX+IJHaweMaLT1fNioisQPWr6m2JVt8xgRQcu/HYEhYF4BiU1PecE
 h2iJgkVzyZmTmGIoUYxrk+nX73Ynbpt7Xjm7cy9J3uv3hhchjB4DUHIf/qh2YcqYkVuEXJyMsaz
 LZq5zc9hA7Fau3wqtyQtrU99VPlhj9EdcjNcyrMSQ9tZrWqjRN05NvUrs4W6ukVEKFDAlS1Y86b
 6HPWnRwwbOX9Ma6Babg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NCBTYWx0ZWRfX6aBCO0ppfOlY
 UaVi6UqS10lUtlZshbsU67BOtDKkghARiiKfpfpxkXyYsoGtKWfLCbwYhMrtq7L51Q1CVAigsu2
 6OYJnmyYPX042SfoXgqDl0RLh4hiX64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090064

* Kayra Cizmeci <kayracizmeci@gmail.com> [2026-11-09 18:09:56]:

Hi Kayra,

> 
> On Mon, Nov 09, 2026 at 05:35:22PM +0530, Srikar Dronamraju wrote:
> > In select_task_rq_fair(), TTWU wakeups for which wake_wide() returns
> > true, or where the waking CPU is not in the task's allowed CPU mask,
> > want_affine is set to false.
> > 
> > For these wakeups, the scheduler does not perform wake-affine placement.
> > The existing code already treats this as a fast-path by exiting the
> > sched-domain walk before locating an SD_BALANCE_WAKE domain, ultimately
> > falling through to select_idle_sibling().
> 
> Not before locating. If it doesn't locates SD_BALANCE_WAKE in the first
> check it just leaves.
> 
> AFAICT SD_BALANCE_WAKE is not set anywhere tho.

from kernel/sched/sched.h
#define WF_TTWU                 0x08 /* Wakeup;            maps to SD_BALANCE_WAKE *
The code searches for WF_TTWU in lieu of SD_BALANCE_WAKE.

> 
> So if you wanna do this, maybe you can do something like:
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4cc0caee626..b40b2eb5e577 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10016,6 +10016,9 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		}
>  
>  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
> +
> +		if (!want_affine)
> +			return select_idle_sibling(p, prev_cpu, new_cpu);
>  	}

Yes, this also has the same effect.

>  
>  	for_each_domain(cpu, tmp) {
> 
> > 
> > However, select_task_rq_fair() still enters the sched-domain traversal
> > only to break out almost immediately. Avoid this unnecessary work by
> > jumping directly to the existing fast path when want_affine is false.
> > 
> > As part of this cleanup:
> > 
> >   - Move want_affine into the WF_TTWU block where it is used.
> >   - Skip the sched-domain traversal entirely when want_affine is false.
> >   - Remove the now redundant want_affine test from the
> >     SD_WAKE_AFFINE check.
> >   - Remove the corresponding !want_affine loop termination logic.
> > 
> > This preserves existing wakeup placement behavior while avoiding
> > unnecessary sched-domain iteration for TTWU wakeups that cannot make
> > use of wake-affine placement.
> > 
> > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > ---
> >  kernel/sched/fair.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 3ebec186f982..58ff55e093cb 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8832,7 +8832,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  	struct sched_domain *tmp, *sd = NULL;
> >  	int cpu = smp_processor_id();
> >  	int new_cpu = prev_cpu;
> > -	int want_affine = 0;
> >  	/* SD_flags and WF_flags share the first nibble */
> >  	int sd_flag = wake_flags & 0xF;
> >  
> > @@ -8841,6 +8840,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  	 */
> >  	lockdep_assert_held(&p->pi_lock);
> >  	if (wake_flags & WF_TTWU) {
> > +		int want_affine;
> > +
> >  		record_wakee(p);
> >  
> >  		if ((wake_flags & WF_CURRENT_CPU) &&
> > @@ -8855,6 +8856,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  		}
> >  
> >  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
> > +		if (!want_affine)
> > +			goto fast_path;
> >  	}
> >  
> >  	for_each_domain(cpu, tmp) {
> > @@ -8862,7 +8865,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  		 * If both 'cpu' and 'prev_cpu' are part of this domain,
> >  		 * cpu is a valid SD_WAKE_AFFINE target.
> >  		 */
> > -		if (want_affine && (tmp->flags & SD_WAKE_AFFINE) &&
> > +		if ((tmp->flags & SD_WAKE_AFFINE) &&
> >  		    cpumask_test_cpu(prev_cpu, sched_domain_span(tmp))) {
> >  			if (cpu != prev_cpu)
> >  				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
> > @@ -8878,8 +8881,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  		 */
> >  		if (tmp->flags & sd_flag)
> >  			sd = tmp;
> > -		else if (!want_affine)
> > -			break;
> >  	}
> 
> 
> This just changes the behavior.
> 
> Old Code WF_FORK 1, WF_TTWU 0:
> 
> want_affine = 0, so we skip the first if block in the loop then leave
> once we find a domain without our flag. And go with slow path.
> 
> 
> New Code:
> 
> want_affine is moved away and early exit is removed. So we enter the if
> block and try to find a domain with prev_cpu. Because WF_TTWU 
> is 0, we just return new_cpu. Or if we can't fimd the domain with
> prev_cpu, slow path.
> 

When WF_TTWU is set, we are always suppose take the fast path.
slowpath is for WF_FORK and WF_EXEC.

> 
> Cheers,
> 
> Kayra

-- 
Thanks and Regards
Srikar Dronamraju
