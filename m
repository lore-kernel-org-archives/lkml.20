Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF333B6D9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791618619; cv=pass; b=ImVYLIaxG7aJKLUfbh3yRkd+K5cL6iLbBRoQbX3gWH2j/q5xW7gq16ux1W17H/Hw5j4bBhek+sUuWoq8Y47GUm2eII1t3COa8bHJoWOqzzn8Wt4OG3bicpNG0pM/9XXnyCXVg8a8PbS55BAOMlxhDo5ElVl6/c2GAmn5lKwPkYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791618619; c=relaxed/simple;
	bh=IaTY/7ZkiDeWzJcZ3a6UgNrt/MiqzywgDYcZggjuMGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4HtGvEpTZyralrRYdXMehHkJnaRMJw/K9T97mHQSQASJLvlepEI9U/EN9iWtztq+LKRBaR0/w7jRK4qNQ4LUcNa+N7QFmlgDYt2FWIGSxOfUgpjy+gVm1MS/FwcDlmmIKkwswHf2PQP6t324R189uegSQ+4q7Zm4GzuyzolE+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=Sx4x1bNK; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="Sx4x1bNK"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a7858d3a20so4032161fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791618616; cv=none;
        d=google.com; s=arc-20260327;
        b=b/OIoyulo2sS0iTshOAqVpH9fhaloAwmvAWYjPvGPm8keawkAelGwKV0JGMv8dmnjT
         F+tLRJgt80q72HNpyo0hpVgXzLHNa0dJumtg4vJjrtNcRbY5aAbFmOEMOkFEAbnvBso4
         ASMsOKMI0rZPnZyYZ+1EmT7gTTC0I7WMrdwIyCooulytQ7cqA6KqGqVEMdjwxjzdtq81
         8XKZLEvFaptO03NvMaFX9gCrf7hT08Fl+wjj2LrYo+9DabG8jHSGk9T2zVzx/vg/XIsd
         yfJLkSOsFoJsuY7ernGNdfXN5tFN8gdpQ1nz/t9Inv2ZNsh5L6LVW+BUJgaabUe1X31o
         UiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y197klwh/9i8cfiINT6dPdPIVDdwcFwt/BkojcUZ7so=;
        fh=lVqTlD6k2SeEqcCuDSeQTTX0xRQ1e8p8SoDksjtRW4c=;
        b=NHi9b2NN710BEGf5CqdG4Zl8iAG0omO82fhfDgBHHFw2sfGkPHgRpQpEBeEKkArPDR
         0Bg6he5UZ+W0dgaCJfuy7xqny0iCPwVmFozeYp1X7s3qA86kIlWQjkp59mRDE0mM1fbP
         N5pT9fPlLTRuKCCXfCvdrz5kuyiCUikBdinZkHCDBzDRNWvdATJeG9l2S3iuIs1UOTXi
         EX51F7h0QP8q25TwwpB+a/9dK5K8mj69iKxCzU5gxA67lD6pDI1SbBtmxGy5epknwAr6
         lv2odZIMfAtsQczBQaYZOHIkU8r8S03kof4kxXQAtF+IqnWPK+CUavN5H79iMD65Mrql
         AJYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791618616; x=1792223416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y197klwh/9i8cfiINT6dPdPIVDdwcFwt/BkojcUZ7so=;
        b=Sx4x1bNK0CS3B8ue64cgJ2afEPs9WLCnqHz+6TnisLG4ZwxNhqT0RUTj4vL/RbVPGf
         WUdPz9Oe9Xk/WdWuETCftGECM0u4K8o7zkIad6Xf3Vq7kwrZ21zNWPJY69wG94m48pnr
         dkoQ7S2W/KlLsyi6bKug47HpWUo/f8Z6j1muMrVIXyfjUUBciquUbCeLubvmLezZsRSi
         YykbKtD5jaIFS5YjPcMF4dCkD6oykYjHFsDNHn80VutZVEG7dbtOrXW9l1c6XSRBSbtT
         irBwSeXESZisFmEE8vOsaae451hX+o5JY1d8FfAV6C7xeLlnyZwbDoZE8xyHG+NZqbbA
         Nenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618616; x=1792223416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y197klwh/9i8cfiINT6dPdPIVDdwcFwt/BkojcUZ7so=;
        b=yCSDDtin5q3CtLfxgYZuJZs+IECBeGX18FiKNmHGSA6yRFIAHh8HqILdkAHglmA5cR
         u4DgWq4RsOaB15h5lSmBV7f5mNYQV4aQNRZgMaDgsmL6/J0SaEwFaqFrFpqBzKcBqW/a
         JFqEJq0g1/76rwG3SXIVU6CdhzqhZPQpqhMRnoaLjA9zikHpobi8BOT2bnpOofJiJ975
         CH6WYIS6GldjB9KW7M/PAlXTArW441s0h+syKasXnHSPB6b8BcC34y5oB0xYizsZdCT7
         5SGr8o16X2vP8qQJaipf2mGkx7e1uGmwvqtuf4hRuMbYlzRBr5ovsQUZFiHighIsaHuM
         JrCw==
