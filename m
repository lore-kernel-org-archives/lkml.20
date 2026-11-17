Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922594;
	b=4pRNGgD++NGpjfrI5gc2QDIWnFwIOCQIRpuQbYoyT0TDaWyr2xyk9IYcnm/LtrraYTfp
	 T1oSDo0BiUliNrCHZ+8deK5myXFmy7MwnbeMiSBQxXa9bN1o/+hRjIXjoASsujaMoiBwp
	 7Nd0QONLa9xLXVCb5NHoI085Bf66j7/ScovQRirVmmvn5yKE06ewTgG8L+VfpE8ocstcV
	 8lIVRjDXOs3GYYKZ0j/ikGYp8NyvTcPj7rI6qnMGaZCDEiCaUj/OVh1vQ0ly3RsIZ614M
	 Geaq2DF2s5ySvZBIWc2daXaiCTb0yAFeLxxUJPBdQ4sGVEdbEDuskb2R3eRmcStqm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LSGMeUgBIC+PwrIKXjhZNBw6V33wy8tfoienf8RyD5c=;
	b=VQP7qa8hYTnZpHGDnWPXj/MiOM9+zsxCnEmQdxslj1rnhKjaxt4OViV/52M2CJVlmmHU
	 fzQiMtvUk9mC0BN7TIGMqdK1J+oyfiSN8Dl0P5agn0PoJACnu/VX9dEl4LdksjY+2duBH
	 1Tx+xG41nLo1pI66ahuHGBpPPKRvY858k6PPSapMl47o6Eot4lrLnoadP9fJUHq/i67wE
	 Rh8xyBBkoU7orKucFQwIwp+8jmy/WHyHJdCFjbtaOsquLTp59guQLbcffzQeYmbf4GSKS
	 KBPrB8TtaUYtpggRyutxVrgwkItZxLX2WsLatRG5DYw15x35bs1q7oavtpFCDmBp8Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BK341wZK;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4535D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BK341wZK
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBw2AH1088621;
	Tue, 17 Nov 2026 13:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LSGMeU
	gBIC+PwrIKXjhZNBw6V33wy8tfoienf8RyD5c=; b=BK341wZKZOfcKl48En4ubJ
	2aGYFQYNMevVdsLwmSWhnDcGYTjrzkIS6nJOaHJgSgk1tHaUo8Ix35UMsycaQIGJ
	qgC4GzxtVs5ujYrGkoJAMNg24X6rcbO5n8T6saqXT3p0imOqd70WbGiB71HMPCMe
	hXl5EPiggmvkh3Nomb3wMnosYFMoow52jbyZ5YpD80V++YW4nmUWgYSm+2lYtE8n
	MEnRvQOwHKWtAO/aa/3+hLOCbOdn8d4+a6o4YsYLhfW96hA7rzAHWythtfHcF4fi
	WoyylxpWa2+7J1+W1fTot2I1V5ijpObgYTUGbEeU33a3pX9DLCt419CtdWManEgA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hxe2dav67-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:36:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHCJpdY3918182;
	Tue, 17 Nov 2026 13:36:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hy2bve271-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:36:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AHDa3U112124454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2026 13:36:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D6E62004F;
	Tue, 17 Nov 2026 13:36:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB9412004B;
	Tue, 17 Nov 2026 13:35:59 +0000 (GMT)
Received: from [9.124.217.181] (unknown [9.124.217.181])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Nov 2026 13:35:59 +0000 (GMT)
Message-ID: <8e850578-a92e-4a9e-9c06-2d3fb9f9a064@linux.ibm.com>
Date: Tue, 17 Nov 2026 19:05:58 +0530
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
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
        kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de,
        mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
        vincent.guittot@linaro.org, vschneid@redhat.com, wangfushuai@baidu.com
References: <3dcbccdd-0a50-4b57-b0bf-79b55911bfa2@linux.ibm.com>
 <20261110032117.44762-1-fushuai.wang@linux.dev>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20261110032117.44762-1-fushuai.wang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MyBTYWx0ZWRfX8vooBovww8ae
 3ZiqLiGynbZ811myqGhf8idE3W3e3JkknZITJyeYOPNV5NjSVjWmPkTwmMo0GaJT13sS1U5RRyr
 j0/SsirgzU45aeqdjAzLB9BvAWLlnHo=
X-Proofpoint-GUID: yvNsu5G_5TgntpGWCzCGKxLVpM4f5aG5
X-Proofpoint-ORIG-GUID: 87eamGCAFNdWYsCBIiYBrzJT5xaRhKCO
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6afc5846 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=zuLzuavZAAAA:8 a=IBInu_rjSGGVW8yiBrEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MyBTYWx0ZWRfX8zvDSJ5aTk9y
 z6vq+CqCPGGgoKslPJwfLRXDIRDHzFKuRWDLdpJyqKOi3dO7DoK4cceEUel/SoLbfk9pIWidkM4
 tXimZYQ43o75IFelU5MdCDbUNDFKXkB8/KotbNloHV1uoHB4ym+2xCgf1OuqziJ2B+P6uwDQR4I
 TnBI6faM1vr/02DdrfG7j9UcNkb1SIWHdK1qILr3iVo8AI87ZE0z0/Av+9B8CsjRtff4X6hdW9y
 2UvZ5ID/ZB/UzGbEM5DRqxhIGfXr2VQjX4RYCDQcpnwY32m8Sf0pHV1taSRFp/qYgV/FPo5Lj/O
 vHp5AqJBcM9LdOomSZmZlff1zESBfLRcEDD2E/UkgirUjfMubbAwkWpjP5ygpalfzvru0WsMj3f
 DyawMprZpS7VTuLhC3EVZndZ6HzZ8Tyo9ghUr86INortAVfeBmOCa8rkcC9abbF6PIzPfjoydW/
 P5FD9Fn3eGaPfZ6gtoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170053

