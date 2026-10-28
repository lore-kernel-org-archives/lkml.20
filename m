Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183023;
	b=YaY/5pPq9tpdabcZ0ReVRa931hRNfxu8qsUS/F9dy1Kc9fQDHRrFTmXfaFw/Oke1Lkjc
	 3u21siue5c6EmZvwkV2qy/hPaYe+60LRFyLJv4qAO7ecF29N1dCIBmi/s2wUoeksbjYC5
	 vd5STPe3BQUuXiXOM6v+aWcWovSjvjOH6EJClP1Hkp3b47MEjq/qHi4s8Y8hbz2Y8d5Ss
	 JK47qlfEDKV1PFIPSXIq2+2G7FIgUuN7pZ4tZtgZxPs5qqZ5AJDgnUOUiK+n7VZEeLjXo
	 zHbZfzNHq/5Xwuieexi7UjJIhuTjaTuwasRX6jplMzlBI2t6Ptijx5v5gh2VbURPvvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UVdKaUSxo6fv4OI9VN9wGYCZ8m9R9RvwNGh88LHkxos=;
	b=fvQ4wIk6mRgOyejMRR8fC7spsqyNSeQHKTHMeIGjONztqVUhiK3rHAiuSmK/Uy/Yg59r
	 HWl5C6L7fd8e0dX3ZPMGCxKrAFTk8dlbtXILsHyN4Yzid8zAv17foflplhGZZYkkENuHy
	 3DIhAKuPpEJqLLIGC27yka1gER9pFNA2MAO4gPl8tmoTBNoOg+jxH1Y9z/yCd/6OJn43T
	 EZbV96wlD6QlzIIKOv/VoE5cjkppR94V3zIMqNQjtqoY5Dw549vyYLYCaqFfqeZPTQTqA
	 2o5pNd5YquiP2/ERl6CjEq4moSGB4QPYnOiJIBzxb78nMxD/kuLIWsJ5yw9fd9pm6Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=lfv3+9XA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06878606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06878606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=lfv3+9XA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so5968695e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183020; cv=none;
        d=google.com; s=arc-20260327;
        b=h19o0wDAS60XxCCpA0zV6BMSNJ4dFP0pueI4UGCVaGUIE6sT+eVV9w2hhH1srY1Z03
         Zk9xt7oq2XQJGoTO+jpuJysyW+8b7fBh6u0JF6UUbjqbKeWIkPp+BzwWTdyjJDKqd6Vf
         3J2tRn7k/wVeo/zpmfqAs/9JRyeNEPHy6kXTRyURZqa2jeWfjITOwHxRRgNmADtZZ+K3
         pPqUATCbm00Rwgh9pE8ZIaVB0U9XCjRnfvk31mrKz07oOSdQcrG0qoItXiPB0QJtSbG4
         xuTS/ZLABx26lydMbmA7MF8MV3OeJ1+wnB6OJ20o3/HizfASVLXYnXVpOc6JtsMxVZgk
         UsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVdKaUSxo6fv4OI9VN9wGYCZ8m9R9RvwNGh88LHkxos=;
        fh=jXLuWJXgIy8o/b76cjM9iSRZJfyz6q9e2FkLb9A5MEQ=;
        b=WB9UkdgP0qnYX2BUndMp0xk4eopBNKZeiQGb6K5kHMKyNLsxeMEBWkq4KiTJxkMpZA
         KIHY4ZXKiwQyH2KpdiikVoTPMeP6hvqEth34dduYEuXW5S1P6vVpaL1BKBEh/6Jr4cGC
         2D2YZUXI1xQQWS8BKRS0vmQo0OINLqEHfBht4vUuQpNATjBKafId8J1ZKfjgvcId/GIb
         JA/Kk2VnjLF/ki1dMIEokXnMu6/pporCTgfDFEYhoFp6emwCS3Ycaps0u1fNNGrNKHZN
         C9PGSALY/MpZ9BOXy4PPca8WFb2OIvEktocMKJ7UMAN9+2cW9Olg1+Dl7yG/zkBJQVuu
         i8Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793183020; x=1793787820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UVdKaUSxo6fv4OI9VN9wGYCZ8m9R9RvwNGh88LHkxos=;
        b=lfv3+9XAfnl/pJgrTfR1CGJqZm4zrVQg8S0QVUr3VvFJAMaA7OGyCSrh9R7sP6SJ2L
         H2ilHkrGd9sfW3vXnL2Y8obmI66RsJrJa8920u3Bu5hfxfbSX0pbz2oo2r80IRU9HEUs
         uRDE6aLes2r/Zxkg/ysiVc585siILKZoI77BbYP5+QuMNbLbHuD89NdJ8zOj0lDiCZt9
         Wv7Nf1skUOKbIuEn6FJnMZyo1GGGnFJFSreZrSoSXOKn3W9yePCtOuRm6tlXovLgCLFD
         QTukVPTCs2U1VGvDchkL9N+lB2xXu6hSk9v3U2GuaZGJMeaP0EeYCH0zPBAOtVryMNwp
         9iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183020; x=1793787820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVdKaUSxo6fv4OI9VN9wGYCZ8m9R9RvwNGh88LHkxos=;
        b=0l7nuLvNM7Xz0wctS2o1c+01obvm3OYYoda/JXd9NCMZgWJmLAxlgpBRWGt6ToGI4+
         Lu46cqwq1/irSWcexJuUDiSRfTqzLIigjEgzZHm78/NUCAeMmRiHjjK+8CDo/d+JBhwp
         fLq/nDGIGRrEaotkwDeyScumVutyIbT61jHtIYMpBuSAcGHrQvvMr0/L/uoyeytxVyla
         UFkSLF6Phqaz6DCoPqQhlddMe8dMvxXv0ylodSCdvmyVBYnTcY0rt1ErlNtu6X46uB1+
         ZZ+00rqM/2zrSrjfzsGyKK2phlHjjVc8nPUJNb1y7R1wCEHpaYeZqiWxHaEmk9qk5bv+
         n7Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwR7j8nHVlnwoz5qrLzmZWP4fk3yYFUHey1+VUqzQ6LiILpDFLhfHddBlxtVz4KLL35Es7ByV8FH0n+/D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdsQuXINe+24VOgasYb9+6uVFSjbXc63E5eDkobbvPh+FehRgU
	VjzG5JmdfvhPNGK/b8EocR+1SfnehKh+pEBKMuC0iwUrCphJHRAz3Af7f9iRo7i8dGCCqmnNULf
	UCrMj+Rt5/jjKXo04VDM4fl8GW8qFSaA85zrigDDaqw==
