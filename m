Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741D22FE0E;
	Sat, 10 Oct 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791654246; cv=none; b=RlASQ2Ph6mTKHy02h6pScu7h7p2IL4Jm/avRvcyq042an3ThVHgCmlnYZ6AKk120ybHh7gs15d9RWbUY3dvblecCmUrwxMff1AI+6UIL/SfVdYiOO7Q0WbWmNUpVLpL9GkDGdmyJ7QlBo2+McVMxINIazYaDskadWT6E/5fMSDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791654246; c=relaxed/simple;
	bh=StaBdowZftF4I5EMfWMOuJ5d6f6SdYOrker2dBRmSNw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQzCOB3NEg1fALLoVmz6UU5UFUCB1vb8f0dzSsF8gMyUm9TZTjO14E2KTayetI4lbRAfPfmUANHgZK6Lw5Z4NzCHbFtZIjJR6PLiPrqo6s8/sn8/Y6SfpVF5ygsAVNfHD+iaDd/ajy6eZcM8EqLquW18XqyLXAWyzd9vnrljPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=iYy4DWJv; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="iYy4DWJv"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D64ACD1A1D;
	Sat, 10 Oct 2026 20:44:00 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D64ACD1A1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791654242;
	bh=XtLQBdL2ON0iIQ+YBo4FoZC7l7L80VooLRQR1DY9q/E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iYy4DWJvfn4gQNzH6yVqhMe1nOcQlXqIaZtlCuJPZiZ+J+PsBusDS5qEZCKhtB1M/
	 R2QqpXmKXRVBK3/94dG/RQekGw0GXtortYSXtFJLym9RRC3eYLWHuw+8pIugxu9dnz
	 mkzbrFv5dQa0bMFWMtN5UD7em/LmswqjfwIDtF8Wg5vY9FNsx9fGUtMAULXoR+I3rI
	 chH6zCwhYMFfkQUrfd6/FJJbofISXF1JR62odG6d7+tYo6vChAHyDp/tMOdjjBDb77
	 84kA5Nxfeyay9Xs2D60+fn4h+djVWj9QX+RkgecfwH/KpqGNBgFAyIT96urOxm88TQ
	 OeK7ChRezeA6A==