Hi Fushuai.

On 11/10/26 8:51 AM, Fushuai Wang wrote:
>>> From: Fushuai Wang <wangfushuai@baidu.com>
>>>
>>> sched_push_current_non_preferred_cpu() is called in irq context. It
>>> checks is_migration_disabled() before queuing the stopper, but the
>>> task may continue running and enter migrate_disable() before the stopper
>>> runs.
>>> Recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
>>> before calling __migrate_task().
>>>
>>>     WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
>>>     Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
>>>     ...
>>>     Call Trace:
>>>      <TASK>
>>>      ? __this_cpu_preempt_check+0x13/0x20
>>>      move_queued_task+0xfc/0x650
>>>      ? is_cpu_allowed+0x341/0x820
>>>      ? __this_cpu_preempt_check+0x13/0x20
>>>      sched_non_preferred_cpu_push_stop+0x7b7/0xb10
>>>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>>>      ...
>>>      </TASK>
>>>
>>
>> How does rest of the stack look like? Is it disabling preemption where
>> stopper is not getting a chance to run before task sets migrate_disable?
> 
> Hi, Shrikanth.
> Yes, this occurs in the case where preemption is disabled.
> And the full stack like this:
> 
>     WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
>     CPU: 21 UID: 0 PID: 152 Comm: migration/21 Tainted: G        W  O        7.4.0-rc1 #3 PREEMPT(lazy)
>     Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
>     RIP: 0010:set_task_cpu+0x1b8/0xdf0
>     Code: fc ff df 48 89 fa 48 c1 ea 03 0f b6 04 02 84 c0 74 08 3c 01 0f 8e 20 09 00 00 66 41 83 be 30 09 00 00 00 74 07 45 84 ff 75 02 <0f> 0b 0f 1f 44 00 00 65 44 8b 3d 01 4e 67 05 48 b8 00 00 00 00 00
>     RSP: 0018:ffa0000000bafb80 EFLAGS: 00010046
>     RAX: 0000000000000000 RBX: 0000000000000015 RCX: 0000000000000000
>     RDX: 1fe2200044524126 RSI: 0000000000000000 RDI: ff11000222920930
>     RBP: ffa0000000bafbd8 R08: ffffffff8c419c7c R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000015
>     R13: ff11000222920014 R14: ff11000222920000 R15: 0000000000000000
>     FS:  0000000000000000(0000) GS:ff1100159121e000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000005d5cf5e3200 CR3: 00000001282cc001 CR4: 0000000000771ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      ? set_task_cpu+0x5/0xdf0
>      move_queued_task+0xfc/0x650
>      ? is_cpu_allowed+0x341/0x820
>      ? __this_cpu_preempt_check+0x13/0x20
>      sched_non_preferred_cpu_push_stop+0x7b7/0xb10
>      ? __this_cpu_preempt_check+0x13/0x20
>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>      ? sched_non_preferred_cpu_push_stop+0x5/0xb10
>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>      cpu_stopper_thread+0x205/0x410
>      ? smpboot_thread_fn+0x307/0xa60
>      ? __pfx_cpu_stopper_thread+0x10/0x10
>      smpboot_thread_fn+0x352/0xa60
>      ? __pfx_smpboot_thread_fn+0x10/0x10
>      kthread+0x3a6/0x4d0
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x68e/0xb40
>      ? __pfx_ret_from_fork+0x10/0x10
>      ? __kasan_check_read+0x11/0x20
>      ? __switch_to+0x592/0x1210
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
> 
>>> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
>>> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
>>> ---
>>>    kernel/sched/core.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 1a088d4576f5..8ed7613eafd6 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -11317,7 +11317,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>>>    		rq->npc_push_work_pending = false;
>>>    		update_rq_clock(rq);
>>>    
>>> -		if (task_rq(p) == rq && task_on_rq_queued(p)) {
>>> +		if (task_rq(p) == rq && task_on_rq_queued(p) &&
>>> +		    !is_migration_disabled(p)) {
>>>    			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
>>>    
>>
>> I thought it is unnecessary.
>> https://lore.kernel.org/all/4e2421fe-4b26-4d92-8709-bfa8d3a4114a@linux.ibm.com/#t
>>
> 
> Sorry about missing this.
> 
>> Can you share how you are running into this?
> 
> Yes, I asked my LLM to reproduce the issue.
> First, it wrote a ko to control preferred cpumask switching, making cpu1
> preferred half of the time and non-preferred the other half, while cpu0
> is always preferred. Second, it wrote a userspace bpf that is initially
> pinned to cpu1, then changes its affinity to {0,1}, and continuously calls
> BPF_PROG_TEST_RUN, beacaue it invokes bpf_prog_run_pin_on_cpu(),which include
> migrate_disable().
> 
> I think the biggest difference of sched_push_current_non_preferred_cpu() and
> balance_push() is that sched_push_current_non_preferred_cpu() runs in irq context
> while balance_push() runs in task context.
> 
> So, a balance_push() path be like:
>      task context:
>      migrate_disable()
>          preempt_disable()
>          migration_disabled = 1
>          preempt_enable()
>      is_migration_disabled()
> 
> While a sched_push_current_non_preferred_cpu() path be like:
>      task context:                       irq context:
>      migrate_disable()
>          preempt_disable()
>                                          is_migration_disabled()
>          migration_disabled = 1
>          preempt_enable()
> So I think a recheck is necessary.
> 
> Regards,
> Fushuai.

Thanks for the data. If preemption is disabled and you are continuing to
do migrate_disable(), yes it is necessary check.

Could you please send next version with these details in the changelog?
