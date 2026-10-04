Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E9941611D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152433; cv=pass; b=b649K0Hh6+78I3M0ZlRua8h0mySifyUFdJGdu1G9xZf0QgdGV9Syo/knpDVfIie234WkfTnC6lRnnt+ZhCId3pVVUkwnwBXRUMq0wb+ZEs7kbsa+KeOQOWukKsM2jZWyAQ36/tlHB8yXlOwxy1Y2ktZgPOIMzhmktUD9Cmlbdk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152433; c=relaxed/simple;
	bh=XgFf0V3Zwk70tdgQVOzBVGpxn9WfToTnVVb8pOQ7a/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4b8S1qrzH7Xw7tPTNDWGsFFhUH53u8w7Y5mqCer6JYdsHxIrnwXxWYMhRNlf/BOjbXBAJ2Apjub0g20DRf0aEYBzVC3USET7qhiX350QD5Yf/MxPRDDhnFQqNvq/ShAVMVRUGiU6vZrEsjyV7wyJTGxm1aT1Ml2OOtwlkclEtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s2TpqMbz; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s2TpqMbz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so1654e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791152425; cv=none;
        d=google.com; s=arc-20260327;
        b=tBgZMHyixp6ECvzaUC1clcUJuBmuuj9hTdRdTsOirqpYbamChgLvmbIM/R2O2j0jjd
         XmRsGKdw+ieOaIJz6kGwUjhHckq5cnwf3vBLAunlVZCi9ElPzOgQpguZXabFhzzwbWxv
         hUba3bV8w3r0+4T3iQh1FpQ+HqBuKbU/5NVsgeF0wxwCQjU7c0OdiucaSjE9c6aTP+bE
         XpRc465N2IQkYV8gEidnbEdtrUrqc8G+Xcc9TXcfUyxH03DGe9qsm4OLB8HV/y2pMrSv
         PzHcVWm5S+Gejyfwldov4RH+g1Elj23rkVKs2dO4sPtS/DjBkwHIhIJOXxNNsYyTB0ib
         HNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=57r++D/W5FdfNaHzmVXc+jEW9QTol9obBS4Hemyq/Zo=;
        fh=V6mFxgK7+9RUFiQvaanFo7//bAv8q9nnbw1NaNP8D4I=;
        b=RTKUixeDqqgMpa492l9JvTt9i6RfLypluWn386i1MQ1Mpo3aHM0U/j79PSIqv7nVMg
         IGiszwsDp6eQOXeKgZAbxUMZVvliVMRFjIyePxFAypxCOTRmaMRLOybFuAE5p3pXHIIs
         wIVIZ4sjU1BdTd+34EpU8v2kC4k0ZwqjruR0e3iTBKD60OWeLdgtQGalNDDgIa/egH8Z
         NHla9JvA0TNYtmGJVhZGE4x2B3bt5GWauxKUIgq4Xj9Ia57WNgCVwj7Ff9pXLCNaZIzH
         WKkOXWeMkLWUeiLpeNP62Rk+79g+4JruvhPndDYNJilOZU+R869sgRxtGtyQ3KMOwHk7
         uPZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791152425; x=1791757225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=57r++D/W5FdfNaHzmVXc+jEW9QTol9obBS4Hemyq/Zo=;
        b=s2TpqMbzNr0IdbxeGuoxlQBYiTJk0CgxdaPBdYQ1gdi/yEPNAtfeDKV8BPLtskXmt3
         bfGtFz1bvErtKi6ZjS0G2eX0JVJ1kvIGF2eaYanjI+a1mprivWFyqbMw0QR/ENyiAnQK
         DGdiw8BiYQO8hG3b3ruNAeLPZQdddWBzYUCgvyV3bYkNpMZxc0RwmvTR1OrxNMZhNEZ+
         jOk5etXV9s6KYxXSescT6JpwQNI9vidC0/ShUYBQosNctmkzQvigHBfpYvIw9C/E7X0r
         7dEPh+/TsQRHUqnUrEBvqjtH56YOh23KQUAjw87Cy/Mm25VshPeSiZvQvHqp7OUWmttW
         LquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791152425; x=1791757225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57r++D/W5FdfNaHzmVXc+jEW9QTol9obBS4Hemyq/Zo=;
        b=K7IodIgJ++Kk34DBghbywRDIBGcyIaKdQai6j7ul7uej0ZhSGVwD1ay57AL4IGfPEP
         jkZGlXSrAJlEnFRq/8QsTllIVxXVAoxrghp2vXDHaBdS5AmFOsx4hvPeUyOmn3gatqqi
         Wb2cCg6PeeIT2YuyLBD4W3hKoYaucFmKI60af6TRx7dqC0TV8bW2H4F48/Pa3HGfa0s5
         QNodjNwGMm5ULfmmzh3obuoDGuee1k1zr+CqovJOPqaHde/+oj6+G4lcr8APlZvD2PAT
         81YUBKzkl5mJ80grP13h1HOPFYC9Y94EYqKKcm68uBLR79WOC7F4Ov2PZ4yZtDn/UWbU
         bwHQ==