Message-ID: <947e93b2fedaebccea3d99161d396f2539bd9e40.camel@rendec.net>
Subject: Re: [PATCH v4 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 13:43:59 -0400
In-Reply-To: <20261008090058.38591-7-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
	 <20261008090058.38591-7-farbere@amazon.com>
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
> FIC v2 hardware adds two interrupt outputs on top of the info output: an
> error output and a fatal output, each with its own mask register
> (AL_FIC_ERROR_MASK, AL_FIC_FATAL_MASK). A group drives exactly one of the
> three outputs.
>=20
> Read which output a group drives from the amazon,al-fic-mask devicetree
> property (info, error or fatal; absent means info) and program the
> matching mask register. Detect the hardware revision from the CONTROL
> register version field (bits 28-29). The revision is not in the
> devicetree, so requesting the error or fatal output on a v1 device - whic=
h
> has neither - is rejected at probe against the register.
>=20
> Name the selected output in the probe log line, in place of the "Legacy
> mode" text it replaces. A booted system then shows which output each grou=
p
> drives.
>=20
> The "v1" and "v2" names are this driver's labels for the CONTROL
> version field encoding (0 and 1).
>=20
> The driver seeds mask_cache from the value it programs rather than having
> the generic chip read the mask register back, so the error and fatal mask
> registers are never read - which also sidesteps the v2 erratum where they
> always read as 0 regardless of their contents.
>=20
> Reading CONTROL to get the version field turns the write that follows int=
o
> a read-modify-write instead of a value built from CONTROL_MASK_MSI_X
> alone. Every RW bit in this register resets to 0, so the two are
> equivalent at probe time; the read-modify-write is kept anyway as the
> better practice; it costs nothing and does not depend on the reset value
> staying 0.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v4: drop the gc_flags local and the revision-gated condition that cleared
> =C2=A0=C2=A0=C2=A0 IRQ_GC_INIT_MASK_CACHE for the v2 error and fatal outp=
uts. Patch 4 now
> =C2=A0=C2=A0=C2=A0 seeds mask_cache unconditionally and does not ask for =
the flag at all,
> =C2=A0=C2=A0=C2=A0 so there is nothing left for this patch to gate. The e=
num
> =C2=A0=C2=A0=C2=A0 al_fic_version parameter on al_fic_register() goes wit=
h it, since the
> =C2=A0=C2=A0=C2=A0 condition was its only user. The v2 read-back erratum =
is now stated in
> =C2=A0=C2=A0=C2=A0 the commit message as a consequence of seeding rather =
than as the
> =C2=A0=C2=A0=C2=A0 reason for a per-revision workaround.
>=20
> v3:
> =C2=A0- Initialise gc_flags to IRQ_GC_INIT_MASK_CACHE at its declaration =
and
> =C2=A0=C2=A0 only clear it on the FIC v2 error/fatal path, dropping the e=
lse
> =C2=A0=C2=A0 branch.
> =C2=A0- Use ~0U instead of 0xFFFFFFFF, for the mask_cache seed and for th=
e
> =C2=A0=C2=A0 three mask register writes.
> =C2=A0- Explain the control register read-modify-write in the commit mess=
age.
> =C2=A0=C2=A0 Every writable bit in that register resets to 0, so preservi=
ng the
> =C2=A0=C2=A0 other bits is equivalent to the previous plain write at prob=
e time. It
> =C2=A0=C2=A0 is better practice, not a behaviour fix.
>=20
> v2:
> =C2=A0- Fix the v2 mask_cache workaround, which was dead in v1. mask_cach=
e is
> =C2=A0=C2=A0 not seeded until the first child mapping (irq_map_generic_ch=
ip), so the
> =C2=A0=C2=A0 v1 override was overwritten with 0 and the first unmask then=
 cleared the
> =C2=A0=C2=A0 whole mask register, unmasking all 32 sources. Drop
> =C2=A0=C2=A0 IRQ_GC_INIT_MASK_CACHE for the error and fatal outputs and s=
eed
> =C2=A0=C2=A0 mask_cache from the value al_fic_wire_init() programmed. Com=
mit message
> =C2=A0=C2=A0 rewritten to state the real timing and consequence.
> =C2=A0- Read the output from the new amazon,al-fic-mask property (was per=
-output
> =C2=A0=C2=A0 compatible in v1).
> =C2=A0- Label the mask in the probe log line (mask=3D%s).
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 108 +++++++++++++++++++++++++++++++-=
---
> =C2=A01 file changed, 98 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index fda9c05a639f..d5671b9624db 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -16,11 +16,14 @@
> =C2=A0/* FIC Registers */
> =C2=A0#define AL_FIC_CAUSE		0x00
> =C2=A0#define AL_FIC_SET_CAUSE	0x08
> -#define AL_FIC_MASK		0x10
> +#define AL_FIC_INFO_MASK	0x10
> =C2=A0#define AL_FIC_CONTROL		0x28
> +#define AL_FIC_ERROR_MASK	0x2c
> +#define AL_FIC_FATAL_MASK	0x34
> =C2=A0
> =C2=A0#define CONTROL_TRIGGER_RISING	BIT(3)
> =C2=A0#define CONTROL_MASK_MSI_X	BIT(5)
> +#define CONTROL_VERSION_ID	GENMASK(29, 28)
> =C2=A0
> =C2=A0#define NR_FIC_IRQS 32
> =C2=A0
> @@ -33,6 +36,37 @@ enum al_fic_state {
> =C2=A0	AL_FIC_CONFIGURED_RISING_EDGE,
> =C2=A0};
> =C2=A0
> +/*
> + * FIC hardware revision, as reported by the CONTROL register version fi=
eld
> + * (CONTROL_VERSION_ID, bits 29-28). These are this driver's names for t=
hat
> + * field's encoding.
> + */
> +enum al_fic_version {
> +	AL_FIC_VERSION_V1,
> +	AL_FIC_VERSION_V2,
> +};
> +
> +enum al_fic_id {
> +	AL_FIC_ID_INFO,
> +	AL_FIC_ID_ERROR,
> +	AL_FIC_ID_FATAL,
> +	AL_FIC_ID_MAX,		/* keep last */
> +};
> +
> +/* Mask register offset for each interrupt group */
> +static const unsigned int al_fic_mask_offset[AL_FIC_ID_MAX] =3D {
> +	[AL_FIC_ID_INFO]=C2=A0 =3D AL_FIC_INFO_MASK,
> +	[AL_FIC_ID_ERROR] =3D AL_FIC_ERROR_MASK,
> +	[AL_FIC_ID_FATAL] =3D AL_FIC_FATAL_MASK,
> +};
> +
> +/* amazon,al-fic-mask property value for each interrupt group */
> +static const char * const al_fic_mask_name[AL_FIC_ID_MAX] =3D {
> +	[AL_FIC_ID_INFO]=C2=A0 =3D "info",
> +	[AL_FIC_ID_ERROR] =3D "error",
> +	[AL_FIC_ID_FATAL] =3D "fatal",
> +};
> +
> =C2=A0struct al_fic {
> =C2=A0	void __iomem *base;
> =C2=A0	struct irq_domain *domain;
> @@ -123,7 +157,8 @@ static int al_fic_irq_retrigger(struct irq_data *data=
)
> =C2=A0}
> =C2=A0
> =C2=A0static int al_fic_register(struct device_node *node,
> -			=C2=A0=C2=A0 struct al_fic *fic)
> +			=C2=A0=C2=A0 struct al_fic *fic,
> +			=C2=A0=C2=A0 enum al_fic_id fic_id)
> =C2=A0{
> =C2=A0	struct irq_chip_generic *gc;
> =C2=A0	int ret;
> @@ -155,7 +190,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0
> =C2=A0	gc =3D irq_get_domain_generic_chip(fic->domain, 0);
> =C2=A0	gc->reg_base =3D fic->base;
> -	gc->chip_types->regs.mask =3D AL_FIC_MASK;
> +	gc->chip_types->regs.mask =3D al_fic_mask_offset[fic_id];
> =C2=A0	gc->chip_types->regs.ack =3D AL_FIC_CAUSE;
> =C2=A0	gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
> =C2=A0	gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bit;
> @@ -194,6 +229,8 @@ static int al_fic_register(struct device_node *node,
> =C2=A0 * @node: pointer to the interrupt controller's device tree node
> =C2=A0 * @base: mmio to fic register
> =C2=A0 * @parent_irq: interrupt of parent
> + * @fic_id: which of the controller's outputs (info, error or fatal) thi=
s
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 group drives
> =C2=A0 *
> =C2=A0 * This API will configure the fic hardware to work in wire mode.
> =C2=A0 * In wire mode, fic hardware is generating a wire ("wired") interr=
upt.
> @@ -202,11 +239,13 @@ static int al_fic_register(struct device_node *node=
,
> =C2=A0 */
> =C2=A0static struct al_fic *al_fic_wire_init(struct device_node *node,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void __iomem *base,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int parent_irq)
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int parent_irq,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum al_fic_id fic_id)
> =C2=A0{
> =C2=A0	struct al_fic *fic;
> +	u32 version_id;
> +	u32 control;
> =C2=A0	int ret;
> -	u32 control =3D CONTROL_MASK_MSI_X;
> =C2=A0
> =C2=A0	fic =3D kzalloc_obj(*fic);
> =C2=A0	if (!fic)
> @@ -216,22 +255,37 @@ static struct al_fic *al_fic_wire_init(struct devic=
e_node *node,
> =C2=A0	fic->parent_irq =3D parent_irq;
> =C2=A0	fic->node =3D node;
> =C2=A0
> +	control =3D readl_relaxed(fic->base + AL_FIC_CONTROL);
> +	version_id =3D FIELD_GET(CONTROL_VERSION_ID, control);
> +	if (version_id =3D=3D AL_FIC_VERSION_V1 && fic_id !=3D AL_FIC_ID_INFO) =
{
> +		pr_err("%pOF: amazon,al-fic-mask =3D \"%s\" not available on FIC v1\n"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node, al_fic_mask_name[fic_id]);
> +		ret =3D -EINVAL;
> +		goto err_free;
> +	}
> +
> =C2=A0	/* mask out all interrupts */
> -	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
> +	writel_relaxed(~0U, fic->base + AL_FIC_INFO_MASK);
> +	if (version_id > AL_FIC_VERSION_V1) {
> +		writel_relaxed(~0U, fic->base + AL_FIC_ERROR_MASK);
> +		writel_relaxed(~0U, fic->base + AL_FIC_FATAL_MASK);
> +	}
> =C2=A0
> =C2=A0	/* clear any pending interrupt */
> =C2=A0	writel_relaxed(0, fic->base + AL_FIC_CAUSE);
> =C2=A0
> +	/* make sure the controller works in non msi_x mode */
> +	control |=3D CONTROL_MASK_MSI_X;
> =C2=A0	writel_relaxed(control, fic->base + AL_FIC_CONTROL);
> =C2=A0
> -	ret =3D al_fic_register(node, fic);
> +	ret =3D al_fic_register(node, fic, fic_id);
> =C2=A0	if (ret) {
> =C2=A0		pr_err("fail to register irqchip\n");
> =C2=A0		goto err_free;
> =C2=A0	}
> =C2=A0
> -	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=3D%u)=
\n",
> -		node, parent_irq);
> +	pr_info("%pOF initialized successfully (mask=3D%s parent-irq=3D%u)\n",
> +		node, al_fic_mask_name[fic_id], parent_irq);
> =C2=A0
> =C2=A0	return fic;
> =C2=A0
> @@ -240,11 +294,38 @@ static struct al_fic *al_fic_wire_init(struct devic=
e_node *node,
> =C2=A0	return ERR_PTR(ret);
> =C2=A0}
> =C2=A0
> +/*
> + * Parse the amazon,al-fic-mask property into an enum al_fic_id, selecti=
ng
> + * which of the controller's outputs this group drives. The property is
> + * optional; an absent property means the info output.
> + */
> +static int al_fic_parse_mask(struct device_node *node, enum al_fic_id *f=
ic_id)
> +{
> +	const char *mask;
> +	int ret;
> +
> +	ret =3D of_property_read_string(node, "amazon,al-fic-mask", &mask);
> +	if (ret =3D=3D -EINVAL) {
> +		*fic_id =3D AL_FIC_ID_INFO;
> +		return 0;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret =3D match_string(al_fic_mask_name, AL_FIC_ID_MAX, mask);
> +	if (ret < 0)
> +		return ret;
> +
> +	*fic_id =3D ret;
> +	return 0;
> +}
> +
> =C2=A0static int __init al_fic_init_dt(struct device_node *node,
> =C2=A0				 struct device_node *parent)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0	void __iomem *base;
> +	enum al_fic_id fic_id;
> =C2=A0	unsigned int parent_irq;
> =C2=A0	struct al_fic *fic;
> =C2=A0
> @@ -253,6 +334,12 @@ static int __init al_fic_init_dt(struct device_node =
*node,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> +	ret =3D al_fic_parse_mask(node, &fic_id);
> +	if (ret) {
> +		pr_err("%pOF: invalid amazon,al-fic-mask\n", node);
> +		return ret;
> +	}
> +
> =C2=A0	base =3D of_iomap(node, 0);
> =C2=A0	if (!base) {
> =C2=A0		pr_err("%pOF: fail to map memory\n", node);
> @@ -268,7 +355,8 @@ static int __init al_fic_init_dt(struct device_node *=
node,
> =C2=A0
> =C2=A0	fic =3D al_fic_wire_init(node,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent_irq);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent_irq,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fic_id);
> =C2=A0	if (IS_ERR(fic)) {
> =C2=A0		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node, PTR_ERR(fic));

Reviewed-by: Radu Rendec <radu@rendec.net>
