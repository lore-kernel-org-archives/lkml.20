Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3946D572;
	Thu, 24 Sep 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270037; cv=none; b=tJdHniqs6XX/m77UhISxEHLxFQAi8HTyeDtkPwYROGGgVGhdBSw24XEnw1eI0qOtBTkM2JJGHL5gryf2PU8Wzqtcz+Wl04/pR+GbSRw/owgpiM86YvJkuzEuK5ekROw7Vx/6eNZ2N3QU/V+HwjuZq5SCSNcb99X5NTFCG4nHpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270037; c=relaxed/simple;
	bh=oMYMjcd8L2nmMwXDcuOfPOv2K3WHiTOkN34lT9IRcEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r35Ubp+k1LgQ4REN0L9VKwkGzFZT4UHPgMnOGIqSFXZr8GEjF/PhB6Vw3UpDNt5ZhT3PFIJQkz4u0IMuW9zWHVBAQNx8iwU8DdLs66GToc0xY/rAGZFkxAbmagIx95X77mHYpmRnu5Hv7js+Q7VXjOzCaDHjTKcD9vZIqqwZ8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RInQysGL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RInQysGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5432C1F000FF;
	Thu, 24 Sep 2026 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270036;
	bh=tOSs9On0A5KQ+YOKLRSNJVPBQeF37KwtGaQYwZQafn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RInQysGLo+rrbwCaG8KnxISxEBx62d93BwOh9Xizb/knd9KAmgxFGCy7S5mkhxQ7w
	 1uQa8nAGrUv6fWaxzZ/jILsMWoNCmxgXxpuzTvpIzrMD8H+GcA4h4FoiQnJc08ADet
	 U/UHlg+bPPdqyPlkdLGwEXn6CXhvLcj2mUcZ0JVjmDwTCHySp1Z56FM1+T/fyR5Pus
	 BNb/AnWOlqo2sc3ecfszxtAsCxX2kz/gfZIs9mYH4+1+U80vBiaoO2QlqZdSiI4qCe
	 aKpBSYgWo80eudzx5LLWWZQCTG9osxTZ47Za4Fz4wq0msPn+iDC4da/W+LhB1lPEQn
	 HWkT5XfTJHYjg==
Date: Thu, 24 Sep 2026 18:13:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: interrupt-controller: amazon,al-fic:
 add error/fatal groups
Message-ID: <20260924-majority-amazingly-58df3d86190c@spud>
References: <20260924062311.37308-1-farbere@amazon.com>
 <20260924062311.37308-4-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IcBKFFBHGmwn/TaJ"
Content-Disposition: inline
In-Reply-To: <20260924062311.37308-4-farbere@amazon.com>

--IcBKFFBHGmwn/TaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 06:23:08AM +0000, Eliav Farber wrote:
> FIC v2 and later expose two additional interrupt groups alongside the
> legacy group - an error group and a fatal group - each described by its
> own node and matched by a distinct compatible string. Turn the single
> compatible into an enum covering all three:

Without any explanation relating to hardware, I find this very hard to
understand. Nodes and compatible strings are devicetree concepts, that
portion of the commit message should explain hardware detail.

What this sounds like from your commit message is that you have a new
revision of this block, and instead of adding an al-fic-v2 compatible,
you're using two new compatibles to describe the new features and using
the old compatible to describe the common featureset. Without a dts, I
cannot say for sure.

pw-bot: changes-requested

>=20
>   amazon,al-fic         - legacy group
>   amazon,al-fic-error   - error group
>   amazon,al-fic-fatal   - fatal group
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>  .../bindings/interrupt-controller/amazon,al-fic.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazo=
n,al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amaz=
on,al-fic.yaml
> index 26bc05dee0bc..f43039901bd3 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fi=
c.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fi=
c.yaml
> @@ -11,7 +11,10 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: amazon,al-fic
> +    enum:
> +      - amazon,al-fic
> +      - amazon,al-fic-error
> +      - amazon,al-fic-fatal
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.47.3
>=20

--IcBKFFBHGmwn/TaJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVaUAAKCRB4tDGHoIJi
0q/gAQC+8yal4gE4Pc8Nvs7fInQmxthkQfQJ1xI1i+IuIAGgkgD/d8en0ZVIH3So
7ZKFxz3THDrzsGAAO0bfYW4bWBuULgk=
=/w8q
-----END PGP SIGNATURE-----

--IcBKFFBHGmwn/TaJ--
