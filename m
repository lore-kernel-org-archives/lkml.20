Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585689;
	b=tXG/D10L5phNGqq9uezbB1eXHk+BhYE87djx3oGamZ9lKdrzypvDJOF5YwtcL5foq+LJ
	 8q1PtI3AgAaiylvvNuXnWOzhgqs8iIvgtcDHgsJ1pLG6nrtYR4WjOew6rShTDH0jzuGwf
	 Kjo01M2ZhOuclLKja6qrIUMSBwRCtwp3IWsMO7KMMzJj/l4+bdDG8ySQbVpU5n5ikbFkp
	 RXhhwb+ImfnFAWu8JCzKfRcGajT7e6x2Pp7GRaztTBN7Tuti2nYDPrFxXO3OiLERSRFr3
	 encc8AeV+BNSxkntEaANhx5AzPbr4Vd35pV2/9Gw8kg0hW+r1nBl+pNs6mX7vRdaUaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585689;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=HleTIWYdp5rg8KbqbWhYqUCQQeH4sgjGSrJAPDXXpvU=;
	b=coT9iofO70z5hjMltr8RC/njzqoLkEwQYBYSLmJURcX9ztrDxraacJuNGbYq3881pxlB
	 BKxRNFkHm90S57AqFegFz0oRaGc5jysDMRpQruuuslrz86ilyUGSet52fJBpMGruxm9rI
	 HWhOtTo6me3DXxXhPbbIjXPr6m9nTLd192FYXdnpk+/VucSz/QWvN1wTQwJaNTct+Rn9n
	 RUoqAa1kuUaXQmH690N0siu9zQc+mCQigen8KVhi1d59Ukfwbi71btQpyZK6et3CPYk0D
	 sbkwW6tgHxkYtb/CYAMjjMN+O5AecYyNMu85mQ9tWtPOGodDGE5sJcnGvga3tiaUbbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Ao/VB78d";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEC60744EC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDEC60744EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ao/VB78d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 338824E415A7;
	Fri, 13 Nov 2026 16:01:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E70B760015;
	Fri, 13 Nov 2026 16:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 794B611BC0C42;
	Fri, 13 Nov 2026 17:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794585685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HleTIWYdp5rg8KbqbWhYqUCQQeH4sgjGSrJAPDXXpvU=;
	b=Ao/VB78dBVLCwpkI6+DUrdgJRzDK2ewWHrXZ7pvppzjud1Tz93mbjLdwfqvTRCQGCJ9+35
	UOHIOwOLDfgXYkHWOeJeG2kQK2ifZulBMhjPpvr3JN+b59k/u4de4phJPTvA9l1LoJtWRK
	KbsiPYHfShC7n9XBSR5AlLtyBK7b6pr+9L2XkoFOoKzRW7RdjBRKs2JngS1DqzyNJApCkF
	mMRD/WCOnlzY9XC4+y5M8aLCzodLDjYJtpdsDVHY/RdtbiEXInhVZRrsUJXSKpP1vsLfhm
	OdL0NEVrXIlB0lovzoGyqdiV5Mr3pjxzvsMWaRVu2ebQr5tF87GM2VPNyHm+Ow==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Gleixner <tglx@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Radu
 Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
In-Reply-To: <87v766uy6i.ffs@fw13>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
 <20261102-eyeq5_msi-v2-2-4aa3d3608064@bootlin.com> <87v766uy6i.ffs@fw13>
Date: Fri, 13 Nov 2026 17:01:21 +0100
Message-ID: <87y0awpvou.fsf@BLaptop.bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Thomas,

