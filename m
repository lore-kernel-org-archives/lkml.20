Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793618457;
	b=vLKJNlZ/4Rnbpcsno0fa53W1L/hateao9FIzxZRRH/hKMckgMdkJrckTbDMMDkthGinR
	 ie5WEJJqHF6ZhjgIBN6pwYRoiwCHPZA1nVXgAZCOiDy7HB35ku0G57JPNjNc2ymPjjba2
	 8gyJQBF0ut3dSef4ykmqNKWU6afkYoNcsgs3v+CAYceeUx3b1hO19K/I8GEHRixJD//M/
	 asEeHtgMUt6UN9moPfKTF/xH1vQSSNubGPQ7EWfR6amvQ7gcK+USiciD3zja4McqIO5Wp
	 asMTWin76yz9V7ksK+wP48HR4Wm1KbJHjUgwJ7HArFu1h/4imsAKWrBHZqz4Guwq/1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=606lkFpezYKYJdK+zrK/Eu7/dLW3DvaWcJV8piNdwZg=;
	b=brza0PTvBEzVZc/wsAVFxtls8JnuzgF9yRxaPXDEic7MxwXk1WaE/VBivnD9EUnLOtSQ
	 MBfBE2f32xhaGA68ihCb/lILge9Ad3hvKBHHMUIhq6uO00vj8dUolH/Mn0+LP8F37E5Mq
	 X+B79RKR1gWuCPG6EotpMOX+A5yUBMZWh4c/URZ7lCQX0I4fv7Od1VKDqfCGJl+PnfeiX
	 YPJ7liiHah/PsH6fyWXstQsJJ9HjG0cfmYC+JtX76T3dQyQ2KxM7UYj9Ahntt+5AXgb5f
	 xK5Wjih2Z7l0ibuq7H/i8SU0KQpZh28EYQh38sNO2LklkEwe7dSzFX7UlFlBKjCyS/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cz8kvan9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B4606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6B4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cz8kvan9
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3875798a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:20:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793618456; cv=none;
        d=google.com; s=arc-20260327;
        b=aN7FFomcHIecFk+YKtMNw+uTVap+O7wYseZxbUpo+bzwRwotARwyxrfyi+Ok2syoJg
         LuBV3dBJB2fq6wOtrnYrYNP54ax34YIdwVfDc0ejpOgN9ut3l9IPAAYpv5uTjeVWWFtq
         KK4Na0K0ivnACPM7U9sF/nm2e3OZAkM4+AcCcOXO80/eOvV0dDxSlLDbFBumOcOBGyXG
         o3azV/DW0fs2yQAhFr2CCy+2+fhfiXTFKaHniMv2P6tguKexn4ML0oRAc7zgUYOEOmnE
         Og35i/RNRgPDo+Bn2XA+85jE+FqSV0qem51ZPY2k/c92fugcofY9dj/NSpvVuzUbEE3G
         8MMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=606lkFpezYKYJdK+zrK/Eu7/dLW3DvaWcJV8piNdwZg=;
        fh=UMNivoygy50qWdoIfHNvHNzTzd24MdOkyEoX9LSs9Zs=;
        b=omv64LMxKqQecA9VcD/InJb4SgOG2nLbj5RNb5oJNGUkN6qlPOn09ph9FhiRWzducI
         Simf6EFznjPrYI1JLsdXYmivR1L221yI2sKtmOk8Wqn7bddelbDFzYRBAowJrASyF2/z
         WAUI44WNsHC1q30P7vKf9Of/+S+YfFr/xEzy65DLO9EqIds5jXL9nAyK/X4S2pwn7S9N
         6Ts7BOVQJdZijYpgS500VnA92soK+BDII5rqUU+OvMjxDpHiSB0uk/07eOWvzSJuR5GS
         45T/cDfzLCtd6Wf3tOme3syvo6AuhBAKkfHW8xW1TFzC0wCG+ooRiYb/v4+g6X/O1QlH
         IODg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618456; x=1794223256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=606lkFpezYKYJdK+zrK/Eu7/dLW3DvaWcJV8piNdwZg=;
        b=Cz8kvan9U7ghHmfRmsbOeJpVu5wzp5B/h08oQ14OfR4KbP21dIs7vuolbU22MO04IS
         S3kvGSujcyQRwEQaUpX7zC/gNpfqynK9yOUymmrv4wriSn6nshxGSd9/mrDY6yjupicd
         s5krV55vS4JyoDGFiiv7Bh8RCXGXVKCe39BBOdSafGJHGnALhJwBX+AB+eIPeOBJFl/J
         Pkm/kPz2x1JYWTPKKcvUi3kr9eeK7rNzy+ZtUEvs4BzJp1JuXBvLioWtAgNgTCB0S+tO
         fOJPIQVgXcksBrjMKcU9+b7G58rEYWvNjuOEQT+NyGg/FtCnYe2piFSecvzj1r799aC0
         u5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618456; x=1794223256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=606lkFpezYKYJdK+zrK/Eu7/dLW3DvaWcJV8piNdwZg=;
        b=SnDZ7WXD1Jn2cYx/U0UZEuxQE9yU8KjaPFGiZoa/2KsexUBbpL0UQQzFx2gdWzGDnK
         zIxMbVKM2OYr68gv6fCl11Ah7UeATFsI/W5wVRmrAEilRTrRMPuFFAg5tE4OJizAbLEw
         qsTxERC560vDCVGL1YS9NrTGXi43L2tcSy8CQfDxNFk5gznr90wIn63+F8Zi63FHFAQx
         vYxn0/dbK+qvKmxpJ6YMkLEizfOAOt0Wwxf7aa0B4UTAb75kuOtCJnUUkaxc3ENzd8pp
         z+M1njv/9VzY0UdtxKHa/qea1HuFRFYaHs8O3GAMoUNybxnXLBgmzm9WlZUAULwT7xYN
         5RkA==
