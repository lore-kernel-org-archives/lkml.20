Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793168094;
	b=th0wwUjSfG6dpvdDRiQPWWC0VzjraWLPxMTXM3Fi7VlPenXWtWZQL2Ml8BISkUSTSj4X
	 Ei2Ls12TtQfDimX7TKoThXhM9AXPPR5lxGulg9qIBtHPrInWAor1iQuGy/ZPaDWO6vz6W
	 qvCe187u5rqq43cwNX9ccbfQqvhehLibHswKiU81jwiBZ+T8eK09TU/Njsje2nGXGNurl
	 2NoXR6FH4dcz2KmFp9eTCueb3+LdhnHsiku1wCsOUlUD6BjebX+SML2ne6qtPVknJ9Vsb
	 Rhif96HLXAU/u+QOwWtDYin63RNwNtfvT0vrTLNnLSm9w8WnMbQ4v7V6C1T6UD8zCYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RpEkHIqZvFWx+elGJR4nCS2qOS6JG40/XuUxXPK9HjI=;
	b=CA7AmRGvC3/VYohdH0HseuGnp9uG2IMVWMmCFAhO2fOGHJFR2cIVcb3Fnfhnsnf5F5UQ
	 t8/fW76wNfwSdIyfNI/vOEDfoTCAF2zZuu5IdjnoZueGNK22niIEf6FY0WByQNg/N5FP/
	 ngfDDz6eW/oOMDsyqy7hldFtV5IoGFRe4QIB3m+FsaA4QI30rAaXIXizZF7FWaXhJWD09
	 RusK80tFNA5EPP/oVbiNAP2f5khsXjdRDMVd5FuHS6D94iF7FeAb/piRNpdwVNrY68dxA
	 JLEaL/pRgVLB97smMPY8fXhZvtExtl+UYZOl6NCnoUDV6BLC11/gGCqSCznw/N55gtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=dUgirNjx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30319606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30319606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=dUgirNjx
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so4938125e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793168092; cv=none;
        d=google.com; s=arc-20260327;
        b=E0WQ5SnmmrP6D2UHqIvRFe/VShVjS7OKog+GH5kG5Tu446jYz5gfSkSHdMoMlVqAxT
         aJtbH46bJrBY/PU/rXe51ZOxnPuHNKge9M927DZecr2rUZSwVK3LvR4ySOTfzDqg5TDx
         lxp6RVo9P9iJS4B4yXkhSGzM8pQvxsZt50m6PwrbILckU4R6BtaHraaDGhNiPRHwkekd
         eGMYWjm/wem8eu02bFT06nDjvSfR2SjM7Ck1ShmEZFyNX0KUpWUTxvoxpT2TwvMh5Fme
         5tdawgTtB6jL3icuu3LMClQXfTuwevsNOM58T1X1n0yuKJ//Hsb1V2g2EnQgcv28RW/6
         OgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpEkHIqZvFWx+elGJR4nCS2qOS6JG40/XuUxXPK9HjI=;
        fh=38Ky+3g2nruOpEVySNZ9hFjh9FecmITMkQ7mP2DWvrw=;
        b=qkaa/Ir99Ub1NjGkgUcyOGepIcn4juqtZwYS+XlRr/oQ8RcGA11g1GbyHD2EeAw0dJ
         gECy0GMzd6hIW5Oc2PzDjkl8cApGCjEdZ1HpCb/sjtUyPIWCpFDi8GpRwPP8TurQS2jX
         VRWHEJCeHWoBTXonUSI0CiDJc6iXf4aT2DPDONl8m6OHMyeVnXvQ7yAyS9ZjaoXyf+nJ
         GjUK2gSPWQrHto3qBKpegt+UX2YpfLM0w2unKaCdbpcAEoI9f32EJX++cWkzz1GXvUxf
         RA+U89i7Mly3hJbdOTr4k1qVw8SLs8JGkR2odVHPy844zZHdwTmhfSrO/8yEmJn1LUsx
         I6NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793168092; x=1793772892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpEkHIqZvFWx+elGJR4nCS2qOS6JG40/XuUxXPK9HjI=;
        b=dUgirNjxgEIQlt+pRPw93cXsA810Cyi7EGP8ksEWmg1FXvN1swilrYzWwM04Io6/f/
         w5XKyp9HZHi7IPKzJhoDTKsFIAVgxnUBP56lqPZ+E+CosY31qWa+w2yatvURIPRSkjXf
         AVXamE69hrKAKyZLvHR2/9o8+QIm9DhL8xw8taJwHEooN6gUohn5XQ++iFL6zwmuGtQ+
         lffD9dzGJFyoBmsIzy/2cRVITkh3U0IXO0U0Qyo/OiUfyLqVamfpk1IM/Smmh/gNkN0d
         6QKeWXWNjh3pV4noQmWYi2OllntIgor7lBqu11sd0d5wMjZlYnwHkxu542KEBSn87Rjx
         hiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168092; x=1793772892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpEkHIqZvFWx+elGJR4nCS2qOS6JG40/XuUxXPK9HjI=;
        b=oMX77KaYa/Ip8Od8aw9NjCaN+NQPSicCjfmd2qL3N5t/GaMaNOBxbmvJBf4OH1qr7p
         V24kjIBc86Qqytt5PZKGPy7g7abqkAGzvCy8x4JlN5PykonkhH8MOVwADRBDXHYSg/zc
         os4JTMKW96B5aiC2l79jpISLuUY/fJLfv7J2h3xSppGAVZawhXhNVRg8nYL5of0AhxQ/
         7QMm4Kh3USGq/FyGb5IXZe1faXmWS2utgla6s66c+XyQopbXze21mh/q4dF/qvLRwrPG
         Rug4RRbH68CJpmBUNSAwKPNKvEaV/4mKDnDLXebAYUMA6TXxk8cYCzs0OcmPVkk4x+wD
         6cGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVY0zNc+KHOFdWS9zogxCT81bLTI+wihRIEm1J5dxisGEq4Qcrsuymkp5graxGgy4n5AxLl8Dl6nCmWAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUTk33YNB/mjzjp8y9B6N46CmAD01s/rvbDHZsvOnHUd10XLNX
	B35/M7fvQYNjxxLoKaNR60tZzp3mhcYjCbfRPZeI3WuvADENhDbesdgKuQ+VtQqugQPM5/mM0pm
	qBVMRQDk2LlcajHbOEC7ariRtmOHIZuR5TAyvzaspAQ==
