Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227734EB870
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575572; cv=pass; b=np6owZ/S0PIDFSz8E2aHIlBLnOhsE/3U/X0X26W0OWvn/WLAaIMrzZhMF4/VyFr1/HQYYAhSggAsAobp//38uKhRTWT+JuJX6gsHxnXxqASLnUVbTip1aPbnPZ9rpTCMGeRpuU6Vm0cw2Nefk69SzmLK0djwsfwSasXoF6tXL2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575572; c=relaxed/simple;
	bh=2EtykzROyNRHqI7dfO5p5LrMDJMmvauTWDJWnEKfhB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjNnQuZXOJNiZbRrQBqUqrF7xqkmS+sgNx1TAP5/eB/wUt+8K2XsGberdwSrIR5lWoX5zwASxbl7cIZ18kAKyJOQiJtc6ln6xI5UXES/9OYeeYrf5fXUOhaW4vflTOZ8igXRhaX32uS0Q3/oeD7ylHSPLk3VGl9op+BP5czNIvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=vgeKcVP+; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="vgeKcVP+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso21304e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791575561; cv=none;
        d=google.com; s=arc-20260327;
        b=Lw95csHAtW/xD73LtTbJctPYApr+8Tp4BNuc512QehLnI+Lu1//pUkzQoyMg7tYf9q
         CaY7r6TpDe7J4IPJilT2OBkAxwsw+oJxNiOtX5TV/l0XK79D1GtfyoTKEg6UOjsKkmVD
         L6NiKcBhihin38D97QJP4niNENr1oYVbtNmMW8Ny/e+xcrNjgbcuPZSmXW6JJAThH3hs
         7ddOOdWTd7hK4mZCmqFr0zGmDl3C69AH3MOfCfRyDCeDPRaDqiA0bN6385FyEqmqtP2h
         RaOwcaHLL2vpuCxCkrxJ/LFrSyHQ9y6k9SoBQLLcfxR5Wa1GsHwHbm75RD8rEjBXa6r/
         hLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        fh=LfQqGYqMfhDvPBgEzsYxnF8FeRvNgqJt3aN0Plcr2UU=;
        b=VBIp3D/659kwhjRHj8x4wJAooWr1d51zEaGZtarafIXWWhQAGxpXrSzkaaJyP7GPeV
         LE2JxJGjvWB0kjqMF+tEkEg5iX/cW/WOJLPxqcui9x0Gq0vdot8bDQQCS3AP56HvPmeC
         zEvDK8ZMnkxaJRuwz9ssAUP06vh9BUM7dS93dq7/zcEeDX0a7K65U41s4WDAk1rx/Bwr
         FNM3O6bsIsvjIuO7ZZ2tvxnj7+5HmrA1ckYDoQppu51Vn4sfi3zVtsq1gNdsNbtwjw7Z
         tvwEazWrVZmx/vbR8CzHj2bwEi/O6zD8WNNbkAi/mHObx5qoVmDtLib/R1jyqqycEW7J
         x9uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791575561; x=1792180361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        b=vgeKcVP+wYgPLz4NnmhxxWhXCbKuyKqA6W8IcW3o+VF5mZCXBQBDJLRlwQPQFMGrYW
         t9BcnlqXQlX8FDX/GNgdfMOEy5ZrPIcy19wRyvvRdmC4hw5iZu08kf/Imv5b1+VPuvst
         iLUxsqFX1a8hnnty2iXltM6zcIK9UJ46mIOj0ecbTVQflv22tkmWeLuaucANb92pL6rM
         uzTyymxQDvgGS5p+xNhmmlCYuBDaGO0ClSS9kT2ktk8lFFGBJNqKE04cfjjdgusMGa8B
         lJr+7wojnVcdKqymP5urAH1m5IZRI1w2Ze4rSu7Fk5FIyZJIgtkEgYyDl6OS30gt11AD
         9Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575561; x=1792180361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        b=VinXE1VQeiJqVO+hwscVec7LvE1PjMeOmAeGN+12q72xhyEZDj8evFikFnOgCX1A5P
         ouBRKfmyCpc/4SSxXn8O1aa+n6fsBBnWA8/Om3DtkD7lR/XkFBEJYDk7swZu9n/PM8bW
         qpRe1j+JFu+PUJpjY+XykliVOB86gAoaemFf0sT5zCKpqszW4u8j6yRYLFbxlugoTEWf
         7AgIY4mWvJ7fkiLLpEoKX8Hu8ShkqUqsL7InDvr1NBiZDN9bE+F0ibLooi0OgofAwlHX
         bL2r0jormBLb0VCvG7BXBOQIc85b1Ut4U7GRfNAJ5NMQshGqVkHbqv8ICMzfBYW2D+aZ
         tbeA==
