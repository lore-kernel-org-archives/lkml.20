Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380220;
	b=nMTVCuz8zrW7SmhdUOdRhNEhU3Ur67UYl5I/3MmtFwIfgIQDJDKBBN9asqSKyjQ2m32F
	 vJbXiZvvILJ3bIioLAZPO4uJsnfdj2Fg29bQy7wDC10Q8vYDduNr8dpJKwQOZt/zyaMYk
	 8WCcSt0V0p4ygCU3n9VfLx4mgw6vtbRhJVzlaMJA9NNqWIn+Bc7fKDr2Y544k2iV7mauV
	 9N0H/IlnrF9P0dhaHhs2xV58Qh/KB7BJd20govHwemnxOUtf6h3Ktjs2CkzrR5AOpbYmx
	 0WUPv5K60+7eRGGPHUGHA/EaGowRa9QzDjEPYbPnNo0kxnXkIs70ms5ZfScE2iJlGPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=RVLcv6zKH1BoTG3sQqbFYNoEzC22RlRRF312R8k02Ag=;
	b=VgOTrxMi7Lh6mWw3qUAoCVL0qA3zySZ+REUo/ueDMyZjhxpF1uOhCJRJvk4iJ7bmJg8R
	 b0FZnZoXZiVrRka7NvD7uiD1ga+thUM+k8jtgk2hADB2fCaI5jR6Rk4M0sdS+D5pI9wTM
	 DJi57zIoLS2HVfGsyxgiDkioMVPA/5qu+qnC64yPUd8QHLyCN8Su3ZP57UAIHnTEFW5Ia
	 upKuS21MC52x685EPBhvyMbKiXNeZjMmqxJZqE7cN4jxpPThseihhTVhpkYhMuGrzRS3I
	 xlDLt/nDlCMjS4LoqtocPkIa0t/aaNncu0JmrHlTaAFxt45LGK+cW8C+40a2zZQjdmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBdRe2a2;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F1606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBdRe2a2
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so1208017c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380219; x=1793985019; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RVLcv6zKH1BoTG3sQqbFYNoEzC22RlRRF312R8k02Ag=;
        b=HBdRe2a2f7EIshTi+8RVNrPz3n1fFzKWMKeDPsbmeZZNYqbOZ4f69JQIUoXVMI2BfZ
         lCFtly6CQfm4kgvLUgVKhFNczqZrZnrDz8fBiSvd3Okl5ts9dtdX/dhN/h/+sBUAyBBw
         iqjRKOrFHCmNSblqrS/JqshhkWL7JkcKqGg7//ePnrK4gRKSFhlCW2A8utLisbAKFFf8
         cwiUbPP1+yRko2XMipJ98XVCSXWvgh1sQCE3yXk04/+AHPv08wKlRD5EbcGH6jT4uWpT
         nOEjkMRGg1zUSSsycWspUpW9HIKRj2zuvtga1wclJNOI1STsLDXB+yyoTB78AXptYvR9
         3Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380219; x=1793985019;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVLcv6zKH1BoTG3sQqbFYNoEzC22RlRRF312R8k02Ag=;
        b=d/08i1C8c4REED5WUDhkFstzvZoWJI17FVcPCMufZvFGpd5e/zC3Beubtqpq538my6
         cRwcFGg5V0yf70CfuX0cYPjWgTmjL+JOf7MOgttWtFgkxtDvCJjhSgclslrUDd3ZY4F3
         tby/zXBnrQvM3qQ2u/C0tEJUvkXT9jLYBtapquBOhkgZ8dby3EEZupzIC7LzT2irSg07
         FdJet3rS3SPEXmIozCPF3XH91b+N7SBc2pJFViV0elgYsBNl7JMc1C5Ys5Dtc6rDJyoT
         2w3r8q4dCm31nE2Ba1Pj7JFbOjoxeKVRQrnSgMy0jTCfzScuDxyLaHBLLRo0KINsW5Wv
         k38Q==
X-Forwarded-Encrypted: i=1; AKwUvByIxGdtoVqNnDxqrdbDLSqJFXsQ1wcWEeSnO138u+be7zCE5D8N2XwW4iNcDL3RoLM+Ee+7WYXioVU/jdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP6e3wDj/GEYHnTiZvV6l+3/+PtEWU6iG4q46ifPbj4qszDrSo
	qmRKa112EgLkBksVFeZTop7VGbuZGF0zN2HmhYopxk6GH/dlTdTNUaYY
