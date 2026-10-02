Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51C47F760
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938655; cv=none; b=uZGaSksXaltbI3C0qGA4OcS98Axy/tCih0eW2KvAit3n/uZvqD1phyab6cyCEtF0hc7XgloX3M1AzXB3ecpXHRLd7Pz8r/fRCQt3nQCXfoGghTyw17YffjfA79HLvZjQhsO+v8QLJEwWpUzI0Naacfo2MNOqNhIb73alddhLHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938655; c=relaxed/simple;
	bh=DDpBAxQvsbg2/jiKL4a+FtIaxSAo3T3yIF1NJ3SCaEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMXpKEs0a+qcGgt8H0d50Zh2q3+Rkn5SKSRos+UD8u3X5GNYmiSVnC9fFzHty0kvFhSpTFuBBY3o5aKjUqBV+2Wwl2z9avtFvmCv01SIPc7Lr77dgrwgEN8y0JQ2zr3AZTSBlkPZJNjAbRDR7jMnzljhf3t5sm43d/YJavul//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aeX0Ehnu; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aeX0Ehnu"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692A6M5c201016;
	Fri, 2 Oct 2026 10:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2TwFs/
	Sj+shkkHJXZzu3sYvGwUbAVGhMb438Mt4ni10=; b=aeX0Ehnu72gzPvRc05fG+L
	cET8f6186QdV2qEmEzMcy1fsbLC8b2utQMMqoy9UosXHyY7krcLX0ndufmaU7j94
	5sFicH/R9PyuuOkP6aKwgkW6EfDohg6AQ2q74iwHQG70XGohawYY4wAHjePoBpWY
	aHtYK6vNeQH2lZnxnlPIA6IPi5NHenFDT71EdkS5jwnAyIyvJ46lPtbJrDWyEnEa
	kpOfFtzihrWUBNZG0CnB+PrVcjzGtDpljyhMP8m42Gkj7vh3kNQ2KPXd27Q6IxkE
	+bsMsYhyIClw45dmMJTBoO7v+ic44KH1CC3Mtc82mcNqu0wMLHNwS/MekZgt/p8w
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5s5rqkx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 10:56:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6929m6v81068493;
	Fri, 2 Oct 2026 10:56:51 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4pkwjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 10:56:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 692Aum1d32637328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Oct 2026 10:56:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1160F20043;
	Fri,  2 Oct 2026 10:56:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCE5A20040;
	Fri,  2 Oct 2026 10:56:44 +0000 (GMT)
Received: from [9.124.216.180] (unknown [9.124.216.180])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Oct 2026 10:56:44 +0000 (GMT)
Message-ID: <5409ae4d-1d1d-426b-a810-f12ef40bf86b@linux.ibm.com>
Date: Fri, 2 Oct 2026 16:26:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: fix NMI exit ordering: restore soft masks after
 irqentry_nmi_exit()
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
        apw@canonical.com, joe@perches.com
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, mkchauras@linux.ibm.com,
        ruanjinjie@huawei.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <20260929071600.2963954-1-mkchauras@gmail.com>
 <ar9qRKA1mavDruDR@kunlun.suse.cz>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <ar9qRKA1mavDruDR@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX47za45Sfgo/8
 we0Osn31a5EdUnqseetcf1nALyt5gDItRLoJhJdxwRz9qhvrYXlMR8EVFvrrxvm5DToz5IJKexG
 AMw/k4rRMtfoE3+i6G2b1+o88yIv1HY=
X-Authority-Analysis: v=2.4 cv=HJ5WhYtv c=1 sm=1 tr=0 ts=6abf8df4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=FiM658NnN0yobQVnnbsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pWcSIifE8bNAZkdtKfsdR0f_CyCTrHPB
X-Proofpoint-ORIG-GUID: jFGL3MkBebbktQfVkQPuH1ImT4c2aqGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX5hZGfaRE0Tws
 PERO9MXwgkhPrIkOcq5pDtw+J538Bxn0qKLth7TziK0hsToOO7n/a1Y259X3Aey/W/lL/XtBKKc
 zLU7yOPuCzhgC9gURycRTzut1K7NQ0OXEZlX4J2uoFCSpQbVw9NiYOqjoayC2tmKdd9awArl4Me
 l7n+xaYhjtnYdQ1pfyH/mbiWKN2ZRoyH/HWGOeIIDyRk6Xny9HAv71cwCBX0iMGlSbIpWFAncyH
 1lFmQ8TB7qjTHuNi6r99VBbEBLMu8E/ZN9x12NY6rFk5rL6r4U3QnRPBAFBQpDq9MegRIiCTtYy
 4ryALWpd0vKNn8HuA7bsx6OexebBT2GTw5AjtroM4ZDOgBFYIJO3jt9s2p3fUkgSzxeGBL0Bu8H
 SE/PxINOOqOAgRSgRAQCiOdO2SZU6bBvYb5I7f7BP5jMcSo4xCTUjtdGg30kt0vnKHS4s45BXoi
 aU7brdLYI9KGLIW+ziQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042



