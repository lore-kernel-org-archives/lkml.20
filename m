Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28728314B73;
	Sat, 10 Oct 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652772; cv=none; b=muFzg3/fDYi7Pug9eA6v6whqxk89MoidCWz2++gAcohCh6TaQIPjCjJjkeALlqfmBdzRkgrJ/XnYOp5tlT673BrR92W5rBzL4j/VdvPuLEBMZF4LCrztEu1CKV1BqqhNOlp4Vs2ubgTXiNdNbH+fM5gb0RfHCNNuVyW15opdkfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652772; c=relaxed/simple;
	bh=q9Z4EYXrDrI41l+M3yWO5yBiyjGx+xnwHrS8Ev8zcSg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t8FjacV7r9ttE4HAzt6kEO6+daLLlrNovI/3nKXPmfdR4zL5XqK9wLzxsP4DamAFBpy1xAUwtGaYWwA9SAwYMe6Qv8bberXuB/N3ucBaP/Qcoc4eDG8AZLPfUwT70wbQbWQu/Gcru7Fnac0Auf4++r2girtZ7m8hZSdxa9fk2hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=r14hjicm; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="r14hjicm"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id CCA54D1DB0;
	Sat, 10 Oct 2026 20:19:26 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro CCA54D1DB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791652768;
	bh=OO3R0JEy8s7XH8QUYHdYFOl9vj2bnIovxBu2rO5p+FE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=r14hjicmZ+9QCuFuYCnk5zm/r0sFS0fT0rHQGQa/bx0BUy7TlSf1Bz5Eh8hMH+tme
	 DzB8BcInbbw2j3mlXTHdWyd+3Cnc4pSPG8lie8LNllTZ04jagglKhN0++8EL7v67Aq
	 6gtXzxrnGnOFyLrOc9M1r7hDctMo41fWC1bO7nLuzQ8cMvX+kAY9LmT+ZYIqpRYN+R
	 28IVm2adjJd4fFVDucC8S7jG+P5zY5ZFh63g1+2AxWFPZA6khiFL5XGYAyMa5pnByr
	 lGwNry6xqR/G4tupdqdbZZzHxo90dZN3ZZi+yNXDbgjkntQQHXtnbdXdaLZ87+NqJG
	 VzqdrdwATIvOA==
Message-ID: <5e6d5d408e690e81ad82efdfb7d7fde2e20f24e3.camel@rendec.net>
Subject: Re: [PATCH v4 4/8] irqchip/al-fic: switch to shared parent interrupt
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 13:19:25 -0400
In-Reply-To: <20261008090058.38591-5-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
	 <20261008090058.38591-5-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-08 at 09:00 +0000, Eliav Farber wrote:
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
> the standard irqreturn_t prototype and reports whether this instance had
> anything pending, so the shared-IRQ core can tell which instance on the
> line raised the interrupt. IRQF_NO_THREAD is set because the handler only
> demultiplexes to the child domain and must not be forced-threaded; all
> instances sharing a parent line agree on this flag, as the shared-IRQ cor=
e
> requires.
>=20
> The handler reads the group's cause register and returns IRQ_HANDLED when
> any unmasked cause bit is set, IRQ_NONE otherwise. That is the signal the
> shared-IRQ core needs - "did this instance's hardware raise the line" -
> rather than the result of dispatching to the child domain.
>=20
> For that filter to be right, gc->mask_cache must be valid before the pare=
nt
> is requested. IRQ_GC_INIT_MASK_CACHE seeds it from the mask register only
> on the first child mapping, and never at all for a group with no consumer
> in the devicetree; until then the cache reads 0 and every latched cause b=
it
> passes the filter. Seed it from the value al_fic_wire_init() programmed a=
nd
> drop the flag; nothing can change the register in between, so the read
> could only have returned that same value.
>=20
> request_irq() can fail, unlike irq_set_chained_handler_and_data(), so add
> an error path for it. Set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain after
> creating it, so irq_domain_remove() tears the generic chips down too and
> the single call suffices for both the chip-allocation and request_irq()
> failure paths.
>=20
> Co-developed-by: Talel Shenhar <talel@amazon.com>
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v4:
> =C2=A0- Seed gc->mask_cache before request_irq() and drop
> =C2=A0=C2=A0 IRQ_GC_INIT_MASK_CACHE. The flag only seeds the cache on the=
 first
