Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD14C33D4
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213585; cv=pass; b=Dg0pWcI1xO0V62AJAZYFFQbrffp2iD9Uw2/F92G0B7k+AOh3zFVyQdb15PDRMq69sbc9m/tKge35PgqjvR+nFJocXdaaWuW8w/sSKvcbWMCK4aBy7PpM6zEGJ2/lTZ2sxXzh26rgMxMJSrEDupSpfAmD7ec1PxRmR5750iVVd9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213585; c=relaxed/simple;
	bh=UIl4kdhOZ2E8Ywuw71YkjmtzARY2f4WIsxfjGE5sW2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEjrnLQ55jivR8d+SsneQpm8Kj2tkyn8j1YHVeVnN9W44euzq8zX/7fprCwmxEuc7w6H8sucryrPHN5lNJe8PsEBtSZJ2tkmn1Jq5h9iR6MtPbZK7Ir9br4msuqJkxFIii7XHyR6+YE/LoA9gEPAr8rH6i5qMGfQ0mknzRr4QAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org; spf=pass smtp.mailfrom=bitbyteword.org; dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b=DB3qFyiP; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="DB3qFyiP"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac525c1f05so16329947b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791213582; cv=none;
        d=google.com; s=arc-20260327;
        b=fPZC/8lnZn+I91CP0w13Hz6hD+zLwbtdddxX66O/itcBeWYHeFPz6/9o4wziug/Yo8
         QrklrM7fxsLQdrfx31ycS3OOiW6cvrsR0J9YqbHhj7VIp7Dk7CUZnLmm3luziEI4crgS
         Tl2vIfwTGSFEfABsUzROCCXuvgPD2ay0twWP4z1H2YbCHB/tKv7vO9MievQTigiRJCM0
         UoCZA8SwvSH3HklnGA4s2MXASKV9l56FeX9eDbOWi44isgglu/0oiP/wPYA31EUouzcC
         ovEwAOT2FhWJ5/LY6dtBD8I58t/8x3C/jq+28EMKN+BWeofrXpDhsxaQO/AkWxfnJIuB
         yjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T+dMDT3scTIxkiT9pgs5QLVQ4RLiEtpfcAYTaBoUr5g=;
        fh=ubY1dJHwOgI4wWDfRiJ6nkX3GOTls5dhmtUMYo+Jlgc=;
        b=oWeJxfgIz049tOkQYQYuvhoZmJ9l7H+VGGFHKnSYZgZGsgiuxguKJ7SHaLU037z8nl
         /VH9i3n1svGs0cMHecCZ3DB8onqESh4n2RHdvl62So7FpU+Gi2grez+AT1WgpYg3/aPN
         HTOMQRGtdF+sIoKdIhhMlsQQj1wiLwbcv3Y+vn57uAxdGnnJ+BJc1mjX69zfA9z7OulX
         ycH7u5w/jAZHI20D7crOeEzLYBVDKQ8kDEn2fkKc7dCn5gbqJSHq0WfEDoi92k/mkJGq
         C6EI3O0XlbLoexi6+OD0AAPIUmaf4fZ3nvyiHGWwvy5DNgBualALxtW1p9E0yYeL1hnd
         icWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1791213582; x=1791818382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T+dMDT3scTIxkiT9pgs5QLVQ4RLiEtpfcAYTaBoUr5g=;
        b=DB3qFyiPRuQSc6yWtUaXp0WtMEZp1VVcP29Bf/lhUeG9CvIm+9/MrilJAUXa7re+JV
         eJDsiYUVkiVYmb8nZv80Ig2gTke3bksKtLFzaflVx+1F5EuJ5AdidZfAmnZIR9QT50o5
         8+1LOJInDtgHVBoclRjjpX4SpzCRIsGvUZA7vgdaNNut0aRP92oyn1eefhvEVx82mf3D
         vc/6xF5VUclbtfw0f9bAVkG0a4572h2fqNIcNxTOecHqdyhvaOqjjfRdGB5/51MrD+EM
         dHeq6SI01JKq5P4bkTmJYw6COVzgAHlQ/UwdAC0r/DYqlySJfdgoHZLAOtOt3av6AVbx
         jHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213582; x=1791818382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+dMDT3scTIxkiT9pgs5QLVQ4RLiEtpfcAYTaBoUr5g=;
        b=i297OJ/cbZjjfuYK6rEdtprq/YIJfqT0+CF619yUJdgLy0QnkZ6RHtHx1WmGC9Y99R
         N1RQXbKlfSy62PzbP76N/1IhL4934qJdO2oRS/SGvcMhKHIjStjY5HpS6OfhXy0fhqte
         XXtT3B0xisJBfmds9U4D9LXAiFkZYDDmTTkuDdIYf7rynLxxoecBTYpSZ66SkL+paIhr
         /73V2YgYLaD8QtkOqVXnt44M7LESS86f4oZr7jaO4B0L1DwLjAMVSLXwE/MZgesST35j
         cZkRLwmQB2jfzA1lVDP5wxjBoQW8JoO9ws8u0NM3OkjLHBEo+oO3CdHg10IQwtF6bzo2
         tFnA==