X-Forwarded-Encrypted: i=1; AKwUvBwqpljLxs7oWn0YhLUoaVC7Ors6lQoU/2HgoYPtRcrkcfmAi4coIC6CzSxtQZp6lEiVV0EjugtAtiTevjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnUArYDxj91vFjaojuBZvyaO3mRiOhviR9ztVScGwpyEkIbk4f
	203ljCMGYaQ86Rhz4HdailCTl61jW7NtY7vjbmCnIH2JxCZW6SRRYLM7NH01MhJntBtXlCVOhGf
	cCGiNaqPo7pqBHwKmDAFNmRMhS/5rrTs=
X-Gm-Gg: AYBFou1436g8QEDTSKEX8J23t89KZEiQk66fA8H98ZB/BPhHPdn7JMmgcuy3cViK9r2
	m0YE3rHK10wCo2ViVBjNpm4MKvgK4uqL2TiLyFtlcDvubgwODVqIp+XHKnaWplhAb3PqAJr0EyV
	aFkKqmNMUQaJ05owWCTAhYf/hkAOpCtOb9I++/o354XArNdRbSJl0Oi+lyLmzjfYEUHp0EHlDf6
	EvSOmEmskZfSEl1+QF4aLdYwh613Q9kYiHsjTYybZ7P9Ix5YA7e3Pd9VPFHuosLfXIsVCemOlUl
	jxpdumU1V0PbQ6BXNsV9ltToy4hz2/bstA+X56pi7qpWTO7mRb3EFmQmRZ8z+QoIH22vy6en+EU
	uQzEzt5lNh22xwZMar69HvXl42eO8WQlNDTl4rw==
X-Received: by 2002:a17:906:eec8:b0:c41:4964:90b6 with SMTP id
 a640c23a62f3a-c4ca7ab11b3mr826426566b.36.1793618455509; Mon, 02 Nov 2026
 03:20:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHCio2jc9++n2Qoa0-sNkObZsWOybSwK1X2aBjFirchjRTBZsQ@mail.gmail.com>
 <CAHCio2hpL+Y0iYdGXs5zKA-81+w_9pHs+tZPe2uaYKs8yOCz_w@mail.gmail.com>
 <CAO9r8zMBcU_s3Dpc99jse=n7Njhy8Ly-daf6--YXVD+Cw_ed1w@mail.gmail.com>
 <CAO9r8zOmH6yzcNbUOF3FoNsac8rtx47rp5wByOFfGgaBPaLxug@mail.gmail.com>
 <CAHCio2hTSuTf4HcJ=+wb=_EQvi2as9QMwfRMG5tUkdCmex=yJg@mail.gmail.com> <auNvmlmXeWPh_HKT@google.com>
