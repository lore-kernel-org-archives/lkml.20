Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290140;
	b=5nBTy7zPLPUyOUbNKLz31pBRtG8clzZr6H/IYu1scEvo+wWxBbOKfDHmHOjyXKSBCHEC
	 u0c7NZGy3e3MRHmAKgO1qpUYlp1ZJ2VEKpFrNr/rwf9Ks5MMudrSR4/bneOgnc7t9EXjM
	 7tl0cvHND6//OHLQ/KaJaytuCcFA2ToHDYYCpa/fus5I9ICB8WNiKTEOjfFaKt7cP520s
	 0nv4L2k0gk2Ad7bU40w24nhrByWu2Cw/dnI4SSMRn+cbuT2QV5Mk1dGDwNu3v+uinyWwx
	 VeibVmYdYgDyk/c7gMEb63jsxQdB7LvXfpgSvoicN0PO4I0Zhyrj7OFJnb725yl/B5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=OHNiW1fEcGotXQsPcslbrEAPFgWaBl89lcN4d/8rNqM=;
	b=bxl4mb6WiMirscZwy04Aeco6lMt5K4MywkcS/4e6SIKvkVAIHdCqRVbIldHuMPTW/07v
	 NLJnOd9+UkOhd122J9GX6Ts/uexAi89ntEQ/izOOLqo6P3EAUZRiL1guc3eRjQneCwzYG
	 d7FUcrutegiJUut5CtcwuAmaNHFbKoXEA41BC7CBRunUqYOp1BRSIpv8f+DlKT264SWgX
	 hgevzQ7YUEQouodG+CuPKXG84psurvvBQSW3mVkvJaPDtebTgZQM/j77U9UK0FH93l5Cy
	 7p0VQS+xS5m8KRxjoZ2BthfMfMOpfRujkYnaewkKGQF8Qn5bpOEdc6e/AZpnPGMKbKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mWApyL/4";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE37606A336
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE37606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mWApyL/4
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1751984a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793290139; x=1793894939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHNiW1fEcGotXQsPcslbrEAPFgWaBl89lcN4d/8rNqM=;
        b=mWApyL/46zfljK+aNWNeEFjnrT2o1dEEHP3NoqspPOJrm9isAhfJYiwPwJShQEXFgm
         BgXOrZ4N8XCgOkXk8d25iFhxSwBfHzw+iwu8qhV1ywp63pLVXrOvsyB6ezqXwle31DcI
         FHGHaHMF3XV19QE7GZt+NsJOO0OViCR6YHcl0C0JWdSqoqn7p+Zjk1Tj38x5OijL4OMl
         wt6+I7wtgCjzDu67d/eBXUu+fAScIld5279ctc6ZF9YjJ4u7lvTCS/1FZF+wxXfvzn02
         Jx0pHWLyxnas9QfwOASXPlCIoyUzCNK1RKqU8a54I86HdVr3dk/okqKBhdvQ++Wq50bw
         r4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290139; x=1793894939;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHNiW1fEcGotXQsPcslbrEAPFgWaBl89lcN4d/8rNqM=;
        b=cspGzWBQnZpu2DCDys6FeUcEcGLLnxbjz9C5Wuyl0MLgYrQ1S04n5Lg3MP95uiAJaA
         bVgI0gVIx6Kloo+BXg52PoQU1cJdrjhArdFFDd+ESznxSX4fSpieH+8gPHcQ8lsOuRso
         RuvKjw+zDLF6OHE8U3xsLoQS1jbI3BpAJvMQzAu1STxsFNhcc+kupUEDwIt/g5nZYyCZ
         ElQAKMwhYweebPQVbEy1CUyaXxtGB3Y3Znd0GC5s4CEo/4tG3Dmyl2MPuQi0mZcYCPY4
         q8I7dUi+/NIZt6K0Xg7Jv97ED483pNDj9F3cwcb7j4JJSS/oQv5x1eaJ165UmkWQdPI9
         gmug==
X-Forwarded-Encrypted: i=1; AKwUvBypZ4ZUwGFyJdRTEmrgDbVw/GeuI0DcB0j2fQX1OprSgVWlKWO0XYDnk+1h/rHJKR6Ez5FOIMAqVAWhnZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4qwro1+4RFOdJCqCayKpmK3SOZpuH4WOVCF519AVYo0GzF4Ji
	2YiTgpDeejRtH+ZDyDXwY8HF4xMdEsAUKc0Rsw6Qb10JaqO7FshEAQTHEyhTGajJ6SlH0j1VYwo
	FhZ477g==
X-Received: from pjod3.prod.google.com ([2002:a17:90a:8d83:b0:3ab:4cf:7b95])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54cd:b0:39d:f08e:e6e7
 with SMTP id 98e67ed59e1d1-3ae57e38d1fmr4354350a91.9.1793290139121; Thu, 29
 Oct 2026 09:08:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:08:58 +0000
