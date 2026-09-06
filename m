Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28EA22AE65
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788686802; cv=pass; b=ZJLwnRSASQdQ1AA7YDlxzlp1vQgSv8oifd5j9wK88Mp2reiijYXQCqZm2al3Tefy/S4YRFeXjKpkjBIojSQSluXl0OEz7sM3LTvyfqDYym6BIKaaLkkpjpkjp+/vgJ1y+mgL3sMsDz3ihWdtZq8YelbNsX4YpzuI0vhmY4skV6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788686802; c=relaxed/simple;
	bh=cEKrnTatrqgp9q6ansCE++YyyCJnnQqYEhHs1asB6fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=didjTNUfcWDyKddwTONepmAGnOcCVZC6M8q+KdABdyANAnZ2a8rIA5JFyuhQoygR/9CFvwg15mWNVZGuBz3Ew6a5rVcYO4WZDfjCe1i9TSf5W4R9NOdNYcY7I3NYAC0HnBrYOW/67Qn9KGzg6pZiVp45IFRCSA3PYyFOU1ZFccA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=V0vs3tHC; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="V0vs3tHC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so18893235e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788686799; cv=none;
        d=google.com; s=arc-20260327;
        b=rzYAUdpA3gyEN8bXby8g0yUUnOzRzttzAq6AbKEX7HXBd7Z9iWzafSqLAvLBIfmUOI
         vUlE+tFIKzTZu6KYGK6mlZOe3M4ejvuem22QKlWoIIcUh6Db07S+hVsmYUxC0KUMHMqE
         NfVeXmItrEVQTxCGF+qg2nYq04w/Lc2KtbHLAu1d8NRyxFoxhyrdukox7BS2EyhFltgc
         0Dgfh16U4Dz7z0VeE7OWAI3jWnXQreLnkiPPAlqe3dzyTAk/QBvO+XY76SA1dxSs89yD
         Z+VGZCT9Fal+I6TDL7Wva1Y/WVBNHklHlfwn37u1pJxRnVFnsrzfrpLJIxkzt97/f6D8
         xlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3Z9m61R0Xcvfx1fOOb/3EA5UUxAFfOaOY/w1CnIwco=;
        fh=H4i1TmtUcxiKhLORTiF/tsV2Lj9Idd5MN6yn39+E5mY=;
        b=gHfVs9so/yylqzrTuMifVkNTYWt1lc+94iMkWM2jZvaXiMJCmUoyLLk3X3j8qTgD/9
         1OWPEgI6RMALlxNe1TcSg1ZLJxB51s9fGjSF+/CmAduv9HhArJg+9xlx+lCCEeaSEWLb
         kmvfMt6sDdwJ0NoFsJq7Yc0Wrz+1oW4AkxC5H8LO4Hv1b2r7lnqplOJeOZhuvA5E9frY
         Y1FiOZEIZvGfZCqu+DUM41k2ksdw/zLg9WHyZR0zFUJUBjaBrNdkOSLWCAVnROFAVTLx
         RcO09Uhbia1yXt720RPl23jc9S+Lm2WB2/Tf++3gfHB5KN6mK02dH4IhqluUPSIuZ27I
         lScQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788686799; x=1789291599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3Z9m61R0Xcvfx1fOOb/3EA5UUxAFfOaOY/w1CnIwco=;
        b=V0vs3tHCuoo/AWweZchEelS11jlPfykpbh+xhCr4izvHsQbi7Udr678LekfcFk7m4A
         cfV6qb+omb45PPAymV8Y/FSMvHeMvPldpBx1dF9fergnkPe3yIjw+AU71QBUMp1wSZw9
         PbguZyl/T0/GVyeybYvSrAzo9RU11Uhpd1sXMJ+UAofIg97CFlTmq15tc98GIOMV6F9N
         h15FjxstDzlfxzagjeVRA4y2lu7yhpJj3y0B8+fFIaFQWcANH35fEz+AwhXQJdqrggWm
         fBaIRcQcknUvAcEkSxc88kpnLULPBn7OmP8RjNzsFO6X678YMmd0NL6Xz1Qshkjhuo1a
         Q8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788686799; x=1789291599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3Z9m61R0Xcvfx1fOOb/3EA5UUxAFfOaOY/w1CnIwco=;
        b=o2ufIPRh7QmzUFXBTumpebm3Yu7obPER/nHBqXeB2mjdaiA9S8Brb7K+WSQpvWLRJ8
         6zwJgE07I6B+rrtWh5Qw56k9gfs0pCRuSrCpzGcQL2aRg6ofdsnwqzSBUS6wmdZ55kxP
         GGy9RpkwG4w17qkQFOJLU4Ytnv07NJF0414BeiEqvRQBB0M01xGGP3hO23wn5Yq3dJ6v
         V2jIqO6qU0B4sjBdq0+/OuhSsZRarDmfB70p6FVrBCkxyKeRFD99GqL7xpBDb8uWuWXF
         X45wA4HzrCh7MJMyLQN0di9BnT9YKz329bQdBW+47SnhtYPjVm0B6cecks6jSVVNCU+a
         +rFQ==
