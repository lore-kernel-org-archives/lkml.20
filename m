Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C66A385D7B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911616; cv=none; b=ueH95a7WBgAk2jGUHxcSDJct3r1zESysmEwyVUfVgXl9G9SgsRDTXHh+MTBxhJ4EK18+mQvBw29KC5WtdlVroucPH1xAaB9TiWWEEfYhqIfpAMk+d3YEqtmOaorAjdlEAeVdCnUD/N+BxL2V+nPtZFBSWaAoNIUrj3iZmKAfzCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911616; c=relaxed/simple;
	bh=Im66r9Ij3U5fdDnZtw6pRxuLD5otyloNx3T0pBCuqTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GB4Mlb2c6NbDlzYDbBwVXhvQnvlQGVllI+xD9CuKICLF2EZgDmNkf/nxgrhXWcrYDkYP8itG8v4UT0kVoZlILGg/sK29uki539DggFMJ3ScOxgNTVN0gKgfqvjPPdfo5Sc85DLS1jVkycBrjaXMVUJW0XzlNFTYdn1HriXm7R8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJj/Ba+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqUG+6uo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJj/Ba+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqUG+6uo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66Zm41520543
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfJQaiR/t8I/D/ncV27HtpOTFwHtTjmLAe25GgRpyZc=; b=cJj/Ba+nXbG3Jl+F
	qBEvgFeDCvyhiaLJdxN6D6FVEQuI0Smx9Kj7IDElevH7MVGBx4ff5v9eiQsBBQO1
	gzC/YOBc77Sm62YAiuFcRzDU45L2RjKJIvJSvrO66YOAy1QqfZYbQZiSnL0nNoNz
	34I5SwHbq4Qk1P1iUlVIFSeMLMe4RXxZ/Wogmaxkjzp4OzdsS/SOgXylsarrTCZ2
	kxoV7tRu11E6p/a7L6OjFuxz3hydnJo0NJNSnOttFufIKyo/YGaT1o/C0iDaF94j
	7DUKfFPkJdjBPH2Q46dsEXUlpfy2JU50+3DlBSGADrNSocYitvVsNkX0BROApEwi
	1ebJiA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu96e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:06:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1345602a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787911613; x=1788516413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfJQaiR/t8I/D/ncV27HtpOTFwHtTjmLAe25GgRpyZc=;
        b=YqUG+6uo/QffSsAbUPa3hRp4rZlQJvIdEzQppXKse6r3owIdtXEYLalmlaIfGaIkm/
         TFAusu0ULXOmTA5rPe8y9kehRx20MwKcopbMXlrQ8Wyoa/YuywrhJbvGLuhIzhGtIell
         5cY6I4NffvGKKREJg1YFxeMU02i+OexXMQwxfXUhb08o96KsRirGOlwFC+z50Af8TYhF
         5yK++pIlZvvv9AnEgiYzJYX47xEnfRY3lezg3SCI9ak4rnpF0OWMngbvMLlHxD1K5GNK
         2J6Sc1FOswap01HYhYml/ueIVROwvGk37982Gw133mgeb4JiskRo1ey+jDhTIgRX9xtq
         dAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911613; x=1788516413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfJQaiR/t8I/D/ncV27HtpOTFwHtTjmLAe25GgRpyZc=;
        b=gHmK6w8C9HQ2TmBYZZsPh3H+KrWkC5Re/ePypxyUU01rpJECG46fwkuqKZUNwz2qTR
         3MOdYlAk3GD4bOOW60G6ex3+Ay2zxjj3kLUK45cs4i7PMEUOqTzXAORxlT7zJ0DUdwrx
         VXw9ueeuv9zD6/8KT+HGtrbrrLUbcDvn5HLMeMJgY1RLryp4NzGX2p5LCGPGFb8Xo3Sy
         aRWhIRObpqXgKh/r7lUu30DYMj59h/kEv1jDexhQcc9inrUvOSpgWb4vrwi6wptEKml7
         33lT+2JM+TU3m//GrQ9prqan2ecPrRolMfRSsv2F+olcEbJoaZAmsNb4amX5mIZmc0DH
         5VKA==
