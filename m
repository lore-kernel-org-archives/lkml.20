Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B83B0584
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672148; cv=none; b=bRaNFDAGpDKyJW7eRbA872n5iCDRBK14sj3jg+4+zmFOxNVZyLvooDKKNRkDv11dD26z38idwRvbwPuRSN3cnQtoW7SSg6YwuwGBSt1hB1kQhb8aoGuAztzbSvQNyXQiDO8v9Rua6lH3iqWi9bb62O0B3wv7h/OqLLCVAgc8ifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672148; c=relaxed/simple;
	bh=1T3Z2WqvmjbttmqZBVjM8IsvSFhmUm8sJer5PtKWNmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Irpg57Ej6t6KCqPuKVkQvdsjakQTB/JbhrK2mN3kwaJCOdAC9MxSn2N2yrjA24MgtljRZge90MQXw8/gEWjVFLWbJ6FtGhB9eMLP3QZtSJjyLgBeOi1F3QT5XxDt38IkIixrmxnaljRkz8w70Oohhw/6SdjMzK18uCslWNfZ/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=H1UbTJFR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="H1UbTJFR"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ZUWU2292593;
	Tue, 29 Sep 2026 08:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TYKMRu
	OuRpGldXulawvHLGeCTD/ugQlZlPJM3n2puC4=; b=H1UbTJFRwwPOPQ+EZiJBnB
	1LePLUvfjIgU0QttNK9HomvpnRIJK97Wz5Fj/jVPS4SZ1AMZIDPWkWspr+n2/olQ
	kvW6T2FC04KdEtNO+vLQqQ+w1+FTwNM5kQeoTYFDzL/catVwqgu/rx9olhJ/Xo3J
	BVGp6WghdRluUIXqSQAMQ1b9GwbbCj05ZLCJU2axSOevgvUi10TQgGNim30Zk6CW
	Pf/JIviIP7N89Z2BqW8vx1eIbdnZ499GAveSvVqeYNbNrl8qZggjhWE/c8gwHePd
	2udT1Lg75bUEgUhaD4WBdQ+y7fLqZrm5i5tnCeKPmJ7TsRHPTm/pMrlGMrGFsJOQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx4fe5g5j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 08:50:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7WS5p1390136;
	Tue, 29 Sep 2026 08:50:16 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gxu2y8qwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 08:50:16 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68T8oFlm16581172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 08:50:15 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3444F5805C;
	Tue, 29 Sep 2026 08:50:15 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F5215805D;
	Tue, 29 Sep 2026 08:50:11 +0000 (GMT)
Received: from [9.61.249.121] (unknown [9.61.249.121])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 08:50:11 +0000 (GMT)
Message-ID: <dee6b8a9-8799-4945-9846-d9b1bfe6ebd6@linux.ibm.com>
Date: Tue, 29 Sep 2026 14:20:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: fix NMI exit ordering: restore soft masks after
 irqentry_nmi_exit()
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        ritesh.list@gmail.com, sshegde@linux.ibm.com, mkchauras@linux.ibm.com,
        ruanjinjie@huawei.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20260929071600.2963954-1-mkchauras@gmail.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260929071600.2963954-1-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FYWiV5+6 c=1 sm=1 tr=0 ts=6abb7bc9 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=IGkpBAwnVNaApzdPf5QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX9i5jOK7ScgcK
 iOO8PADE5zw1vG++d6TbrDwflEGWR+g1PYcUuF3xgVbUB+aPOaPgWRdJwRZXwCUOKatNeRoij4w
 8BCt2p5CGRXiqG2NyFeNXYqabxKejQQ=
X-Proofpoint-ORIG-GUID: 7QK2m4bCfmmzh1pE8hdvpiz-XEgcxjxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX0YkSDxQcQ2Y4
 KxVVrpoiH6EYcVm+6A4MXy3Jrov5EbsXxZBMGeWrt25Gng5bKIRi31Qj0VXyqz9SoaHv5IAvRQ4
 3lEouuBUB3MHTHPQWcYNTUcpkjV6JAeC7fiKh5OxmbL64S+91xegD/mR0/2C71CYbt0kILkppKh
 3e57coEnf/KboqTHMYXqDfTv9ASP3YMzltz2fSlXrk0e9xryibnRTyZayZEFe55yidYf38Jd5hV
 OFbdy5FzMyvoRNsMdc9i6qYIz0fb30bEKniNqAPELAS5nkhWGSFUwtkrRUi/PjT0u/Ar+QSocv6
 qc0pE9UxflOGoRPDuDo5xo8ZmVnJ4DB/7DHshAKu5i61FGzMfjopmJi0n735Jpt3mlf3vYKzhuN
 FdnpbBuFmRKQfdKr/vEPDEpxUDMe8U1BCHN2hA5sSSF/aeb0CnQEPAmRfp1zOGo6IepTuOBYWBQ
 XDic6BEM3ZOEwE7eZPA==
X-Proofpoint-GUID: J7qtAU6BpZmlcLghR1WJdYDgOhbPF8du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290034


