Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89122EAD15;
	Tue,  8 Sep 2026 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889817; cv=none; b=aNWOZyaDpvqUv1fIpWGKHdHNu3082uhgatDK0Sw9y4iKYQOM5PkjGnpqnOa/jk/EtRz47+DKEc776KYad36coqMHhW8mnF15ZV37wF4sxGtZiRq+CCbwaI9G5yCFE5zIeYiFMCCqREAPTInUMDyoZ7RqxzlkJYdOiIdA/vdfM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889817; c=relaxed/simple;
	bh=NV9RvyR0QyZB/j8pNOoCUKYeZY3RF7yFVC4bCoAEf9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1S+7XEEY4XPo18osdwsfL3v+owoZXN629DeS2WOyjrtUmgSgYMo26cmNn8YHfQFfTd8rgmY90BG8OMDuGa20ymmYS1E8uytpHGuRRoeflT1gMGXHSUZejBVRqN77LZ/wivEeDsrDV+3+Ihn3BOnUAo35JcIQQZVFy4WBEE5M1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mS7Iv8JB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mS7Iv8JB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144F31F00A3A;
	Tue,  8 Sep 2026 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889815;
	bh=//uuhykbHITGZZ7vXNYzwKmowhpT9TF5NuDZncqVLqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mS7Iv8JBf5eOu0WPKJCvDjM76ISD9Rg/d0fjtyT8KmvvKCsFRuhsS2Z4NM30UzL02
	 nIYHVWBCas9cT91zewU1aJL56kkbDd6WlV476TcKb5uLvXhFi9lPuxjE1ldATt1XOV
	 AOO1wKGNEFbTJM5cXtsispzFsQ1SrSL7Awqhj4TJsP1WgylrIsDcWeUmOeXzy0F9/o
	 LFUhr+jSlQbzqgKxvgM2ADEJza7/lHBwVwpSvnG5oopyTS0S0TfXP7LzZiWoMK9+g0
	 PCUM0dqpAN4IOcVs5BxZY6oRQWQO3UFCHrZMuRgMh0oRz1NijwcgDTY55iBzvK/if+
	 jder6keVg9ovg==
Date: Tue, 8 Sep 2026 18:50:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v2 2/9] dt-bindings: usb: ci-hdrc-usb2: require clocks
 and resets for spacemit,k1-usb2
Message-ID: <20260908-tapering-panic-e76cb4114d92@spud>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cx6n4VJrT74vmFyW"
Content-Disposition: inline
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>

--cx6n4VJrT74vmFyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 05:48:39PM +0800, Junzhong Pan wrote:
> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
> work, add constraints for it.
>=20
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Squash this into patch 1.

> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 14 +++++++++++=
+++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 6f8d88a0681d..5c2b7eb1a6ff 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -114,6 +114,20 @@ allOf:
>            maxItems: 2
>          clock-names:
>            maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-usb2
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        resets:
> +          minItems: 1
> +      required:
> +        - clocks
> +        - resets
> =20
>  unevaluatedProperties: false
> =20
>=20
> --=20
> 2.34.1
>=20

--cx6n4VJrT74vmFyW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBK0gAKCRB4tDGHoIJi
0jgEAPoD/utP2/Sy4njxEBqRq7ll+X3uQeDuZxxMuHskHm1s0AD/ai7Bo6A4fBgd
EDgNhPtdvP05rnHU3zmJnLTWJW1DiAw=
=StnG
-----END PGP SIGNATURE-----

--cx6n4VJrT74vmFyW--
