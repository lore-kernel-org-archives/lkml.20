Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6264230BE9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021718; cv=pass; b=W/2p3TF6+41Jju/6pL7912bImw7oB85BWTPEagDu0YHtbhIc1V1AGUNXOr9wWk5/8gefJSEKZFruJCpW/mwi0bTFprC/QGt9Z7HcaKJGNURIUVwrX26EJCU1keFasqDiW+PKMcA9qnM4kaCPCdT9doWoriS17Mp+giZbBcyMr7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021718; c=relaxed/simple;
	bh=wwKx9VZaLSJlVUeMvVleoyPF0+Rx0DsJrbaVreNEZPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CogWTQ0unnJTfk6Yizu2d9VqkRuEATeRZGIFMja7d13BhdiAoZiNNcHQ+NlHk4MqsF+8XwpqLH0BGGeui9/XfLJ7GLTX5hWWhIQFyeJO1ve0uxxxIB3cBbLlEy/nvJwnGMvi0sE5xZMhbXOYSEtAkxrERGCGlIut24knNNTms08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=l7NQBR/N; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="l7NQBR/N"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so3159415e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021715; cv=none;
        d=google.com; s=arc-20260327;
        b=FpGrSMgqgJ/5pnWGYIMsAVeaCheDgoMTS+HEkiM2vgWHhtDgPTdcte5nUTN1SNfUj5
         rkUozRfiK3HTa/9svRG4ooVmiCr3lwusJb5zsbnQASS/TXNY80+ngvZUWkNp2NXIw+Je
         4RURYIQvLVNY9YOjfwX8AH8mYX8liVLviKA2/lhK3CImQlm33L2hUK/5aMyengMx3Fy1
         T552qJH0DJR1cuOfJum7fJ8rsbP0yOnE01R/ZCe+xs42YvlAAb6cJTzxS6ximD0a9mMt
         0HjQBKQLlNMeFgnroF8/YC1ZcEBheSFY891Y/QdJKABUfcOdYEzVbtEYnmPmjcew+FEg
         VS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODhu0+JORxMVydzwdRHX9v6bx/g/rjNmTXIxiRRhk70=;
        fh=m5eocUWTLvrfmUBsZnL54wIhUHxtz6D1/KK/jY6OjK4=;
        b=nphvCrZ59KxkMG0fZazdZXNJjI0w23X1p5MM8fKXCM+lSK7wuporzMKoi0SpSfRTwE
         gC0TKlYa41mqZkqeENIDp6MLqufS1tr8lSLdWTKtcTbc2nsXobepPnrz0efJ5rJSXDVq
         mM2jeBK81gjoa05QdW4Fc6aXfxKOTMxinWSW3kUHZ4G/e8Y9sp5Ficwff5NuLmatXKlt
         412fZMlb4q76XHjXHF9lVirRgFRqkbCMLd24z0cIIN88MOT+sc6WQs1Rh2Mbh31xTHKw
         fXHo8zb1KPlKRztXWp8dOWMnkTA9jbaZhLy3zVRpTc+DH9Z8abr9B9L5lOWhrsoM18yO
         kGJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791021715; x=1791626515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODhu0+JORxMVydzwdRHX9v6bx/g/rjNmTXIxiRRhk70=;
        b=l7NQBR/N5OjePAH7/PmPolPrltjt3hhk7hfdYTaLZFcZcxZYCWZ/h4l2aebVkbwFt4
         tWIlXtzXZKX3x7QeBFu5vHOvBnQ0S1TEwxFQfc8MAoXqBXpWAQxk6BOapVjEVTI6p+rF
         IabQ+2/bziGJMsNxH556qUWfAot/Ixv252g4wT2/Wm/yirj49qT2tQWlEZL1siGFkmLy
         U/amQnTuQ3UKja5lC6CoXziFjOzZ3CIpNZVPm/uGLDi2yM7aeN5FFyyqM+WEPFqlj4Ao
         g9YZ2/P7SuinTldqTaNuKhI3GZLp58s/wSKqIPyfBvFFYLRz9sZaGMdjYYDuCHmG4Cic
         PH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021715; x=1791626515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODhu0+JORxMVydzwdRHX9v6bx/g/rjNmTXIxiRRhk70=;
        b=FLv3mdrKKLRmkCjOTn/umyTh8CQVrLZqoF7pYdbAyz9bwL68QmIOMPZJS6mEN+oe1G
         EGk407sOaqp6HjvRYMycaFDrJD6dOpBoukIAlMV0qwHmwGfXOzAv41b+P8ZmDdhC3ECx
         dv5dDfjCk/naj7EcX7DkCN7UM0Z04Hsexvyg6OP6EPl+wuyHuJrWQ+DRekjLVxATiZs7
         5oiTuWa6m0TT+YL3VbrHknPPxho/2am86DXqTCviUp4HDh9RtvumYz4G90Y6ymtMFm0z
         Nejj3/OGxvOwhB3N/0dfTJp3b9WA80+LCVyVL3u067ewp6CAiVn3HmhCHXVA89wKBZot
         R4ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxYZCoENZJqC6TbO6ROV6t0PWMZcLYJcltSSHVAZh2FvD8F6Rfr+F55nILqaJOk1t8ttUoRzchic9aNB9A=@vger.kernel.org
