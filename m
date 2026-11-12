Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467461;
	b=JVyImImA/QQPezAemj2ns6kBxhwVTmFDsz9JSWzaM35nHsF+QMtlTyXQVlhGhwrJ2wMb
	 EdijkTxCRvPHk7GymnTtlb03502BE0F8iC9i8lUmOU1VfxrOVbBKp3Rz67aD/VvD6A0Jd
	 QRTWs4aztHOizNl4nBpjAzZXT3AOG2cfa0I2RRBRGzWmCyPMDa/MzShE6sBviNQaVcwyS
	 R7yYKl5vQJveakgSk8NzS0k+Cw0fl2G8C9ji90OuS4vdgvHT2HLlhgvfQHXh5XQ7/VrDy
	 3gDhTWofsN6IS9DHykxNgFbi096nRSZOdeOyvgtEBef1Adcm8pO1cY/oXPAYr001brA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bam7xp0wKd9NthErk/ZzQ3KYZ8ciAxCqEVr2lw2zM1g=;
	b=d6kE+z6yHUdospTNNoGnJ7bZiU4lgBGk2yIFIAZ67zrNokz51WW8BYIf3raNGuSuUQXX
	 e0xVrD1zq/uYQL966o3DESPiCnWplTVIJfx+Ng6m3Q5k39PVKOfj5GrZBRSmLjrVjOAOd
	 G4UXeDpzAVTMMpnwOAsvsmw6IN86sVSJMDo5jrDjihCwLiF0RMjSVkiIF7xfWxYUj9Rb8
	 vXWgaEgK51OapF0/WQRRZ2M+m/r+4fc46wHrscclzzXjYtkT7vPmIE3RAqGhKl+6xUfg2
	 qIenP/cUrpdUOTqvryFbPY+jGC5MqXDVetlPeQZowh4AnI8hH794FTufvhWctnXIe7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JdVe3vFe;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F70606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JdVe3vFe
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2356634b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467460; x=1795072260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bam7xp0wKd9NthErk/ZzQ3KYZ8ciAxCqEVr2lw2zM1g=;
        b=JdVe3vFerqSyZkhXZpCVJ3HrX+NPoo09IkrNSteuXQRlRAxMR9Z2Qb4vQ3tPq3PQO2
         V3SClHiV01P5Z29bFCKuPzJSbN4WMkTZ6Qe3AxQ+q2KhHJ3zQv9QLJKRFqYj4YdXZxOr
         FFhdbJ/d5toNHoCEhav9bHsNPuKCFUA9niZjGmel3UkY3cOxACWWe+KhNKEaHys5axEd
         t/7+R3mqvdtBWzwiWLBxCgblQTpGoM4id/284T2bbh2JYDnsv3onWQHQcVjOqHUkSo5O
         q+SGZPBi9P1tIUpqc68xccVeQv8arG/3Ye4uj7QF0cw8K5RK7TtTeFaXyvtKrwNCK+D5
         3ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467460; x=1795072260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bam7xp0wKd9NthErk/ZzQ3KYZ8ciAxCqEVr2lw2zM1g=;
        b=OFv18vtUCxpJEl/paNNF7pIJc18ycYsecQIivnl8sgg0tP/zE/RF/bq1AAJoCStq/l
         PttRTzQ+tMWJnPzMIgk21p5RH3sOsRWbmGUBU34b2trqtCzEqkVRQ5Jrsph9v4t8OG8x
         UT9hV+W+iftT3zVWHwTKiE5n1vp+kJLIWxhTL+X1O4erv+PTmS3Qv10xukNg22j8P6mq
         GMkHcml3ltroj0CITMS3O88h1HB0fi5wZbWEHkq3m8UfV9rAfm2PxwVCi8KpSuc98dH4
         K6yhG2Qn9Mzh8W9aARYLpYVcmBoOkfjyriUyAn33Ql1M/hihQJd0aY8xMFe5rfAEvbnh
         xV6g==
X-Forwarded-Encrypted: i=1; AL+hErHqjCRKVfl8n85JSY2b8bg3oZ+zLdBkEG5Lvdwd+lfd4+3tHkbTQWy8bJENU6FveumSV10Py4KxlnPKvM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Frwv5ftcI9vkO2Mlkz3BUYBQgNGDiDErAHEOTPWonExGA7frV
	lPnElTVgYzfHNYFlwW8YMB4dsWdn6EB1loS5heXnXLNWMCX/iPweC661
