Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C34B4881
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948703; cv=none; b=hyBb0xMkBpX3hUpqaavDQOMov08gND2I916IS64/ZRAfIst0AUzX0Of5ZC56K6gzgFM8VV7R6fDzSJb7fmrhr9oAiMYgnEHfjCBIRK05UEC2KiRF/IpAefePvAixQStr8uM0cHojyi9JwutnxqLCsvvybkh2q3JLxMelOXYXPX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948703; c=relaxed/simple;
	bh=5EiGj15A0eLFvoPTV6W/KjOo/rEvUMtZHsehd/WgHqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqSuG+8T5nlkJGTCSsZEdTy4hfIDbf4bZEgjGLrBI+YPPZnsRkbvSqKpL2d+VDREUAShywS+k8HnVwhdnUVHcxHOZzlD/ZKqO2lIvhxM0TcU724BAyF4fv4s+NiPgDPS0F/lFchK/pmbuXQ53SFUdRznkVbGa5WwFa+VFu15NEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7wgdeb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhmvL1lM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7wgdeb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhmvL1lM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899mSp7959384
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 10:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLE1dkRLq4YMtaAiaGg+prVtWZiKQZaVu6a3Wza42u4=; b=S7wgdeb6hbh/eg8I
	IJ3yA1rwsY8gVY6H0Rk/5JBVS6VXZif9G9emoS2ITGUjJltbsgMOrUlor9oWhBf/
	oZiDrJwuPIpqky/imye8gHkrP7Pr3ZEy4q6eogUEwJ7zKnAXpKkcxgL+yvSp9+Sm
	KpibNE5wMQHx6t7n0X76Dw+mOIjJQnFuXD+XinNOO42jou2hZiYu2MspzGoc7wnP
	AiTtJCQDEqScLQPTLfc59h5RtN3MtsvQoYprwqyNwtLkPDR0srNRp9IFX0JY+J1A
	io+Sxt8NGhGwJ+NyBSMUzxBCmu8EL1tkdagXLSDai7xppi5tV6CBlqrRFdtO1pYL
	5YvNMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559r2rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:11:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so10263788a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788948698; x=1789553498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLE1dkRLq4YMtaAiaGg+prVtWZiKQZaVu6a3Wza42u4=;
        b=hhmvL1lMIIXsIbXUr3jJQF+lMQBzIRGOoz7g+APm4Df2KequDRNmKChQUahqsgUYmN
         LVTZSIsX+PdjpFO/jQXxyN44Hlzjr0+11Q2rlMd6LbvoHmx/ptKAwijuz8GGu6u83FzB
         SoNJ7iy9HOyw1ZuwjZQKhvbmsKRLKZeJu8IS6ooGkjCm2d8tq/tE2s1KTGVOW2kSuwvW
         5W04FdXRFfDdmLDsMffMKv8oLh0mWTk2s0kxLKR40tS3kcS95zgpnytlK6lZbim17LIJ
         iWdBUxcOs0KQl7p8YTi4D2rK+zc00cF7ggzw+FK5/225kZ8GI0DmT2pns+L2R3LpSR22
         xkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948698; x=1789553498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLE1dkRLq4YMtaAiaGg+prVtWZiKQZaVu6a3Wza42u4=;
        b=m6oRIgMbSB8zx/FN0qAVk9aLv/0nw1niAx16Q/NochzMUHYvazDuo8qt/PouxHM3YD
         Jl0/d6Hzxcwg/bqW35+InnqMDaUaapogw6hIeCcHIUyjZXBFTs35EZ6vQGhXAmEwZH6+
         J0uOE+kvIFRTuaYA89bzcN4jCt9BoWPTkrcCQ/LEYdmL+MwvEn4IPbhZLpJ5otV525wA
         EsKmXgiuuUPgB+H8g8t4YAfb9ffkhvPP5pgjW0hPAHfstESOxtCBOWZu3vv+gORNKmPZ
         S7R227lBSWxB+jMC4gBDg+UXzWW2ha1I5ySR5QxoNeuTLvKRsf6BJvog8WIu3ao5GhTz
         F8pw==
X-Forwarded-Encrypted: i=1; AKwUvBxfn4+OZqqMvAlxPv81R9jqpdxL2+tXHAMoWg0HOF242lT6eHLJg21g5dgHVoMYblnV+5wi5qFTwjMVNZc=@vger.kernel.org
X-Gm-Message-State: AFuF++lRSbOz4V0Kxtrwzz3ijx+Im/39bsEZXcFzKyuVS+MSWWZSgU2A
	hdEIj6HNjGGW7sITL1nRfHt33tDxWjnikLdIw9SvjovEi03SCq8C3RXTxC3789+nt52PBiTA/au
	LjxbLB+Hi11ygoMYpWKHT0OfEaW5aD4K+pOdRIqezChxPf11EuUiQALI/WHZSuH8amxl6Qwg9F8
	Q=
