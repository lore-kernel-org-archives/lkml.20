Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280889;
	b=iazqrCjEWHFGJ1XxZ/MRr6B007fb0QKsl5aOQhnZGN8al0wFp6f8xZhaKFVRETPp8pZo
	 mKItfmudmMsBWhHpSvu6BYT/9dEETHa9P6ZssVJzgdROHdfxEdf6b0AEgUj6VNrHVU93F
	 MyH3nC6Rwp/xA7wOVfyBCnwlSREe/Bj3r+PslNaNKzh/aYDLEKYl7/XFNmXvUDkYqWIRh
	 /3xyOLg2757iv3YIMjaKfHVNbXd958o7zOPP91QF47i6t20ycyeQfSMYvbbSQ/Rel1ytG
	 bZLP3nb+k1JHNFoBkvXpaDPYF83N3mBpEcuFK+S8mVPgnB0TpENiRwfZjhwVS9ulZzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280889;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9iXiPwDUrO4pD6CBQMXRpvqHaWjhvLe3INLEJcB2Fvo=;
	b=dsppILdThIDUSLgooOovm3zLXDnKp28hoOQp2JdebGA2jERdWwaiptLur4hnvSc+igY6
	 +NUJ5cq9xZCnrRLOpYPD2nKddyKoKC3q99yL4T5eLhUlkg+rd6nfqIqm1ECqjuCzR61TD
	 /nJO3Cv3leERjfvpPetDF8huNQVvesYb2iKEjThH1PZ6Qnrvmp8GgrTMuePx8x0Wt1i7V
	 3i+cKugQY31sGr1L71vpxJ4VEY/TK4RFiO+cB20pKuvTTHF6LRdOmOBbEijYyOLH1dNBe
	 xozl5NMO1/I3i5f8i1Ipm0qB13vgCuVCKE2HP+BG2bKPzdwsmS7RXIlk1zZS0jzvKEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kHPzBS+H;
	arc=none smtp.remote-ip=95.215.58.81
