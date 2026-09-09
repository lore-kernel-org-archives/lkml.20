Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820941D11C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990835; cv=none; b=mqFM9t45EXI+pdkLcUaRUCEDgA58mEtuqy8gaULjpGdq2b3N5GV5fVn2EtJ4QuE5ZSHecpwaugYNeIkH2j3JzevRUn7RhECItQQejXppkD3Xvb4GWcxhpizrLly/FlSGDXyfpOvosQXxesr8/qBrvYGGm6LlxOoYhFEoHgY+yws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990835; c=relaxed/simple;
	bh=0/fvsUiPrwSradNfHPbewbh86ElFh0GYdyKxkNvocQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jEzxrtpq960r3p063CSVEqrifQi13wk3vAYY6oukMgdeyTG80kJhxQ58yimmbbE5lUpvsTxB+x9AAiElnrSnSOTLtUEftPkDbJaMXfTb5NLG106/yFPtWWcFvqzAL1GC0f2kI2sD0scYZUcDpKiclpB2wS0wKmq7U55MgsoLf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UuSsoGAz; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UuSsoGAz"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso8519457a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788990822; x=1789595622; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0GhsBKioJjDRrC3kQo/MvHb6RZ/KMlhVtpCXE0/7VQ=;
        b=UuSsoGAzOxW0v0Q1GjJJlVA1BFy4910AJUA5vyeiekdJYXfhD56s7EJWTnKSgmJp+y
         zPoO9vaJEoFvdll5J3ZKQLdH05WEzqsjPCyRDUEeBU96sQMvpyI2HdE9aRC1gU70yCfl
         AFqogndIx1BohYm2aCCUjdH5e5XT6bi/4vUuSp5POyYrtIWDyYVccTr9NH8koBzj4e9E
         E/nLt/X+1NlJu6fPfRAPfvmUYw6ZDvfFiUhWzDBrfbEbg8TC6ILXfCPlr9VWpxHO1/k7
         IkyTQiiDpVtsbmcX6EOyDT60gFKTpcRsxdKvpIUZvk15xgiWy+hMmDdU+IxkCbzG08BC
         fQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990822; x=1789595622;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0GhsBKioJjDRrC3kQo/MvHb6RZ/KMlhVtpCXE0/7VQ=;
        b=d4hMzBUuqws8CDwKowQnHkK5vlJ07NuyceHFubwvw8MPcWBA7qV1LnQlqw14M9Lipp
         59aT7NeWKXyKy5OXePzS9uKNu0rLlc9r/e4afhyWO32SayzdOPXwNN0DOYRnjbs2Fm1i
         f7LBqU1RNc3RPzmXjjIk6fG3F606GrHARX4sjv3NEzt7x/PAfEQS7P/xqTgViaPVK7mG
         BovCvpf6QrRBpiqetU7TTP/xz5+1FE0/C26cxucu5rkb8/p6U1CkNAIXR6GRjxMSWESp
         s/4duuvwtIdq1xuTTMgTjQG/GFI37j9Ivkmzz69kDOfdhO9131UHZQONZStRqF/KWLKz
         8pcw==
X-Forwarded-Encrypted: i=1; AKwUvBy6pl0avF8ELzi9CxVAgF42Eh/u79rPGtJjeCaP1BapR5BR6+iFXrBn04QdvyMbgqPR+Nt/KDvIv7QQR6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nLxMKnDTMS5Yg55j0lVR4LlzaYw3j8ZxaqrmFiUwf+pcIJUor+
	/6YzbEwILsmBoL/QB5FpSQBVotYLKeqpB9XktVKyd+BDWZeMRzENGWrUAr1IB4VjTBE5INKrcCR
	2aSu5eg==
X-Received: from pgar19.prod.google.com ([2002:a05:6a02:2e93:b0:cc4:3485:76b1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:93a1:b0:3da:c10c:6aa6
 with SMTP id adf61e73a8af0-3dacbd6eacdmr5805086637.1.1788990822413; Wed, 09
 Sep 2026 14:53:42 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:53:41 -0700
In-Reply-To: <b0035ada-8760-4c43-aac5-264d6b1d0099@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904004342.3162959-1-seanjc@google.com> <20260904004342.3162959-4-seanjc@google.com>
 <b0035ada-8760-4c43-aac5-264d6b1d0099@kernel.org>
Message-ID: <aqHVZdnf28ZuSNLA@google.com>
Subject: Re: [PATCH v3 3/4] KVM: guest_memfd: Establish memslot<=>guest_memfd
 bindings *after* memslot is ready
From: Sean Christopherson <seanjc@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 07, 2026, David Hildenbrand (Arm) wrote:
> On 9/4/26 02:43, Sean Christopherson wrote:
> 
> > +		if (WARN_ON_ONCE(change != KVM_MR_CREATE))
> > +			goto err_bind;

This is buggy, it fails to set 'r', i.e. will signal success but not actually do
anything (or worse, half-do something?).  I'm just going to delete this sanity
check, as there are already existing sanity checks that save KVM from the worst
case scenario.  More below.

> > +
> > +		r = kvm_gmem_bind(kvm, new, gmem_fd, gmem_offset);
> > +		if (r)
> > +			goto err_bind;
> > +	}
> > +
> >  	/*
> >  	 * For DELETE and MOVE, the working slot is now active as the INVALID
> >  	 * version of the old slot.  MOVE is particularly special as it reuses
> > @@ -1965,6 +1975,13 @@ static int kvm_set_memslot(struct kvm *kvm,
> >  
> >  	return 0;
> >  
> > +err_bind:
> > +	if (new) {
> 
> We'd never end up here with !new, right?

Correct.  I added the check on "new" partly because it felt so wrong to not have
such a check, but also to guard against any future usage of the unwinding.

Oof, but calling kvm_arch_free_memslot() is safe only for CREATE operations.  For
FLAGS_ONLY operations, x86 and PPC reuse arch metadata, i.e. trying to unwind
prepartion for FLAGS_ONLY would do more harm than good.

So rather than try to provide a goto sequence, I'll add a prep patch to restrict
the kvm_gmem_bind() call to CREATE (which is a nop because it's dead code for
MOVE and FLAGS_ONLY), and then this patch can do:

	if (change == KVM_MR_CREATE && (new->flags & KVM_MEM_GUEST_MEMFD)) {
		r = kvm_gmem_bind(kvm, new, gmem_fd, gmem_offset);
		if (r) {
			kvm_arch_free_memslot(kvm, new);
			kvm_destroy_dirty_bitmap(new);
			goto err;
		}
	}

That addresses the new-can't-be-NULL concern as well as the duplicate code concern,
and can also address the bad sanity check above by adjusting the TODO comment in
kvm_commit_memory_region() about what needs to happen if/when dirty logging is
supported (KVM needs to rebind() here, not do separate bind()+unbind() calls).

And of course calling kvm_destroy_dirty_bitmap() is dead code until dirty logging
of guest_memfd memslots is supported, but it's harmless and IMO far less risky than
hoping future us remembers to add the call when dirty logging support comes along.

> > +		kvm_arch_free_memslot(kvm, new);
> > +
> > +		if (new->dirty_bitmap && (!old || !old->dirty_bitmap))
> > +			kvm_destroy_dirty_bitmap(new);
> 
> That's essentially the cleanup path in kvm_prepare_memory_region().
> 
> I guess with some more reshuffling we could have a single dirty bitmap cleanup
> path in this code.
