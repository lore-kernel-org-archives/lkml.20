Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1674D598E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351576; cv=pass; b=Te4dzC4ZLZlem9k0Bjz1bf68GblazTOW+6OOXAAcoYSzTo62uK2X2q36jmmiwUUTd83yozSPLtHvS6ITFot8xYP1s8dFvSBnRZTwBFH3mscCGnhtsFp/NQfz4IBHtzbM1QfhIAVlWRMSY2j2vfXe3fksLsRDQBc+H6G0rttx6Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351576; c=relaxed/simple;
	bh=AWFiB9V++G9Q22T75aL/cEXhoU4UPD1FL5xpucU1Mrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKEfls/rKeRID3+5Us4fdfDESXlj9k7A9PtCkQy1JTEAhQQosVez7RClFcj++o7BsKIpCIKlbaxtP19J+wGqD5dXIwlI9+KLe9A1pbS6VKV4Aw9qRjbHqlQIN8IMpPlXbVtiI/GU4hdfodXtoDLNnE6WRrh7OBpmufMpzOJ08+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=cUZHEBgS; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="cUZHEBgS"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887d06c669so759029f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351568; cv=none;
        d=google.com; s=arc-20260327;
        b=cs8Nx/brQUNAnDahG6ZTPeZpXozGX3wQjJSsnbS8Fm1gQDf3Ve6QtT/nhUefQMfMpW
         fZaSqBYIKoAUhcxyuzAveFpbt78iavXliEcJggFjTU61drrX0G3MJAYe26yS/4V7v2ig
         fv9/5PsUAuD9he5Pevanh//+0zd3nH3OSsYK7/yUfHWc9MthCI+CfENjRuSlgAw/HNW2
         AR6gLUYz6UTg9v9+CJFNNEZMXYYMhXZ+dOt8lgV8r/MZvfSjExAtXz+u7gA4oV+jVc76
         RUx76GQPyb2S6CkTR0v1hHeGJyzqjXBonjYtEXXBT0o8H9cxwvVXy4AAg72viYrdSF7X
         9WCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=utwZNZ9pY4Xx5gq59KUjA7owWSl05dTqrvQ9otynvfA=;
        fh=L2qrFwXTpG6QHd5gabc3quJuxBGzfkK6/QiJKa2DnVM=;
        b=gMQ4on8ZdosEwDhyD0+BUxA+ckzsfid/VCq5ph5BnNCqO0Uqf1CxpFL1n0zjHG2hXG
         kHLJu0FJqojLmyfpj4cXd8hnOaJ8C79R20igfPYz9XqsPJeR9ouIgt2cOzhTKY0nNYLO
         nZXVj2N3xkzpWANX745UZbjd5fB5PIqssAYEO4+nJneWRZIdtfuvZLGCpni4DLDyGA91
         e0PR8NRQgRjbqDh/8jtnoq4OkCME2CDOl+E9l8DKcxaRZXFKk9er/DF0iQa/P3X7K8bs
         yhyg7yHCAkFq+uSMGYR7qwR9Knee28oGHzkImdgqow7+VPuzTamqCToHVlZ+vBBAUQ+e
         9/Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790351568; x=1790956368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utwZNZ9pY4Xx5gq59KUjA7owWSl05dTqrvQ9otynvfA=;
        b=cUZHEBgSoxzRyOLauLlptBiqz56Usp1pPF/v8Ljlo401sYt72n4Hofz7DOHWAZbxtP
         QI2B+n3mb8moUAn++DJYPWZJ9xge8o9WBjbMyvfvFDmCt+eUlyaldENyfqk1zXaUPK7x
         +b1yj/qVkCG8Dql1pGv8Ek06hnmarMhx697ziNVyyo6xhWM2ctDDee9m9i19EGAi/Ss+
         Mu7sSqujI0uLZdRoPsrSIRbcVzQuvuROUIyN+YohL8n9nQBArDjYJpYVsCGGGfuJQ+WH
         H8yLEhW9GGRvRBxPLgxryyHLpchBY/80r4V1M542qSN1wZ/eOLnCxgFDDAX2RoyAOTnY
         tmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351568; x=1790956368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utwZNZ9pY4Xx5gq59KUjA7owWSl05dTqrvQ9otynvfA=;
        b=NT5ppcNsES5yGawF4nRguQmxyBig3cCL/30l1KTxxHmyYcgzVI6MFQ+KFDU0yX6zJI
         A5cmSgntYvDw2ws1F6G5BrI+2+70yqElThg5h7NrXFHY/hyBeJhntS2Le9aO9OCvtt2Q
         9Y4NpG2HyKxfmobM8p0KUlBv7swdwEIdfYV3KsMRTULCiz2gLWOKvQhUrGIq1tz97/2Z
         CpW1DJvbsrfL5boD34rMk+nNrpCkG5wCWTtvAH8+y9lZ/V/cx0LPeoj+JbbVTazBedlZ
         dea+uOWcE13fq1woPyGoPPKjR+3DKsvsQJf2WopYKFF7pnUmZFWrp+dr+df1vkUDeTAX
         +v7g==
