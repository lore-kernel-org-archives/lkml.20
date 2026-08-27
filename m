Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D82DCC13
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863081; cv=none; b=P4HMoOekkQBvRqb3nO3RwS3QivCV4XSAxAf/BpO7ZBxeVT0gBekgJHsOlZBHJGE1/rzBBqse/DhA57FvGeVSKtkg1I7lhVK4/eqDfWK9Dx/g5AIn1YVblNf0Tkrz/tcSDeZ6r314OvF0pqLsDRFmnH9wLHS7wRZ7duhdE/tD6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863081; c=relaxed/simple;
	bh=qAn6HeAQO4Oygk+dnkielaw+I1j97nWbA+S1CcWQLik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE0m6/QCsmZLDcSRgqMkhRyu9rpqd9Xo6zHRra1Vxm6s7ZtbicFWQzmtBmn+q/qW9P7/RQ2V3mPCYAPaoaKenRvkq1PKLavo39+NtnqJRA9Z3xQ4UdFswZRkC/KaQcFbP4BLvZNu4+BABiRFgq/IhjUxq+wM9LDHvaxau2YwQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxrjdFBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxrjdFBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6150E1F00A3E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787863076;
	bh=uU0ynFxcIFKopGhYpZ9DKYM749aSjOjKh65yHWXZG8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VxrjdFBlHY60fYBZ63hcmuGF3bKzqKNln0RG6uM/+VEq5+eoGduaFemqWFfcKmQ1c
	 RiNlWzlvJvb6m71Vt7vWxe3jOF7HnZBex9IN65tQjVJFHiJAg3YYojPH8Nk40Re2wU
	 RdfAJz9m9K1fRH8HyCUc56K9vU1V4Gwa1b5gYMfHSP8JrW10zGgrZZ467IO+pPCNfi
	 3eIIyJu1PWxJvev4wAtxiJ4L44LJZtN9APWDj5hZwdaCaZL4dFGCIDGY1ufxMq4VYo
	 M7MGCKogwPZ/kae09ZalR7n3029/cQkBbEVNgWqKvrxkF79V7Em8MtX7Y16h1W+9K/
	 k32J1peru8vyQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2544ff970dso14781066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:37:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzfaJCBmcM0qI9X/DsKypc+tToAeWT3pwexKamWU8S63BMOBe95yRLlUwkr6hvygywAF7macS+fBUZBWo=@vger.kernel.org
X-Gm-Message-State: AFuF++kK0ZC+oEI+TCqtxP7ZX07GcgoqD3tTvqX4LKsiwrPC2fX+LgcQ
	jxy+68akwwNdQyQKwhAIaZrud+GB1ymON+wU2ejYSuJinruPe/YdRbihM5KCGW5Ny1UfNe1XgZg
	wCzHZBhEvWyj1ZPLSoaCGKpE/+bJo010=
X-Received: by 2002:a17:906:ef0d:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c2556d82939mr91521066b.10.1787863075337; Thu, 27 Aug 2026
 13:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com> <20260826233919.998904-14-seanjc@google.com>
 <CAO9r8zOOq05nWk6c1sCnPAimFTuZLxc3BDrZLro-fXPR6ZMmTw@mail.gmail.com> <apCd5RSDYH13g0qR@google.com>
In-Reply-To: <apCd5RSDYH13g0qR@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 27 Aug 2026 13:37:43 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPF7yPWopSQD=YSLuAxDU5YAacEWwEMbt3s_s9a=niCoQ@mail.gmail.com>
X-Gm-Features: AcwNN1WuIUJWExKIoWQAGcMNXDikuEI908HWNia6xQh5jw2WY37kSbr_ADCb82A
Message-ID: <CAO9r8zPF7yPWopSQD=YSLuAxDU5YAacEWwEMbt3s_s9a=niCoQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] KVM: selftests: Add and use double-underscore
 versions of vmlaunch() and vmresume()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	f734222792@gmail.com, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 1:28=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Aug 26, 2026, Yosry Ahmed wrote:
> > On Wed, Aug 26, 2026 at 4:39=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > diff --git a/tools/testing/selftests/kvm/x86/aperfmperf_test.c b/tool=
s/testing/selftests/kvm/x86/aperfmperf_test.c
> > > index 11f5894d8ac7..a082658c1e48 100644
> > > --- a/tools/testing/selftests/kvm/x86/aperfmperf_test.c
> > > +++ b/tools/testing/selftests/kvm/x86/aperfmperf_test.c
> > > @@ -83,7 +83,7 @@ static void l1_vmx_code(struct vmx_pages *vmx)
> > >                 vmreadz(CPU_BASED_VM_EXEC_CONTROL) | CPU_BASED_USE_MS=
R_BITMAPS);
> > >
> > >         GUEST_ASSERT(!vmwrite(GUEST_RIP, (u64)l2_guest_code));
> >
> > Do we wanna give the same treatment to vmwrite()?
>
> Yes, and vmreadz().  Assuming '0' is simultaneously a reasonable failure =
and "safe"
> value is so stupid, especially since AFAICT literally none of the users a=
ctually
> need to gracefully tolerate failure.
>
> LOL, and it can't possibly work, because vmread() clobbers the zeroed val=
ue on
> VM-Fail.  Hilarious.
>
> I didn't include those changes purely because I had "#$*@ this code" fati=
gue. :-)
> But since this is going to conflict the world over, yeah, it makes sense =
to just
> fix everything.
>
> > > -       GUEST_ASSERT(!vmlaunch());
> > > +       vmlaunch();
> > >  }
> > >
> > >  static void guest_code(void *nested_test_data)
> > [..]
> > > diff --git a/tools/testing/selftests/kvm/x86/nested_emulation_test.c =
b/tools/testing/selftests/kvm/x86/nested_emulation_test.c
> > > index 2b38eff4f516..11fe4a31eda0 100644
> > > --- a/tools/testing/selftests/kvm/x86/nested_emulation_test.c
> > > +++ b/tools/testing/selftests/kvm/x86/nested_emulation_test.c
> > > @@ -102,7 +102,7 @@ static void guest_code(void *test_data)
> > >                         exit_insn_len =3D vmcb->control.next_rip - vm=
cb->save.rip;
> > >                         GUEST_ASSERT_EQ(vmcb->save.rip, (u64)l2_instr=
uction);
> > >                 } else {
> > > -                       GUEST_ASSERT_EQ(i ? vmresume() : vmlaunch(), =
0);
> > > +                       i ? vmresume() : vmlaunch();
> >
> > Ewww
> >
> > >                         exit_reason =3D vmreadz(VM_EXIT_REASON);
> > >                         exit_insn_len =3D vmreadz(VM_EXIT_INSTRUCTION=
_LEN);
> > >                         GUEST_ASSERT_EQ(vmreadz(GUEST_RIP), (u64)l2_i=
nstruction);
> > > diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c=
 b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> > > index 50c271a03692..c36c11b5f518 100644
> > > --- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> > > +++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> > > @@ -112,7 +112,7 @@ static void vmx_run_l2(void *l2_code, int vector,=
 u32 error_code)
> > >  {
> > >         GUEST_ASSERT(!vmwrite(GUEST_RIP, (u64)l2_code));
> > >
> > > -       GUEST_ASSERT_EQ(vector =3D=3D SS_VECTOR ? vmlaunch() : vmresu=
me(), 0);
> > > +       vector =3D=3D SS_VECTOR ? vmlaunch() : vmresume();
> >
> > Ewwwww
> >
> > Can we make these if/else statements? It was already ugly, but it
> > looks even more ugly outside of GUEST_ASSERT_EQ().
>
> Yeah.  Another idea would be:
>
>   void vmenter(bool do_vmlaunch)
>   {
>         if (do_vmlaunch)
>                 vmlaunch();
>         else
>                 vmresume();
>   }
>
> To yield:
>
>         vmenter(vector =3D=3D SS_VECTOR);
>         vmenter(!i);
>
> Never mind, that's a terrible idea, the call sites are inscrutable.

Yeah, but I do agree that vmlaunch() vs vmresume() handling in
selftests is annoying (e.g. see run_l2() in [1]).

If you wanna go scorched earth on the nested VMX infra, what if we
track launch vs resume (e.g. set launch=3Dtrue in prepare_vmcs() and
lauch=3Dfalse in vmlaunch()), then provide a single vmenter() API for
tests (with no arguments)?

[1]https://lore.kernel.org/kvm/20260728003557.1136583-29-yosry@kernel.org/