In-Reply-To: <auNvmlmXeWPh_HKT@google.com>
From: Jackie Yu <ufo19890607@gmail.com>
Date: Mon, 2 Nov 2026 19:20:44 +0800
X-Gm-Features: AclHuK_Vt_8677gatmhuZp3hBbCkC_mRm_NI_r0ysp6uGX788AWs5GAwddQIgy4
Message-ID: <CAHCio2gdqdyGcGHN+dN9hzoj_0-XSKYFS4ruFrLU+DMG-4XooQ@mail.gmail.com>
Subject: Re: Some options abort RFC: KVM: SVM: Rework ASID management
To: Sean Christopherson <seanjc@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, jmattson@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mlevitsk@redhat.com, pbonzini@redhat.com, 
	thomas.lendacky@amd.com, vkuznets@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean, Yosry, and KVM folks,

Sean, thank you for the reminder. Sorry about the earlier formatting.
We will use plain text for future mailing-list replies.

Yosry, thanks for clarifying. We understand that by "missing
emulation" you meant the INVLPGB handling needed with distinct
per-vCPU ASIDs, not a bug in an existing emulation path in our tree.

We agree that intercepting each guest INVLPGB and issuing a separate
invalidation for every ASID in a large VM may undermine the benefit
we are seeking. Using per-VM ASIDs consistently, rather than
switching ASID allocation models based on nested usage, sounds like
a promising direction. Our production guests do not run nested VMs,
so direct execution before nested use would cover our use case.

Your suggestion to change the INVLPGB interception policy when
nested virtualization is first used is helpful. If EFER.SVME can be
set before a guest runs a nested VM, the first VMRUN seems like a
more precise trigger. Would KVM catch that VMRUN before entering L2
and enable the necessary intercepts across the VM before any vCPU
can execute an INVLPGB requiring nested handling? Could those
intercepts then remain enabled for the VM's lifetime, rather than
switching back when the guest leaves nested mode? We realize that
interception would still require correct nested instruction handling.

For context, our experimental KVM4 configuration used a VM-shared
ASID and separate, out-of-tree guest INVLPGB passthrough. The
madvise() latency measurements were:

  Workers             INVLPGB off      INVLPGB on
  64 mean              21.624 ms        12.505 ms
  64 P99               32.760 ms        21.518 ms
  128 mean             29.553 ms        20.459 ms
  128 P99              39.628 ms        28.160 ms

These were single sequential A/B runs with 64 allowed CPUs; the
128-worker run was oversubscribed. The results measure madvise()
syscall latency, not IPI counts, and do not quantify any additional
flushes from vCPU switches on a physical CPU under per-VM ASIDs.

We can share the benchmark source and run further comparisons to
help evaluate that trade-off. Would the maintainers consider
consistent per-VM ASIDs, with direct guest INVLPGB execution before
nested use and interception once nested use begins, a direction
worth pursuing?

Best regards,


