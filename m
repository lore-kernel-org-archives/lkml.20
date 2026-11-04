Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807181;
	b=kkRAr83K/qEAZiJMz5jPfVAWv/+sIwQ5lq+HMEVyOMmEjyRwCvVd2iSU212RFgkLzZ7V
	 YWj4n4alqLc4cBQ3zme2shd+xD4WwrpCVOBvpjsUa0HWQJilm22j0AKQbwHhVgBmXC5ld
	 LPEwJo6RceHPxksEJOQ7t/9BQiL5vmh5bl2U7DbSpEMHZ5nh2u7Y89xgq++Rn/y7ZV681
	 Ta1cbJ1kOAY2TboiUNqo73QZq/IuiR5aY4kI2cM8F7pPVe8Rv5vXA4fkaRMZm88fGly9J
	 F6D8htoi+Li1cajAMEleqxtrG+FOjjqQz6GoNUcZQ3SGmKDicYEhxKaaU/kn4P1kzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xyHstetzZu4XQvPCwnk3jp13Xb8802ZUHS/kaqfC9G0=;
	b=S9po5w7nlx4P5dpfCsJxLggnqlVjIdL6DR400r9yYtKHrHI7kjIUDTiQl6I8t8x4U4+Q
	 vcuLdNbCabunopKKP99EJGqdLlbsbWz97mDUufoZ2NWIXC744QCKsM6p/xKCQsQUP4t6+
	 im9NUBP1D8GSLeynDthkSeY/zFGveHkgHs0Dia2wcRqD949+py2BYiUZhfnh3vEtyRzgL
	 TTmUhQN0DJu/YOoujX0mwaxZwWnJG3EmN6WjZJR3XSdHm6jm2umtpv2aYV+BbxYKxWmSC
	 +3iim5IzoQiGs0G/bkct6O+Ij34TfEDFMNd41K/JvX4RqueoydMOM1QVo+HhpmS4+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="01m2XRs/";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5936F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5936F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01m2XRs/
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso645411c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807180; x=1794411980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyHstetzZu4XQvPCwnk3jp13Xb8802ZUHS/kaqfC9G0=;
        b=01m2XRs/erj/V2avs/yce6iYARgXR/mMKyahg61EOrzR84THJFA3XlM3NGK9cLGcMS
         Z5sa/dBZa9e5Xu0MbMtPTjCfselPDIlpPirPIvmHEkh+d2p4avYOr9xS0wC4NhXmOqu/
         hn6kWqVwb6VPCEMndnar3PBySL+zw7WbhUVZM1di89gjYDYE3+xmhI88YgwjvQX2QR19
         Gmd9pCWJwu2Ahycjd2zppvTGRtBVlqFXjUJw3mU76hfDGFWm/i6aDYlcKdyXNSgzAZOx
         tvsyaPrP73tKO7UXnh42gNZ96n0OK2ckB6A0/AT+h/U7b7Rnei1D36qXVF21trjwzDI9
         cNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807180; x=1794411980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyHstetzZu4XQvPCwnk3jp13Xb8802ZUHS/kaqfC9G0=;
        b=LevHof0j4kcWi30WIMRKOtv9wyHL/BW4EPGY+wGjoM5bH+czVzHVZI3OcxvQAYREUk
         M7kDq6FPWlU3EZ8XoBI5ZmkCsPPCD1y+pOnCfRxv1i5x/HMsPJGoYukfcVc0Zd3Iygi2
         gSjiNcTWY8QNzg3zcFCyZa3UMmEhBsUlx12YP3EK/BE7iFGmPrEH17kKtMxATlpr7mxa
         cWq2iRsS7o0sq4o5ceVMh9hjML2/Q7sZFJ5rHME2/TX2MMU6FLw1RHRCbtE2MnH1Y/8K
         at+6ah3/LU/p6ZmmztmE3if3bZo/TYLV6O+FFYzxLepCftDRGCT4gpZsteYAgNsmbh21
         B10g==
X-Forwarded-Encrypted: i=1; AKwUvBx1uJaZYVPks/DcYrOHT4rZeIAjNKnDtPSNcWbeIX69ZhZdPPAkYtObXtet/gl+s1nCYRKRnE63oe6HmWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GCLnV284Ve8JHtqVJwG/wClgmr8DLyMApyuLJPGodudSEVYZ7
	M4FzS3QYoYp83UNB7gqc6N/1FP8TZUZw0k0Ssx1NMzN5rBd2RmbRjzskcEPcug==
X-Gm-Gg: AYBFou1R6hUDuspfpRNG27iUdONNf0jTL6UR2UKVsgZF43NE8f+h2yZ+qog1v9uMPAK
	eu+OIq6Jc9iu64c0RY06GkSH8j6XAuA7W5NFcnmGsCo1h7i5jUx9LSaEOLPMXljPmLO4/Fi0v5A
	uJFIghP9DgdtQu2NxTOhiZ1amwX+a+QvSNfLzi5OzWQWo+YH+BS+BTJz//IeymBM3123Jm32MQ8
	LXVVQ0wz1jw7WOw62YjBP62H75uOhiuDL8G5VXD3y2vD5Aqs8Ksn07rWrhEtIEWW1MTVqBh7p/j
	AwHm6v6cJ7q2UXYXF3CI1ueCL/T02vPCaJhsLuVvLeiDQSp9OuTD35qwQYvEvk0uAlFf1nK+4Uh
	8/3+DkQqsSg3toQaQODVEQGjSnISQHNp/+YlSDYnkKk1jun+Qo6WprtFoArwd4JKfWFBhhNPNSI
	/3DO08XX+yErscu8LL5WKuCXNvutMaYn2vwPoAZBqVsG4d8MOy7TNGy178+SfT38m5CpgVzOLwH
	6rnCh4mg/oj9cGdAsGGI0qRX+aGFAvUBP2ePqj5X2dWkLMJ16+X+Qfwl4NhUBZwj2ma+XQy7n7g
	I+sTbuyjGVRY2mTDnisXZnBJsX0S+w5R1e65xDEbcR/jrfSKE7s55z6SIRSkLpR/GUK8st0A0db
	AbOKeAcgnjj10dMd80o8=
