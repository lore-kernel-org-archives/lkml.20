Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3BB381B0A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267401; cv=pass; b=Hwe5luQrdPGy8vnCQ6Q3dtQLuZa2m/UuDE8/Py00PwIhYDbnzRBBHPKK/7ATNIYf197cTg49XgFE5C9Av0Xb187wG5VeICbYYqnhzI4oj8dk8SonFWjA12dPyGJ2QMAxKVyYfHTUb3AfrTsUrIbj8AnFOr5NqZacRt6eMoRbtU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267401; c=relaxed/simple;
	bh=Q+TrQfdIt2cIqZ+T8TmoFuxdS2bELcuBxOsSwzG2agw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQqWg7M8yjVohQ6qd7uQIYd1jKf9vQ0cf6Keu7xVRgn4bLP1HjJYAl0bUcW7x9spjkycWUIylWKEsRICedOkINGENTcJtL00BrOkyaOSlRwRSgKS6lobKGjJ4MRzJWP5wxpXsa/07z+7CjzqUFWvXotD8JPXa1HPrjBxFKvZT5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=B6wI6mjg; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="B6wI6mjg"
ARC-Seal: i=1; a=rsa-sha256; t=1792267385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Igo3uCDCkyYHWLIfZrGqYdhY2lvfVz7qXYwygG2HH5tUC3P0An0/2gg/RLjcFHIehbrgQ4a65SKRbp2zZRFxhQ+GIiOrx7FWup5wfBDpXC71pBgCMk8+ZnLWOVRFon/NlN2xhgGo/Rx9x4aVtYPRrSTFSugoxavgKLv0bVpfhYs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792267385; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HDbfx51p5XxyIurP4n8Jh9qNXSr08aSyHOnPDldz6es=; 
	b=BCAjgWBxyM5JFwJJjtwszIU94I3OAVFriJMWlhBFz6D2GZ5vNIhU/3KxPqr80ZM6McZIdm4OhEoz0PbOnTvZjMFljE18zAN6Ju7r41ZD/85vp4oBgoRlvsEbCLc5QV2Q92juhlXZ1W2bHfbpni8Pi+xZ/+9pNzdniu7+m9knF5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792267385;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=HDbfx51p5XxyIurP4n8Jh9qNXSr08aSyHOnPDldz6es=;
	b=B6wI6mjg5+WMcsIGxn1kYkI5/i2pKKA83F83GxQtFIdo0Vt2aSbdtonpLzTrNyV1
	HUFyCGWx07BZHE7o4Y7EJuBQONIJoGRxWaFEf+wsX63AuBgmPty5vCjhME0vpASfeQF
	uVAW9d2CEGo1kAMpysZMKEPmqe//nsHQvUbRIjVM=
Received: by smtp.zohomail.com with SMTPS id 1792267383927317.9562881794884;
	Sat, 17 Oct 2026 13:03:03 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 38934182304; Sat, 17 Oct 2026 22:02:59 +0200 (CEST)
Date: Sat, 17 Oct 2026 22:02:59 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Fix overwritten PLL SSC
 control bit
Message-ID: <atPUUusoWLVds9jL@venus>
References: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="amn6qqo5nchmrmqw"
Content-Disposition: inline
In-Reply-To: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/292.264.81
X-ZohoMailClient: External


--amn6qqo5nchmrmqw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Fix overwritten PLL SSC
 control bit
MIME-Version: 1.0

Hi,

On Thu, Oct 15, 2026 at 11:59:47AM +0800, Shawn Lin wrote:
> rk_combphy_common_cfg_ssc() first sets RK3568_PHYREG33_PLL_SSC_CTRL on the
> RK3588 and RK3576 SoCs, then, for PCIe at 24MHz, programs the PLL KVCO
> adjust field. The latter used a plain writel() of the FIELD_PREP() value,
> which cleared all the other bits of RK3568_PHYREG33, including the
> PLL_SSC_CTRL bit that had just been set a few lines above.
>=20
> Use rockchip_combphy_updatel() so that only the KVCO field is updated and
> the SSC control bit is preserved, as the comment and the pre-consolidation
> code intended.
>=20
> Fixes: 0b31f297557f ("phy: rockchip: naneng-combphy: Consolidate SSC conf=
iguration")
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>=20
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 3102a99..b6cc010 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -526,7 +526,8 @@ static void rk_combphy_common_cfg_ssc(struct rockchip=
_combphy_priv *priv, unsign
> =20
>  		val =3D FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
>  				 RK3576_PHYREG33_PLL_KVCO_VALUE);
> -		writel(val, priv->mmio + RK3568_PHYREG33);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 val, RK3568_PHYREG33);
>  	}
>  }
> =20
> --=20
> 2.7.4
>=20
>=20

--amn6qqo5nchmrmqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrT1HIACgkQ2O7X88g7
+prxjQ/+OYMRiDnXqbbhEGeraMuRgc+2Ie55Q3vzMGzMMPNOyCiLEC43IawflKar
EffRybxsBwH7b2fUSmnN7TgnRXvovNVMAEq4jICN04Axo+kTktnyl8VNx+hCcS6A
e9s5Us1Te80IFfHmfRerVgu4v+9fjPhAym2auNlLz8gbJtB6+qzuFSRoKAUpjVxv
CvqanEu0LnFoY5SdsoOwKhQkbNil1XkHRJ8nUZyDyzwCl4roEMnUJG0J9PvxKrSd
olRIKEYj1dOWZIj487wz8Dt1n6ATRHZga2KzGyrP0SNCZ7VG9nz2PBf2ozGXDuji
WWqjRFgWzAMWLGgQs5jnlrmtOVOS+Nl/fNkIpHjBuGnTMysGP50vqVdVAF2/bsgP
ux4dmBTfc/e5fDFtY6/wtuvSa1I9dhKUiANec2Wx8aT8t9dlj03LFZbnm7enkJgj
eHrVVRUjKRyAnCd1frYXyA4lluLeFcV44RkOhRIR7x6ETNEAzdY0jVFoLESlQH7J
DbQIXfNsSrV15bEmGHgVx4J2hUPYQp5xNpbXmYYfEaJ1NbzN7WhKz5oA9uCvnfDF
VEhZ370k4tElgRm2JklIrIqJAcwwKeeOVu+NQp18PReg3lizBjN/LPNgDbwh7jQN
nDXS7WiU5nl3B7qFS5Qr0VNqBx18oVitJuNSCNvJvlHX2C0p3U8=
=N1ZP
-----END PGP SIGNATURE-----

--amn6qqo5nchmrmqw--
