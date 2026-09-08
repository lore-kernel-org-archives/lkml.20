Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4465964E7;
	Tue,  8 Sep 2026 17:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889069; cv=none; b=XBr45LdbQEaD88606MS7dSBAiguzmbpvBywLTGmubZlowI4bJedzgu4tuZXon1M04Dzn4WGdrAWdvx2YwE8G3yKYuLJyQowOZkO9U7MjXBqZIADoDgJH0G4FDF/LMuJWzK/iqdpDsqDOtRgYIWPTyL10xj4oLCCB9sFjc66n2Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889069; c=relaxed/simple;
	bh=wIOAPqVzYTAB19sjCND35kJxT12XhO5Wl1kJAWYIQlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkJwAoTBBoJsXs5QoauDy/PvWwICE1fUF5lu4at3rNXtOnb7pZtCZfG1tQyU9iUBxnIU3vYmPpBz3o7KcajZMBu6MY9RfBFO83/yPSKXAZqt3suVOjoenunIg96wVlxy6268ETOm3Loba7ynU3UXcmTMasol6LJF7VsRXzO95FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRD10JGn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRD10JGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46851F00A3A;
	Tue,  8 Sep 2026 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889067;
	bh=icpxK//WCE5REoDo4eSAHi5paKbhSCvkaDSLumz2E28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRD10JGnhTpojWOS0quYWUeD0EL7k/9chLcVlD0wWLYtP+biIYHUIywCEXlznRVWB
	 j8xKBUVJFtApycXTjJiHJGDNe/LZJ+BXsgCiXW5+nSWGCGDnRcpK6tcMdzJe/3D0Ke
	 QpKtmq0F/x0YZZwsKPayK/RpI2U+nqe6HoIV5OkcfcE+Hzofpdys3V48AI0zxg01S0
	 Up0RLZiec3+dhKB5wyQa+0pZ+0ms5ZL85TlzN+eS+/2pnMCmRCKKFIyu2Wch23TiGZ
	 CRBsfDaxCVTxcZTqXtqdUP4RqHvddlTo3Kc8bS3xs/wNaaShiOI5DxXtWyrVTsyfEg
	 EVAqXDadIhp/w==
Date: Tue, 8 Sep 2026 18:37:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
Message-ID: <20260908-move-evade-fa5de7889915@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-1-7931e5bc86ad@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zmpp28S+PYY1M7Wn"
Content-Disposition: inline
In-Reply-To: <20260909-k3-aclint-v2-1-7931e5bc86ad@pigmoral.tech>

--Zmpp28S+PYY1M7Wn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 12:28:44AM +0800, Junhui Liu wrote:
> Add support for the SpacemiT K3 ACLINT MTIMER, which provides per-hart
> timer interrupts in Machine mode.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f6..082378b04d72 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - const: spacemit,k3-aclint-mtimer
>        - items:
>            - enum:
>                - sophgo,sg2042-aclint-mtimer
>=20
> --=20
> 2.55.0
>=20

--Zmpp28S+PYY1M7Wn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBH5QAKCRB4tDGHoIJi
0tZbAQD26trjzukl2y6yAmDOb1HtUtHXg//sDPBKcMKEqSHSCwD9EwTHnp+/AsA2
yZ6IklvmqlQMK3S7+CevJNjJneJ0dgU=
=orYS
-----END PGP SIGNATURE-----

--Zmpp28S+PYY1M7Wn--
