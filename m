Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C94A0F03
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264251; cv=none; b=NF1xL52vFWBUp+CPZE/sj6noWFUEtFlCkenKLTfrf8SoyCJsKMohnoNEtzxFQBahRW+ZMNEgOt88/m9JCEg4wFrvcuM3cSAzekr3CKtUGKixw20BJ7m6/xCf91DdjiPzc7MVSJw1ZvWc49GrWMSTQusLyinJG/JsT2Q5rUMbahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264251; c=relaxed/simple;
	bh=siP5xShWiGCfWeSjjHK7g7cR2fwbBJ/gXGz3RYCcEY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7Zk9hXJNlqIJPVMkNM9Mr8D0rfz4hUnfmSU/fhqoy6xkk+FMqCNQkLNiH/mdfn6UW512FW0eQNYsY/9HUPrrVpVBg8wMFW/0N+iZgTAo/FxX04/wzLwuszzYdHzqHBYtQrXMwp6NZ/iQTVm31Yyfo2Q3EumkhqXxViuCB/kBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LUa3qxX4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LUa3qxX4"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC645N1009199;
	Thu, 24 Sep 2026 15:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=A7ySJ+
	ulkt+jPpPjGUAix8nhMOfJEMr9D03VKHuwpdM=; b=LUa3qxX4vckeJlsXE46kCv
	jGaerMuiHBXUNkPF5YvQInkuPKFSzF2CT6SMf9SJE7MVhI8NC+GsK0yY1JqwfSDJ
	myuq/gtCm37S7HTCGU0ygiPiH9H0cNXwtid4Lv406m1fAEETnaCIM0yqd2ZOJLRg
	Xmko8om9PdMyiNmNVj7c3tQuI6JFB6G0Dv9xWAYuXr08k0t6olfPNupSUzONBRUL
	fyVochVVz9aQ5+YUZLf8xDEz3xQU4mtexrIjEn2dem8/T20y76D8BxJyicFnRYFp
	0s1Gi7i+VFAlHzLBwj6am6UrBzbxd8DrQYJPOtyfOCJbnZdErPus6hF2YWcsDTCA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgqs71h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 15:37:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68OENlRw2188500;
	Thu, 24 Sep 2026 15:37:01 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbu8xbtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 15:37:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68OFaxCX52429162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 15:36:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4375220043;
	Thu, 24 Sep 2026 15:36:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD5B920040;
	Thu, 24 Sep 2026 15:36:55 +0000 (GMT)
Received: from [9.39.18.150] (unknown [9.39.18.150])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Sep 2026 15:36:55 +0000 (GMT)
Message-ID: <c5d4c422-3f25-4053-bd0b-176024811760@linux.ibm.com>
Date: Thu, 24 Sep 2026 21:06:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] sched: Clarify WF_SYNC wakeup semantics
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Christopher Lameter <clameter@amperecomputing.com>,
        Shubhang Kaushik <shubhang@os.amperecomputing.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=G+OJgNk5 c=1 sm=1 tr=0 ts=6ab5439e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=PuvxfXWCAAAA:8 a=VnNF1IyMAAAA:8 a=eL_f2sZPHiHUAbTbmMUA:9 a=QEXdDO2ut3YA:10
 a=uAr15Ul7AJ1q7o2wzYQp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NCBTYWx0ZWRfX2JhEjTnQ/9Er
 yO1zYJNyXHQN9oFrcp/cvCB4UWznqix/UjAVrU04FLk5KeeT4AgyjUfijR7ILrFyZb78R+o9S3u
 byP6jhbjS7yWkQaNauM+ObyOfnIVOvHYnRG4qK+ZdBy3R5fWcF+A10zJsBrJKAAOR5ICoZP6Rfh
 HiQrh19idLCa2qyjW4D8Omm2D9ouAXk0Gue0wgAFCJnWvuoNkze7NhzizRajhH3L1ceQrdBWy3o
 mcV2+fX2kJALyKOQxk7r37e/C3fJSkz+zhrzocX2WsGvpyKSzBES4DmF20O1KoiTM2Wog9xBJjq
 4HWXp7BJpwKYevP5a15Qh6EM+85XnmnS/897z0GtPGfrnkiBG00oT0PH1KgBANZ3Ss3/ZhLBOds
 WDIENAduSUsUa7HfKQ/U4FW76rniR8V9WeGaVnehEe/TTX7G8vh1rkSJHHL8CMjMB+YlWQ3l94V
 vDCx9OQqIlFBGZ2izWg==