X-Gm-Gg: AYBFou1dr+hUgUrfH4v4qbb/hn9XY1RQQ0SVeEOidpqjn8uilc2DbOWMyIAp5dW1HYC
	FKkbYtkGsxOZQ+wy/pC2RaUjYDrLbsW6mpnj/79Vt3gqL7B7Neq27EDbq1+CqhInfnQE63khu1T
	CfRxldBOYyV1ennkD/MGgCKPo2NhSZYjD0uEc44cv5huNW+HX1N9xWHvY8cQgVEG3IdkETX5JZ+
	ZYrHbLz/b1Y02FYaels1gKDMYwmBR0Yl4lsdamsHyW2giq1+7B/NmhccWw0Ur95m2c/dmD4J1dG
	stZh1SDAEsUfJF9CYGEza1A1p9uVgUQcE9BtN8v5Sh+d+ft+Sq0dM1DGf9uGy48HeTI6YgjZiKk
	AnrYFdfdrGCI3vFVZ8lB1aW9tfelQbV/1WQ==
X-Received: by 2002:a17:90b:55c6:b0:398:9be5:b41d with SMTP id 98e67ed59e1d1-39b26299670mr51461303a91.24.1788948697659;
        Wed, 09 Sep 2026 03:11:37 -0700 (PDT)
X-Received: by 2002:a17:90b:55c6:b0:398:9be5:b41d with SMTP id 98e67ed59e1d1-39b26299670mr51461228a91.24.1788948697101;
        Wed, 09 Sep 2026 03:11:37 -0700 (PDT)
Received: from [10.218.24.187] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm39913080c88.1.2026.09.09.03.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:11:36 -0700 (PDT)
Message-ID: <9ee3f32c-1d2a-4599-bf0c-9d55a1226fc2@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:41:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] printk/stop_machine: Defer legacy console flushes
 while a CPU runs a stopper callback
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
 <87o6emy69n.fsf@jogness.linutronix.de>
 <4aa6f4d0-20f9-490b-8625-f4af5ad0dbfe@oss.qualcomm.com>
 <aqEtNaR0EI3fzTCx@pathway.suse.cz>
Content-Language: en-US
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
In-Reply-To: <aqEtNaR0EI3fzTCx@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa130da cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3fO_UW3D7KTFcZBUdJgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4ew_QUk95bNEZyGoec4aVNWADL_AB0kB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDExMyBTYWx0ZWRfX5sSNErMAMW6F
 TPbMZMbMn3ao1ZQHhSgIZ2+EtyOZTU1LpBs1Rd7ZIhPtks/CiwKt3fS4SGEuH3QW9+Pccga0gbd
 S5gnrXDI0rdJSvIQs1C37EL35yEaXJw=
X-Proofpoint-GUID: 4ew_QUk95bNEZyGoec4aVNWADL_AB0kB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDExMyBTYWx0ZWRfXzypFRypTKAQk
 C6ngw8W6DcT/XL0I4ZCwKdJBu7xjwSH6DtftMzhxTzebqJpCa752LJp1kvZMYAeHWGDQlXcu19/
 NqI3IHXDbZcmU0C78RetMCrRKbwywPtp02fApgpWSgqmk/QH+NGyToXXx0M+1TQbt5JV1hO00zM
 I3wJTt6YTjFhTN8b7aICDtYwWVu4ECGUVZ7qcLEeK+MmQ75spZYJMe+V6KNV1WmLirtBu5gD7T6
 5jbWyxoocpAv5NyS19FWwJQkaESTIyTwFoBJn7psNqEgB6YAYjqfHuvbRyHBaKAnUV7OTGnhZ3Q
 G0da4j9014xBUD9bdw11kiPEF6HkSqYRqsljRpjTjTmTkE3YBmUEwlNxr1rSltvJRB+r2v20fu/
 jOJF8Lpo/DiMdjB2vqg6nq5L5ycDL/FIWV3xOqhMrvVsQV80flwI3Xq281DAzjUIh801rlQ7++d
 AzD+jW9Nc4U7GmZfX0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090113

