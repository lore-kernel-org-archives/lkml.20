Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BB2DB794
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960833; cv=pass; b=Bi9y1sWXWxsFvD7Fwhewt1WR4NpKbgXfRjmDAbZZ/Rw82wQR4kV9DJuMG3VRVz7crIv0Ad5IZkewUfY4vC4sEWkkGhnEythr8dNa5uIqrauk7RHAd8eznnwtaWmQaeW+4Z4ZMCMpRV58/hfP8Gzsw80wPkQahc63287uCVJzpcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960833; c=relaxed/simple;
	bh=/JVc5nbfPS8ws+PmjIyM03dVbbujFBnhP4v7uCrn63Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORnQhJdDg8/ZKqKXk4EQxTwiwB+1xcpPkYQoo9zG+rWmv7k/nlz5JK8I9ItTKhQLGQKnN0Kharoe4GqfRKFibw1tDf+tdZEHRpKA8ldwFhz9EiM6tNJgXjRUtmzvuIEHJ21bMv8qQYAeKmer7DpJsEUT9ugKYcAN42Fwq8cVtwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=Vkfx+E37; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="Vkfx+E37"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so23087f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960829; cv=none;
        d=google.com; s=arc-20260327;
        b=Ecgh0o7qLoAHmlsutXVEi1vVwkyFA1GPwKTgaUfZtjaHsVmH6fmwPiFg41kDV348Qh
         OSw5sdNRlH4PC98wK5rZ8UL8LWTaRhOVg4oZXdYkerAsfswDntCAmNZpPQQecETay5wt
         0BgbVHIWIcD17doLZwiN1tRimYxZuNCe9TREcPhNPa5hBZ+4iT/BSw33ar/cAMIGeJv8
         oZaYsC5XnCgQjv/NGHylf2njYKaDyhAoFm7hiNMQoxqtj1wKJwzyHl1ePjKpv3u50XcL
         mwNf4YNjPNKdSM3pcKJUep4r+eayAFg/iJuMgA0SNLeQbnEKj7FUf+SVu3QP4C8DYB4M
         aawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRAF9fjGwIYHesPfozv5hf5MECp6k/GYZrrLDm0L2Tg=;
        fh=ULVeLBiBmbtoakaOXAR37cJ1NGIiO3nqdDjO/KKoTFc=;
        b=LPjItj60YGWnCz9EJkSgZmNLVdjopJ/MuZDycavsMTOQwpIdkPLyfSCw44W/4s/ybK
         qs3S11n9FjrjQRdVuaNgJFtNQDfV0TqasrAkdbxZrtR7lzIZAlzDjxBhshyBExRbCvlC
         0komBwtseuy0cvNbkryHsNhmbPY7riZ2DuFNQRMkvVYvRh2JQaoQ5llOwNgkVVtOcA8T
         be+NzeQdqfGO/0C9Mwdbpnny4SWN6OwDYHuwSoMDVhAnE0EslIOx26qUQMSoMd6957O1
         /Ih4l8OaIS+8U//Ivzg4uOuEqcRGaKjU9SlJWX1Y51YwktkQkCUXcll2DyjvDAA62snb
         uwVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790960829; x=1791565629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRAF9fjGwIYHesPfozv5hf5MECp6k/GYZrrLDm0L2Tg=;
        b=Vkfx+E37PBmR9eJdXtE52qzoqZkcdNykpfvf5YWkr4lgs8zZapOo/rC/uopAoefhki
         9RGwXXf8hb59SeXijETiWnwaPRqqpbBk2zVBd5F/Co5YP6mJP9yfq3U88JzulUrQ49Zh
         WVA922YqGHy7s5jmh5x0lPdJBjzfHK+yp7r2RrPmzRq4x/iSnuETZTweHFyx/qt4aMN/
         k1QabZsdzBN4iEMxYR9XAk0P3kEpo68Otv2Gt35IHrTlwlbck8xHkSTDguqVae1SHSEi
         SJf4XMkPpYU5rZA+U1HwJajgLE1ji0+ZwHPn0KGCUFEllFAGpaqRU5hrMmEhusSl1poE
         LAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960829; x=1791565629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRAF9fjGwIYHesPfozv5hf5MECp6k/GYZrrLDm0L2Tg=;
        b=fAhZELLQXgkPwovEPBL6asb712UUKidfukEaF2W9+thQ+vd4vd9SCAfuhxvNWh3swt
         vYEr4PjfEaCN0NyfeWg4+3PieXkWz2ZRPNG6glhg+6yf7AIV1pt2kY444BfIFeDdyCLA
         876wGHKYl4RVq1BPACs5pkcrNAX4/Gri8pYSbmrWtynP31ide6BTrKf697l0jGlOEmR1
         I3kzHSURr47CZDAy97eGLWVys+zKaLBUKQekx5kpFabUDjsLYmaQWuKYh+qPnTEhSwWr
         wF7+9+DYzF/6frIpmZ+DALBDpE0KiOAHIf6XAExQcgjAG6wzmZHcUT7AAh2nokRPO6Pg
         6J6g==
