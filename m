Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C353ECF7;
	Tue, 22 Sep 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087677; cv=none; b=n7yFhrMmvZ9zsclaHMHF47GGjaAU2bElEYFoJTFNlQBJaJLhLfTfPbCkfsFflHUkE/JJSGcRITU46IR7BEl7Ye3E3bHyYCA7xbMK2GTB/9oOxYKXT6xh3LCNkfzXUc6aEnfXdf6L/AwZXXe6zYHQIA0xwUiTh3JXlAiLd+eEeUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087677; c=relaxed/simple;
	bh=FcO8+gxKY+/nKD+LPd/eZyy4ldOArtG1kzAaFPbXiMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMFSs+sSUMg6fLglz71l/dZzQ33NMHEWvyil2+GVuEUr1MeC7kitzQ7ISSiRWUjDiUhlTZph5FNHFMghFilBKxk+aU1ELghYImXTMHcLymJ9o/1lFRCElMLNMyDe0PsSwmOb8gCWm6N3NFa+Mo9pgEl+IYgiGKOPJs1FEiswXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVXhlT5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVXhlT5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F92F1F000FF;
	Tue, 22 Sep 2026 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790087675;
	bh=BYx3UPsVK+IPBRssh3HUX31FUJIXkBIIqhrriLruBy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVXhlT5wGgb5gMxwF42e8R2ZWcR1LA9LWOJ9rscpXNJi/RTyrqB/SaXKwTgY+kVYw
	 I983Mq5N0hNe0sp+WMA8b+OMwVlfi5DiifDQZu5EcNQ2nkvf/yCzgct4LBUzfXM3jM
	 igMjR9zEJntsJ6QZdvyExImLzrdvt6nrUE8ptPWDUh4rX7dQNUXhhM5X/yVBI4HHHo
	 K3wHjqLQJpF8pHPCVmD1MJk9+DFWjR2BwP5n5lNLkxvsABUWVwwMCyQDGDNFSWGkcW
	 Uo4zBio81ZhVeyAQe4Sjhv/whR59s6oCJQ2u032m3h9+NkZpcmT25h5wpUH94SlU05
	 /MKmVzHmf+6Hg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AA5011AC56C6; Tue, 22 Sep 2026 15:34:30 +0100 (BST)
Date: Tue, 22 Sep 2026 16:34:30 +0200
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Message-ID: <arKR9oIjbrTM9fTS@sirena.co.uk>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-3-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f03ZgCX7Ycsbfz7v"
Content-Disposition: inline
In-Reply-To: <20260922112134.4167305-3-joakim.zhang@cixtech.com>
X-Cookie: Too clever is dumb.


--f03ZgCX7Ycsbfz7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 07:21:32PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add support for the Cadence I2S-SC controller found in the CIX SKY1
> audio subsystem.

> =20
>  obj-$(CONFIG_SND_SOC)	+=3D snd-soc-core.o
> +obj-$(CONFIG_SND_SOC)	+=3D cdns/
>  obj-$(CONFIG_SND_SOC)	+=3D codecs/

This should be sorted in with the vendors, after bcm.

> +++ b/sound/soc/cdns/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_SND_SOC_CDNS_I2S_SC) +=3D snd-soc-cdns-i2s-sc.o
> +snd-soc-cdns-i2s-sc-objs :=3D cdns-i2s-sc.o

We've moved to module-y for module objects.

> +static int cdns_i2s_sc_probe(struct platform_device *pdev)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv;
> +	struct resource *res;
> +	void __iomem *base;
> +	int i, irq, ret;

> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		return ret;
> +	}

We request the interrupt before we enable clocks or anything, an
interrupt could be delivered as soon as we do the request and the
handler will try to interact with the hardware which I imagine might go
badly if it's unclocked or in reset (at least for some integrations).
It's generally easier to make this one of the last thing we do in probe,
once most things are ready.

> +static void cdns_i2s_sc_remove(struct platform_device *pdev)
> +{
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		pm_runtime_force_suspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}

For CONFIG_PM=3Dn forcing suspend won't do what you want, and when it's
enabled it'll also disable.  devm_pm_runtime_enable() might be easier.

> +static const struct dev_pm_ops cdns_i2s_sc_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(cdns_i2s_sc_runtime_suspend,
> +			   cdns_i2s_sc_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_i2s_sc_system_suspend,
> +				cdns_i2s_sc_system_resume)
> +};


RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() are the more modern things,
and avoid the need for __maybe_unused.

--f03ZgCX7Ycsbfz7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqykesACgkQJNaLcl1U
h9DFuwf5AZA0BHA8EDSLr3yT9wJi1GpTmM5ml1rYBCpGZX65b/A94t5G9/rv/JaK
1U2MY1DOsWahuosjvdisvLkRPpsw7URMRcq/poT0R2uwuun/RE7ZVKl7O6XWTrYn
B0wseq8VmrmIX1D3dZ/JSix1/tWbwo3LlhldEK3coNqE5FJj0i2uE1eLT73s63Qp
5rrbx2ttDF3YUn8DPFMNv5vmsUnrwJNpTZGY5wFwJkMUFHtSzi6SEBP9v3jcVeD4
/YIO5xZzZxYjH9n0MGSQ6jVwpoc5dH7k1CCXNPuHgUJulNIVBWaozuRBEJO5mDQI
TLa9Ipsb9Y+5ibLODi60BjpXBN90Kg==
=KQRK
-----END PGP SIGNATURE-----

--f03ZgCX7Ycsbfz7v--