X-Forwarded-Encrypted: i=1; AKwUvBz69FxrXrqZFfea/lNDMMVDHvGqMI0x9t+BvU77bGxfdW5ixykviPpqe1EgVfT8GWh3nlK4B+u3sKKtR5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXhdpFtg7+hr7Vb8qNVzZAjaKBuy5mI/JE6XlB6UZMPbdZcwwY
	jaNyfyLJ1qck6ueRghN6g+9QhFurZ1HrBqU4CbYlrGVr2170MpfiUgANL0JTLyjJ3zg95Eteffr
	8RryqirHQGLbEU1GIE32IQD2HW/pkSLqvi7dZ1I39eg==
X-Gm-Gg: AYBFou3dtG/6Rm5IcDifuzsTZo9Dac/49Z2bhxdloShMb6BpsrQy0FYzjki/NclXO81
	Ei+aOTUY7XM/9y0SzKREPP0AJKN2zePLiDMaWT/9J2MrwD/TdrRyXR/LTMXF8S2z9vSnlfaYZ2B
	rkWh9m62cjSM4Fxz08+42q9Z8btI5MEhfsRZBzvcr6Ea5Dbu+bX0ONmzv7d7QzyHz8hns2lyqjS
	cgxoCp61ZeH7QOY/AO36MQcsXpic7h/d220gzFFrqpKowMSdPo/uTerKAOzR58oVUfu6OyvY6Vw
	PGdHURC057/KoecLBuOVCDIItu2Vv2wTmPY5urvvnImXeWYYiAgn+0BQn0X1PrckQcgnoOzVSBS
	DHo4k/vAD/Jl/MrpEpof00Ohc2ZbZCGonyoP4tSGL9S/dkLig5TOJqry1t0F3VslFnBbh9BTPAw
	==
X-Received: by 2002:a05:651c:41c7:b0:3a9:a064:4f75 with SMTP id
 38308e7fff4ca-3a9c539ad19mr9134471fa.21.1791618615276; Sat, 10 Oct 2026
 00:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817102447.40259-1-guoyaxing@bosc.ac.cn> <CAAhSdy2qwdHE7SB2gRK3_PQ6m_bMSfWpvcuSG-31W2yd3-UTKg@mail.gmail.com>
 <285419e5-c4fc-4c75-a765-436165bdc8b9@bosc.ac.cn>
