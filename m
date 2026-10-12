Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B854337F320;
	Mon, 12 Oct 2026 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832264; cv=none; b=IJTChqWjdBAlNva86TOrHpZgXOF9cFqAiz1ROXx8e5AQcPyI4aHvossqsEgksShB1TOmsLmvGVV78IYlaSj2NzuZAJKBtkt7SnZfX2ZxRvAi7Ok5FfTWqsQ1CQUXYPJbI4W3TklLHCdRyxlGKu8x4t3WPjS/hpPk9oE0rjTlIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832264; c=relaxed/simple;
	bh=hTgo6ISqNRh5soM1E73Ih7Ke+NcFmuniqA9wgEnZSBM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFyOVsxQd+2LZOjRlqw3UV4WJC4ABqpJsdwT3yUDnR2EsbkpzLGEy+g7dECM9wXrG8D3eet52ehBLjVvpy3Lb0sz4TQs2v49lZrhKjUj9v1sSF6sn/0uAQFwF5Op5P+8rF8HeS0vQ8qeCT43UiIosQLc7PWh6ctd1lf3mXZeyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=Epq4trkH; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="Epq4trkH"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 83961D1E43;
	Mon, 12 Oct 2026 22:10:59 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 83961D1E43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791832260;
	bh=oX/4OcZXXFOiri4TI4gmPKuewisOsNilUSM6pFOgoaw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Epq4trkHGz+C+duuSbGz+pki7UKqWv1qZkj9SPOwF59MX3lUx3VvYN1NpZar0MU4Z
	 c/7onQ5GfQK8Q4N9TyNtR8fPZ7TR4CYPMENoRPZ4D2p6vb28XDM+1pmscoBk9fW8MZ
	 uU+UrA+oyF1VertRa7afGIDJ+bj9vxq6AA+B0nmEUuKHaSfdxX1hQaLDfM/11a8K+f
	 X/NTFu3u6GzXmswIu4oofjfsYOzKbvZkd89TLaEQToa4jQXvyqGfKMu6GTfd2c+eYP
	 vp1By4QXE3oE1cH57i91yuVcyMNA+COasHc8Fz3Vg8eoE1P/wBJu/+EeYJ6pXn6MN6
	 wSEkJGHOp1z+Q==
Message-ID: <07adea400dbab7f1204354070c738f495d5d1646.camel@rendec.net>
Subject: Re: [PATCH v5 9/9] irqchip/al-fic: support per-child affinity via
 interrupt redirection
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 15:10:57 -0400
In-Reply-To: <20261011050449.41903-10-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
	 <20261011050449.41903-10-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-10-11 at 05:04 +0000, Eliav Farber wrote:
> The FIC multiplexes up to 32 sources into one parent GIC SPI, and a
> child's handler runs in the parent's context, so a child has no affinity
> control of its own. irq_set_affinity() therefore fails with -EINVAL, and
> drivers that treat that as fatal cannot probe when their interrupt
> arrives through a FIC group. The parent routing cannot be changed on
> behalf of one child either, because several FIC groups may share one SPI
> and all of them would move with it.
>=20
> Use the interrupt redirection infrastructure. Dispatch children with
> generic_handle_demux_domain_irq() and set irq_set_affinity to
> irq_chip_redirect_set_affinity(), so a child whose affinity excludes the
> CPU taking the parent interrupt runs on its target CPU in IRQ work
> context. The interrupt is still taken on the parent's CPU; only the
> child's handler body moves.
>=20
> Redirection defers the whole flow handler, so the cause bit is cleared in
> al_fic_irq_pre_redirect(), which runs in parent context on both the
> inline and the redirected path. A level configured group is masked there
> too, because its cause bit re-latches while the input stays asserted; the
> deferred handle_level_irq() masks again and unmasks when the handler is
> done. An edge configured group is only acked, since handle_edge_irq() has
> no unconditional unmask. irq_ack is a noop because irq_pre_redirect runs
> on every dispatch and the ack must not happen twice.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v5: rewritten from scratch. Thomas Gleixner rejected the
> =C2=A0=C2=A0=C2=A0 IRQ_SET_MASK_OK_DONE approach below ("That's a horribl=
e hack and just
> =C2=A0=C2=A0=C2=A0 pretends to solve a problem. We have the interrupt red=
irection
> =C2=A0=C2=A0=C2=A0 infrastructure to handle that correctly."). This patch=
 instead wires
> =C2=A0=C2=A0=C2=A0 al-fic into that infrastructure (irq_chip_redirect_set=
_affinity(),
> =C2=A0=C2=A0=C2=A0 generic_handle_demux_domain_irq(), and an irq_pre_redi=
rect callback
> =C2=A0=C2=A0=C2=A0 that moves the ack - and, for a level configured group=
, the mask -
> =C2=A0=C2=A0=C2=A0 into parent context), per Radu Rendec's confirmation o=
f this shape on
> =C2=A0=C2=A0=C2=A0 the v2 thread and the dw_pci driver he and Thomas poin=
ted at as a
> =C2=A0=C2=A0=C2=A0 reference. Tested on our hardware: with a child's affi=
nity pinned
> =C2=A0=C2=A0=C2=A0 away from the CPU taking the parent SPI, the handler b=
ody runs on the
> =C2=A0=C2=A0=C2=A0 target CPU and the ack still happens on the parent's C=
PU, with no
> =C2=A0=C2=A0=C2=A0 re-fire storm on a level configured group, and no chan=
ge to the
> =C2=A0=C2=A0=C2=A0 inline (non-redirected) path. This replaces every vers=
ion of the
> =C2=A0=C2=A0=C2=A0 irq_set_affinity callback below; the v2-v4 history is =
kept for the
> =C2=A0=C2=A0=C2=A0 record of how the approach got here.
>=20
> v4: no change. The question Radu Rendec raised on this patch - whether an
> =C2=A0=C2=A0=C2=A0 unconditional IRQ_SET_MASK_OK_DONE is the right contra=
ct, or whether
> =C2=A0=C2=A0=C2=A0 it should fail with -EINVAL - is still open.
>=20
> v3: no change. The question Radu Rendec raised on this patch - whether an
> =C2=A0=C2=A0=C2=A0 unconditional IRQ_SET_MASK_OK_DONE is the right contra=
ct, or whether
> =C2=A0=C2=A0=C2=A0 it should fail with -EINVAL - is still under discussio=
n on the v2
> =C2=A0=C2=A0=C2=A0 thread and is answered there.
>=20
> v2: add Co-developed-by/Signed-off-by: Talel Shenhar. No code change from
> =C2=A0=C2=A0=C2=A0 v1.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 46 +++++++++++++++++++++++++++++++++=
+--
> =C2=A01 file changed, 44 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 13a945a1d312..77cff6308eba 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -142,7 +142,13 @@ static irqreturn_t al_fic_irq_handler(int irq, void =
*data)
> =C2=A0	pending &=3D ~gc->mask_cache;
> =C2=A0
> =C2=A0	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
> -		generic_handle_domain_irq(domain, hwirq);
> +		/*
> +		 * Redirect a child whose affinity excludes this CPU to its
> +		 * target CPU via irq_work. The ack moves to
> +		 * al_fic_irq_pre_redirect(), because the whole flow handler is
> +		 * deferred when that happens.
> +		 */
> +		generic_handle_demux_domain_irq(domain, hwirq);
> =C2=A0
> =C2=A0	return pending ? IRQ_HANDLED : IRQ_NONE;
> =C2=A0}
> @@ -157,6 +163,32 @@ static int al_fic_irq_retrigger(struct irq_data *dat=
a)
> =C2=A0	return 1;
> =C2=A0}
> =C2=A0
> +#ifdef CONFIG_SMP
> +/* The ack happens in al_fic_irq_pre_redirect() on both paths instead. *=
/
> +static void al_fic_irq_noop(struct irq_data *data) { }
> +
> +/*
> + * Runs in the parent interrupt context on every dispatch, redirected or=
 not.
> + * Clear the cause bit here: once the flow handler is deferred, the FIC =
keeps
> + * driving its output until the irq_work runs, and a level parent SPI re=
-fires.
> + *
> + * A level configured group is masked too, because its cause bit re-latc=
hes
> + * while the input stays asserted; the deferred handle_level_irq() unmas=
ks
> + * when the handler is done. An edge configured group is only acked, sin=
ce
> + * handle_edge_irq() never unmasks unconditionally and the mask would st=
ay.
> + */
> +static void al_fic_irq_pre_redirect(struct irq_data *data)
> +{
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
> +	struct al_fic *fic =3D gc->private;
> +
> +	if (fic->state =3D=3D AL_FIC_CONFIGURED_LEVEL)
> +		irq_gc_mask_set_bit(data);
> +
> +	irq_gc_ack_clr_bit(data);
> +}
> +#endif /* CONFIG_SMP */
> +
> =C2=A0static int al_fic_register(struct device_node *node,
> =C2=A0			=C2=A0=C2=A0 struct al_fic *fic,
> =C2=A0			=C2=A0=C2=A0 enum al_fic_id fic_id)
> @@ -195,9 +227,19 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	gc->chip_types->regs.ack =3D AL_FIC_CAUSE;
> =C2=A0	gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
> =C2=A0	gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bit;
> -	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
> =C2=A0	gc->chip_types->chip.irq_set_type =3D al_fic_irq_set_type;
> =C2=A0	gc->chip_types->chip.irq_retrigger =3D al_fic_irq_retrigger;
> +#ifdef CONFIG_SMP
> +	/*
> +	 * The FIC has no hardware affinity control, so give each child real
> +	 * affinity by redirecting its handler to the target CPU.
> +	 */
> +	gc->chip_types->chip.irq_ack =3D al_fic_irq_noop;
> +	gc->chip_types->chip.irq_pre_redirect =3D al_fic_irq_pre_redirect;
> +	gc->chip_types->chip.irq_set_affinity =3D irq_chip_redirect_set_affinit=
y;
> +#else
> +	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
> +#endif
> =C2=A0	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
> =C2=A0	gc->private =3D fic;
> =C2=A0

Reviewed-by: Radu Rendec <radu@rendec.net>