X-Forwarded-Encrypted: i=1; AKwUvBwHfY4dxoZskR5T+pQH8/2jhx1exqJjiL2L/ZePq/hPYRs0XZ1uSr8q8jX4MNrhRtkxYrkD5I4hINzufTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpCCmhHv7kSTcMSbvvwJYN/BMLXUntlAnC2TpmlgzzcG0QiMa+
	Xp9/9t6EJGjAgtv8RxZP7mDKcCn14U1Y7OdxELZPuo5YeIUhGBDwptdt/wJEzLsq4fwq6T6A+8+
	U5QwpuOczdr1vBpU2x4KrxTJy2P9b2oQgIPMouASiZg==
X-Gm-Gg: AYBFou0T00Jy1dTDujn7LKzaBBYNbqP7QPnwxaYNdA/+wyT21qAJkVQvX1124WoV3DY
	nnVu32O4kLwsNTr3bd+2DyG0Yrh8dqjC+XoEnbZZ6X4nPoAej7ZAWDykOqWzCYSOYn2GXl5Nm+q
	0g/1OJ3MugjoOCpyjGM6RbE1M8fllgZuY+b8n1pjfrVLd7WXHLepxe2yAumD3sO8MkBUgNIZkbW
	8IaqvfrF8IBiImjhTnlKhrniiSQuZJKx7wdSra9g9GWV5+TvGR0M8S0KG2BBr2edPS2Zrex/9j/
	9f6cmHJzPhXNwhEyJDhUDzihSMOPVcj1svhjDs//LaGZX82lcZivOSLppXDk6aAANSh6zVkqNGn
	L/DD0zId+yc7txnBLVfps9RkvPr1yRqpvEobdgy0BM+GgFdme/wWUkAtpeZOBxudM33A2G/+7rA
	==
X-Received: by 2002:a05:6512:6c4:b0:5ba:3888:7055 with SMTP id
 2adb3069b0e04-5bcde8d8587mr987668e87.48.1791575560885; Fri, 09 Oct 2026
 12:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917122012.2577-1-yuanxiaofeng@eswincomputing.com>
In-Reply-To: <20260917122012.2577-1-yuanxiaofeng@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 21:52:29 +0200
X-Gm-Features: AclHuK9LE_K8n8SBL5vcZdIBUie1cZWxyC_Q9G86b62TjkF_wne6tghiR0d8MC4
Message-ID: <CAAhSdy0CWoLshP7GyONS2E-wYOZF8hEjbBosOnc74LvtjkUbDg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix IPI delivery for out-of-order vcpu_id
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:20=E2=80=AFPM Xiaofeng Yuan
<yuanxiaofeng@eswincomputing.com> wrote:
>
> The SBI IPI handler walks vCPUs with kvm_for_each_vcpu(), which
> iterates by vcpu_idx (creation order) rather than vcpu_id order.
> Since vcpu_id can be assigned out of order by userspace, a vCPU whose
> hart_bit falls outside the XLEN-bit hart_mask range may be reached
> before vCPUs the mask actually targets. In that case the handler jumps
> to "done" and stops sending IPIs, leaving valid target vCPUs without
> an interrupt.
>
> Replace the early "goto done" with "continue" so vCPUs outside the
> hart_mask range are skipped without aborting the loop.
>
> Reproduced with a minimal userspace VMM driving KVM inside a QEMU
> (RISC-V virt) guest: three vCPUs are created with ids 100, 0, 1 (in
> creation order) and sbi_send_ipi(hart_mask=3Dbit0, hbase=3D0) is called
> from vcpu_id 1. Before this change the IPI is dropped and the ecall
> returns SBI_ERR_INVALID_PARAM; with this change the IPI is delivered
> and the ecall returns SBI_SUCCESS.
>
> Fixes: 0611f78f83c9 ("riscv: KVM: Fix SBI IPI error generation")
> Cc: stable@vger.kernel.org
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_replace.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_=
replace.c
> index 506a510b6..c2f1f7f26 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -64,8 +64,17 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vc=
pu, struct kvm_run *run,
>                         if (tmp->vcpu_id < hbase)
>                                 continue;
>                         hart_bit =3D tmp->vcpu_id - hbase;
> +                       /*
> +                        * kvm_for_each_vcpu() walks kvm->vcpus[] by
> +                        * vcpu_idx, i.e. the creation order, which has
> +                        * nothing to do with the vcpu_id (hart id) space
> +                        * that the SBI IPI operates on. vcpu_ids need no=
t
> +                        * increase along the iteration, so harts outside
> +                        * the hart_mask window must be skipped instead o=
f
> +                        * aborting the loop.
> +                        */
>                         if (hart_bit >=3D __riscv_xlen)
> -                               goto done;
> +                               continue;
>                         if (!(hmask & (1UL << hart_bit)))
>                                 continue;
>                 }
> @@ -76,7 +85,6 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcp=
u, struct kvm_run *run,
>                 kvm_riscv_vcpu_pmu_incr_fw(tmp, SBI_PMU_FW_IPI_RCVD);
>         }
>
> -done:
>         if (hbase !=3D -1UL && (hmask ^ sentmask))
>                 retdata->err_val =3D SBI_ERR_INVALID_PARAM;
>
> --
> 2.34.1
>