In-Reply-To: <285419e5-c4fc-4c75-a765-436165bdc8b9@bosc.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Oct 2026 09:50:00 +0200
X-Gm-Features: AclHuK_TvNc4iLbwjBY-wIHttRn_rbarvz1VtZFwLaCv-bTimyeeImVtpOwoSgw
Message-ID: <CAAhSdy1Q7a+54qn0xNBQBd1eV2ve+Nzqz9uRsWrGSmTn35z8=A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Flush VS-stage TLB before reusing a host CPU
To: guoyaxing <guoyaxing@bosc.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	majiuyue@bosc.ac.cn, anzoso@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:12=E2=80=AFAM guoyaxing <guoyaxing@bosc.ac.cn> wr=
ote:
>
>
>
> =E5=9C=A8 2026/10/10 02:51, Anup Patel =E5=86=99=E9=81=93:
> > On Mon, Aug 17, 2026 at 12:25=E2=80=AFPM Yaxing Guo <guoyaxing@bosc.ac.=
cn> wrote:
> >>
> >> Guest Linux uses mm_cpumask to decide whether an sfence.vma needs to b=
e
> >> local or remote. Under KVM that mask tracks guest CPUs, not the host C=
PUs
> >> that previously backed a vCPU.
> >>
> >> This can miss stale VS-stage TLB entries when a vCPU migrates across h=
ost
> >> CPUs. For example:
> >>
> >>    - vcpu0 runs on host CPU1 and fills a VS-stage TLB entry.
> >>    - vcpu0 migrates to host CPU0.
> >>    - the guest updates the mapping on vcpu0 and issues a local sfence.=
vma.
> >>    - later, the guest task runs on vcpu1 while vcpu1 is backed by host=
 CPU1.
