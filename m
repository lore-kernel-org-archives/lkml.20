Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838E4A64EF;
	Sun,  4 Oct 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791142252; cv=none; b=FciYSzw4h08KQJno+g2z9sHzZAPWvs10QwKAjoO6LMEznGAYUsvLnnpzcgyfHAZC3hdKryyeUQSgIRBdCLu3H4vTXYFTqRgmn44sMgXwdmhJvhiyyOuhMRl+tzt6vJvVDEDVinpMsfRrDrXXHlLclT6tlw9VH8AfKgS3tyWdOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791142252; c=relaxed/simple;
	bh=FjqPubxucxx2dXu8awuKPL1mdmehESgs/hnF/llUpIo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VPhcp1nIn13tE1HwhYxtPsxyDertI4sR6UzTWvHXRZLlUuJIa1ePGE4AZ2HwMENFsIspCqmT34Rfi7v9ea8FeQFRpDVjuiRICzNz+Oxn6tMmwdh9uARSRqe7F2WSN4AZiJ74wx2H0299D4/sG/IbVdAPB61qfxE0UCv2/L5tGTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=0yCEGg6T; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="0yCEGg6T"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 4280ED194D;
	Sun,  4 Oct 2026 22:30:31 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 4280ED194D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791142232;
	bh=J5csTJm5tEw8LAomVACMbclht+KvcDBy+uGJAGgN51s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=0yCEGg6T9f70wOcl4cO84vgMVR4RmTogfAGc+zTkWZES9/QKXjtWgSRYx1UNAb7LS
	 3FnH0XPfAS3QOpc30Q/R4p/OhFbfR3aCc43OxKvfNqkil1uEWlPP0kLLU6yj9hSGp5
	 wusJ2DakZXK+R+iCby2PaLhLz/daqjEa0vuFi3JzqDftqvzPiNWvQ56y7pOA9u2Kt9
	 4dCJWXJWq9cJUPeSMPqvrxQtcdCq+tozUYVQgfvwtEL0nHeumUQr/jOkz27zUiM2Ih
	 j2gmWr/AL1TxHHBQ4ERcX1q2CR+Zfp70yXp4ZsSZDNTEAigO+rtRYpPWpCcwDCVqZl
	 6DtM1CpulJgqw==
Message-ID: <325cca1679899cf7dd84d6e313c183f1c7eaf6f0.camel@rendec.net>
Subject: Re: [PATCH v2 4/8] irqchip/al-fic: switch to shared parent interrupt
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 15:30:29 -0400
In-Reply-To: <20260927080637.27285-5-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-5-farbere@amazon.com>
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
> Until now the driver requested its parent interrupt using the chained IRQ
> API (irq_set_chained_handler_and_data()), which only works when each
> parent interrupt is wired to a single FIC instance.
>=20
> A FIC controller is built from groups, each described by its own DT node,
> and the groups of one controller share that controller's output line
> toward the parent. So a real devicetree has several FIC nodes on one
> parent GIC SPI, and a chained handler can only be installed once per
> parent. Cascading compounds this: an aggregating group collects several
> peripherals' outputs onto the line above it.
>=20
> To support that, request the parent interrupt as a shared interrupt
> (IRQF_SHARED) instead of installing a chained handler. The handler now ha=
s
> the standard irqreturn_t prototype and reports whether it handled any
> child interrupt, so the shared-IRQ core can dispatch to the correct
> instance. IRQF_NO_THREAD is set because the handler only demultiplexes to
> the child domain and must not be forced-threaded; all instances sharing a
> parent line agree on this flag, as the shared-IRQ core requires.
>=20
> generic_handle_domain_irq() is retained for dispatch; its return value is
> used to determine whether a pending child was actually handled so the
> handler can return IRQ_HANDLED/IRQ_NONE correctly.
>=20
> request_irq() can fail, unlike irq_set_chained_handler_and_data(), so add
> an error path for it. It calls irq_domain_remove_generic_chips() before
> irq_domain_remove(), because irq_domain_remove() frees the generic chips
> only when the domain carries IRQ_DOMAIN_FLAG_DESTROY_GC.
>=20
> Co-developed-by: Talel Shenhar <talel@amazon.com>
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2:
> =C2=A0- Fix the request_irq() error path: v1 called irq_free_generic_chip=
(gc),
> =C2=A0=C2=A0 which is kfree(gc) on an interior pointer into the single al=
location
> =C2=A0=C2=A0 made by irq_domain_alloc_generic_chips() - an invalid free r=
eachable
> =C2=A0=C2=A0 when request_irq() fails at probe. Replace it with
> =C2=A0=C2=A0 irq_domain_remove_generic_chips() before irq_domain_remove()=
, and add a
> =C2=A0=C2=A0 commit-message paragraph explaining the teardown ordering.
> =C2=A0- Add Co-developed-by/Signed-off-by: Talel Shenhar.
> =C2=A0- Reworded to state the hardware reason for the shared parent (the =
groups
> =C2=A0=C2=A0 of one controller share that controller's output line).
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 31 +++++++++++++++++++------------
> =C2=A01 file changed, 19 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index c7cc2631caf8..091a06abc0bb 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -4,9 +4,9 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/bitfield.h>
> +#include <linux/interrupt.h>
> =C2=A0#include <linux/irq.h>
> =C2=A0#include <linux/irqchip.h>
> -#include <linux/irqchip/chained_irq.h>
> =C2=A0#include <linux/irqdomain.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> @@ -95,24 +95,24 @@ static int al_fic_irq_set_type(struct irq_data *data,=
 unsigned int flow_type)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static void al_fic_irq_handler(struct irq_desc *desc)
