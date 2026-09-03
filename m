Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034364B8DE0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446648; cv=none; b=SBcg8zCqorf0nDJe0meTn9gvHQ1rDxt1G3VOOBx1wLpZ1Kvp+h/cLyVubzfEJJQjwNq3tnL5ml02pbUa2nCtv6DgxeDNWutWtG/m3dfrmWRRg6PsBcgtyvcdNRju447hYhb5tnZkqu++WrlD8nHCK0O47nZQuNtx4iUCKjHt2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446648; c=relaxed/simple;
	bh=ELuqRbWl/d7dwnAoN/rZEEIZG2/ycBkDZSXJhJLTFps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fTSGrEAhOGy9ztlaoFVF88NFY9aqPMDQpvAJMTFzKW/d5vYu6HNO8axmfDQjTjsEc4kigaQ7T1uQ+K3OFvcng/5lQ2ef0hxa2Pcnnu/NLq3RZLqCSy3+mRlsHXSZXUoQpkg1awJxZCpOaAXrgAVjV0U7/SGcW0P54zdCaiKtims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXgXAq07; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXgXAq07"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85524903a9cso1736381b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788446639; x=1789051439; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0PiIrFTy0jAZPA55N8PvRPAL536lW/v4rDJ21ApSMo=;
        b=qXgXAq077zOjpTE2DTKgkEdgUcozNwpU215qKi+xO5ioXcNS6LHukUgas0I01N/fvs
         lmVKD7UljFhhGv9I47pWwxf1MvoECx9a5XsZVSPQumroi1sQGjJmSXo1Z52uPKYJP1wM
         EtiWp/XluPlKAp2IRl69Z1NfuGvbTm/t/FqLPb/UmU9TPNF/0NB6zdhJaOm6SvnjUsDi
         JqstlW8tM20ESSPTpfa6OEoBCcTgnnQPJrL4UhMHzQVfLqMssDJHj9MS0mc0kAestFFP
         ZP8688Odz7vkkJlWtA7b6bPHxICub1TDjypVSpf7hvH9wqg+62qMynDlblnkAhrtfLDO
         3hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446639; x=1789051439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0PiIrFTy0jAZPA55N8PvRPAL536lW/v4rDJ21ApSMo=;
        b=REns7+uO1Xvb26sgGp2YQHZ49J0BEEIoR+B4OzBdAw6pTt2P4ZSNroMfnnk1zgkRQG
         i5wxo/Jd09ZIzoZL+C+2faM8OV9kIEZvtRZ6u9X5h3z0JxkQz1cfntbNVjNHTGvEv6KS
         Jz4ic45Z6SDJhrcb3g9YuT3IjdGipgT3qLxKok2TNRgFWePX+gGxposw+Bz+6SdGiH9u
         EGoLe46jIMywKzI6N9jBaFM9NTy1FnI1mVNYbrV5Fw6IQgFZ90eTbFbC3iqGaFVCOUpd
         XX2cEWtkFIhSGq71K51ziExcc1OkDJpG4bezm6HpkQXBNb6zC0UDK8ehgyieJMonxRfa
         0qpg==
X-Forwarded-Encrypted: i=1; AKwUvBxS3D28ARDNvKwhaPRzDEm9Q+uhnmS7OdcV83lb9tGOBiFEQHcLr58Sxg5YhR6AO/xZW8Uq/7+UoB+7jH4=@vger.kernel.org
X-Gm-Message-State: AFuF++neIEAsBVu515KTbpR6/iC8FBet4kQ9hssbcSyC63gKFgrZQ68E
	T9VFKRH8zJ9a0tuZvgsxvlNK6EgHmKocAjKBmYZo3EeB7pvOOPtK479cq3NYCROkBaHjYxNzR4Q
	TcLAkTg==
