Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799140;
	b=r4DOjHO+s0xghJi5bQbe4l+iVK/a6wDnautbWWCwsL7OYOakkebraTrYz6ojRMNrOqsy
	 5yRbymD3ESHVZzJ4jwjJvYlSxYkunrY7uRHKgu+pTOEcD0WbJSnlSlPFS5y5lRKWMbm4t
	 twZEQsNPAqSweOcj5poxRqdJeLogr14PuPtvWcVwMOLj8pcSZ5ml/eEinyUcEZHYCjsDu
	 nYAdy4iR1vsQuY/kjXoqHJFz28r03AFgijK3FwrWrYPrSeoOZWJZvClG0jziIlVDG6h+3
	 PSNXU4Yae9B43iYABlLQgJUPqIrls2ZKghSEZf6v+wgyllb9tRnvJxWXFraM8pR1fLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f1NHckFTNi2t+UBr6oPHAijnd3s0vFDpOBlB6WEYt+4=;
	b=PTUCsh2oplyMbIEZv3d5mHujKkLATihDsYWNOa5E+R1n3Dzn8gjNfX3DkshXsfr/XnYj
	 kh3RYsHxJkz1pjdu9S6QkfRwZzP6SWHVNvfmyLT/FkjVW4WjudCwL5obwId+ncLseoBbe
	 7NWOnJl6qze62K8aBQjJb90mc1KsUtLTWjKuMCTPoXqPO1JWDI+XKY5jPWzIC48NKyXcU
	 nJb58IM/KfNgN4BQ9DhXQsWuMigSMtRmgLYnx6eT0i9rizSs8cef8TQFnUP/ZaIjVj4MU
	 nh3qVXVzbCG/tTWH7SDmXHT5mXRuf2viVLIzKlDtrW5Od8PVsROWP1AuWDw92bnZ1Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RapW6WWc;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84602606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84602606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RapW6WWc
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso797668a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793799140; x=1794403940; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1NHckFTNi2t+UBr6oPHAijnd3s0vFDpOBlB6WEYt+4=;
        b=RapW6WWceSFqeyficEW7bv9aaNqLgMPyTle9BGVgeXlYhdodchBm2sA0U0ZSBEji2k
         uuzoQAEfTBz7xKrQTMWHL17UdGnavPvIxJsbL6euM3mWc9HMWVWG0rRpL/bJFRdTgFYk
         v1H0uq7++thqvkwEte/2TClXuU1qj1QjtWmrev5RnQxUSg3zDChWIHzuiaW1nBdX41Yf
         Zo4o9K5Shny0AqL0N2RY4OWvMWdnk1GhJS5FtRj64JUgrOczXiSeL0E4GlgANOlrzmQQ
         j/8mtAznvBgAeV9sMNgDCGvshz8T6mR8m05JWauW9KeH/w/v71rUrvTBq8YnIpFh+JqQ
         IuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799140; x=1794403940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1NHckFTNi2t+UBr6oPHAijnd3s0vFDpOBlB6WEYt+4=;
        b=bOxdBWUfYPGxrMl5lIues6Iu4COfZYqGMyq74o6A3usN4p3Hb0EsVSJIqQK9luzFVP
         IzMNTpEwEPg5GnJHTKo+CUqXi0uHeemAV9OIdUXIZBK/lMChfGyGDmKpyrX0pdcPLyHA
         28JtAth5oqv1MNkVhD2UUUfruRsCAYwTNF41g/QlRI5+W441l9KEvgEJ44auqeYTG4x1
         RZEisv7+xYgfZZJ1jfGp8Dm+IQ+HQRBZoSdWTrtn6K7H/ZqxZ+aCmsvPcZuomC7QSJTt
         +Nq6r3T9xtL+Fpm3UeZCQi1ew3LegnVgkTUiWa7TswW7yjbce+aaIw6zIfnHrtR4phV/
         WKbg==
X-Forwarded-Encrypted: i=1; AKwUvBwSHHic1zoqMzBBnUyqSFesdu2NuAsCr5gAfgFoGXvz6z2/rqJYeTi5JWb1HpRJrkNOv/bmF12aoSeXfEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LJuOv2Cz+t/5hQx+EP8705LHgMxdfWNfV+63dYv7QxDBHNPdV
	lqGi6SuMzJ85vjsBPSsEc5RqqjN0EWXB57/L0l+82mAaLnTsO3J8GrtN2Vx2N5LXPe3vcxjfQY5
	iyUZaDw==