X-Forwarded-Encrypted: i=1; AKwUvBxHczxNQbnHUwEKzhPZkXQVJuFuY/N42KW4hshb03+Dcj7iv4ZVksqFTOuBOP6bmKZPRNIiszjFFQQgSd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXIw+zELW/d/qF2YA2dEef+uyzIKyJy5Rbdez1IhQrfhoRhbxL
	In3QJjjpEUm9PKBrI75wtuCkkbT4HJJf6OiTYI4HIQKKn3KmyRKa8CBXE27CQUjMfxNCzEsj+Wl
	H5WNjtvf468ZuhGJ0vEC9tVxxqPlfEqDRqqnubfxbgg==
X-Gm-Gg: AYBFou1Qpe1KoSRMpO1EsnNxt0VkxjtPZb0/d0Azua7e28ljDPJMONodp912VNZRbqp
	ofF4RThPOy5kVY2pJvHaE1Opi9naJGCSJYjQMtY1w/iHf4BAYcFphe86l/Hgyh3cwg38QTT4WU1
	Ye+JL3QlxQkcewfy68isb64pwkBobNADcIvH/7f/f/WAOQArxb/mHge22EDdTYMEa+lH5FtgOPa
	d0EDyLzs1WtGxOx5iZ3bMAZTWJMwa3CEaDqquRXadL85++4E4SGboklRj4UDLS88oohxF9W/eix
	CYsVt+XpeL4SHl4V8ol+cLQMGgJBU5pzhWgAFmsdNR4Q5EfMMc6Uwg==
X-Received: by 2002:a05:690c:e0c6:20b0:88e:edf8:e375 with SMTP id
 00721157ae682-8ae948c7652mr24080357b3.5.1791213581979; Mon, 05 Oct 2026
 08:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e61df396-356f-4ef2-9c3a-db3c05cb5c52@linux.alibaba.com>
 <asA7ixFlhNJpANoR@google.com> <CABk29Nu5rnd3wZq8XR5Q3BA2dQzT68hHSv1JihxT3V6GTSyRHw@mail.gmail.com>
In-Reply-To: <CABk29Nu5rnd3wZq8XR5Q3BA2dQzT68hHSv1JihxT3V6GTSyRHw@mail.gmail.com>
From: Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date: Mon, 5 Oct 2026 17:19:29 +0200
X-Gm-Features: AclHuK-zIbzN8D_HOP9FBWUlLNlIQG4wLIZCCdCvUIczbMj8moj0m1yI42dbwwg
Message-ID: <CAO7JXPiBZ5xQp1P9taEe3Qpy_pLDCzXgSWtEMbbHNvya93wi+Q@mail.gmail.com>
Subject: Re: [PATCH v2] x86/kvm: introduce pv idle time
To: Josh Don <joshdon@google.com>
Cc: Sean Christopherson <seanjc@google.com>, He Rongguang <herongguang@linux.alibaba.com>, 
	pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, vkuznets@redhat.com, 
	geert@linux-m68k.org, sammiee5311@gmail.com, lirongqing@baidu.com, 
	schuster.simon@siemens-energy.com, kai.huang@intel.com, 
	shannon.zhao@linux.alibaba.com, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 12:20=E2=80=AFAM Josh Don <joshdon@google.com> wrote=
