Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFDC1EE7B7;
	Thu,  3 Sep 2026 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403659; cv=none; b=KFNkjolXzw0koonDdUc7yui6hHx8FDEtjPokMS8XN6e1lfHv8++BGSKdSkrJMqCPQZ6iYZdLPId2FKa7pmJacaFQNrT/YrNKivlrVnBaSoph4yzhT8ujydvmMZ8LkQZQJmuY6/4DD1hPLnveVVTgI8wKnwpSBKl8VlF2O+4E2uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403659; c=relaxed/simple;
	bh=OAZ17QYQRxW+6QWkSmNXTqE5PKgfTkl9xj+sYX9MqQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMIIPu4N31i11vSzNORwUdXjiLzju2hEzBrjJT2AHf5FnX3pG9Be5UpnnvaqZFGUIvSmHWwOcFD+WnwAheK4sZUiXcaj9+hbZvp2dTN0T7q5LwaY142HxsAfdrZzMtK9izhXetv6FMoIc4iad9HRQEVYRqSZZNscEGAgSEaboc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KxAwabPQ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KxAwabPQ"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NVrI7290532;
	Thu, 3 Sep 2026 02:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rOdWMC
	uL9D3IoUM29DC6JSDTnLDaPAkQ8YMdBLT4Hl0=; b=KxAwabPQQJkhUwwzkrNiOt
	2og3KtMrwNLWU4jI0lkOPCbJujnac4uxzOYBnfA/85SOK8QF0zHOldNRSyBGUTah
	t718g4Wjy2VMpOJh02gblveXW5mDZ64wc8FCeZCOfpqTk+ViG6ZWEwrCAxuNBpmN
	fAyEc0HvPLkXHZcjR5m/ZUNejlPNDNAir52h+c+qAjnADpSmbPRiJSpSx61lA26z
	8WvYei1XA8DvnVyN0nbcB/Sl6ZitB8CZ2svf/t18PKdKoPvxZ1x9J+2i+NWGChA1
	7WN7uRqYkWu1884ZgLeaYVShR2iF/YRNziMW/koikkqNkT1JyWjjMIz0uYvotAvw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnue2btu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 02:46:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6832fK54026262;
	Thu, 3 Sep 2026 02:46:00 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gc9rqntax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 02:46:00 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6832jwfY12845810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2026 02:45:59 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A65975805D;
	Thu,  3 Sep 2026 02:45:58 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB4B758052;
	Thu,  3 Sep 2026 02:45:50 +0000 (GMT)
Received: from [9.43.65.145] (unknown [9.43.65.145])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Sep 2026 02:45:50 +0000 (GMT)
Message-ID: <d52d3775-ded0-4b7a-8315-6e940ba90f4a@linux.ibm.com>
Date: Thu, 3 Sep 2026 08:15:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] sched: Document WF_SYNC wakeup placement
 semantics
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Shubhang Kaushik <shubhang@os.amperecomputing.com>,
        Christopher Lameter <clameter@amperecomputing.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20260825-sched-wf-sync-doc-v1-0-f899edb44ff5@gentwo.org>
 <20260825-sched-wf-sync-doc-v1-1-f899edb44ff5@gentwo.org>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20260825-sched-wf-sync-doc-v1-1-f899edb44ff5@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: WXcXphI-J6fOOkj6ZMb3t9UiF4pYw6Bg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyMSBTYWx0ZWRfX/F84uaue9/7B
 p6T+lJ+l59UqzAfK8b9qrhDBp7tjENRRBoAfCVgrLCANhJaiyl+2iR0lL7fFdnsyMPXhAw7xJO0
 PuMLoeSeYWPgnUSL4QfHH0F9xvzNcEkCioLHAEyqVfhXx/Fxbtk6n6rXyDRgS9zwhD6CjDlvuKO
 5GWOPYNPZ4Gsyrp6oa2ip1C/9zNtVdheTgsPOCDz6LFAa+7zwkENA1Uakh8lfa+hJHLQHELAciG
 AriK/Y6g0/thiWi6kzs5akaQZ1hCWr0t9vIeklhb07kQISHCjQVvhVRWdWk0CDGVMQBbqLNlscl
 ZkCWmc8SA5LayJRUZ9jG7AAkRaGz+kGR48fqNWdZW5sX4eUfnGXSLcdiXqSvhQfJ7fHfzQ1jVPA
 9YVvDc6eGmL5I/0MlwTVo20JXcr2inz4M56Xj6LqoZO6HC5jUk2OeJ2sDdIS/x02zM8wxdWt0l6
 BZ0Q2syVeMRpxUgrIjw==
