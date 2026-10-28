Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217648;
	b=W5aU/3ge+1WhbiOyXx7do10YCxGTR4fRz2ksD++0+uxKuvc70YHwmFlbX6iIabgfARRX
	 9qAE8PWtkaeiRPhGBcwIrWPlE8EuqkYQcA0ZBw8Kyd3k/43JvsfM1js6j9ZJmL6CammK7
	 Q91eAF0uxI07WVPAER2FA9qpEuEFzIL/5XhPoniNcdpEdmn1y/2W/Xd5Q31uC3+L0bPoO
	 bJafh23aGwOQZIgjlxhbKAFra/MoN8/At9tjeoihZ3cHVSfpVMjxzyJ0e2Il0520Ls9S+
	 gBmpq3xhMiEz7lZLr3JsAXPIHxntGb5iPfE0PODNwpNZS3E+8JY/pEa1nrgmzsliKCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217648;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iN+I/JlwOuCME5qKnXSs3MS63FBCZtas7AXo/RaQmDc=;
	b=tHMSSzZ109KQQJO6ANb2S9cS3dzVC8DPzjBMDjTGY98dyCgyuebbdlEGibl60NhKJkpp
	 gzoyk/wegplQMewgn3/PB7nikX3omQkf5rbxoLtb6oQzYoztGlRr0glIxSDJ2WF1EKcBW
	 eI9L3H39YH060wtgcSXdWdkQH+afvrNrDuVToeS9ENbaCeGi/Hq1YMjedo8rjT2zNNdjf
	 AwLsK5dG4s6vQwvP0fMq+u1vXirupH5TbzxKehlmdyKz38hf/o7XsT+IZjdzJylLL7cbE
	 1sodpU0JjPX5lyOnhJJqiXkrl+EeSGAWojjrWzLzYgSan3lSZFWQlZm9uq2KhesXSuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EI0pwI5D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB8606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EI0pwI5D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1641A1F01825
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793217648;
	bh=iN+I/JlwOuCME5qKnXSs3MS63FBCZtas7AXo/RaQmDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EI0pwI5Df5XwDCaq/jpV/UeVZQz81n4DwXOEpc63jF1xwKaggjf9HRXj1giL/r8wt
	 gHApwEyu55+1TOk76KXARv0SrNurRnyp8HmN98rMoWikQCV1gqJPKo/flF/6ejpj8A
	 9GVqadhfpYU3qt8CerJmetnqM18r/Ft4qkxsCmlZ/M/ClBMTqobrCA+ekqoc3PiANt
	 FvcwuiK6PUiBhpvz4HRRSLgp0abNDoaYSKcQieg+AHD4jiuIVaU6Fysf64s7dPS+7p
	 KawZVHDTyjY/XV7aBrORzZEfsSpqlXp0ePv92I0fhtJTFzF8n2WbUce63bEkKBvcg5
	 eZ8xLHkgEzCNg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso65315a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:00:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuC10HYAK8FyncxmxdKQqfBWxSyc/h1/D3geEE0QQNQ8qcCGweivyeCuRjK9ctBnFawzDoZzMgTtwL7yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5uAQS/jmv4xMjEwBI45WXTdnfBJAzhwur1sDJGNK6Z/wmdGRH
	VQ4ZpugrgMPJFFMNUBGHLPrsGXgFVLdvVCpp/uxVEK7sKsbgogHAnPaIjdKzMjCMikIv1byp+jb
	i2xMFCcOaT401jXol9yu+yDaWMb27YJw=
X-Received: by 2002:a17:907:940f:b0:c2e:1b6b:8b19 with SMTP id
 a640c23a62f3a-c49d142cb22mr46806766b.23.1793217646978; Wed, 28 Oct 2026
 13:00:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-27-yosry@kernel.org>
 <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
 <atqRyeqSXViiNIk6@google.com> <CAO9r8zMqiW=3t7zRo_WAhKJfpYsDwuG3e=nK14GXhrq+foYnOw@mail.gmail.com>
 <at-O8-tzgezj2du-@google.com> <CAO9r8zO8ViSqCBer4rV5qBQGcDKA_60Aj_KEVQx2obd9zU7-Hg@mail.gmail.com>
 <auDkX94UTjrLNmqp@google.com> <CAO9r8zP5rom7VpA3-BsuB-H_+G5r-OC-Bfz=iTMbhQrWB4RYbA@mail.gmail.com>
 <auJTHfdEPjbhGdyw@google.com>
