Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CFC4BB804
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446750; cv=none; b=F3DB87qEg5rPQoCOQ83WI2ph7LgplAFosd/sfJjKPcLqtAZ/L1PcsIYGsO63y9Uv+BY1UzpTRXUT/oUYXwHRTRHWN/DK6jOw/F8p32G6vz2V8wRampMwNqkVcKMi0dwsz32kEpRnstS2M/v1HIRWz4oxaxJvTYPx8pRxKBvPBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446750; c=relaxed/simple;
	bh=7IMGxa89GNRXnfWZ4hVhNNtEtma9m9jMafZL11hbH8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tvzo1lDt39A553A3WryDx2olLJ7BKh5bEY9kQqvCMPp/yrftRxQ//ZSJ/Ahw1B/ocRH0DMqpOddmQQZkwG/XYcIlumf9Ns9Yej3Df4mh+ot5aiQ0l1H9mLdPCrNVay+E/bTTWuH6B+qvffsrLmHob/8lmtoMDm+1mLrzPNCrYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBQsF550; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBQsF550"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so4620a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788446748; x=1789051548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzI1smX7/IMyEGD/fNZX1tdlHe3Ey7XN1U8MbWwGg2c=;
        b=UBQsF550/VYvojmeegZZxAHkXeGZQHbLc02y5paQ5MrkPBRPvxy2J+Y9OzoBaJUIE2
         WqMpbRNXZ3P75m8smBcM9x1Ezc/FBCi4ZT1moIQnrrKawaZ7QDlFYH/rcvwcXFkfwsoT
         WhvffFDRCy/cvxXOGlbVG4pHyTPuLeGNy2kaZsDzQhr4jKZN22LIqrqkIlJE8czRUVdo
         U0JbLjLKfC14Rm21yPe7jUDV0NrkDhx8j7y1mwy2Jclm3FkUtnp/a7u7TlqJBkfUmqto
         kk89AO9jV1Uj7v+WW3bzOV1D+YS1jTFsa26FCUl9DvnfASmktj6HF7vpTT9vs//ZCavQ
         oEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446748; x=1789051548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzI1smX7/IMyEGD/fNZX1tdlHe3Ey7XN1U8MbWwGg2c=;
        b=Dt0psj6R1NV9rqiWh1U1XcMD42oBNeZiigxqWgM2qwBiAXgEYNhl0vlaF8yL69eYZh
         kdQWcJjzWwMe1CaA2K/nSY3if9/pouFzkAToJmdRgsto6nGoEnGAAV1RaQ9dTSdnXuOu
         r1PU/W3ofi+aJHl40F4jidR8D4LabgCZZC06JPtdJBXeL44A+6mMDE72OA9OBbsAe+eC
         N64nCOw6h3fwaWKpQwKZ2J9eFHvBv6jlxflo+V4EFG0nAK9Pem19DMXtRLHlej6XKobF
         c3A1eaVesk5V//KUZHUhAWZJhU9AD19VpOJyHYKaRiHpCSYojy0iKYcXi7gxXl6IRnSk
         +z6g==
X-Forwarded-Encrypted: i=1; AKwUvBzza4Wc8+wN9orQxrjdubrn9zcNmZPV9+Gl7nbSdzgfmPIWTyrwZbci8gDtuONFcXItT0wF2Oa3SPcYLAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mFNkzYoT5L0MI2jxvZqfBxu7LcaCceh6YvMIF3dnw9v1UMKjtu
	2NJhvJ/6jZUxJMcgBSWYWu08zYNyu4qcP5i6xzPpWFvImPqUp+nsUZH0g0drf4w+gjWOmbYCPFC
	FbX3Auw==