> +static irqreturn_t al_fic_irq_handler(int irq, void *data)
> =C2=A0{
> -	struct al_fic *fic =3D irq_desc_get_handler_data(desc);
> +	struct al_fic *fic =3D data;
> =C2=A0	struct irq_domain *domain =3D fic->domain;
> -	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
> =C2=A0	struct irq_chip_generic *gc =3D irq_get_domain_generic_chip(domain=
, 0);
> +	irqreturn_t ret =3D IRQ_NONE;
> =C2=A0	unsigned long pending;
> =C2=A0	u32 hwirq;
> =C2=A0
> -	chained_irq_enter(irqchip, desc);
> -
> =C2=A0	pending =3D readl_relaxed(fic->base + AL_FIC_CAUSE);
> =C2=A0	pending &=3D ~gc->mask_cache;
> =C2=A0
> -	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
> -		generic_handle_domain_irq(domain, hwirq);
> +	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS) {
> +		if (!generic_handle_domain_irq(domain, hwirq))
> +			ret =3D IRQ_HANDLED;

I'm not sure about this. The only way generic_handle_domain_irq() can
fail is if hwirq is invalid and doesn't map back to a virq assigned to
the domain. The handler itself has a void return type, so this doesn't
tell you whether the interrupt was handled downstream, it just tells
you whether the downstream handler was called or not.

Since you're looking at exactly NR_FIC_IRQS bits, which is also the
domain size, I expect the conversion (from hwirq to virq) to always be
successful.

If you search for "generic_handle_domain_irq" in drivers/irqchip/,
you'll notice that most drivers don't check the return type. The few
who do, just log a ratelimited "spurious irq" message.

When the interrupt is shared, the purpose of the handler return value
is to identify which of the devices generated the interrupt, or in
other words to tell the irq core whether it should keep looking at the
remaining devices. If a bit in AL_FIC_CAUSE is set, I would expect this
instance to be the one that generated the parent interrupt.

By the way, how is AL_FIC_CAUSE cleared? Is it read-to-clear? I'm just
curious; I assume it's implemented correctly because this hasn't
changed with the conversion from chained interrupts to shared, and it
was probably working before.

> +	}
> =C2=A0
> -	chained_irq_exit(irqchip, desc);
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static int al_fic_irq_retrigger(struct irq_data *data)
> @@ -162,11 +162,18 @@ static int al_fic_register(struct device_node *node=
,
> =C2=A0	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
> =C2=A0	gc->private =3D fic;
> =C2=A0
> -	irq_set_chained_handler_and_data(fic->parent_irq,
> -					 al_fic_irq_handler,
> -					 fic);
> +	ret =3D request_irq(fic->parent_irq, al_fic_irq_handler,
> +			=C2=A0 IRQF_NO_THREAD | IRQF_SHARED, fic->node->full_name,

I have the same comment here about fic->node->full_name as I did on the
previous patch. There is an accessor, so I would use it.

> +			=C2=A0 fic);
> +	if (ret) {
> +		pr_err("fail to request irq (%d)\n", ret);
> +		goto err_remove_generic_chips;
> +	}
> +
> =C2=A0	return 0;
> =C2=A0
> +err_remove_generic_chips:
> +	irq_domain_remove_generic_chips(fic->domain);

As you noted in the commit message, IRQ_DOMAIN_FLAG_DESTROY_GC does
exactly that, so why not use it? It's safe to set the flag even before
calling irq_alloc_domain_generic_chips() and knowing it has been
successful; irq_domain_remove_generic_chips() checks first if the GC
has been allocated and returns early if not. There is an example of
using the flag in drivers/irqchip/irq-renesas-irqc.c.

> =C2=A0err_domain_remove:
> =C2=A0	irq_domain_remove(fic->domain);
> =C2=A0