On 29/09/26 12:46 pm, Mukesh Kumar Chaurasiya (IBM) wrote:
> When running with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y and LOCKDEP=y, an
> Oops is triggered during NMI exit:
>
>    [  202.258332] Oops: Exception in kernel mode, sig: 4 [#1]
>    NIP [000000000003e178] 0x3e178
>    LR  [c00000000003e174] arch_local_irq_restore+0x2a4/0x328
>    TRAP: 0700  MSR: 0000000000081000 <ME>
>
> The faulting instruction at NIP is a 'trap' (0fe00000) inside the
> rfi_flush_fallback trampoline at a userspace-looking low address, reached
> after a bad rfid caused by an incorrect SRR0 value.
>
> Root cause
> ----------
> DEFINE_INTERRUPT_HANDLER_NMI used to call arch_interrupt_nmi_exit_prepare()
> *before* irqentry_nmi_exit(), giving this sequence:
>
>    arch_interrupt_nmi_enter_prepare()   // saves irq_soft_mask, irq_happened
>    irqentry_nmi_enter()                 // __nmi_enter() -> nmi_count++, in_nmi()=true
>    ____func(regs)                       // NMI handler body
>    arch_interrupt_nmi_exit_prepare()    // RESTORES irq_soft_mask=0 (IRQS_ENABLED)
>                                         // RESTORES irq_happened with pending bits
>    irqentry_nmi_exit()                  // instrumentation block runs here...
>      trace_hardirqs_on_prepare()        //   ...with in_nmi()==true still
>      lockdep_hardirqs_on_prepare()      //   ...and irq_soft_mask already restored to 0
>        -> arch_local_irq_restore(0)     // mask=0 -> enable path entered
>             WARN_ON_ONCE(in_nmi())      // FIRES: __nmi_exit() hasn't run yet
>      __nmi_exit()                       // nmi_count-- (too late)
>
> arch_interrupt_nmi_exit_prepare() restores irq_soft_mask to whatever
> the interrupted thread had (IRQS_ENABLED / 0) and restores irq_happened
> with any pending deferred-interrupt bits that were present when the NMI
> fired.  This is correct and necessary before rfid back to the interrupted
> context, but it must not happen until irqentry_nmi_exit() has fully
> completed.
>
> With irq_soft_mask=0 and pending bits in irq_happened, the
> trace_hardirqs_on_prepare() call inside irqentry_nmi_exit()'s
> instrumentation block reaches lockdep_hardirqs_on_prepare() which
> calls __trace_hardirqs_on_caller(), which eventually calls
> arch_local_irq_restore(0) (the IRQS_ENABLED / enable path).
>
> arch_local_irq_restore() with mask=0 hits the CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
> guards at irq_64.c:217:
>
>    WARN_ON_ONCE(in_nmi());   // TRUE: __nmi_exit() not yet called
>
> The WARN_ON_ONCE fires a 'trap' instruction (tw 31,0,0 / 0fe00000) in
> kernel mode with MSR_PR=0, MSR_IR=0 (real-mode).  The program check
> handler (TRAP 0700) takes the sig:4 (SIGILL) path via do_program_check()
> and calls die(), producing the Oops.
>
> The RESTART_TABLE mechanism in arch_local_irq_restore then causes the
> bad rfid that lands at the userspace-looking address visible in the NIP.
>
> The bug is invisible with LOCKDEP=n because trace_hardirqs_on_prepare()
> is a no-op when CONFIG_TRACE_IRQFLAGS is not set (TRACE_IRQFLAGS is
> selected by PROVE_LOCKING which selects LOCKDEP).
>
> Fix
> ---
> Move arch_interrupt_nmi_exit_prepare() to after the irqentry_nmi_exit()
> block, so that:
>
>    irqentry_nmi_exit()                 // __nmi_exit() -> nmi_count--, in_nmi()=false
>    arch_interrupt_nmi_exit_prepare()   // now safe to restore soft mask state
>
> The instrumentation inside irqentry_nmi_exit() now executes while
> in_nmi() is still true (nmi_count not yet decremented), but
> irq_soft_mask is still IRQS_ALL_DISABLED (NMI-entry value), so
> arch_local_irq_restore() is never called with mask=0 from that path.
> After __nmi_exit() returns, arch_interrupt_nmi_exit_prepare() restores
> the pre-NMI soft mask and irq_happened, which is the correct state for
> the rfid back to the interrupted context.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/d4cccba9-ce5c-424b-864c-2248fb0d99e6@linux.ibm.com/
> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---


This fixes reported problem.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,

Venkat.


>   arch/powerpc/include/asm/interrupt.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 1b45a49e9bed..56f855c6f07e 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -301,7 +301,6 @@ interrupt_handler long func(struct pt_regs *regs)			\
>   		state = irqentry_nmi_enter(regs);			\
>   	}								\
>   	ret = ____##func (regs);					\
> -	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
>   	if (mfmsr() & MSR_DR) {						\
>   		/* nmi_exit if relocations are on */			\
>   		irqentry_nmi_exit(regs, state);				\
> @@ -317,6 +316,7 @@ interrupt_handler long func(struct pt_regs *regs)			\
>   	} else {							\
>   		irqentry_nmi_exit(regs, state);				\
>   	}								\
> +	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
>   									\
>   	return ret;							\
>   }									\