Sean Christopherson <seanjc@google.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=94 00:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Please send mails as plain text, otherwise they get ignored by the mailin=
g lists
> and don't get archived by lore.
>
> On Thu, Oct 29, 2026, Jackie Yu wrote:
> > Subject: Re: [PATCH v2 00/29] KVM: nSVM: Optimize nSVM TLB flushes
> >
> > Hi Yosry,
> >
> > Thank you for the quick response. Two clarifications from our side:
> >
> > 1. About the boot failures: no emulation is involved in our
> > experiment. Our out-of-tree changes enable direct guest
> > INVLPGB/TLBSYNC execution by clearing the KVM intercepts, without any
> > software emulation of the instruction. The failures occur with this
> > unintercepted passthrough combined with static per-vCPU ASIDs, so they
> > are not missing cases in an emulation path. Under the per-vCPU design
> > we did not attempt to intercept and emulate INVLPGB at all.
> >
> > 2. We do not use nested virtualization in our deployments. L1 guests
> > in our production scenarios run without nested guests. Therefore, the
> > ASID-replacement behavior you quoted from the APM does not affect our
> > current use case: with one shared ASID per non-nested VM, an
> > unintercepted guest INVLPGB would be scoped to that VM's ASID, which
> > matches what our per-VM configuration relies on today.
> >
> > Regarding the direction: we understand that with per-vCPU ASIDs,
> > correct handling would require intercepting INVLPGB and re-issuing a
> > flush for every ASID in use by the VM, which you note is unlikely to
> > perform well on large VMs. We also note your point that as long as any
> > vCPU uses nested, KVM must intercept INVLPGB anyway because the
> > hardware replaces the requested ASID with the current ASID.
> >
> > If we read the situation correctly, the practical options seem to be
> > either (a) a per-VM shared ASID mode restricted to non-nested VMs,
> > with unintercepted guest INVLPGB, plus mandatory interception whenever
> > nested is in use, or (b) always intercepting and virtualizing INVLPGB
> > under per-vCPU ASIDs. Either way, direct passthrough would at most
> > cover the non-nested case. We would appreciate Sean's and Paolo's
> > input on which direction upstream prefers; we are glad to provide more
> > details of our configuration or run tests that would help decide
> > between these options.
> >
> > Thanks,
> >
> > Jackie
> >
> >
> > Yosry Ahmed <yosry@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8829=E6=
=97=A5=E5=91=A8=E5=9B=9B 14:08=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > On Wed, Oct 28, 2026 at 1:15=E2=80=AFPM Yosry Ahmed <yosry@kernel.org=
> wrote:
> > > >
> > > > On Wed, Oct 28, 2026 at 6:37=E2=80=AFAM Jackie Yu <ufo19890607@gmai=
l.com> wrote:
> > > > >
> > > > > Hi, guys!
> > > > >
> > > > > Jackie Yu <ufo19890607@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=
=8828=E6=97=A5=E5=91=A8=E4=B8=89 21:36=E5=86=99=E9=81=93=EF=BC=9A
> > > > >>
> > > > >> Hi Yosry and KVM folks,
> > > > >>
> > > > >> We would appreciate your guidance on supporting INVLPGB in ordin=
ary
> > > (non-SEV)
> > > > >> L1 guests alongside the proposed static per-vCPU ASIDs.
> > > > >>
> > > > >> The 2025 ASID rework RFC proposed one static ASID per L1 VM and =
listed
> > > > >> "enabling INVLPGB virtualization" among its motivations [1]. The=
 June
> > > > >> 2026 RFC v2 changed the design from per-VM to per-vCPU ASIDs [2]=
. In
> > > > >> the October v2 series, patches 2-11 establish static per-vCPU AS=
IDs,
> > > > >> while the remaining patches primarily address nested TLB flushes=
 [3].
> > > > >> Our question is how guest INVLPGB should be supported under the
> > > > >> per-vCPU design.
> > > > >>
> > > > >> Some of our workloads frequently discard and repopulate memory u=
sing
> > > > >> patterns involving madvise() and memset(). Broadcast IPI-based T=
LB
> > > > >> shootdowns are expensive for these workloads, so we are interest=
ed in
> > > > >> making AMD INVLPGB available to guests. We use a small benchmark=
 to
> > > > >> approximate the resulting shared-address-space pressure:
> > > > >>
> > > > >>     region =3D mmap(256 MiB, MAP_SHARED | MAP_ANONYMOUS);
> > > > >>     memset(region, 0xab, 256 MiB);       // Initial population
> > > > >>     start N workers, pinned across 64 allowed CPUs;
> > > > >>     each worker repeatedly reads pages in its own slice of regio=
n;
> > > > >>
> > > > >>     repeat 500 warmup + 2,000 measured iterations:
> > > > >>         start =3D clock_gettime(CLOCK_MONOTONIC);
> > > > >>         madvise(region, 256 MiB, MADV_DONTNEED);
> > > > >>         record elapsed madvise() time;
> > > > >>         write one page in every 64 pages to repopulate part of r=
egion;
> > > > >>
> > > > >>     stop and join the workers;
> > > > >>
> > > > >> The benchmark uses memset() for initial population; subsequent
> > > > >> iterations re-touch pages rather than repeatedly calling memset(=
).
> > > > >> The numbers below measure the advisor thread's madvise() syscall
> > > > >> latency, not worker throughput.
> > > > >>
> > > > >> In our experimental KVM4 configuration with a VM-shared ASID and=
 our
