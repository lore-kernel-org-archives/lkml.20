Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076773A255A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988845; cv=pass; b=eFk8ABOeJuKDJFWyvHbx/alSlLUYNHeA9C7EVPOHQZGedfqgVQLYtutFu7ZpNn4cn2l/v7/PJkmoH05L7BHfXQIgK5QpKJ/4PRv7lZCaTHxZ3vSkBIMCDYOIJtwas0KvTtI8kFjzupyvwEVK0XU2DhGTybh26sUSgYKbWtQ0628=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988845; c=relaxed/simple;
	bh=MxFG1mZktrMoElvMC0UlvjvWr6avtnQPc6bd059hWM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAMnv4LUeQ8gEXWJNZxX6QXg0GnIqbPK0gOIQUvZbEbXrb2xrL2KpS4/HdaL64/7QR/BkNy2qdY7QvnEABcm/ymnLGMVpPA1zlWuXqkCdVxgExPhswpZocrh/Rp/5hzWudZL06xSU1VyKW3GQqfNG8xoATLLxFsq4begFUzs3Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UCCBpXnH; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UCCBpXnH"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so43185a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791988842; cv=none;
        d=google.com; s=arc-20260327;
        b=EGRcGFiTv3q/vjt09cLJpvDVag2Osgis8P1YTWAioIEqbYOyILf9GLmnMbui+emOvS
         +YdI+rjedO6iAtTXUXBiwSTR6J6NiFbW9cUyFTbb4InUQbn6cGbfLJor/Grqb4Y1xSbL
         4zWfynmykXSIim8kRujECndWQOR7WO7ZROLNziESrnZzb3OzJLWOEV7GbgEtkGPdB1Nn
         vXYITMEJmgHYODjmvVwo+pI82Dv3d2KzdgIH5ngzkw+xTZtF3BoOd6UgmNo+IM1mXBtM
         2IA6AB22lkByrSxtGmOydtKSZfsYYZ8jvKCDndoJqOONi6b2WJNyzZs4nreMKSWAHETf
         olpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o+kqtSVBBM78ciUCA58cO4YtlpbL6uVSQYurfCH4pKc=;
        fh=sAi3/qMWEMbHC17LX9sho+jQza9JPnMJUaJh6jvQHDU=;
        b=X5zG7HTfISASmSdR2L+QmKG9W/e7/+ZzOmTK+K6WL8I265H6DmLCDANwTa8+nvvc1g
         rZwOVwv7hGB3yfO8crQxiNCWbsOlAVPWOgFF/VcCFMVayvAfCPAOaekqrBc2fc1dg03q
         dKaKdJKPLm7yC6X4FPFIK3smjo2OvULCDoV6k6Y0Ak/kb1mIMI7uvyzR862rmehjq4P0
         VJAZ/VEeHvhYE2yOVns/2DVFY/uK1NpX8fw2mWtZsiDJVaRswRkmhn2vN5HLIWiuYI4L
         GduBLt/+jLGLnZSbxcJqfaXKiCHEIixiWPqOwHpVlO9emLwMYFkosi3wQYrSAnu1d3VX
         d37A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791988842; x=1792593642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+kqtSVBBM78ciUCA58cO4YtlpbL6uVSQYurfCH4pKc=;
        b=UCCBpXnHIIaZ0glcDUn+ikmOb3uFCXkJL0A+3AG6yTHyAwIipUmN0Qknyn5K/suHfp
         dRyqS1teWFl3PaQ0BoEn+ht0Xq3tRn8c8LseRiDLppaKomsYLwPwhZQqfniMHOWuBZh/
         lyG4IY8ScwWFlPS1CcpaFxUO4S2ZRkkt+w5YBoTwRuXdZ1l4V1Np/pZ3XPbEFcp+yrrh
         VpFX49/jFCQU9KCYBC/G7rAhn4jhZ1eIXm88N2qAkZb21jKIiFJK6Y8zAAZLN6Xn/fel
         99YGc4oRGQYBp07ptKINC/YavnkJx/7mPcuIt53KT3larzcg5ZfbfvOrFw9Zq6nckHKr
         w7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988842; x=1792593642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+kqtSVBBM78ciUCA58cO4YtlpbL6uVSQYurfCH4pKc=;
        b=xOkp+C3mR3XIbPlIXP+M7D8FLezfV9/aefOsCUl/wAFjSJWEf9R8wcnY2CjsFjtXsq
         miButcjpfTZ9xnhZQEoDsZUBfkCw8rffidlH8FK0fRjBqI/PhtyZ/226TLSq69KuRh69
         0/NYXBJjAhG+6WLqYzK6faqiFMMKLEWYwDdBrxm3ub/uvSCt/T4ATXJdHB6Xdgh8t9h4
         Hu7J+1fPZwf5JJTUIM63YLhj3KFn38xZfR6gBSmnrn9u49FoFzNB6ksRInNM1Ekyjpox
         fHndIirB0ENe1yf4cEUO4k4KNleE9gxQNkuCwimxLCVXZTy409iGwQbW9TduNhm6/i25
         AYCQ==
