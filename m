Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD7265623;
	Mon,  5 Oct 2026 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162112; cv=none; b=fQZ54etFu7Qa4wUG1lBw+o28gJknaBrq/DveWBPvDAOEdwDQ133dd6PV7n0dcgi8jjTU8fPSd+8pzL0ukWRoalcucySLvLZNp8VwYqHAk5MZarlzRFQHHC3LmA3Vh/UCd33bHQFbDJ4QxhlwkdkP6ljNw9ELLx910v/zRqejDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162112; c=relaxed/simple;
	bh=LVK6A/HT70F1FfZ8zwFFzPMAy5/7tsqKZoGc4X0R/ZI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PjmHFne86Z8+FGp1SsKYejfaRxXLYvvPsXynos9FouN9coIluztDJKW6nq3pUoohm6MGQMeKx9bygukhZZzvsPF1k0fN3GS0J42mv871NDjNZzJ09LgaBc5KqxOPhmceM1A8FVMVX0a6jpAjiwptbbvmyfAI5zbYVbgcP3r5Acw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=eSIjaole; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="eSIjaole"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 4E7D6CCDF6;
	Mon,  5 Oct 2026 04:01:46 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 4E7D6CCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791162107;
	bh=G7rXzmsIHZJe0ivi9Rchrtlhxmzd2lfBm/+7HFLXoV0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eSIjaoleJAXHOTjvvcByGRHb9GDsiiArT17nNhDKTpKqlgOcqRoFa2awfVbNIlYO4
	 /dd9E8mJzzhSt/Y9c3gogPzAJ+q9pJ9pyApqw63MScMrLRZMDL2DyYPjDq0bCezfZ7
	 vsMyRezxYX4fg4dLUC8k7kOcndaelLZHwuRFJSMOlq84kZtxLzzBZLyX6COI2AF0MH
	 pw9IDc2VCLFYmnQuMjMyPM6l5oEUBcPa+j8tuxWMJI20KXin/ECTNF/oFuV0ckZB2r
	 UUZalIlaMnea4Cv7LtqH9SBS9kBqoFNxSPr3o6zNvQVk3ctVR9Mj7cn+94f2d1gmhb
	 ktajc5QoBPCgA==