X-Gm-Gg: AYBFou0BX0RtjKj6mYibceEDFNtLiP599FsBG+Ybo4Hk1HInHYt1OzVDZl4SG5nC012
	ignqNBxIqzgZdPLGITxteu3n7NZBVIiCBPVjKVUrtjw8NraQEOpWIisqGxH42j9gq9ychkWTnp3
	tGsbJ7IH4oB2inSWQXuDflxbeIOMxAUJeyMjJRp+Yx8HJzYZPm0CLmcJExqZMqMBN/t/K6oLC6n
	Qa3oPdR9wsM1lVrINHPt8MOPyaHKbOajQvidqa5kBsuALSxuRzdX8+RKENA60ipjGw8UKw5uwa0
	PhAxdOHuXDRzupZN5Vqq4bEjbAn6sDh6GGMq7Xof90Ghn8N6xpoeFdkb5hMV61De/t6zLXo/j44
	nAopX2eFRQl8m79oN9bBlSdXWt7tbpAGOWLJSyxGTgEN+tKQiestllKtEqyKHntVJFtQxT/Jdyd
	5/3Bt9YVlP8t7CBrym/Nkua8rMnKceSUnEuF7r4d/CbSrcmS3VqMRh17w=
X-Received: by 2002:a05:600c:3b24:b0:4a3:5a98:c279 with SMTP id
 5b1f17b1804b1-4a966c41c8dmr22109035e9.8.1793168092310; Tue, 27 Oct 2026
 23:14:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260817102447.40259-1-guoyaxing@bosc.ac.cn> <CAAhSdy2qwdHE7SB2gRK3_PQ6m_bMSfWpvcuSG-31W2yd3-UTKg@mail.gmail.com>
 <285419e5-c4fc-4c75-a765-436165bdc8b9@bosc.ac.cn> <CAAhSdy1Q7a+54qn0xNBQBd1eV2ve+Nzqz9uRsWrGSmTn35z8=A@mail.gmail.com>
 <c050c85c-482a-4351-b627-ac074f7f7952@bosc.ac.cn> <CAAhSdy3XDEGfFJJnHfx2Q0w+dG4FombF3Lj5O_V4wBpkyAYTNg@mail.gmail.com>
 <8dfb9c5b-cc02-4340-8f6c-61265f711d5a@bosc.ac.cn>
