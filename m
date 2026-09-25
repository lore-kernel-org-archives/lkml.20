Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C094D9F74
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351515; cv=pass; b=rDExdLM1iBjwuyEUU6midegCjq76JodKhWDoTAajsG8bwQfiohUbSIXr7/JW+hHpPLOFeikkNf1hb9Fiq6YekzYUSXYZehkHGvCgEPbvlJCerWOVooLteVL0EbeAD3jrzGqOZlOjV7fByCCzirudaUuoJZtUH3WVPCWd4GiejEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351515; c=relaxed/simple;
	bh=Jf2O3vX2s2gUIjt+C5kumMdxZmsulGyl9yMEzEeYwT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwaxZTiGw1/Z82EhNOgqtiVepXPjaeZAU9tBy9RjkgWTXeVomX3yLrxLnCvzYzv5WsedK/GHLxGUeiEwHf9Op/0L2WPOfQvNJfxXtIe6lD4dbsQPhZipj3U4vCi1pK90INsnY4+gkwc1DUqXTUKOLE5Y40t9EBqy/yu1SXWK43A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=Wbr/ehfI; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="Wbr/ehfI"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so422881f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351502; cv=none;
        d=google.com; s=arc-20260327;
        b=huqk+OM71BARRBY7NwfLFCcBKRtn7dJBbHXnvDopcL2TlxltLfPtpXLg/etBiH2H/2
         2XyzHB7LKVmECdwWMXOvOMUB7OnstbwZYeAmnGyEhGKNALEYOae0pEDTkPIvbKrpVkn+
         +BgVKs/jaZBKbJ55dayZZPCDJjYQeFSpALINzL+T2BT9slQlj1YPQ0487SJqDI9EMDjv
         xGY3KQN2zq8aC+3uTqEZz+whMxRI4c2iO6ug4H52TCXN7dKETlmskRHNo9fTYX8tsT4n
         LZUn6PSh6a5dZFbqA+DeReQy+Nmb06qyY7QrJ4jTLZYEwci8KQ816QFJ7OVZApBZq/mL
         5C2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=;
        fh=SSW7JhWkC3n4RyDbEWNdvb9L6l1L+72lmrh/HB0pTOM=;
        b=qmvNladWnxcavT+zWb2Vo7iTzC97eh9u4Lf4xuBWgme+wqmUOn/ZiKS2A0ajcm4eJS
         cXZZk1Z7hCO8DV2S07UoWBUyu7gqAwPzeU5+T9insRYv9O4S7vjaYulOx9uPzxSOY5RV
         8Muv1Zz4DYyalyVcG5mGYsHnyAYyywlrAmPet3TrqN5gPMFBi12ToLqiQxAGfF6S1XGA
         dWS0KfQndFtAATu5uUQKbzXKe9ef+D4z5+bnpkCYLByysw16PNg0DuOG9V2oUDyiy3Zl
         RHHUPuU+9CL7vpSJpfKfI4Dtv5w4TDjCwdIMtV16TRaJaBNtA2iblO2x9OmPlaYUefE3
         IQng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790351502; x=1790956302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=;
        b=Wbr/ehfIUwhMy7eu+fauH5RPlHip5NaWitfUWWxiXgiFf2DywMnzEYa3Vqiaq79srv
         EtUkfj47aQay6mgEv1fuj2gfSGUjucf7204wBMi+fsAJug6Cid6eC03/B5WVK0vMHuN9
         AnNPtThm5SxvzAiy/SdOruSlCi1ScNhfRO0vfRsvCoTEVobbV+XX6BLdTGYlidQiYa1O
         /NhQE3xmfRzrQqVUiy3WTSIYQ5mF70bnR8UTlUVeIY7osyPAHz2BgebpzP7UdEGnNRi0
         ItX4cg+rs3Kc0PrP0AkeB3V2mDPCYi2Am/ydkdHnNiZrqgiM6IpsxzL0fcV7bpJ9Ip7z
         O1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351502; x=1790956302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=;
        b=Bj+iGzispc7v9i7csS2a3qgIQpv1osSE93KCbYW7NBeQJjbPkUTeUNFjd751ymDE+1
         0VNeCM9Q3dXXlq/VsDGkd3d/gM2OrUJbxnzIwdaMdNgh0BAA6ytts5I7teJ8xff+IqjS
         8CIak8WUubuGoiWrK1EB/01uMsuINTYDawUubK29+fxGw1NlCVoZUYf1BoPNnE2tdNgB
         /FwHY8MQL5/d5WkYmJ+Mzd6lFzV3thDqeyuAkX6062/AhS4dOqIoCrKvhdmJJW+zHN4f
         hSZpc5XRnRVGpKuXI3fFegGWeIEtCu13J2WJmxvhGJNRbyNShTAIWnDArCNYsz9Sn0nk
         EFTA==
X-Forwarded-Encrypted: i=1; AKwUvBy/SltiAGZjE/vfwRpiRRmLpaVmkJ3UEehaZ/hPHf9yemqosiJ7qXHdjZdmOBznCgg1a18Q07Za1Gx1380=@vger.kernel.org
X-Gm-Message-State: AFuF++n+1TIIKVDZ0Wi56bNurvQAeaueUAHf2dKaV5U3wY/9S3p+713H
	kZFPScftYKXr6HgIxJ0j9PB8sSTdxAi319mLbaMeStX1lYFyLQWGebgc9qBP0I/5LAH6LGWBV0G
	2xADRtjDPIdlbR+gGKPV0Z5ptjWvasMx3ZVOwHbIkKA==