Message-ID: <a74366542ddd5e0e3fca71c5dee5d535cc9c560e.camel@rendec.net>
Subject: Re: [PATCH v2 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 21:01:44 -0400
In-Reply-To: <20260927080637.27285-7-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-7-farbere@amazon.com>
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
> On v2 the error and fatal mask registers always read back as 0, regardles=
s
> of their actual contents. IRQ_GC_INIT_MASK_CACHE seeds mask_cache from th=
e
> mask register on the first child mapping, so on those two outputs it woul=
d
> seed 0: every source would appear unmasked, and the first unmask would
> write that 0 back and clear the whole mask register. Drop the flag for
> those two outputs and seed mask_cache with the value al_fic_wire_init()
> programmed instead. The info mask register is not affected, so the info
> output keeps the register-seeded mask_cache.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
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
> =C2=A0drivers/irqchip/irq-al-fic.c | 137 ++++++++++++++++++++++++++++++++=
---
> =C2=A01 file changed, 126 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 091a06abc0bb..35e366b4da30 100644
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
> @@ -126,11 +160,32 @@ static int al_fic_irq_retrigger(struct irq_data *da=
ta)
> =C2=A0}
> =C2=A0
> =C2=A0static int al_fic_register(struct device_node *node,
> -			=C2=A0=C2=A0 struct al_fic *fic)
> +			=C2=A0=C2=A0 struct al_fic *fic,
> +			=C2=A0=C2=A0 enum al_fic_id fic_id,
> +			=C2=A0=C2=A0 enum al_fic_version version)
> =C2=A0{
> =C2=A0	struct irq_chip_generic *gc;
> +	enum irq_gc_flags gc_flags;
> =C2=A0	int ret;
> =C2=A0
> +	/*
> +	 * On FIC v2 the error and fatal mask registers always read back as 0,
> +	 * regardless of their actual contents. IRQ_GC_INIT_MASK_CACHE seeds
> +	 * mask_cache from the mask register on the first child mapping, so on
> +	 * those two outputs it would seed 0 and make every source appear
> +	 * unmasked - and the first unmask would then clear the whole mask
> +	 * register. Suppress the seeding there and set mask_cache below to
> +	 * match what al_fic_wire_init() programmed.
> +	 *
> +	 * The info mask register is not affected, so the info output keeps the
> +	 * register-seeded mask_cache.
> +	 */
> +	if (version =3D=3D AL_FIC_VERSION_V2 &&
> +	=C2=A0=C2=A0=C2=A0 (fic_id =3D=3D AL_FIC_ID_ERROR || fic_id =3D=3D AL_F=
IC_ID_FATAL))
> +		gc_flags =3D 0;
> +	else
> +		gc_flags =3D IRQ_GC_INIT_MASK_CACHE;
> +

This is correct but gc_flags can be set to IRQ_GC_INIT_MASK_CACHE at
the declaration, and then the "else" branch is not needed. Or it can be
initialized to 0 and set to IRQ_GC_INIT_MASK_CACHE for the version/id
that support it; the condition would have to be flipped of course e.g.
    if (version !=3D AL_FIC_VERSION_V2 || fic_id =3D=3D AL_FIC_ID_INFO)
        gc_flags =3D IRQ_GC_INIT_MASK_CACHE;

That's just a suggestion, and it's totally fine with me if you prefer
to keep it like that.

> =C2=A0	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NR_FIC_IRQS,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &irq_generic_chip_ops,
> @@ -144,7 +199,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 NR_FIC_IRQS,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 1, fic->node->full_name,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 handle_level_irq,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, IRQ_GC_INIT_MASK_CACHE);
> +					=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, gc_flags);
> =C2=A0	if (ret) {
> =C2=A0		pr_err("fail to allocate generic chip (%d)\n", ret);
> =C2=A0		goto err_domain_remove;
> @@ -152,7 +207,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0
> =C2=A0	gc =3D irq_get_domain_generic_chip(fic->domain, 0);
> =C2=A0	gc->reg_base =3D fic->base;
> -	gc->chip_types->regs.mask =3D AL_FIC_MASK;
> +	gc->chip_types->regs.mask =3D al_fic_mask_offset[fic_id];
> =C2=A0	gc->chip_types->regs.ack =3D AL_FIC_CAUSE;
> =C2=A0	gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
> =C2=A0	gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bit;
> @@ -162,6 +217,13 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
> =C2=A0	gc->private =3D fic;
> =C2=A0
> +	/*
> +	 * Seed the mask cache the driver maintains itself, matching the mask
> +	 * al_fic_wire_init() programmed (see the gc_flags comment above).
> +	 */
> +	if (!(gc_flags & IRQ_GC_INIT_MASK_CACHE))
> +		gc->mask_cache =3D 0xFFFFFFFF;
> +

This is correct but I prefer to write it as ~0U. It's easy to miss one
'F', both when writing and reading it. Again, it's just a suggestion
and a matter of style.

> =C2=A0	ret =3D request_irq(fic->parent_irq, al_fic_irq_handler,
> =C2=A0			=C2=A0 IRQF_NO_THREAD | IRQF_SHARED, fic->node->full_name,
> =C2=A0			=C2=A0 fic);
> @@ -185,6 +247,8 @@ static int al_fic_register(struct device_node *node,
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
> @@ -193,11 +257,13 @@ static int al_fic_register(struct device_node *node=
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
> @@ -207,22 +273,37 @@ static struct al_fic *al_fic_wire_init(struct devic=
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
> +	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_INFO_MASK);
> +	if (version_id > AL_FIC_VERSION_V1) {
> +		writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_ERROR_MASK);
> +		writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_FATAL_MASK);
> +	}

Same note about 0xFFFFFFFF vs. ~0U here. Again, just a matter of style;
I don't feel strongly about it, so feel free to ignore.

> =C2=A0
> =C2=A0	/* clear any pending interrupt */
> =C2=A0	writel_relaxed(0, fic->base + AL_FIC_CAUSE);
> =C2=A0
> +	/* make sure the controller works in non msi_x mode */
> +	control |=3D CONTROL_MASK_MSI_X;

The side effect of this is that all the other bits previously set in
the AL_FIC_CONTROL register are preserved, whereas before this patch
they were reset by initializing "control" to CONTROL_MASK_MSI_X. Is
this intentional? If it is, then perhaps it deserves a comment because
it looks like a behavior change.

> =C2=A0	writel_relaxed(control, fic->base + AL_FIC_CONTROL);
> =C2=A0
> -	ret =3D al_fic_register(node, fic);
> +	ret =3D al_fic_register(node, fic, fic_id, version_id);
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
> @@ -231,11 +312,38 @@ static struct al_fic *al_fic_wire_init(struct devic=
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
> @@ -244,6 +352,12 @@ static int __init al_fic_init_dt(struct device_node =
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
> @@ -259,7 +373,8 @@ static int __init al_fic_init_dt(struct device_node *=
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
