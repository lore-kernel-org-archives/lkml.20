Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C039BFF8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510538; cv=none; b=tBcLjEBjYA7QFBa/yK2KZ0I3qijgszezqct6yjLX2rwl0qJmUe6N+2s13sUbxX1Z6TryrdFpNLiq/aFBjOVZcKjRdfqcakSJut9wl8nXal9TqLdbDyq1bbdaHaLjzCIcduKBLvZ8uqs+BQguiYGKrqmAbojcdA6RnsHJ9E7yeE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510538; c=relaxed/simple;
	bh=oiDfx3xTmCK059N3KmPjyVwz7QIbdUrM1wdlBFdAy1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnY12NG83vNePW3zw+1cCVcgXlhATgRGL9UpifL3Z3gr/TC2goT4rlfziD0QAHMyHdZWwff6gfT+T9RKe9inKgUy5FjH2XQn5+UCiVmhBFrKMKVW62yrVB5BXYjew5eFkzjhWVMCDkLtbJdXbCYIQM1PAFiThy2xZNVQEoXwr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRyyLWCY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRyyLWCY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso3365785e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510534; x=1791115334; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=;
        b=YRyyLWCY0GBRzT8gB3mZXJtlx25il/nejF1CAU/GPf9NRRwUkI9urcXSmWh3Nis1k1
         GoPK+R2GTWeHEhfDd7SfkMINM7g3q3+v8fLot75BfjZZj9m7yi7fDy8iXzacUaEhD+Rx
         nzd6tdAd7nEi+fUfq/cfeG1eU2Cg5RhM+xqFH5BKPKUWhuQRhbkgHrLStv6dZoP850w+
         Z/equoFiFIlk/AQRqNEAyGejGL9BWrD0dB/trHSjqpln3pogwuUlsuqkv6uQOW1PTYeo
         PxLLuy2I3IgTaJYRW3OZ4p/g4XK4kyOJqvFlansbY1CXLApMPJ2a2D1oqTa3vFeRbnfQ
         TD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510534; x=1791115334;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=;
        b=Yi8Zq1eACJJ/rM8U8pN51m++5y65JxW22Rnpg/kQ2oK6ZW+6+CwS0C0XukV+9uZiqf
         Sbs1pNbbEwWU1Wj42AmNrttB7G0Vh05nY1p+Y3dL0i7aXO08PcekhcDPFQeHXlFV4q9u
         YET9eMck5Dgr3RX/2xfIoQhh22ZsE2iiHQD3oTEZh1LS71LKG1bpjy2GdGaePFsU2Fue
         gmaZnvpABO27XC6mehEBeVxtyGtDM/p8HO4o9P1m1wPEZwnMYAtev834sgNjdnoeLN4a
         1AvMBZTPzjRUbfGeQEB1v80gxSrJTa4sX7YVNwLDsYjkHuVSHi9OcPDxG/A/AjNTpHlz
         p6jw==
X-Forwarded-Encrypted: i=1; AKwUvBz6m+vRDKQMaeckAb47/LymjTq2hDJxt75EyXDkhi3/DPKklFPe6Pefh6HUBOcxoje1hush4fwO/r8428g=@vger.kernel.org
X-Gm-Message-State: AFuF++k6clp/j51I39VrVT3N/WoL0AV3JodGXotgi1AyssYV452nmf+p
	Tl1LNc30i17mPR7021BV/+bS/ztnaGEttT6+mjCOCYa2jdK8+Zr6gVGP
X-Gm-Gg: AYBFou0V6O3z+QHfgA/ytVCyKMoIWnZgAyJznmuxgYS9jIcps3Mq8bcikByVeFKhH+6
	+8du457vyvmxkCX2WiW+PhBRTdGNohG7nmn0xPTsRb5OVWxGwycSa8ijStTPR802aS9ud63FrjI
	5kAVJ1X+iA9A8y8Aca0Zs4N3hoZ5sAOL3rNS4cnYU14lY4F6QN4uGQcARiv1DqXv2XfE2In+hTx
	di6RpC+mwoKPl5kqPtJxARKTul7HFo4wIEb3aBJ0iTQa93lfpAoMAHhsCQCxidpVp9iTQAyYsFa
	lN/1vAn2F8PFf3DDlCn3chOtyQczWMxkativV7FbByI83Ts7LdPe7oD+0DmSqKFJukILZrVPlFm
	PUyMsUByE6leDUYojKgIrT0LQ5XFd9yljXc5Isbj5cQQ77ExASfd9L9xw0RQX3Hh3Zx4GhBhjwR
	wapxsEhBy9WindvANcRTHndiAhNT5smOYVuURtNfTBHDV/Kv7tHylixJ/Jvl4n3SwkCwsNcjHhB
	XN9L+mOFk/ZGUaNVtCVcPi18SvQJZ5nrHM0UvYr9LPtaZv4N7EtLNvCRIGbN5gNxDeIh7f9dfpl
	FMsl5vSDmLnrSsqW4Js3mfQS1sNI4tP+gdp7vRBXtO2drGX2V91DT7tUPCoq4+ngid6oSdaaHsd
	SoApSBrkHbFTHThUtlAV/UX1vBdevrImM/B+LSMFedcM602z5DDs3BtXzWXWfRtHNY6oXHkf5H7
	vWHKrGmELuKRWOgosO3WkH8R6IQb0=
