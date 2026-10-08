Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243052931FF;
	Thu,  8 Oct 2026 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791421543; cv=none; b=So8XirU/Ij/kA+88gkvGcYHPM+JyyA4xAKGlj3/nLqhQeH0WSI9bMrCxCYQ1uYItLOac6XBP/xNEcsYU4wx7gvRri1m6pXUebYuXjYDUu1rMp3vOJ+r2wyL4FYlbvp7cTNwus5NjMm0qFlwwHltKpC+Rw/PAMrslmjRMTSO7vp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791421543; c=relaxed/simple;
	bh=vsfyrYB/K4bn46113qwqLgELnG7qhZHDNF8caNeT+qw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lDqfzbbqzM7k7s6xFJj2sxfH/OQozXfSuvy2ymoKhDpAImguGjOMtN0RIw1pJiBmfdIpRJTOwRc4bn65Tvfe5INZuUpzzx2p2/U9Fb8X4xK+L08sSxERCbnRJ43XP8zFO4rxnLnvSc49xM51BsldwiNdRyG55Z6k6QucsclMeIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=ZyysSu3h; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="ZyysSu3h"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 8AE2DD1981;
	Thu,  8 Oct 2026 04:05:37 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 8AE2DD1981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791421538;
	bh=DoW4aSyZxx4ROObW8J7r7paBi9p3Wb2i+BSOWhUZPKA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZyysSu3hxVaEw6UWsuM3Cm3/g7A/KwN3kbtoV0QbOAbstyZWqpAi8b+q8rIfEaS+E
	 j0HVUTMYehtACH2ZQgP7SqxOIe+QrYBZME3F68CUfgT415KuT1V7BadE95slZfwueB
	 ho3IdiKJTh66eVsi8kzQObTCioxtutxkGKs7KIIuTfpWVeZtZvWYjfU2lJ85LFV1Tj
	 y9zeh5t2mPVFXQSqkWnAgC2fDeASc6Vaq8mAdyWeaYarZaiVMMLQEioAtheSOGOY/Y
	 BZc+7v3y1MXseqvOY2AniMkbBOBX5exHrzvKf7JYKrCl2/1S4LCJox+GTgPcAeO2EJ
	 bGQd86C9HkfCg==
Message-ID: <eecb82562b7ac66f6532b0a17ac1ed3bc4c7a50f.camel@rendec.net>
Subject: Re: [PATCH v3 3/8] irqchip/al-fic: keep the device_node instead of
 a cached name string
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 21:05:35 -0400
In-Reply-To: <20261005112458.22291-4-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
	 <20261005112458.22291-4-farbere@amazon.com>
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
> struct al_fic cached a "const char *name" that al_fic_wire_init() receive=
d
> as a separate argument and set from node->name. That string aliased
> storage inside the device_node rather than being owned by the driver, but
> nothing in the struct expressed that dependency - al_fic just held a bare
> pointer with no indication of what it pointed into or why it stayed valid=
.
>=20
> This is not fixing a lifetime bug - of_irq_init() takes a reference on
> the node before calling the driver's init callback and never drops it on
> a successful init, so the node is pinned for the life of the system
> either way, and node->name was never actually at risk of dangling.
>=20
> Keeping the device_node in the struct instead of the bare name is about
> making the dependency explicit rather than closing a real one: it holds
> the object the name is derived from, and lets each site derive the name
> on demand instead of carrying a pointer whose validity nothing in the
> struct asserts.
>=20
> The irqchip callback that has no device_node in scope now prints the
> instance with %pOF, which formats the node on demand, and the name argume=
nt
> threaded through al_fic_wire_init() goes away.
>=20
> irq_alloc_domain_generic_chips() keeps the pointer it is given, so it now
> uses of_node_full_name(). This changes the generic chip name from the bar=
e
> node name (e.g. "interrupt-controller") to the full node name including
> its unit address (e.g. "interrupt-controller@fd8a8500"), which keeps
> instances that share a bare name distinguishable.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
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
> =C2=A0drivers/irqchip/irq-al-fic.c | 13 +++++--------
> =C2=A01 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 760bd08dcff4..ee06d0123b7a 100644
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

Reviewed-by: Radu Rendec <radu@rendec.net>
