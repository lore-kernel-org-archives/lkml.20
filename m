Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FE9399375;
	Mon, 12 Oct 2026 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831239; cv=none; b=oDhpIRLJtj8nmsWjrazDvEFEA1iHtOZ59lgNKAOqhy3xMAsN2wwuICIARtRP/LAths/0ru3vKvUbK3fuR5qMWz+KAV7h9fRFQ7ptPuAGB6tf8DGpX0z3I620nf2OGv5DSo2x6mBp2cSuGoZD7dJR+wD4yUD8/wUmU7/dnIB9ZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831239; c=relaxed/simple;
	bh=kcjtZCcWSE9BqxihuctKPfeAc7Wg8PGV2T3IOXaxQgU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UR4XobyBWsnYQB2WK1D5fMAsgIlMl7CrYshaBwSTwv6KdQ4+vaHmZh44HTz2OpU3iMsM+sazWYmh3yqr8ziEDM6Qnf9XcVrjm/I71rsUsgl/lTmi09VLQ37U6704XbA01THi8z2XmKN/4T3bMJSfEyaPP0EUjJ7c4TyIddSxm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=Nsdspg1o; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="Nsdspg1o"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 36904D1DF5;
	Mon, 12 Oct 2026 21:53:51 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 36904D1DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791831232;
	bh=EGsr8JXK0AWygCjGQFvkFgJKYcyFG2i+Yihz7XwH6nE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Nsdspg1o5Q+Cu7ODNRcYU43+YokeJhCu5q87Yd7tehWnJc068mdNWpScqFDCudhfg
	 k+DvW53pCBl2+zL8v2o67YHnkiivMyiK2yzfyp0zWl0ryiNST4uMnVQeLhdCE7hfQM
	 Gdn1VnGorN3ai282RPX4auHbeC778kNLljq8pFZIxfWWB6jR0vgILhgg4pIV5mm3BX
	 meSH3GZ/Ngv5eWnopO5LIRryY6fZ4iwJIt+xokz9JD0vvaNHZPCKAtzh24eYlCTULC
	 QfEVgIZNg1ZQgtVw2Yb91cXNxnJDfYpVDnIFO11npo2tizLdA2u37aCLocxrc8UfBM
	 KP4pOHkYwa/pg==
