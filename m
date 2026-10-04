Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED130F81A;
	Sun,  4 Oct 2026 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135640; cv=none; b=Pa+LAX+h1D5+C24oOHgvFZ0ox3PXD9OVHAsv916jCUm0k8QVyYGdaa69vsqCrvXhi9mztajMrpnieMxWqo0dS+/IaMpXpaBwqo73b7BRSNtDT9YWblUrIe4by4xb3baQAfaxhot2NzzMnQQxu140Kz+3E+XjVmAxqEK5lc79g6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135640; c=relaxed/simple;
	bh=VW/+iyExdc+2iOAd3j+QXgnO+Z0VCLUK6ieivCfSYYQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ALKWU10ntJFwT9Jtl8A9bssPGaIBNGjdmSxV/T1WFeT3m9VUk/0WfWx8HaKYljOA34f8TguSnsvgTW9bQKTmae3ktPL6oxLSlWnVZAQq5ogSf/YDJZT3UuRMj2jC3dyHJgw10EHFNaYD6XDKz9oAgkJ8s+NRy8EKGkwfOvOVOVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=OrsEMiBJ; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="OrsEMiBJ"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 3275AD194D;
	Sun,  4 Oct 2026 20:40:34 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 3275AD194D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791135635;
	bh=gTMT6C5QDJwCOceUbT3/x7Kgr+Smbc4+5/9YsDmNC8k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OrsEMiBJ9caoLyJTqbGOdAgDw/qtTr81cKHnTThx5IPHDjwCKJNrnN3MzFiekMeCP
	 KCrRu8S54s7RKmuwrVTacWxRh3C4/coBXzi5dfVRqPmJsRd/FV/pYhBK41GcOZ/QAi
	 IkgtayE+ugosjtV7HG2DyRlq5k2bZ3D3r8kifp3vuv2D9yTHf3AU840Aw2hGUa6tHj
	 8lZRJ3faJd88Rj6G+zrvEkaeHPKYmWDQQQ3355UNCDRddyU2D0RxKtTzZn6veYZo2y
	 s9tjRMCZ33ggtyj8Jxt6uPmQ25sYt9LyHSXkyppDYeFoR8Bfj2GcFJD1WYaW8EpNWo
	 uV2CGw86wzRcA==
Message-ID: <9f281f3c922c1b64a7a74a91e178990c798840e7.camel@rendec.net>
Subject: Re: [PATCH v2 3/8] irqchip/al-fic: keep the device_node instead of
 a cached name string
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 13:40:32 -0400
In-Reply-To: <20260927080637.27285-4-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-4-farbere@amazon.com>
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
> struct al_fic cached a "const char *name" that al_fic_wire_init() receive=
d
> as a separate argument and set from node->name. That string was never own=
ed
> by the driver: it aliased storage inside the device_node and stayed valid
> only as long as the node did, yet nothing in the struct held the node to
> express that dependency. Keep the device_node in the struct instead: it
> holds the owning object rather than a bare pointer into it, lets each sit=
e
> derive the name on demand, and gives the driver the node it needs in the
> next change, which requests the parent interrupt by the node's full_name.

That makes sense. But keeping a pointer to the whole structure instead
of aliasing a pointer inside the structure makes no additional
guarantees w.r.t. the lifetime of that structure, it just makes the
intention more obvious.

What prevents the "struct device_node" from going away after the init
function returns?=C2=A0It cannot go away before it returns because the init
function is called as desc->irq_init_cb() from of_irq_init(), while
holding a reference to the node. I *think* the assumption that it can
never go away (even after the init function returns) is correct because
the code in of_irq_init() seems to deliberately "leak" a reference to
the node. But this is not documented anywhere. So perhaps it's worth
calling it out at least in the commit message.

Rob, you're a maintainer for drivers/of/irq.c and it looks like you
merged most (or all?) of the recent patches to it. Perhaps you can help
us and explain how this is supposed to work?

> The irqchip callback that has no device_node in scope now prints the
> instance with %pOF, which formats the node on demand, and the name argume=
nt
> threaded through al_fic_wire_init() goes away.
>=20
> irq_alloc_domain_generic_chips() keeps the pointer it is given, so it now
> uses node->full_name. This changes the generic chip name from the bare
> node name (e.g. "interrupt-controller") to the full node name including
> its unit address (e.g. "interrupt-controller@fd8a8500"), which keeps
> instances that share a bare name distinguishable.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: new patch. Keep the device_node in struct al_fic instead of a cached
> =C2=A0=C2=A0=C2=A0 name string that aliased node storage. Introduced here=
 so the struct
> =C2=A0=C2=A0=C2=A0 holds the node before the next patch requests the pare=
nt interrupt by
> =C2=A0=C2=A0=C2=A0 node->full_name, keeping every commit buildable on its=
 own.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 13 +++++--------
> =C2=A01 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 760bd08dcff4..c7cc2631caf8 100644
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
> +					=C2=A0=C2=A0=C2=A0=C2=A0 1, fic->node->full_name,

nit: should this use of_node_full_name() instead? Not that fic->node
can be null, but if there is an accessor, why not use it?

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
> +	fic->node =3D node;
> =C2=A0
> =C2=A0	/* mask out all interrupts */
> =C2=A0	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
> @@ -254,7 +252,6 @@ static int __init al_fic_init_dt(struct device_node *=
node,
> =C2=A0
> =C2=A0	fic =3D al_fic_wire_init(node,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent_irq);
> =C2=A0	if (IS_ERR(fic)) {
> =C2=A0		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