X-Forwarded-Encrypted: i=1; AKwUvByKUgakTXe7ja+zXoRvZGzVOBnU6A3ZiQZ29uXbYD4MPhUYIKXmYjs5WOpRm4gc+UxIlj9QUdB83DEBp88=@vger.kernel.org
X-Gm-Message-State: AFuF++l05FK/KNnLGSYUOYzrt2/Cvv1JvltoAgJGakpOadnojZJEfNUF
	QysL1mp9gOdUvv8G8y06THUkAgiWtiGkCpEUVPXQosBrv039x4OfWjmxqIfb6vAZfiDkolhDFHm
	pOfPChZiIiT7mfWDtW+cdaS5joRA8/LIXHipUhMn/5w==
X-Gm-Gg: AYBFou3yTYCa50MGHXHCFI1SgmLztKO+eKacFDXqaoyi7RRHEnSGBlVpVXgVyV2Qs6y
	G8RDzUHOgz90Xz2JDfi3ybIWuJrGJgN1R0bz/D4Mf7u2Hj3yWst/xd89/oPbayy+f3/ck3PTk0Q
	tVMOVipR7eE3UdQXc/+M4L0VIquOa8vVYwhEyBoIFDcK6nCD08L53tO7B2Pxz+XzlhYMKBYaejm
	fRYmJP+/InyAQ7K0XhvyE4OhYHRXj8gj90377XtFSIyKRtFaqPsxjwUgvFfMAqKpXAm6HgF3p/W
	RvIcOTKTgHeYFog4fuk8T72tVyeX7DqCb1Yk5lLIDlwa3CxL4itDplSPnj0Nr4jUwvjtUMa+Lxp
	e7WU1QuS7t29tmDflCKhHumbZ2OxIfm/4NzZEgcMO8Ey9ayzjPuc043ksZOX3SxA=
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id
 5b1f17b1804b1-49cfc6cc0f4mr134459275e9.25.1788686798530; Sun, 06 Sep 2026
 02:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
 <caplitmus-rv.4882de641c0d41f9bef843fe41b3084f.imsic-zero@163.com>
