Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588843;
	b=msq6CpPte8y7DEnNwyS+gGf5TnycqkBTtuE5sGXFawO1wKaioMYnMa9acRJPZb4Ch9Dq
	 mXfFC5sF9ThjwkIYZAx33kWyiy4TsR3kYIq8urr2VN8i27w5qxfaSJeVVEyuCtnMExyXJ
	 ldR7O634P8/OHDjahRwhUsLkb2oZcdER20vB6F82hpsPkdI+0VpxJt4y9zARby5xT68w0
	 fT7CkdmxXCWhXgbPlc2VxZI3YJ+VQ0PW8fSM4w9XR69Nq4bLTO1VnWY3zXbnIpKvAXjor
	 PwVfeImQW+G8BuRrhs/kzYktCJ3j/goHegty9N6kiUHWtWOiB5YQTX32qrOqH71+Mww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588843;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BBxU1eOV9BEr66yuB0ebbyYvleBXLvIO6pcvkVDyONw=;
	b=nsN0cKZhQzle5bBN+MSEx7a6+wGsxi+UiZJpkOhcqtx3+4NO47o25eTMcRzY+53I/A4Y
	 gs8Pl/+nSftsi0CUejL8j1Dewb954vR0MYoDHWRld6CdP4bl9GFKNruzZYBXYX6h6Av+p
	 nEfetDkXFfWGASbGB4V/KCdnJOLBG4ywnhkxvUPjpMrS/wTY/kAQ5csXV4pQr1xGzqwSv
	 Od9BoYzkRAEYBlXS/qR1vCaot2SKuwm6vnuN8I7xk0UQXh8uiLKyNZk2leXzy8y0Nhgvp
	 Ilsc7OiAbjvaUkh9QIa1iuPdx3e9j4F057g89SZATo9Ckn5tO94IypnstqQ9mgDaPCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUTFsNZc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA56606D633;
	Fri, 13 Nov 2026 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUTFsNZc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265871F000C4;
	Fri, 13 Nov 2026 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588842;
	bh=BBxU1eOV9BEr66yuB0ebbyYvleBXLvIO6pcvkVDyONw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KUTFsNZc22b8aHlWP+r3Odk/Gs/CKeg0AFX98nXe1f+J7TwRgUtiUkeXra02DE10H
	 F6bY3+LjPAZ2ih3c4kmDNoSHReU80HXuq5JNHKDOhAEMXSoydZvFNGufhtvwJr3GpD
	 bmyRyT9sP4KyeA2J3Il5+p4yjbXTpUPY/BNxonlZXN/n0Ezh8dzk4g8zXM5x+5FVeG
	 8Jp6BuNY3LfJ0oYqIX7DcQBcGi0WLuXNrpWwwyiw0coBYWklNW5iGaOJhhSIMeE0bW
	 F7jiWikpiQpNF7JTDBNOsjnTJHNV6Th5crMRA+xbbNHTKuALbh0EoIQ86VSru4es2n
	 D910q/N6WG68Q==
Date: Fri, 13 Nov 2026 16:53:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 BS01DCMA
 RV2768
Message-ID: <20261113-hull-unsafe-5d0e83589cc2@spud>
References: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
 <20261113-k3-bs01dcma-v2-1-3f0de4a3e1ca@linux.spacemit.com>
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
	protocol="application/pgp-signature"; boundary="/jbMhdWX25YFWmZZ"
Content-Disposition: inline
In-Reply-To: <20261113-k3-bs01dcma-v2-1-3f0de4a3e1ca@linux.spacemit.com>

--/jbMhdWX25YFWmZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/jbMhdWX25YFWmZZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdApgAKCRB4tDGHoIJi
0grhAQDrVeCC4bdhfiu51OMI62/BUDXDdIG2ekR6JH/BWepPHQD/X0IyOl/DQrDM
PxeUOcyB3JK5V/9DTbqaCnx/ZMQaFwI=
=4piD
-----END PGP SIGNATURE-----

--/jbMhdWX25YFWmZZ--
