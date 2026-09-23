Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA273BE178;
	Wed, 23 Sep 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181301; cv=none; b=uygtisC5NxSaDDcKJIID7QvxIVBiORS4qBYbRH96jY/OQTOmyh6II9wQqfKoItTwwvMTAyfdsm2o66I2XAWwp2tTYPs+iK2RY49cn3eJAf2VPan/yjhH/BkU5KOYgN+ygZJr6svGfFKSN1FiRsfrjgGJEnrCsGBYEh70pek8tz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181301; c=relaxed/simple;
	bh=gvkKJXWX504JVXNfq8nlTqNPqxGPQY3bFLzXp0zukIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4rUrjr6f2VWt8IUCEAdEk+6QQ+WwXoNiFYQB5IbM009M2737MSVD0JpZ81Jnzi5IfymirmYCAV8+5exEhVDfpAODWcxcXYqmhshUcvN596a2PThb0xZyxWFy3DGjOCeCtIfGHEYEgxjZQzuBB+vanJ3KydZXnZ31uNE8ttgwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcQe7o4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcQe7o4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5F81F000FF;
	Wed, 23 Sep 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181293;
	bh=mTTFKJLThslPpgGE7iC07a5WG4GQvmr7lQzblT/Mg0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QcQe7o4KLNtz1sHi1oWVX79bCW48fRolAQNDOiWgUVMFP96hS6bxTl9/Yc0UvoOtV
	 zs0A7nYeCSaug0BZ2WRw2KK4BkZqrdVN0uEkid2SoHQyuR6+XbqqZm7B1bOSfBwAF0
	 ZIwkM/vLx4qGd8LRqYuAYOjWbrkIMD3SjSxhVSXik8toATWlhPZgnnY+ZnUm7ETuj1
	 xujkm6rmatRUH6PcGKG7UfODTBC+guomuwXWVgnSC9LnmAbZWP5iIzyOooOwea8AfK
	 oeszJUbzDTZgOM4oGZGqvLzvoN5EzB1YO+uDi7Ek3vvsBh1QoBBf3cC9d1FpAfdPA2
	 5JwQb5KQ4OaCw==
Date: Wed, 23 Sep 2026 17:34:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: media: snps,dw-hdmi-rx: add the source
 port
Message-ID: <20260923-task-corncob-09e46d99fb94@spud>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
 <20260923-hdmirx-media-v1-3-ea3d77d4a5f3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/H04gVFbu6GNgBqZ"
Content-Disposition: inline
In-Reply-To: <20260923-hdmirx-media-v1-3-ea3d77d4a5f3@pengutronix.de>

--/H04gVFbu6GNgBqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 03:44:42PM +0200, Sascha Hauer wrote:
> Describe the OF graph port connecting the receiver to an HDMI bridge in
> front of it. Boards that wire the HDMI connector straight to the receiver
> leave it out, so it is not required.
>=20
> The schema sets additionalProperties: false, so without this a device
> tree carrying the endpoint does not validate at all.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87d0e06a..7e66dcbdfe2cb 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -66,6 +66,14 @@ properties:
>      description: GPIO specifier for HPD.
>      maxItems: 1
> =20
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Connection to the HDMI source. Present when an HDMI bridge sits in
> +      front of this receiver instead of the connector being wired straig=
ht
> +      to it.

> The bridge is bound as a v4l2 subdevice and appears in the
> +      media graph.

This sounds like OS-specific info that shouldn't be here.

pw-bot: changes-requested

Thanks,
Conor.

> +
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>=20
> --=20
> 2.47.3
>=20

--/H04gVFbu6GNgBqZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarP/qQAKCRB4tDGHoIJi
0lgFAQDWu8jSGakyX/c8NyvvRIeYwJyf8B4XZbl38WT+zYTX9wEA3zlFmFXHDPVk
i/V0Z+hjqpSzoQ6VsPUzDnS6ACyOZgA=
=BPXJ
-----END PGP SIGNATURE-----

--/H04gVFbu6GNgBqZ--