Received: from mta1.migadu.com (out-81.mta1.migadu.com [95.215.58.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC99606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC99606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kHPzBS+H
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1zpCWYRRn9fNh7yGr1f1xvtVVwkDyJPiUyuJowVkUsU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794280886; v=1; x=1794885686;
 b=kHPzBS+H/RPup//k4LOjut2jRwhQwIVN2Xwu032f9T6x0ZOf7xmtEWC4EYxBRGPI3mDlnyG1
 B/hfIRp26rkb1Onx8RIq2lCWfueWvs905iHDOdOjd5UPf1pGCYfYFMuwJtm2yDlMhCV9kWCCYNZ
 YLJuWGjt4NHeCSgbmh4Yf2lA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id be421033003a90a3;
	Tue, 10 Nov 2026 03:21:26 +0000
X-Mizu-Trace-ID: be421033003a90a3
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: sshegde@linux.ibm.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	fushuai.wang@linux.dev,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangfushuai@baidu.com
Subject: Re: [PATCH] sched/core: Fix a TOCTOU bug in sched_non_preferred_cpu_push_stop()
Date: Tue, 10 Nov 2026 11:21:17 +0800
Message-Id: <20261110032117.44762-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <3dcbccdd-0a50-4b57-b0bf-79b55911bfa2@linux.ibm.com>
References: <3dcbccdd-0a50-4b57-b0bf-79b55911bfa2@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> From: Fushuai Wang <wangfushuai@baidu.com>
>> 
>> sched_push_current_non_preferred_cpu() is called in irq context. It
>> checks is_migration_disabled() before queuing the stopper, but the
>> task may continue running and enter migrate_disable() before the stopper
>> runs.
>> Recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
>> before calling __migrate_task().
>> 
>>    WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
>>    Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
>>    ...
>>    Call Trace:
>>     <TASK>
>>     ? __this_cpu_preempt_check+0x13/0x20
>>     move_queued_task+0xfc/0x650
>>     ? is_cpu_allowed+0x341/0x820
>>     ? __this_cpu_preempt_check+0x13/0x20
>>     sched_non_preferred_cpu_push_stop+0x7b7/0xb10
>>     ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>>     ...
>>     </TASK>
>> 
>
> How does rest of the stack look like? Is it disabling preemption where
> stopper is not getting a chance to run before task sets migrate_disable?

Hi, Shrikanth.
Yes, this occurs in the case where preemption is disabled.
And the full stack like this:

   WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
   CPU: 21 UID: 0 PID: 152 Comm: migration/21 Tainted: G        W  O        7.4.0-rc1 #3 PREEMPT(lazy) 
   Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
   RIP: 0010:set_task_cpu+0x1b8/0xdf0
   Code: fc ff df 48 89 fa 48 c1 ea 03 0f b6 04 02 84 c0 74 08 3c 01 0f 8e 20 09 00 00 66 41 83 be 30 09 00 00 00 74 07 45 84 ff 75 02 <0f> 0b 0f 1f 44 00 00 65 44 8b 3d 01 4e 67 05 48 b8 00 00 00 00 00
   RSP: 0018:ffa0000000bafb80 EFLAGS: 00010046
   RAX: 0000000000000000 RBX: 0000000000000015 RCX: 0000000000000000
   RDX: 1fe2200044524126 RSI: 0000000000000000 RDI: ff11000222920930
   RBP: ffa0000000bafbd8 R08: ffffffff8c419c7c R09: 0000000000000000
   R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000015
   R13: ff11000222920014 R14: ff11000222920000 R15: 0000000000000000
   FS:  0000000000000000(0000) GS:ff1100159121e000(0000) knlGS:0000000000000000
   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
   CR2: 000005d5cf5e3200 CR3: 00000001282cc001 CR4: 0000000000771ef0
   PKRU: 55555554
   Call Trace:
    <TASK>
    ? set_task_cpu+0x5/0xdf0
    move_queued_task+0xfc/0x650
    ? is_cpu_allowed+0x341/0x820
    ? __this_cpu_preempt_check+0x13/0x20
    sched_non_preferred_cpu_push_stop+0x7b7/0xb10
    ? __this_cpu_preempt_check+0x13/0x20
    ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
    ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
    ? sched_non_preferred_cpu_push_stop+0x5/0xb10
    ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
    cpu_stopper_thread+0x205/0x410
    ? smpboot_thread_fn+0x307/0xa60
    ? __pfx_cpu_stopper_thread+0x10/0x10
    smpboot_thread_fn+0x352/0xa60
    ? __pfx_smpboot_thread_fn+0x10/0x10
    kthread+0x3a6/0x4d0
    ? __pfx_kthread+0x10/0x10
    ret_from_fork+0x68e/0xb40
    ? __pfx_ret_from_fork+0x10/0x10
    ? __kasan_check_read+0x11/0x20
    ? __switch_to+0x592/0x1210
    ? __pfx_kthread+0x10/0x10
    ret_from_fork_asm+0x1a/0x30
    </TASK>

>> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
>> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
>> ---
>>   kernel/sched/core.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 1a088d4576f5..8ed7613eafd6 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -11317,7 +11317,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>>   		rq->npc_push_work_pending = false;
>>   		update_rq_clock(rq);
>>   
>> -		if (task_rq(p) == rq && task_on_rq_queued(p)) {
>> +		if (task_rq(p) == rq && task_on_rq_queued(p) &&
>> +		    !is_migration_disabled(p)) {
>>   			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
>>   
>
> I thought it is unnecessary.
> https://lore.kernel.org/all/4e2421fe-4b26-4d92-8709-bfa8d3a4114a@linux.ibm.com/#t
> 

Sorry about missing this.

> Can you share how you are running into this?

Yes, I asked my LLM to reproduce the issue.
First, it wrote a ko to control preferred cpumask switching, making cpu1
preferred half of the time and non-preferred the other half, while cpu0
is always preferred. Second, it wrote a userspace bpf that is initially
pinned to cpu1, then changes its affinity to {0,1}, and continuously calls
BPF_PROG_TEST_RUN, beacaue it invokes bpf_prog_run_pin_on_cpu(),which include
migrate_disable().

I think the biggest difference of sched_push_current_non_preferred_cpu() and
balance_push() is that sched_push_current_non_preferred_cpu() runs in irq context
while balance_push() runs in task context.

So, a balance_push() path be like:
    task context:
    migrate_disable()
        preempt_disable()
        migration_disabled = 1
        preempt_enable()
    is_migration_disabled()

While a sched_push_current_non_preferred_cpu() path be like:
    task context:                       irq context:
    migrate_disable()
        preempt_disable()
                                        is_migration_disabled()
        migration_disabled = 1
        preempt_enable()
So I think a recheck is necessary.

Regards,
Fushuai.