X-Gm-Gg: AYBFou0zznAsRH1t1ztmvWsorgRuEgXYyeqiAbO78IyK13vjOtypPBc6XNw87eVXPA8
	w3YxT81UdfCM+/pZChm0uqPxXRs8UkmIfGdwtuSAh6pOPaZiC+JgF+j8KGyic51EFrrbX+REbDr
	64c+EHGs8CNIcmdwu9i/LvcBJktmjlP9fjcgoRg2D8oANvx5tSG+Z7FXeoD9tX00GQMZOR+65bK
	e49Q3SVEa/BlTNq6in3ajxMDNOV9AaJZjI+Wcp5+hCl83dyiKJFFWqViE6rXQPLESIg/HI8CvkZ
	Mq1t3VjIazZOiFA03Tdq0wS++vo/hofvMgSo65JitOgKum4nefiVAu3oVFt4AO2105sg3J3QFFI
	6xP242/Es0O9QWdpKX17NpGTULSdhtz2vEfY0LBywLEqtBVPrpUeFfGGlREscLf2PYYEhH66Zkg
	pzwHN8pIhYRpgtU3XBU3wQwwwuUtiJBqiwKqIzzScqnzkm09nLdhHjdPJKtMp1hYYarAjS+4VOK
	Jv+K0EanaBIaIDt3G7fDpI5LWQMu6RpcAOAYl2aEw167nd26KaExgUGmjCN3VIjHrzeDYhZQxqJ
	hyMLjo50WLpP1YJB5+yJlQuJTP7B/udk93tTFmiR2t1WwXLFdT+Oz/q/rwMwNm/G4vk7wJmUkQ=
	=
X-Received: by 2002:a05:6a00:39a0:b0:886:9187:1a00 with SMTP id d2e1a72fcca58-8bc1cd64cf1mr4696362b3a.59.1794467460359;
        Wed, 11 Nov 2026 23:11:00 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fd5c6sm2999042b3a.46.2026.11.11.23.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:10:59 -0800 (PST)
Date: Thu, 12 Nov 2026 12:40:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	chzigotzky@xenosoft.de, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, 
	ritesh.list@gmail.com, harshpb@linux.ibm.com, gautam@linux.ibm.com, 
	amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: Re: [PATCH v2 3/3] KVM: PPC: Use ppc_hard_irq_disable before guest
 entry
Message-ID: <avVma1vGZ2cbRM5G@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261110053238.3794500-1-sshegde@linux.ibm.com>
 <20261110053238.3794500-4-sshegde@linux.ibm.com>
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
In-Reply-To: <20261110053238.3794500-4-sshegde@linux.ibm.com>

On Tue, Nov 10, 2026 at 11:02:38AM +0530, Shrikanth Hegde wrote:
> After applying preempt disable patch, i.e PATCH 2/3, Christian reported
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
> may occur and it could set the irq pending bit in PACA.
> 
> That local_irq_disable was necessary for PPC32 to track the lockdep
> state etc. On PPC64 hard_irq_disable is good enough. There is no need to
> do both. Use the new irq api to do the necessary one.
> 
> Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/all/b8f82519-9ae5-c247-e020-e79c627e57df@xenosoft.de/
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/kvm/powerpc.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9194cf492d1c..4ee3d7bfe917 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -81,13 +81,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>  	int r;
>  
>  	WARN_ON(irqs_disabled());
> -	/*
> -	 * local_irq_disable() first: on 32-bit, hard_irq_disable() alone is a
> -	 * raw MSR[EE] clear that bypasses the lockdep/irq-tracing state, and
> -	 * the xfer_to_guest_mode helpers assert IRQs are seen as disabled.
> -	 */
> -	local_irq_disable();
> -	hard_irq_disable();
> +	ppc_hard_irq_disable();
>  
>  	while (true) {
>  		xfer_to_guest_mode_prepare();
> @@ -101,8 +95,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>  			 */
>  			local_irq_enable();
>  			r = kvm_xfer_to_guest_mode_handle_work(vcpu);
> -			local_irq_disable();
> -			hard_irq_disable();
> +			ppc_hard_irq_disable();
>  			if (r) {
>  				/*
>  				 * The generic helper does not set the exit
> @@ -134,8 +127,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>  			local_irq_enable();
>  			trace_kvm_check_requests(vcpu);
>  			r = kvmppc_core_check_requests(vcpu);
> -			local_irq_disable();
> -			hard_irq_disable();
> +			ppc_hard_irq_disable();
>  			if (r > 0)
>  				continue;
>  			break;
> -- 
> 2.52.0
> 
LGTM

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
