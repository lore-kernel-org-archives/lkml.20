Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195088;
	b=J/4QOY6+iDdHD+Kk1EGjxbSsJQ2+TTqEWfGlbKUfJZ4MEid1vOsmNe1phB9v8uIwsD5X
	 /CyXYl+OJVEgDgkmOtuK9VpufOuYellHqVR3o1XNaOJlPSTy3yR9M/wd+2+lsJDJWs9GU
	 liJVYZfWFCmNXKrFC3//f5L7KBr162l8sgrcKxVXmck1QhsEKROahUoJq0gC9Jv8suJxn
	 pSTxUTztS+wc+9+EWOayHVJJBE60i1NQ1dXuk3vNEfimAtnijlyOukAh2NZbY/CFjVKOR
	 qei0v6GzGs4mbWzk2fhcXIEddiyNIzSZRCSS83iagWNfboKFot0Czq/VSTT879nyy5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195088;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=7h9gujRoiJjcc4FUBagD+Vkd7AT2WQ+KsrTI8xvvbgs=;
	b=cw2mU69MH1Nb2VSjful8H1qMyFeY3vZ5QJGCDf8+bLoEL6ofbDGvrAB5VTpRbEWzU7SV
	 Ci5lyb0msNFxV/XUcc9NztHVmr8Yd+gOq4p6UqNLSXIUOWH5QUn9MecUj1+xVx3GnTeXt
	 2A6Ce3zBbvlo8k+S7RCNZ8FikExyAcJHzS7+zmgPpRO/0q8zC/u0heCqlhewGDDs02782
	 5mG/ZlYOlmN/PBWoD/QfKuALnsY/39JH/CU/wiXO3OiPSdVs1I10aOgvmlieBNwcLipsl
	 KVupcKRJ4u6MT43EIOnB5pNx4nVyN/XwJC5paomuHYaPJaImn39MzU1Dl3fCo6j6icw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="Sn/kxibo";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FC606A31C;
	Mon,  9 Nov 2026 03:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Sn/kxibo
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4DC4940E01E1;
	Mon,  9 Nov 2026 03:31:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fSr_K88CxAsy; Mon,  9 Nov 2026 03:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794195080; bh=G2paekuPNMEqonKhlRQSysxWYlUIiQcikXp7kwpEJAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sn/kxiboa5Hsi4RZJu1QDWhjwlMx6jbx2sX0sTMg5dgqqJJTG9N27x6YB/ReMZgND
	 HSxLwWyTyU7dQbONAxG0mRG5CG4UaRLetb61hlkOoxCTbSlzKLYD5fwSs96ufNUlHy
	 3z2vrAJsRMa7jo2Ad2U9dBYTKOD97Xvj+X95igI1lx5lSrga2USIS3+vp8tYTOVEDl
	 xGdqO+dsvie/hvj+7ni29CIu/hdISJEjZlijHXQpU/fHO1FOxTGRloUahxJEY0Gu4V
	 ostYsQRJaFLLMVzQi01nxWmolvRieV2BpB3MLOjrRyDh4/Z3J4vwkKSzk9rrqFvuo+
	 UmVeIaQ15EvHHm/oOTAf5SucbgLuz+mv3MLy367cVVTTzKvz2PeqCu7TgaPrZuxGlN
	 /kgw4F+sG4AXU3FShnmOMr2jJc3qj4QZhn5Gdy6UJRTaAqRHRnNHdfnMhifEP19Im9
	 ClNjszdkAJi3y4xR3HW3wQAZSCHyrO1ICpSAQdXkcQMQtmNtwSvUmlVHD41n3iwY3q
	 3AOA2BD0t2nVWZ2rpO1ZXqN4dvLnSPNTTHqednDcJB6r+sNSudJZTv27NuEcmXT2EZ
	 3HPrEiRF1f/UXRNAFv+erPVVnCIhHnh0+h2CHPfCCkUhEBZAGMB76IabnXqMkkag2f
	 JdEQJ/uoQ685K5tm0KHRzc3g=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AE74E40E0497;
	Mon,  9 Nov 2026 03:31:11 +0000 (UTC)
Date: Sun, 8 Nov 2026 19:31:08 -0800
From: Borislav Petkov <bp@alien8.de>
To: linux-kernel@vger.kernel.org
Cc: linux-tip-commits@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Radu Rendec <radu@rendec.net>, x86@kernel.org
Subject: Re: [tip: irq/drivers] irqchip/imx-irqsteer: Validate IRQ count
 before creating domain
Message-ID: <20261109033108.GEavE-fNcWoLB94CXe@fat_crate.local>
References: <20261104073759.386777-3-Zhipeng.wang_1@oss.nxp.com>
 <179417457995.2093942.6001079047755881830.tip-bot2@tip-bot2>
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
Content-Disposition: inline
In-Reply-To: <179417457995.2093942.6001079047755881830.tip-bot2@tip-bot2>
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2026 at 09:49:39PM -0000, tip-bot2 for Fabio Estevam wrot=
e:
> The following commit has been merged into the irq/drivers branch of tip=
:
>=20
> Commit-ID:     f99f3c4acaff0df9393c1e6a3f28b7b974e01d95
> Gitweb:        https://git.kernel.org/tip/f99f3c4acaff0df9393c1e6a3f28b=
7b974e01d95
> Author:        Fabio Estevam <festevam@nabladev.com>
> AuthorDate:    Wed, 04 Nov 2026 16:37:50 +09:00
> Committer:     Thomas Gleixner <tglx@kernel.org>
> CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00
>=20
> irqchip/imx-irqsteer: Validate IRQ count before creating domain
>=20
> The IRQ count is validated after creating the IRQ domain. If it is
> invalid, probe returns without removing the domain, leaving its host
> data pointing at devm-managed memory that is freed on probe failure.
>=20
> Validate the count before allocating resources to avoid the leak and
> dangling pointer.
>=20
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts=
 support")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Radu Rendec <radu@rendec.net>
> Link: https://patch.msgid.link/20261104073759.386777-3-Zhipeng.wang_1@o=
ss.nxp.com
> ---
>  drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-i=
mx-irqsteer.c
> index 1b8d0c8..766756e 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
>  	 */
>  	data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
>  	data->reg_num =3D irqs_num / 32;
> +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> +		return -EINVAL;
> =20
>  	if (IS_ENABLED(CONFIG_PM)) {
>  		data->saved_reg =3D devm_kzalloc(&pdev->dev,
> @@ -246,11 +248,6 @@ static int imx_irqsteer_probe(struct platform_devi=
ce *pdev)
>  	}
>  	irq_domain_set_pm_device(data->domain, &pdev->dev);
> =20
> -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> -		ret =3D -EINVAL;
> -		goto out;
> -	}
> -
>  	for (i =3D 0; i < data->irq_count; i++) {
>  		data->irq[i] =3D irq_of_parse_and_map(np, i);
>  		if (!data->irq[i])

I'm guessing it is this one because it removes the "goto out;" around the
2xx-ish linenumbers but forgets to remove the out: label itself:

drivers/irqchip/irq-imx-irqsteer.c: In function =E2=80=98imx_irqsteer_pro=
be=E2=80=99:
drivers/irqchip/irq-imx-irqsteer.c:271:1: error: label =E2=80=98out=E2=80=
=99 defined but not used [-Werror=3Dunused-label]
  271 | out:
      | ^~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:290: drivers/irqchip/irq-imx-irqstee=
r.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:572: drivers/irqchip] Error 2
make[3]: *** Waiting for unfinished jobs....

An allmodconfig x86_64.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