X-Gm-Gg: AYBFou1T5KtuKrdp966badXnFHT4cO4L1noF05RENhuntJ1qmhofo1AyA7XrU5F9yaK
	oiC2qcRBMJMyD1Xxn5gEsGmbIUseSqMRcdkqlkeEDYCcOUVFuFX1XzQIa+GUW7q+AGtHpqtgFmI
	FgeXhPa/tt0TFDezWApkhDM/vrdfWopjNwrp89WF1MgqFH0C4jm/z06+2V1wInNJ1IfM0FFacqF
	JQyhWqWp5KOPsEOAEuVr92fCEaVW05SvOdoZiSL3qGhq30GQ1yVuYX6l1dy7XryrmIRRmO5Tm1Y
	b5r2E4MCZr0T/7RZ/9XGjHQEXQ5o42tjWa3WbzCmRPt558jX7U9l3aCgr9Q2qtTYE2/OV9949GT
	ayRa4HBCBo2SpuzKE8dlRrPX5eDR/hymRxaqr5EYSLGqDySDE+FNIZwK+RZ5nQQTQSugMkQ/qSP
	s=
X-Received: by 2002:a5d:5e88:0:b0:487:9a9:6d24 with SMTP id
 ffacd0b85a97d-4887171a503mr9892842f8f.19.1790351502520; Fri, 25 Sep 2026
 08:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com> <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Sep 2026 21:21:28 +0530
X-Gm-Features: AclHuK9Smh7rGiwz-QHNVaoPdbwbyf3R_ZUrSV-K4y97wOA8f1Kpw1Exnt_jFjc
Message-ID: <CAAhSdy37AUsq0ixwiaGz5HwSJw+jTAonoCHG5Oi8h5=Hw+bXrw@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
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
> Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
> host IMSIC target into one contiguous MSI IOVA range. MSI message
> composition then uses the target CPU's position within that range.
>
> Build an IMSIC physical address array indexed by logical CPU.
> Require every possible CPU to have an initialized IMSIC page before
> publishing the array. This preserves physical address zero as a valid
> target and guarantees the array has num_possible_cpus() entries.
>
> The array size and each target's index can therefore be derived
> directly, without storing duplicate count or per-CPU index metadata.
>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

LGMT.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
>  drivers/irqchip/irq-riscv-imsic-state.h |  3 +++
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index df38a7670a89..abd1cdb640ea 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -709,6 +709,31 @@ static int __init imsic_get_mmio_resource(struct fwn=
ode_handle *fwnode,
>         return of_address_to_resource(to_of_node(fwnode), index, res);
>  }
>
> +static int __init imsic_init_msi_pa_list(void)
> +{
> +       struct imsic_global_config *global =3D &imsic->global;
> +       phys_addr_t *msi_pa_list;
> +       unsigned int cpu;
> +
> +       msi_pa_list =3D kcalloc(num_possible_cpus(), sizeof(*msi_pa_list)=
, GFP_KERNEL);
> +       if (!msi_pa_list)
> +               return -ENOMEM;
> +
> +       for_each_possible_cpu(cpu) {
> +               struct imsic_local_config *local =3D per_cpu_ptr(global->=
local, cpu);
> +
> +               if (!local->msi_va) {
> +                       kfree(msi_pa_list);
> +                       return -ENODEV;
> +               }
> +
> +               msi_pa_list[cpu] =3D local->msi_pa;
> +       }
> +
> +       imsic->msi_pa_list =3D msi_pa_list;
> +       return 0;
> +}
> +
>  static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
>                                      struct imsic_global_config *global,
>                                      u32 *nr_parent_irqs,
> @@ -959,6 +984,12 @@ int __init imsic_setup_state(struct fwnode_handle *f=
wnode, void *opaque)
>                 goto out_local_cleanup;
>         }
>
> +       rc =3D imsic_init_msi_pa_list();
> +       if (rc) {
> +               pr_err("%pfwP: failed to initialize MSI address list\n", =
fwnode);
> +               goto out_local_cleanup;
> +       }
> +
>         /* Initialize matrix allocator */
>         rc =3D imsic_matrix_init();
>         if (rc) {
> @@ -984,6 +1015,7 @@ int __init imsic_setup_state(struct fwnode_handle *f=
wnode, void *opaque)
>  out_free_local:
>         free_percpu(imsic->global.local);
>  out_free_priv:
> +       kfree(imsic->msi_pa_list);
>         kfree(imsic);
>         imsic =3D NULL;
>         return rc;
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/ir=
q-riscv-imsic-state.h
> index c42ee180b305..e51c61dcced3 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.h
> +++ b/drivers/irqchip/irq-riscv-imsic-state.h
> @@ -50,6 +50,9 @@ struct imsic_priv {
>         /* Global configuration common for all HARTs */
>         struct imsic_global_config              global;
>
> +       /* MSI target physical addresses indexed by logical CPU for IOMMU=
 mapping */
> +       phys_addr_t                             *msi_pa_list;
> +
>         /* Per-CPU state */
>         struct imsic_local_priv __percpu        *lpriv;
>
> --
> 2.43.0
>
