Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794548219;
	b=ooh0r3iEumBbGSsdIWgFGBnAuVhCHui51CS44CU2VEoRZum7dj+FMG9ZHqye1twxjk3J
	 mO/zmj49Wh1B8XJjwF6XuJ9nBzivglHuTHCwAkX7c4IlSVm6HEMuGb+WNWK2zOhwnrvlD
	 VpegRe7A0NpY8wqkntzVJbm5rPT4LHaz19WT6yWgexCx0ZAWDbBaqr5eDKTxjJhYf+r94
	 swMp8bpx53Adz23GAtbPscJs7d0WoHMPge3/2F0AJ41gpgSaqLHWPC7rFBsCOJckr0Q9P
	 KjsEc+1gDcJZp9YbJT6oe5O4MQk7Ka+GIifQAt6Q0CrI4834NxiUtRknZDgQnw2/Qvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
	b=fJx18hSAHnqULdpZrIRJdDxNkqHPQ2mkxV12bynhKMYUAFoV44uExh2wUAPzv43u+50A
	 LPyGFGL47f+lFmuzKGLNYAa92+8AhSED2hJdDOeV6nA+AOsl1oYRHnH7WRDMcr+keGkEL
	 Q9PdsZ1/dK2/1WtF6g+Ebg2zXTBGvsgPgGAakUh/wyc0OAX2APbtTsPzw5VgDPsNZvk8w
	 lfOv5S0klFr5iBw2c1xW45UHu7vzmkIn1C3+cPu5QTzAnGDrrMQ4SCy6Zap3MqjE47bYH
	 seYyi5KY8qU01WhLGvSooVTEuXGJ83YPof2/7KvKNG/bQl0fpzGAHUDgop5+SOBFC7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=daViEFRR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C17606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C17606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=daViEFRR
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so195743f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548217; cv=none;
        d=google.com; s=arc-20260327;
        b=jtIV4J+EwKQ5aaDnt6HUNHxLPp14AxWHTjMR6kmfQ+Ps50OxWunh5GvxwuNRfyhc5R
         5XRkiPLqzq2KFKUzp4vVy4dD3TTZuAGQBhLXEsBbOEwRpIjxa7gWUe3p2qET0y6/0US1
         aIf5L/AxDcxGe2LdERruY1dFXyqcc79KLO0UoPVdh07yDEocLaeuIVwBIEqjwc4lrN/2
         Y+0hcLVFwihh0rPuuoxaPD+FS6l60UPpA+DgcpvAwiMrOx1F2qTXE8LjqiUa/LQtQsgu
         mT2aZzZ/2vkNw1nEG9d70CHaBxdm+yu3t64UhvfW6Gd+v+ZBfUdYVwAucruxODZxPuVf
         LhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
        fh=vA/CHp8jzuBmtL6PHABkoI4bhmH0PuL3Oc65KddjY5I=;
        b=cGum4aZMQAVLmce+xM/UmTu927udnIjdT/S1tKreBo8Sv24AdlIdBvEPsV0pBqjbW+
         0COu56PDcp8onRmwgTD97I5dkJrsa4KYtnQDZhTOSbG3CEEeRG0ef4Zgnmsf/fCBRfLi
         RkizOZFu77BxiB8MQFf2otG/00OL0e2ENiDkE9AxzpIjfo5heXXr5eijww18lnDE7Fs4
         zly5I+j9WsIJokSBHiQzPckujOaqATBlyamBL5PxK+ahOWHUYXgwPr3c34WiMus5vABH
         hmXgnnYA0hAmIv/XKq94ftWAM78H+E4lRR7UieCX1UFVFl1oprz9+AuU2K3VFp3dX4Cx
         Ageg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548217; x=1795153017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
        b=daViEFRRlWgxegdlfyazsl4lEgVfhqcGvlV/y5M0IjgUnYqzJ//Y20Yc9YpHSs4zVy
         WbvX3qgm7ZvLNdp3JZDq4N+VFOt3ZM6jGzHHQl1ukfrRmZfcCrI2O61SB6h9kvw3pXzh
         GvK1U4P5pHcYRskVC75iH2ZLtqujiDzWmv3+4xS3WrXX9TkkH5N7bTy9I/UN7Z9Oosj/
         j60DQlu7EI2ji/GMEHLpd2jaLjF7qOvTArp9GrpmSlFiBG8Hi601kRuSgSRPPRZ9275A
         oY0p43gKjd8PzFPH69nb4j6r0qYBA8ZYqnjlgIuNqrnfuiA8rSR7705M96Qa7jbXOpPO
         0Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548217; x=1795153017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
        b=rpCz+SYUmVSkV9uXvUMG+dNwbEjKN4jm90IdC7xFY0QiztFJIdm6pSzcEZq5GGuoaV
         vXCEKPliTv4yZd3o85G4emlETV23zDJhjQj/2rup/GmNetUmVmRqfuLO1fR7mO006zaL
         +yEb4002kRzMBDlPpTtb0zRMrc/KMfiUVHyUKyAtJvAy5ekEts6UConkBfNX7DDfraS1
         jRYn1dEKBLgR/Jpd1XMHEIrtaNzBmgOzf7XLiOy9eLwAL9/915KXNxNnK7lcgfrJFi6U
         DsBsypjlikCTJw3lmtXDzecs71EQu8RgatY2pHPuUGLiawsDwmZMT+bhYB7WYzB/meCh
         q7Ig==
