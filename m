Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334350;
	b=1vdsUAdAqH2xz0bUV/uxwqXQGc0Go5JjiQ3mdmAd/LE/v003DSatywTDZMT8ZzneOGL6
	 eWdMczizlKiMn2mN2ifrascTyjv5F7mhVAntaMqdhXlthIc+Qcl6QSGwlL6Uv7C3QVYD6
	 DUBz8n1SEKulYfA+7RWRzafrA3NH5J3wWiLMoiZqfIQ7q3Nr7nex2zD9R7suEeKlR/fhB
	 37eecnfpa4BIPPP0J97y+YAJq0mHraMuaEOgBzhf+uF1CND5mAVKBMDQTP9ggYCTMYmAu
	 g+op00KT6NpYCtkEMeaoCrL20hAM9pOk9VwRRk5hEOBQ2Sb3U0fI/7tEDvTgbKRXmfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334350;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4t5jJ2a6wGaTNdEQ0yY6CxbRv9iR+ZbkEFBvnff4R4w=;
	b=UMp4TyoNXwXLXfcnwkcPvvEaV9z1Myyz/AYnjhCbDJ9CYRYgFYGCYisYgorvAG2S9gpy
	 t+hJgDp95ciuXfvl910ru3sKze8cANpV14zRliD91yrtqLCdyj9GrtdLBEY9J2t5yDRwU
	 +gIKb3l6pPFKhmXJQCw7HBPkI4tsU9itdoYraSmhd2IoovyCkp6fkjynlUpFCbCQh/zQe
	 5n4+/0ItETWlANeUHN687phfyx4eUp2cDSM2gbFMeBH3mBJzkn4hnkOI4D5uzHf0hR701
	 1Xh/aXyPYa3/jnFx9K2AAEYisANzsHghyPA1Bh6wETbRNTEdJAPMKaZGb/dG5pqecCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfxdPic9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B4606A32A;
	Tue, 10 Nov 2026 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfxdPic9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154581F0089F;
	Tue, 10 Nov 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794334349;
	bh=4t5jJ2a6wGaTNdEQ0yY6CxbRv9iR+ZbkEFBvnff4R4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfxdPic9p0dLd37DWoZXEk9nrtP2bo+Sr9tf1ZlHHP2D0Vlh+MgfDBmRFVN3oN2aI
	 1RTQPJI6fFjBhZx3oEqqkwJcAlc7QguNkzrRhMYpEiwWx4WXve20QBhyw4tOqrtz1y
	 4ghkLjfo4hmSECDcgjuRo67a0Sl8SXevmyI07moRwX5gjspdFOkRTXuWHWBMrrAPVI
	 Rt4+bPpVWNX3XDLYjEYyk07k8GUPjdistR60+tcLuBoaFG5sUgJkB7jUJ1DqU8QsOs
	 egOcBoJlLCVHx/PlC/0+RH1A9uXjIixtlPnENu6x0ACVWUBESaOmMjUY3S1mubOpmN
	 mpN/trXm+Iw8A==
Date: Tue, 10 Nov 2026 18:12:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>, Jia Wang <wangjia@ultrarisc.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/7] riscv: Add device tree support for UltraRISC
 DP1000
Message-ID: <20261110-amused-strobe-d6cf2bf24861@spud>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
 <179419183382.2791817.17305257804227954338.b4-reply@b4>
 <20261109-december-oil-cb6524baf274@spud>
 <179427984780.3452989.12543035151641565906.b4-reply@b4>
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
	protocol="application/pgp-signature"; boundary="5Abm0SE5GQSId6z6"
Content-Disposition: inline
In-Reply-To: <179427984780.3452989.12543035151641565906.b4-reply@b4>

--5Abm0SE5GQSId6z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:04:07AM +0800, Xincheng Ji wrote:
> Hi Conor,
>=20
> Jia has left UltraRISC, but the platform maintenance handover was
> unfortunately missed. I would like to take over maintenance of the
> UltraRISC platform and will send a MAINTAINERS patch adding myself.
> The existing repository URL will remain unchanged.
>=20
> For this series, yes, I was hoping you could pick it up while we
> complete the handover. Would that be possible?

I suppose I can. Send a new version with your name instead of Jia, and
add my git tree to the entry for now:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/

Cheers,
Conor.

--5Abm0SE5GQSId6z6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNehAAKCRB4tDGHoIJi
0n8cAQC1pXu850Nmr6dz3U9KsrFWkyjC1yOZ00xPIAUryB50WQD/f/hUphJ3d6Fv
ZIZxVHG1PO+rzMOz54EU5GKNqf+YvAU=
=gDr2
-----END PGP SIGNATURE-----

--5Abm0SE5GQSId6z6--
