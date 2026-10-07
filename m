Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C113612F8;
	Wed,  7 Oct 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382069; cv=none; b=qse90J1Ogk1aU8RcI8zW8Lo9ZBO8L9kaZ6hRH0Xmqdu+jOE5q9KMxYpGIJtTcGFp7cuHVNy/4nLwt0RhdVInQypkqkGPigX/uBD2McriCUIy/jOgf8BQ7JUYB34NTMfAdyFUIIYJ9l6pnX7gyvUvqDOlUHAT6J8RG2E7VUHF6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382069; c=relaxed/simple;
	bh=byJra/mhbvjn6vvLTSCsiex/wDMjB4Lgt46mHR3xXoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idAjYIcSWf4Ik/fXp5qM2LOVLEBm7s1IK2MNV+IhP++d1b8+q1laq3rUU536Wd/BwOalXK/bSc4vPWYVfsaYpm6oikq785uurnLAHZEVuy3Sp23rb/lAs9/EOMS3gn6QSPIQWBDUG5JrY7HPXlsgOHZu2y3Vtm98m8JI8vt98b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blYtoeyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blYtoeyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB9A1F0089C;
	Wed,  7 Oct 2026 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382059;
	bh=subN9fXal1rbbDmCoh2wFon5oJy0bFXUYgWzXB4tIwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blYtoeyNV3/0KC1wurnpUt2DCoYu3fxIn9aMCH+z9nKODfOpQRjOix7iZaOGfvYIq
	 TJOJZQJ/H06Irbjva+P5UEz0e66sLmHqJAQuuuPd6/hhflaDk9UCDtYXxsBuumpUoU
	 h/S54ogAvU1G3LwFn1y3/KHFY14s82dvB4kOX9vxE7t+eyeQUcOOHlRZ9JQgjcmmks
	 eFbvWkYXfg6xvRuiwLDpjKd99YoIR8orx6cki3sD5prRXHyguYOpWUuGQlyWGQL4Ro
	 X7qYtgq/zmtzg4ibEwJT54EgoyaqbFfHTz7Z4jtdwJwOf++V8eWm8/O7WfN3IRKAan
	 lUnNCUNHbBenw==
Date: Wed, 7 Oct 2026 15:07:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Message-ID: <20261007-f8618331a33d736d9343c7cb@squawk>
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_7F0804BD55E49660DCDB095C80B5330DC50A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BJUr87kyRYlZiMEn"
Content-Disposition: inline
In-Reply-To: <tencent_7F0804BD55E49660DCDB095C80B5330DC50A@qq.com>

--BJUr87kyRYlZiMEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 01:33:07AM +0800, Pufan Jin wrote:
> Document the ALINX EdgeBoard FZ3A compatible.
>=20
> Signed-off-by: Pufan Jin <2254650260@qq.com>

Modulo the prefix being acceptable,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/D=
ocumentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> index c9f99e0df..ad7c71f9b 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> @@ -46,6 +46,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - alinx,edgeboard-fz3a
>                - xlnx,zynqmp-zc1751
>            - const: xlnx,zynqmp
> =20
> --=20
> 2.55.0
>=20

--BJUr87kyRYlZiMEn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZSJgAKCRB4tDGHoIJi
0iRYAQCwrSeFH3fkrrAHzKa+WPeGX9Iu7b19J5us6aluCRhOrwD/fMeQwAnSnjOW
7RxEefWTd+r0Ra6ku1RJUFIMFNAmbQo=
=9TV2
-----END PGP SIGNATURE-----

--BJUr87kyRYlZiMEn--