In-Reply-To: <CAHCio2hTSuTf4HcJ=+wb=_EQvi2as9QMwfRMG5tUkdCmex=yJg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CAHCio2jc9++n2Qoa0-sNkObZsWOybSwK1X2aBjFirchjRTBZsQ@mail.gmail.com>
 <CAHCio2hpL+Y0iYdGXs5zKA-81+w_9pHs+tZPe2uaYKs8yOCz_w@mail.gmail.com>
 <CAO9r8zMBcU_s3Dpc99jse=n7Njhy8Ly-daf6--YXVD+Cw_ed1w@mail.gmail.com>
 <CAO9r8zOmH6yzcNbUOF3FoNsac8rtx47rp5wByOFfGgaBPaLxug@mail.gmail.com> <CAHCio2hTSuTf4HcJ=+wb=_EQvi2as9QMwfRMG5tUkdCmex=yJg@mail.gmail.com>
Message-ID: <auNvmlmXeWPh_HKT@google.com>
Subject: Re: Some options abort RFC: KVM: SVM: Rework ASID management
From: Sean Christopherson <seanjc@google.com>
To: Jackie Yu <ufo19890607@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, jmattson@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mlevitsk@redhat.com, pbonzini@redhat.com, 
	thomas.lendacky@amd.com, vkuznets@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Please send mails as plain text, otherwise they get ignored by the mailing =
lists
and don't get archived by lore.

On Thu, Oct 29, 2026, Jackie Yu wrote:
> Subject: Re: [PATCH v2 00/29] KVM: nSVM: Optimize nSVM TLB flushes
>=20
> Hi Yosry,
>=20
> Thank you for the quick response. Two clarifications from our side:
>=20
> 1. About the boot failures: no emulation is involved in our
> experiment. Our out-of-tree changes enable direct guest
> INVLPGB/TLBSYNC execution by clearing the KVM intercepts, without any
> software emulation of the instruction. The failures occur with this
> unintercepted passthrough combined with static per-vCPU ASIDs, so they
> are not missing cases in an emulation path. Under the per-vCPU design
> we did not attempt to intercept and emulate INVLPGB at all.
>=20
> 2. We do not use nested virtualization in our deployments. L1 guests
> in our production scenarios run without nested guests. Therefore, the
> ASID-replacement behavior you quoted from the APM does not affect our
> current use case: with one shared ASID per non-nested VM, an
> unintercepted guest INVLPGB would be scoped to that VM's ASID, which
> matches what our per-VM configuration relies on today.
>=20
> Regarding the direction: we understand that with per-vCPU ASIDs,
> correct handling would require intercepting INVLPGB and re-issuing a
> flush for every ASID in use by the VM, which you note is unlikely to
> perform well on large VMs. We also note your point that as long as any
> vCPU uses nested, KVM must intercept INVLPGB anyway because the
> hardware replaces the requested ASID with the current ASID.
>=20
> If we read the situation correctly, the practical options seem to be
> either (a) a per-VM shared ASID mode restricted to non-nested VMs,
> with unintercepted guest INVLPGB, plus mandatory interception whenever
> nested is in use, or (b) always intercepting and virtualizing INVLPGB
> under per-vCPU ASIDs. Either way, direct passthrough would at most
> cover the non-nested case. We would appreciate Sean's and Paolo's
> input on which direction upstream prefers; we are glad to provide more
> details of our configuration or run tests that would help decide
> between these options.
>=20
> Thanks,
>=20
> Jackie
>=20
>=20
> Yosry Ahmed <yosry@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8829=E6=97=
=A5=E5=91=A8=E5=9B=9B 14:08=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > On Wed, Oct 28, 2026 at 1:15=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > On Wed, Oct 28, 2026 at 6:37=E2=80=AFAM Jackie Yu <ufo19890607@gmail.=
com> wrote:
> > > >
> > > > Hi, guys!
> > > >
> > > > Jackie Yu <ufo19890607@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=88=
28=E6=97=A5=E5=91=A8=E4=B8=89 21:36=E5=86=99=E9=81=93=EF=BC=9A
> > > >>
> > > >> Hi Yosry and KVM folks,
> > > >>
> > > >> We would appreciate your guidance on supporting INVLPGB in ordinar=
y
> > (non-SEV)
> > > >> L1 guests alongside the proposed static per-vCPU ASIDs.
> > > >>
> > > >> The 2025 ASID rework RFC proposed one static ASID per L1 VM and li=
sted
> > > >> "enabling INVLPGB virtualization" among its motivations [1]. The J=
une
> > > >> 2026 RFC v2 changed the design from per-VM to per-vCPU ASIDs [2]. =
In
> > > >> the October v2 series, patches 2-11 establish static per-vCPU ASID=
s,
> > > >> while the remaining patches primarily address nested TLB flushes [=
3].
> > > >> Our question is how guest INVLPGB should be supported under the
> > > >> per-vCPU design.
> > > >>
> > > >> Some of our workloads frequently discard and repopulate memory usi=
ng
> > > >> patterns involving madvise() and memset(). Broadcast IPI-based TLB
> > > >> shootdowns are expensive for these workloads, so we are interested=
 in