On 9/9/2026 3:26 PM, Petr Mladek wrote:
> On Fri 2026-08-28 15:36:48, Aditya Chillara wrote:
>> On 8/28/2026 2:24 PM, John Ogness wrote:
>>> Hi Aditya,
>>>
>>> On 2026-08-27, Aditya Chillara <aditya.chillara@oss.qualcomm.com> wrote:
>>>> A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
>>>> watchdog bark/bite about 40 seconds after boot.
>>>>
>>>> stop_machine() (used here for kprobe text patching) stops every CPU by
>>>> running multi_cpu_stop() on each of them, through the per-CPU
>>>> "migration/%u" threads. These threads run at a higher priority than the
>>>> msm_watchdog thread. At bite time, all eight CPUs were still spinning in
>>>> multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
>>>> enabled.
>>>>
>>>> Heavy SELinux denial logging had built up a large backlog on the
>>>> console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
>>>> Handling it eventually led to a printk(), and because the console was a
>>>> legacy console, that printk() synchronously drained the whole backlog
>>>> over the slow UART. While the drain was still running, the watchdog bark
>>>> interrupt hit the same CPU, found no recent pet, and escalated to a
>>>> bite.
>>>>
>>>> The captured stack for that CPU, innermost frame first:
>>>>
>>>>   qcom_soc_set_wdt_bite
>>>>   qcom_wdt_bark_handler
>>>>   __handle_irq_event_percpu
>>>>   handle_irq_event
>>>>   handle_fasteoi_irq
>>>>   generic_handle_domain_irq
>>>>   gic_handle_irq
>>>>   do_interrupt_handler
>>>>   el1_interrupt
>>>>   el1h_64_irq_handler
>>>>   el1h_64_irq
>>>>   console_flush_all
>>>>   console_unlock
>>>>   vprintk_emit
>>>>   dev_vprintk_emit
>>>>   dev_printk_emit
>>>>   __dev_printk
>>>>   _dev_err
>>>>   btspi_sleep_timeout_handler
>>>>   call_timer_fn
>>>>   __run_timer_base
>>>>   run_timer_softirq
>>>>   handle_softirqs
>>>>   __do_softirq
>>>>   ____do_softirq
>>>>   call_on_irq_stack
>>>>   do_softirq_own_stack
>>>>   __irq_exit_rcu
>>>>   irq_exit_rcu
>>>>   el1_interrupt
>>>>   el1h_64_irq_handler
>>>>   el1h_64_irq
>>>>   multi_cpu_stop
>>>>   cpu_stopper_thread
>>>>   smpboot_thread_fn
>>>>   kthread
>>>>   ret_from_fork
>>>>
>>>> Every other CPU stayed parked in the rendezvous the whole time, since
>>>> their stopper threads outrank msm_watchdog. Nothing could pet the
>>>> watchdog until the drain finished.
>>>>
>>>> This was observed through multi_cpu_stop(), but the hazard is not
>>>> specific to it. Every cpu stopper callback runs in stop_sched_class,
>>>> above msm_watchdog and every other thread on the CPU, so a slow flush
>>>> from any of them (including single-CPU callbacks such as the migration
>>>> and task-migration stoppers) can starve the watchdog just as well. The
>>>> fix therefore covers all stopper callbacks, not only multi_cpu_stop().
>>>>
>>>> Fix this by having the cpu stopper mark the CPU active while a callback
>>>> runs, and having printk use that marker to defer legacy console flushes
>>>> until the callback returns:
>>>>
>>>>   1/2 stop_machine: Track when a CPU executes a stopper callback
>>>>
>>>>       Add a per-CPU flag, set in the stopper dispatch path around the
>>>>       callback, and an in_cpu_stop() accessor.
>>>>
>>>>   2/2 printk: Defer legacy console flushes while a CPU runs a stopper callback
>>>>
>>>>       Route legacy console output through the offload path instead of
>>>>       flushing it directly while a CPU is inside a stopper callback, and
>>>>       flush it once the callback returns. Emergency and panic output is
>>>>       unaffected.
>>>>
>>>> Reproduced and verified with an out-of-tree test module that triggers
>>>> stop_machine() with a queued console backlog and a printk() inside the
>>>> rendezvous, paired with a kprobe-based script that flags any console
>>>> flush happening while a CPU is inside a stopper callback.
>>>
>>> Generally speaking, we are not taking the whack-a-mole approach to
>>> workaround all the known legacy console problems (there are a lot of
>>> them!). However, if there are problems that occur during normal usage
>>> (as opposed to crafted tests), then we can insert workarounds.
>>>
>>> For workarounds of known legacy console problems we have the deferred
>>> enter/exit functions. These only affect legacy consoles and literally
>>> exist for these purposes. I would expect the following patch would also
>>> solve your problem.
>>
>> Yes, this fixes the issue.
>>
>>>
>>> John Ogness
>>>
>>> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
>>> index d085ba1f4b44e..31f7af41249f1 100644
>>> --- a/kernel/stop_machine.c
>>> +++ b/kernel/stop_machine.c
>>> @@ -507,7 +507,9 @@ static void cpu_stopper_thread(unsigned int cpu)
>>>  		stopper->caller = work->caller;
>>>  		stopper->fn = fn;
>>>  		preempt_count_inc();
>>> +		printk_deferred_enter();
>>>  		ret = fn(arg);
>>> +		printk_deferred_exit();
>>>  		if (done) {
>>>  			if (ret)
>>>  				done->ret = ret;
>>
>> Tested-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
> 
> John, are you going to send it as a proper patch, please?
> Or would you prefer Aditya to do it?

Petr,

I discussed with John, I will send a formal patch soon.

Thank you,
Aditya