X-Gm-Gg: AYBFou1vrkDx2DcP2SPFf+QJ8LDkK3aCMEeuIjuZDBCUOBbn325IE16msVQhHCyesOv
	z78nrgMpZ/0CyIpdqUQPS77Zlgem0wEoQvdUXwBdHYc5nEnbgeHqwrxt/zT7Zkj2C2WDFkrZLfn
	p8NXDmkC/LmzCoe7Or+G6TKjVuC1Sc9nzLz+wG7ISKmv1qPU1Agym82rsj0VswH16rRN+Uk+PGF
	iRk7Za1QF8S4skIE1tl/41R6KMOK6d+h6kzgxC2hbGunoW1tMEROdghHgYhM33upDqq93M/8Y6k
	2CF5+VMtE3SxKUAMrPxtK8uxqId4JoBHWu9FH6jmAXUn6Q2udCbGzNkY87jZ9kfaeJw4cEvtAc6
	AYJpHyFFNEO+gSp52V1LULIgKnBF1NTPTH6+q2WZXpXz2NUtS4dGEWGh+f14GlqWpUYF6Y9Jtjv
	MNBQJIt9MocwYfx8zPPhNjulMlk1m77uoWtaoknLC3+SqD73j6Mz3CXVUjLHihuWQACqrpDNQwU
	ffOPtjrYjRf8ehE9QI6QuxwBmN3QZ+xZ3Lq+VFmzMbASEoJ6NaYXEjof45/DXDDR8DfxsxD+hOa
	g4aCzTGfsyeIqA22gi1WDE9/8Hw=
X-Received: by 2002:a05:7023:d0b:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1ac5de53bbdmr4084875c88.41.1793380219122;
        Fri, 30 Oct 2026 10:10:19 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm10616964c88.9.2026.10.30.10.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:18 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de, Vishal Chourasia <vishalc@linux.ibm.com>
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: Re: [PATCH 2/2] KVM: PPC: Replay pending interrupts before entering the guest
In-Reply-To: <20260928110411.844582-3-sshegde@linux.ibm.com>
Date: Fri, 30 Oct 2026 22:00:50 +0530
Message-ID: <zevvup51.ritesh.list@gmail.com>
References: <20260928110411.844582-1-sshegde@linux.ibm.com> <20260928110411.844582-3-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Hi Shrikanth,

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> After applying preempt disable patch, i.e PATCH 1/2, Christian reported
> a subsequent warning stopping his board to boot properly.
>
> WARNING: at .kvmppc_fix_ee_before_entry+0x10/0x28, CPU#0: qemu-system-ppc/4667
> CPU: 0 UID: 1000 PID: 4667 Comm: qemu-system-ppc Tainted: G        W           7.3.0-rc4-2-powerpc64-smp #1 PREEMPT
> Tainted: [W]=WARN
> Hardware name: varisys,CYRUS5040 e5500 0x80240012 CoreNet Generic
> NIP [c00000000005dc3c] .kvmppc_fix_ee_before_entry+0x10/0x28
> LR [c00000000005f298] .kvmppc_handle_exit+0x5b4/0x5e8
> Call Trace:
> [c000000086587780] [c00000000005ee10] .kvmppc_handle_exit+0x12c/0x5e8 (unreliable)
> [c000000086587830] [c000000000062068] .kvmppc_resume_host+0xb8/0x10c
>
> It triggers below warning...
>
> static inline void kvmppc_fix_ee_before_entry(void)
> {
>         trace_hardirqs_on();
>
>         /*
>          * To avoid races, the caller must have gone directly from having
>          * interrupts fully-enabled to hard-disabled.
>          */
>         WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);
>
> This happens since kvmppc_prepare_to_enter does first local_irq_disable
> followed by hard_irq_disable. This leaves a small window where interrupt
> may occur and it could set the irq pending bit in PACA. When that
> happens replay that interrupt before entering the guest.
>
> Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/all/b8f82519-9ae5-c247-e020-e79c627e57df@xenosoft.de/
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9194cf492d1c..847ff07c364b 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -147,6 +147,19 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>  			continue;
>  		}
>  
> +#ifdef CONFIG_PPC64
> +		/*
> +		 * Interrupt arrived between the soft and hard
> +		 * disable. Replay it and retry guest entry.
> +		 */
> +		if (unlikely(local_paca->irq_happened != PACA_IRQ_HARD_DIS)) {
> +			local_irq_enable();
> +			local_irq_disable();
> +			hard_irq_disable();
> +			continue;
> +		}
> +#endif
> +

I looked at the commit which causes this regression, I see there are few
more call sites which can hit the same WARN in kvmppc_fix_ee_before_entry().

So what I was thinking was - while we are at it - do you think we could
use the following helper instead of {local|hard}_irq_{disable|enable}()
pair and ...


/*
 * Hard disable interrupts before entering the guest.
 *
 * On 64-bit don't use local_irq_disable() here. It only soft-masks, so
 * an interrupt can still come in before we hard disable. That interrupt
 * gets marked pending in irq_happened and kvmppc_fix_ee_before_entry()
 * then throws it away. hard_irq_disable() clears MSR[EE] first and does
 * the irq tracing itself, so there's no such window.
 *
 * On 32-bit there is no soft mask and hard_irq_disable() doesn't do the
 * irq tracing, so use local_irq_disable().
 */
static inline void kvmppc_irq_disable_for_entry(void)
{
#ifdef CONFIG_PPC64
        hard_irq_disable();
#else
        local_irq_disable();
#endif
}

... and then update the other call sites too which the following commit
added - which can cause the WARN.
   Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")

Thoughts?

-ritesh

>  		guest_enter_irqoff();
>  		return 1;
>  	}
> -- 
> 2.52.0
