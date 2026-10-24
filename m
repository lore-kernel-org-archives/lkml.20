Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792867633;
	b=UPll5+AowZhad4PCYncv9SKa5d1m3uC3KDJLruIOlUwSp4tlh2VTloWjwoZmFWIxkUvB
	 1d8cwBMhvZ348oC5DVvobOJDugGksNGud50WW34LbAR0A8/OS7q+yCU3a8wsLwZGUlmL6
	 jiCQ1HhXntQLGch7RfRmnzZmCu4Hu7p8bvV4/sausGy+i/QUjLthOHr7IrHaUVR7hghS0
	 cqasaLhu7oievsjS/rMqe+BZB5ALoU1cgt3HfnQOqxnTQ7jEalgn4O25nDcN36NIe3z19
	 gB4ABJ0JR9IiGLYT1lk7apIK55M9YRb+uLUGZmLZmnxWP9kw7+0wvzntbA3CKjITgyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792867633;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=sMwqTLtobjq9y4v04ViG193gMutnOIBCJMmSiPL0QaU=;
	b=Zdh+oNfV1KhHwR0RZvLqNQF4J0Z4ztWDDSlSIFZaxnG+x9b1MHXs4dfO3HVK73HhGjh6
	 Bi1aAAILC831CL+sk0yQa3UElBNjieuGLdrZRqNeftsSxYltVau71mQu/LRdG3HFezxQd
	 dtpgr/xofGHWtbSniNEl+dTK/Drlc/uUx66rGq1+M5QChXXqovyFudfQY6Unj+DG+rMil
	 LQA+BcGa7c0XxlcPGkaguKG8IyxYpZziZUTLI4HO1HR8dO0SAPe8vsdYOMQPIbV8o9XPY
	 EJiyItp++HpnIuDZksNGjP2FoRUSxDvSg9zJjPJPtPWEs92XGnO44NOs9oauuetlK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=lRTw2REA;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=lRTw2REA
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id A6AAFD312D;
	Sat, 24 Oct 2026 21:47:08 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro A6AAFD312D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792867629;
	bh=sMwqTLtobjq9y4v04ViG193gMutnOIBCJMmSiPL0QaU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lRTw2REAsTGOTHe91Ot2A5V7siQRADaJQxab4/3iubUgCLH30bVdIaOAl8OHheibt
	 aOrVREhG/GvEnhM3MnxwkdxZlspnA/GepgcgXVBqr+w9x4QFT5U6L0UHg/1CFNEFhN
	 vRKX/VQUs1cavU41CO8XKvsIXpqkJs1d0izkkJwd7Jmq1W4bIGq+GJcu2o3OjS7n/g
	 0cPvuB11a96QWx2xINKcCDEmAQKV71DnwjSngCe6TmE+QrQK1U/NoxQdA4SAhSgKmx
	 EcmRVpN9PTLv6kooZ+2KGHKJxWiFTwB0Hv850wezgqS4/fwbsKpTiFXy3RBpdVmvB1
	 Uo51+56HppPKA==
Message-ID: <d413238a3c5533572013d1fb27142345aabdd101.camel@rendec.net>
Subject: Re: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI
 allocation
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:47:06 -0400
In-Reply-To: <20260923083703.38974-5-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-5-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> Add log messages to help follow the driver flow when debugging: an
> info message on successful initialisation, and debug messages on the
> MSI interrupt allocation and free paths.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 8155f63cfd29..0e68f81014e7 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq=
_domain *domain, unsigned i
> =C2=A0	struct alpine_msix_data *priv =3D domain->host_data;
> =C2=A0	int sgi, err, i;
> =C2=A0
> +	pr_debug("trying to allocate %d msi starting from %d\n", nr_irqs, virq)=
;
> +
> =C2=A0	sgi =3D alpine_msix_allocate_sgi(priv, nr_irqs);
> =C2=A0	if (sgi < 0)
> =C2=A0		return sgi;
> @@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq=
_domain *domain, unsigned i
> =C2=A0		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &middle_irq_chip, priv);
> =C2=A0	}
> +
> +	pr_debug("allocated %d msi starting from %d\n", nr_irqs, virq);
> +
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_sgi:
> @@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq=
_domain *domain, unsigned i
> =C2=A0
> =C2=A0	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> =C2=A0	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
> +
> +	pr_debug("freed %d msi starting from %d\n", nr_irqs, virq);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct irq_domain_ops alpine_msix_middle_domain_ops =
=3D {
> @@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	pr_info("initialized successfully, spi %d to %d\n",
> +		priv->spi_first, priv->spi_first + priv->num_spis - 1);
> +
> =C2=A0	retain_and_null_ptr(priv);
> =C2=A0	retain_and_null_ptr(msi_map);
> =C2=A0	return 0;

Not that this matters in reality (because all these numbers are "small")
but for the sake of correctness: all the variables you added messages
for are unsigned, so you should use %u on them.

Since you're cleaning up this driver, you may want to look at the other
prints. For example, the existing pr_debug() in alpine_msix_init() has
the same problem.

--=20
Regards,
Radu