> > > >> making AMD INVLPGB available to guests. We use a small benchmark t=
o
> > > >> approximate the resulting shared-address-space pressure:
> > > >>
> > > >>     region =3D mmap(256 MiB, MAP_SHARED | MAP_ANONYMOUS);
> > > >>     memset(region, 0xab, 256 MiB);       // Initial population
> > > >>     start N workers, pinned across 64 allowed CPUs;
> > > >>     each worker repeatedly reads pages in its own slice of region;
> > > >>
> > > >>     repeat 500 warmup + 2,000 measured iterations:
> > > >>         start =3D clock_gettime(CLOCK_MONOTONIC);
> > > >>         madvise(region, 256 MiB, MADV_DONTNEED);
> > > >>         record elapsed madvise() time;
> > > >>         write one page in every 64 pages to repopulate part of reg=
ion;
> > > >>
> > > >>     stop and join the workers;
> > > >>
> > > >> The benchmark uses memset() for initial population; subsequent
> > > >> iterations re-touch pages rather than repeatedly calling memset().
> > > >> The numbers below measure the advisor thread's madvise() syscall
> > > >> latency, not worker throughput.
> > > >>
> > > >> In our experimental KVM4 configuration with a VM-shared ASID and o=
ur
> > > >> separate guest INVLPGB passthrough changes, we observed:
> > > >>
> > > >>                          INVLPGB off     INVLPGB on    Difference
> > > >>     64 workers  mean       21.624 ms       12.505 ms     -42.17%
> > > >>                 P99        32.760 ms       21.518 ms     -34.32%
> > > >>     128 workers mean       29.553 ms       20.459 ms     -30.77%
> > > >>                 P99        39.628 ms       28.160 ms     -28.94%
> > > >>
> > > >> These are single, sequential A/B runs for each worker count, with
> > > >> 500 warmup and 2,000 measured calls per run. The process had 64
> > > >> allowed CPUs, so the 128-worker case was oversubscribed. The
> > > >> measurements show a useful latency difference, but do not by
> > > >> themselves establish INVLPGB instruction counts or IPI reductions.
> > > >>
> > > >> We then experimentally combined the October per-vCPU ASID changes =
for
> > > >> ordinary guests with our existing, out-of-tree L1 INVLPGB/TLBSYNC
> > > >> passthrough. With guest INVLPGB enabled, a one-vCPU guest boots, b=
ut
> > > >> otherwise comparable two-vCPU and 64-vCPU guests fail early during
> > > >> boot. Keeping QEMU's +invlpgb setting while adding clearcpuid=3D41=
9
> > > >> to the same guest kernel allows the multi-vCPU guest to boot; the
> > > >> guest logs "Clearing CPUID bits: invlpgb".
> > >
> > > I imagine for INVLPGB to work correctly with per-vCPU ASIDs, you need
> > > to intercept INVLPGB and basically issue an INVLPGB for each ASID use=
d
> > > by this VM (nr_vcpus or 2 * nr_vcpus with nested). I can't imagine
> > > this would perform well on large VMs, not sure if virtualizing INVLPG=
B
> > > would still make sense.
> > >
> > > Regarding the boot failure, I would guess there are some missing case=
s
> > > due to the complexity of emulating INVLPGB without a shared per-VM
> > > ASID.
> > >
> > > >> These controlled boot comparisons identify a problem with combinin=
g
> > > >> static per-vCPU ASIDs and direct guest INVLPGB/TLBSYNC passthrough=
:
> > > >> the multi-vCPU guest fails to boot when it uses INVLPGB, but boots
> > > >> when its INVLPGB CPUID bit is cleared. A one-vCPU guest also boots
> > > >> with INVLPGB enabled.
> > > >>
> > > >> In this configuration, an unintercepted guest INVLPGB targets the
> > > >> invoking vCPU's hardware ASID, while sibling vCPUs have distinct
> > > >> ASIDs.
> > >
> > > It's neat that INVLPGB will automatically use the current ASID and no=
t
> > > ASID=3D0 for guest usage.
> >
> > Hmm, actually, how is this supposed to work with nested
> > virtualization? The APM says:
> >
> >     A guest that executes a legal INVLPGB that is not intercepted will =
have
> >     the requested ASID field replaced by the current ASID and the valid
> >     ASID bit set before doing the broadcast invalidation.
> >
> > If any ASID passed by an L1 guest is replaced by its own ASID, then if
> > L1 is flushing L2's ASID (i.e. a non-zero ASID), passing through
> > INVLPGB would do the wrong thing and flush L1's ASID instead, right?
> >
> > Seems like if the VM is using nested (on any vCPU), KVM must intercept
> > INVLPGB anyway to correctly handle the ASID?
> >
> > The APM also says:
> >
> >     Two forms of INVLPGB intercepts, conditional and unconditional, are
> >     available to the hypervisor. The unconditional intercept traps all
> > guest
> >     usage of INVLPGB. The conditional intercept traps only
> >     illegally-specified INVLPGB instructions.
> >
> > When I read "conditional", I was really hoping it was conditional on
> > the ASID being zero or non-zero, as KVM really only needs to intercept
> > INVLPGB with non-zero ASIDs (assuming the ASID is shared to begin
> > with).
> >
> > Am I missing something?
> >
