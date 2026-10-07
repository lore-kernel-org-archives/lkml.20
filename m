Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9173D669C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393953; cv=pass; b=TB/KojmTPTOeOlIUHBTHtbQU6o30GPFNzyakGfxmwN1hYYvFb+OoiUJr73XDt5ejPYLPdww71V6II/Nwa1DvbCBBDcQ9dJ0Oe8761tphpmxaHi5ws4DvY0ADtS4iWhcr2wQvIRBgRANdrwp9p5/dPj3xCcK3YRgRg4JpCdo2tNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393953; c=relaxed/simple;
	bh=bFp9FVgXRrSNtyXuTeJPHtEaTr54uyHDuywyPyXVyxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVIkH+wot1BWhfDB9rvTh4SOJOBsdrPgaW/N8uhqb0DL5Ous3GTYh0M84NLy6e+xd2tRjBkP3gUQ1ZyCmlkdzNNNHf6kHUUjkjYUJVYWOVlzYulln2wuRPt2Y1pjLCgwsrm1uDqV+mc3Zy7JOOleWlDlWsB6jq/zo5iAn7bgo7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1VeGU1m; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1VeGU1m"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso534a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791393950; cv=none;
        d=google.com; s=arc-20260327;
        b=V3PrnUOwA+zCGXPXULfX2tmclwcw5JkoqGeklJwVweZG4nKoaQdT8owGtegOqQpBx4
         dXsevIhcb50zXXbd0Llll9NE8yCghX5msR6fScMdrmh/a6PGt8CBJDeF3sjV52MuOhfN
         3uhLZYmWQQGdU+EvGuCi1aEmXLElvSiL5lisNB2WqlirJmjSOLJWhLdMzKyJIOS6nym2
         42YPOIEMHtY8g3zXEMdYsUyN/eE5s4rpPGXqIRkpw4eJ5SZfRYIJo6X1Vjoo26z6J9Ah
         lkF0S6wHO4JLzWBRMxsFnwojHjhWyqPjDLVk5pbBHENDJMQl2MCVr84N0K1Y2ESzo1Uc
         0SXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6P0cpKO7LTMMHYnGA44fwrKbiotpZEp6qx4bE4GHhk=;
        fh=dyd04mVIY9gFrvLNdAZNC58EMyqLz5FxGnwpPtjrAHM=;
        b=myjsQkuryHshVrjVMGsnVakYVF6hJP/4L/7M1KKpOKoFRx9gMkC8oU1GFNgGi0alyb
         eDNUNVSGiYciOPlXRc2Qo+MkaleFAIYxJhKCAyxar8QDfNpZyGGB8UIGafnWgInOnRyP
         zd7UcPFwj/hfja8JXtjimxHq7tM+oIbWJdAnBeooOAnCHBLFp8G+cWGermQ/Sb8iQd5+
         ZPJHwYZ5Dt0GY9NaRMNApG1IEEs6GaXWqvjjlRnKgx6VPP3rXZ+ideEZParIx3RBxvTu
         HmkeD83/rHIFkLK3ZI7vm4BN7j8W9vTCmUuI9CfvxkUs3OEjnzQjzYVj/cgpfiY55MNr
         U80g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791393950; x=1791998750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6P0cpKO7LTMMHYnGA44fwrKbiotpZEp6qx4bE4GHhk=;
        b=q1VeGU1m52RkcepBIokglRDWdJ+xNQv/2QGgQvXj8ah3/fvnKWPaMZRZNf5usWqz8L
         7O786uaIN072g3ny6yIsddKSTwYkDOHkifLzGEVqdowonCYncusHMtWtFwx6S2tFISua
         sSzuJj8pvJBdXcJUOzaRTf7uEoUUkCt4ipT/bXKax7+2tj+ksD9+oPE0pP/2rwZUON7A
         k6Ybd0Jv3t5cx8KakzPfAnwGYzL0qsdqjBiQFLehYabayEOo3bFp5BZEaYrQ3NR4rJmL
         52li/dh4f0NqS8DbSkEW/6b7z0o7YNGNXlg6Yzh3NcWfeOZEQEBXNCWrHxz3siUsrxem
         9oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791393950; x=1791998750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6P0cpKO7LTMMHYnGA44fwrKbiotpZEp6qx4bE4GHhk=;
        b=2WDiKQ/HDPIfiqF1Hf9m6HIedCTFGT8uGzQuuOAey8wqOLqbi8NFe4yyKAehX4RZRh
         0lNX9GAuB7zbt2/tBfCxJNyjzsA3yML7VHMhpVVMj0Oob3z1lIMlSrAmhGLOrWUmxszY
         IZFjEudjPoPjj6Ku6Pz0eqnxKsUM/ZZcm4ZzP9AKL3rRNYu6A6DZuxQ8AoO+Wcf1ZAjo
         DPr1RcQ86+iOzExLNIiS9iQsIrj2PLSHGuhJEj/EB3oZT/DNpkL9qsjgOxqTP7Wu/IX4
         P4gXsRlrpxE9YTOIlGb7VUKQV8XnFS8mHUxqUMs+EFpwfr/gZU1wJHWLsAENdimMDu66
         trVg==
