Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0558485508
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337742; cv=none; b=fjEgkCcpH59C8qFCUNSNoj23xJY0PJba8Op7wzJTyM+czZS0NYnTTRTdtomtSrG5HKdcdcEOdBjzLr8VgRdnvHUgy3SrXvc1ZEZHsaKQVEYDEYSBYXpBC/zVdd4APdPMOuhAyObWZftgCSWXwr13gO2JVlk1wFTkBzWOZWQS4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337742; c=relaxed/simple;
	bh=6s4AyQ1Ij1qYu3Ck96/hoGRWyiAqmg0606vHs1UPLMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZC7BPeMd7kC6euTb/Lk0acvp7C1WzS0r3XS8k5/BTuFmoaHHicdN3enAJtkRW1/uGuhUcE0fobtMZa6T0y9OZVyl9vpIIQx92SGL6gaRFZWnypHGRqjbE50YygRN6bCN8s7uepNtNFE7gP0mn6celPu+3u0pDuVV3FpEfEAeVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ao8ZqAD5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ao8ZqAD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x7J2
	sUq7OLioGyGTI7TW0yB0epl9dnR0j8Fnb95/CuA=; b=ao8ZqAD52zBIrkJEFTyy
	sjlV7pIrFNOzwpIzqV6fpxwhg/DSHJQfQOAIpD+pUNjVFO4CWTZDiV5jJhGL+pFL
	2N7cvMddscS8FD6JtGzmxbYIh390y6DQ+1cogJ2w4CMiP1foeMTkfyFh+1mudd9p
	GVwl6VSUB4Oppg27Dy4oqVKOylLBrs67/kY8yPZLt1MOsEn3gDgeC194OYPH8I3X
	mr3bf9tQLDuyQ8lzm4HnBWqU2+6XXX6JRoBmOB1FuIJ3coeWoJgOfRZiOaB1Sm1E
	tE04efdFBBHpZcZOO19WGSAPpwmtKvhzoeviPkCctybkJSAOvy8rE405gyyTaf8B
	oA==
Received: (qmail 1549325 invoked from network); 25 Sep 2026 14:02:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 14:02:11 +0200
X-UD-Smtp-Session: l3s3148p1@FEl+fE1cUrkujnvn
Date: Fri, 25 Sep 2026 14:02:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Message-ID: <arZiv20Z4P7DQaD6@shikoro>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UqtTpPdEAw8/aeof"
Content-Disposition: inline
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>

--UqtTpPdEAw8/aeof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

thanks for your patches!

On Thu, Sep 24, 2026 at 04:12:48PM +0200, Paul Louvel wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>=20
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Disclaimer: I don't know the technology nor the subsystem. So, only some
high level comments.

> +
> +static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 v=
al)
> +{
> +	u32 regval;
> +
> +	mutex_lock(&priv->lock);
> +	regval =3D readl(priv->io_base + reg);
> +	FIELD_MODIFY(mask, &regval, val);
> +	writel(regval, priv->io_base + reg);
> +	mutex_unlock(&priv->lock);

Hmm, a spinlock is probably more suitable for such short operations? You
could even save a lock here and use a generic mutex in
inject_ctrl_store() for the whole operation. That would work for now. In
terms of defensive programming, a spinlock could be argued, too, to make
future additions more robust.

> +static void cdns_mc_err_inject(struct mem_ctl_info *mci, u16 synd)
> +{
> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
> +
> +	cdns_rmw(priv, CDNS_DDR_ECC_XOR, CDNS_DDR_ECC_XOR_CHECK_BITS, synd);
> +	cdns_rmw(priv, CDNS_DDR_ECC_STAT, CDNS_DDR_ECC_STAT_FWC, 1);
> +}

Bike shedding: I think this is too short for a seperate function and it
should be folded into its caller.

> +
> +static ssize_t inject_ctrl_store(struct device *dev, struct device_attri=
bute *attr, const char *buf,
> +				 size_t count)
> +{
> +	struct mem_ctl_info *mci =3D to_mci(dev);
> +	u16 synd;
> +
> +	if (kstrtou16(buf, 16, &synd))
> +		return -EINVAL;
> +
> +	cdns_mc_err_inject(mci, synd);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_WO(inject_ctrl);
> +
> +static struct attribute *cdns_edac_attrs[] =3D { &dev_attr_inject_ctrl.a=
ttr, NULL };
> +
> +ATTRIBUTE_GROUPS(cdns_edac);

What about using debugfs instead via edac_debugfs_create_*?

Happy hacking,

   Wolfram


--UqtTpPdEAw8/aeof
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmq2Yr8ACgkQFA3kzBSg
KbZ5shAAr/8OKZ/7lO7nzP9qwC6dAGGl+BQF/+TKZysk7iVjLlc7am4Rsd2YGft6
XDgWa1JRn6abhfZpAIEb0wN9E5t7ukOHt0EaR4uHbzIgxtHrbGrIQYBTnafNXrBh
4YwhX9/rqRUmjn34C6JUqO9cmGcf/DHVNMr0K8+XhXmJPit4zieQ1xCZ6S5B9kcj
jzKOu36PuJz1l/w48IX6dEraMMyCKesdBbbZsImfNUNQ5vOLvVRU4MZ7dKlIeVX8
lJrAhBr7n+NRSdXy6BUenS6dHAXWC6Nq2nmY7AbeW0RgJ8QPjYBTOMVeE96yCib2
gxba6Yj9H89dC5tycvQC0Go9VZD0HMXp9vuLq/BLEFLbrR93PtUEdYmatr0/eifT
y7uOikDsgjQkbuY8Th/g2qnxptDp7ZDDIK3WsMzld6hF/6lcwh0vg0+DPXILFpK7
yMdgSt0rvsAkhtY5ZyeeCh8e5ckuVvAbD/xPAhNNMCVuIDg7W7IZyW3XexuKBrrk
cI9Io7wiqXJMPQcmjcv1O60iar5xaeHzdNyVeAwunFsDk46cCE1Xu8HSNXFIAsdz
BGV8Zr72WWoiTo8PK2uiKalE9miG/2d7DhAkpQMxcEfn1/+5K5yuGTSO1nVxcgPq
ANBXvyUhxBy1WbVO2MCdTed46+YgIQJjShm2p6wkvqscYz62oz8=
=sQh2
-----END PGP SIGNATURE-----

--UqtTpPdEAw8/aeof--
