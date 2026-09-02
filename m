Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA0391E44
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388045; cv=none; b=teX3S/tgRuic7GNmLm2PkE4J+bnA0gDylTCRWQBz+PuFhLUSPF8yT21o7eqby+yu35KwJUnKJJjK7Hkg/GG01fElgIJTJww/FB/8vuoPahj29OLy0Rqx7QUWqqYwnY7IRGjyK0ZzJP7PSHpQha6akLI9JaK26cbuDUuIesDdRZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388045; c=relaxed/simple;
	bh=qod8uFD5X0LYO+b4+CI9/2lX83GXDXi4jB0ZmbicHE4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KacPZkj+NKbueCfMgXLCo1zHQTV3zGxqqW3bBPqAha+AsGMJeNu8tu94K4qxKK6L1EQyAR+3hrBpMTr8ezP+D5wmlyAUgNa4Or08jK8YZCxbaxEq4KTX94enaZu23HDv8J8ROa6K2ooJ+UnFsSZIEKs6nkq7Tu33O0hXx1vLbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fU5LhYal; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fU5LhYal"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8544b721ce9so2131984b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788388040; x=1788992840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuGXYbNcTKTCYbduX6+7f7tE5bAUclJinuJ3l4QV8iI=;
        b=fU5LhYals+QTGXIkIHfKJVEcIxI9lOdeSMCllmBaCHtUbsT2DFPiEifpHGd+yhvQcx
         d7fgC+AUdW4E73DX2i+uj0l3slVQwHRSVY7uCxk41Ccd9uYMnmmUEzBbKqnE8W5hvmsK
         h7jr7cqfdI+mdp8bjjm0vAJcBg6nlEGQQ3hyr2nXLBpJr89hb+7kKFvO0LgUwfKHEV/x
         1Ybe1Nr2By7UfIzl0irpX55SSAf4YSSad82W+31aVZr8NamEyY2Z4G5o00UEI1bV2ZQl
         P0H1PHwsdqkb3JOZ5PF6tbi/jHFDPfwRlP6ytMogBsDtuNzqqtCysPAvhQV2laVhaK4f
         f/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388040; x=1788992840;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuGXYbNcTKTCYbduX6+7f7tE5bAUclJinuJ3l4QV8iI=;
        b=c7uoKsq4eob2NVAbLBzw4K+xQbJzwa/rWfyFT9bAUPIijCPL6oo3Mz98db9f1SK/vv
         HFNipd0uFhDxNlY3uw9QYDBHJ32uQeIUzBP/hrGU0si8qEXc6KOaGYIzUKUTDf5HbG4+
         L1z3l8CEvQBPP0KfmEZtf8sjsP9EWvfzVD3HGpRtZdOcJ1MR2bUfRbjeyDNzs5BNb0JN
         TkPWjoNpJi1gjz7jfTQSPP227zNfIpVANvMSD3tNUNhATz9xuhQufqm5k7b5RKjpiaMD
         2rvOV/UvdE14gxfOXUbw/rqnwmdhqpJJgfBagim99OJIctV2gN3fhzyie7zv+oqAuDBi
         MttQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc7P7YIy0B7iQnw6f5diGuYkUrjcrS7djKvnvPdNwi3H5YFJ5uGccDqyE73ZY4KTj6pdNOzQhmZx7m0tI=@vger.kernel.org
X-Gm-Message-State: AFuF++mo9aYkLBTGBIlqzVg7IaB907e6L3CWZhFfAzyp31dBdqrH3wCb
	9MGoB08WDt+obyPxxs+dBISgw3DI2Wuq5jqDJcxCIAr7J6wRwV+EoryRjYVlDKLVrbIYB/jhWWk
	6zO5swQ==
X-Received: from pfei16-n2.prod.google.com ([2002:a05:6a00:c050:20b0:84a:2e0d:e14f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a3:b0:857:7337:5dbc
 with SMTP id d2e1a72fcca58-85ed9f9eea9mr11940373b3a.26.1788388039795; Wed, 02
 Sep 2026 15:27:19 -0700 (PDT)
Date: Wed, 2 Sep 2026 15:27:19 -0700
In-Reply-To: <CADrL8HULbB2HUSOJ0ivZnkz7V4Ok_jgDQk3hAc0tR6NKHp+6-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902211759.2700289-1-seanjc@google.com> <CADrL8HULbB2HUSOJ0ivZnkz7V4Ok_jgDQk3hAc0tR6NKHp+6-g@mail.gmail.com>
Message-ID: <apiixwndH6vY_BQX@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Always guard rmaps with mmu_lock on
 PREEMPT_RT=y kernels
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026, James Houghton wrote:
> On Wed, Sep 2, 2026 at 2:29=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > @@ -1745,11 +1776,15 @@ static bool kvm_rmap_age_gfn_range(struct kvm *=
kvm,
> >         gfn_t gfn;
> >         int level;
> >
> > +#ifdef CONFIG_PREEMPT_RT
> > +       guard(read_lock)(&kvm->mmu_lock);
> > +#endif
>=20
> Future me would be happier if there were a comment here. :)
>=20
> Also, how about BUILD_BUG_ON(!CONFIG_KVM_MMU_LOCKLESS_AGING)?

I completely forgot we even had that Kconfig.  I'm somewhat tempted to gate=
 the
alternative implementation on KVM_MMU_LOCKLESS_AGING=3Dn, not take mmu_lock=
 here,
and then "select KVM_MMU_LOCKLESS_AGING if PREEMPT_RT=3Dn".

My main hesitation is that taking mmu_lock for read would be impossible wit=
hout
extending kvm_handle_hva_range() even further, which IMO isn't worth doing =
unless
multiple architectures want to take mmu_lock for read.

Ugh, I shouldn't have thought those thoughts.  s390 does exactly that.

Oh, wait, never mind.  That doesn't work for x86, because we want truly loc=
kless
aging for the TDP MMU.  So ignore that train of thought, this patch is the =
way
to go.  +1 to adding a BUILD_BUG_ON() and comment thought.
