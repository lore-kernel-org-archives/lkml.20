Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137525771;
	Thu,  8 Oct 2026 01:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791421580; cv=none; b=FtJzCXXj2ITSqnwHhj4/Ejb7HapJpvoFcVxfTOCfqk73WwpOnl2b6YnIgfSBX4PmcVRgTdln0t5vq+i8P8XYXs+ljQkC+NW3atQOWjsi/T3Zt1fykFoJdYpEo4XINjI/wVHU/8EZQqxUJzDwwcqDqljtkfuG6b7E7tqtesD6CdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791421580; c=relaxed/simple;
	bh=BTIiAkHmmPZ3YT91zPQo5SUz+szAhHezBmheYQ1U29M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHMvTXXnRxLYzJJQHQ2vI9HCpCDrtkXLLU2vc110KAxaLI7inComBty/UtiuWCz/9mFxU1B8h7Jr7KXKYexnfRHpgJbC6PEQ6uDAbRJqyLEAUTmS1QtSRsex9Ho2AVFvZ4bGkSXfwG9nfveE9l9c+DxQ0lp4wdl6xFZbCKKDAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=Jn7KL30v; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="Jn7KL30v"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 492C4D1981;
	Thu,  8 Oct 2026 04:06:15 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 492C4D1981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791421576;
	bh=xMR2mqoxdAjV/m3DL2BQvYc3x73SpXeKkksDWX4A2Cg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Jn7KL30vTQAoKJdcNuUXb1AJRCWsFaUdk8HSkOoDYLOB+iYVDiKskexg0R4RoCobW
	 cCO7OWABFbRJmZLMAyb57EfXvEChuFb2TsFqIehBCcwpdTEqfK5QMsOsxHXGuy3VrE
	 ax9k6DQSHB6SY94vup7HvJBV+XGJZ+MX3ouVn8pmSZag3JdUFfi/J8RQwiTNviHrqI
	 dCP/WhkuFYCjkE0ryhIyi2B6aTJkOgYGzclrDjUBbX7o56UmcrkwlB+fpGBducQcl0
	 O9qImUSdYWLTTkdO+OBI2HugSRNdxlVHytjAMIAOu13ZE7F3BQjNso4+MPBtg/QMz1
	 q4DjCnfiGQ7Eg==
Message-ID: <6b831f3d973d078a6836aba07d70ac720b59d52f.camel@rendec.net>
Subject: Re: [PATCH v3 4/8] irqchip/al-fic: switch to shared parent interrupt
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 21:06:13 -0400
In-Reply-To: <20261005112458.22291-5-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
	 <20261005112458.22291-5-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-05 at 11:24 +0000, Eliav Farber wrote:
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
> rather than the result of dispatching to the child domain, which for a
> domain sized exactly to the cause register always succeeds.
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
> =C2=A0drivers/irqchip/irq-al-fic.c | 28 ++++++++++++++++++----------
> =C2=A01 file changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index ee06d0123b7a..4c60da8558ed 100644
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
> @@ -140,6 +137,12 @@ static int al_fic_register(struct device_node *node,
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
> @@ -162,9 +165,14 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
> =C2=A0	gc->private =3D fic;
> =C2=A0
> -	irq_set_chained_handler_and_data(fic->parent_irq,
> -					 al_fic_irq_handler,
> -					 fic);
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