X-Received: by 2002:a05:7022:c85:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1ac599f5132mr23755659c88.6.1793807180104;
        Wed, 04 Nov 2026 07:46:20 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm12682332c88.17.2026.11.04.07.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:19 -0800 (PST)
Date: Wed, 4 Nov 2026 21:16:11 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de, Vishal Chourasia <vishalc@linux.ibm.com>, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, 
	amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: Re: [PATCH 2/2] KVM: PPC: Replay pending interrupts before entering
 the guest
Message-ID: <autQn0FHsAql9W8l@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
 <20260928110411.844582-3-sshegde@linux.ibm.com>
 <zevvup51.ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zevvup51.ritesh.list@gmail.com>

On Fri, Oct 30, 2026 at 10:00:50PM +0530, Ritesh Harjani wrote:
> 
> Hi Shrikanth,
> 
> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
> 
> > After applying preempt disable patch, i.e PATCH 1/2, Christian reported
> > a subsequent warning stopping his board to boot properly.
> >
> > WARNING: at .kvmppc_fix_ee_before_entry+0x10/0x28, CPU#0: qemu-system-ppc/4667
> > CPU: 0 UID: 1000 PID: 4667 Comm: qemu-system-ppc Tainted: G        W           7.3.0-rc4-2-powerpc64-smp #1 PREEMPT
> > Tainted: [W]=WARN
> > Hardware name: varisys,CYRUS5040 e5500 0x80240012 CoreNet Generic
> > NIP [c00000000005dc3c] .kvmppc_fix_ee_before_entry+0x10/0x28
> > LR [c00000000005f298] .kvmppc_handle_exit+0x5b4/0x5e8
> > Call Trace:
> > [c000000086587780] [c00000000005ee10] .kvmppc_handle_exit+0x12c/0x5e8 (unreliable)
> > [c000000086587830] [c000000000062068] .kvmppc_resume_host+0xb8/0x10c
> >
> > It triggers below warning...
> >
> > static inline void kvmppc_fix_ee_before_entry(void)
> > {
> >         trace_hardirqs_on();
> >
> >         /*
> >          * To avoid races, the caller must have gone directly from having
> >          * interrupts fully-enabled to hard-disabled.
> >          */
> >         WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);
> >
> > This happens since kvmppc_prepare_to_enter does first local_irq_disable
> > followed by hard_irq_disable. This leaves a small window where interrupt
> > may occur and it could set the irq pending bit in PACA. When that
> > happens replay that interrupt before entering the guest.
> >
> > Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Closes: https://lore.kernel.org/all/b8f82519-9ae5-c247-e020-e79c627e57df@xenosoft.de/
> > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > ---
> >  arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> > index 9194cf492d1c..847ff07c364b 100644
> > --- a/arch/powerpc/kvm/powerpc.c
> > +++ b/arch/powerpc/kvm/powerpc.c
> > @@ -147,6 +147,19 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
> >  			continue;
> >  		}
> >  
> > +#ifdef CONFIG_PPC64
> > +		/*
> > +		 * Interrupt arrived between the soft and hard
> > +		 * disable. Replay it and retry guest entry.
> > +		 */
> > +		if (unlikely(local_paca->irq_happened != PACA_IRQ_HARD_DIS)) {
> > +			local_irq_enable();
> > +			local_irq_disable();
> > +			hard_irq_disable();
> > +			continue;
> > +		}
> > +#endif
> > +
> 
> I looked at the commit which causes this regression, I see there are few
> more call sites which can hit the same WARN in kvmppc_fix_ee_before_entry().
> 
> So what I was thinking was - while we are at it - do you think we could
> use the following helper instead of {local|hard}_irq_{disable|enable}()
> pair and ...
> 
> 
> /*
>  * Hard disable interrupts before entering the guest.
>  *
>  * On 64-bit don't use local_irq_disable() here. It only soft-masks, so
>  * an interrupt can still come in before we hard disable. That interrupt
>  * gets marked pending in irq_happened and kvmppc_fix_ee_before_entry()
>  * then throws it away. hard_irq_disable() clears MSR[EE] first and does
>  * the irq tracing itself, so there's no such window.
>  *
>  * On 32-bit there is no soft mask and hard_irq_disable() doesn't do the
>  * irq tracing, so use local_irq_disable().
>  */
> static inline void kvmppc_irq_disable_for_entry(void)
> {
> #ifdef CONFIG_PPC64
>         hard_irq_disable();
> #else
>         local_irq_disable();
> #endif
> }
> 
> ... and then update the other call sites too which the following commit
> added - which can cause the WARN.
>    Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> 
> Thoughts?
> 
Yeah, i also feel this is better to have.
Personally i don't want this ifdef all around the code, It's better to
have it in one place.
There's one more case like this here[1].

[1]https://lore.kernel.org/all/a14571be1897955f43d9994f0e093de3ada6ecde.1793447880.git.ritesh.list@gmail.com/

Regards,
Mukesh
> -ritesh
> 
> >  		guest_enter_irqoff();
> >  		return 1;
> >  	}
> > -- 
> > 2.52.0