X-Forwarded-Encrypted: i=1; AKwUvBxe5/yxCfj6Q79VZ8B+eXryqYbWEEK/bqI96Bat5tygdEfr52x8dQ5N9gJFMPVQc0d0PSPFjhf76txrRok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsYYT73viVWrIBTI+0HEyV7yNim0kOgrCLRyQiksaVSqLMPDct
	goIYtcOnSh4otNXnlXoWqW30JfV8vaFTyrotLP5zk3BCDyzweklSuTH0QqxIXnHP0bF1LrOGs+M
	9YomXEYSkoNrOhpFG6D1xY7carZOiSnxTWKjsUsZPXg==
X-Gm-Gg: AYBFou3HydFCYy/UlAx0MaCVk45QuHhIUJCwoAPOHjgMo7OJDEh4STtkAJ40UAXlGqb
	ULRIi1SQ7pgUa/FWauzyF2f/hMbFYDyQEyghq0G8EHAM9v3wHfP8vjuHd6n33iTbhr99VXk534t
	phaf2zmXoiaUsh9amPM3ooixfPvHN+77dIYkYyg7bER4y8eiSEVuQpHrBPTjx2QdplBu9yvtGUm
	7Pymd1qv9h1kQ8qokYpOYdbZMsS2UzQMFXEOeZKt5bExD4s7xNorGB47pJ6I3nu6JbMYyii5KWr
	xHkWg4c4ly5rLq2x5Q6yaVm7Tlwo0zbFRJrs7wmk7gXnaRG8/9fgIbLC/FLwWPasYGH/+rYKHob
	lJfYsJta2w0B83Pt3Jcf/ehmT30NWJnwXIN5cz4jo0/l17GeFmyGKFrTpCGWqNw/iCYM8RNLnJt
	k=
X-Received: by 2002:a05:6000:98f:b0:48b:116d:56fb with SMTP id
 ffacd0b85a97d-48c47c66e18mr153844f8f.1.1790960829073; Fri, 02 Oct 2026
 10:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2026 22:36:57 +0530
X-Gm-Features: AclHuK-ubBdUYjWUG1h1QKLotxslbT8a1w5X5HriAuAQT2PubWA5bXeuAQfD03U
Message-ID: <CAAhSdy2prY0pkfpMxXqyJWKXmy4B49MpmvaaV+U97BxL9ie92g@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Expose the fwnode via the global config
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: tglx@kernel.org, radu@rendec.net, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, prajwal.n.oss@gmail.com, 
	Sunil V L <sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Sunil