X-Received: by 2002:a05:600c:3547:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49fe66c8a33mr175216005e9.2.1790510533830;
        Sun, 27 Sep 2026 05:02:13 -0700 (PDT)
Received: from jernej-laptop.localnet (77-38-7-79.dynamic.telemach.net. [77.38.7.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001790022sm69199455e9.13.2026.09.27.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 jaidevshastri@vt.edu
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
Subject:
 Re: [PATCH] soc: sunxi: sram: order the publication of base against sram_dev
Date: Sun, 27 Sep 2026 14:02:11 +0200
Message-ID: <_KSVwOofQtuLLVcIRHSVdg@gmail.com>
In-Reply-To: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
References: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 22. september 2026 ob 02:48:49 Srednjeevropski poletni =C4=8Das =
je Jaidev Shastri via B4 Relay napisal(a):
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>=20
> sunxi_sram_claim() is called from the probe functions of the EMAC, the
> video engine and other consumers. It gates on the file-scope base
> pointer:
>=20
> 	if (!base)
> 		return -EPROBE_DEFER;
>=20
> and then walks sram_dev->of_node in sunxi_sram_of_parse().

Where do you see sunxi_sram_of_parse()? This function doesn't exist
in current kernel.

> sunxi_sram_probe() writes sram_dev and then base, both with plain
> stores, and the claimer reads both with plain loads. Neither the two
> stores nor the two loads are ordered, so a claimer on another CPU can
> pass the gate and dereference sram_dev =3D=3D NULL.
>=20
> Keep the mapped registers in a local and publish base with
> smp_store_release() once sram_dev is set; read it with
> smp_load_acquire() in sunxi_sram_claim(). The error value is still

Where does sunxi_sram_claim() use sram_dev? It's used only in debugfs
show method.

I don't think this solves real issue, so NAK.

Best regards,
Jernej

> stored to base so that a failed probe keeps reporting it to claimers.
>=20
> Found with MBCheck, a static herd7-based memory consistency checker.
>=20
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 2ccaeacf8..0e0b86ad3 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -266,10 +266,14 @@ int sunxi_sram_claim(struct device *dev)
>  	int err;
>  	int count =3D 0;
> =20
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	void __iomem *regs;
> =20
> -	if (!base)
> +	/* Pairs with smp_store_release() in sunxi_sram_probe(). */
> +	regs =3D smp_load_acquire(&base);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	if (!regs)
>  		return -EPROBE_DEFER;
> =20
>  	if (!dev || !dev->of_node)
> @@ -410,6 +414,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>  	const struct sunxi_sramc_variant *variant;
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap *regmap;
> +	void __iomem *regs;
>  	int ret;
> =20
>  	sram_dev =3D &pdev->dev;
> @@ -420,12 +425,21 @@ static int __init sunxi_sram_probe(struct platform_=
device *pdev)
> =20
>  	dev_set_drvdata(dev, (struct sunxi_sramc_variant *)variant);
> =20
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs)) {
> +		base =3D regs;
> +		return PTR_ERR(regs);
> +	}
> +
> +	/*
> +	 * base is the gate that sunxi_sram_claim() tests before it walks
> +	 * sram_dev->of_node. Publish it after sram_dev so that a claimer on
> +	 * another CPU that passes the gate also sees sram_dev.
> +	 */
> +	smp_store_release(&base, regs);
> =20
>  	if (variant->num_emac_clocks || variant->has_ldo_ctrl) {
> -		regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
> +		regmap =3D devm_regmap_init_mmio(dev, regs, &sunxi_sram_regmap_config);
>  		if (IS_ERR(regmap))
>  			return PTR_ERR(regmap);
> =20
>=20
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-sunxi-sram-41c3288a4660
>=20
> Best regards,
> -- =20
> Jaidev Shastri <jaidevshastri@vt.edu>
>=20
>=20
>=20