X-Forwarded-Encrypted: i=1; AKwUvByqGgRBgJJY5a3VwVbXskeM5uc4bAdoayxP5WU3psCDrd6yMEf+SeqaUpwfnm7M1eBQbUmbFr98J6JSslo=@vger.kernel.org
X-Gm-Message-State: AFq9FYII7ndn4DfFSLRHmf7aVyFNMvwD5hiIitxpbTu/asvgsAJeGJs2
	tCNEsaiQx06x1gfvPD0g9ON5kWFd55NR8dpActhBtZHhztYMTqfFGCqbpUl/jE9+Z65d/AUZQke
	UjL4dPMimmdyPSlXHUCoT5u/WKz+4zgKhe0ikX+0gRW+Sya8klj80360DDoo=
X-Gm-Gg: AYBFou0vixKUfodfmo0hL7uzN87T2Txobwf+lH4EyyW0DS9jodhMEHQ1hV85IaOK1UI
	l3k8X9QckCoLyzzKbNW01UOnQ9+WY3FGlSCggTuCVQHSNvcSI6pPmU4mWqGD00MErb73DJ7VZGH
	zj1s0W9WL2bT9WhuaWjGMhr3wLirZVvil3BjRCpbVI7p5dmzXd399FRDlmr0Zfkbd6jnyjCH5cY
	Xuyc+N41tLoFxNxRlhwo0Uuz6huP0nJm3jDu1YXQay1rOm7WLO+WVDp0GX8Jvee66nIB1rKI+CI
	5O+v/l+8/M/WzCV7vOR3naS8vaNiCzYqK2mWv8TQwKWylYmyp95lx0tA
X-Received: by 2002:a05:6402:22c5:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b209504430mr53244a12.0.1791988841607; Wed, 14 Oct 2026
 07:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013231728.883001-1-yosry@kernel.org> <20261013231728.883001-2-yosry@kernel.org>
 <CALMp9eQ3mz_EiV4AcmMC2CQZ47s_uf7XCbhnn7pfvVjHwsXdTA@mail.gmail.com> <CAO9r8zMYj=Bxc_8bWh=G__2C0ouiarg-WMtVCdziCvccZTugPw@mail.gmail.com>
In-Reply-To: <CAO9r8zMYj=Bxc_8bWh=G__2C0ouiarg-WMtVCdziCvccZTugPw@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 07:40:28 -0700
X-Gm-Features: AclHuK8QvSQV5JIun9Aw8Aiber8CAgmIN8b8u5LQUwGXpdAYDUmRDzVbMQGTfj8
Message-ID: <CALMp9eQtcCMYiQKKyA+L-rNN9kjNZDhTqtQWF=8VmiaqqSEw7w@mail.gmail.com>
Subject: Re: [PATCH 1/4] KVM: x86/mmu: WARN, don't BUG, when walking a cached
 root with a PAE MMU
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:27=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Oct 14, 2026 at 5:48=E2=80=AFAM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Tue, Oct 13, 2026 at 4:17=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > Replace the BUG_ON() in shadow_walk_init_using_root() that guards aga=
inst
> > > walking a cached (previous) root while the MMU is configured for PAE
> > > paging with a WARN_ON_ONCE(), and terminate the walk if the WARN fire=
s.
> > > Walking a cached root with a PAE MMU is a KVM bug, as PAE roots are n=
ever
> > > cached, but there's no need to bring down the host, as KVM can simply
> > > bail from the walk.
> > >
> > > Note, the BUG_ON() is currently reachable by a guest if TDP is disabl=
ed,
> > > as KVM walks cached roots even if they were created for a different M=
MU
> > > context, e.g. if L2 executes INVLPG while using PAE paging, L1 doesn'=
t
> > > intercept INVLPG, and L1's 64-bit root is cached.
> > >
> > > Add a common error label for terminating the walk, and use it for the
> > > existing invalid/dummy root check as well.
> > >
> > > Fixes: 7eb77e9f5fcf ("kvm: x86: Add a root_hpa parameter to kvm_mmu->=
invlpg()")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: LLM
> > > Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> > > ---
> > >  arch/x86/kvm/mmu/mmu.c | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index aadd5bdc2c97a..126faef5a6476 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > @@ -2558,10 +2558,8 @@ static void shadow_walk_init_using_root(struct=
 kvm_shadow_walk_iterator *iterato
> > >         iterator->addr =3D addr;
> > >         iterator->shadow_addr =3D root;
> > >
> > > -       if (WARN_ON_ONCE(!VALID_PAGE(root)) || kvm_mmu_is_dummy_root(=
root)) {
> > > -               iterator->level =3D 0;
> > > -               return;
> > > -       }
> > > +       if (WARN_ON_ONCE(!VALID_PAGE(root)) || kvm_mmu_is_dummy_root(=
root))
> > > +               goto error;
> > >
> > >         iterator->level =3D vcpu->arch.mmu->root_role.level;
> > >
> > > @@ -2575,7 +2573,8 @@ static void shadow_walk_init_using_root(struct =
kvm_shadow_walk_iterator *iterato
> > >                  * prev_root is currently only used for 64-bit hosts.=
 So only
> > >                  * the active root_hpa is valid here.
> > >                  */
> >
> > Can you please rewrite this poorly worded comment that now explains
> > your code below? What do 64-bit *hosts* have to do with this
> > bug/warning? I assume that should be 64-bit *guests*. But, even that's
> > imprecise. Aren't prev_roots tied to 4- or 5- level paging (i.e. long m=
ode)?
>
> I believe it should say that PAE roots are not cached, so only the
> current root should reach here. Right?

Right, that's my understanding.

> I can reword when I respin.

Ta!
