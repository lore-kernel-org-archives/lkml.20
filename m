Received: from mail-wr2-f14.google.com (mail-wr2-f14.google.com [74.125.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677D3F65EA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164887; cv=pass; b=FRzefLd+Sk1qhZ2/DOhFk3NKC9EPCn6tfK9IrtPtMKdL6b73Nb+vEODa8lkEFaN/ohCTRF1zgZN9XGuaGKjixuQ1eQ5a9OhUIXyt2WUhMTqjjcR8YKJMR8K0lFeKBiYjUFAa0MuHXpzLeUl7t0ODDs12bTyLQILDzUn8S2SB9AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164887; c=relaxed/simple;
	bh=UciKY87OJuo05x9eA/7imt88rzW35xEJOjxrzxqe9Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPGZ6xeFUr8P8ynOJyB31zmkWwTTMVknhzbiBJajmORBi8g1uhQRSk9UMTuRsRGh53y641VwCumPYcD9kxhyeUH+D+rttHlSAKXtXX7t0zrsFY+D0gZyi9skVfMhdxnd5tT/8jV1AOgtAiTuqoxEWdauJlt9xcxrU4uYggGeQvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=g0AMDHSH; arc=pass smtp.client-ip=74.125.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="g0AMDHSH"
Received: by mail-wr2-f14.google.com with SMTP id ffacd0b85a97d-482f6350f88so609579f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164880; cv=none;
        d=google.com; s=arc-20260327;
        b=YLNvTCgNp+Av2ZTjT0Ci9QteSFRlRIlVe5t6Znw+wyGwxXEm/5X/7URozS4AJ/sspp
         BKkL06QdLUMd6lg7KLJ0/DnloE56lSJtTyltwUzOPuecryibZCDIM01Yav0GKLsqoyh/
         /5GU9/xOZRbrjiK+8tkWxTz+iOjcY1aTMyy/ccMO5V5R3GgM3TGlGe38jQRP/wJ8CJTN
         fn15ClG+FqkphKFD8t3OqAWW1PxgL1rg36AeVMDlhdVKXipdDncjoyyMRU9AjDG0vZWy
         H0Wcz8Ti3sWaLtMBNsAJg+nBzpLmdwnLNAevvg+dg8HqwQFwLdOKA0Xg8dqsktG/qj7+
         A+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=;
        fh=gL6PFSgxKml4gHtgxumM3xF7D5tACfWr80jpkDYyo0U=;
        b=CdQVv084Kgv3Cbw/PQia05uiPXdpx5lXxLezzV2nVv8FjnG8ox+sJxvG12cOwiDgch
         UumAiBbG1u37+23nGP3FVGl2IQLY/xTqzOdgY/54G2c4SKKVy6FJu0H1DjuSf1HMj4iQ
         LErLWnXeR1znEDXBeGJDh8nHl06780tMdXbjAJf7x76ADiWit2yC3NIiBIpRD5M1D+1l
         Yt3WiRV1s3y9SQy+FGSiWFYrL1CRhRrRxrHCGMd5ZRT6gcgmkH3OfeuYHfRCK//0Fbv0
         uodrOAxey+5PpHxoS4c7/eDFwQhW1hFVW1ARIsGuOQnPalugeKB2M04PPvUY+DtBuBiO
         PCUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790164880; x=1790769680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=;
        b=g0AMDHSHvPCZDReeaAZ6e/VDnkPNtK1/y+l7bSFZYZ1SQnOc/3SnHMxZsxPNq4gRb5
         MoMM9zBDIyLLGz0yQoxNjYAt1/9uUZpJUCtIpvT3xwFisJY94KHiXkBg7kpiTU7kXETx
         s3qxFov9ZLevli+6Dp5Ety0dS7eY3Jj8RPYRp0UmcWt80q41n2FD9j+P97C6RleFIOkx
         A/sveEZ6KyzzFJEJKxw9GJr+1PhlMpdrLejStf6uDuac11+gfZbbOiPkOj2HL9/71oJP
         qyvjtQVu12Hs4ucOoCyeYmyM8jMJKx99dRIineRWZFDEt6Fy2xeg98ZvbyYKVhsvLTEO
         cmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164880; x=1790769680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=;
        b=WylzMp3NuFSrqxcyDJZJTx2yvcdrbKpnSOHXKJX05eUU3uGRXxu3pcxuVqoxHa0UUk
         +8t79ihsLY10ZIuco9iCvCqagLkMgdzTeTmb7fjtODM7Kq8/vJvfGtOyCrdq4VEDBPgf
         dKNO6Oi8oLI8urdXgKuZ9AmOkB88Hr/rwCLDISwJ6a9o6Gsjw4SVSGq3YeU9zC9C23j4
         qiV6Dy81aJLqniyJPlQ0ipTo56sR9PWAVHoOemMz2aOAIepVMLybigPY4nDuPhUN3gkg
         0+tcDfC1a8gQiZ7jg+jPiqA3RpgTyrn/ZlmBSAPjAXwKngG7P3wij3eO8isf9NydWdyQ
         rcNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpKp1id7h686VN1+SBHaNCyPpZ/RNOgUC2xG5w89oahQ0Enb9exvrBI4i/wS1eLgr4MV2Hw9fPQqbjUVU=@vger.kernel.org
X-Gm-Message-State: AFuF++lC89zIOpDFrfXRsvGrgS43s0/srUbNhkGNQr32XYj0T/bDrj2z
	pKOAaCz4o1w/MDQ4F/EVNWb68axMZ0gay5FL8sA6RmmsRXOBmOpYGwxW9pQf2/5jfQ9o1JnhR8K
	rH3poC7qJecSjjeHHLPFIcjhDExLbRYM3QPk3I2uwiA==
X-Gm-Gg: AYBFou3znwFPmwFd6O7Nidz873XWIQtVVGeiosHAK4rHWdyq61CYVQh7vT2mWb3Sxm2
	giLjS6VuDm3lyL4Kh4yjC82Y6h0wvoN4d/ILlwa9hifWbVk7odHI4biYKjekt+aUsfQk+dYNlBl
	x+PMK1N8149r9dd1ecRXU4zE/T9MvUrd9wz1xhDznzsl9ZZl3Eigq7w8Q5ormS1tfZiS65b3pHd
	Txs8WovJW7lLOkFDa7N8pH6shxYgjQDDC+OHZ/iO/Sdg1btTN3qdOUlllAFUgtknZf6bSm5GxF+
	DSIZKZ1/gGNqPprzb4PB57+ORmplO8RbyZHj0FP1dG0Fyy6NuJg8Bn40T+nlbXHOmm5q50gXRTo
	+RD4UaGwj9QkCF1W0loKH+269pp1yEGjPyynK5A3MmMSWERWQdJpyYmX1pbNZqBnK/NpF/9A9OM
	A=
X-Received: by 2002:a05:6000:70b:b0:487:81c:183f with SMTP id
 ffacd0b85a97d-4886704926dmr3859972f8f.10.1790164877652; Wed, 23 Sep 2026
 05:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com> <20260831145943.313726-13-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260831145943.313726-13-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Sep 2026 17:31:05 +0530
X-Gm-Features: AclHuK-2ObkketlET_SBsJ58iMsfQLM0zUzwlh7sLplMTaBDRnaBDkNaFuzixnM
Message-ID: <CAAhSdy36ZUbJ5OetQ0n7C8UYYBVhqUsbHc3+XMDOfXX2O9ZjmA@mail.gmail.com>
Subject: Re: [PATCH v5 12/17] irqchip/riscv-imsic: Support IOMMU MSI address lists
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:30=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
> target into one contiguous IOVA range. MSI message composition therefore
> needs each target's position within that range.
>
> When the S-mode IMSIC address list is available, prepare the complete
> list while allocating an IRQ. This allows the IOMMU backend to map the
> pages and cache the contiguous base IOVA in the MSI descriptor. Skip the
> optional preparation when no list is available, allowing devices which
> do not need IOMMU MSI translation to keep using physical MSI messages.
>
> When the descriptor has an IOMMU MSI mapping, use the selected logical
> CPU directly as the page index within the IOVA range. Use the same path
> for initial composition and affinity updates. Messages remain physical
> when no IOMMU MSI mapping is required.
>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  drivers/irqchip/Kconfig                    |  1 +
>  drivers/irqchip/irq-riscv-imsic-platform.c | 25 +++++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 42f2278a702d..c7cda52b21eb 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -656,6 +656,7 @@ config RISCV_IMSIC
>         select IRQ_DOMAIN_HIERARCHY
>         select GENERIC_IRQ_MATRIX_ALLOCATOR
>         select GENERIC_MSI_IRQ
> +       select IRQ_MSI_IOMMU
>         select IRQ_MSI_LIB
>
>  config RISCV_RPMI_SYSMSI
> diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip=
/irq-riscv-imsic-platform.c
> index 643c8e459611..6e26a31f7503 100644
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
> @@ -79,6 +82,11 @@ static void imsic_irq_compose_vector_msg(struct imsic_=
vector *vec, struct msi_ms
>         if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
>                 return;
>
> +       if (desc->iommu_msi_shift) {

Is it expected that iommu_msi_shift =3D=3D 0 means no IOMMU in the path?

> +               msi_addr =3D (desc->iommu_msi_iova << desc->iommu_msi_shi=
ft) +
> +                          vec->cpu * IMSIC_MMIO_PAGE_SZ;
> +       }
> +
>         msg->address_hi =3D upper_32_bits(msi_addr);
>         msg->address_lo =3D lower_32_bits(msi_addr);
>         msg->data =3D vec->local_id;
> @@ -86,7 +94,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_v=
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
> @@ -94,7 +102,7 @@ static void imsic_msi_update_msg(struct irq_data *d, s=
truct imsic_vector *vec)
>  {
>         struct msi_msg msg =3D { };
>
> -       imsic_irq_compose_vector_msg(vec, &msg);
> +       imsic_irq_compose_vector_msg(d, vec, &msg);
>         irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
>  }
>
> @@ -225,7 +233,9 @@ static struct irq_chip imsic_irq_base_chip =3D {
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
> @@ -235,6 +245,15 @@ static int imsic_irq_domain_alloc(struct irq_domain =
*domain, unsigned int virq,
>         if (!vec)
>                 return -ENOSPC;
>
> +       if (imsic->smode_msi_pa) {

The imsic_setup_state() will fail if smode_msi_pa creation fails at
boot time so this looks like a paranoid check.

> +               ret =3D iommu_dma_prepare_msi_list(info->desc, imsic->smo=
de_msi_pa,
> +                                                num_possible_cpus(), IMS=
IC_MMIO_PAGE_SZ);
> +               if (ret) {
> +                       imsic_vector_free(vec);
> +                       return ret;
> +               }
> +       }
> +
>         irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec=
,
>                             handle_edge_irq, NULL, NULL);
>         irq_set_noprobe(virq);
> --
> 2.43.0
>

Regards,
Anup