X-Gm-Message-State: AFuF++m9xVZok/8RUMeJUMZCD0Pt4A49B5ht4AsiDRq3cmffwzWIXjx/
	4+MUdlJKSbla+7V2dPrNBa2+hIwCEYI5D0lwaNOQKVpUJmWD5sa2p/omce7xKrIL/x4ttjS5Oxv
	0GYzoUx1tkjyG8XbjSnqSc/XFvz23qZtIkFr6BiFg7Q==
X-Gm-Gg: AYBFou0bLM+506Exc9kzLef4USTnahf+8YlrhvENXH89n4TV/p2bT2cl8Vm4tZihmdX
	QOdl1Lr1aG4qvTdIhGIBAnt7TwHaEYZx2Ak26bpgiDz+5bEOobpHn3uapZB4k3NmVnyPxrDxKo1
	hbVUOEwRFViLduWzUyHETnybyFQrXjF0bkVIszZOAxRPMZkhdPixhFzBtJW9TDvHvsbCgAxplBl
	081RvA9i5Y+3K0mrJ97ieVn2E+QHikU668YbLlOvIy+tC7P1MB92F3jNxqAMnM9ol81b73mznnN
	Fotkp0Ft1/BXeBNNpEN63DqAC0TyCen37kBcHGgvjTqkBUutZXbsw03E2dSYeKu5PiOFOgKEBlW
	QJgwX90Yw/QejjS+DuRIBNxSI0TgzptY5R95YTAmGqY2OEQZDzdOMeibIh7oIY6aJUrIb8GOq8u
	o=
X-Received: by 2002:a05:600c:8715:b0:49c:fc6c:be08 with SMTP id
 5b1f17b1804b1-4a0276b1af1mr87172225e9.31.1791021715031; Sat, 03 Oct 2026
 03:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814114507.583424-1-jinyu.tang@linux.dev> <20260814114507.583424-2-jinyu.tang@linux.dev>