> >
> > When the vcpu0 is brought back to host CPU1, the kvm_riscv_local_tlb_sa=
nitize()
> > will ensure TLB entries associated with Guest/VM are nuked.
> >
> > By default, kvm_riscv_local_hfence_gvma_vmid_all() will only do HFENCE.=
GVMA
> > for the associated VMID because most RISC-V H-extension implemenation w=
ill
> > tag VS-stage TLB entries with VMID and HFENCE.GVMA must remove both
> > G-stage and VS-stage TLB entries for given VMID.
> >
> > If your HW does not tag VS-stage TLB enteries with VMID then it buggy
> > / inefficient
> > so you have to set kvm_riscv_vsstage_tlb_no_gpa in
> > kvm_riscv_setup_vendor_features()
> > as work-around.
> >
> > NACK to this patch from myside.
> >
> > Regards,
> > Anup
> >
> Hi Anup,
>    Thanks for the review and clarification.
>
>    Regarding =E2=80=9CWhen the vcpu0 is brought back to host CPU1=E2=80=
=9D: the failure
> we hit is not caused by vcpu0 being brought back onto host CPU1. In our
> case, after vcpu0 has already migrated away, neither vCPU migrates
> again. The guest process is later scheduled inside the multi-vCPU guest
> onto vcpu1, which is still running on host CPU1. So the stale TLB is
> re-hit without any further KVM vCPU migration, and
> kvm_riscv_local_tlb_sanitize() is not involved on that path.
>
>    My commit message was a bit too terse on this point. The concrete
> sequence we observed was described earlier in the RFC discussion:
>
>
> https://lore.kernel.org/kvm/0d15b098-b8f7-4080-9f33-e8c49c2331e1@bosc.ac.=
cn/
>
>    In short, the issue is: because vcpu0 migrated away, cpu1 still has
> stale TLB entries while cpu0 has the new mapping. After that, neither
> vcpu migrated again, but the process was scheduled from vcpu0 to vcpu1
> (which is on cpu1), causing it to hit the stale TLB. Consider the
> following scenario:
>
>    1. vcpu0 and vcpu1 are both running on cpu1. At this point, vcpu0 is
> on cpu1, and a process on it reads a page, which gets cached in the TLB
> (let's call this the "stale TLB entry").
>
>    2. vcpu0 migrates to cpu0, and then the process (on vcpu0, now on
> cpu0) does a CoW (copy-on-write) and establishes a new mapping.
>
>    3. Neither vcpu0 nor vcpu1 migrates again. At this point, the process
> gets scheduled inside the VM onto vcpu1 (which is on cpu1), reads the
> same page, and hits the stale TLB entry.

This cannot happen because in step#2 when mapping was updated the
Guest OS will do TLB flush for all its VCPUs which means vcpu1 on cpu0
will also receive TLB flush and the stale TLB will be removed. This means
when process is moved back to vcpu1 on cpu0, HW will fetch updated
PTE and new TLB entry will be populated.

>
>    So this is an intra-guest scheduling case onto a vCPU that stayed on
> the original host CPU, rather than a =E2=80=9Cvcpu0 returns to host CPU1=
=E2=80=9D case.

My NACK still holds.

Regards,
Anup

>
>    Thanks,
>    Yaxing
>
> >>
> >> Host CPU1 did not observe the guest-local sfence.vma, and KVM can ente=
r
> >> vcpu1 with a stale VS-stage translation left behind by vcpu0.
> >>
> >> The reported failure was seen on a XiangShan RISC-V system. A bash tas=
k
> >> ran on vcpu0 while vcpu0 was backed by host CPU1, and a read-only page=
 was
> >> prefetched into CPU1's VS-stage TLB. vcpu0 later migrated to host CPU0=
,
> >> where the guest triggered COW, updated the mapping, and issued only a =
local
> >> sfence.vma. The stale VS-stage entry on CPU1 survived. When the same g=
uest
> >> task later ran on another vCPU backed by host CPU1, it hit the stale
> >> translation. The page contained a GOT pointer, and using the stale dat=
a led
> >> to a NULL dereference and a userspace segmentation fault.
> >>
> >> The existing local TLB sanitize path flushes G-stage entries when a vC=
PU
> >> migrates, and flushes VS-stage entries only for implementations select=
ed by
> >> the Andes-specific kvm_riscv_vsstage_tlb_no_gpa static key. That handl=
es a
> >> split two-stage TLB implementation where HFENCE.GVMA does not invalida=
te
> >> VS-stage entries, but it does not cover the generic guest-local sfence=
.vma
> >> case above.
> >>
> >> Track, per VM and per host CPU, the last vCPU that entered the guest o=
n
> >> that CPU. Before guest entry, flush the current CPU's VS-stage context=
 for
> >> the VM if either the current vCPU migrated since its last exit, or thi=
s
> >> host CPU is switching from another vCPU of the same VM. Keep the exist=
ing
> >> HFENCE.GVMA behavior tied to vCPU migration.
> >>
> >> This also subsumes the Andes split-TLB workaround. That workaround was
> >> needed because the migration sanitize path previously relied on
> >> HFENCE.GVMA alone for most implementations, and only issued HFENCE.VVM=
A
> >> when kvm_riscv_vsstage_tlb_no_gpa was set. The new sanitize path alway=
s
> >> issues HFENCE.VVMA when reusing a host CPU for a VM context that may h=
ave
> >> missed a guest-local sfence.vma, so it no longer depends on HFENCE.GVM=
A
> >> invalidating VS-stage entries. The implementation-specific static key =
and
> >> setup hook are therefore no longer needed.
> >>
> >> Reported-by: Zhizun Wang <anzoso@outlook.com>
> >> Reviewed-by: Jiuyue Ma <majiuyue@bosc.ac.cn>
> >> Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
> >> ---
> >>   arch/riscv/include/asm/kvm_host.h |  6 +++---
> >>   arch/riscv/kvm/main.c             | 15 ---------------
> >>   arch/riscv/kvm/tlb.c              | 31 +++++++++++++++++++++++------=
--
> >>   arch/riscv/kvm/vm.c               | 16 ++++++++++++++++
> >>   4 files changed, 42 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/as=
m/kvm_host.h
> >> index 24585304c..396ac6209 100644
> >> --- a/arch/riscv/include/asm/kvm_host.h
> >> +++ b/arch/riscv/include/asm/kvm_host.h
> >> @@ -91,6 +91,9 @@ struct kvm_arch {
> >>          /* G-stage vmid */
> >>          struct kvm_vmid vmid;
> >>
> >> +       /* Last VCPU that ran on each physical CPU */
> >> +       int __percpu *last_vcpu_ran;
> >> +
> >>          /* G-stage page table */
> >>          pgd_t *pgd;
> >>          phys_addr_t pgd_phys;
> >> @@ -330,7 +333,4 @@ bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu)=
;
> >>
> >>   void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
> >>
> >> -/* Flags representing implementation specific details */
> >> -DECLARE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
> >> -
> >>   #endif /* __RISCV_KVM_HOST_H__ */
> >> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> >> index 0f3fe3986..b1bbc0835 100644
> >> --- a/arch/riscv/kvm/main.c
> >> +++ b/arch/riscv/kvm/main.c
> >> @@ -10,23 +10,10 @@
> >>   #include <linux/err.h>
> >>   #include <linux/module.h>
> >>   #include <linux/kvm_host.h>
> >> -#include <asm/cpufeature.h>
> >>   #include <asm/kvm_mmu.h>
> >>   #include <asm/kvm_nacl.h>
> >>   #include <asm/sbi.h>
> >>
> >> -DEFINE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
> >> -
> >> -static void kvm_riscv_setup_vendor_features(void)
> >> -{
> >> -       /* Andes AX66: split two-stage TLBs */
> >> -       if (riscv_cached_mvendorid(0) =3D=3D ANDES_VENDOR_ID &&
> >> -           (riscv_cached_marchid(0) & 0xFFFF) =3D=3D 0x8A66) {
> >> -               static_branch_enable(&kvm_riscv_vsstage_tlb_no_gpa);
> >> -               kvm_info("VS-stage TLB does not cache guest physical a=
ddress and VMID\n");
> >> -       }
> >> -}
> >> -
> >>   long kvm_arch_dev_ioctl(struct file *filp,
> >>                          unsigned int ioctl, unsigned long arg)
> >>   {
> >> @@ -172,8 +159,6 @@ static int __init riscv_kvm_init(void)
> >>                  kvm_info("AIA available with %d guest external interr=
upts\n",
> >>                           kvm_riscv_aia_nr_hgei);
> >>
> >> -       kvm_riscv_setup_vendor_features();
> >> -
> >>          kvm_register_perf_callbacks();
> >>
> >>          rc =3D kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> >> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> >> index ff1aeac4e..1541d059a 100644
> >> --- a/arch/riscv/kvm/tlb.c
> >> +++ b/arch/riscv/kvm/tlb.c
> >> @@ -8,6 +8,7 @@
> >>   #include <linux/errno.h>
> >>   #include <linux/err.h>
> >>   #include <linux/module.h>
> >> +#include <linux/percpu.h>
> >>   #include <linux/smp.h>
> >>   #include <linux/kvm_host.h>
> >>   #include <asm/cacheflush.h>
> >> @@ -160,12 +161,19 @@ void kvm_riscv_local_hfence_vvma_all(unsigned lo=
ng vmid)
> >>
> >>   void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> >>   {
> >> +       bool vcpu_migrated;
> >> +       bool vcpu_switched;
> >>          unsigned long vmid;
> >> +       int *last_ran;
> >>
> >> -       if (!kvm_riscv_gstage_vmid_bits() ||
> >> -           vcpu->arch.last_exit_cpu =3D=3D vcpu->cpu)
> >> +       last_ran =3D this_cpu_ptr(vcpu->kvm->arch.last_vcpu_ran);
> >> +       vcpu_migrated =3D (vcpu->arch.last_exit_cpu !=3D vcpu->cpu);
> >> +       vcpu_switched =3D (*last_ran !=3D vcpu->vcpu_idx);
> >> +       if (!vcpu_migrated && !vcpu_switched)
> >>                  return;
> >>
> >> +       vmid =3D READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> >> +
> >>          /*
> >>           * On RISC-V platforms with hardware VMID support, we share s=
ame
> >>           * VMID for all VCPUs of a particular Guest/VM. This means we=
 might
> >> @@ -176,16 +184,23 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcp=
u *vcpu)
> >>           * To cleanup stale TLB entries, we simply flush all G-stage =
TLB
> >>           * entries by VMID whenever underlying Host CPU changes for a=
 VCPU.
> >>           */
> >> -
> >> -       vmid =3D READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> >> -       kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> >> +       if (vcpu_migrated && kvm_riscv_gstage_vmid_bits())
> >> +               kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> >>
> >>          /*
> >> -        * Flush VS-stage TLB entries for implementation where VS-stag=
e
> >> -        * TLB does not cahce guest physical address and VMID.
> >> +        * Guest-local sfence.vma only invalidates VS-stage translatio=
ns on
> >> +        * the Host CPU currently backing the VCPU. If a VCPU migrates=
, or
> >> +        * if this Host CPU switches between VCPUs of the same VM, sta=
le
> >> +        * VS-stage entries can be left behind on a Host CPU that miss=
ed a
> >> +        * guest-local flush. Flush the current CPU's VS-stage context=
 before
> >> +        * entering the guest.
> >>           */
> >> -       if (static_branch_unlikely(&kvm_riscv_vsstage_tlb_no_gpa))
> >> +       if (kvm_riscv_nacl_available())
> >> +               nacl_hfence_vvma_all(nacl_shmem(), vmid);
> >> +       else
> >>                  kvm_riscv_local_hfence_vvma_all(vmid);
> >> +
> >> +       *last_ran =3D vcpu->vcpu_idx;
> >>   }
> >>
> >>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
> >> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> >> index 13c63ae1a..2907218a1 100644
> >> --- a/arch/riscv/kvm/vm.c
> >> +++ b/arch/riscv/kvm/vm.c
> >> @@ -9,6 +9,7 @@
> >>   #include <linux/errno.h>
> >>   #include <linux/err.h>
> >>   #include <linux/module.h>
> >> +#include <linux/percpu.h>
> >>   #include <linux/uaccess.h>
> >>   #include <linux/kvm_host.h>
> >>   #include <asm/kvm_mmu.h>
> >> @@ -30,7 +31,9 @@ const struct kvm_stats_header kvm_vm_stats_header =
=3D {
> >>
> >>   int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> >>   {
> >> +       int *last_ran;
> >>          int r;
> >> +       int cpu;
> >>
> >>          r =3D kvm_riscv_mmu_alloc_pgd(kvm);
> >>          if (r)
> >> @@ -42,6 +45,17 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long=
 type)
> >>                  return r;
> >>          }
> >>
> >> +       kvm->arch.last_vcpu_ran =3D alloc_percpu(int);
> >> +       if (!kvm->arch.last_vcpu_ran) {
> >> +               kvm_riscv_mmu_free_pgd(kvm);
> >> +               return -ENOMEM;
> >> +       }
> >> +
> >> +       for_each_possible_cpu(cpu) {
> >> +               last_ran =3D per_cpu_ptr(kvm->arch.last_vcpu_ran, cpu)=
;
> >> +               *last_ran =3D -1;
> >> +       }
> >> +
> >>          kvm_riscv_aia_init_vm(kvm);
> >>
> >>          kvm_riscv_guest_timer_init(kvm);
> >> @@ -54,6 +68,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
> >>          kvm_destroy_vcpus(kvm);
> >>
> >>          kvm_riscv_aia_destroy_vm(kvm);
> >> +
> >> +       free_percpu(kvm->arch.last_vcpu_ran);
> >>   }
> >>
> >>   int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq=
l,
> >> --
> >> 2.43.0
> >>
>