X-Received: from pjbmj22.prod.google.com ([2002:a17:90b:3696:b0:3ad:ce09:ff3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a82:b0:3b0:9f53:e8a8
 with SMTP id 98e67ed59e1d1-3b09f53f231mr985002a91.52.1793799139505; Wed, 04
 Nov 2026 05:32:19 -0800 (PST)
Date: Wed, 4 Nov 2026 05:32:17 -0800
In-Reply-To: <5bd7e8e9-3614-4006-a3d7-a51416ba5507@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com> <20261030212112.2598640-4-seanjc@google.com>
 <5bd7e8e9-3614-4006-a3d7-a51416ba5507@linux.ibm.com>
Message-ID: <ausz4VZWa_4Vr03v@google.com>
Subject: Re: [PATCH v4 03/23] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, Narayana Murty N wrote:
> Hi Sean,
> 
> On 31/10/26 2:50 AM, Sean Christopherson wrote:
> > Flush/zap every memslot in kvm_arch_flush_shadow_all(), i.e. when the
> > owning userspace process is exiting, as KVM must ensure all associated
> > memory is unmapped from the guest.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/powerpc/include/asm/kvm_host.h |  1 -
> >   arch/powerpc/kvm/powerpc.c          | 11 +++++++++++
> >   2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> > index 708a32f89776..50a42f80e5f1 100644
> > --- a/arch/powerpc/include/asm/kvm_host.h
> > +++ b/arch/powerpc/include/asm/kvm_host.h
> > @@ -910,7 +910,6 @@ struct kvm_vcpu_arch {
> >   #define __KVM_HAVE_CREATE_DEVICE
> >   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> > -static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
> >   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> >   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> > index 9194cf492d1c..9e9d0865c2f6 100644
> > --- a/arch/powerpc/kvm/powerpc.c
> > +++ b/arch/powerpc/kvm/powerpc.c
> > @@ -764,6 +764,17 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
> >   	kvmppc_core_commit_memory_region(kvm, old, new, change);
> >   }
> > +void kvm_arch_flush_shadow_all(struct kvm *kvm)
> > +{
> > +	struct kvm_memory_slot *slot;
> > +	struct kvm_memslots *slots;
> > +	int bkt;
> > +
> > +	slots = kvm_memslots(kvm);
> > +	kvm_for_each_memslot(slot, bkt, slots)
> > +		kvmppc_core_flush_memslot(kvm, slot);
> 
> For Book3S HV/hash, I am not sure the existing flush_memslot helper can
> be used on an active memslot like this.
> 
> The normal memslot invalidation path seems to deliberately establish
> the opposite ordering.  kvm_invalidate_memslot() first installs an
> INVALID slot and makes it active:
> 
> 	invalid_slot->flags |= KVM_MEMSLOT_INVALID;
> 	kvm_replace_memslot(kvm, old, invalid_slot);
> 	kvm_swap_active_memslots(kvm, old->as_id);
> and only then does kvm_arch_flush_shadow_memslot(kvm, old);.
> 
> The comment there explicitly states:
> /*
>  * From this point no new shadow pages pointing to a deleted,
>  * or moved, memslot will be created.
>  */
> 
> Similarly, kvmppc_core_flush_memslot_hv() in
> arch/powerpc/kvm/book3s_64_mmu_hv.c relies on the memslot already being
> invalid when testing KVMPPC_RMAP_PRESENT without locking, as no new HPTEs
> can be created.
> 
> However, kvm_arch_flush_shadow_all() in arch/powerpc/kvm/powerpc.c now
> invokes the same helper while walking active memslots.
> 
> Is there any serialization in the mmu_notifier.release() path that provides
> the same guarantee against new HPTE creation?

There can't be any outstanding *usable* references to vCPUs at this point.
mmu_notifier.release() is only invoked if the process is exiting or the VM is
dying (which requires the associated file to have been released).

If the process is existing, KVM_RUN (and most ioctls) are unreachable due to the
"dev->kvm->mm != current->mm" checks.  Not to mention that if the process is
exiting, doing anything with a memslot is completely broken because it means
things like hva_to_pfn() are somehow operating on the wrong mm.

If the VM is dying, there can't be any references to vCPU FDs, because each vCPU
holds a reference to the VM.

> Otherwise, couldn't an H_ENTER or fault path create a new HPTE while the
> rmap is being scanned, or after it has already been examined?
