Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66F1D9A5F;
	Mon,  5 Oct 2026 01:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791163545; cv=none; b=IlQWyGArWzd95Op4r/vwARt578mu8D6VUKf70bdIc2RhG/JnFLB/a/4yUnP9emlcG8xpkMZP9p0ebAqjfdhiUot3fonDkFasUpf0DGJnXb2D8o9czpHo6ZyIqoYbSCoMPhqnVfdQdDNyH3HYn00ZIrCa5g+O8XIaGrIH5k5sJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791163545; c=relaxed/simple;
	bh=m4SSCDlWBIH9TM4kL52GJQyi4FmL6ZWsZN1kNaTUVwE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msBBl7wanlXEQHplM7WDxPK3BZ1FA07CePTLNQR2t8w9QjR18NJwubaXLwAxjqrdeBRTzk+aOzzn8EUkVJew3EZ7DBq8YYeu7C+tuEV/zlDL/1T4X144+2zPH9izgy4cGhp+enHckNpYLVBzgrfpMiic0Kf8Fup/Tnu9tTllrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=WdfqcySQ; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="WdfqcySQ"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 354C2CCDF6;
	Mon,  5 Oct 2026 04:25:40 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 354C2CCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791163541;
	bh=bMrX8vGQn0G83jMK/5OL/bgQyph2qZGtnBKr1RMgKkc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WdfqcySQqh1L5Xx2gjCOr1aiYgjP+4v3d1rM8UdXwooT/g02M3BPeSXoNwxwBt9Vu
	 HmYv8vIWVWNBDZX7OGyrZtuUixGU7s7/J608D2J/zog2ciLX/rSSAbPHRVEE0fWtUF
	 qh5RH5DjQpPwUmOHl0JLFCFCLORG2Jmfnt4FVdl0IjU/mIYq915jV+U1g12lRgpEWe
	 vxIKg2vNi1ZuRuIaHMp7hBf6PPZpeuxyS1PMRgHWm8lnq8L9TCliu2/DEB6glF5xrt
	 PrQ4Lw4ASbHbnNxck6s1DlAukkMJ7b0vTLnUB060ibXVTyA2iJ7B69eouqjG7TY5R/
	 yG+JkQ2H++Wyg==
Message-ID: <c28806ad779b972c94b9dd89fb70ee64cefb63cc.camel@rendec.net>
Subject: Re: [PATCH v2 8/8] irqchip/al-fic: add irq_set_affinity callback
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 21:25:38 -0400
In-Reply-To: <20260927080637.27285-9-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-9-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-09-27 at 08:06 +0000, Eliav Farber wrote:
> The FIC aggregates up to 32 interrupt sources into a single parent GIC
> SPI and has no per-child affinity control; affinity is determined by the
> parent GIC SPI routing.
>=20
> irq_set_affinity() fails with -EINVAL when the target irqchip has no
> irq_set_affinity callback, which prevents drivers that call it from
> probing when their interrupt is routed through a FIC instance. Add an
> irq_set_affinity callback that returns IRQ_SET_MASK_OK_DONE
> unconditionally.
>=20
> Affinity requests cannot be forwarded to the parent GIC SPI, because it
> may be shared by several FIC instances and changing its affinity for one
> child would silently move all the others. A pr_warn_once() is emitted
> when the requested affinity differs from the parent's current affinity,
> giving visibility without failing the caller.

This is a common problem to all multiplexing irq drivers; not because
the parent interrupt is shared but because changing the affinity of one
child interrupt (by changing the parent interrupt's affinity under the
hood) would have the side effect of changing the affinity of all its
siblings.

I think the correct behavior is to fail with -EINVAL in this case.
If you insist on having the ability to change the child interrupts'
affinity, you may want to look at this patch and do something similar:
https://lore.kernel.org/all/20251128212055.1409093-4-rrendec@redhat.com/

I intentionally provided the lore link instead of the commit id because
the patch is part of a series that added the infrastructure that makes
child interrupt affinity control possible. If you want, you can look at
the previous patches in the series to understand the full context.

> Co-developed-by: Talel Shenhar <talel@amazon.com>
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: add Co-developed-by/Signed-off-by: Talel Shenhar. No code change from
> =C2=A0=C2=A0=C2=A0 v1.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 31 +++++++++++++++++++++++++++++++
> =C2=A01 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 322e41ffa2fa..a558e0d88697 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -160,6 +160,36 @@ static int al_fic_irq_retrigger(struct irq_data *dat=
a)
> =C2=A0	return 1;
> =C2=A0}
> =C2=A0
> +/*
> + * The FIC aggregates up to 32 child interrupts into a single parent GIC=
 SPI.
> + * It has no hardware affinity control - all children inherit the parent=
's
> + * CPU routing. Affinity requests cannot be forwarded to the parent, bec=
ause
> + * a parent GIC SPI may be shared by multiple FIC instances and changing=
 its
> + * affinity for one child would silently move all the others.
> + *
> + * Return IRQ_SET_MASK_OK_DONE unconditionally so that callers using
> + * irq_set_affinity() do not fail with -EINVAL for lack of this callback=
.
> + */
> +static int al_fic_irq_set_affinity(struct irq_data *data,
> +				=C2=A0=C2=A0 const struct cpumask *mask, bool force)
> +{
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
> +	const struct cpumask *parent_affinity;
> +	struct al_fic *fic =3D gc->private;
> +	struct irq_data *parent_data;
> +
> +	parent_data =3D irq_get_irq_data(fic->parent_irq);
> +	if (!parent_data)
> +		return -EINVAL;
> +
> +	parent_affinity =3D irq_data_get_affinity_mask(parent_data);
> +	if (!cpumask_equal(mask, parent_affinity))
> +		pr_warn_once("%pOF: affinity change requested but FIC is fixed to pare=
nt IRQ %u CPU routing\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 fic->node, fic->parent_irq);
> +
> +	return IRQ_SET_MASK_OK_DONE;
> +}
> +
> =C2=A0static int al_fic_register(struct device_node *node,
> =C2=A0			=C2=A0=C2=A0 struct al_fic *fic,
> =C2=A0			=C2=A0=C2=A0 enum al_fic_id fic_id,
> @@ -215,6 +245,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
> =C2=A0	gc->chip_types->chip.irq_set_type =3D al_fic_irq_set_type;
> =C2=A0	gc->chip_types->chip.irq_retrigger =3D al_fic_irq_retrigger;
> +	gc->chip_types->chip.irq_set_affinity =3D al_fic_irq_set_affinity;
> =C2=A0	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
> =C2=A0	gc->private =3D fic;
> =C2=A0