X-Gm-Message-State: AFuF++l5EaXoh4OryMh8EHIszh1cOdzeVHXrmpjK7xnFKYGoG9FFRyeA
	NAjYVpB7ynDgTssEkp2aWMRVvz6NHidZduLskFNQNwFL11sX/NyGR/EvTpQS7+6+1Rg0Gj/ZqsF
	OYenp4UB9JLeV2v2cl7L0NpjrTZIpH2Oxf3lOHA7Vw3NTSHN83iyZmC0WyD1mnRn+Ro4=
X-Gm-Gg: AR+sD13DKEZI00wIkwBTgEOhgzQeMQwO2+hNczy0f0Ka3T01W9hLwV2dxhBuYUNo1MW
	Q0dsc7YEhLvjTJK0/pMMUP7zmaP/ng1R/Fe7aceB/0iNBp8X5RloEOuH1hwj2QK3jWuAXGulmvk
	luCoNxx/u4nwZ4WuX3oD/+kmIatKQKHrWOuVqvJ0MMyDxoyG2QLMCUeNMQCZkSoEncYsrj7J6W1
	WKijbi84NmI23jTfr+BteEgKDSS5yovtg8psMCvxq173w5g5q2tRhACTMhWa6IuX1lxL/6SGRcB
	H7AqBfuisw8gw5ndWJ24zN53pvYDz8NqIl89yiB1zkIjwuTDX7cXXvxeFmBeildXBq2wTYi2mHV
	VVkde968+ez1KjPauKxCQjkT2C29ZOPyX/Q==
X-Received: by 2002:a17:90b:3c08:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-396d0f9ad1fmr12391561a91.15.1787911612854;
        Fri, 28 Aug 2026 03:06:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-396d0f9ad1fmr12391445a91.15.1787911612322;
        Fri, 28 Aug 2026 03:06:52 -0700 (PDT)
Received: from [10.218.24.187] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm9694196c88.14.2026.08.28.03.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:06:51 -0700 (PDT)
Message-ID: <4aa6f4d0-20f9-490b-8625-f4af5ad0dbfe@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:36:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] printk/stop_machine: Defer legacy console flushes
 while a CPU runs a stopper callback
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org
References: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
 <87o6emy69n.fsf@jogness.linutronix.de>
Content-Language: en-US
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
In-Reply-To: <87o6emy69n.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a915dbd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cu_ltsl906MAnycmaDAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 9p6acfu7O-xxJh_NI4Cw76tVHtQkNwJX
X-Proofpoint-GUID: 9p6acfu7O-xxJh_NI4Cw76tVHtQkNwJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX+GgvXAUVcHja
 VweKnLLzr1erP8i2fR6ymCHpWX+NlDcQwfYuokVAEDparQGhGgGEmIqhUIhGfkdCL2pI9f+ZOOd
 Rz+hVrIFw3SAekZP/q5WRJSsuD4DTbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX+BHPjsD8HX2J
 M6OkTt0gYF7zxC7oCHvCS9Lr5tJBROyQFE93//alMkZ473BF8CgK8jbuzGrRm5th/nce4xsbhv0
 X0eK1m5SlbqEOi4KZekzPcYjOFRSNNIjk4VAJIl2k40woCPfOshCbF1V3NdnZUkH0V/hnI3aOPd
 oonQeP6U7FRFD7/xpbRTxtD3yfEWjBmRq2Kolu90m4eKQSDxEacFy+zNmKRQ49PKTm8YrBcAITl
 9D6E3VDL/wHT1z4CucXEU1ARdgIlaGwBHB5W6TZ66jN4m4QUNpq54ASBk2bMDmt4QmsXUJgtIdx
 j9kj9MQS3UX9rB3NDq5VBONeptiQTGz/sohIdBK0blya5t4tapBSdX/jvIjbNRSCr8+O5waZtO4
 4ntIMErx3++S4asPwt/S7Qd0vQyT7I9CIOpUwr0rwduyVLhnKXxzRyuluA/u8ZLw2i/hxVvBX1e
 sLEbR+O6532DjJ+yljw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280086