In-Reply-To: <8dfb9c5b-cc02-4340-8f6c-61265f711d5a@bosc.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 11:44:40 +0530
X-Gm-Features: AclHuK8hQ5V7ATMF1H2qSx4l_DNtfMwaNrXX6RpZzbmYTwM8sl9t3qn4qaJQljk
Message-ID: <CAAhSdy3Qthj3va39BqAMK5GCSqXp6Kz15mb=q2cs4Uj-ZOZ-bA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Flush VS-stage TLB before reusing a host CPU
To: guoyaxing <guoyaxing@bosc.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	majiuyue@bosc.ac.cn, anzoso@outlook.com, xiangwencheng@lanxincomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:49=E2=80=AFPM guoyaxing <guoyaxing@bosc.ac.cn> wr=
ote:
>
>
>
> =E5=9C=A8 2026/10/24 23:49, Anup Patel =E5=86=99=E9=81=93:
> > On Sat, Oct 10, 2026 at 2:36=E2=80=AFPM guoyaxing <guoyaxing@bosc.ac.cn=
> wrote:
> >>
> >>
> >>
> >> =E5=9C=A8 2026/10/10 15:50, Anup Patel =E5=86=99=E9=81=93:
> >>> On Sat, Oct 10, 2026 at 4:12=E2=80=AFAM guoyaxing <guoyaxing@bosc.ac.=
cn> wrote:
> >>>>
> >>>>
> >>>>
> >>>> =E5=9C=A8 2026/10/10 02:51, Anup Patel =E5=86=99=E9=81=93:
> >>>>> On Mon, Aug 17, 2026 at 12:25=E2=80=AFPM Yaxing Guo <guoyaxing@bosc=
.ac.cn> wrote:
> >>>>>>
> >>>>>> Guest Linux uses mm_cpumask to decide whether an sfence.vma needs =
to be
> >>>>>> local or remote. Under KVM that mask tracks guest CPUs, not the ho=
st CPUs
> >>>>>> that previously backed a vCPU.
> >>>>>>
> >>>>>> This can miss stale VS-stage TLB entries when a vCPU migrates acro=
ss host
> >>>>>> CPUs. For example:
> >>>>>>
> >>>>>>      - vcpu0 runs on host CPU1 and fills a VS-stage TLB entry.
> >>>>>>      - vcpu0 migrates to host CPU0.
> >>>>>>      - the guest updates the mapping on vcpu0 and issues a local s=
fence.vma.
> >>>>>>      - later, the guest task runs on vcpu1 while vcpu1 is backed b=
y host CPU1.
> >>>>>
> >>>>> When the vcpu0 is brought back to host CPU1, the kvm_riscv_local_tl=
b_sanitize()
> >>>>> will ensure TLB entries associated with Guest/VM are nuked.
> >>>>>
> >>>>> By default, kvm_riscv_local_hfence_gvma_vmid_all() will only do HFE=
NCE.GVMA
> >>>>> for the associated VMID because most RISC-V H-extension implemenati=
on will
> >>>>> tag VS-stage TLB entries with VMID and HFENCE.GVMA must remove both
> >>>>> G-stage and VS-stage TLB entries for given VMID.
> >>>>>
> >>>>> If your HW does not tag VS-stage TLB enteries with VMID then it bug=
gy
> >>>>> / inefficient
> >>>>> so you have to set kvm_riscv_vsstage_tlb_no_gpa in
> >>>>> kvm_riscv_setup_vendor_features()
> >>>>> as work-around.
> >>>>>
> >>>>> NACK to this patch from myside.
> >>>>>
> >>>>> Regards,
> >>>>> Anup
> >>>>>
> >>>> Hi Anup,
> >>>>      Thanks for the review and clarification.
> >>>>
> >>>>      Regarding =E2=80=9CWhen the vcpu0 is brought back to host CPU1=
=E2=80=9D: the failure
> >>>> we hit is not caused by vcpu0 being brought back onto host CPU1. In =
our
> >>>> case, after vcpu0 has already migrated away, neither vCPU migrates
> >>>> again. The guest process is later scheduled inside the multi-vCPU gu=
est
> >>>> onto vcpu1, which is still running on host CPU1. So the stale TLB is
> >>>> re-hit without any further KVM vCPU migration, and
> >>>> kvm_riscv_local_tlb_sanitize() is not involved on that path.
> >>>>
> >>>>      My commit message was a bit too terse on this point. The concre=
te
> >>>> sequence we observed was described earlier in the RFC discussion:
> >>>>
> >>>>
> >>>> https://lore.kernel.org/kvm/0d15b098-b8f7-4080-9f33-e8c49c2331e1@bos=
c.ac.cn/
> >>>>
> >>>>      In short, the issue is: because vcpu0 migrated away, cpu1 still=
 has