In-Reply-To: <caplitmus-rv.4882de641c0d41f9bef843fe41b3084f.imsic-zero@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Sep 2026 14:56:26 +0530
X-Gm-Features: AcwNN1XPksXVzh3FfoA4HfbE_7dEgAQHtrNhUuQ_Fviya_2o7CNRojIaWVMEZmI
Message-ID: <CAAhSdy1LPUy51RCc52kRv62Jdgi-DL=64J-p7RXd1Y11dvXXbA@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/riscv-imsic: Ignore unused group index shifts
To: Pengpeng Hou <hppiscas@163.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Bjorn Topel <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:38=E2=80=AFPM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> The IMSIC parser validates and uses group_index_shift even when the
> group index has zero width. The binding permits a zero-width group with
> shift zero, but bits + shift - 1 underflows and rejects that layout.
> APLIC MSI setup also validates HHXS although HHXW is zero.
>
> Only validate and clear group-address bits when the group width is
> nonzero. Use zero for APLIC HHXS when there is no group field. This also
> avoids shifting an empty mask by an otherwise unused shift value.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early d=
river")
> Assisted-by: GPT-5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
>
> diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-=
riscv-aplic-msi.c
> index fb8d1838..569b3ff4 100644
> --- a/drivers/irqchip/irq-riscv-aplic-msi.c
> +++ b/drivers/irqchip/irq-riscv-aplic-msi.c
> @@ -223,17 +223,21 @@ int aplic_msi_setup(struct device *dev, void __iome=
m *regs)
>                 return -EINVAL;
>         }
>
> -       /* Find first bit position of group index (HHXS) */
> -       mc->hhxs =3D imsic_global->group_index_shift;
> -       if (mc->hhxs < (2 * APLIC_xMSICFGADDR_PPN_SHIFT)) {
> -               dev_err(dev, "IMSIC group index shift should be >=3D %d\n=
",
> -                       (2 * APLIC_xMSICFGADDR_PPN_SHIFT));
> -               return -EINVAL;
> -       }
> -       mc->hhxs -=3D (2 * APLIC_xMSICFGADDR_PPN_SHIFT);
> -       if (APLIC_xMSICFGADDRH_HHXS_MASK < mc->hhxs) {
> -               dev_err(dev, "IMSIC group index shift big for APLIC HHXS\=
n");
> -               return -EINVAL;
> +       if (mc->hhxw) {
> +               /* Find first bit position of group index (HHXS) */
> +               mc->hhxs =3D imsic_global->group_index_shift;
> +               if (mc->hhxs < (2 * APLIC_xMSICFGADDR_PPN_SHIFT)) {
> +                       dev_err(dev, "IMSIC group index shift should be >=
=3D %d\n",
> +                               (2 * APLIC_xMSICFGADDR_PPN_SHIFT));
> +                       return -EINVAL;
> +               }
> +               mc->hhxs -=3D (2 * APLIC_xMSICFGADDR_PPN_SHIFT);
> +               if (APLIC_xMSICFGADDRH_HHXS_MASK < mc->hhxs) {
> +                       dev_err(dev, "IMSIC group index shift big for APL=
IC HHXS\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               mc->hhxs =3D 0;

The IMSIC driver already ensures that group_index_shift is atleast 24
irrespective to the value of group_index_bits so this change is not needed
because in the "bits + shift - 1" the shift is always >=3D 24.

>         }
>
>         /* Compute PPN base */
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index 9505ddbd..44b9c34c 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -741,10 +741,12 @@ static int __init imsic_parse_fwnode(struct fwnode_=
handle *fwnode,
>         }
>
>         /* Sanity check group index shift */
> -       i =3D global->group_index_bits + global->group_index_shift - 1;
> -       if (i >=3D BITS_PER_LONG) {
> -               pr_err("%pfwP: group index shift too big\n", fwnode);
> -               return -EINVAL;
> +       if (global->group_index_bits) {
> +               i =3D global->group_index_bits + global->group_index_shif=
t - 1;
> +               if (i >=3D BITS_PER_LONG) {
> +                       pr_err("%pfwP: group index shift too big\n", fwno=
de);
> +                       return -EINVAL;
> +               }
>         }
>
>         /* Sanity check number of interrupt identities */
> @@ -773,8 +775,9 @@ static int __init imsic_parse_fwnode(struct fwnode_ha=
ndle *fwnode,
>         global->base_addr &=3D ~GENMASK(global->guest_index_bits +
>                                        global->hart_index_bits +
>                                        IMSIC_MMIO_PAGE_SHIFT - 1, 0);
> -       global->base_addr &=3D ~((BIT(global->group_index_bits) - 1) <<
> -                              global->group_index_shift);
> +       if (global->group_index_bits)
> +               global->base_addr &=3D ~((BIT(global->group_index_bits) -=
 1) <<
> +                                      global->group_index_shift);

There is nothing to be fixed here.

For group_index_bits =3D=3D 0, BIT(group_index_bits) - 1 will be zero
and 0 << any_shift_value will be 0. In other words, global->base_addr
won't change when group_index_bits =3D=3D 0.

>
>         /* Find number of MMIO register sets */
>         while (!imsic_get_mmio_resource(fwnode, *nr_mmios, &res))
> @@ -854,8 +857,9 @@ int __init imsic_setup_state(struct fwnode_handle *fw=
node, void *opaque)
>                 base_addr &=3D ~GENMASK(global->guest_index_bits +
>                                       global->hart_index_bits +
>                                       IMSIC_MMIO_PAGE_SHIFT - 1, 0);
> -               base_addr &=3D ~((BIT(global->group_index_bits) - 1) <<
> -                              global->group_index_shift);
> +               if (global->group_index_bits)
> +                       base_addr &=3D ~((BIT(global->group_index_bits) -=
 1) <<
> +                                      global->group_index_shift);

Same comment as above.

>                 if (base_addr !=3D global->base_addr) {
>                         rc =3D -EINVAL;
>                         pr_err("%pfwP: address mismatch for regset %d\n",=
 fwnode, i);
>
> base-commit: 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515
>

Overall, this patch fixes nothing.

Regards,
Anup
