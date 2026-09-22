Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742323A71AD;
	Tue, 22 Sep 2026 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100367; cv=none; b=dIBL3rCj7bHGwGLnbnvPxZgkXsQJFBx2B1Dl0gYvUxv+IMKFNM0ehTAEE9DP0mBVYKBOnLuiPxKBPppR4fAB2Y4cmXKTEHHSQdKnx0LdBnTdSR/EFx9RP85W9FEeG1uPSQcXSSJHjG7bW38fCXtT/3ttN94zGZJIMHVxTS63Rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100367; c=relaxed/simple;
	bh=KBDUhWIJKtnn4V82nVX7hrDrkXx2VXjwJLjN3Z00DEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onI/z7bqEmzmodw19IN0wJ8bOivunT+l+ZdczY841AN+yPR9RV1rbxKm6ETEp3MODbmrpHHXW1INxklmAvDzx2z8s8LYs5OtNd2xDSp6LNJqGu04NsoRyAuP71ItJVmjNETvFL4OMl2IhIVuQaV60KhCXdzTG4aZY0eNpLG+1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npJDBT4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npJDBT4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5E71F000FF;
	Tue, 22 Sep 2026 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100365;
	bh=OTAnb6Oq272HngWK1zOxdvaL3eZ6qI/PfUaNGme30Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=npJDBT4wWkW2y8a1n1T/o3bcwHAdPw8oZ3marPpQHY9BkRPrdN/Y1Rf6zZVjKkn7T
	 otgcVGuutqCTfZtChmaxyuTlNMRoLDbgYCG4xR/Ced4PtVjHVUiCO1WFgHdfjvxtNs
	 CSbpAamDUES09D8m9Vk1T0a6kVhnuZiJE0wC5I4rQq1IjM9WZsEX8G2IVpqKy7QgEw
	 K/cOmg/HLObeNiC4k0ini/42I0D+PZrexs0AXSpH2a9HtIqOL7lKD6NRZdQdSDTTb3
	 wWrM4uHe/MPPkvY8sVwD5DyUtT133teqRInbjSSvIxs36XA8z2X5F7A9l1a+KImSbt
	 foLsCnS6JCslQ==
Date: Tue, 22 Sep 2026 19:06:02 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260922-cheer-reference-c31fc6fb946d@spud>
References: <20260921232540.3128596-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xoDyum+tpwGqygp3"
Content-Disposition: inline
In-Reply-To: <20260921232540.3128596-1-robh@kernel.org>

--xoDyum+tpwGqygp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
> Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
> node only contains the compatible string and one register window on the
> local bus.
>=20
> Assisted-by: LLM

Guidance to the LLM should probably include including the reason that
this is being added to the commit message.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisil=
icon,hip05-cpld.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hi=
p05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,h=
ip05-cpld.yaml
> new file mode 100644
> index 000000000000..f9d48b871a4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpl=
d.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon HIP05 CPLD registers
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hip05-cpld
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    local-bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +
> +        cpld@100000000 {
> +            compatible =3D "hisilicon,hip05-cpld";
> +            reg =3D <1 0x0 0x100>;

Also what's with this example? 1 0x0 0x100 should be 0x1 0x0 0x100?

> +        };
> +    };
> --=20
> 2.53.0
>=20

--xoDyum+tpwGqygp3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarLDigAKCRB4tDGHoIJi
0p2IAP9yPdaLLZo9WKjprTpW7sb6ElXBhBJPZ5GD7K6+q1E94QD+LYi5JSelMhBi
L0I/pBM9fXFBHCeHUv4kgJhw1QYUNAQ=
=Virt
-----END PGP SIGNATURE-----

--xoDyum+tpwGqygp3--
