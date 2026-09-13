Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC62F28FC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335991; cv=none; b=bKrvm57Einrdfrrj0/1ihebuWGwmUgUgrGVxzG7Uvvj0gPreZrp26K2SRgGjSduY8ieypKR9kNFyTnSttwEKRZdPEwm+6XdtfpoapQ2iZggx2LAHODSwL44xdCcq3fONPnprO5nsHJsbwKh+pCoIUxGSXdFOuI/DDaXDYCo9N34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335991; c=relaxed/simple;
	bh=6P7SU3DeWsusdNXTo+ioE1QFTJnJPflHicOUcSp2fTQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJbJckMdx+Hc/CitqVWudU3n2WruiV9O+Tw5gjwn9kooCzsQ2/RDUF5wYG7tJPPv9NKpq52e104dnWfZUBib9Bae0e1Q7sjO6y3sTja0Thfq+F5Y/JTM2EauhVCCB4zJyWXlYIqiPqWickLRJvjc7aBovT0HTYFLPOUORkH7FHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=YRVwVFL6; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="YRVwVFL6"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 0204CCCFC6;
	Mon, 14 Sep 2026 00:46:25 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 0204CCCFC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789335987;
	bh=IZDHqGUqBM67D0nu55PufyI2aLLqp/QwNXJoxPq6ALA=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=YRVwVFL6rdW+h/lViOxGyMckBC1xxVRIq1Xv3s1A/NSKZMYgeeMACqV9Tn2/8iJ+f
	 slZ615aAMZg1NhS2Q2mkwNq02nYlJ4U8cwcLv0lTUDB7oqCv3R4r2W/TiIbxrwwIjq
	 yqDg9jsvOdr1mjGApwTXNdKVvDwu1+CMEKXHcjK7lpjMiEitLTMGd7h23hfE8W5ndW
	 Pu7uO59vM5OG5ZXrwyaIBlhoFD2RVPOC6hQ9qvYnXC0iAJQBO16qBR5IX9WiPq3Rn+
	 SeLoqEIrqEsiEbFo+swmOjETmQxfdWkTO8eZdSITRBfuhMEl/Vjf2J80ACnLPfnHHK
	 GLdKjSSdbJGcg==
Message-ID: <a1f8942ee367e28b176031ef9bbe717d053d6b6e.camel@rendec.net>
Subject: Re: [PATCH] irqchip/sifive-plic: Panic if initialization fails
From: Radu Rendec <radu@rendec.net>
To: Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Anup
 Patel	 <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 13 Sep 2026 17:46:24 -0400
In-Reply-To: <20260911145037.427896-1-namcao@linutronix.de>
References: <20260911145037.427896-1-namcao@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 16:50 +0200, Nam Cao wrote:
> If PLIC initialization fails, the driver unwinds and returns an error.
> However, that is futile because the system cannot function without the
> PLIC: all device interrupts are routed through it.
>=20
> Instead of the unnecessary cleanups, panic when PLIC initialization fails=
.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0drivers/irqchip/irq-sifive-plic.c | 56 +++++++++-------------------=
---
> =C2=A01 file changed, 15 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifi=
ve-plic.c
> index a7cddadddf40..70a7478373e4 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -643,13 +643,11 @@ static int plic_probe(struct fwnode_handle *fwnode)
> =C2=A0
> =C2=A0	error =3D plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_co=
ntexts, &gsi_base, &id);
> =C2=A0	if (error)
> -		goto fail_free_regs;
> +		return error;
> =C2=A0
> =C2=A0	priv =3D kzalloc_obj(*priv);
> -	if (!priv) {
> -		error =3D -ENOMEM;
> -		goto fail_free_regs;
> -	}
> +	if (!priv)
> +		return -ENOMEM;
> =C2=A0
> =C2=A0	priv->fwnode =3D fwnode;
> =C2=A0	priv->plic_quirks =3D plic_quirks;
> @@ -668,10 +666,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
> =C2=A0	priv->acpi_plic_id =3D id;
> =C2=A0
> =C2=A0	priv->prio_save =3D bitmap_zalloc(nr_irqs, GFP_KERNEL);
> -	if (!priv->prio_save) {
> -		error =3D -ENOMEM;
> -		goto fail_free_priv;
> -	}
> +	if (!priv->prio_save)
> +		return -ENOMEM;
> =C2=A0
> =C2=A0	for (i =3D 0; i < nr_contexts; i++) {
> =C2=A0		error =3D plic_parse_context_parent(fwnode, i, &parent_hwirq, &cp=
u,
> @@ -735,10 +731,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
> =C2=A0
> =C2=A0		handler->enable_save =3D kcalloc(priv->irq_groups, sizeof(*handle=
r->enable_save),
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> -		if (!handler->enable_save) {
> -			error =3D -ENOMEM;
> -			goto fail_cleanup_contexts;
> -		}
> +		if (!handler->enable_save)
> +			return -ENOMEM;
> =C2=A0done:
> =C2=A0		for_each_device_irq(hwirq, priv) {
> =C2=A0			plic_toggle(handler, hwirq, 0);
> @@ -748,10 +742,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
> =C2=A0	}
> =C2=A0
> =C2=A0	priv->irqdomain =3D irq_domain_create_linear(fwnode, nr_irqs, &pli=
c_irqdomain_ops, priv);
> -	if (WARN_ON(!priv->irqdomain)) {
> -		error =3D -ENOMEM;
> -		goto fail_cleanup_contexts;
> -	}
> +	if (!priv->irqdomain)
> +		return -ENOMEM;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * We can have multiple PLIC instances so setup global state
> @@ -799,33 +791,13 @@ static int plic_probe(struct fwnode_handle *fwnode)
> =C2=A0	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d conte=
xts.\n",
> =C2=A0		fwnode, nr_irqs, nr_handlers, nr_contexts);
> =C2=A0	return 0;
> -
> -fail_cleanup_contexts:
> -	for (i =3D 0; i < nr_contexts; i++) {
> -		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->ac=
pi_plic_id))
> -			continue;
> -		if (parent_hwirq !=3D RV_IRQ_EXT || cpu < 0)
> -			continue;
> -
> -		handler =3D per_cpu_ptr(&plic_handlers, cpu);
> -		handler->present =3D false;
> -		handler->hart_base =3D NULL;
> -		handler->enable_base =3D NULL;
> -		kfree(handler->enable_save);
> -		handler->enable_save =3D NULL;
> -		handler->priv =3D NULL;
> -	}
> -	bitmap_free(priv->prio_save);
> -fail_free_priv:
> -	kfree(priv);
> -fail_free_regs:
> -	iounmap(regs);
> -	return error;
> =C2=A0}
> =C2=A0
> =C2=A0static int plic_platform_probe(struct platform_device *pdev)
> =C2=A0{
> -	return plic_probe(pdev->dev.fwnode);
> +	if (plic_probe(pdev->dev.fwnode))
> +		panic("%pfwP: Failed to initialize\n", pdev->dev.fwnode);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct platform_driver plic_driver =3D {
> @@ -842,7 +814,9 @@ builtin_platform_driver(plic_driver);
> =C2=A0static int __init plic_early_probe(struct device_node *node,
> =C2=A0				=C2=A0=C2=A0 struct device_node *parent)
> =C2=A0{
> -	return plic_probe(&node->fwnode);
> +	if (plic_probe(&node->fwnode))
> +		panic("%pfwP: Failed to initialize\n", &node->fwnode);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0IRQCHIP_DECLARE(riscv, "allwinner,sun20i-d1-plic", plic_early_probe=
);

Reviewed-by: Radu Rendec <radu@rendec.net>