X-Received: from pfgr14.prod.google.com ([2002:a05:6a00:c48e:b0:847:926b:dc17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:138d:b0:857:74ae:ad76
 with SMTP id d2e1a72fcca58-86141ae9ad6mr626813b3a.26.1788446639057; Thu, 03
 Sep 2026 07:43:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:43:58 -0700
In-Reply-To: <20260903083857.33034-B-seiden@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-24-seiden@linux.ibm.com>
 <aphMx5hsoXwIpNjt@google.com> <20260903083857.33034-B-seiden@linux.ibm.com>
Message-ID: <apmHrnxRLl9BuVhn@google.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and Makefile
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 03, 2026, Steffen Eiden wrote:
> On Wed, Sep 02, 2026 at 09:20:23AM -0700, Sean Christopherson wrote:
> > On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > > diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> > > index 8d3ee17a1bcb..9c69ea16031e 100644
> > > --- a/arch/s390/kvm/Kconfig
> > > +++ b/arch/s390/kvm/Kconfig
> > > @@ -53,4 +53,33 @@ config KVM_S390_UCONTROL
> > >  
> > >  	  If unsure, say N.
> > >  
> > > +config KVM_S390_ARM64
> > > +	def_tristate y
> > > +	prompt "KVM support for hardware accelerated arm64 guests"
> > > +	depends on HAS_IOMEM
> > > +	depends on KVM
> > 
> > Is this actually necessary?  I.e. does kvm.ko need to be *loaded* in order for
> > kvm-arm64.ko to be loaded?
> > 
> > If kvm-arm64.ko does indeed have a hard dependency on kvm.ko, then I think it
> > makes sense to not have redundant "select" statements below.  As an outsider,
> > it's super confusing because the KVM_S390_ARM64 are incomplete, e.g. are lacking
> > things like VIRT_XFER_TO_GUEST_WORK (at least, I assume those are lacking), and
> > makes it hard to see what is actually unique to kvm-arm64.ko.
> > 
> > If kvm-arm64.ko doesn't have a dependency on kvm.ko, e.g. to initialize hardware
> > or something, then this "depends on" should go away.
> 
> 
> It is a bit more complicated unfortunately. KVM_S390_ARM64 depends on
> KVM as there is code around in the kernel & drivers (arch and common)
> which depends on CONFIG_KVM we need as well. I did not want to leak arch
> local configs to common code if I can avoid that.
> I could change it to select KVM ? Do you have another idea on how to
> solve this issue?

I would do something similar to what KVM x86 does.

> The two modules are completely independent at compile and runtime. So
> kvm does not have to be loaded for kvm-arm64 to work.
> 
> VIRT_XFER_TO_GUEST_WORK is only lacking for now. I will add it later.
> Currently the kvm-arm64 module is incomplete anyways but I did not want
> to send a 60+patches series and rather stage the introduction over
> multiple series.
> 
> I will remove the duplicated config selections. Thanks for pointing it
> out. In previous series I had an explicit KVM_S390 config. Both KVM_S390
> and KVM_ARM64 selected KVM. But this created too much churn around the
> whole tech-stack 

LOL, what exactly are you expecting to happen?  You're trying to squeeze support
in for a completely different architecture, of course there's going to be churn.

This absolutely needs to be as precisely and correct as possible, otherwise it'll
be painfully difficult to maintain,  And to some extent, just for others to review.
E.g. as is, it's at all not clear to me which of the IS_ENABLED(CONFIG_KVM) checks
in arch/s390 apply to both flavors of virtualization, versus which are specific to
"native" s390 virtualization.

I realize this is outside of my immediate scope, but getting this "right" isn't
just an s390 thing, because these details bleed into common KVM, and even affect
other architectures, e.g. when trying to make "treewide" KVM changes.

And FWIW, while it might seem daunting, from my perspective it's not actually that
much churn to do things "right".  Provide KVM_S390_NATIVE, and then have KVM reflect
the "weakest" of S390_NATIVE vs. S390_ARCH.  I.e. make KVM=m if either of the "real"
KVMs will be a module.  That requires some creative shenanigans, but it's not hard,
just weird.

> (default config change, s390 is the odd one out for the KVM config meaning, ...).

Nah, x86 is the odd one, where CONFIG_KVM=m doesn't even guarantee kvm.ko gets
built :-)

E.g. something like this, which probably doesn't compile and isn't the desired
end state, as several of the Kconfig selections need to be reworked into #defines
provided by header files, but AFAICT it does what I want/intend.

config KVM
	def_tristate m if (KVM_S390_NATIVE = m || KVM_S390_ARM64 = m)
	select HAVE_KVM_CPU_RELAX_INTERCEPT
	select KVM_COMMON
	select HAVE_KVM_IRQCHIP
	select HAVE_KVM_IRQ_ROUTING
	select KVM_VFIO
	select VIRT_XFER_TO_GUEST_WORK

config KVM_S390_NATIVE
	def_tristate y
	prompt "Kernel-based Virtual Machine (KVM) support"
	select KVM if (y && KVM_S390_ARM64 != m)
	select KVM_ASYNC_PF
	select KVM_ASYNC_PF_SYNC
	select HAVE_KVM_NO_POLL
	select KVM_MMU_LOCKLESS_AGING
	select KVM_GENERIC_PRE_FAULT_MEMORY
	select HAVE_KVM_INVALID_WAKEUPS
	help
	  Support hosting paravirtualized guest machines using the SIE
	  virtualization capability on the mainframe. This should work
	  on any 64bit machine.

	  This module provides access to the hardware capabilities through
	  a character device node named /dev/kvm.

	  To compile this as a module, choose M here: the module
	  will be called kvm.

	  If unsure, say N.

config KVM_S390_UCONTROL
	bool "Userspace controlled virtual machines"
	depends on KVM
	help
	  Allow CAP_SYS_ADMIN users to create KVM virtual machines that are
	  controlled by userspace.

	  If unsure, say N.

config KVM_S390_ARM64
	def_tristate y
	prompt "KVM support for hardware accelerated arm64 guests"
	depends on HAS_IOMEM
	select KVM if (y && KVM_S390_NATIVE != m)
	select GUEST_PERF_EVENTS if PERF_EVENTS
	select HAVE_KVM_VCPU_RUN_PID_CHANGE
	select HAVE_KVM_IRQ_BYPASS
	select KVM_MMIO
	select SCHED_INFO
	select XARRAY_MULTI
	help
	  Enable support for hosting virtualized, hardware-accelerated arm64
	  virtual machines on s390 systems using the Start ARM Execution (SAE)
	  instruction. This requires hardware models that support the Arm
	  execution facility (AEF).

	  The module provides a character device named /dev/kvm-arm64 to expose
	  the hardware capabilities.

	  To compile this driver as a module, choose M here. The module will
	  be called kvm-arm64.

	  If unsure, say N.