X-Forwarded-Encrypted: i=1; AKwUvByEeln0mpj6R4HpYeJvqglvOTlPVnC+4DvGucRmG8siFCTCXjoTjbm61DkTSKOxrUpzzpP+RjcMSsCxBNg=@vger.kernel.org
X-Gm-Message-State: AFuF++n0gA5s2yxdUyHIIrLMwql0kyOfx7j516JXVvudZ6CJ8mPrj0At
	eANV9kN+XtsRxb5TTQ2RC5ajINYTz53PtLL2IH848yfu8dOXZ8Jm52MLZqAxK4IFbDMk1/HLq0Q
	XPnBykXgY9BKBl86oMfgR0L6MEdXNkXG7TpG8wEiJ6w==
X-Gm-Gg: AYBFou2rocURr3fb9G76kZ8BW8De+tw7SHR2gmXuxGAMJhAF6Gvh/DgwXYXp2Z/PvT3
	8/OGtb1veH95syQDOouOP/UqbT35PVLUXoHeNeeJvzidbm8i8PbUt3dXzn0wQU//gUR1SElI0IU
	XK92rrqEtChApZHIL7/9TyprZkYQ2xyTaeC62aeDHlX3Lub/BSMz8SQuLsYrIYIy94H8qn0kYTa
	ifFkUwgi59PsmAV41/dXKKg3+IxslVygTEXbepCJn8NQGu5ULfatcHkFwLbg1AdoRV+uPWSVcPP
	ZYInL1aIUfxdGb/rGsh1i3qv3ZHi6ePC+O7HyakS5oUj8MzW8Ws9juuQA5BcfTgRlXzIS9WITIu
	8vUzpG5WLoFkA2xlTN7JfbmNlCRzyemDq8eXuuJQtIlzuO7w9jCdDV8hCQ0tUCm7SWgnNRDtU+A
	2NO1uPeqZEEw==
X-Received: by 2002:a05:6000:4b09:b0:488:6072:c0bc with SMTP id
 ffacd0b85a97d-48872a5d9a7mr10536030f8f.4.1790351568022; Fri, 25 Sep 2026
 08:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com> <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Sep 2026 21:22:37 +0530
X-Gm-Features: AclHuK8pWQixNwcDzjZHyMQnruKEEP2VO1eZ6phkF3nVvr6l2DhyRC2oXU3yBTo
Message-ID: <CAAhSdy1a-poX0KKrHThmOzvSnLQVwDQdY_Anz3=zjSYOcboPJg@mail.gmail.com>
Subject: Re: [PATCH v6 11/16] irqchip/riscv-imsic: Support IOMMU MSI address lists
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:47=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
> target into one contiguous IOVA range. MSI message composition therefore
> needs each target's position within that range.
>
> Prepare the complete IMSIC address list while allocating an IRQ. The
> list is guaranteed to exist after IMSIC state initialization. The IOMMU
> backend maps the pages and caches the contiguous base IOVA in the MSI
> descriptor when translation is needed.
>
> When the descriptor has an IOMMU MSI mapping, use the selected logical
> CPU directly as the page index within the IOVA range. Use the same path
> for initial composition and affinity updates. A zero iommu_msi_shift
> means no MSI address translation is required, so keep physical messages.
>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