X-Proofpoint-ORIG-GUID: s23dK7QRFEvayQq7Vopf86kp4yg8fPIA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyMSBTYWx0ZWRfX1RqK42Z+jbNJ
 pUul5ZHjkLUaXx6GfNCFsPLW8ZAv+THvV1mHgkd01UN0xkLu3LBwfQcSmYdXiZsFKdERbfks9Nl
 T3G4ziyMa9wwFqBDejfdkewxFDz2jt0=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a98df6a cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=PuvxfXWCAAAA:8
 a=TT-myxhzOO4GQJku5wMA:9 a=QEXdDO2ut3YA:10 a=uAr15Ul7AJ1q7o2wzYQp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030021

On 26/08/26 04:16, Shubhang Kaushik (Ampere) wrote:
> WF_SYNC is supplied by callers that expect the waker to schedule away
> soon. The fair-class wakeup path uses it as a heuristic, but its
> placement and preemption behavior is not documented.
> 
> Document the current behavior from try_to_wake_up() through
> select_task_rq_fair(), select_idle_sibling(), and preempt_sync(). In
> particular, document that WF_SYNC does not bypass wake_wide(), does not
> make wake_affine()'s target final, and does not require immediate wakee
> preemption.
> 
> This documents existing behavior only. It does not establish a new
> WF_SYNC placement policy.
> 
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
>  Documentation/scheduler/index.rst               |   1 +
>  Documentation/scheduler/sched-wake-affinity.rst | 133 ++++++++++++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 17ce8d76befc1bb1dc289e9243bdca98c9ccb172..ac95c79617fd2c03564ea4a9dad362091b9d1b86 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -14,6 +14,7 @@ Scheduler
>      sched-design-CFS
>      sched-eevdf
>      sched-domains
> +    sched-wake-affinity
>      sched-capacity
>      sched-energy
>      schedutil
> diff --git a/Documentation/scheduler/sched-wake-affinity.rst b/Documentation/scheduler/sched-wake-affinity.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..6b0dc83da537ad576130ef165a2bb1cf5abd814a
> --- /dev/null
> +++ b/Documentation/scheduler/sched-wake-affinity.rst
> @@ -0,0 +1,133 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==============================
> +WF_SYNC Wakeup Placement Hints
> +==============================
> +
> +WF_SYNC is a wakeup flag supplied by callers that expect the waking task
> +to schedule away soon after waking another task. It is a scheduler hint,
> +not a CPU-placement request.
> +
> +The synchronous waitqueue helpers pass WF_SYNC to try_to_wake_up(). The
> +wakeup path adds WF_TTWU before invoking the scheduler. WF_SYNC itself
> +does not block, yield, or otherwise change the state of the waker.
> +
> +This document describes the current behavior for the fair scheduler.
> +Other scheduler classes may ignore WF_SYNC or apply their own policy.
> +
> +Wakeup paths
> +============
> +
> +A successful wakeup does not always select a CPU. If the wakee is already
> +queued, try_to_wake_up() can complete the wakeup through ttwu_runnable().
> +That path retains the wakee's current runqueue, although it can still
> +invoke wakeup_preempt().
> +
> +For a wakee that is not queued, try_to_wake_up() calls
> +select_task_rq(). If the wakee has one allowed CPU or migration is
> +disabled, select_task_rq() bypasses the scheduler-class CPU-selection
> +method and selects an allowed CPU directly.
> +
> +Fair-class CPU selection
> +========================
> +
> +For a fair-class wakee, select_task_rq_fair() derives its local sync
> +state as::
> +
> +        sync = (wake_flags & WF_SYNC) &&
> +               !(current->flags & PF_EXITING);
> +
> +Thus, WF_SYNC does not influence wake-affine selection when the current
> +task is exiting.
> +
> +For WF_TTWU wakeups, select_task_rq_fair() first calls record_wakee().
> +It can then return before wake-affine selection in either of these cases:
> +
> +* WF_CURRENT_CPU is set and the waking CPU is allowed; or
> +* find_energy_efficient_cpu() selects a CPU while the root domain is not
> +  overutilized.
> +
> +Otherwise, the fair scheduler computes::
> +
> +        want_affine = !wake_wide(p) &&
> +                      cpumask_test_cpu(cpu, p->cpus_ptr);
> +
> +wake_wide() uses the wakee-flip state maintained by record_wakee() to
> +identify broad wakeup relationships. WF_SYNC does not override this
> +classification.
> +
> +Wake affinity is considered only when want_affine is true, the domain has
> +SD_WAKE_AFFINE set, and the wakee's previous CPU belongs to that domain.
> +wake_affine() considers only two CPUs: the waking CPU and the wakee's
> +previous CPU.
> +
> +With WF_SYNC, wake_affine_idle() can prefer the waking CPU when::
> +
> +        rq->nr_running - cfs_h_nr_delayed(rq) == 1
> +
> +wake_affine_weight() also adjusts the effective load comparison by
> +removing the current task's load from the waking CPU and biasing the
> +previous-CPU effective load.
> +
> +The result of wake_affine() is only a candidate. For WF_TTWU wakeups,
> +select_task_rq_fair() passes that candidate to select_idle_sibling().