> =C2=A0=C2=A0 child mapping, which is too late once the handler is shared =
and never
> =C2=A0=C2=A0 happens for a group with no consumer in the devicetree. Foun=
d by
> =C2=A0=C2=A0 sashiko-bot on the v3 posting.
> =C2=A0- Drop Radu Rendec's Reviewed-by, since the above is a functional
> =C2=A0=C2=A0 change.
> =C2=A0- The commit message no longer claims the domain-sized dispatch loo=
p
> =C2=A0=C2=A0 always succeeds; with the cache seeded, only mapped bits rea=
ch it.
>=20
> v3:
> =C2=A0- al_fic_irq_handler() no longer derives IRQ_HANDLED/IRQ_NONE from
> =C2=A0=C2=A0 generic_handle_domain_irq(), whose return value only reports=
 whether
> =C2=A0=C2=A0 the hwirq to virq mapping succeeded - and since the loop ite=
rates
> =C2=A0=C2=A0 exactly NR_FIC_IRQS bits, which is the domain's own size, th=
at mapping
> =C2=A0=C2=A0 always succeeds. Return IRQ_HANDLED when the masked CAUSE sn=
apshot is
> =C2=A0=C2=A0 non-zero instead, which is the correct signal for a shared i=
nterrupt.
> =C2=A0- Set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain and let
> =C2=A0=C2=A0 irq_domain_remove() free the generic chips, instead of calli=
ng
> =C2=A0=C2=A0 irq_domain_remove_generic_chips() by hand. Both error paths =
now go
> =C2=A0=C2=A0 through one label. The invalid-free fix from v2 is unaffecte=
d; only the
> =C2=A0=C2=A0 teardown mechanism changed.
> =C2=A0- Use of_node_full_name() in the request_irq() call.
>=20
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
> =C2=A0drivers/irqchip/irq-al-fic.c | 38 +++++++++++++++++++++++++--------=
---
> =C2=A01 file changed, 27 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index ee06d0123b7a..fda9c05a639f 100644
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
> @@ -95,24 +95,21 @@ static int al_fic_irq_set_type(struct irq_data *data,=
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
> =C2=A0	unsigned long pending;
> =C2=A0	u32 hwirq;
> =C2=A0
> -	chained_irq_enter(irqchip, desc);
> -
> =C2=A0	pending =3D readl_relaxed(fic->base + AL_FIC_CAUSE);
> =C2=A0	pending &=3D ~gc->mask_cache;
> =C2=A0
> =C2=A0	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
> =C2=A0		generic_handle_domain_irq(domain, hwirq);
> =C2=A0
> -	chained_irq_exit(irqchip, desc);
> +	return pending ? IRQ_HANDLED : IRQ_NONE;
> =C2=A0}
> =C2=A0
> =C2=A0static int al_fic_irq_retrigger(struct irq_data *data)
> @@ -140,11 +137,17 @@ static int al_fic_register(struct device_node *node=
,
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> +	/*
> +	 * Let irq_domain_remove() free the generic chips on either error path
> +	 * below, instead of calling irq_domain_remove_generic_chips() by hand.
> +	 */
> +	fic->domain->flags |=3D IRQ_DOMAIN_FLAG_DESTROY_GC;
> +
> =C2=A0	ret =3D irq_alloc_domain_generic_chips(fic->domain,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 NR_FIC_IRQS,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 1, of_node_full_name(fic->node),
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 handle_level_irq,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, IRQ_GC_INIT_MASK_CACHE);
> +					=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, 0);
> =C2=A0	if (ret) {
> =C2=A0		pr_err("fail to allocate generic chip (%d)\n", ret);
> =C2=A0		goto err_domain_remove;
> @@ -162,9 +165,22 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
> =C2=A0	gc->private =3D fic;
> =C2=A0
> -	irq_set_chained_handler_and_data(fic->parent_irq,
> -					 al_fic_irq_handler,
> -					 fic);
> +	/*
> +	 * Seed the mask cache with the value al_fic_wire_init() programmed,
> +	 * rather than having the generic chip read the register back on the
> +	 * first child mapping: that is later than the parent is requested, and
> +	 * never happens at all for a group with no consumer in the devicetree.
> +	 */
> +	gc->mask_cache =3D ~0U;
> +
> +	ret =3D request_irq(fic->parent_irq, al_fic_irq_handler,
> +			=C2=A0 IRQF_NO_THREAD | IRQF_SHARED,
> +			=C2=A0 of_node_full_name(fic->node), fic);
> +	if (ret) {
> +		pr_err("fail to request irq (%d)\n", ret);
> +		goto err_domain_remove;
> +	}
> +
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_domain_remove:

Reviewed-by: Radu Rendec <radu@rendec.net>