LGMT.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  drivers/irqchip/Kconfig                    |  1 +
>  drivers/irqchip/irq-riscv-imsic-platform.c | 24 +++++++++++++++++++---
>  2 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 20b77fbc51ee..a038e1121be3 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -651,6 +651,7 @@ config RISCV_IMSIC
>         select IRQ_DOMAIN_HIERARCHY
>         select GENERIC_IRQ_MATRIX_ALLOCATOR
>         select GENERIC_MSI_IRQ
> +       select IRQ_MSI_IOMMU
>         select IRQ_MSI_LIB
>
>  config RISCV_RPMI_SYSMSI
> diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip=
/irq-riscv-imsic-platform.c
> index 643c8e459611..ddb2bb570cdc 100644
> --- a/drivers/irqchip/irq-riscv-imsic-platform.c
> +++ b/drivers/irqchip/irq-riscv-imsic-platform.c
> @@ -10,6 +10,7 @@
>  #include <linux/cpu.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iommu.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqdomain.h>
> @@ -69,8 +70,10 @@ static void imsic_irq_ack(struct irq_data *d)
>         irq_move_irq(d);
>  }
>
> -static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struc=
t msi_msg *msg)
> +static void imsic_irq_compose_vector_msg(struct irq_data *d, struct imsi=
c_vector *vec,
> +                                        struct msi_msg *msg)
>  {
> +       struct msi_desc *desc =3D irq_data_get_msi_desc(d);
>         phys_addr_t msi_addr;
>
>         if (WARN_ON(!vec))
> @@ -79,6 +82,12 @@ static void imsic_irq_compose_vector_msg(struct imsic_=
vector *vec, struct msi_ms
>         if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
>                 return;
>
> +       /* A zero shift means no IOMMU MSI mapping is needed. */
> +       if (desc->iommu_msi_shift) {
> +               msi_addr =3D (desc->iommu_msi_iova << desc->iommu_msi_shi=
ft) +
> +                          vec->cpu * IMSIC_MMIO_PAGE_SZ;
> +       }
> +
>         msg->address_hi =3D upper_32_bits(msi_addr);
>         msg->address_lo =3D lower_32_bits(msi_addr);
>         msg->data =3D vec->local_id;
> @@ -86,7 +95,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_v=
ector *vec, struct msi_ms
>
>  static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *ms=
g)
>  {
> -       imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
> +       imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), ms=
g);
>  }
>
>  #ifdef CONFIG_SMP
> @@ -94,7 +103,7 @@ static void imsic_msi_update_msg(struct irq_data *d, s=
truct imsic_vector *vec)
>  {
>         struct msi_msg msg =3D { };
>
> -       imsic_irq_compose_vector_msg(vec, &msg);
> +       imsic_irq_compose_vector_msg(d, vec, &msg);
>         irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
>  }
>
> @@ -225,7 +234,9 @@ static struct irq_chip imsic_irq_base_chip =3D {
>  static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned in=
t virq,
>                                   unsigned int nr_irqs, void *args)
>  {
> +       msi_alloc_info_t *info =3D args;
>         struct imsic_vector *vec;
> +       int ret;
>
>         /* Multi-MSI is not supported yet. */
>         if (nr_irqs > 1)
> @@ -235,6 +246,13 @@ static int imsic_irq_domain_alloc(struct irq_domain =
*domain, unsigned int virq,
>         if (!vec)
>                 return -ENOSPC;
>
> +       ret =3D iommu_dma_prepare_msi_list(info->desc, imsic->msi_pa_list=
,
> +                                        num_possible_cpus(), IMSIC_MMIO_=
PAGE_SZ);
> +       if (ret) {
> +               imsic_vector_free(vec);
> +               return ret;
> +       }
> +
>         irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec=
,
>                             handle_edge_irq, NULL, NULL);
>         irq_set_noprobe(virq);
> --
> 2.43.0
>
