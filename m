Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE965908B9;
	Tue,  8 Sep 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890076; cv=none; b=URQdPMYdTNvp9Dmcvf49Wywt7SeOQf5a5NBVocGqRx3bU0z3z1h65jWomfPyfUg5ZJshdaAQiwyzixakEj4SnHNaZmzk5RdHGU8OHHumgjw/MqDn6ccYSVCEc94M/fkb4+bo3B9QH6nOZxYPl4SXitm93FU/wu27q0YxDc2p4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890076; c=relaxed/simple;
	bh=tRYOan3ALhxvuY5Y/G8ZJz7EfrvVLsXwqCX95KWaI2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOmxI3qK2yCMzjLUKvrZ+TW2TzgI4iFU6Ktaf6z+yXWouK108A9pn0DQ+o+8MsMnfPpas84iR3lFeBCT5DjgtOANcCYbOkYx101OIa0aje9cO+SNMThTjXDyNOVTckpGBigPBLfh0Z5qHgU6arSJozx3fmIyvZ8qqngtWSiotZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsDNps5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsDNps5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3051F00A3A;
	Tue,  8 Sep 2026 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890075;
	bh=BK7Pb5f6hOmg5Ney1uPXvfbfTZG8f/SafOJm4kyr358=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bsDNps5VY3DQIHbZFNO1vmNjWd5u+T4PsyGzbpZHfNIN76rznC6bSg4e9Xtzi9S1/
	 PoasXXiY0ALETNAUzB5n2FWz5M46wu7mdSbN0OBPjnHevZ94LZ0gn5GyVSwVoobRA2
	 Uxb0CVyNTGyjxUBP74oGHAEmDMedfZ2BJcIdWkpGkF1E8POs2lCaRwPfENvsZ4SH5f
	 yga/cQ7rNQ+gvlIqSWzgNBVBn72n1zF3wofbk7jz0PSfrfb9e6Kypamqe2aMMSP01F
	 U2AI651mT9ZN52EOl9wCi9MObsolFzb36xoAk90T2Q+Tvz/tefnVeLfGoopIIOwKX1
	 Gp4iPd7l3AbkA==
Date: Tue, 8 Sep 2026 18:54:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260908-groin-undivided-0af701135404@spud>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FMRvDAZvBKX3yjGb"
Content-Disposition: inline
In-Reply-To: <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>

--FMRvDAZvBKX3yjGb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>=20
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>=20
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
> Changes in V3:
> - Move in-band-interrupt-capable and hot-join-capable into the common
>   i3c.yaml schema and drop the xlnx, prefix.
> - Keep dependencies in the AMD binding.
> - Update the commit description accordingly.
> - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
>   binding [1].
>   That Acked-by is not carried here: the names lost the vendor prefix
>   and the definitions moved to i3c.yaml after Frank Li's comment.
>   [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@s=
pud/

I disagree with Frank. These properties make sense for Xilinx because it
is an FPGA IP and synthesis options impact this. For other devices, this
should be determined from the compatible.
Please revert to how things were done in v2, especially as no rationale
was provided for why these should be common.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Changes in V2:
> - Rename the properties to "xlnx,in-band-interrupt-capable" and
>   "xlnx,hot-join-capable", and expand their descriptions.
> - Express the interrupt requirement with dependencies: instead of an
>   allOf/if-then clause.
> ---
>  Documentation/devicetree/bindings/i3c/i3c.yaml    | 15 +++++++++++++++
>  .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml |  6 ++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentati=
on/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd7857..7430394cc6b9b 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -61,6 +61,21 @@ properties:
>        Indicates that the system is accessible via this bus as an endpoin=
t for
>        MCTP over I3C transport.
> =20
> +  in-band-interrupt-capable:
> +    type: boolean
> +    description:
> +      The controller supports In-Band Interrupts. A target can request
> +      attention on SDA/SCL by driving its dynamic address during bus
> +      arbitration, instead of using a dedicated side-band interrupt line.
> +
> +  hot-join-capable:
> +    type: boolean
> +    description:
> +      The controller supports Hot-Join. A target attached or powered up
> +      after the bus is already running can announce itself using the
> +      reserved Hot-Join address so the controller can assign it a dynamic
> +      address.
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml =
b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a86568..9480de3fe8e1d 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -37,6 +37,10 @@ required:
>    - reg
>    - clocks
> =20
> +dependentRequired:
> +  hot-join-capable: [ in-band-interrupt-capable ]
> +  in-band-interrupt-capable: [ interrupts ]
> +
>  allOf:
>    - $ref: i3c.yaml#
> =20
> @@ -54,5 +58,7 @@ examples:
>          interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells =3D <3>;
>          #size-cells =3D <0>;
> +        hot-join-capable;
> +        in-band-interrupt-capable;
>      };
>  ...
> --=20
> 2.34.1
>=20

--FMRvDAZvBKX3yjGb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBL1gAKCRB4tDGHoIJi
0poQAQCLSpPeDIwNP31iFKBcmvHVCtAkP08+yE77wc12Mqs+NAD+LOWBpd18oZEy
yIp+uwmXkEOHSuVPSMYmoXPe9CkgvQA=
=zB1x
-----END PGP SIGNATURE-----

--FMRvDAZvBKX3yjGb--
