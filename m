Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501516;
	b=fPVubyebhAhqB5BSQPkhV5bPD2mjrzVAwbKZig9LvXBzGurmTq0vtIwOZyGEyQEnr610
	 WsgTLnMThXSrvkcP0cj4bOJqZOv3xXi6+GAIxrkBR0QdHpG0pJ3zTp7Z8avuGpTey/rq4
	 kyXjzG7a2OgRB1xGrImWK0uj01NmvwVBuZR1pPTBv2bnA6c7LXnwBhWnGT/cm6TsON2Ex
	 HuR49ne/yLNZuZqqpfluKLJnR9YdYD0WK3qYfkn1RhzWsGNf9eN4XLSdHpUk7fwTKgYPA
	 saNgD5WWGe2h6I1qctPNLFk7Sg0kUW5HNUCamczXD2O9q+1vB5RdAdJ/JcWwKdJEZOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501516;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=;
	b=DI/IpWLvZ0JKYXBZWwhx80B9s47LNczjZLDfi6MLwiPoqB0bo3NF24+JFbcfAstNr7NB
	 Pd862KlNzirh/z7bMqz4ollpgixHkVyg+besARgFJkTE+QNPV6nCkgl3DcyprHXU7PVnu
	 Ef9X40rb69JiOivyUjPlbNrPJLhAPvPKPumCOrBpmcC72JhqABHHx+8KooaSuJagcMH2S
	 gDMiumpc6yIlsRqlaVPDIa2n/0a4FkI8DUVLziwQLr4ZPmUtfpEmitlvdoX1XvcLY5o5q
	 cehUchuB6CqWRBYFU78i2yYuAEQs/Q2+znQj2Tdc4F84LjN+MhHoATw3aKMwkqd91ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kw8Rxbyb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676860A382A;
	Thu, 12 Nov 2026 16:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A676860A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kw8Rxbyb
ARC-Seal: i=1; a=rsa-sha256; t=1794501488; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aSu/hFLbuCH20PxHrtQGMjLUcLKDgWItFuL1RiCjtSRoel8xKiFBwg+BOoAddlsDEG5Rc0wlOCMihwvzoqtbuMsd46s5FHRwXKc38/saXVQn/tEsWkvaVPTevkVxhHicHh1fe1vmIwzWNUEXBeSsaOFg0+mCqg0HlOJQgeMtfgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794501488; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=; 
	b=GIlOxFCKPlQayYMyEGzFg+GRISBCqbD54tDLuAz33adJXwXOVMbvamPgm8svNJZlJkE6W4JFbeAY5y8hU4bycqoqOsmF3bCc8omd7mpq3pGI6sy0HQAc6WwUsvIVhlG1l9ar1t+zw9ljsqNJcivTdcWWdDbWAxaZAzI92d7XhfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=kw8RxbybnuvWjvJvdKn+53IYxRjna1/UrcEoJ7O2oEPIMTfrjj54FEdK7lHqGaMh6HsVPS0pTiDW5wllRlKhQZelxh6A4A2u/LJt8eL5tSmr4IlG6vJh5Ch3y/E1lI/rfZFXGx9Uj3zWRbBzNaOTn+JUWhiL/0pGXboLMqEORAY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794501486774956.4551935908814;
	Thu, 12 Nov 2026 08:38:06 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id CBC96180570; Thu, 12 Nov 2026 17:38:01 +0100 (CET)
Date: Thu, 12 Nov 2026 17:38:01 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
Message-ID: <avXqeBBO_osbgdgU@venus>
References: <20261112-smmu-v3-pcie-pd-v2-0-3a77bbb6b2c4@gmail.com>
 <20261112-smmu-v3-pcie-pd-v2-1-3a77bbb6b2c4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axwnauw6ygxsatcc"
Content-Disposition: inline
In-Reply-To: <20261112-smmu-v3-pcie-pd-v2-1-3a77bbb6b2c4@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.497.36
X-ZohoMailClient: External


--axwnauw6ygxsatcc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 08:20:22AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Some SoCs feed the SMMUv3 from a clock that the OS controls. On the
> Rockchip RK3588 the MMU-600 for PCIe runs from ACLK_MMU_PCIE, whose only
> other consumers are the PCIe controllers. When no PCIe controller is
> enabled, the clock framework gates it as unused, and the SMMU can no
> longer be accessed. The same SMMU also has a reset line in the CRU,
> SRST_A_MMU_PCIE.
>=20
> Allow a single clock and a single reset, so that both can be described.
> The architecture defines no clock or reset inputs; the MMU-600 TRM lists
> one clock and one reset signal, and the one integration that needs this
> has one of each. An implementation with more clocks or resets can add
> them with names and a specific compatible.

You can trim that down quite a bit. Don't take over AI text 1:1.

>=20
> Link: https://support.arm.com/documentation/100310/0202/Signal-descriptio=
ns/Clock-and-reset-signals
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 3c044e4f03d4..29b81b4fb650 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,17 @@ properties:
> =20
>    msi-parent: true
> =20
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Clock of the SMMU's register and memory interfaces, on SoCs where =
the
> +      OS has to keep it running.
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      Reset of the SMMU, on SoCs where it is controlled by the OS.

The ', on SoCs where it is controlled by the OS.' is completley
useless for both. You need to review your AI output and not take
it over without doing any thinking yourself.

Greetings,

-- Sebastian

>    nvidia,cmdqv:
>      description: |
>        A phandle to its pairing CMDQV extension for an implementation on =
NVIDIA
>=20

--axwnauw6ygxsatcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr162kACgkQ2O7X88g7
+pp8TA/6AvacCvvFrtEJ9uEds7WG2pqKKql3tDgbixgwWbdt4jb9Uno84nloIhoH
j3vlNNjCs1I7sfA9KxDhGSbqZM1Q3EPis3hoktky7vefI8Gk/g6hzxilqwOmKrKK
GJRIRdKDCb5osCgwrqpENYPD8XweBOFu6DKigsdQG/Y+14WfJM2q9DF5mqhwleZL
KTU2j7l0uIeDzrXVhCCQR10zMOJBo1iRL6JZmkvGEv2ph4CsdB3NjV0eG01CVK86
TRnfdKSvT3+L6IPOu7XlCoHQ4BP7wtWOB4Dpb13SxjNXGBSWu0QV6XbZp5lulmdU
d2mNUCrU7P42tdgIVSwGVBwYYyymCvqEnukqAEucWjrvGFD8eSZM2wSANBlbnijS
A5qcPBVfoTjTIUVZg2/bK7yf6mU1oY6kLSZ3w5vIlJ2pNFemTYAv1ZWfs2QPOGqw
6Cro+Q2DTCuU8eSqOVEmzP4BibPeDdNz3M91VvdzW5AD1WXHz4ZWrpueYE4ZtvZi
BOKFfh5QakYt1YXvQU1iw1Nzg8CMyoaLPiZS4vaZg9eK5Z972fm1QAwoMs9jsbNH
hkL/pRIO+517K3U8QHdFJtJevY0ta1vna0itB7GH8IsR0ntE6E6vpRaUA74VsRr4
hD977z7kgv3TjVM1pGp0P4VybhXtvwcU7M4hJXMTRuEsOzwbx6A=
=Wdr0
-----END PGP SIGNATURE-----

--axwnauw6ygxsatcc--