X-Forwarded-Encrypted: i=1; AL+hErGi9nWcnYxDIG7nE9dxifm4IE8klpMW/5msat8t/Xm7GZ44pxwetD8x0NIdkhOFCWAFdhSLDdke93CycCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BPA34sAlxuBg8XRusxTwfFNVDDFXTH4adCpQQyqyRa3CSIv10
	finA4bCVKXlIeNTBbktr+FGrkC/HAvijsHf54YrjLq0/xpTudimb/0QOScpUT89/Utv3A+x13AM
	d4P5nR6R2WwgRgdYqEAwvSFLmKsO1iftj4kFIT6mRhg==
X-Gm-Gg: AYBFou24qiKVjXWfyGpvnNkV8AZaDwuiBSE3C4y3wQOIdIXQLy9Oak4B0VuOA/veOw/
	Bm1qNJFj6S7DMhE38qdjSt1cLeOSml39DorCLX4+5MWuceVgd9kI7mCRw026r9RhpcrT0yRaa8M
	pkewSvQKu9Edeo4hBPsbwW0GszoR9YyTfzSVFAhXik0p6olZKCay2w0dBVEoWYPbJ9YuwSmu1hI
	0Yxa4GQywaperlcYPfRN0LfRplO82vqEY4Qq6fUzA/r6LlLCsL0veOcrA444R2O54zLdlC2Vf3O
	wPQn4Co8rBt/HrPmwUq9q9/bSsOt114h9D74ZlZAadoSSOuXISSOCp06DwDr/apzbHY6Kr9eJFx
	l1WoIKt6kcFUKk5istZsyiHRHZHZ8nyROeumuKnIOm8NpL8Lrbe1fNymWnY2ZKbZL4pGSrLlzry
	NsIkAvh7sWKGwuEWRfYVptIt+4TlXr78fYpZi0gYpDFUUg9cKnCDMluzyT9Q==
X-Received: by 2002:a05:6000:25ec:b0:490:83b9:7888 with SMTP id
 ffacd0b85a97d-49c74959580mr2860493f8f.52.1794548217360; Thu, 12 Nov 2026
 21:36:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1789872556.git.hppiscas@163.com> <3046cfd67c5f962014cd38e49a0e8bf28b6fb53f.1789872556.git.hppiscas@163.com>
In-Reply-To: <3046cfd67c5f962014cd38e49a0e8bf28b6fb53f.1789872556.git.hppiscas@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:45 +0530
X-Gm-Features: AclHuK9biTLZxhI1tcdlqfU4imHZdhgp5Hgs9a4lcq-e0JhTebZNZ8Ov0xT5swk
Message-ID: <CAAhSdy3-ArOtVWGzzpM3pxi7_+8bhD5L-_WvGL-MFwRLH1xzAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Validate AIA MMIO address ranges
To: Pengpeng Hou <hppiscas@163.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 6:39=E2=80=AFPM Pengpeng Hou <hppiscas@163.com> wro=
te:
>
> The AIA address setters check alignment but not the complete fixed-size
> APLIC and IMSIC MMIO regions. A range can therefore wrap when its end is
> formed or extend beyond the selected guest physical address space before
> it is registered on the KVM MMIO bus.
>
> Check the complete range in both setters. Return -EINVAL for alignment
> or arithmetic overflow and -E2BIG for a range beyond the selected GPA
> limit, following the arm64 VGIC address-validation convention.
>
> Recheck only the APLIC range during initialization: userspace can set
> its address and then change KVM_CAP_VM_GPA_BITS while the VM still has
> no vCPUs or memory slots. An IMSIC address, in contrast, can only be set
> for an existing vCPU, which already prevents subsequent GPA-width
> changes. No additional pass over the vCPUs is needed.
>
> Keep the existing required-address checks and IMSIC cleanup path.
>
> The issue was found by our static-analysis tool.
>
> Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irq=
chip")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
> Changes since v1: https://lore.kernel.org/r/38f87205419f328693bc6ab25ae78=
f021c2dd003.1786512671.git.pengpeng@iscas.ac.cn/
> - Keep the original APLIC and per-vCPU IMSIC required-address checks.
> - Drop the separate pass over all vCPUs during initialization.
> - Recheck only APLIC, whose address can be configured before GPA width
>   becomes immutable; IMSIC setters already require an existing vCPU.
>
>  arch/riscv/kvm/aia_device.c | 42 +++++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index efc7c0b..4490015 100644
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
> @@ -248,6 +273,15 @@ static int aia_init(struct kvm *kvm)
>         if (aia->nr_sources && aia->aplic_addr =3D=3D KVM_RISCV_AIA_UNDEF=
_ADDR)
>                 return -EINVAL;
>
> +       /* The GPA width may change after setting APLIC's address on an e=
mpty VM. */
> +       if (aia->nr_sources) {
> +               ret =3D aia_check_addr_range(kvm, aia->aplic_addr,
> +                                          KVM_DEV_RISCV_APLIC_ALIGN,
> +                                          KVM_DEV_RISCV_APLIC_SIZE);
> +               if (ret)
> +                       return ret;
> +       }
> +

We should also check IMSIC addresses one more time in aia_init(). I will
take care of it at the time of merging.

>         /* Group index bits must not overlap guest and HART index bits. *=
/
>         if (aia->nr_group_bits &&
>             aia->nr_group_shift < (IMSIC_MMIO_PAGE_SHIFT +
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as a fix for Linux-7.4-rcX

Thanks,
Anup