Message-ID: <cc0d2ddc716ca1a5fbcf9a8952f255a4100b3366.camel@rendec.net>
Subject: Re: [PATCH v5 4/9] irqchip/al-fic: keep the device_node instead of
 a cached name string
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 14:53:49 -0400
In-Reply-To: <20261011050449.41903-5-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
	 <20261011050449.41903-5-farbere@amazon.com>
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
> struct al_fic cached a const char *name that al_fic_wire_init() set
> from node->name. That string pointed into the device_node, so the
> driver already depended on the node outliving init, but nothing in the
> struct said so.
>=20
> Keep the device_node itself and derive the name where it is needed. The
> dependency does not go away: of_node_full_name() also returns a pointer
> into the node, and irq_alloc_domain_generic_chips() keeps the string it
> is given.
>=20
> The driver therefore needs its own reference. of_irq_init() holds one
> across the init callback, but since commit 30724547b221 ("of/irq: Fix
> remaining refcount leaks in of_irq_init()") it drops that reference
> again when it drains its parent list. Take a reference where the
> pointer is stored and drop it on the error path. The driver is
> __init-only with no teardown, so on success it is held for the life of
> the system.
>=20
> Deriving the name this way also changes the generic chip name from the
> bare node name (e.g. "interrupt-controller") to the full name including
> the unit address (e.g. "interrupt-controller@fd8a8500"), which keeps
> instances that share a bare name distinguishable.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v5:
> =C2=A0- Take a reference on the device_node where the driver stores it, a=
nd
> =C2=A0=C2=A0 drop it on the error path. of_irq_init() no longer holds one=
 past the
> =C2=A0=C2=A0 init callback: commit 30724547b221 ("of/irq: Fix remaining r=
efcount
> =C2=A0=C2=A0 leaks in of_irq_init()") drops it when the parent list is dr=
ained.
> =C2=A0- Rewrite the commit message accordingly. It previously argued that
> =C2=A0=C2=A0 of_irq_init() never drops the reference on a successful init=
, which is
> =C2=A0=C2=A0 no longer true, and that this patch therefore fixed no lifet=
ime bug.
>=20
> v4: no change.
>=20
> v3:
> =C2=A0- Use of_node_full_name() instead of reaching into node->full_name
> =C2=A0=C2=A0 directly, as Radu Rendec suggested.
> =C2=A0- Rewrite the commit message to say plainly that this patch does no=
t fix
> =C2=A0=C2=A0 a lifetime bug. of_irq_init() takes a reference on the node =
before
> =C2=A0=C2=A0 calling the driver's init callback and does not drop it on a
> =C2=A0=C2=A0 successful init, so the node, and the storage node->name poi=
nts into,
> =C2=A0=C2=A0 is pinned for the life of the system either way. The value o=
f keeping
> =C2=A0=C2=A0 the device_node is making that dependency explicit, not clos=
ing a
> =C2=A0=C2=A0 real one.
>=20
> v2: new patch. Keep the device_node in struct al_fic instead of a cached
> =C2=A0=C2=A0=C2=A0 name string that aliased node storage. Introduced here=
 so the struct
> =C2=A0=C2=A0=C2=A0 holds the node before the next patch requests the pare=
nt interrupt by
> =C2=A0=C2=A0=C2=A0 node->full_name, keeping every commit buildable on its=
 own.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 14 ++++++--------
> =C2=A01 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 1a7f851731b2..32d8098699a4 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -36,7 +36,7 @@ enum al_fic_state {
> =C2=A0struct al_fic {
> =C2=A0	void __iomem *base;
> =C2=A0	struct irq_domain *domain;
> -	const char *name;
> +	struct device_node *node;
> =C2=A0	unsigned int parent_irq;
> =C2=A0	enum al_fic_state state;
> =C2=A0};
> @@ -89,7 +89,7 @@ static int al_fic_irq_set_type(struct irq_data *data, u=
nsigned int flow_type)
> =C2=A0	if (fic->state =3D=3D AL_FIC_UNCONFIGURED) {
> =C2=A0		al_fic_set_trigger(fic, gc, new_state);
> =C2=A0	} else if (fic->state !=3D new_state) {
> -		pr_debug("fic %s state already configured to %d\n", fic->name, fic->st=
ate);
> +		pr_debug("fic %pOF state already configured to %d\n", fic->node, fic->=
state);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0	return 0;
> @@ -142,7 +142,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0
> =C2=A0	ret =3D irq_alloc_domain_generic_chips(fic->domain,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 NR_FIC_IRQS,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 1, fic->name,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 1, of_node_full_name(fic->node),
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 handle_level_irq,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, IRQ_GC_INIT_MASK_CACHE);
> =C2=A0	if (ret) {
> @@ -175,9 +175,8 @@ static int al_fic_register(struct device_node *node,
> =C2=A0
> =C2=A0/*
> =C2=A0 * al_fic_wire_init() - initialize and configure fic in wire mode
> - * @of_node: optional pointer to interrupt controller's device tree node=
.
> + * @node: pointer to the interrupt controller's device tree node
> =C2=A0 * @base: mmio to fic register
> - * @name: name of the fic
> =C2=A0 * @parent_irq: interrupt of parent
> =C2=A0 *
> =C2=A0 * This API will configure the fic hardware to work in wire mode.
> @@ -187,7 +186,6 @@ static int al_fic_register(struct device_node *node,
> =C2=A0 */
> =C2=A0static struct al_fic *al_fic_wire_init(struct device_node *node,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void __iomem *base,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int parent_irq)
> =C2=A0{
> =C2=A0	struct al_fic *fic;
> @@ -200,7 +198,7 @@ static struct al_fic *al_fic_wire_init(struct device_=
node *node,
> =C2=A0
> =C2=A0	fic->base =3D base;
> =C2=A0	fic->parent_irq =3D parent_irq;
> -	fic->name =3D name;
> +	fic->node =3D of_node_get(node);
> =C2=A0
> =C2=A0	/* mask out all interrupts */
> =C2=A0	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
> @@ -222,6 +220,7 @@ static struct al_fic *al_fic_wire_init(struct device_=
node *node,
> =C2=A0	return fic;
> =C2=A0
> =C2=A0err_free:
> +	of_node_put(fic->node);
> =C2=A0	kfree(fic);
> =C2=A0	return ERR_PTR(ret);
> =C2=A0}
> @@ -254,7 +253,6 @@ static int __init al_fic_init_dt(struct device_node *=
node,
> =C2=A0
> =C2=A0	fic =3D al_fic_wire_init(node,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent_irq);
> =C2=A0	if (IS_ERR(fic)) {
> =C2=A0		pr_err("%pOF: fail to initialize irqchip (%pe)\n",

Reviewed-by: Radu Rendec <radu@rendec.net>