X-Forwarded-Encrypted: i=1; AKwUvByeICA5WoJgj7ClP7LXYSE3MOcrN1LBEviLGiVo2sY4JT1mATt4/ZBY2N5sGRlwD9+YTrE4Ry2QN/hRJOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL8hBV/7zu0YMGWRg9OmJhnNepejYjRIUoHDKPsZEAXV2vNle0
	i1epgygooFY79sm7JEIFwxqQ+xd4K/BqHXaDnIGnVrGV8fGNOkDqSApRP9E9J23+lI588N9OHcy
	QkCF9Uw3GtpTNyERuMMkS6LG+U4poJbxETcFSSNeH
X-Gm-Gg: AYBFou1OgA14Y1ycfgHIZNkF/OylhPxOsscEcyz723Fq1FYMCLRfny0fXyKsifeNp98
	HzvDgKfPM1xCwYZq0o8M7yyQ3qhW2KYb4sWHKr32K2rbWTzopC4ghM8c7jo8HMfp7esMvBlIYpD
	RRw+gAJlXjtLWVBcFlZnuVDIi8fNIjbZQas5M6mkyIypetp+ETsi2RF+hKQ5riweoGeMcifUIrm
	ZmEQ2Et1bFT6MrHKP1E2Z6V1Z3aCR5W3WO/mF9Vvz65tWwzWiGqTZAaYo5UxWKtHegrEnDXfBHl
	goHLESBKuhaDIhSv+cH6ll7iDc+dqzY/aM6jrnx/2MNCwPm37o7jpOEbD9KHInIw5YPy9l+BKUd
	XFZtLmBjM
X-Received: by 2002:a05:6512:12cc:b0:5b8:c932:f056 with SMTP id
 2adb3069b0e04-5bcb62a9caamr122163e87.7.1791152424823; Sun, 04 Oct 2026
 15:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e61df396-356f-4ef2-9c3a-db3c05cb5c52@linux.alibaba.com> <asA7ixFlhNJpANoR@google.com>
In-Reply-To: <asA7ixFlhNJpANoR@google.com>
From: Josh Don <joshdon@google.com>
Date: Mon, 5 Oct 2026 00:20:13 +0200
X-Gm-Features: AclHuK_mrhmx5Nw1OfCHCYw_l507ZApaU7MPipokAeot-vC-4w_HOGNToVZP06A
Message-ID: <CABk29Nu5rnd3wZq8XR5Q3BA2dQzT68hHSv1JihxT3V6GTSyRHw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/kvm: introduce pv idle time
To: Sean Christopherson <seanjc@google.com>
Cc: He Rongguang <herongguang@linux.alibaba.com>, pbonzini@redhat.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	vkuznets@redhat.com, geert@linux-m68k.org, sammiee5311@gmail.com, 
	lirongqing@baidu.com, schuster.simon@siemens-energy.com, kai.huang@intel.com, 
	shannon.zhao@linux.alibaba.com, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vineeth Pillai <vineeth@bitbyteword.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 1:17=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> +Vineeth and Josh