This document reproduces the implementation literally like want_affine,
nr_running, helper names. This could quickly go stale with code changes
and nothing will tell us then. I think the contract doesn't need the
call flow.

Thanks,
Vineeth

> +
> +Idle CPU selection
> +==================
> +
> +select_idle_sibling() first tests whether the candidate CPU is idle and
> +can run the wakee. If not, it can select:
> +
> +* the previous CPU when it is cache-affine and idle;
> +* a recently used CPU when it is cache-affine and idle;
> +* an idle SMT sibling; or
> +* another idle CPU in the relevant search domain.
> +
> +On asymmetric-capacity systems, the search uses sd_asym_cpucapacity when
> +available. Otherwise, it uses sd_llc for the candidate CPU.
> +
> +Consequently, WF_SYNC does not guarantee that the wakee runs on the
> +waker CPU, remains on its previous CPU, avoids migration, or shares a
> +core with the waker.
> +
> +Fair-class wakeup preemption
> +============================
> +
> +WF_SYNC can also affect wakeup_preempt_fair(). The normal fair-class
> +preemption checks run first. In particular, a non-idle wakee can preempt
> +an idle entity, and PREEMPT_SHORT can select the wakee before the
> +WF_SYNC-specific path is reached.
> +
> +If the wakee becomes the next buddy after those checks, preempt_sync()
> +uses WF_SYNC to decide whether to request rescheduling. The wakee must
> +be earlier than the current entity, and the current entity must have run
> +for at least the applicable threshold. The threshold is
> +sysctl_sched_migration_cost, divided by four when WF_RQ_SELECTED is set.
> +
> +If those conditions are not met, preempt_sync() returns
> +PREEMPT_WAKEUP_NONE. Consequently, WF_SYNC neither guarantees nor
> +prevents immediate wakee preemption. On UP, it can avoid an unnecessary
> +preemption when the waker is expected to schedule away.
> +
> +Semantics and policy
> +====================
> +
> +WF_SYNC is a non-binding hint. It does not guarantee that the wakee:
> +
> +* runs on the waker CPU;
> +* remains on its previous CPU;
> +* avoids migration;
> +* shares a core with the waker; or
> +* immediately preempts the current task.
> +
> +The scheduler does not verify that the waker subsequently blocks.
> +Callers may therefore use WF_SYNC where the waker continues to execute,
> +or where several wakeups are issued before it schedules away.
> +
> +The current policy leaves the locality, parallelism, topology, load, and
> +capacity tradeoffs to the scheduler. It does not require the wakee to
> +remain on the waker CPU when that CPU has no other runnable task.
> +
> +Any future policy that strengthens WF_SYNC placement semantics must
> +consider the different call sites, workload patterns, and hardware
> +topologies that use the flag.
> 

