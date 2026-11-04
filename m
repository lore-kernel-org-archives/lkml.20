Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793696;
	b=0oPS5z2+5iIbZHE0oFW6UzoPK/UG2WCF2VpNxTyhS/kfuArpEkIHLu3ymjxfKD3jxjTR
	 +gypSA3fYSsDBxe0tBXd1KWSkeksYdYcXgDTraxbzmzxyZXI9HJ1XCUU58HtnUXs24MQo
	 q4sqK80g7mwAyZRDJSzBEjKPbpbaSH1x5dvP0z9Swq/sG8tQsnYA6UrsXW2cX4u/QXOxz
	 U8yQ1Cr8kum3vcRchhbsXL2z4Ictf8krPb6wFkm8Y3L3Y4jtK3QANtLNWIJF+nU9yICVN
	 LBGorXSoZgi1uwchO95bEkOV2TohAl/WF1cqs667Z1gnMStqxaPm670u48GWDaUmYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793696;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Z3EWC7gQw8HWCPxJlpwFZKXN5PnSmmmFfA1GTBOpYGY=;
	b=PvfAlqcvgRf9bnbZiLKaqZPd9II8ZZOdBOgUhEeoLhdpn9FZSqePUR2YFRlNZ2HPD3wD
	 H8YZPrISo074AGO6k1wvevDz5hczJeR2dlQhOvDRcbt7NG3YQaVy4ln8D40RzDb6IEivB
	 b1SZ4ixnm0MpA2lzwPBMXfzggDbbYjGb/H65rFB/lDhQs+8MmlY+sXhhMy0tDVTkAThq9
	 xOi2Jivlijx/SGNlTeKzMHxVCVIv3B5Wl7wbDtjDeziQny1ZSr5onM67UzQHzknqHVnzR
	 DlQIW4PKzL3f/mSyynbHj2RZJsod+9DZyFGlBtDzXBal9cjGUJcIA4+TcJVOlyXATVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=yPENIEA2;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEAD606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEAD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=yPENIEA2
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id C8705D3370;
	Wed,  4 Nov 2026 14:01:32 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro C8705D3370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1793793693;
	bh=Z3EWC7gQw8HWCPxJlpwFZKXN5PnSmmmFfA1GTBOpYGY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=yPENIEA2T3Bab64C2zlyNxThJ5y6KL3mUZLKAFSFqu++hxvMH8MFmdfVNBsHj84aw
	 bEE7V+gflji8wHNGdleg0gTRgsgJqRzv3lNk58dfiHH6jAVSH0OvLl8+OEA83/NAJu
	 CkunPL6Dg76QVTriyJcJEN7FaYfRFnDVvyuRI376hdQSaUftchZYBl80dQyJJQYvYI
	 UuHd8MSSNZfAJDabOcY8Uhb+5PQ1Nvh1WoJaNE9yKc+Xglz8KfbbTu37DwA8i4+wD/
	 0SGEYw415cIkfVg6eBhFAqUp91jUYpbsvuSenjKD46cfkmTr9KbUOGV9+jAQsCBTQP
	 I0Swil28EiAJA==
Message-ID: <216108ba417dd8e201a0345b2278eec2dfc6abf5.camel@rendec.net>
Subject: Re: [PATCH v2 5/5] irqchip/alpine-msi: Add debug logging for MSI
 allocation
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 07:01:31 -0500
In-Reply-To: <20261024193620.39999-6-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
	 <20261024193620.39999-6-farbere@amazon.com>
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

On Sat, 2026-10-24 at 19:36 +0000, Eliav Farber wrote:
> Add log messages to help follow the driver flow when debugging: an
> info message on successful initialisation, and debug messages on the
> MSI interrupt allocation and free paths.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2:
> - Use %u for unsigned values (Radu).
> - Write MSI/SPI in upper case, to match patch 4.
>=20
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index fb84b6046193..c13646c763d3 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq=
_domain *domain, unsigned i
> =C2=A0	struct alpine_msix_data *priv =3D domain->host_data;
> =C2=A0	int sgi, err, i;
> =C2=A0
> +	pr_debug("trying to allocate %u MSIs starting from %u\n", nr_irqs, virq=
);
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
> +	pr_debug("allocated %u MSIs starting from %u\n", nr_irqs, virq);
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
> +	pr_debug("freed %u MSIs starting from %u\n", nr_irqs, virq);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct irq_domain_ops alpine_msix_middle_domain_ops =
=3D {
> @@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	pr_info("initialized successfully, SPI %u to %u\n",
> +		priv->spi_first, priv->spi_first + priv->num_spis - 1);
> +
> =C2=A0	retain_and_null_ptr(priv);
> =C2=A0	retain_and_null_ptr(msi_map);
> =C2=A0	return 0;

Reviewed-by: Radu Rendec <radu@rendec.net>