>
> On Tue, Jul 21, 2026, He Rongguang wrote:
> > Hi, this patch introduces a PV mechanism for guests to publish their
> > vCPU idle state and accumulated idle time to the host. This allows
> > the host to efficiently determine whether a vCPU is currently in its
> > idle loop, and knows vCPU idled for how long. QEMU patch and ARM64
> > support patch will follow in a subsequent series.
> >
> > The guest writes a GPA pointing to a struct kvm_idle_time via
> > MSR_KVM_PV_IDLE_TIME. When entering idle, the guest sets the flag field
> > to KVM_PV_VCPU_IDLE. On idle exit, it clears the flag back to
> > KVM_PV_VCPU_RUNNING and adds the elapsed idle duration to idle_accum
> > (in nanoseconds).
> >
> > The host can read the flag at any time through
> > kvm_arch_is_vcpu_pv_idle() to make better scheduling or resource
> > allocation decisions. For example, host may overcommit those vCPUs
> > which are mostly idle. An in-guest agent may be absent, or may not
> > report the status in time.
> >
> > The accumulated idle time provides visibility into per-vCPU usage for
> > monitoring purposes. An in-guest agent can report VM CPU usage, but
> > this PV mechanism allows the host to obtain guest CPU usage even when
> > no agent is installed. This is especially helpful when the hypervisor
> > enables exitless-hlt/mwait (for better guest performance) or when the
> > guest uses idle halt-polling, both of which make QEMU vCPU thread usage
> > deviate from the actual in-guest vCPU usage.
> >
> > This feature is advertised via KVM_FEATURE_PV_IDLE_TIME in CPUID leaf
> > 0x40000001. Guests enable it by writing the appropriate MSR during
> > initialization, similar to the existing steal time mechanism.
> >
> > Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
> > ---
> > v2:
> > - grab kvm->srcu in kvm_arch_is_vcpu_pv_idle() before calling into
> >   kvm_read_guest_offset_cached().
> > - return KVM_MSR_RET_UNSUPPORTED instead of 1 in MSR handling if
> >   !guest_pv_has(feature).
> > - in set MSR handling, set vcpu->arch.pv_idle_time.msr_val after
> >   kvm_gfn_to_hva_cache_init() return success.
> > - in kvm_arch_is_vcpu_pv_idle(), remove ghc->memslot check, let
> >   kvm_read_guest_offset_cached() handle it.
> > - in kvm_arch_is_vcpu_pv_idle(), no need to use struct kvm_idle_time
> >   local variable, it is too big, just use __u64 flag is enough.
> > - remove some straightforward code comments.
> >
> > v1:
> > -
> > https://lore.kernel.org/kvm/36863cf7-61b9-4885-946d-1608179fcab4@linux.=
alibaba.com/T/#u
> > ---
> >  arch/x86/include/asm/kvm_host.h      |  7 +++
> >  arch/x86/include/asm/kvm_para.h      | 19 ++++++++
> >  arch/x86/include/uapi/asm/kvm_para.h | 24 ++++++++++
> >  arch/x86/kernel/kvm.c                | 68 +++++++++++++++++++++++++++
> >  arch/x86/kernel/process.c            |  7 +++
> >  arch/x86/kvm/cpuid.c                 |  3 +-
> >  arch/x86/kvm/x86.c                   | 69 ++++++++++++++++++++++++++++
> >  7 files changed, 196 insertions(+), 1 deletion(-)
>
> I really, really, reaaaaally don't want to take on any (more) PV scheduli=
ng ABI
> in KVM, if possible.  And I definitely don't want to take a bunch of one-=
off
> hooks, e.g. for idle tracking and then for something else a few months/ye=
ars
> later.
>
> Vineeth and Josh are working on PV scheduling via sched_ext and I assume =
additional
> communication channels.  I'm guessing idle state is one of the things tha=
t'll get
> communicated to the host?  I don't know the exact status of their work, b=
ut they've
> got a slot in the sched_ext MC at LPC:
>
> https://lpc.events/event/20/contributions/2482

Thanks Sean, yea this looks achievable though the pvsched framework.
Note that usage of sched_ext is not a requirement. For something like
this idle time tracking, it would be trivial to extend the pvsched
guest component, which already tracks guest scheduling state changes
via guest context switch.