> >>>> stale TLB entries while cpu0 has the new mapping. After that, neithe=
r
> >>>> vcpu migrated again, but the process was scheduled from vcpu0 to vcp=
u1
> >>>> (which is on cpu1), causing it to hit the stale TLB. Consider the
> >>>> following scenario:
> >>>>
> >>>>      1. vcpu0 and vcpu1 are both running on cpu1. At this point, vcp=
u0 is
> >>>> on cpu1, and a process on it reads a page, which gets cached in the =
TLB
> >>>> (let's call this the "stale TLB entry").
> >>>>
> >>>>      2. vcpu0 migrates to cpu0, and then the process (on vcpu0, now =
on
> >>>> cpu0) does a CoW (copy-on-write) and establishes a new mapping.
> >>>>
> >>>>      3. Neither vcpu0 nor vcpu1 migrates again. At this point, the p=
rocess
> >>>> gets scheduled inside the VM onto vcpu1 (which is on cpu1), reads th=
e
> >>>> same page, and hits the stale TLB entry.
> >>>
> >>> This cannot happen because in step#2 when mapping was updated the
> >>> Guest OS will do TLB flush for all its VCPUs which means vcpu1 on cpu=
0
> >>> will also receive TLB flush and the stale TLB will be removed. This m=
eans
> >>> when process is moved back to vcpu1 on cpu0, HW will fetch updated
> >>> PTE and new TLB entry will be populated.
> >>>
> >>
> >> Hi Anup,
> >>
> >> Thanks for the follow-up. I may be missing something, so I wanted to
> >> double-check this against the guest TLB shootdown path.
> >>
> >> If I follow the Linux guest CoW path correctly, when the mapping is
> >> updated in step#2 it goes through:
> >>
> >>     wp_page_copy()
> >>       -> ptep_clear_flush()
> >>         -> flush_tlb_page()
> >>           -> __flush_tlb_range(mm, mm_cpumask(mm), ...)
> >>
> >> So the remote SFENCE.VMA appears to be targeted only at CPUs in
> >> mm_cpumask(mm), rather than at all VCPUs of the guest. mm_cpumask is
> >> updated in switch_mm()/set_mm() for guest CPUs that have actually run
> >> that mm.
> >>
> >> In our case, before the CoW the process had only ever run on vcpu0. Fr=
om
> >> the guest's point of view it did not migrate: the host migration of
> >> vcpu0 from cpu1 to cpu0 is not visible to guest Linux, which only sees
> >> vCPUs. So at CoW time mm_cpumask still contains only vcpu0 (or at leas=
t
> >> does not contain vcpu1), and __flush_tlb_range() would not IPI vcpu1.
> >> The local SFENCE on vcpu0 would only cover host cpu0, where vcpu0 is
> >> currently running. The stale VS-stage TLB entry left on host cpu1 from
> >> when vcpu0 previously ran there would then remain.
> >>
> >> Later, still without any further vCPU migration, the process is
> >> scheduled inside the guest onto vcpu1, which remains on host cpu1, and
> >> can hit that stale entry.
> >>
> >> This also seems more likely when the ASID allocator is enabled, becaus=
e
> >> set_mm_asid() does not always local_flush_tlb_all() on switch_mm(). So
> >> even the first time the process lands on vcpu1, a stale ASID-tagged
> >> entry on host cpu1 may still be present.
> >>
> >> In other words, I am not sure this case is covered by a full guest TLB
> >> flush to all VCPUs on the mapping update. Guest shootdown looks
> >> mm_cpumask-based, and host pCPU migration of a vCPU does not by itself
> >> add other vCPUs that never ran the mm into that mask.
> >
> > This makes sense now considering ASID allocator in Guest Linux is globa=
l
> > and not local. In any case, KVM RISC-V must not assume that the Guest O=
S
> > has local ASID allocator hence the kvm_riscv_local_tlb_sanitize() must =
also
> > santize TLB for other VCPUs of the same Guest which can potentially run
> > on the previous host CPU where current VCPU ran.
> >
> > Having said the above, there are multiple issues with the current patch=
:
> > 1) The kvm_riscv_local_hfence_gvma_vmid_all() is sufficient for most
> > implementations to sanitize both G-stage and VS-stage TLB entries
> > because both G-stage and VS-stage TLB entries are generally tagged
> > with VMID. The kvm_riscv_vsstage_tlb_no_gpa work-around is for
> > implmentations which do not tag VS-stage TLB entries with VMID
> > and this patch remove this work-around.
> > 2) The other VCPUs on the previous host CPU may be already running
> > and may still hit stale TLB entry before kvm_riscv_local_tlb_sanitize()
> > gets a chance to sanitize TLB on previous host CPU.
> > 3) The per-CPU pointer in struct kvm_arch is racy because we
> > may have two VCPUs on same host CPU which are migrated to
> > other host CPUs. Instead, it is much simpler to have an atomic
> > cpumask in each VCPU where any part of KVM can mark a host
> > CPU in the cpumask of the VCPU to force TLB sanitization whenever
> > the VCPU runs on that particular host CPU.
> >
> > How about the following change ?
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h
> > b/arch/riscv/include/asm/kvm_host.h
> > index a30600579231..c975eee7240c 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -9,6 +9,7 @@
> >   #ifndef __RISCV_KVM_HOST_H__
> >   #define __RISCV_KVM_HOST_H__
> >
> > +#include <linux/cpumask.h>
> >   #include <linux/types.h>
> >   #include <linux/kvm.h>
> >   #include <linux/kvm_types.h>
> > @@ -184,6 +185,9 @@ struct kvm_vcpu_arch {
> >       /* ISA feature bits (similar to MISA) */
> >       DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> >
> > +    /* Sanitize TLB host CPU mask */
> > +    cpumask_t tlb_sanitize_mask;
> > +
> >       /* Vendor, Arch, and Implementation details */
> >       unsigned long mvendorid;
> >       unsigned long marchid;
> > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > index 2ae34632cdcb..b1387a00c8b0 100644
> > --- a/arch/riscv/kvm/tlb.c
> > +++ b/arch/riscv/kvm/tlb.c
> > @@ -207,11 +207,31 @@ void kvm_riscv_local_hfence_vvma_all(unsigned lon=
g vmid)
> >
> >   void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> >   {
> > -    unsigned long vmid;
> > +    struct kvm_vcpu *tvcpu;
> > +    unsigned long i, vmid;
> >
> > -    if (!kvm_riscv_gstage_vmid_bits() ||
> > -        vcpu->arch.last_exit_cpu =3D=3D vcpu->cpu)
> > -        return;
> > +    if (!cpumask_test_cpu(vcpu->cpu, &vcpu->arch.tlb_sanitize_mask)) {
> > +        if (!kvm_riscv_gstage_vmid_bits() ||
> > +            vcpu->arch.last_exit_cpu =3D=3D vcpu->cpu)
> > +            return;
> > +    }
> > +
> > +    /*
> > +     * The VCPU might have left stale TLBs on the previous host CPU so
> > +     * mark previous host CPU in the tlb_sanitize_mask of other VCPUs.
> > +     */
> > +    if (vcpu->arch.last_exit_cpu > -1 && vcpu->arch.last_exit_cpu !=3D
> > vcpu->cpu) {
> > +        kvm_for_each_vcpu(i, tvcpu, vcpu->kvm) {
> > +            if (tvcpu =3D=3D vcpu)
> > +                continue;
> > +            cpumask_set_cpu(vcpu->arch.last_exit_cpu,
> > +                    &tvcpu->arch.tlb_sanitize_mask);
> > +            kvm_vcpu_kick(tvcpu);
> > +        }
> > +    }
> > +
> > +    /* Clear current host CPU from the tlb_sanitize_mask */
> > +    cpumask_clear_cpu(vcpu->cpu, &vcpu->arch.tlb_sanitize_mask);
> >
> >       /*
> >        * On RISC-V platforms with hardware VMID support, we share same
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index dd786f758eb7..c00dc0b191dc 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -107,6 +107,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu
> > *vcpu, bool kvm_sbi_reset)
> >
> >       vcpu->arch.last_exit_cpu =3D -1;
> >
> > +    cpumask_clear(&vcpu->arch.tlb_sanitize_mask);
> > +
> >       kvm_riscv_vcpu_context_reset(vcpu, kvm_sbi_reset);
> >
> >       kvm_riscv_vcpu_fp_reset(vcpu);
> >
> > Regards,
> > Anup
>
> Hi Anup,
>
> Thanks for the explanation and for suggesting the per-vCPU sanitization
> mask. Building on your proposal, I would like to suggest two changes:
>
> 1. Separate the invalidation strategy for vCPU migration and a mask hit.
>
>     Keep HFENCE.GVMA for vCPU migration, identified by
>     last_exit_cpu !=3D vcpu->cpu, when hardware VMIDs are available. Use
>     HFENCE.VVMA when the current host CPU is marked in tlb_sanitize_mask.
>     A mask hit caused by another vCPU of the same VM running on this CPU
>     requires VS-stage sanitization; it does not by itself require G-stage
>     invalidation.
>
>     For example, if vCPU0 and vCPU1 both last ran on CPU0, switching from
>     vCPU1 back to vCPU0 only needs the mask-triggered VVMA. This avoids
>     requesting G-stage invalidation when the shared G-stage mappings have
>     not changed. If both migration and a mask hit occur, both fences run.

HFENCE.GVMA is sufficient for most implementations so to sanitize all TLB
entries matching a particular VMID.

Refer, the following text from RISC-V Privileged specification section "5.3=
.2.
Hypervisor Memory-Management Fence Instructions":

  Conceptually, an implementation might contain two
address-translation caches: one that
  maps guest virtual addresses to guest physical addresses, and
another that maps guest
  physical addresses to supervisor physical addresses. HFENCE.GVMA
need not flush the
  former cache, but it must flush entries from the latter cache that
match the HFENCE.GVMA=E2=80=99s
  address and VMID arguments.

  More commonly, implementations contain address-translation caches
that map guest virtual
  addresses directly to supervisor physical addresses, removing a
level of indirection. For such
  implementations, any entry whose guest virtual address maps to a
guest physical address that
  matches the HFENCE.GVMA=E2=80=99s address and VMID arguments must be
flushed. Selectively
  flushing entries in this fashion requires tagging them with the
guest physical address, which is
  costly, and so a common technique is to flush all entries that match
the HFENCE.GVMA=E2=80=99s
  VMID argument, regardless of the address argument.

Doing HFENCE.GVMA in certain cases and HFENCE.VVMA other cases is
maintainence burden without much benefits. Also, VCPU migrating from one
host CPU to another is an infrequent event so no point over optimizing with=
out
much benefits.

In short, NACK to your suggestion #1.

>
> 2. Move mask updates to kvm_arch_vcpu_put().
>
>     Mark the outgoing host CPU in the masks of the other vCPUs of the
>     same VM when a vCPU is put. This also covers a switch between vCPUs
>     on one host CPU without either vCPU migrating. Marking only when
>     migration is detected in kvm_riscv_local_tlb_sanitize() would miss
>     that case.
>
>     The marking now happens on the outgoing CPU before another vCPU can
>     enter guest mode there. The migration-time marking and kicks are
>     therefore removed. The trade-off is an O(nr_vcpus) walk on each
>     qualifying put().
>
>     How about the following change ?
>
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 2ac3c0a20fce..ae8a40b3429c 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -160,32 +160,15 @@
>
>   void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
>   {
> -       struct kvm_vcpu *tvcpu;
> -       unsigned long i, vmid;
> -
> -       if (!cpumask_test_cpu(vcpu->cpu, &vcpu->arch.tlb_sanitize_mask)) =
{
> -               if (!kvm_riscv_gstage_vmid_bits() ||
> -                   vcpu->arch.last_exit_cpu =3D=3D vcpu->cpu)
> -                       return;
> -       }
> -
> -       /*
> -        * The VCPU might have left stale TLBs on the previous host CPU s=
o
> -        * mark previous host CPU in the tlb_sanitize_mask of other VCPUs=
.
> -        */
> -       if (vcpu->arch.last_exit_cpu > -1 &&
> -           vcpu->arch.last_exit_cpu !=3D vcpu->cpu) {
> -               kvm_for_each_vcpu(i, tvcpu, vcpu->kvm) {
> -                       if (tvcpu =3D=3D vcpu)
> -                               continue;
> -                       cpumask_set_cpu(vcpu->arch.last_exit_cpu,
> -                                       &tvcpu->arch.tlb_sanitize_mask);
> -                       kvm_vcpu_kick(tvcpu);
> -               }
> -       }
> -
> -       /* Clear current host CPU from the tlb_sanitize_mask */
> -       cpumask_clear_cpu(vcpu->cpu, &vcpu->arch.tlb_sanitize_mask);
> +       unsigned long vmid;
> +       bool vcpu_migrated, sanitize_vsstage;
> +
> +       vcpu_migrated =3D vcpu->arch.last_exit_cpu !=3D vcpu->cpu;
> +       sanitize_vsstage =3D cpumask_test_and_clear_cpu(vcpu->cpu,
> +                                               &vcpu->arch.tlb_sanitize_=
mask);
> +       if (!sanitize_vsstage &&
> +           (!kvm_riscv_gstage_vmid_bits() || !vcpu_migrated))
> +               return;
>
>         /*
>          * On RISC-V platforms with hardware VMID support, we share same
> @@ -199,13 +182,16 @@
>          */
>
>         vmid =3D READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> -       kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> +       if (vcpu_migrated && kvm_riscv_gstage_vmid_bits())
> +               kvm_riscv_local_hfence_gvma_vmid_all(vmid);
>
>         /*
> -        * Flush VS-stage TLB entries for implementation where VS-stage
> -        * TLB does not cahce guest physical address and VMID.
> +        * Flush VS-stage entries marked when another VCPU left this CPU,=
 or when
> +        * required by the split-TLB vendor workaround on this VCPU's mig=
ration.
>          */
> -       if (static_branch_unlikely(&kvm_riscv_vsstage_tlb_no_gpa))
> +           if (sanitize_vsstage ||
> +               (vcpu_migrated &&
> +               static_branch_unlikely(&kvm_riscv_vsstage_tlb_no_gpa)))
>                     kvm_riscv_local_hfence_vvma_all(vmid);
>   }
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f2e52f3b0786..6209c66b24e1 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -644,8 +644,18 @@
>
>   void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   {
> +       struct kvm_vcpu *tvcpu;
> +       unsigned long i;
> +       int cpu =3D vcpu->cpu;
>         void *nsh;
>         struct kvm_vcpu_csr *csr =3D &vcpu->arch.guest_csr;
> +
> +       if (cpu >=3D 0 && vcpu->arch.last_exit_cpu =3D=3D cpu) {
> +               kvm_for_each_vcpu(i, tvcpu, vcpu->kvm) {
> +                       if (tvcpu !=3D vcpu)
> +                               cpumask_set_cpu(cpu, &tvcpu->arch.tlb_san=
itize_mask);
> +               }
> +       }
>
>         vcpu->cpu =3D -1;
>
>     Would these changes make sense to you, or is there anythingI might
> be overlooking?

The kvm_arch_vcpu_put() is called every time a VCPU exits to
user space for MMIO emulation and handling other exits. Now,
imagine VCPU0 and VCPU1 running on same host CPU where
VCPU0 is doing lot of MMIO exits causing VCPU1 to sanitize
TLB frequently on the same host CPU.

Based on above, NACK to your suggestion #2

Regards,
Anup
