Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAC14A8B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357743; cv=none; b=rmcQI9y6P6cCN2/U63i1TjFY8PUBJwHjCVUFdpaJzWcCAA/I5g+lxhIfC5GuD+mbTf72ZpvO+uyiWGiu+W7BnQkHbLNJ7g5mMicMQsesRxZhnG5s1RJpP/rpH2UK6/jIMLQ/YKYgIAYAfWrjpm6DgT0JOv+a8bWCu5/KmENo+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357743; c=relaxed/simple;
	bh=at5zxkrRvsrbyYWCXm5Au2pmZrSd0pfaLZ3RNlSjzEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akvVyXIjJyvfP4q7ixJF7jIEky3l+szHJuYaQJsXG9PP6SmqIIzXK9DrGuJWEqsWu7Jc8bUchChFE5FckEvy3ogYmqUHlAVjHVej6xnj8FxhzAxX8WVJNQaaxHBBVdY/+yLa8EADxgJZqG61serc616w6dKROsURiUREJ4G952g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SakwZImF; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SakwZImF"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG5T6n342822;
	Fri, 25 Sep 2026 17:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0rA4lj
	ERvthUemviyeU2FToaAdFelo8R8HJxo91piQ8=; b=SakwZImFXyAN49FT0gtjEx
	oLyBWvFH+2d90TVpMuiWnZkXB65+8qJNQNJN3rP/t3J5FlKauJBTt0o52Edr8v11
	FayjU2Dvp1hveL5yvSJNb0Qsz7Nlek9pIHIGoTVG89g3kuDhUwiBK1iy7ahz3kc/
	lKMeNlYPN6Xl3mD5k8OmpBY5SHXszB9Lo3++05IKNUaalRpsclj2VjZ50e3h1Nxw
	4iTzHhj3Aov1j3nGQjMDhCQVibDhdsAewr/YVlSVqYt5//geAvnvbIjxygcZkuvO
	XI/9FjxFGpAQ2PmCS/OxI82Y/nn9EQvXJvt3+CEvnywthCQCUwonoAKkYO6kDhkQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgqy9pq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 17:35:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG3LLU4140688;
	Fri, 25 Sep 2026 17:35:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbu938rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 17:35:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68PHZUJe28377412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 17:35:30 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62E1B20043;
	Fri, 25 Sep 2026 17:35:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2155720040;
	Fri, 25 Sep 2026 17:35:29 +0000 (GMT)
Received: from [9.124.212.213] (unknown [9.124.212.213])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Sep 2026 17:35:28 +0000 (GMT)
Message-ID: <31c9b2b9-7532-4de5-b0c4-bc283a931cb3@linux.ibm.com>
Date: Fri, 25 Sep 2026 23:05:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip: sched/core] sched: Clarify WF_SYNC wakeup semantics
To: linux-kernel@vger.kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: x86@kernel.org, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
References: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
 <179033364193.2819794.10008973300214008226.tip-bot2@tip-bot2>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <179033364193.2819794.10008973300214008226.tip-bot2@tip-bot2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=G+OJgNk5 c=1 sm=1 tr=0 ts=6ab6b0e5 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=bC-a23v3AAAA:8 a=PuvxfXWCAAAA:8 a=JfrnYn6hAAAA:8 a=eL_f2sZPHiHUAbTbmMUA:9
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=uAr15Ul7AJ1q7o2wzYQp:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3MCBTYWx0ZWRfX2/O8D+5oXMjS
 7L/R5ECG/h1ovqCWkkAzYpnAegkFr7BEMVLtuQJ55Qj9EEXWHmujRILkow60pPh+fSnxWZCZvpu
 erLpFrxawAnRNyker0Ricn3tF2y5I6dWg0dcfSBK4rbtXKX863lmm0Ttqx645VYeHpXc77t2Bkw
 9dKYiVbxwqo/O6qCKQCsICuQ9uZxVqofYsYyrjiuZc1j2q+yyKnrynNTDs73fGN+9CmWe4lLaXu
 TAI9lUGQJm+S/2wXyFuZX+EymukHfH9VqJRxGLup24XHP0ujvcd64k1eymEhptX9pvr+YWeRPDv
 dTncK3Hz6ItydMmIpmJrdx998+JCtLbFn8wbTkRcCDJFHo8wH+DFZOEqIPUDtlP8hkRX/fvbYZA
 O4Hqz7ua13zg+b/8MnyZ4m7B9f20Gkf91+3q5UwXncj4khEh3lvbJhoPNSxqrlBedzmXmvuZc5Z
 n6ybOlxy/zbHnAYDcGg==
X-Proofpoint-ORIG-GUID: Dlj8jow-46xNlJJbbaj8meaTrHK7NztA
X-Proofpoint-GUID: Dlj8jow-46xNlJJbbaj8meaTrHK7NztA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3MCBTYWx0ZWRfX1w5vye16M6hO
 PsI5+aTeN/I/zGm4dhraysWUTqEIrUvKridl4o5iUzHvUhOBXt6aKMTEFZOqdlmcO0OA+4YqQoH
 eF9aepKG3OWYk2frkhGWkVoU5tCPY9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250070

Hi Peter.

On 9/25/26 4:24 PM, tip-bot2 for Shubhang Kaushik (Ampere) wrote:
> The following commit has been merged into the sched/core branch of tip:
> 
> Commit-ID:     e4c353c3933968fe8efecb269fdbe3baa1d1ddd0
> Gitweb:        https://git.kernel.org/tip/e4c353c3933968fe8efecb269fdbe3baa1d1ddd0
> Author:        Shubhang Kaushik (Ampere) <sh@gentwo.org>
> AuthorDate:    Tue, 22 Sep 2026 14:57:05 -07:00
> Committer:     Peter Zijlstra <peterz@infradead.org>
> CommitterDate: Fri, 25 Sep 2026 12:45:59 +02:00
> 
> sched: Clarify WF_SYNC wakeup semantics
> 
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
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://patch.msgid.link/20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org


This is missing Shubhang's signed-off-by tag. Likely caused by the --- tag in his
commit message.


> ---
>   kernel/sched/sched.h |  9 +++++++--
>   kernel/sched/wait.c  | 22 +++++-----------------
>   2 files changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index f7d0b64..b98084e 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2535,8 +2535,13 @@ static inline int task_on_rq_migrating(struct task_struct *p)
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
> index d033f60..477e4bf 100644
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