> On Mon, Nov 02 2026 at 17:50, Gregory CLEMENT wrote:
>> +static void __eyeq_msi_mask_irq(struct eyeq_msi *msi, unsigned int bit)
>> +{
>> +	u16 value;
>> +
>> +	lockdep_assert_held(&msi->lock);
>> +
>> +	value =3D readw(msi->gcsr_base + GCSR_IRQMASK);
>> +	value &=3D ~FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
>> +	writew(value, msi->gcsr_base + GCSR_IRQMASK);
>> +}
>> +
>> +static void __eyeq_msi_unmask_irq(struct eyeq_msi *msi, unsigned int bi=
t)
>> +{
>> +	u16 value;
>> +
>> +	lockdep_assert_held(&msi->lock);
>> +
>> +	value =3D readw(msi->gcsr_base + GCSR_IRQMASK);
>> +	value |=3D FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
>> +	writew(value, msi->gcsr_base + GCSR_IRQMASK);
>> +}
>> +
>> +static void eyeq_msi_mask_irq(struct irq_data *data)
>> +{
>> +	struct eyeq_msi *msi =3D irq_data_get_irq_chip_data(data);
>> +
>> +	guard(raw_spinlock_irqsave)(&msi->lock);
>
> What's the reason for ...irqsave() here? The mask/unmask callbacks are
> invoked with the interrupt descriptor lock held and interrupts disabled,
> so a plain raw_spinlock() is sufficient, no?


Indeed we can just use a raw_spinlock() .

>
>> +static void eyeq_msi_isr(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *parent_chip =3D irq_desc_get_chip(desc);
>> +	struct eyeq_msi *msi =3D irq_desc_get_handler_data(desc);
>> +	void __iomem *status_reg;
>> +	unsigned long pending;
>> +	unsigned int bit;
>> +
>> +	chained_irq_enter(parent_chip, desc);
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Di=
rq/drivers&id=3D6cf0d999a18e799965cf2cf4a0157e257c805946

It is not yet in v7.4-rc1,but I can rebase on tip/irq-drivers branch to
use it.

>
>> +static int eyeq_msi_domain_alloc(struct irq_domain *domain, unsigned in=
t virq,
>> +				 unsigned int nr_irqs, void *args)
>> +{
>> +	DECLARE_BITMAP(reserved, EYEQ_MSI_MAX_VECTORS);
>> +	struct eyeq_msi *msi =3D domain->host_data;
>> +	unsigned long bit =3D 0;
>> +	unsigned int i;
>> +
>> +	bitmap_zero(reserved, EYEQ_MSI_MAX_VECTORS);
>> +
>> +	scoped_guard(raw_spinlock_irqsave, &msi->lock) {
>> +		for (i =3D 0; i < nr_irqs; i++) {
>
> This does not support MULTI_MSI, so nr_irqs is always 1. That allows to
> simplify both alloc() and free() by a lot, no?

Indeed you are right again. I will simplify it based on this.

>
>> +#define EYEQ_MSI_FLAGS_REQUIRED			\
>> +	(MSI_FLAG_USE_DEF_DOM_OPS |		\
>> +	 MSI_FLAG_USE_DEF_CHIP_OPS |		\
>> +	 MSI_FLAG_PCI_MSI_MASK_PARENT)
>
> Just a cosmetic nit:
>
> #define EYEQ_MSI_FLAGS_REQUIRED		(MSI_FLAG_USE_DEF_DOM_OPS |	\
> 					 MSI_FLAG_USE_DEF_CHIP_OPS |	\
> 					 MSI_FLAG_PCI_MSI_MASK_PARENT)
>
> is easier to read. But no strong opinion.

OK for me.
>
>> +#define EYEQ_MSI_FLAGS_SUPPORTED		\
>> +	(MSI_FLAG_PCI_MSIX |			\
>> +	 MSI_GENERIC_FLAGS_MASK)
>> +
>> +static const struct msi_parent_ops eyeq_msi_parent_ops =3D {
>> +	.required_flags		=3D EYEQ_MSI_FLAGS_REQUIRED,
>> +	.supported_flags	=3D EYEQ_MSI_FLAGS_SUPPORTED,
>> +	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
>> +	.bus_select_mask	=3D MATCH_PCI_MSI,
>> +	.prefix			=3D "EYEQ-",
>> +	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
>> +};
>> +
>> +/*
>> + * In endpoint mode the snooper is a platform MSI controller: the host =
writes
>> + * the doorbell and the snooper raises a local interrupt. Expose it as a
>> + * platform MSI parent so endpoint functions can allocate doorbells.
>> + */
>> +static const struct msi_parent_ops eyeq_msi_platform_parent_ops =3D {
>> +	.required_flags		=3D EYEQ_MSI_FLAGS_REQUIRED,
>> +	.supported_flags	=3D EYEQ_MSI_FLAGS_SUPPORTED,
>> +	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
>> +	.bus_select_mask	=3D MATCH_PLATFORM_MSI,
>> +	.prefix			=3D "EYEQ-",
>
> It might be sensible to use a distinct prefix here, e.g. 'EYEQ-P-' or
> so.

OK

>
>> +static int eyeq_msi_create_domain(struct eyeq_msi *msi, struct device_n=
ode *node, bool is_rc)
>
> __init ?
>
>> +static int eyeq_msi_parse_vector_region(struct eyeq_msi *msi, struct de=
vice_node *node)
>
> __init ?
>
>> +static int eyeq_msi_parse_dt(struct eyeq_msi *msi, struct device_node *=
node)
>
> __init ?
>
>> +static void eyeq_msi_program_hardware(struct eyeq_msi *msi, bool is_rc)
>
> __init ?

The __init annotations no longer apply because v3 converted the driver
to a platform driver, so those helpers can run after init memory is
freed.


>
>> +
>> +static int __init eyeq_msi_of_init(struct device_node *node, struct dev=
ice_node *parent)
>> +{
>
> Also please check the sashiko response vs. handle_simple_irq() and the
> affinity mechanism.

As you pointed on my v3 it was already taken into account.

I will send a v4 based on your review and asked to Vladimir if he can
also review it.

Thanks!

Gregory

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