In-Reply-To: <20260814114507.583424-2-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 15:31:43 +0530
X-Gm-Features: AclHuK9k6L1OYyDIrVaj_x6CqtWghMYumWURAwB0uofKGuH7qFYD0LqZ2Py3IoI
Message-ID: <CAAhSdy3z3C4nCvuU688Tw+YyioECdE_h=q0pXt7yJadaynn20g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 5:15=E2=80=AFPM Jinyu Tang <jinyu.tang@linux.dev> w=
rote:
>
> The generic KVM_PRE_FAULT_MEMORY ioctl lets userspace populate KVM page
> tables before running a vCPU over a GPA range. x86 already supports the
> ioctl, but RISC-V does not expose the capability and has no arch hook.
>
> Add the RISC-V arch hook and reuse the existing G-stage fault mapping
> path with a read access. Report progress using the G-stage mapping
> returned by the map path, so the ioctl can advance by the actual leaf
> size that covers the requested GPA. Retry until a mapping is installed
> or a signal, VM-dead request, or real error is observed.
>
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
> v2 -> v3:
> - Retry internally when the map path returns success without a visible
>   G-stage mapping, instead of exposing -EAGAIN.  (Sashiko)
>
>  arch/riscv/kvm/Kconfig  |  1 +
>  arch/riscv/kvm/gstage.c |  3 +++
>  arch/riscv/kvm/mmu.c    | 42 +++++++++++++++++++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c     |  1 +
>  4 files changed, 47 insertions(+)
>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index ec2cee0a39e0..8ac209e8ac87 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -28,6 +28,7 @@ config KVM
>         select KVM_COMMON
>         select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>         select KVM_GENERIC_HARDWARE_ENABLING
> +       select KVM_GENERIC_PRE_FAULT_MEMORY
>         select KVM_MMIO
>         select VIRT_XFER_TO_GUEST_WORK
>         select SCHED_INFO
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index e5002cb9cbef..6bd8b8fd6ceb 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -280,6 +280,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gsta=
ge,
>                                                     out_map->level, true)=
;
>                 } else if (ALIGN_DOWN(PFN_PHYS(pte_pfn(ptep_get(ptep))), =
page_size) =3D=3D hpa) {
>                         kvm_riscv_gstage_update_pte_prot(gstage, ptep_lev=
el, gpa, ptep, prot);
> +                       out_map->addr =3D ALIGN_DOWN(gpa, page_size);

This ALIGN_DOWN() must be done for all cases at the start itself
right after gstage_page_size_to_level(). I will take care of this at the
time of merging this patch.

> +                       out_map->level =3D ptep_level;
> +                       out_map->pte =3D ptep_get(ptep);
>                         return 0;
>                 }
>         }
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 6035b5ec9503..33d4ba406b0d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -748,6 +748,48 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct =
kvm_memory_slot *memslot,
>         return ret;
>  }
>
> +long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> +                                   struct kvm_pre_fault_memory *range)
> +{
> +       struct kvm_gstage_mapping out_map =3D { 0 };
> +       struct kvm_memory_slot *memslot;
> +       unsigned long map_size;
> +       unsigned long hva;
> +       gpa_t end;
> +       gfn_t gfn;
> +       int ret;
> +
> +       gfn =3D gpa_to_gfn(range->gpa);
> +       memslot =3D kvm_vcpu_gfn_to_memslot(vcpu, gfn);
> +       if (!memslot)
> +               return -ENOENT;
> +
> +       hva =3D gfn_to_hva_memslot_prot(memslot, gfn, NULL);
> +       if (kvm_is_error_hva(hva))
> +               return -ENOENT;
> +
> +       for (;;) {
> +               if (signal_pending(current))
> +                       return -EINTR;
> +
> +               if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
> +                       return -EIO;

The kvm_check_request() does not allow KVM_REQ_VM_DEAD because
this request can't be cleared so we have to use kvm_test_request() over
here. I will update it at the time of merging this patch.

> +
> +               cond_resched();
> +               ret =3D kvm_riscv_mmu_map(vcpu, memslot, range->gpa, hva,=
 false, &out_map);
> +               if (ret)
> +                       return ret;
> +
> +               if (pte_val(out_map.pte))
> +                       break;
> +       }
> +
> +       map_size =3D PAGE_SIZE << (out_map.level * kvm_riscv_gstage_index=
_bits);
> +       end =3D ALIGN_DOWN(range->gpa, map_size) + map_size;
> +
> +       return min_t(u64, range->size, end - range->gpa);
> +}
> +
>  int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
>  {
>         struct page *pgd_page;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index a9f083feeb76..58500a19b33b 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -187,6 +187,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>         case KVM_CAP_MP_STATE:
>         case KVM_CAP_IMMEDIATE_EXIT:
>         case KVM_CAP_SET_GUEST_DEBUG:
> +       case KVM_CAP_PRE_FAULT_MEMORY:
>                 r =3D 1;
>                 break;
>         case KVM_CAP_NR_VCPUS:
> --
> 2.43.0

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup
