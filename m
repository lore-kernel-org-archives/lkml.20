Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E818F49E132
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124340; cv=none; b=KFy7/bdchd9vz2ans7fpJ7KzAblQ8fgmJvJTakzvg93uKXIfldO1Supoi+/iiIlIDjxI4W1jtCam3feUhaIxyy0b8kQdYR9aHBPk8XmEJ9Ci2YVkcHh6hhnLBGtsrbxE+W0C5zY4QyBYVgPyFzMJdT/pfFNYhvyOCAKGZubHYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124340; c=relaxed/simple;
	bh=t54f66oISK5iLoC6zpVoCghpLtMAejdCBH7P2FWAB/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwUN0orWyjyxvtSUkGFu5YOt3DaPeLnxN4n3lhYjTwWm1qg9zWQBBNPGgQSQ5EZookUj7aVQw0DF0HFA+v45EcClXXUYNqgeuV74doVxSro6ILx3TcYYk7VNBTpLB3iQL2UJUDknkx3vJ/6KvKX1lcDUy2e9DYZZMMrKvEsTH70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hLTFi+T7; arc=none smtp.client-ip=91.218.175.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hLTFi+T7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t54f66oISK5iLoC6zpVoCghpLtMAejdCBH7P2FWAB/4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789124335; v=1; x=1789729135;
 b=hLTFi+T7imAmAFDzilxVYmL1GgORoH4hGMVg5odIJ0FugZlzP8aD4amuXHCh5TdmXuDjBJzY
 EZJAEovNkH6p0Lk+2uHqH1W6mJ49new87cB7fV8zaDn0ppfgjUqpq8sF7+CliHd22ng6zEQK2A3
 0+wH3CVs64xPN0AiQQ2BHj1M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26c3139e797f0e96;
	Fri, 11 Sep 2026 10:58:55 +0000
X-Mizu-Trace-ID: 26c3139e797f0e96
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so4062e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRLZAm3YkvNsUn+OHS7+HWPRuzIRC2H4rdU0ETzYp5Log26zSxHumKRLoRXNKwzdsKZe7jb5xvbkmW2Rg=@vger.kernel.org
X-Gm-Message-State: AFuF++lIopWuKovNT6WKWcj8ffzjACMWRM6Z97OACSk3vHdZpO/duwtD
	r7O3jKNb4ctg+2FoAqK3srXua/Ma7dzGxM4A4lr4HzwwpFIZAUnI3i/E4bsQXGGPVyzMv+d7y14
	hBZkwOjxl2YI9ET1Uz//V3aL7O7aJcpXU6UdMO1QA
X-Received: by 2002:a05:6512:405a:b0:5b8:9e63:dfb9 with SMTP id
 2adb3069b0e04-5b8a053c7f3mr113768e87.0.1789124334038; Fri, 11 Sep 2026
 03:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-14-fuad.tabba@linux.dev> <86ld986pyr.wl-maz@kernel.org>
In-Reply-To: <86ld986pyr.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 11:58:17 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy5LOs7Uan9iDBDnTFBPMaA39cy1eDHYgTu=kEDHSB85w@mail.gmail.com>
X-Gm-Features: AcwNN1Vx-RhBgSQI6So9JMpD9_gKVmdeipliE4IOgkG_23MW8gI5glXbC9akMCU
Message-ID: <CA+EHjTy5LOs7Uan9iDBDnTFBPMaA39cy1eDHYgTu=kEDHSB85w@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] KVM: arm64: Pend a protected guest's SError with
 HCR_EL2.VSE only
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 11 Sept 2026 at 11:29, Marc Zyngier <maz@kernel.org> wrote:
...
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> > index d6c4fc16f8795..b88098a7e756c 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
> > @@ -378,8 +378,11 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
> >        *
> >        * As we're emulating the SError injection we need to explicitly populate
> >        * ESR_ELx.EC because hardware will not do it on our behalf.
> > +      *
> > +      * The host does not see a protected guest's PSTATE.A: leave the
> > +      * vSError to HCR_EL2.VSE below, which the guest masks itself.
> >        */
> > -     if (!serror_is_masked(vcpu)) {
> > +     if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu)) {
> >               pend_serror_exception(vcpu);
> >               esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
> >               vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
>
> I can't say I like this very much.
>
> The fundamental premise is that as far as the host is concerned,
> PSTATE.A is always set. So why can't we give the illusion of this at
> all times?
>
> That'd be a much cleaner approach.

I'll have EL2 copy PSTATE out to the host with A set instead, and drop
this patch in v3.

Cheers,
/fuad


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