On 10/2/26 1:54 PM, Michal Suchánek wrote:
> On Tue, Sep 29, 2026 at 12:46:00PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
>> When running with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y and LOCKDEP=y, an
>> Oops is triggered during NMI exit:
>>
>>    [  202.258332] Oops: Exception in kernel mode, sig: 4 [#1]
>>    NIP [000000000003e178] 0x3e178
>>    LR  [c00000000003e174] arch_local_irq_restore+0x2a4/0x328
>>    TRAP: 0700  MSR: 0000000000081000 <ME>
>>
>> The faulting instruction at NIP is a 'trap' (0fe00000) inside the
>> rfi_flush_fallback trampoline at a userspace-looking low address, reached
>> after a bad rfid caused by an incorrect SRR0 value.
>>
>> Root cause
>> ----------
>> DEFINE_INTERRUPT_HANDLER_NMI used to call arch_interrupt_nmi_exit_prepare()
>> *before* irqentry_nmi_exit(), giving this sequence:
>>
>>    arch_interrupt_nmi_enter_prepare()   // saves irq_soft_mask, irq_happened
>>    irqentry_nmi_enter()                 // __nmi_enter() -> nmi_count++, in_nmi()=true
>>    ____func(regs)                       // NMI handler body
>>    arch_interrupt_nmi_exit_prepare()    // RESTORES irq_soft_mask=0 (IRQS_ENABLED)
>>                                         // RESTORES irq_happened with pending bits
>>    irqentry_nmi_exit()                  // instrumentation block runs here...
>>      trace_hardirqs_on_prepare()        //   ...with in_nmi()==true still
>>      lockdep_hardirqs_on_prepare()      //   ...and irq_soft_mask already restored to 0
>>        -> arch_local_irq_restore(0)     // mask=0 -> enable path entered
>>             WARN_ON_ONCE(in_nmi())      // FIRES: __nmi_exit() hasn't run yet
>>      __nmi_exit()                       // nmi_count-- (too late)
>>
>> arch_interrupt_nmi_exit_prepare() restores irq_soft_mask to whatever
>> the interrupted thread had (IRQS_ENABLED / 0) and restores irq_happened
>> with any pending deferred-interrupt bits that were present when the NMI
>> fired.  This is correct and necessary before rfid back to the interrupted
>> context, but it must not happen until irqentry_nmi_exit() has fully
>> completed.
>>
>> With irq_soft_mask=0 and pending bits in irq_happened, the
>> trace_hardirqs_on_prepare() call inside irqentry_nmi_exit()'s
>> instrumentation block reaches lockdep_hardirqs_on_prepare() which
>> calls __trace_hardirqs_on_caller(), which eventually calls
>> arch_local_irq_restore(0) (the IRQS_ENABLED / enable path).
>>
>> arch_local_irq_restore() with mask=0 hits the CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
>> guards at irq_64.c:217:
>>
>>    WARN_ON_ONCE(in_nmi());   // TRUE: __nmi_exit() not yet called
>>
>> The WARN_ON_ONCE fires a 'trap' instruction (tw 31,0,0 / 0fe00000) in
>> kernel mode with MSR_PR=0, MSR_IR=0 (real-mode).  The program check
>> handler (TRAP 0700) takes the sig:4 (SIGILL) path via do_program_check()
>> and calls die(), producing the Oops.
>>
>> The RESTART_TABLE mechanism in arch_local_irq_restore then causes the
>> bad rfid that lands at the userspace-looking address visible in the NIP.
>>
>> The bug is invisible with LOCKDEP=n because trace_hardirqs_on_prepare()
>> is a no-op when CONFIG_TRACE_IRQFLAGS is not set (TRACE_IRQFLAGS is
>> selected by PROVE_LOCKING which selects LOCKDEP).
>>
>> Fix
>> ---
> 
> Hello,
> 
> please avoid excessive formatting in commit messages.
> 
> When git am is used to apply this patch it strips everything after this
> line

Yes. Good catch. Please run ./scripts/checkpatch.pl --strict always.

I am seeing this pattern quite often these days.
Maybe it is worth updating checkpatch.pl to catch such things.

ERROR: Invalid commit separator - some tools may have problems applying this
#18:
----------
It flags this one, but if i remove that line it doesn't flag subsequent the --- tag.

What I would want checkpatch to see if there are multiple --- in the commit message,
Flag it and show it as error.

+cc Andy, Joe. Do you think that's good to fix it?

> 
>> Move arch_interrupt_nmi_exit_prepare() to after the irqentry_nmi_exit()
>> block, so that:
>>
>>    irqentry_nmi_exit()                 // __nmi_exit() -> nmi_count--, in_nmi()=false
>>    arch_interrupt_nmi_exit_prepare()   // now safe to restore soft mask state
>>
>> The instrumentation inside irqentry_nmi_exit() now executes while
>> in_nmi() is still true (nmi_count not yet decremented), but
>> irq_soft_mask is still IRQS_ALL_DISABLED (NMI-entry value), so
>> arch_local_irq_restore() is never called with mask=0 from that path.
>> After __nmi_exit() returns, arch_interrupt_nmi_exit_prepare() restores
>> the pre-NMI soft mask and irq_happened, which is the correct state for
>> the rfid back to the interrupted context.
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Closes: https://lore.kernel.org/all/d4cccba9-ce5c-424b-864c-2248fb0d99e6@linux.ibm.com/
>> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>> ---
> 
> because it's the same as this line that marks the end of the commit
> message.
> 
> Thanks
> 
> Michal
> 
>>   arch/powerpc/include/asm/interrupt.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
>> index 1b45a49e9bed..56f855c6f07e 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -301,7 +301,6 @@ interrupt_handler long func(struct pt_regs *regs)			\
>>   		state = irqentry_nmi_enter(regs);			\
>>   	}								\
>>   	ret = ____##func (regs);					\
>> -	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
>>   	if (mfmsr() & MSR_DR) {						\
>>   		/* nmi_exit if relocations are on */			\
>>   		irqentry_nmi_exit(regs, state);				\
>> @@ -317,6 +316,7 @@ interrupt_handler long func(struct pt_regs *regs)			\
>>   	} else {							\
>>   		irqentry_nmi_exit(regs, state);				\
>>   	}								\
>> +	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
>>   									\
>>   	return ret;							\
>>   }									\
>> -- 
>> 2.55.0
>>
>>