> > > > >> separate guest INVLPGB passthrough changes, we observed:
> > > > >>
> > > > >>                          INVLPGB off     INVLPGB on    Differenc=
e
> > > > >>     64 workers  mean       21.624 ms       12.505 ms     -42.17%
> > > > >>                 P99        32.760 ms       21.518 ms     -34.32%
> > > > >>     128 workers mean       29.553 ms       20.459 ms     -30.77%
> > > > >>                 P99        39.628 ms       28.160 ms     -28.94%
> > > > >>
> > > > >> These are single, sequential A/B runs for each worker count, wit=
h
> > > > >> 500 warmup and 2,000 measured calls per run. The process had 64
> > > > >> allowed CPUs, so the 128-worker case was oversubscribed. The
> > > > >> measurements show a useful latency difference, but do not by
> > > > >> themselves establish INVLPGB instruction counts or IPI reduction=
s.
> > > > >>
> > > > >> We then experimentally combined the October per-vCPU ASID change=
s for
> > > > >> ordinary guests with our existing, out-of-tree L1 INVLPGB/TLBSYN=
C
> > > > >> passthrough. With guest INVLPGB enabled, a one-vCPU guest boots,=
 but
> > > > >> otherwise comparable two-vCPU and 64-vCPU guests fail early duri=
ng
> > > > >> boot. Keeping QEMU's +invlpgb setting while adding clearcpuid=3D=
419
> > > > >> to the same guest kernel allows the multi-vCPU guest to boot; th=
e
> > > > >> guest logs "Clearing CPUID bits: invlpgb".
> > > >
> > > > I imagine for INVLPGB to work correctly with per-vCPU ASIDs, you ne=
ed
> > > > to intercept INVLPGB and basically issue an INVLPGB for each ASID u=
sed
> > > > by this VM (nr_vcpus or 2 * nr_vcpus with nested). I can't imagine
> > > > this would perform well on large VMs, not sure if virtualizing INVL=
PGB
> > > > would still make sense.
> > > >
> > > > Regarding the boot failure, I would guess there are some missing ca=
ses
> > > > due to the complexity of emulating INVLPGB without a shared per-VM
> > > > ASID.
> > > >
> > > > >> These controlled boot comparisons identify a problem with combin=
ing
> > > > >> static per-vCPU ASIDs and direct guest INVLPGB/TLBSYNC passthrou=
gh:
> > > > >> the multi-vCPU guest fails to boot when it uses INVLPGB, but boo=
ts
> > > > >> when its INVLPGB CPUID bit is cleared. A one-vCPU guest also boo=
ts
> > > > >> with INVLPGB enabled.
> > > > >>
> > > > >> In this configuration, an unintercepted guest INVLPGB targets th=
e
> > > > >> invoking vCPU's hardware ASID, while sibling vCPUs have distinct
> > > > >> ASIDs.
> > > >
> > > > It's neat that INVLPGB will automatically use the current ASID and =
not
> > > > ASID=3D0 for guest usage.
> > >
> > > Hmm, actually, how is this supposed to work with nested
> > > virtualization? The APM says:
> > >
> > >     A guest that executes a legal INVLPGB that is not intercepted wil=
l have
> > >     the requested ASID field replaced by the current ASID and the val=
id
> > >     ASID bit set before doing the broadcast invalidation.
> > >
> > > If any ASID passed by an L1 guest is replaced by its own ASID, then i=
f
> > > L1 is flushing L2's ASID (i.e. a non-zero ASID), passing through
> > > INVLPGB would do the wrong thing and flush L1's ASID instead, right?
> > >
> > > Seems like if the VM is using nested (on any vCPU), KVM must intercep=
t
> > > INVLPGB anyway to correctly handle the ASID?
> > >
> > > The APM also says:
> > >
> > >     Two forms of INVLPGB intercepts, conditional and unconditional, a=
re
> > >     available to the hypervisor. The unconditional intercept traps al=
l
> > > guest
> > >     usage of INVLPGB. The conditional intercept traps only
> > >     illegally-specified INVLPGB instructions.
> > >
> > > When I read "conditional", I was really hoping it was conditional on
> > > the ASID being zero or non-zero, as KVM really only needs to intercep=
t
> > > INVLPGB with non-zero ASIDs (assuming the ASID is shared to begin
> > > with).
> > >
> > > Am I missing something?
> > >