On Fri, Oct 2, 2026 at 5:34=E2=80=AFPM Prajwal N <prajwal.n@oss.qualcomm.co=
m> wrote:
>
> The fwnode describes a global property of the IMSIC interrupt
> controller that is equally relevant to external consumers of
> imsic_global_config as it is to the imsic_priv itself.
>
> Keeping it in imsic_priv forces the external drivers to access
> the private structure rather than using the already exported
> imsic_get_global_config() interface.
>
> Moving the fwnode into imsic_global_config makes the public
> API self-contained and eliminates the need for callers to
> access imsic_priv internals directly.
>
> Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
> ---
>  drivers/irqchip/irq-riscv-imsic-early.c    |  2 +-
>  drivers/irqchip/irq-riscv-imsic-platform.c | 18 +++++++++---------
>  drivers/irqchip/irq-riscv-imsic-state.c    |  2 +-
>  drivers/irqchip/irq-riscv-imsic-state.h    |  3 ---
>  include/linux/irqchip/riscv-imsic.h        |  3 +++
>  5 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/ir=
q-riscv-imsic-early.c
> index 12efd241ce88..769849147148 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -75,7 +75,7 @@ static int __init imsic_ipi_domain_init(void)
>         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
>
>         /* Announce that IMSIC is providing IPIs */
> -       pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwno=
de, IMSIC_IPI_ID);
> +       pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->glob=
al.fwnode, IMSIC_IPI_ID);
>
>         return 0;
>  }
> diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip=
/irq-riscv-imsic-platform.c
> index 643c8e459611..95ff76e63a69 100644
> --- a/drivers/irqchip/irq-riscv-imsic-platform.c
> +++ b/drivers/irqchip/irq-riscv-imsic-platform.c
> @@ -313,40 +313,40 @@ int imsic_irqdomain_init(void)
>         };
>         struct imsic_global_config *global;
>
> -       if (!imsic || !imsic->fwnode) {
> +       if (!imsic || !imsic->global.fwnode) {
>                 pr_err("early driver not probed\n");
>                 return -ENODEV;
>         }
>
>         if (imsic->base_domain) {
> -               pr_err("%pfwP: irq domain already created\n", imsic->fwno=
de);
> +               pr_err("%pfwP: irq domain already created\n", imsic->glob=
al.fwnode);
>                 return -ENODEV;
>         }
>
>         /* Create Base IRQ domain */
> -       info.fwnode =3D imsic->fwnode,
> +       info.fwnode =3D imsic->global.fwnode,
>         imsic->base_domain =3D msi_create_parent_irq_domain(&info, &imsic=
_msi_parent_ops);
>         if (!imsic->base_domain) {
> -               pr_err("%pfwP: failed to create IMSIC base domain\n", ims=
ic->fwnode);
> +               pr_err("%pfwP: failed to create IMSIC base domain\n", ims=
ic->global.fwnode);
>                 return -ENOMEM;
>         }
>
>         global =3D &imsic->global;
>         pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
> -               imsic->fwnode, global->hart_index_bits, global->guest_ind=
ex_bits);
> +               imsic->global.fwnode, global->hart_index_bits, global->gu=
est_index_bits);
>         pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
> -               imsic->fwnode, global->group_index_bits, global->group_in=
dex_shift);
> +               imsic->global.fwnode, global->group_index_bits, global->g=
roup_index_shift);
>         pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
> -               imsic->fwnode, global->nr_ids, &global->base_addr);
> +               imsic->global.fwnode, global->nr_ids, &global->base_addr)=
;
>         pr_info("%pfwP: total %d interrupts available\n",
> -               imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1)=
);
> +               imsic->global.fwnode, num_possible_cpus() * (global->nr_i=
ds - 1));
>
>         return 0;
>  }
>
>  static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
>  {
> -       if (imsic && imsic->fwnode !=3D fwnode) {
> +       if (imsic && imsic->global.fwnode !=3D fwnode) {
>                 pr_err("%pfwP: fwnode mismatch\n", fwnode);
>                 return -ENODEV;
>         }
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index b8d1bbbf42f7..ae982f89318b 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -813,9 +813,9 @@ int __init imsic_setup_state(struct fwnode_handle *fw=
node, void *opaque)
>         imsic =3D kzalloc_obj(*imsic);
>         if (!imsic)
>                 return -ENOMEM;
> -       imsic->fwnode =3D fwnode;
>         global =3D &imsic->global;
>
> +       global->fwnode =3D fwnode;
>         global->local =3D alloc_percpu(typeof(*global->local));
>         if (!global->local) {
>                 rc =3D -ENOMEM;
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/ir=
q-riscv-imsic-state.h
> index c42ee180b305..178b678f5c0f 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.h
> +++ b/drivers/irqchip/irq-riscv-imsic-state.h
> @@ -44,9 +44,6 @@ struct imsic_local_priv {
>  };
>
>  struct imsic_priv {
> -       /* Device details */
> -       struct fwnode_handle                    *fwnode;
> -
>         /* Global configuration common for all HARTs */
>         struct imsic_global_config              global;
>
> diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/=
riscv-imsic.h
> index 61af3a5bea09..b7be1aad7774 100644
> --- a/include/linux/irqchip/riscv-imsic.h
> +++ b/include/linux/irqchip/riscv-imsic.h
> @@ -46,6 +46,9 @@ struct imsic_local_config {
>  };
>
>  struct imsic_global_config {
> +       /* Device details */
> +       struct fwnode_handle                    *fwnode;
> +

Now that fwnode is part of struct imsic_global_config, I suggest
having another patch (on-top-of this patch) which replace the
imsic_acpi_get_fwnode() function with code sequence accessing
fwnode from struct imsic_global_config.

>         /*
>          * MSI Target Address Scheme
>          *
> --
> 2.43.0
>

Regards,
Anup
