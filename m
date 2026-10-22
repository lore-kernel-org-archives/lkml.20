Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792661786;
	b=1/8jL2FEZ95hz99rZcrCE6oN7yPJfikE/E0AgmjlaelWiKnBVs5a77ssM6OCRHmUK5c2
	 mjm8khtKaMktIaAy4UlHkuCn7Heesijqu2Ed7m1KZzZJI7VCbwdFUaidO6/seSBl5a9fN
	 5D+VZSnEYPpABYHy+8xZxRSlm4b/PjyrTEwIpa81HP5VueurVUOesEtwZT7Wqt7t83uTl
	 cOfMoOLavoETD6MuL/i4fQWBWEyLkdYm7OKXwI8IZi5VEMqXlVyZanxQbB6lB1fICGiNz
	 ZBtTtQycpPclbHjI9jOuY9Y2ITdJ6u71B/Y5+2iO7hApDtFTypBEFoS0MpYnkS1Ft5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661786;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=;
	b=gVwoSRe1kH5xJLFSMao8PNftvGC8kICsDMHM65DTJODm8iyvbxZe2DYu8bStAPCzknnX
	 HSfWRUgJ4/k5GkbJBXoAWoLDeLqZoFCq9aDwbsYx7/TE9OojroJooWputeqk8MxkyvhHj
	 VWeRPgc8Z2ooPfGSJlAttKSOatyRF1IYWeQRjOKrMyVVewq01etlqvGFAo2+hiCE+5TQ0
	 9G7IwqFH147NbbJ3bOn+YKNswVs67D2pXIBCcWd7SdtEA/JvairVb4/Il1gtD+vYTtrBs
	 4syraSVzv4W+VrSBKBBwUEiARBp/LtGNbG5dnGngAlaq0B2ImQG5dhjq2chx/Jaeskw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bXq7ph6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9553606A31D;
	Thu, 22 Oct 2026 09:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9553606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bXq7ph6n
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E7E4E2004FF;
	Thu, 22 Oct 2026 11:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792661782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=;
	b=bXq7ph6ntsifd3fQBzyhED2nbhwiV5G4GjRpF7oFKQoKAHwUavLydnwPtO02w6UoTIsrwm
	IGgtbDu2MC0TXa48uEbryw/KHSrSc3Imjl5CQD9kvpGT0wD8tL5zO1jP3UCdWWKEJ2EFbh
	L93LUL7PHPjIL6/Xx9ARsW4wKx/tPdDqYd0USbBI7rcF9wWbYbAgALnL6t/GwCY8LJc7MH
	9o1KrLus06gNGE8s6FqOFx0LAqKB/3U7rg3056+7ggxpQfYK7xYraXDYB8K5Y5toq7aEL1
	XiSQi57j9TVqW32yPWKBhS8dtloO/BDUwvsaAMvVYQMYSJiFDfzdXvvYnJRwzw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792661782; a=rsa-sha256;
	cv=none;
	b=WykGo8jD8hoj3R5BdABolvEsTgPvDWg7IgivSeTxChcYdeiN6LdCe4v9cw+PDHxpQAhd34
	LXriW4TjdGJZ7sSihMd8BL8IJsbgE4DGcCKGRW5pJx31vQuUcx3mo1b8fCKtZ6mMHS8BCO
	aGs0UHSk/z9zxhRVxEyAx4wiMwSFcbsE5iBntSLen4y8ABKhooPDyDYOYMhu+6XikA7MK6
	lyhJTX8ytsYN/7l8om/+UGIrQRfH4D2PIvcLkC2sE7bgi6HW52XO7G4kxrMOezltHNY/LC
	k1r6cEBbsYxtKUPj8QvSdYmlvvuGxXLhKveo1VeT9XD4uJ/uK6RNusU4jntSbQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792661782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=;
	b=LlMqAmC8/AkwywL7CYQSP+s+ZiAPecaqDv7M7KJsdN/HON5OTFOnpzKh35OY1Gp3fQouio
	6kgS82yTFZfAvm4MPHy8/4sqgfAj5ozTWBQV62TJXfusG4nE690zUP5S4dVSnMxeWZIRtK
	4kSR14eJ19qmpOKGXGplWQ3cxZ9gkwaTxXYLfCecd+xus6QvTonC0ddc50BUTxS9Q9R8rT
	UnG0UVcY+NW8fANIsuDZq6oc4vu2adjbXzthGL8cWhdvNE0Qi6vVkRe+gALT2VvbJ7SUl+
	C15BT2EQ5kMRBIz+c4HFjFPQN0zqb8SvcoJsyjPPSeKzmayAwZoOAezz5+gtqg==
Message-ID: <bafa6ad636d5e8a681494714adbd66bf8f2f7b19.camel@pengutronix.de>
Subject: Re: [PATCH v3 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Petar Stepanovic <pstepanovic@axiado.com>, Naveen Kumar Rajgiri Bassappa
	 <rbnaveenkumar@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
Date: Thu, 22 Oct 2026 11:36:22 +0200
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
References: 
	<20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
	 <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-10-20 at 00:19 -0700, Petar Stepanovic wrote:
> This patch introduces the core probe/remove functions for the Axiado
> AX3000/AX3005 UDC driver, and wires up the directory into the build
> system via Kconfig and Makefile.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  MAINTAINERS                               |   1 +
>  drivers/usb/gadget/udc/Kconfig            |   2 +
>  drivers/usb/gadget/udc/Makefile           |   1 +
>  drivers/usb/gadget/udc/crg/Kconfig        |  16 +
>  drivers/usb/gadget/udc/crg/Makefile       |   9 +
>  drivers/usb/gadget/udc/crg/crg-udc-core.c | 706 ++++++++++++++++++++++++=
++++++
>  6 files changed, 735 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 000000000000..80a4fc6a61e8
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
> @@ -0,0 +1,706 @@
[...]
> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
> +{
> +	struct device *dev =3D crg_udc->dev;
> +	int ret;
> +
> +	crg_udc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(crg_udc->clk))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
> +				     "failed to get clock\n");
> +
> +	ret =3D clk_prepare_enable(crg_udc->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk=
);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc->rst =3D
> +		devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

Why is this stored in struct crg_gadget_dev? It's not used anywhere
that I can see. The struct reset_control could be a local variable.

regards
Philipp
