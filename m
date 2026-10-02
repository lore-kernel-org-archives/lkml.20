Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD343A808
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970908; cv=none; b=OAvxzXXvytVHmnRba/pMRNU/H09oflXoCL+TImEgjMxbajIyLoRZ+huM2F6ahndZ/V1xZDaukAGcv4gANrGE4iTB+mzftm+moYaD/mXHpWlD1WFKcPHVMBD+hRWZFj4w0sb3VoGm4xUJPr9eYWNuiijT7NQqk1pL+f8nCMALpyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970908; c=relaxed/simple;
	bh=KQJZu3TJ1ZoJQSgg5FQgIcwzZKx6ACMrss1Z+0H9Uvw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kU9/D7xPNPEmXK6U0x+1NAwKP6M2FncwDp5zzQxunKIqzGtdaEAxcnC7VReAORUfJc/j7njTKO38qYNWwxeDfqm5nIYl6VDlPSR0dwmClC66ZOWlzqoSylLm53YoUd3HjR8sqbfsqABAmrkpVAJ1RcY4OSvH+IpsabbP8c1vyLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=a6mQm22h; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="a6mQm22h"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5339b4a29f9so11562121cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790970905; x=1791575705; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sGlzclWAPvmV9l90+X/3UL+TEboVyGRPeZlBqSVtL2g=;
        b=a6mQm22h7M5gUEQm9Ow+aMNey6fH7Lvexeblm+Nh+DEEghKTJlolMwLfixH0Lgo7NN
         lwyVXUlke8yiEeyWmN7vA0dv8AZczT6+WnNFmh5VCf+Dy7tkXC0vGsLvdyP51CkHiV60
         s9y+TcsQ0GB00hNMEA3ljjbeGG8qXot3ymCI3klwP+MuVX105tAooBngEdeFT0Sz5pSR
         MbBrvzmWln+W577ydj+y1OBPzV4WL/dNfJw42N+teqlLOr+uwAkR47fCzRPBrukhjxMT
         e+ho9VMMqWt37pcdn7SgS+84M1TxqdioSRIhoqsSk4NqydEV0pEgTFC7AuKUBSq6fOl8
         LhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970905; x=1791575705;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGlzclWAPvmV9l90+X/3UL+TEboVyGRPeZlBqSVtL2g=;
        b=YJsFxj18Rg06VcRkqJ09Oy7GPxrvgHoctuaYzy7KUhw/wwMu25hHn5YaKqTgkMHqjQ
         HiRc7j8ZDaJYnrIA/S8cxqvSf12FNGVmrN85O7iZLxXkPqd2KL1+F0zoxeQPuK1ssZIn
         8QfqYh4IsWAQaRcFB0DbRF3LBVnn5EuKK+22A63lCiKY6PyvH7qkJ6h/GdLkE9aBBHFE
         m16H2A4wBnQrCFMJdVCptTRLQCVgtHhdHgE1wpWykf4b1crcoCwNXwfL+Kd1GJEeVPCJ
         nPs1PYX/7fCBltM8cvuDIKFIUgHJ9OxyGUebn0Moctf+vmwJDGAy19KR3AO3i+1PWeti
         YAeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxemjB2ulvJumMa6bynuZYILd0CYyAXDJlhvAlc6uxdAl7YLxZKFqh3Qhh+WXETC3DwCsc6NakPvmIpj68=@vger.kernel.org
X-Gm-Message-State: AFuF++llRDg4ZkWUSgE5nyktVqOALcIBFVlSWdibgKgwcyUlPmc4nEfR
	Y0ytg1s/FcL7nI4cYMiBqhHW5AlyKobqL+q+1xE30YNtnvRpDJ+zXI27O/YB4btJhtQ=
X-Gm-Gg: AYBFou1CYfsbkDWe9dkqb/bawcpueDnJHZHVSFAgY4p4g/uCXspV41XETz/bZeJgcjs
	2hO/+xB3ITrVyF18vzE0HKwsAqrh/m1tZhOcULXHxkawQU0Z4TsIqR9DN/2bO2o7P6feFdwnVJz
	l/tKiKAJuFxdgtcH5qo7WT4stTp3ea4vfk4sX4lKp/+mjBXCI1g81U53hNxF2O3/wLI0IffqCYU
	F7Qgzdb7X52oOusogI6vcsx1iXFBZ9/08xCilbaEJXlItB0sWhd452Kxk7ItlP73JoHyHE3tzXV
	xRfks2FtWtvxo+jFpIExOKvjtRibAKCdpEOx6NpmONaPqKnSnlEjRgVv4pVEmwu5ZZWdBhZtMWR
	ySS047nYNgUyL74heZpfYTyu++vljYiumFjvdWNP5JYOz7DhOFv+pbwXWkYPIj3Y56M5ABliZTD
	LwSwqAXMeAZ8UdrwRSv4aohzZcH2NldLju7eqgA+px2A/b37t5/pgGUtS0LyQ/frevV8ZQxzjsR
	H/jViL8RAkhhjSm3gyoqvY7
X-Received: by 2002:ac8:5d8b:0:b0:533:1038:ad50 with SMTP id d75a77b69052e-533d9587585mr69965091cf.45.1790970905305;
        Fri, 02 Oct 2026 12:55:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b6b636sm27285076d6.26.2026.10.02.12.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:55:04 -0700 (PDT)
Message-ID: <aaf70162b2f8353d198e4f0a0137574b9963870d.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rkvdec: Switch to modern PM_OPS
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Detlev Casanova	 <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,  Jacob Chen
 <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 15:55:02 -0400
In-Reply-To: <20261001173610.158931-2-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
	 <20261001173610.158931-2-diederik@cknow-tech.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-u687AWLeNGHFAtWYehS2"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-u687AWLeNGHFAtWYehS2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 01 octobre 2026 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> A new set of modern PM_OPS macros got defined in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
>=20
> Switch to those new macros so that the PM callbacks are always seen by th=
e
> compiler, but discarded if not used. This lets us drop the check for
> CONFIG_PM.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..936abd92f703 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1877,7 +1877,6 @@ static void rkvdec_remove(struct platform_device *p=
dev)
>  		iommu_domain_free(rkvdec->empty_domain);
>  }
> =20
> -#ifdef CONFIG_PM
>  static int rkvdec_runtime_resume(struct device *dev)
>  {
>  	struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> @@ -1892,12 +1891,10 @@ static int rkvdec_runtime_suspend(struct device *=
dev)
>  	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
>  	return 0;
>  }
> -#endif
> =20
>  static const struct dev_pm_ops rkvdec_pm_ops =3D {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
>  };
> =20
>  static struct platform_driver rkvdec_driver =3D {
> @@ -1906,7 +1903,7 @@ static struct platform_driver rkvdec_driver =3D {
>  	.driver =3D {
>  		   .name =3D "rkvdec",
>  		   .of_match_table =3D of_rkvdec_match,
> -		   .pm =3D &rkvdec_pm_ops,
> +		   .pm =3D pm_ptr(&rkvdec_pm_ops),
>  	},
>  };
>  module_platform_driver(rkvdec_driver);

--=-u687AWLeNGHFAtWYehS2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasAMFgAKCRDZQZRRKWBy
9FScAP9oQFR10NikWDA9nu2Dfv7rKQ2BsngLSDea0lYtTWwcEgD9HVcbeQIF371C
sm9RTJ7S2Z9Gr+G5/grG+QsiqbS/kws=
=Ce67
-----END PGP SIGNATURE-----

--=-u687AWLeNGHFAtWYehS2--