:
>
> On Sat, Oct 3, 2026 at 1:17=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > +Vineeth and Josh
> >
> > On Tue, Jul 21, 2026, He Rongguang wrote:
> > > Hi, this patch introduces a PV mechanism for guests to publish their
> > > vCPU idle state and accumulated idle time to the host. This allows
> > > the host to efficiently determine whether a vCPU is currently in its
> > > idle loop, and knows vCPU idled for how long. QEMU patch and ARM64
> > > support patch will follow in a subsequent series.
> > >
> > > The guest writes a GPA pointing to a struct kvm_idle_time via
> > > MSR_KVM_PV_IDLE_TIME. When entering idle, the guest sets the flag fie=
ld
> > > to KVM_PV_VCPU_IDLE. On idle exit, it clears the flag back to
> > > KVM_PV_VCPU_RUNNING and adds the elapsed idle duration to idle_accum
> > > (in nanoseconds).
> > >
> > > The host can read the flag at any time through
> > > kvm_arch_is_vcpu_pv_idle() to make better scheduling or resource
> > > allocation decisions. For example, host may overcommit those vCPUs
> > > which are mostly idle. An in-guest agent may be absent, or may not
> > > report the status in time.
> > >
> > > The accumulated idle time provides visibility into per-vCPU usage for
> > > monitoring purposes. An in-guest agent can report VM CPU usage, but
> > > this PV mechanism allows the host to obtain guest CPU usage even when
> > > no agent is installed. This is especially helpful when the hypervisor
> > > enables exitless-hlt/mwait (for better guest performance) or when the
> > > guest uses idle halt-polling, both of which make QEMU vCPU thread usa=
ge
> > > deviate from the actual in-guest vCPU usage.
> > >
> > > This feature is advertised via KVM_FEATURE_PV_IDLE_TIME in CPUID leaf
> > > 0x40000001. Guests enable it by writing the appropriate MSR during
> > > initialization, similar to the existing steal time mechanism.
> > >
> > > Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
> > > ---
> > > v2:
> > > - grab kvm->srcu in kvm_arch_is_vcpu_pv_idle() before calling into
> > >   kvm_read_guest_offset_cached().
> > > - return KVM_MSR_RET_UNSUPPORTED instead of 1 in MSR handling if
> > >   !guest_pv_has(feature).
> > > - in set MSR handling, set vcpu->arch.pv_idle_time.msr_val after
> > >   kvm_gfn_to_hva_cache_init() return success.
> > > - in kvm_arch_is_vcpu_pv_idle(), remove ghc->memslot check, let
> > >   kvm_read_guest_offset_cached() handle it.
> > > - in kvm_arch_is_vcpu_pv_idle(), no need to use struct kvm_idle_time
> > >   local variable, it is too big, just use __u64 flag is enough.
> > > - remove some straightforward code comments.
> > >
> > > v1:
> > > -
> > > https://lore.kernel.org/kvm/36863cf7-61b9-4885-946d-1608179fcab4@linu=
x.alibaba.com/T/#u
> > > ---
> > >  arch/x86/include/asm/kvm_host.h      |  7 +++
> > >  arch/x86/include/asm/kvm_para.h      | 19 ++++++++
> > >  arch/x86/include/uapi/asm/kvm_para.h | 24 ++++++++++
> > >  arch/x86/kernel/kvm.c                | 68 ++++++++++++++++++++++++++=
+
> > >  arch/x86/kernel/process.c            |  7 +++
> > >  arch/x86/kvm/cpuid.c                 |  3 +-
> > >  arch/x86/kvm/x86.c                   | 69 ++++++++++++++++++++++++++=
++
> > >  7 files changed, 196 insertions(+), 1 deletion(-)
> >
> > I really, really, reaaaaally don't want to take on any (more) PV schedu=
ling ABI
> > in KVM, if possible.  And I definitely don't want to take a bunch of on=
e-off
> > hooks, e.g. for idle tracking and then for something else a few months/=
years
> > later.
> >
> > Vineeth and Josh are working on PV scheduling via sched_ext and I assum=
e additional
> > communication channels.  I'm guessing idle state is one of the things t=
hat'll get
> > communicated to the host?  I don't know the exact status of their work,=
 but they've
> > got a slot in the sched_ext MC at LPC:
> >
> > https://lpc.events/event/20/contributions/2482
>
> Thanks Sean, yea this looks achievable though the pvsched framework.
> Note that usage of sched_ext is not a requirement. For something like
> this idle time tracking, it would be trivial to extend the pvsched
> guest component, which already tracks guest scheduling state changes
> via guest context switch.

I also agree, this could be achieved with pvsched. In the latest
pvsched PoC  (not yet posted upstream), the guest vcpu infact updates
pvsched shm when it enters idle. Host side of the pvsched(default
pvsched policy) uses this information to take some actions before the
vcpu thread sleeps in the host. Idle time accounting is also not yet
implemented, but it would be trivial to build on top of this
framework.

Thanks,
Vineeth