In-Reply-To: <auJTHfdEPjbhGdyw@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 28 Oct 2026 13:00:33 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOKuY5wGXYr9_L0p+-w3qBaNd36XgjyQn462zxU5aCY3w@mail.gmail.com>
X-Gm-Features: AclHuK82LMqGgvf__ZxUe0i6_hmRunCbftKZn4NK7U4RpiGRuFUQuVrnckq9TXs
Message-ID: <CAO9r8zOKuY5wGXYr9_L0p+-w3qBaNd36XgjyQn462zxU5aCY3w@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
To: Sean Christopherson <seanjc@google.com>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:55=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Tue, Oct 27, 2026, Yosry Ahmed wrote:
> > On Tue, Oct 27, 2026 at 10:50=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Mon, Oct 26, 2026, Yosry Ahmed wrote:
> > > > On Mon, Oct 26, 2026 at 10:33=E2=80=AFAM Sean Christopherson <seanj=
c@google.com> wrote:
> > > > >
> > > > > On Thu, Oct 22, 2026, Yosry Ahmed wrote:
> > > > > > On Thu, Oct 22, 2026 at 3:44=E2=80=AFPM Sean Christopherson <se=
anjc@google.com> wrote:
> > > > > > >
> > > > > > > On Fri, Oct 16, 2026, Jim Mattson wrote:
> > > > > > > > On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@=
kernel.org> wrote:
> > > > > > > > Moreover, does this change the semantics of PV TLB flush? I=
n
> > > > > > > > record_steal_time(), we have:
> > > > > > > >
> > > > > > > > if (st_preempted & KVM_VCPU_FLUSH_TLB)
> > > > > > > >         kvm_vcpu_flush_tlb_guest(vcpu);
> > > > > > > >
> > > > > > > > IIUC, an idle vCPU that wakes into L2 will flush only L2's =
ASID. In
> > > > > > > > the past, with a shared ASID, L1's ASID was always flushed =
on emulated
> > > > > > > > VM-exit anyway. Now, L1's ASID will be unaffected. Though I=
 can't find
> > > > > > > > any real documentation on PV TLB flush, it *seems* like the=
 remote
> > > > > > > > vCPU would want L1's ASID to be flushed. OTOH, this change =
makes nSVM
> > > > > > > > behave just like nVMX.
> > > > > > >
> > > > > > > That's a bug that absolutely needs to be fixed, probably rela=
tively urgently.  We
> > > > > > > should also document that passing through the steal_time shar=
ed information to L2
> > > > > > > to utilize PV TLB flushes for L2 is explicitly not supported.
> > > > > > >
> > > > > > > I hate to re-introduce deferred actions for L2 =3D> L1 things=
, but that seems like
> > > > > > > the only sane way to handle this, because handling the !tdp_e=
nabled case, where
> > > > > > > KVM needs to sync the current root, requires knowing what MMU=
 is going to be in
> > > > > > > use when L1 regains control.  Yuck.
> > > > > >
> > > > > > Are you implying that *you* will be re-introducing deferred act=
ions? :P
> > > > >
> > > > > Heh, probably not this calendar year.
> > > >
> > > > Are you opposed to this series landing before that is fixed, keepin=
g
> > > > in mind that it will expose nSVM to the pre-existing bug?
> > >
> > > Nah, though I should just fix the damn bug.  It's not hard, I just do=
n't want to
> > > do it because I don't want to reintroduce a deferred request.  Untest=
ed, but I
> > > think this is all that's needed.
> >
> > Makes sense to the untrained eye, although I do wonder sometimes if
> > requests more generally need a way to key off guest mode. I am sure
> > you don't want to open this can of worms :)
>
> It's not so much a can of worms as it is infeasible to come up with a gen=
eric
> scheme that would add value.  The hardest part in all of this is identify=
ing when
> an action/request *always* needs to be serviced in the context of L1, e.g=
. this
> code has been around for ages and it wasn't until Jimshiko came along tha=
t anyone
> noticed there's a bug.
>
> The actual servicing of the request in L1 is straightforward and vendor s=
pecific
> for the vast majority of cases.  E.g. guard(vmx_vmcs01) is essentially wh=
at you're
> asking for, but it's obviously VMX specific beause SVM can simply grab th=
e pointer
> to vmcb01.  In other words, there isn't a general need to defer requests =
or have a
> framework for servicing requests while L2 is active.
>
> This one is special because of legacy shadow paging, and specifically the=
 need to
> synchronizing the MMU.  In theory, we could temporarily switch to L1's MM=
U, a la
> vmcs01, but it's entirely possible L1's MMU doesn't even "exist", e.g. be=
cause
> the host state that will be loaded from the VMCS on nested VM-Exit is dif=
ferent
> than the pre-VM-Enter state (which is possible on Intel).  Even if the MM=
U context
> was known, switching MMUs at this point in the KVM_RUN flow is terrifying=
.
>
> So, while I detest the deferred approach, I also think it's absolutely th=
e right
> thing to do for a fix that needs to go to stable@, and probably the least=
 awful
> fix long term as well.  But it's very much a one-off snowflake, not somet=
hing we
> should generally encourage.

The other example I thought about is
kvm_service_local_tlb_flush_requests(), AFAICT this only exists
because we don't have a way to specify a request for L1/L2. But yeah,
I agree if these are the exceptions rather than the rule.

In my head, there was also a request we clear for exceptions on nested
VM-Exit, but looking at the code again, it's not a request, we clear
the exception and interrupt queues. I think this is the right thing to
do architecturally anyway though?