On 8/28/2026 2:24 PM, John Ogness wrote:
> Hi Aditya,
> 
> On 2026-08-27, Aditya Chillara <aditya.chillara@oss.qualcomm.com> wrote:
>> A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
>> watchdog bark/bite about 40 seconds after boot.
>>
>> stop_machine() (used here for kprobe text patching) stops every CPU by
>> running multi_cpu_stop() on each of them, through the per-CPU
>> "migration/%u" threads. These threads run at a higher priority than the
>> msm_watchdog thread. At bite time, all eight CPUs were still spinning in
>> multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
>> enabled.
>>
>> Heavy SELinux denial logging had built up a large backlog on the
>> console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
>> Handling it eventually led to a printk(), and because the console was a
>> legacy console, that printk() synchronously drained the whole backlog
>> over the slow UART. While the drain was still running, the watchdog bark
>> interrupt hit the same CPU, found no recent pet, and escalated to a
>> bite.
>>
>> The captured stack for that CPU, innermost frame first:
>>
>>   qcom_soc_set_wdt_bite
>>   qcom_wdt_bark_handler
>>   __handle_irq_event_percpu
>>   handle_irq_event
>>   handle_fasteoi_irq
>>   generic_handle_domain_irq
>>   gic_handle_irq
>>   do_interrupt_handler
>>   el1_interrupt
>>   el1h_64_irq_handler
>>   el1h_64_irq
>>   console_flush_all
>>   console_unlock
>>   vprintk_emit
>>   dev_vprintk_emit
>>   dev_printk_emit
>>   __dev_printk
>>   _dev_err
>>   btspi_sleep_timeout_handler
>>   call_timer_fn
>>   __run_timer_base
>>   run_timer_softirq
>>   handle_softirqs
>>   __do_softirq
>>   ____do_softirq
>>   call_on_irq_stack
>>   do_softirq_own_stack
>>   __irq_exit_rcu
>>   irq_exit_rcu
>>   el1_interrupt
>>   el1h_64_irq_handler
>>   el1h_64_irq
>>   multi_cpu_stop
>>   cpu_stopper_thread
>>   smpboot_thread_fn
>>   kthread
>>   ret_from_fork
>>
>> Every other CPU stayed parked in the rendezvous the whole time, since
>> their stopper threads outrank msm_watchdog. Nothing could pet the
>> watchdog until the drain finished.
>>
>> This was observed through multi_cpu_stop(), but the hazard is not
>> specific to it. Every cpu stopper callback runs in stop_sched_class,
>> above msm_watchdog and every other thread on the CPU, so a slow flush
>> from any of them (including single-CPU callbacks such as the migration
>> and task-migration stoppers) can starve the watchdog just as well. The
>> fix therefore covers all stopper callbacks, not only multi_cpu_stop().
>>
>> Fix this by having the cpu stopper mark the CPU active while a callback
>> runs, and having printk use that marker to defer legacy console flushes
>> until the callback returns:
>>
>>   1/2 stop_machine: Track when a CPU executes a stopper callback
>>
>>       Add a per-CPU flag, set in the stopper dispatch path around the
>>       callback, and an in_cpu_stop() accessor.
>>
>>   2/2 printk: Defer legacy console flushes while a CPU runs a stopper callback
>>
>>       Route legacy console output through the offload path instead of
>>       flushing it directly while a CPU is inside a stopper callback, and
>>       flush it once the callback returns. Emergency and panic output is
>>       unaffected.
>>
>> Reproduced and verified with an out-of-tree test module that triggers
>> stop_machine() with a queued console backlog and a printk() inside the
>> rendezvous, paired with a kprobe-based script that flags any console
>> flush happening while a CPU is inside a stopper callback.
> 
> Generally speaking, we are not taking the whack-a-mole approach to
> workaround all the known legacy console problems (there are a lot of
> them!). However, if there are problems that occur during normal usage
> (as opposed to crafted tests), then we can insert workarounds.
> 
> For workarounds of known legacy console problems we have the deferred
> enter/exit functions. These only affect legacy consoles and literally
> exist for these purposes. I would expect the following patch would also
> solve your problem.

Yes, this fixes the issue.

> 
> John Ogness
> 
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index d085ba1f4b44e..31f7af41249f1 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -507,7 +507,9 @@ static void cpu_stopper_thread(unsigned int cpu)
>  		stopper->caller = work->caller;
>  		stopper->fn = fn;
>  		preempt_count_inc();
> +		printk_deferred_enter();
>  		ret = fn(arg);
> +		printk_deferred_exit();
>  		if (done) {
>  			if (ret)
>  				done->ret = ret;

Tested-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>

Thank you,
Aditya