X-Proofpoint-ORIG-GUID: 7v3TNKTcQPj4en7yEnloqv4e2zut1O7t
X-Proofpoint-GUID: EcighGNf0tdlni9HpA764fKNE10pQZTP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NCBTYWx0ZWRfX7rcmDpsF5II7
 YBiWnAisilv1nRcNVyUHMVkAsZTZKI+p83HhDHCG7qzIru42k77+bGbslBa/8lltIH71fEYB5Z5
 24md37U/ZE2mN/u4WwLqTGq7x7BffHM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240064



On 9/23/26 3:27 AM, Shubhang Kaushik (Ampere) wrote:
> The synchronous waitqueue wakeup comments currently state that a
> synchronous wakee will not be migrated to another CPU. This is not
> guaranteed by the scheduler wakeup path.
> 
> WF_SYNC is an advisory hint that the caller expects the waker to
> schedule away soon. Scheduler classes may use it for placement or
> preemption, but callers must not rely on it to prevent migration,
> preserve CPU locality, or make the wakee run next.
> 
> Keep this contract next to the flag definition, remove the stale
> waitqueue wording, and make the locked helper refer to the unlocked
> variant.
> 
> ---

nit:
Don't keep --- before the tag.
Anything after is usually dropped from the changelog.

> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
> Changes in v3:
>    - Drop the standalone documentation in favor of a concise comment next
>      to WF_SYNC.
>    - Consolidate the series into one patch and remove the stale waitqueue
>      wording.
> 
> Link to v2: https://lore.kernel.org/r/20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org
> ---
>   kernel/sched/sched.h |  9 +++++++--
>   kernel/sched/wait.c  | 22 +++++-----------------
>   2 files changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e656c7059bf864d1ed91d4ec3d4624850aded7e0..fe366e9f248996a293e5bb6b76c8f01485a9ea6b 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2527,8 +2527,13 @@ static inline int task_on_rq_migrating(struct task_struct *p)
>   #define WF_EXEC			0x02 /* Wakeup after exec; maps to SD_BALANCE_EXEC */
>   #define WF_FORK			0x04 /* Wakeup after fork; maps to SD_BALANCE_FORK */
>   #define WF_TTWU			0x08 /* Wakeup;            maps to SD_BALANCE_WAKE */
> -
> -#define WF_SYNC			0x10 /* Waker goes to sleep after wakeup */
> +/*
> + * Hint that the caller expects the waker to sleep soon.
> + * Scheduler classes may use it for placement or preemption.
> + * Callers must not rely on it to prevent migration,
> + * preserve CPU locality or make the wakee run next.
> + */
> +#define WF_SYNC			0x10
>   #define WF_MIGRATED		0x20 /* Internal use, task got migrated */
>   #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU. */
>   #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> index d033f600f48c6fc3a0a088ea5d9f6ed95ec4c86e..477e4bf9c01e19a520b626c09a8b95c065616fe1 100644
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -174,15 +174,11 @@ EXPORT_SYMBOL_GPL(__wake_up_locked_key);
>    * @mode: which threads
>    * @key: opaque value to be passed to wakeup targets
>    *
> - * The sync wakeup differs that the waker knows that it will schedule
> - * away soon, so while the target thread will be woken up, it will not
> - * be migrated to another CPU - ie. the two threads are 'synchronized'
> - * with each other. This can prevent needless bouncing between CPUs.
> + * Passes WF_SYNC to waitqueue wake functions. The default wake function
> + * forwards it to the scheduler; see WF_SYNC for the hint's semantics.
>    *
> - * On UP it can prevent extra preemption.
> - *
> - * If this function wakes up a task, it executes a full memory barrier before
> - * accessing the task state.
> + * If this function wakes up a task, it executes a full memory barrier
> + * before accessing the task state.
>    */
>   void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode,
>   			void *key)
> @@ -200,15 +196,7 @@ EXPORT_SYMBOL_GPL(__wake_up_sync_key);
>    * @mode: which threads
>    * @key: opaque value to be passed to wakeup targets
>    *
> - * The sync wakeup differs in that the waker knows that it will schedule
> - * away soon, so while the target thread will be woken up, it will not
> - * be migrated to another CPU - ie. the two threads are 'synchronized'
> - * with each other. This can prevent needless bouncing between CPUs.
> - *
> - * On UP it can prevent extra preemption.
> - *
> - * If this function wakes up a task, it executes a full memory barrier before
> - * accessing the task state.
> + * Same as __wake_up_sync_key(), but called with @wq_head->lock held.
>    */
>   void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
>   			       unsigned int mode, void *key)
> 
> ---
> base-commit: fe2ec83746e501645709761605c2464a44fd2929
> change-id: 20260824-sched-wf-sync-doc-e92b4fe987f7
> 
> Best regards,

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