X-Gm-Gg: AYBFou3EoI0ZSWPoP+cq54L27kRv9+FttPeQ1gkWTWD13Q3dsBqqCRICGdtlP7FJg8m
	Hg+CrQS2J/FjGU5guXJyL+hL18o8+z+rQ4Cn/xEiGv+3QiL8VapPA1/ozp5LnsCryUribKN87Ym
	tAWvCZU4QTTn4gG/Yc0hB/gXzvlDMLmiDDO0roEmTEQi1cnPCY5mQcGRmjkPAr5SiPxZyVNv83W
	3RO0JwP2Lq6VjYJCfU/BAKSZ7y8xRYZnYEGmXYpEyJ+qpwMKFhBnP25oM2Kfw8UXw8Cckic992v
	0ZKM2lFbAg7/XG88vBoyqPI4BnKaedg0E9nnzYq2OXzDtoyhlki6Acbq7BXlOnQM+u89rWAMD39
	hau/gROdNkEZ52AEi1EaeAtdhO9TflxMFB3E+fR70RohH7qE1nuM61Zq/y3tacWStNoXMw1iPiF
	p7P9Ukpu2KdTK1PUEM4rGLSPJvfOS8skpyPD156v3XjnmEoETThLeOQHM=
X-Received: by 2002:a05:600c:4ec7:b0:4a2:a9:ed5a with SMTP id
 5b1f17b1804b1-4a9660b5041mr40714425e9.8.1793183020177; Wed, 28 Oct 2026
 03:23:40 -0700 (PDT)
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
 <8dfb9c5b-cc02-4340-8f6c-61265f711d5a@bosc.ac.cn> <CAAhSdy3Qthj3va39BqAMK5GCSqXp6Kz15mb=q2cs4Uj-ZOZ-bA@mail.gmail.com>
 <8416a1c8-07dd-4b49-8da0-5bf09105d05b@lanxincomputing.com>