X-Forwarded-Encrypted: i=1; AKwUvBx/cCAv3xEJvLeTkpIXFosEqvM+kQ4uPTqdk+IuXUZ4e8ohZrOE7iwE04vahPnSD+HWNV0EAHVEZxfl3Aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7pR5TPyH+VrUgLYZtQvaXIlLScp6UP2IVbu4EcHG0Ucwbgy5A
	GnWXOyYGWJ2kluUAh3xhbsBrpG1e8BhKVPecWszAkvwakHNYjlBwcQdgLmcX+K460958vQL9MtF
	UJjqVcIZ068LFWGToaewKo7B5UoCGjq4BbcLPh1tM
X-Gm-Gg: AYBFou1s5CyFUfM2Dmj7FB5mStuCC9lOWcRO126lJMnouqTzNsG+798iHD+HLPzp6lj
	TXJpoP95WybNxSMoY3fCoCclD9EhmNEaiqIuYoeIEKSnZfQoYrVR1UJSIfVD9Q4D4vAW/AOCLpk
	+K3hzwG9NVc1qfB+n5B79pt30Eug9JOOu6H3QAdZAN+XZUtQT8YDVoFcLCeMnN+/zLBFC8mk+RQ
	iwVV2D+qn0Hj04n8az5dYrHWMlcdq3rDLYJ6srIRY9R99EklRANzwdEv8ZSWmjFOHxct9MLhnIc
	us8r0VpCD5EK2Z80pAl0In1N5VLUbnOoteUtGv5edRFYq5Bbyd7MQDI=
X-Received: by 2002:aa7:ccd1:0:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6afdc8fe78dmr118123a12.9.1791393949297; Wed, 07 Oct 2026
 10:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com> <20260930173635.3362655-14-seanjc@google.com>
 <CALMp9eS0=HgM02Ff4mv6RLHVoM3EgavhKu_P6J-oTWTMbk9zng@mail.gmail.com> <asXg3cJvaeqMOfAr@google.com>
In-Reply-To: <asXg3cJvaeqMOfAr@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 7 Oct 2026 10:25:37 -0700
X-Gm-Features: AclHuK9eyrVIWkB2ErSGSXKSMWgWxHaYbX_W9hVeHs0rrHK0BMCJBAg7Fw6FRG0
Message-ID: <CALMp9eR8yMTFTJXVFHpkpv6ptt33Q3m16n=CWuBF6mQu=AaY5A@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] KVM: selftests: Use KVM's reported TSC KHz as
 L0's frequency (sanity checked)
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:04=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Oct 06, 2026, Jim Mattson wrote:
> > On Wed, Sep 30, 2026 at 12:04=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > Use KVM's reported default TSC frequency as L0's frequency instead of
> > > calibrating L0's frequency using RDTSC.  Trying to calibrate the freq=
uency
> > > in userspace is all but guaranteed to be wildly inaccurate, e.g. due =
to
> > > interrupts, preemption, etc, and no known CPU supports TSC scaling wi=
thout
> > > also having a constant TSC.  I.e. there's no need to calibrate the cu=
rrent
> > > frequency, as it should also be the same as KVM's default frequency.
> > >
> > > Opportunistically sanity check KVM's reported frequency against what =
is
> > > observed via RDTSC, e.g. so that KVM_GET_TSC_KHZ or platform issues s=
how up
> > > much earlier in the test, before VMs get involved.
> > >
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  .../kvm/x86/nested_tsc_scaling_test.c         | 25 +++++++++++++----=
--
> > >  1 file changed, 17 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.=
c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > > index d790ab36a198..a78585af0ffd 100644
> > > --- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > > +++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > > @@ -137,7 +137,7 @@ static void l1_guest_code(void *data)
> > >
> > >  static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u=
64 l2_scale_factor)
> > >  {
> > > -       u64 tsc_khz, l1_tsc_freq, l2_tsc_freq;
> > > +       u64 l1_tsc_freq, l2_tsc_freq;
> > >         struct kvm_vcpu *vcpu;
> > >         struct kvm_vm *vm;
> > >         gva_t guest_gva;
> > > @@ -159,11 +159,8 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u6=
4 l1_scale_factor, u64 l2_scale_
> > >
> > >         vcpu_args_set(vcpu, 1, guest_gva);
> > >
> > > -       tsc_khz =3D __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
> > > -       TEST_ASSERT(tsc_khz !=3D -1, "vcpu ioctl KVM_GET_TSC_KHZ fail=
ed");
> > > -
> > >         /* scale down L1's TSC frequency */
> > > -       vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *) (tsc_khz / l1_scal=
e_factor));
> > > +       vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *) (l0_tsc_freq / l1_=
scale_factor));
> >
> > Our internal Sashiko complains:
> >
> > [Severity: Medium]
> > Is l0_tsc_freq passed to KVM_SET_TSC_KHZ in Hz rather than KHz?
> >
> > In main(), l0_tsc_freq is calculated in Hz by multiplying the KVM_GET_T=
SC_KHZ
> > result by 1000. Passing this value divided by l1_scale_factor into
> > KVM_SET_TSC_KHZ configures the guest TSC frequency 1000x larger than
> > intended, since the ioctl expects a value in KHz.
> >
> > I concur.
>
> Drat, I thought I had fixed all of those goofs.

Well, the issue is rendered moot by the next patch in the series.
