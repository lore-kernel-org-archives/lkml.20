Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250268;
	b=GXW0uh33QAQ2JKVjUwRzG94xEpjSPkU1JM46yyYiQUd586IrgVw4H5XLDsN8Wk63Nue7
	 9ZEiTlk+SqBbeRguJ5xFqESBsc/dxqdxRkXpULFB8ZbgWkHvZSN0uG3Qdfa37KwNdZ5An
	 RXlfrm0vAipLzPKvjzmybcP3RnaKy0sQeisFAgld4fnbECcsetTmLhYXyV97LcQs6EuCL
	 YpvvyzGLYvcpIFJ6T9xMEqdRczpJ2/4bcnvl3NjB6oMflIWjzm7/ydgpt90dfwi/r855s
	 Qmo/FuUaYkCePFDwD8affBvYUQar6onUbqvZOmSbCR8MBJNSSXNm38el7Wt0ZaMKonQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250268;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kn4X6Xnaj6tVLjASU1DBTDnXZ8Bkp/tVdzWviNAkNa4=;
	b=U6hCPWeJm47zb9FGLXQL3cSrVSBaxYUYGyoYK6v1zcxryqcqa9WtGJzsj3tpJSkKLb8r
	 ZrmQ6re/uhKjtmb8DvLz7Es0SPM7z20L5SpcT5Jou/g0fsTll9C88uQidQKwg5N5fwSc6
	 UNJj3rSRpXK0JCnZN9GD1v0UmQbo7VqYqJ/KWD70tnN7t9HEguP67qUh2EI3NNM30e1QE
	 yP5ZJ2EZR0OjiEGaQrTTS4tH16GzSlsDormxljTtLq+dj4Zmbdk6xuZhbB6o0ZG06ehFO
	 P3E4Q1DPTXrfUKUus4mCXSUU63Kw0QYBMWXXfASy4eQWye309IAHmSmO5pl54n21eJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcUKnm+k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94543606A330;
	Mon,  9 Nov 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcUKnm+k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD91A1F008A1;
	Mon,  9 Nov 2026 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250268;
	bh=kn4X6Xnaj6tVLjASU1DBTDnXZ8Bkp/tVdzWviNAkNa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcUKnm+kCVXRMKIzVHGJ+agqfupO9+DgWO1IyMF/ng51qBDFy27vtO53laLR/yTEk
	 hUHkKCc0oKY4v68iMnnv8Y+bgexnsZXfZDz4LIOHihHdczdb7ZzB5HQtibflYYM9B5
	 hx3YiZhnRQNmD2c49gPZjxQ9xjoV6kwHcU2CUK1sgXAjitL7+xGcevltbgse249c+W
	 U9s5brUDcedjOVd7JxwiXtgiGq7hUJvWkpIhIlgiVsp5JFU2uNMAM7UtUPohcoQDhI
	 UIXmYDSVNJTRc1W6OT4ovLz/coCtBwQIfTyDkW+vPr51WP726nK5NPZwUl04GuXIGk
	 h3U8FwoTu3Mwg==
Date: Mon, 9 Nov 2026 18:51:02 +0000
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
Message-ID: <20261109-december-oil-cb6524baf274@spud>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
 <179419183382.2791817.17305257804227954338.b4-reply@b4>
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
	protocol="application/pgp-signature"; boundary="bcTszYGBuLy82DqL"
Content-Disposition: inline
In-Reply-To: <179419183382.2791817.17305257804227954338.b4-reply@b4>

--bcTszYGBuLy82DqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 10:37:13AM +0800, Xincheng Ji wrote:
> On 2026-10-25 20:24 +0800, Xincheng Ji wrote:
> Hi all,
>=20
> A gentle ping on this series adding device tree support for the
> UltraRISC DP1000 SoC and the Shenzhen Rongda M0 and Milk-V Titan boards.
>=20
> Are there any remaining issues I should address before the series can
> be picked up?

RISC-V ULTRARISC SoC SUPPORT
M:	Jia Wang <wangjia@ultrarisc.com>
L:	linux-riscv@lists.infradead.org
S:	Supported
T:	git https://github.com/ultrarisc/linux.git
F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
F:	arch/riscv/boot/dts/ultrarisc/

Your colleague is the maintainer of this platform, you should be asking
them - unless you're expecting someone else to apply the series (me?).

Cheers,
Conor.

>=20
> Thanks,
> Xincheng
>=20
> --=20
> Xincheng Ji <jixincheng@ultrarisc.com>
>=20

--bcTszYGBuLy82DqL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavIWFgAKCRB4tDGHoIJi
0qb5AP9fwzC5MOM3iSNB/HrLlRRT1EbdbRPqW8FvOcPUT6xVCgD/SPYVNUA6AR/J
jew/up1fnP9U2rgmfmxzX5+TtfbJIQY=
=v1Wd
-----END PGP SIGNATURE-----

--bcTszYGBuLy82DqL--