In-Reply-To: <8416a1c8-07dd-4b49-8da0-5bf09105d05b@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 15:53:27 +0530
X-Gm-Features: AclHuK9NUPKyktEdzVHs8m5fu7DDXqwtZY6jcNLH5psdY8jV9mtZxxoUYfS5C1w
Message-ID: <CAAhSdy39DpXCSDf5iEzc6_4HDb1fdJGVn4U-wBjdt5wGAvUwsw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Flush VS-stage TLB before reusing a host CPU
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: guoyaxing <guoyaxing@bosc.ac.cn>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	majiuyue@bosc.ac.cn, anzoso@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:46=E2=80=AFPM BillXiang
<xiangwencheng@lanxincomputing.com> wrote:
>
> On 10/28/2026 2:14 PM, Anup Patel wrote:
> > On Mon, Oct 26, 2026 at 3:49=E2=80=AFPM guoyaxing <guoyaxing@bosc.ac.cn=
> wrote:
> >>
> >>
> >>
> >> =E5=9C=A8 2026/10/24 23:49, Anup Patel =E5=86=99=E9=81=93:
> >>> On Sat, Oct 10, 2026 at 2:36=E2=80=AFPM guoyaxing <guoyaxing@bosc.ac.=
cn> wrote:
> >>>>
> >>>>
> >>>>
> >>>> =E5=9C=A8 2026/10/10 15:50, Anup Patel =E5=86=99=E9=81=93:
> >>>>> On Sat, Oct 10, 2026 at 4:12=E2=80=AFAM guoyaxing <guoyaxing@bosc.a=
c.cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> =E5=9C=A8 2026/10/10 02:51, Anup Patel =E5=86=99=E9=81=93:
> >>>>>>> On Mon, Aug 17, 2026 at 12:25=E2=80=AFPM Yaxing Guo <guoyaxing@bo=
sc.ac.cn> wrote:
> >>>>>>>>
> >>>>>>>> Guest Linux uses mm_cpumask to decide whether an sfence.vma need=
s to be
> >>>>>>>> local or remote. Under KVM that mask tracks guest CPUs, not the =
host CPUs
> >>>>>>>> that previously backed a vCPU.
> >>>>>>>>
> >>>>>>>> This can miss stale VS-stage TLB entries when a vCPU migrates ac=
ross host
> >>>>>>>> CPUs. For example:
> >>>>>>>>
> >>>>>>>>       - vcpu0 runs on host CPU1 and fills a VS-stage TLB entry.
> >>>>>>>>       - vcpu0 migrates to host CPU0.
> >>>>>>>>       - the guest updates the mapping on vcpu0 and issues a loca=
l sfence.vma.
> >>>>>>>>       - later, the guest task runs on vcpu1 while vcpu1 is backe=
d by host CPU1.
> >>>>>>>
> >>>>>>> When the vcpu0 is brought back to host CPU1, the kvm_riscv_local_=
tlb_sanitize()
> >>>>>>> will ensure TLB entries associated with Guest/VM are nuked.
> >>>>>>>
> >>>>>>> By default, kvm_riscv_local_hfence_gvma_vmid_all() will only do H=
FENCE.GVMA
> >>>>>>> for the associated VMID because most RISC-V H-extension implemena=
tion will
> >>>>>>> tag VS-stage TLB entries with VMID and HFENCE.GVMA must remove bo=
th
> >>>>>>> G-stage and VS-stage TLB entries for given VMID.
> >>>>>>>
> >>>>>>> If your HW does not tag VS-stage TLB enteries with VMID then it b=
uggy
> >>>>>>> / inefficient
> >>>>>>> so you have to set kvm_riscv_vsstage_tlb_no_gpa in
> >>>>>>> kvm_riscv_setup_vendor_features()
> >>>>>>> as work-around.
> >>>>>>>
> >>>>>>> NACK to this patch from myside.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Anup
> >>>>>>>
> >>>>>> Hi Anup,
> >>>>>>       Thanks for the review and clarification.
> >>>>>>
> >>>>>>       Regarding =E2=80=9CWhen the vcpu0 is brought back to host CP=
U1=E2=80=9D: the failure
> >>>>>> we hit is not caused by vcpu0 being brought back onto host CPU1. I=
n our
> >>>>>> case, after vcpu0 has already migrated away, neither vCPU migrates
> >>>>>> again. The guest process is later scheduled inside the multi-vCPU =
guest
> >>>>>> onto vcpu1, which is still running on host CPU1. So the stale TLB =
is
> >>>>>> re-hit without any further KVM vCPU migration, and
> >>>>>> kvm_riscv_local_tlb_sanitize() is not involved on that path.
> >>>>>>
> >>>>>>       My commit message was a bit too terse on this point. The con=
crete
> >>>>>> sequence we observed was described earlier in the RFC discussion:
> >>>>>>
> >>>>>>
> >>>>>> https://lore.kernel.org/kvm/0d15b098-b8f7-4080-9f33-e8c49c2331e1@b=
osc.ac.cn/
> >>>>>>
> >>>>>>       In short, the issue is: because vcpu0 migrated away, cpu1 st=
ill has
> >>>>>> stale TLB entries while cpu0 has the new mapping. After that, neit=
her
> >>>>>> vcpu migrated again, but the process was scheduled from vcpu0 to v=
cpu1
> >>>>>> (which is on cpu1), causing it to hit the stale TLB. Consider the
> >>>>>> following scenario:
> >>>>>>
> >>>>>>       1. vcpu0 and vcpu1 are both running on cpu1. At this point, =
vcpu0 is
> >>>>>> on cpu1, and a process on it reads a page, which gets cached in th=
e TLB
> >>>>>> (let's call this the "stale TLB entry").
> >>>>>>
> >>>>>>       2. vcpu0 migrates to cpu0, and then the process (on vcpu0, n=
ow on
> >>>>>> cpu0) does a CoW (copy-on-write) and establishes a new mapping.
> >>>>>>
> >>>>>>       3. Neither vcpu0 nor vcpu1 migrates again. At this point, th=
e process
> >>>>>> gets scheduled inside the VM onto vcpu1 (which is on cpu1), reads =
the
> >>>>>> same page, and hits the stale TLB entry.
> >>>>>
> >>>>> This cannot happen because in step#2 when mapping was updated the
> >>>>> Guest OS will do TLB flush for all its VCPUs which means vcpu1 on c=
pu0
> >>>>> will also receive TLB flush and the stale TLB will be removed. This=
 means
> >>>>> when process is moved back to vcpu1 on cpu0, HW will fetch updated
> >>>>> PTE and new TLB entry will be populated.
> >>>>>
> >>>>
> >>>> Hi Anup,
> >>>>
> >>>> Thanks for the follow-up. I may be missing something, so I wanted to
> >>>> double-check this against the guest TLB shootdown path.
> >>>>
> >>>> If I follow the Linux guest CoW path correctly, when the mapping is
> >>>> updated in step#2 it goes through:
> >>>>
> >>>>      wp_page_copy()
> >>>>        -> ptep_clear_flush()
> >>>>          -> flush_tlb_page()
> >>>>            -> __flush_tlb_range(mm, mm_cpumask(mm), ...)
> >>>>
> >>>> So the remote SFENCE.VMA appears to be targeted only at CPUs in
> >>>> mm_cpumask(mm), rather than at all VCPUs of the guest. mm_cpumask is
> >>>> updated in switch_mm()/set_mm() for guest CPUs that have actually ru=
n
> >>>> that mm.
> >>>>
> >>>> In our case, before the CoW the process had only ever run on vcpu0. =
From
> >>>> the guest's point of view it did not migrate: the host migration of
> >>>> vcpu0 from cpu1 to cpu0 is not visible to guest Linux, which only se=
es
> >>>> vCPUs. So at CoW time mm_cpumask still contains only vcpu0 (or at le=
ast
> >>>> does not contain vcpu1), and __flush_tlb_range() would not IPI vcpu1=
.
> >>>> The local SFENCE on vcpu0 would only cover host cpu0, where vcpu0 is
> >>>> currently running. The stale VS-stage TLB entry left on host cpu1 fr=
om
> >>>> when vcpu0 previously ran there would then remain.
> >>>>
> >>>> Later, still without any further vCPU migration, the process is
> >>>> scheduled inside the guest onto vcpu1, which remains on host cpu1, a=
nd
> >>>> can hit that stale entry.
> >>>>
> >>>> This also seems more likely when the ASID allocator is enabled, beca=
use
> >>>> set_mm_asid() does not always local_flush_tlb_all() on switch_mm(). =
So
> >>>> even the first time the process lands on vcpu1, a stale ASID-tagged
> >>>> entry on host cpu1 may still be present.
> >>>>
> >>>> In other words, I am not sure this case is covered by a full guest T=
LB
> >>>> flush to all VCPUs on the mapping update. Guest shootdown looks
> >>>> mm_cpumask-based, and host pCPU migration of a vCPU does not by itse=
lf
> >>>> add other vCPUs that never ran the mm into that mask.
> >>>
> >>> This makes sense now considering ASID allocator in Guest Linux is glo=
bal
> >>> and not local. In any case, KVM RISC-V must not assume that the Guest=
 OS
> >>> has local ASID allocator hence the kvm_riscv_local_tlb_sanitize() mus=
t also
> >>> santize TLB for other VCPUs of the same Guest which can potentially r=
un
> >>> on the previous host CPU where current VCPU ran.
> >>>
> >>> Having said the above, there are multiple issues with the current pat=
ch:
> >>> 1) The kvm_riscv_local_hfence_gvma_vmid_all() is sufficient for most
> >>> implementations to sanitize both G-stage and VS-stage TLB entries
> >>> because both G-stage and VS-stage TLB entries are generally tagged
> >>> with VMID. The kvm_riscv_vsstage_tlb_no_gpa work-around is for
> >>> implmentations which do not tag VS-stage TLB entries with VMID
> >>> and this patch remove this work-around.
> >>> 2) The other VCPUs on the previous host CPU may be already running
> >>> and may still hit stale TLB entry before kvm_riscv_local_tlb_sanitize=
()
> >>> gets a chance to sanitize TLB on previous host CPU.
> >>> 3) The per-CPU pointer in struct kvm_arch is racy because we
> >>> may have two VCPUs on same host CPU which are migrated to
> >>> other host CPUs. Instead, it is much simpler to have an atomic
> >>> cpumask in each VCPU where any part of KVM can mark a host
> >>> CPU in the cpumask of the VCPU to force TLB sanitization whenever
> >>> the VCPU runs on that particular host CPU.
> >>>
> >>> How about the following change ?
> >>>
> >>> diff --git a/arch/riscv/include/asm/kvm_host.h
> >>> b/arch/riscv/include/asm/kvm_host.h
> >>> index a30600579231..c975eee7240c 100644
> >>> --- a/arch/riscv/include/asm/kvm_host.h
> >>> +++ b/arch/riscv/include/asm/kvm_host.h
> >>> @@ -9,6 +9,7 @@
> >>>    #ifndef __RISCV_KVM_HOST_H__
> >>>    #define __RISCV_KVM_HOST_H__
> >>>
> >>> +#include <linux/cpumask.h>
> >>>    #include <linux/types.h>
> >>>    #include <linux/kvm.h>
> >>>    #include <linux/kvm_types.h>
> >>> @@ -184,6 +185,9 @@ struct kvm_vcpu_arch {
> >>>        /* ISA feature bits (similar to MISA) */
> >>>        DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> >>>
> >>> +    /* Sanitize TLB host CPU mask */
> >>> +    cpumask_t tlb_sanitize_mask;
> >>> +
> >>>        /* Vendor, Arch, and Implementation details */
> >>>        unsigned long mvendorid;
> >>>        unsigned long marchid;
> >>> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> >>> index 2ae34632cdcb..b1387a00c8b0 100644
> >>> --- a/arch/riscv/kvm/tlb.c
> >>> +++ b/arch/riscv/kvm/tlb.c
> >>> @@ -207,11 +207,31 @@ void kvm_riscv_local_hfence_vvma_all(unsigned l=
ong vmid)
> >>>
> >>>    void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> >>>    {
> >>> -    unsigned long vmid;
> >>> +    struct kvm_vcpu *tvcpu;
> >>> +    unsigned long i, vmid;
> >>>
> >>> -    if (!kvm_riscv_gstage_vmid_bits() ||
> >>> -        vcpu->arch.last_exit_cpu =3D=3D vcpu->cpu)
> >>> -        return;
> >>> +    if (!cpumask_test_cpu(vcpu->cpu, &vcpu->arch.tlb_sanitize_mask))=
 {
> >>> +        if (!kvm_riscv_gstage_vmid_bits() ||
> >>> +            vcpu->arch.last_exit_cpu =3D=3D vcpu->cpu)
> >>> +            return;
> >>> +    }
> >>> +
> >>> +    /*
> >>> +     * The VCPU might have left stale TLBs on the previous host CPU =
so
> >>> +     * mark previous host CPU in the tlb_sanitize_mask of other VCPU=
s.
> >>> +     */
> >>> +    if (vcpu->arch.last_exit_cpu > -1 && vcpu->arch.last_exit_cpu !=
=3D
> >>> vcpu->cpu) {
> >>> +        kvm_for_each_vcpu(i, tvcpu, vcpu->kvm) {
> >>> +            if (tvcpu =3D=3D vcpu)
> >>> +                continue;
> >>> +            cpumask_set_cpu(vcpu->arch.last_exit_cpu,
> >>> +                    &tvcpu->arch.tlb_sanitize_mask);
>
> Hi Anup,
>
> Thanks for the detailed analysis and for proposing the direction. I=E2=80=
=99d
> like to suggest a small refinement on top of your diff: add
>
> if (READ_ONCE(tvcpu->cpu) =3D=3D vcpu->arch.last_exit_cpu)
>
> here so that we only kick the vCPUs that are currently running on the
> previous host CPU, while still setting tlb_sanitize_mask for all other
> vCPUs. Would that be OK?

I am okay with this refinement but please add a comment about
this check.

Regards,
Anup
