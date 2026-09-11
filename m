Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB0403B11
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111480; cv=pass; b=oTVT5VV0FoAyzJMOMMBJB1QmASAMn+Hy8odMz9Y38xU3J9BL/htGezJ9xx5rBxaNtHGI/lfHac4OZDPIaS8NzISsl38mNuiUEKCRK6o4e8pja6ObLMQBGWZJ3TZ7I0CLDqdMQJLW1328DSLbTebEK1q7MYAayQb1U6UewljUOrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111480; c=relaxed/simple;
	bh=TNb5YfolWFz/KzCtpoOSTFh7E8/Z2BMjU6+AO4iMnDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brfQTDcP6HzlgEYHBWjZ29wIx4imasVc7uE3rXqoYCyQgd4TOsQ69yRxiZfE2FaS0n3jKwq/TNS9QD6YjpKKNt/hSc7hAic60AOPubZfyeIrOMWV+9fzA1lBXZwgeQyq0OcVkPqPA0y1GqUJ8rwSb/UcydGuve5fYlp8bx9xxCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=dfxfX0Ic; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="dfxfX0Ic"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48436216a98so336483f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789111474; cv=none;
        d=google.com; s=arc-20260327;
        b=fDxueAIm7uAWBurRzBFQ79VezepMV6EY/Mu/gd8psLkgMh39oncF3BH0qEH6ffNaUI
         Zey6kWsSRm8j1/21rqcHEatpm9eXCQWYt5EzDzYKARWPym5runqs28rTpdw9PZI5Gg33
         PeH/0E/XJfgjItKiFAio9N4l/8bsVsibYRqWyHlsgec9jgwWU8YfkD373+pb/0fPI0mJ
         tay4uNkYRx8owRyy3EjNlKjw5CA+kfRJACgxSVHRoSO8DLtp8Jm6Y/AyeXQ6IV1Dv6hR
         LtyhiwpComj7s5M4MJw9raaDCFuPto7jDph+PxkdN95Hxp9s76eWpcoyagyVyd4F7jyP
         avKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fGXL6SW2PjuwJeBInmK3rjKWbFZ1WqS2BCjkSdFQSww=;
        fh=SBbH+/n1PVIcZg9sOXC2AY0xEOE3VCujX0XkuYkSsIg=;
        b=rYyha+WFOy5R6UFvasH5uzrnkj5quAree76IdEAAxRWpqaPIOrpPn7WDc/dQYvzOQJ
         qi5p4aYhNlp2JoZ6xDpxPk0Q1rd3SlDLBPk3VkzQRsKFfIkM+AwcP7QbnCf4QihkwX4X
         xqoTdBW+Z/jIkYLjk7JWL6m6sIOvdn5zYNhlfGo2vqGnYyyQsWwFtfejmk68FCW4xp55
         llyjdwtPgEMrgJCrSZNvZ+vM28PR9YNMJuh7YeazdGyBKzfwZFM3TSgEKdHSV+XMbWPw
         3CCT5BpJWalg8s5xBhwleqepXtGegSbu8z47RoUEaX4rb6QSDBFF4U2v0uC0mN2asCYT
         ps7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789111474; x=1789716274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGXL6SW2PjuwJeBInmK3rjKWbFZ1WqS2BCjkSdFQSww=;
        b=dfxfX0IcuFdIvk9FoFjZYAokF6XmCG5j3qAsP8xMOiTdbKH/Dz8d9Mg5lqt0/cOzRK
         MsYMsLhvhZqSLmcnJ0v1qgxUGVb+t8EltjLPWSNaCyAsc8jHXjoYswBiBuS7hgJaeaIe
         /6fyzBlZylB8d08mQZjwD2mqcJwILxdDyLntw3P2XwOu7JiYBPt54MHPWonv+Wj7TZlk
         KFCL7Sg1GPoU4UKaP43bmmifb8mN5IBkgjP2cRfMunXK1INaV4ipyk55zQ3cPro1cccM
         PfLrQhZ+vrJRaMsfWJOQa6EgfkLC/n+5JcmoPdq96ZKQ91lVeFuwiba9FntxNcFPp3cA
         QJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111474; x=1789716274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGXL6SW2PjuwJeBInmK3rjKWbFZ1WqS2BCjkSdFQSww=;
        b=BwJxijfpr9b2FpfBMmHQLDQkU61a8GHtQ6FTnhf0jv2NwLBeSv8tAeZqun6G3S1TAc
         Ic5gSFtxF2EG9MdV2QJc+SG4wS8FeYjemBQtQfg1pDPOlB0BBMLp3bgt8hB7XOp3LNN+
         N6XXxW5AHONZ3eUtxPDZVpYite2Ju8Ohzr8KpTgquqsXX83WSktmAxBR0nTg7xjiOwXR
         qiRyJeucYlNoKVVCVOCsKyOkyx6qsnn9a8viYqUAYwBDGDJthcKizjgKDeHMj6fNiQxL
         6EBntpxn5/0m9+IEA86C6Nm/04Kt9DZDwYEWOLFFaL56o9yHhZw3wnqNIwewORRhK5c4
         b3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxuDOIck+cl6RjA9xZY0wp86EKxFqUOzVY30CsIjK4BCSzeCL/4hxXSc+S5yQHd5quif8eBj6qSUVoBOek=@vger.kernel.org
X-Gm-Message-State: AFuF++kHzasdVWjzHOxjeSDLhWjV6cCWazyKo0ZHHtRmkzonyTJtkFyp
	936v9cmp8C6Ie8VGOVRsarP08CXZFSIN0JKpJcpRpqf+utSQtGaJMxb4L3pT/LDfkqA+7TbO+qx
	hsjkQ5BjSxy+ghjSM48auaqaAnn3xAH59at9kJcV4Mg==
X-Gm-Gg: AYBFou2crPiD3/yRVIUYDevu956MdtlZNV3M5TKT6VhCd0BE21aqgDRWtIPUFJ8mMCj
	wL6/C4p5T6Lzs7v0F+Yg3dD3ifM+ZAR5I56TWRwn8p2nwPAKN7aWVmPS/hIfJ8KhRuRAoUNXXSf
	v6JSORnN8mwvsL5Td1Ocs+4wYmza+Q72LRpMMycW8/RMZGHjDHa3gVJPLdwvZ/rz0mLvVOmIkmh
	HuN4ivIyUozKKp7eCuiqFSvX3JKdTvl1WvbH+JksosY9Rxm0vec7H7DUXI9kmdl4oQx9iL0v30A
	1FhdJC6y+kZpvOQ1GkPNyl6NWec8eyhQ4CuwUimGCk/6ZnHnStmyg0dXJf5Jwis4Y7bv7zoKDs1
	/XZoGD214uTrdD+QyubEgQH297kg71smKOB7HXm2PM8bOopHdLpSsHynqN8jF9CNgN/KLjhQXuw
	==
X-Received: by 2002:a05:6000:2c10:b0:486:e8ec:f999 with SMTP id
 ffacd0b85a97d-486eafd5fbdmr3215110f8f.6.1789111474165; Fri, 11 Sep 2026
 00:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786512671.git.pengpeng@iscas.ac.cn> <38f87205419f328693bc6ab25ae78f021c2dd003.1786512671.git.pengpeng@iscas.ac.cn>
In-Reply-To: <38f87205419f328693bc6ab25ae78f021c2dd003.1786512671.git.pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Sep 2026 12:54:22 +0530
X-Gm-Features: AcwNN1Ui109i9ET6WVNBUkTgCCDwwsHevBU9WciGYkKXECocq96-TkdibME6zPA
Message-ID: <CAAhSdy1vDFrNQAT4vfDrfAVmztt0qvKhL3SeTOab3DBHmxC4-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Validate AIA MMIO address ranges
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Guo Ren <guoren@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 11:09=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn=
> wrote:
>
> Userspace supplies the APLIC and per-vCPU IMSIC base addresses through
> the AIA device API.  The address setters currently reject only
> misaligned addresses.
>
> The regions are later registered on KVM's MMIO bus with fixed sizes.  An
> aligned base near U64_MAX can therefore wrap when the range end is
> formed.  A lower base can still place the range beyond the selected
> guest stage-2 physical address space.  kvm_io_bus_cmp() assumes that
> registered ranges do not wrap.
>
> Validate the complete interval when an address is stored.  Since
> KVM_CAP_VM_GPA_BITS can change the selected GPA width before AIA
> initialization, validate every address again before registering the
> first MMIO device.
>
> Return -EINVAL for misalignment or arithmetic overflow and -E2BIG when
> the end exceeds the stage-2 GPA limit, following the arm64 VGIC
> address-validation convention.
>
> Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irq=
chip")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/riscv/kvm/aia_device.c | 79 +++++++++++++++++++++++++++++++------
>  1 file changed, 66 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index efc7c0bcfba9..e969dbdc4b97 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -10,7 +10,9 @@
>  #include <linux/bits.h>
>  #include <linux/irqchip/riscv-imsic.h>
>  #include <linux/kvm_host.h>
> +#include <linux/overflow.h>
>  #include <linux/uaccess.h>
> +#include <asm/kvm_gstage.h>
>  #include <asm/kvm_isa.h>
>
>  static int aia_create(struct kvm_device *dev, u32 type)
> @@ -142,17 +144,37 @@ static int aia_config(struct kvm *kvm, unsigned lon=
g type,
>         return 0;
>  }
>
> +static int aia_check_addr_range(struct kvm *kvm, u64 addr, u64 alignment=
,
> +                               u64 size)
> +{
> +       u64 end;
> +
> +       if (!IS_ALIGNED(addr, alignment))
> +               return -EINVAL;
> +
> +       if (check_add_overflow(addr, size, &end))
> +               return -EINVAL;
> +
> +       if (end > kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels))
> +               return -E2BIG;
> +
> +       return 0;
> +}
> +
>  static int aia_aplic_addr(struct kvm *kvm, u64 *addr, bool write)
>  {
>         struct kvm_aia *aia =3D &kvm->arch.aia;
> +       int ret;
>
>         if (write) {
>                 /* Writes can only be done before irqchip is initialized =
*/
>                 if (kvm_riscv_aia_initialized(kvm))
>                         return -EBUSY;
>
> -               if (*addr & (KVM_DEV_RISCV_APLIC_ALIGN - 1))
> -                       return -EINVAL;
> +               ret =3D aia_check_addr_range(kvm, *addr, KVM_DEV_RISCV_AP=
LIC_ALIGN,
> +                                          KVM_DEV_RISCV_APLIC_SIZE);
> +               if (ret)
> +                       return ret;
>
>                 aia->aplic_addr =3D *addr;
>         } else
> @@ -166,6 +188,7 @@ static int aia_imsic_addr(struct kvm *kvm, u64 *addr,
>  {
>         struct kvm_vcpu *vcpu;
>         struct kvm_vcpu_aia *vcpu_aia;
> +       int ret;
>
>         vcpu =3D kvm_get_vcpu(kvm, vcpu_idx);
>         if (!vcpu)
> @@ -177,8 +200,10 @@ static int aia_imsic_addr(struct kvm *kvm, u64 *addr=
,
>                 if (kvm_riscv_aia_initialized(kvm))
>                         return -EBUSY;
>
> -               if (*addr & (KVM_DEV_RISCV_IMSIC_ALIGN - 1))
> -                       return -EINVAL;
> +               ret =3D aia_check_addr_range(kvm, *addr, KVM_DEV_RISCV_IM=
SIC_ALIGN,
> +                                          KVM_DEV_RISCV_IMSIC_SIZE);
> +               if (ret)
> +                       return ret;
>         }
>
>         mutex_lock(&vcpu->mutex);
> @@ -191,6 +216,40 @@ static int aia_imsic_addr(struct kvm *kvm, u64 *addr=
,
>         return 0;
>  }
>
> +static int aia_validate_addr_ranges(struct kvm *kvm)
> +{
> +       struct kvm_aia *aia =3D &kvm->arch.aia;
> +       struct kvm_vcpu_aia *vaia;
> +       struct kvm_vcpu *vcpu;
> +       unsigned long idx;
> +       int ret;
> +
> +       if (aia->nr_sources) {
> +               if (aia->aplic_addr =3D=3D KVM_RISCV_AIA_UNDEF_ADDR)
> +                       return -EINVAL;
> +
> +               ret =3D aia_check_addr_range(kvm, aia->aplic_addr,
> +                                          KVM_DEV_RISCV_APLIC_ALIGN,
> +                                          KVM_DEV_RISCV_APLIC_SIZE);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       kvm_for_each_vcpu(idx, vcpu, kvm) {
> +               vaia =3D &vcpu->arch.aia_context;
> +               if (vaia->imsic_addr =3D=3D KVM_RISCV_AIA_UNDEF_ADDR)
> +                       return -EINVAL;
> +
> +               ret =3D aia_check_addr_range(kvm, vaia->imsic_addr,
> +                                          KVM_DEV_RISCV_IMSIC_ALIGN,
> +                                          KVM_DEV_RISCV_IMSIC_SIZE);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static gpa_t aia_imsic_ppn(struct kvm_aia *aia, gpa_t addr)
>  {
>         u32 h, l;
> @@ -244,9 +303,9 @@ static int aia_init(struct kvm *kvm)
>         if (aia->nr_ids < aia->nr_sources)
>                 return -EINVAL;
>
> -       /* APLIC base is required for non-zero number of sources */
> -       if (aia->nr_sources && aia->aplic_addr =3D=3D KVM_RISCV_AIA_UNDEF=
_ADDR)
> -               return -EINVAL;
> +       ret =3D aia_validate_addr_ranges(kvm);
> +       if (ret)
> +               return ret;

No need for this change.

>
>         /* Group index bits must not overlap guest and HART index bits. *=
/
>         if (aia->nr_group_bits &&
> @@ -263,12 +322,6 @@ static int aia_init(struct kvm *kvm)
>         kvm_for_each_vcpu(idx, vcpu, kvm) {
>                 vaia =3D &vcpu->arch.aia_context;
>
> -               /* IMSIC base is required */
> -               if (vaia->imsic_addr =3D=3D KVM_RISCV_AIA_UNDEF_ADDR) {
> -                       ret =3D -EINVAL;
> -                       goto fail_cleanup_imsics;
> -               }
> -

Don't drop this check.

>                 /* All IMSICs should have matching base PPN */
>                 if (base_ppn =3D=3D KVM_RISCV_AIA_UNDEF_ADDR)
>                         base_ppn =3D aia_imsic_ppn(aia, vaia->imsic_addr)=
;
> --
> 2.50.1 (Apple Git-155)
>

Regards,
Anup
