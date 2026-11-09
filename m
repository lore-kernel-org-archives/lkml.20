Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232973;
	b=hqfzTc+qrMdIoFdon4QM7oAg5IvO8QYV0OndROrUxxzjmGX8iXBYMCmhfAO3yNqTOl4N
	 XDmMut5q/GGDYln0SPmFJdSfACrulY/UE7bPPzIWI0c/G09fa3ckVpvbhgTsNflqEMrq5
	 Bgyg/8TZr5lqKKUFMJnSPVV6/zR0QUXp4LWIlK/NWqAIdk5FN669kPNYYq1TB5zLgYbGZ
	 i2dTzrZueY6y1NMLZEqZuBIPZLq6rFxh3D2u0ZMC1JV8AyIP63aLWLKz3jqddZ4gcHOlH
	 PBHd0AwGKQPqVf3nKeCjD8eF6sPVRoLXjgr7gd6fu6jgctrEDJVP/4dIO1bqjU3qhtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3S4VhO94oDwkQsqfRw+fJ+qbREQfExEllSNmfm4R2Hw=;
	b=NZ2KswHSrQFxtBK2vKpYZslQU+hJxMgzevwbTuFxo6LPEewOoYS6auBccF7op6zgnyKx
	 nHrfhe0R5jDr/nclKgY0TOr723q5rkqFMqrrFRmFUJuiKnkQppajcgqEqUZtATk8pc5TV
	 1zo+aQAeAomMOQg4471H2d6K8eOMOtqjz85mQqbkC/VE0mzF+cK0aIJUWAas15YYheOgb
	 VcMkgcwwbEe5UQWIvYlNoDGq9bSjue4WTZj4R7+zGLcsjn6PBYyMbHF9ThPnGYmpdZXb4
	 rMh5sSPiqJBjrHn3q6fNcv+2LCUb0ET1FJQ0Vgbl4Os8Jr2IHpI47W6BnIDV44VWQ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RxsI8RE8;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83D606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA83D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RxsI8RE8
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEgj33699559;
	Mon, 9 Nov 2026 14:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3S4VhO
	94oDwkQsqfRw+fJ+qbREQfExEllSNmfm4R2Hw=; b=RxsI8RE8HYJMaIfLGZEwTU
	JrFcM266cOAq4v9xCzAdd/JdSMD04AtCdiZfhuJE4x59AMsbUVe8+SaxiZbVr0Zd
	ZfKsi462CSsO95poLLMF2S3MQKEIvERPsdR9Zf5Es7fMA5ZkZY9BHeZY7CqpmdRd
	QV9ZtDva8nO1b/HcCv4guSdRgFUiyHU7/GUr6MDWQIJpAShIOhrO/I6kvWKSxEgG
	XFXENYebItAlJQB0TUEUixgTuW2TBRLfw29SQ0xBxayKeBEwQCAKlFFbqqdTuiyI
	Qo5fvu/ZxVK/AVhOHpvHXayR0TG4Hbdgaq6o4irAtagPi38PfPCENJ7T5VPlvIrA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsug5wh7s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 14:02:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DK5Gg3151432;
	Mon, 9 Nov 2026 14:02:19 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4htghfyrbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 14:02:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A9E2Hdg46989616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Nov 2026 14:02:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A292620040;
	Mon,  9 Nov 2026 14:02:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6B9920043;
	Mon,  9 Nov 2026 14:02:14 +0000 (GMT)
Received: from [9.124.212.131] (unknown [9.124.212.131])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Nov 2026 14:02:14 +0000 (GMT)
Message-ID: <3dcbccdd-0a50-4b57-b0bf-79b55911bfa2@linux.ibm.com>
Date: Mon, 9 Nov 2026 19:32:13 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/core: Fix a TOCTOU bug in
 sched_non_preferred_cpu_push_stop()
To: Fushuai Wang <fushuai.wang@linux.dev>, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org, wangfushuai@baidu.com
References: <20261109083130.1679-1-fushuai.wang@linux.dev>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20261109083130.1679-1-fushuai.wang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: zYsDelZRSbXhCTEZOMhRxQxOVhhSe8YN
X-Authority-Analysis: v=2.4 cv=PeVqFShd c=1 sm=1 tr=0 ts=6af1d26c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=zuLzuavZAAAA:8 a=Tcm3tUNZ0R_kjyZ4jMMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1e8m9KwYVgcXC1Q7GQJQa0W6oYz8uTud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX8b4U1fmmF+AP
 GFryA8IJEwGmWVed1rM/d/L8nA83w7XVkz6NBvMLodrxkrWoTdISe4+iPDvH7xH3a8OFg8j+0tS
 FE8gFjRhb1FauJeb6fJxLgu3xpW8MWvVDZA3AJXbidMD9whvV+Tx3cj/7xcKS9jVxg6iQ0Ei3xE
 2ISZ7APCnCS/+gdlhOIq8i1xDSo5BBSjxkh8y34TvDwsxZyCB6gFqu4gkgTInMiT6LrSlE9bNrk
 x3nG4uUZkU6HwyaHs1iso/6mOKn6oNyHWqSa3eVMPpmVZeHrtJg9DKJe3hclSE4dRsjvWS6zP+h
 A08DybKiBBN/zmClLegQcwPS1WT9xxvIbdVrinBtGsTvaajWMbaTgWoCP5rctdPTpnyEC9o4YqL
 oDrfZ/S//y4TluvkXlA3ZhNx4qMMKHc+IMy3IKvZMtvasnIY9oCCppgxUzPOtMvMnmkZINgPIQW
 nOzWWTiM02sTIcuUOxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX2Mk90JOwu154
 vc9G3wrXUvTz6tuXWOSJ1I8VqVEMxefCq6jlAYCsWFXRe5wHErBggFWLZIRnJq4ANh72bmU7IK7
 W9p0fbLkxfmIyb4Sn/v51eR2a2ZD0h4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090054

Hi Fushuai.

On 11/9/26 2:01 PM, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> sched_push_current_non_preferred_cpu() is called in irq context. It
> checks is_migration_disabled() before queuing the stopper, but the
> task may continue running and enter migrate_disable() before the stopper
> runs.
> Recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
> before calling __migrate_task().
> 
>    WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
>    Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
>    ...
>    Call Trace:
>     <TASK>
>     ? __this_cpu_preempt_check+0x13/0x20
>     move_queued_task+0xfc/0x650
>     ? is_cpu_allowed+0x341/0x820
>     ? __this_cpu_preempt_check+0x13/0x20
>     sched_non_preferred_cpu_push_stop+0x7b7/0xb10
>     ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>     ...
>     </TASK>
> 

How does rest of the stack look like? Is it disabling preemption where
stopper is not getting a chance to run before task sets migrate_disable?

> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
>   kernel/sched/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1a088d4576f5..8ed7613eafd6 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11317,7 +11317,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>   		rq->npc_push_work_pending = false;
>   		update_rq_clock(rq);
>   
> -		if (task_rq(p) == rq && task_on_rq_queued(p)) {
> +		if (task_rq(p) == rq && task_on_rq_queued(p) &&
> +		    !is_migration_disabled(p)) {
>   			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
>   

I thought it is unnecessary.
https://lore.kernel.org/all/4e2421fe-4b26-4d92-8709-bfa8d3a4114a@linux.ibm.com/#t

Can you share how you are running into this?

>   			if (rq != dest_rq)
