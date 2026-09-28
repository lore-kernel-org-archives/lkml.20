Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792F495AD5;
	Mon, 28 Sep 2026 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614233; cv=none; b=tw6BsW7UvOKxDA8BVwWYyF8ltN8W9pjZ0voLtHLsKdk5bJpRRShPHEnsv+/LnqxB/sZ1SNlkrTs5JeYacJ0NPbTxUiWjVGKTdwzmlD/IJwW4lVlGiMph1VDl8wYs6tIkbQqBoZeTlesWUqe91LxZDr2iF9o9QZe2+dE6D/78Loo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614233; c=relaxed/simple;
	bh=+4i+mooHpWCtYPTjoYkX5hdKqn+3VqQjtQoDqOSpWPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTySb+KnReAnfrRj6KznnGZ9a96x1vXK/1Z2Z5FoCZE1D87x4TfBBh4+q4ZGzhxGhORJ02AgL8EQjEefF2L7DEioHp/QAViBHduEtxTp1fv9QhBLujLUXMwGsuMkojwvVzU+NVwOnvegRx80EteFJmj+cFBHBZRKJemsMOupGcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYdgh326; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYdgh326"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DF81F000FF;
	Mon, 28 Sep 2026 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614232;
	bh=GjvWJLMokvI0lYXycX64nWTNbyodj4PDVqDuBm//cQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYdgh326uZXg+jeuVpm3X71/w5sZVtmJlbPyIymgn0H9+Xq3sgFWZUPzTqunyZ8b1
	 efTWX/t7v8qzLUbyKQIDuV8qEBnwZ0XLDywqlcpeYYiqx6ELJEEbqoTdPGt2YQwsIo
	 b/4zahE6L2W7Ezh7JFtzrqXiDAgciLAAKkw7aPnL08eLA5BVoEGVQr5vshr0Haqp5/
	 1tfuXIZHqNEUYJOqrFSy98s87I6UuvKos4yMI88z/zKafQQT9fJP6AXTYhfRLm8TG4
	 eLUIayrCD/wf7sLIy5ynFua96tnrJ0eeHZqfa9PLnSg9rRqbryY9kUZlzd/LK7O+1g
	 oRbKMwN8flRrQ==
Date: Mon, 28 Sep 2026 17:50:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: interrupt-controller: amazon,al-fic:
 add mask selection
Message-ID: <20260928-kinswoman-landless-7e728feb23d2@spud>
References: <20260927080637.27285-1-farbere@amazon.com>
 <20260927080637.27285-6-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dW4GAycpKBku0Yy/"
Content-Disposition: inline
In-Reply-To: <20260927080637.27285-6-farbere@amazon.com>

--dW4GAycpKBku0Yy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 08:06:34AM +0000, Eliav Farber wrote:
> The block this driver calls a FIC is the generic Annapurna Labs interrupt
> controller. It is built from groups of up to 32 triggers each; the number
> of groups differs from one controller to another, and each group has its
> own 0x40 register block.
>=20
> A node in this binding describes one group, not a whole controller. reg
> points at that group's 0x40 block, and the 32 hwirqs of the domain are
> that group's triggers. A controller with several groups appears as several
> nodes, and controllers cascade when a tree needs more triggers than one
> controller has.
>=20
> A group has one cause register and three mask registers, which decide
> which output a set cause bit drives:
>=20
>   0x10  info mask    gates the info output
>   0x2c  error mask   gates the error output
>   0x34  fatal mask   gates the fatal output
>=20
> The three outputs are aggregated into three separate interrupt trees
> (info, error, fatal); mapping one event to more than one severity is
> forbidden by the interrupt methodology, so a group belongs to exactly one
> tree. Which output a group drives is fixed when the SoC is wired and is
> not discoverable from any register, so it must be described in the
> devicetree.
>=20
> The error and fatal outputs, and their mask registers, exist only on
> controller revisions that implement them; earlier revisions provide the
> info output only. A controller reports its revision in the group control
> register (bits 29-28), so the revision itself does not need to appear in
> the devicetree and no per-revision compatible string is needed.
>=20
> Describe which output a group drives with a new optional property,
> amazon,al-fic-mask (info, error or fatal; default info).
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: redesigned in response to Conor Dooley's review of v1.
>  - Drop the two proposed per-output compatible strings
>    (amazon,al-fic-error / amazon,al-fic-fatal). A node describes one grou=
p,
>    and a controller reports its revision in the group control register
>    (bits 29-28), so no per-revision or per-output compatible is needed.
>  - Instead add an optional amazon,al-fic-mask property (info, error, fata=
l;
>    default info) selecting which output a group drives. Existing
>    amazon,al-fic nodes keep behaving as before.
>  - Rewrite the commit message to describe the hardware and the group
>    granularity, and add an example fragment to the YAML, as requested.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Thanks,
Conor.

>=20
>  .../interrupt-controller/amazon,al-fic.yaml      | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazo=
n,al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amaz=
on,al-fic.yaml
> index 26bc05dee0bc..1ebf9a427f2f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fi=
c.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fi=
c.yaml
> @@ -24,6 +24,19 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  amazon,al-fic-mask:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Selects which of the controller's severity outputs this group driv=
es,
> +      and thus which mask register the driver programs. A group has one =
cause
> +      register and three severity outputs - info, error and fatal - each
> +      gated by its own mask register. Each output is aggregated into a
> +      separate interrupt tree, and a group belongs to exactly one of the=
m.
> +      The error and fatal outputs exist only on controller revisions that
> +      implement them; earlier revisions provide the info output only.
> +    enum: [info, error, fatal]
> +    default: info
> +
>  required:
>    - compatible
>    - reg
> @@ -39,8 +52,9 @@ examples:
> =20
>      interrupt-controller@fd8a8500 {
>          compatible =3D "amazon,al-fic";
> -        reg =3D <0xfd8a8500 0x1000>;
> +        reg =3D <0xfd8a8500 0x40>;
>          interrupt-controller;
>          #interrupt-cells =3D <2>;
>          interrupts =3D <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
> +        amazon,al-fic-mask =3D "error";
>      };
> --=20
> 2.47.3
>=20

--dW4GAycpKBku0Yy/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqa1AAKCRB4tDGHoIJi
0g8zAQCd6uxhMA04J8oRUJ85aDJ/Mz4tFowRTdUT+OoKKts/ZAEAtBcvdcd0dZYE
Slzg0Tox5+WhDqSV0zdtF97NtTZWwgc=
=gKEZ
-----END PGP SIGNATURE-----

--dW4GAycpKBku0Yy/--