X-Received: from pgcv12.prod.google.com ([2002:a05:6a02:530c:b0:cc1:57f5:f8fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4408:b0:857:4dea:e2fe
 with SMTP id d2e1a72fcca58-85ed8ed8414mr20185879b3a.13.1788446747432; Thu, 03
 Sep 2026 07:45:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:45:46 -0700
In-Reply-To: <apmFClPZ2WcDINmT@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
Message-ID: <apmIGgMEN8w-kQAm@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
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

On Thu, Sep 03, 2026, Sean Christopherson wrote:
> On Thu, Sep 03, 2026, Sean Christopherson wrote:
> > On Thu, Sep 03, 2026, Steffen Eiden wrote:
> > > On Wed, Sep 02, 2026 at 09:14:21AM -0700, Sean Christopherson wrote:
> > > > And taking things a few steps further, we can solve the MMIO issue in a more
> > > > elegant way, and eliminate the runtime string building in this patch (after looking
> > > > more closely, that code needs to be jettisoned no matter what, there's simply no
> > > > reason to specify the names at runtime since they're separate compilation units).
> > > > 
> > > > Rather than splatter #defines throughout header files, deal with the bulk of the
> > > > pain in Makefile.kvm.  By feeding conditionals into Makefile.kvm, the s390+arm64
> > > > build can easily omit coalesced_mmio.o and async_pf.o, define __KVM_HAVE_ARCH_MMIO
> > > > programatically without having to change other architectures, and solve the naming
> > > > stuff.
> > > 
> > > Yes, this is a great idea. Thank you. I second you, this looks more clean
> > > and stable than the stuff we came up with :) 
> > 
> > Looking more at arch/s390/kvm/Kconfig and virt/kvm/Kconfig, we might need/want to
> > to build out infrastructure to handle this sort of thing in a more generic fashion?
> > 
> > Which probably isn't that much infrastructure?  It's more just changing how arch
> > code communicates with common KVM?  I.e. instead of providing boolean configs in
> > virt/kvm/Kconfig, formalize communicating HAVE-type macros through the Makefile.
> > That might even be a net positive in the long run, as it will make it easier to
> > provide defaults for the common cases.
> > 
> > I say that because unless there's magic I'm unaware of these Kconfigs also needs
> > to be configured per-KVM, not per-kernel:
> > 
> >   - KVM_MMU_LOCKLESS_AGING, otherwise aging on arm64 will unintentionally be done
> >     outside of mmu_lock.
> > 
> >   - KVM_GENERIC_PRE_FAULT_MEMORY, so that arm64 doesn't need to provide a stub
> >     for something it doesn't support
> > 
> >   - HAVE_KVM_MSI, because presumably it's needed for arm64 support.
> > 
> >   - HAVE_KVM_READONLY_MEM, same story as HAVE_KVM_MSI.
> 
> And in the opposite direction, HAVE_KVM_VCPU_RUN_PID_CHANGE also falls into this
> category.  That one is probably better handled as a #define in header files?

Continuing the conversation with myself, add in HAVE_KVM_NO_POLL and
HAVE_KVM_INVALID_WAKEUPS (which reminds me, valid_wakeup should really be moved
into s390's kvm_vcpu_arch).

> > Which isn't _that_ many knobs, but add in KVM_MMIO, KVM_ASYNC_PF, and
> > KVM_ASYNC_PF_SYNC, and it's enough that I think we should think about the big
> > picture and not play whack-a-mole.
> > 
> > Actually, thinking about this more, what I've proposed here, plus the pattern of
> > #define-ing macros in arch-specific kvm_host.h files, should suffice.  For things
> > like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #define the macro in
> > kvm_host.h since it's very directly tied to an arch callback.  Whereas with KVM_MIO
> > and KVM_ASYNC_PF, because they enable compilation of C files, it makes sense to
> > define them in Makefiles.
> > 
> > So I think the "gap" is purely that the four knobs listed above need handling
> > (and arguably KVM_MMU_LOCKLESS_AGING is ok as-proposed).  But I do think we should
> > try our best to be more thoughtful than we usually are when deciding how to enable
> > common code, because obviously s390+arm64 is adding wrinkles no one has had to deal
> > with before.
> > 
